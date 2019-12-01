Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D09E710E0FC
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 08:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfLAHrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 02:47:39 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:48716 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfLAHri (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 02:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=31ZIn5LuPfDCCSlP/VMSXAo5Pn3mOLQbdfQ8bPQa9Sg=; b=jr7ralNE8IVefG9LG2R/0zGWP
        xv6rzjRM7IVgQoFkQ5shDctC6DSMqRKYKb+OwxvnEzSoz/4PhCN2t+hcT6BcCkcAeXezWpMmiFHg3
        7Qj4OELKoBTSZQm9BtbuvtQj7fog6Nak+61ZUWc1PqC+w8RXmbpqwCtI7hYidbYF2WQuLNJh86L33
        AVj2X4mO/Q0tXzJNSPAhyxWo8BsZKviL8UBxtp7q5SXyUo63hc2L2qa3kN2TndO6BoBr9RL1ZsuAk
        h4joyVg99Hbv/lnS0ARKZ6xMoTakr0HlyJ0YXAyvgNbhWXUL/wvO4D1uh4l8n/c6uckzIo0gBzzFk
        SkHmSQ6CQ==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ibJx7-00025Q-B9; Sun, 01 Dec 2019 07:47:33 +0000
Date:   Sun, 1 Dec 2019 08:47:28 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     gregkh@linuxfoundation.org, rfontana@redhat.com,
        kstewart@linuxfoundation.org, tglx@linutronix.de,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION
Message-ID: <20191201084728.17387715@kernel.org>
In-Reply-To: <20191112125014.5604-1-dwlsalmeida@gmail.com>
References: <20191112125014.5604-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 12 Nov 2019 09:50:14 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Change foo* bar to foo *bar to avoid ERROR: POINTER_LOCATION in checkpatch.pl
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_init(struct dvb_frontend* fe)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static void dvb_dummy_fe_release(struct dvb_frontend* fe)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
> 
> ERROR: "foo* bar" should be "foo *bar"
> +struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +	struct dvb_dummy_fe_state* state = NULL;
> 
> ERROR: "foo* bar" should be "foo *bar"
> +	struct dvb_dummy_fe_state* state = NULL;
> 
> ERROR: "foo* bar" should be "foo *bar"
> +	struct dvb_dummy_fe_state* state = NULL;
> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> ------------------------------------------------------------
> Changes in v2:
> 
> -Added checkpatch.pl previous output so it's more clear what
> is being fixed by this patch.
> 
> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 24 +++++++++++-----------
>  drivers/media/dvb-frontends/dvb_dummy_fe.h |  6 +++---
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 4db679cb70ad..8413038aa30b 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> @@ -31,25 +31,25 @@ static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_read_ber(struct dvb_frontend* fe, u32* ber)
> +static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
>  {
>  	*ber = 0;
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
> +static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe, u16 *strength)

Line too long. As you're touching on it, please also fix the long line
warning.

>  {
>  	*strength = 0;
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)
> +static int dvb_dummy_fe_read_snr(struct dvb_frontend *fe, u16 *snr)
>  {
>  	*snr = 0;
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)
> +static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
>  {
>  	*ucblocks = 0;
>  	return 0;
> @@ -77,12 +77,12 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
> +static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
>  {
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_init(struct dvb_frontend* fe)
> +static int dvb_dummy_fe_init(struct dvb_frontend *fe)
>  {
>  	return 0;
>  }
> @@ -99,17 +99,17 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
>  	return 0;
>  }
>  
> -static void dvb_dummy_fe_release(struct dvb_frontend* fe)
> +static void dvb_dummy_fe_release(struct dvb_frontend *fe)
>  {
> -	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
>  	kfree(state);
>  }
>  
>  static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops;
>  
> -struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
> +struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
>  {
> -	struct dvb_dummy_fe_state* state = NULL;
> +	struct dvb_dummy_fe_state *state = NULL;
>  
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> @@ -126,7 +126,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
>  
>  struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
>  {
> -	struct dvb_dummy_fe_state* state = NULL;
> +	struct dvb_dummy_fe_state *state = NULL;
>  
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> @@ -143,7 +143,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
>  
>  struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
>  {
> -	struct dvb_dummy_fe_state* state = NULL;
> +	struct dvb_dummy_fe_state *state = NULL;
>  
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.h b/drivers/media/dvb-frontends/dvb_dummy_fe.h
> index 526fabd7751f..35efe2ce1a88 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.h
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.h
> @@ -12,9 +12,9 @@
>  #include <media/dvb_frontend.h>
>  
>  #if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
> -extern struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void);
> -extern struct dvb_frontend* dvb_dummy_fe_qpsk_attach(void);
> -extern struct dvb_frontend* dvb_dummy_fe_qam_attach(void);
> +extern struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
> +extern struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
> +extern struct dvb_frontend *dvb_dummy_fe_qam_attach(void);

Don't keep the "extern" here:

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#185: FILE: drivers/media/dvb-frontends/dvb_dummy_fe.h:15:
+extern struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#186: FILE: drivers/media/dvb-frontends/dvb_dummy_fe.h:16:
+extern struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#187: FILE: drivers/media/dvb-frontends/dvb_dummy_fe.h:17:
+extern struct dvb_frontend *dvb_dummy_fe_qam_attach(void);


>  #else
>  static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
>  {



Cheers,
Mauro
