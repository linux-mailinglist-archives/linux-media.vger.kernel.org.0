Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA1E018975E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 09:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgCRIn2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 04:43:28 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60652 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgCRIn2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 04:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=laocdoFfC8BF0yiFG5s2DtCNbe1PtE+qM3lE7QjksiE=; b=pqrd2dDs+WktHotWvY7YC4zmF7
        CpgAzrUlHjAxWma4dy9PsfzHuMQ4s6iNk97Ek8esDNPe4E2aWdzsL4tosQgtf+iYQ5ip0xyViAHsR
        w77boplTJtoakZuoe2In6sFpHtZkkZ8I4GVp5dtqdO6tDO8hWAreL+Q73q4kgodutD32B/mvLYtmg
        COl56NcHFsgcHDWTjoh29ebX1Jhkn4uRwnnxlQPKbogLvDoTcGjcyjL+7jN+gGLVPtNKW9sEnsT+O
        LMfIh2+m1EDAC0CU5gXQ/AEnb2cvlWhIrwXrY2MKWd1Hf0fKFK1XM2hBxIQWj4byStXkkqoLjrRI6
        hyy38axg==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jEUIO-0004nd-7e; Wed, 18 Mar 2020 08:43:24 +0000
Date:   Wed, 18 Mar 2020 09:43:17 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [RFC 2/3] media: dvb_dummy_fe.c: lose TS lock on bad snr
Message-ID: <20200318094317.35c4efc1@coco.lan>
In-Reply-To: <20200318060018.3437750-3-dwlsalmeida@gmail.com>
References: <20200318060018.3437750-1-dwlsalmeida@gmail.com>
        <20200318060018.3437750-3-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 18 Mar 2020 03:00:17 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Periodically check the signal quality and eventually lose the lock if
> the quality is sub-par. A fake tuner can return a bad quality signal to
> the demod if the frequency is too far off from a valid frequency.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 149 ++++++++++++++++++++-
>  1 file changed, 144 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 9ff1ebaa5e04..726c964a523d 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> @@ -9,24 +9,155 @@
>  #include <linux/init.h>
>  #include <linux/string.h>
>  #include <linux/slab.h>
> +#include <linux/workqueue.h>
> +#include <linux/random.h>
>  
>  #include <media/dvb_frontend.h>
>  #include "dvb_dummy_fe.h"
>  
>  
> +struct dvb_dummy_fe_cnr_to_qual_s {
> +	/* attempt to use the same values as libdvbv5 */
> +	u32 modulation;
> +	u32 fec;
> +	u32 cnr_ok, cnr_good;
> +};
> +
> +struct dvb_dummy_fe_cnr_to_qual_s dvb_c_cnr_2_qual[] = {
> +	/* from libdvbv5 source code */
> +	{ QAM_256, FEC_NONE,  34., 38.},
> +	{ QAM_64,  FEC_NONE,  30., 34.},
> +};
> +
> +struct dvb_dummy_fe_cnr_to_qual_s dvb_s_cnr_2_qual[] = {
> +	/* from libdvbv5 source code */
> +	{ QPSK, FEC_1_2,  7., 10.},
> +
> +	{ QPSK, FEC_2_3,  9., 12.},
> +	{ QPSK, FEC_3_4, 10., 13.},
> +	{ QPSK, FEC_5_6, 11., 14.},
> +
> +	{ QPSK, FEC_7_8, 12., 15.},
> +};
> +
> +struct dvb_dummy_fe_cnr_to_qual_s dvb_s2_cnr_2_qual[] = {
> +	/* from libdvbv5 source code */
> +	{ QPSK,  FEC_1_2,   9.,  12.},
> +	{ QPSK,  FEC_2_3,  11.,  14.},
> +	{ QPSK,  FEC_3_4,  12.,  15.},
> +	{ QPSK,  FEC_5_6,  12.,  15.},
> +	{ QPSK,  FEC_8_9,  13.,  16.},
> +	{ QPSK,  FEC_9_10, 13.5, 16.5},
> +	{ PSK_8, FEC_2_3,  14.5, 17.5},
> +	{ PSK_8, FEC_3_4,  16.,  19.},
> +	{ PSK_8, FEC_5_6,  17.5, 20.5},
> +	{ PSK_8, FEC_8_9,  19.,  22.},
> +};
> +
> +static struct dvb_dummy_fe_cnr_to_qual_s dvb_t_cnr_2_qual[] = {
> +	/* from libdvbv5 source code */
> +	{   QPSK, FEC_1_2,  4.1,  5.9},
> +	{   QPSK, FEC_2_3,  6.1,  9.6},
> +	{   QPSK, FEC_3_4,  7.2, 12.4},
> +	{   QPSK, FEC_5_6,  8.5, 15.6},
> +	{   QPSK, FEC_7_8,  9.2, 17.5},
> +
> +	{ QAM_16, FEC_1_2,  9.8, 11.8},
> +	{ QAM_16, FEC_2_3, 12.1, 15.3},
> +	{ QAM_16, FEC_3_4, 13.4, 18.1},
> +	{ QAM_16, FEC_5_6, 14.8, 21.3},
> +	{ QAM_16, FEC_7_8, 15.7, 23.6},
> +
> +	{ QAM_64, FEC_1_2, 14.0, 16.0},
> +	{ QAM_64, FEC_2_3, 19.9, 25.4},
> +	{ QAM_64, FEC_3_4, 24.9, 27.9},
> +	{ QAM_64, FEC_5_6, 21.3, 23.3},
> +	{ QAM_64, FEC_7_8, 22.0, 24.0},
> +};

