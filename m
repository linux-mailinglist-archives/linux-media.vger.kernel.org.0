Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485A726A478
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 13:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgIOLz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 07:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgIOLyU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 07:54:20 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822BEC06174A
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 04:53:34 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id UBtV2302Q4C55Sk06BtVmK; Tue, 15 Sep 2020 13:53:29 +0200
Received: from geert (helo=localhost)
        by ramsan with local-esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kI9Wb-0008H5-Gl; Tue, 15 Sep 2020 13:53:29 +0200
Date:   Tue, 15 Sep 2020 13:53:29 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
cc:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v10 3/4] media: vidtv: add a bridge driver
In-Reply-To: <20200821125848.1092958-4-dwlsalmeida@gmail.com>
Message-ID: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg>
References: <20200821125848.1092958-1-dwlsalmeida@gmail.com> <20200821125848.1092958-4-dwlsalmeida@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 	Hi Daniel,

On Fri, 21 Aug 2020, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
>
> Digital TV devices consist of several independent hardware components
> which are controlled by different drivers.
> Each media device is controlled by a group of cooperating drivers with the
> bridge driver as the main driver.
>
> This patch adds a bridge driver for the Virtual Digital TV driver [vidtv].

This is now commit f90cf6079bf67988 ("media: vidtv: add a bridge
driver") in the media tree.

noreply@ellerman.id.au reported the following error for an m68k
allmodconfig build:

     ERROR: modpost: "__udivdi3" [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!

Presumably this fails on other 32-bit platforms, too.

> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> +static u32 vidtv_mux_check_mux_rate(struct vidtv_mux *m)
> +{
> +	/*
> +	 * attempt to maintain a constant mux rate, padding with null packets
> +	 * if needed
> +	 */
> +
> +	u32 nbytes = 0;  /* the number of bytes written by this function */
> +
> +	u64 nbytes_expected; /* the number of bytes we should have written */
> +	u64 nbytes_streamed; /* the number of bytes we actually wrote */
> +	u32 num_null_pkts; /* number of null packets to bridge the gap */
> +
> +	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
> +						  m->timing.past_jiffies);
> +
> +	elapsed_time_msecs = min(elapsed_time_msecs, (u64)VIDTV_MAX_SLEEP_USECS / 1000);
> +	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);

Seriously?!?

You multiply by 1000 first, followed by a division by 1000 using an
expensive 64-by-64 division?

> +	nbytes_expected *= elapsed_time_msecs;
> +
> +	nbytes_streamed = m->mux_buf_offset;
> +
> +	if (nbytes_streamed < nbytes_expected) {
> +		/* can't write half a packet: roundup to a 188 multiple */
> +		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);

drivers/media/test-drivers/vidtv/vidtv_mux.o: In function `vidtv_mux_tick':
vidtv_mux.c:(.text+0x788): undefined reference to `__udivdi3'

This is a 64-by-32 division, hence it should use a helper from
<linux/math64.h>.

However, I'm wondering if "nbytes_expected - nbytes_streamed" is
guaranteed to be a "small" number, hence a 32-by-32 division would be
sufficient?

> +		num_null_pkts    = nbytes_expected / TS_PACKET_LEN;

Likewise.

> +		nbytes          += vidtv_mux_pad_with_nulls(m, num_null_pkts);
> +	}
> +
> +	return nbytes;
> +}

> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> +static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
> +{
> +	u64 count = e->sample_count;
> +	struct vidtv_access_unit *au = e->access_units;
> +
> +	while (au) {
> +		count += au->num_samples;
> +
> +		au->pts = count *
> +			  CLOCK_UNIT_90KHZ / e->sampling_rate_hz;

drivers/media/test-drivers/vidtv/vidtv_s302m.o: In function `vidtv_s302m_encode':
vidtv_s302m.c:(.text+0x2ac): undefined reference to `__udivdi3'

Likewise.

> +
> +		au = au->next;
> +	}
> +}

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
