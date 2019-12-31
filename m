Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF1212D7CB
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 11:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfLaKIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 05:08:05 -0500
Received: from gofer.mess.org ([88.97.38.141]:41115 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbfLaKIE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 05:08:04 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 89ED511A001; Tue, 31 Dec 2019 10:08:02 +0000 (GMT)
Date:   Tue, 31 Dec 2019 10:08:02 +0000
From:   Sean Young <sean@mess.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION
Message-ID: <20191231100802.GE24469@gofer.mess.org>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
 <20191201161542.69535-4-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191201161542.69535-4-dwlsalmeida@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Sun, Dec 01, 2019 at 01:15:39PM -0300, Daniel W. S. Almeida wrote:
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

The comments from Mauro in the previous version of this patch have not been
addressed:

https://patchwork.linuxtv.org/patch/60048/#114016

Thanks,

Sean


> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 24 +++++++++++-----------
>  drivers/media/dvb-frontends/dvb_dummy_fe.h |  6 +++---
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 987c3488fe6c..209e7ac0de33 100644
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
> @@ -131,7 +131,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
>  
>  struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
>  {
> -	struct dvb_dummy_fe_state* state = NULL;
> +	struct dvb_dummy_fe_state *state = NULL;
>  
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> @@ -153,7 +153,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
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
>  #else
>  static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
>  {
> -- 
> 2.24.0
