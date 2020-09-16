Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8368026BD64
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 08:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgIPGkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 02:40:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726136AbgIPGku (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 02:40:50 -0400
Received: from coco.lan (ip5f5ad5c9.dynamic.kabel-deutschland.de [95.90.213.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA69A20708;
        Wed, 16 Sep 2020 06:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600238448;
        bh=K5Kj9HgJm7gM+MKCU/+K5/S5g3OT6iP7z0/H3hNi3Do=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ks4Ey8cfFsbf5k8pWgHTca7IKjs+0r0g/7Dd3nMX7aN6UEEoHkKo09czyivdr+M21
         EhWyAshF4CqSE46ZQ+U3+BgmFpzHGcoT8Ht3B8zNHR52WD0LsOgVf/VCvlA+XMUDd6
         JqA1HcTz6ZYUOMHve7AyKilMjxzTvcb169l7Bi0M=
Date:   Wed, 16 Sep 2020 08:40:36 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     geert@linux-m68k.org, r.verdejo@samsung.com,
        linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] media: vidtv: fix build on 32bit architectures
Message-ID: <20200916084036.09e8f3c8@coco.lan>
In-Reply-To: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
References: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 15 Sep 2020 15:05:09 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> Fix the following error for builds on 32bit architectures:
> 
> ERROR: modpost: "__udivdi3"
> [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!
> 
> Which is due to 64bit divisions that did not go through the helpers
> in linux/math64.h
> 
> As vidtv_mux_check_mux_rate was not operational in its current form,
> drop the entire function  while it is not fixed properly.
> 
> For now, call vidtv_mux_pad_with_nulls with a constant number of packets
> to avoid warnings due to unused functions when building this driver.
> 
> Fixes: f90cf6079bf67988 ("media: vidtv: add a bridge driver")
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_mux.c  | 34 +------------------
>  .../media/test-drivers/vidtv/vidtv_s302m.c    |  4 +--
>  2 files changed, 3 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> index 5d1a275d504b..6e402a880fdc 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> @@ -336,38 +336,6 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
>  	return nbytes;
>  }
>  
> -static u32 vidtv_mux_check_mux_rate(struct vidtv_mux *m)
> -{
> -	/*
> -	 * attempt to maintain a constant mux rate, padding with null packets
> -	 * if needed
> -	 */
> -
> -	u32 nbytes = 0;  /* the number of bytes written by this function */
> -
> -	u64 nbytes_expected; /* the number of bytes we should have written */
> -	u64 nbytes_streamed; /* the number of bytes we actually wrote */
> -	u32 num_null_pkts; /* number of null packets to bridge the gap */
> -
> -	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
> -						  m->timing.past_jiffies);
> -
> -	elapsed_time_msecs = min(elapsed_time_msecs, (u64)VIDTV_MAX_SLEEP_USECS / 1000);
> -	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
> -	nbytes_expected *= elapsed_time_msecs;
> -
> -	nbytes_streamed = m->mux_buf_offset;
> -
> -	if (nbytes_streamed < nbytes_expected) {
> -		/* can't write half a packet: roundup to a 188 multiple */
> -		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
> -		num_null_pkts    = nbytes_expected / TS_PACKET_LEN;
> -		nbytes          += vidtv_mux_pad_with_nulls(m, num_null_pkts);
> -	}
> -
> -	return nbytes;
> -}
> -
>  static void vidtv_mux_clear(struct vidtv_mux *m)
>  {
>  	/* clear the packets currently in the mux */
> @@ -397,7 +365,7 @@ static void vidtv_mux_tick(struct work_struct *work)
>  			nbytes += vidtv_mux_push_si(m);
>  
>  		nbytes += vidtv_mux_poll_encoders(m);
> -		nbytes += vidtv_mux_check_mux_rate(m);
> +		nbytes += vidtv_mux_pad_with_nulls(m, 256);
>  
>  		npkts = nbytes / TS_PACKET_LEN;
>  
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> index f8049cdf564a..e3290facf57b 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> @@ -285,12 +285,12 @@ static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
>  {
>  	u64 count = e->sample_count;
>  	struct vidtv_access_unit *au = e->access_units;
> +	u32 duration = CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
>  
>  	while (au) {
>  		count += au->num_samples;
>  
> -		au->pts = count *
> -			  CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
> +		au->pts = count * duration;

That doesn't seem to be the right thing to do here. 

Assuming that sampling rate is 48 kHz, you'll
have duration = 1.875, which would be rounded to 1.

In other words, the above is identical to:

	au->pts = count

Now, I don't know from where that CLOCK_UNIT_90KHZ came from.

If such constant is not needed anymore, just drop it. 
	
If, on the other hand, this is required by the specs, then
you may need to do a 64 bits division, e. g. using
div64_u64() or do_div().

Thanks,
Mauro