Same comment as before: multiply everything to 1000.

> +
> +struct dvb_dummy_fe_config {
> +	/* probability of losing the lock due to low snr */
> +	u8 drop_tslock_probability_on_low_snr;
> +};
> +
>  struct dvb_dummy_fe_state {
>  	struct dvb_frontend frontend;
> +	struct dvb_dummy_fe_config config;
> +	struct delayed_work poll_snr;
> +	enum fe_status status;
>  };
>  
> +void poll_snr_handler(struct work_struct *work)
> +{
> +	/* periodically check the signal quality and eventually
> +	 * lose the TS lock if it dips too low
> +	 */

We use multi-line comments at the Kernel as:

	/*
	 * foo
	 * bar
	 */


> +	struct dvb_dummy_fe_state *state =
> +		container_of(work, struct dvb_dummy_fe_state, poll_snr.work);
> +	struct dtv_frontend_properties *c = &state->frontend.dtv_property_cache;
> +	struct dvb_dummy_fe_cnr_to_qual_s *cnr2qual = NULL;
> +	struct dvb_dummy_fe_config *config = &state->config;
> +	u32 array_size = 0;
> +	u16 snr = 0;
> +	u32 i;

Please avoid breaking assignments on multiple lines. It makes harder
to read.

What I would do, instead, is to split it on a different way:

	struct dvb_dummy_fe_state *state;
	struct dtv_frontend_properties *c;
	struct dvb_dummy_fe_config *config;
	...

	state = container_of(work, struct dvb_dummy_fe_state, poll_snr.work);
	c = &state->frontend.dtv_property_cache;
	config = &state->config;



> +
> +	if (!state->frontend.ops.tuner_ops.get_rf_strength)
> +		return;
> +
> +	state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
> +
> +	switch (c->delivery_system) {
> +	case SYS_DVBT:
> +	case SYS_DVBT2:
> +		cnr2qual = dvb_t_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_t_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBS:
> +		cnr2qual = dvb_s_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_s_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBS2:
> +		cnr2qual = dvb_s2_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_s2_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBC_ANNEX_A:
> +		cnr2qual = dvb_c_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_c_cnr_2_qual);
> +		break;
> +
> +	default:
> +		pr_warn("%s: unsupported delivery system: %u\n",
> +			__func__,
> +			c->delivery_system);
> +		break;
> +	}
> +
> +	for (i = 0; i <= array_size; i++) {
> +		if (cnr2qual[i].modulation == c->modulation &&
> +		    cnr2qual[i].fec == c->fec_inner) {
> +
> +			if (snr < cnr2qual[i].cnr_ok) {
> +				/* eventually lose the TS lock */
> +				if (prandom_u32_max(100) <
> +				    config->drop_tslock_probability_on_low_snr)
> +					state->status = 0;
> +			}

Hmm.. what about the reverse: if it lost TS lock, shouldn't it 
randomly recover?

> +		}
> +	}
> +
> +	schedule_delayed_work(&(state->poll_snr), msecs_to_jiffies(2000));
> +}
>  
>  static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
>  				    enum fe_status *status)
>  {
> -	*status = FE_HAS_SIGNAL
> -		| FE_HAS_CARRIER
> -		| FE_HAS_VITERBI
> -		| FE_HAS_SYNC
> -		| FE_HAS_LOCK;
> +
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> +
> +	*status = state->status;
>  
>  	return 0;
>  }
> @@ -80,11 +211,18 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
>  
>  static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
>  {
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> +
> +	cancel_delayed_work_sync(&(state->poll_snr));
>  	return 0;
>  }
>  
>  static int dvb_dummy_fe_init(struct dvb_frontend *fe)
>  {
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> +
> +	INIT_DELAYED_WORK(&(state->poll_snr), &poll_snr_handler);
> +	schedule_delayed_work(&(state->poll_snr), msecs_to_jiffies(2000));
>  	return 0;
>  }
>  
> @@ -104,6 +242,7 @@ static void dvb_dummy_fe_release(struct dvb_frontend *fe)
>  {
>  	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
>  
> +	cancel_delayed_work_sync(&(state->poll_snr));
>  	kfree(state);
>  }
>  

The rest of the code sounds good to me.


Thanks,
Mauro
