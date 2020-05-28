Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBABE1E70AE
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 01:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437737AbgE1Xrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 19:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437726AbgE1Xrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 19:47:39 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36617C008631
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 16:39:50 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id r24so574970ota.8
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 16:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9EmLYes0hqehCPuETvx+HLQgLDYk5FjPYy8YVyNwPmQ=;
        b=fBzm1VVkMjT1kywFIOp/98CeQ6ZaFvT/AMxwBBrnhw6UnIwqhLCk0j0/1ZKZfnAu1D
         myW9fzS/qEmBvtWVO0jQFGqdsyb671swTSVbbExezplrEVobqUYMQig8l2IEX1gFGfmM
         iirbD1vyN9XP9UnHHNST0/tAY6Pqlkpt7eZGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9EmLYes0hqehCPuETvx+HLQgLDYk5FjPYy8YVyNwPmQ=;
        b=BVriyzfry1YtgV+HlJoVEih7VUsMF0ccwuug8THg4kXhAGtCEOqes/wMmWxxQY7hsT
         k9rcNAesciMqIa+xTrI2r3wn9582892me6w8q5VH9ajlGmY06+lOSW7Z29fup9+2TAor
         ZIHyq7WhAkyXT/Js/r2p5ssAnCY6LrQvZgl6qIGItro1I/FAS9bw+KnAcNd47sHRfJkU
         YlK/vglNcup+JRwoVx/zDX2riMysdMm8PsVjeNPruq2/o5EIvOZ4pLbn+xPpkL+Fs8g1
         5OdyI3wGmOituHd1SnAZjrtvNV/DRpXlP5EkkL0Kkv1kjLkvCTsbM4nnDmDSE2Tv5T/x
         7/JQ==
X-Gm-Message-State: AOAM533fxEHz2VsV32k82mRZ7AUPkmqDW2L9Rdyddns7WBmsoaHP2/o4
        34c3VbdizPzYMAjvilC9bScBxR2EFA4=
X-Google-Smtp-Source: ABdhPJzaE16VR/JoNi/ZgCWQjKXU0nJWKpEz244+XsnNr0m4FUDFCKZuixB1ElGulKv1uAKp/1hN6w==
X-Received: by 2002:a05:6830:6:: with SMTP id c6mr3946308otp.62.1590709189325;
        Thu, 28 May 2020 16:39:49 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j13sm2261190oib.7.2020.05.28.16.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 16:39:48 -0700 (PDT)
Subject: Re: [RFC, WIP, v6 03/10] media: vidtv: implement a demodulator driver
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
 <20200520070334.1778751-4-dwlsalmeida@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <344e4671-fef1-c809-e746-d7716361182c@linuxfoundation.org>
Date:   Thu, 28 May 2020 17:39:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520070334.1778751-4-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/20/20 1:03 AM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Implement a I2C demodulator driver, simulating support for DVB-T, DVB-C
> and DVB-S.
> 
> This demodulator will periodically check the signal quality against a table
> and drop the TS lock if it drops below a threshold value, regaining it in
> the event that the signal improves.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>   drivers/media/test-drivers/vidtv/Makefile     |   3 +-
>   .../media/test-drivers/vidtv/vidtv_demod.c    | 444 ++++++++++++++++++
>   .../media/test-drivers/vidtv/vidtv_demod.h    |  41 ++
>   3 files changed, 487 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.h
> 
> diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
> index 58e022c094e5e..21e50c11c94d0 100644
> --- a/drivers/media/test-drivers/vidtv/Makefile
> +++ b/drivers/media/test-drivers/vidtv/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
>   dvb-vidtv-tuner-objs := vidtv_tuner.o
> +dvb-vidtv-demod-objs := vidtv_demod.o
>   
> -obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o
> +obj-$(CONFIG_DVB_VIDTV)	+= dvb-vidtv-tuner.o dvb-vidtv-demod.o
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
> new file mode 100644
> index 0000000000000..15912e063cf5a
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
> @@ -0,0 +1,444 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + * Based on the example driver written by Emard <emard@softhome.net>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +#include <linux/random.h>
> +#include <linux/ratelimit.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/workqueue.h>
> +#include <media/dvb_frontend.h>
> +
> +#include "vidtv_demod.h"
> +
> +// FIXME: just added a random value here
> +#define POLL_THRD_TIME 10 /* ms */
> +
> +static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_c_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db */
> +	{ QAM_256, FEC_NONE,  34000, 38000},
> +	{ QAM_64,  FEC_NONE,  30000, 34000},
> +};
> +
> +static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_s_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db */
> +	{ QPSK, FEC_1_2,  7000, 10000},
> +	{ QPSK, FEC_2_3,  9000, 12000},
> +	{ QPSK, FEC_3_4, 10000, 13000},
> +	{ QPSK, FEC_5_6, 11000, 14000},
> +	{ QPSK, FEC_7_8, 12000, 15000},
> +};
> +
> +static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_s2_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db */
> +	{ QPSK,  FEC_1_2,   9000,  12000},
> +	{ QPSK,  FEC_2_3,  11000,  14000},
> +	{ QPSK,  FEC_3_4,  12000,  15000},
> +	{ QPSK,  FEC_5_6,  12000,  15000},
> +	{ QPSK,  FEC_8_9,  13000,  16000},
> +	{ QPSK,  FEC_9_10, 13500,  16500},
> +	{ PSK_8, FEC_2_3,  14500,  17500},
> +	{ PSK_8, FEC_3_4,  16000,  19000},
> +	{ PSK_8, FEC_5_6,  17500,  20500},
> +	{ PSK_8, FEC_8_9,  19000,  22000},
> +};
> +
> +static const struct vidtv_demod_cnr_to_qual_s vidtv_demod_t_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db*/
> +	{   QPSK, FEC_1_2,  4100,  5900},
> +	{   QPSK, FEC_2_3,  6100,  9600},
> +	{   QPSK, FEC_3_4,  7200, 12400},
> +	{   QPSK, FEC_5_6,  8500, 15600},
> +	{   QPSK, FEC_7_8,  9200, 17500},
> +
> +	{ QAM_16, FEC_1_2,  9800, 11800},
> +	{ QAM_16, FEC_2_3, 12100, 15300},
> +	{ QAM_16, FEC_3_4, 13400, 18100},
> +	{ QAM_16, FEC_5_6, 14800, 21300},
> +	{ QAM_16, FEC_7_8, 15700, 23600},
> +
> +	{ QAM_64, FEC_1_2, 14000, 16000},
> +	{ QAM_64, FEC_2_3, 19900, 25400},
> +	{ QAM_64, FEC_3_4, 24900, 27900},
> +	{ QAM_64, FEC_5_6, 21300, 23300},
> +	{ QAM_64, FEC_7_8, 22000, 24000},
> +};
> +
> +static const struct vidtv_demod_cnr_to_qual_s
> +*vidtv_match_cnr_s(struct dvb_frontend *fe)

Looks very odd:

Move vidtv_match_cnr_s up and:
static const struct vidtv_demod_cnr_to_qual_s
		vidtv_match_cnr_s(struct dvb_frontend *fe)

is better.
			

> +{
> +	struct dtv_frontend_properties *c;
> +	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
> +	u32    array_size                          = 0;

This looks really odd. Don't align them. Align them if it makes
sense. It doesn't here.

> +	u32 i;
> +
> +	c = &fe->dtv_property_cache;
> +
> +	switch (c->delivery_system) {

Indentation

> +	case SYS_DVBT:
> +	case SYS_DVBT2:
> +		cnr2qual   = vidtv_demod_t_cnr_2_qual;
> +		array_size = ARRAY_SIZE(vidtv_demod_t_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBS:
> +		cnr2qual   = vidtv_demod_s_cnr_2_qual;
> +		array_size = ARRAY_SIZE(vidtv_demod_s_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBS2:
> +		cnr2qual   = vidtv_demod_s2_cnr_2_qual;
> +		array_size = ARRAY_SIZE(vidtv_demod_s2_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBC_ANNEX_A:
> +		cnr2qual   = vidtv_demod_c_cnr_2_qual;
> +		array_size = ARRAY_SIZE(vidtv_demod_c_cnr_2_qual);
> +		break;
> +
> +	default:
> +		pr_warn_ratelimited("%s: unsupported delivery system: %u\n",
> +				    __func__,
> +				    c->delivery_system);
> +		break;
> +	}
> +
> +	for (i = 0; i <= array_size; i++)
> +		if (cnr2qual[i].modulation == c->modulation &&
> +		    cnr2qual[i].fec == c->fec_inner)
> +			return &cnr2qual[i];
> +
> +	return NULL; /* not found */
> +}
> +
> +static void vidtv_demod_poll_snr_handler(struct work_struct *work)
> +{
> +	/*
> +	 * periodically check the signal quality and eventually
> +	 * lose the TS lock if it dips too low
> +	 */
> +	struct vidtv_demod_state *state;
> +	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
> +	struct vidtv_demod_config *config;
> +	u16 snr = 0;
> +
> +	state  = container_of(work, struct vidtv_demod_state, poll_snr.work);
> +	config = &state->config;
> +
> +	if (!state->frontend.ops.tuner_ops.get_rf_strength)
> +		return;
> +
> +	state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
> +
> +	cnr2qual = vidtv_match_cnr_s(&state->frontend);
> +	if (!cnr2qual)
> +		return;
> +
> +	if (snr < cnr2qual->cnr_ok) {
> +		/* eventually lose the TS lock */
> +		if (prandom_u32_max(100) < config->drop_tslock_prob_on_low_snr)
> +			state->status = 0;
> +	} else {
> +		/* recover if the signal improves */
> +		if (prandom_u32_max(100) <
> +		    config->recover_tslock_prob_on_good_snr)
> +			state->status = FE_HAS_SIGNAL  |
> +					FE_HAS_CARRIER |
> +					FE_HAS_VITERBI |
> +					FE_HAS_SYNC    |
> +					FE_HAS_LOCK;
> +	}
> +
> +	schedule_delayed_work(&state->poll_snr,
> +			      msecs_to_jiffies(POLL_THRD_TIME));
> +}
> +
> +static int vidtv_demod_read_status(struct dvb_frontend *fe,
> +				   enum fe_status *status)
> +{
> +	struct vidtv_demod_state *state = fe->demodulator_priv;
> +
> +	*status = state->status;
> +
> +	return 0;
> +}
> +
> +static int vidtv_demod_read_ber(struct dvb_frontend *fe, u32 *ber)
> +{
> +	*ber = 0;
> +	return 0;
> +}
> +
> +static int vidtv_demod_read_signal_strength(struct dvb_frontend *fe,
> +					    u16 *strength)
> +{
> +	*strength = 0;
> +	return 0;
> +}
> +
> +static int vidtv_demod_read_snr(struct dvb_frontend *fe, u16 *snr)
> +{
> +	*snr = 0;
> +	return 0;
> +}
> +
> +static int vidtv_demod_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
> +{
> +	*ucblocks = 0;
> +	return 0;
> +}
> +
> +/*
> + * NOTE:
> + * This is implemented here just to be used as an example for real
> + * demod drivers.
> + *
> + * Should only be implemented if it actually reads something from the hardware.
> + * Also, it should check for the locks, in order to avoid report wrong data
> + * to userspace.
> + */
> +static int vidtv_demod_get_frontend(struct dvb_frontend *fe,
> +				    struct dtv_frontend_properties *p)
> +{
> +	return 0;
> +}
> +
> +static int vidtv_demod_set_frontend(struct dvb_frontend *fe)
> +{
> +	struct vidtv_demod_state *state            = fe->demodulator_priv;
> +	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
> +	u32    tuner_status                        = 0;
> +
> +	if (fe->ops.tuner_ops.set_params) {
> +		fe->ops.tuner_ops.set_params(fe);
> +
> +		/* store the CNR returned by the tuner */
> +		fe->ops.tuner_ops.get_rf_strength(fe, &state->tuner_cnr);
> +
> +		fe->ops.tuner_ops.get_status(fe, &tuner_status);
> +		state->status = (state->tuner_cnr > 0) ?  FE_HAS_SIGNAL  |
> +							  FE_HAS_CARRIER |
> +							  FE_HAS_VITERBI |
> +							  FE_HAS_SYNC    |
> +							  FE_HAS_LOCK	 :
> +							  0;
> +		cnr2qual = vidtv_match_cnr_s(fe);
> +
> +		/* signal isn't good: might lose the lock eventually */
> +		if (tuner_status == TUNER_STATUS_LOCKED &&
> +		    state->tuner_cnr < cnr2qual->cnr_good) {
> +			schedule_delayed_work(&state->poll_snr,
> +					      msecs_to_jiffies(POLL_THRD_TIME));
> +
> +			state->poll_snr_thread_running = true;
> +		}
> +
> +		if (fe->ops.i2c_gate_ctrl)
> +			fe->ops.i2c_gate_ctrl(fe, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int vidtv_demod_sleep(struct dvb_frontend *fe)
> +{
> +	struct vidtv_demod_state *state = fe->demodulator_priv;
> +
> +	if (state->poll_snr_thread_running) {
> +		cancel_delayed_work_sync(&state->poll_snr);
> +		state->poll_snr_thread_running = false;
> +		state->poll_snr_thread_restart = true;
> +	}
> +	return 0;
> +}
> +
> +static int vidtv_demod_init(struct dvb_frontend *fe)
> +{
> +	struct vidtv_demod_state *state = fe->demodulator_priv;
> +	u32    tuner_status             = 0;
> +
> +	if (state->cold_start)
> +		INIT_DELAYED_WORK(&state->poll_snr,
> +				  &vidtv_demod_poll_snr_handler);
> +
> +	/*
> +	 * At resume, start the snr poll thread only if it was suspended with
> +	 * the thread running. Extra care should be taken here, as some tuner
> +	 * status change might happen at resume time (for example, due to an
> +	 * ioctl syscall to set_frontend, or due to a release syscall).
> +	 */
> +	fe->ops.tuner_ops.get_status(fe, &tuner_status);
> +
> +	if (tuner_status == TUNER_STATUS_LOCKED &&
> +	    state->poll_snr_thread_restart) {
> +		schedule_delayed_work(&state->poll_snr,
> +				      msecs_to_jiffies(POLL_THRD_TIME));
> +
> +		state->poll_snr_thread_restart = false;
> +	}
> +
> +	state->cold_start = false;
> +	return 0;
> +}
> +
> +/*
> + * NOTE:
> + * This is implemented here just to be used as an example for real
> + * demod drivers.
> + *
> + * Should only be implemented if the demod has support for DVB-S or DVB-S2
> + */
> +static int vidtv_demod_set_tone(struct dvb_frontend *fe,
> +				enum fe_sec_tone_mode tone)
> +{
> +	return 0;
> +}
> +
> +/*
> + * NOTE:
> + * This is implemented here just to be used as an example for real
> + * demod drivers.
> + *
> + * Should only be implemented if the demod has support for DVB-S or DVB-S2
> + */
> +static int vidtv_demod_set_voltage(struct dvb_frontend *fe,
> +				   enum fe_sec_voltage voltage)
> +{
> +	return 0;
> +}
> +
> +static void vidtv_demod_release(struct dvb_frontend *fe)
> +{
> +	struct vidtv_demod_state *state = fe->demodulator_priv;
> +
> +	if (state->poll_snr_thread_running)
> +		cancel_delayed_work_sync(&state->poll_snr);
> +
> +	kfree(state);
> +}
> +
> +static const struct dvb_frontend_ops vidtv_demod_ops = {
> +	.delsys = {
> +		SYS_DVBT,
> +		SYS_DVBT2,
> +		SYS_DVBC_ANNEX_A,
> +		SYS_DVBS,
> +		SYS_DVBS2,
> +	},
> +
> +	.info = {
> +		.name                   = "Dummy demod for DVB-T/T2/C/S/S2",
> +		.frequency_min_hz       = 51 * MHz,
> +		.frequency_max_hz       = 2150 * MHz,
> +		.frequency_stepsize_hz  = 62500,
> +		.frequency_tolerance_hz = 29500 * kHz,
> +		.symbol_rate_min        = 1000000,
> +		.symbol_rate_max        = 45000000,
> +
> +		.caps = FE_CAN_FEC_1_2 |
> +			FE_CAN_FEC_2_3 |
> +			FE_CAN_FEC_3_4 |
> +			FE_CAN_FEC_4_5 |
> +			FE_CAN_FEC_5_6 |
> +			FE_CAN_FEC_6_7 |
> +			FE_CAN_FEC_7_8 |
> +			FE_CAN_FEC_8_9 |
> +			FE_CAN_FEC_AUTO |

Here is the first one.

> +			FE_CAN_QAM_16 |
> +			FE_CAN_QAM_64 |
> +			FE_CAN_QAM_32 |
> +			FE_CAN_QAM_128 |
> +			FE_CAN_QAM_256 |
> +			FE_CAN_QAM_AUTO |
> +			FE_CAN_QPSK |
> +			FE_CAN_FEC_AUTO |

Duplicate entry? Cut and paste error perhaps.

> +			FE_CAN_INVERSION_AUTO |
> +			FE_CAN_TRANSMISSION_MODE_AUTO |
> +			FE_CAN_GUARD_INTERVAL_AUTO |
> +			FE_CAN_HIERARCHY_AUTO,
> +	},
> +
> +	.release = vidtv_demod_release,
> +
> +	.init  = vidtv_demod_init,
> +	.sleep = vidtv_demod_sleep,
> +
> +	.set_frontend = vidtv_demod_set_frontend,
> +	.get_frontend = vidtv_demod_get_frontend,
> +
> +	.read_status          = vidtv_demod_read_status,
> +	.read_ber             = vidtv_demod_read_ber,
> +	.read_signal_strength = vidtv_demod_read_signal_strength,
> +	.read_snr             = vidtv_demod_read_snr,
> +	.read_ucblocks        = vidtv_demod_read_ucblocks,
> +
> +	/* For DVB-S/S2 */
> +	.set_voltage = vidtv_demod_set_voltage,
> +	.set_tone    = vidtv_demod_set_tone,
> +};
> +
> +static const struct i2c_device_id vidtv_demod_i2c_id_table[] = {
> +	{"vidtv_demod", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, vidtv_demod_i2c_id_table);
> +
> +static int vidtv_demod_i2c_probe(struct i2c_client *client,
> +				 const struct i2c_device_id *id)
> +{
> +	struct vidtv_demod_state *state;
> +
> +	/* allocate memory for the internal state */
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	/* create dvb_frontend */
> +	memcpy(&state->frontend.ops,
> +	       &vidtv_demod_ops,
> +	       sizeof(struct dvb_frontend_ops));
> +
> +	state->frontend.demodulator_priv = state;
> +	i2c_set_clientdata(client, state);
> +
> +	return 0;
> +}
> +
> +static int vidtv_demod_i2c_remove(struct i2c_client *client)
> +{
> +	struct vidtv_demod_state *state = i2c_get_clientdata(client);
> +
> +	memset(&state->frontend.ops, 0, sizeof(struct dvb_frontend_ops));
> +	state->frontend.demodulator_priv = NULL;
> +	kfree(state);
> +
> +	return 0;
> +}
> +
> +static struct i2c_driver vidtv_demod_i2c_driver = {
> +	.driver = {
> +		.name                = "vidtv_demod",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe    = vidtv_demod_i2c_probe,
> +	.remove   = vidtv_demod_i2c_remove,
> +	.id_table = vidtv_demod_i2c_id_table,
> +};
> +
> +module_i2c_driver(vidtv_demod_i2c_driver);
> +
> +MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
> +MODULE_AUTHOR("Daniel W. S. Almeida");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.h b/drivers/media/test-drivers/vidtv/vidtv_demod.h
> new file mode 100644
> index 0000000000000..b14957d9d4ea0
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_demod.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * The Virtual DTV test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Change it to Copyright. Same comment on all files in this series.

> + * Based on the example driver written by Emard <emard@softhome.net>
> + */
> +
> +#ifndef VIDTV_DEMOD_H
> +#define VIDTV_DEMOD_H
> +
> +#include <linux/dvb/frontend.h>
> +#include <media/dvb_frontend.h>
> +
> +struct vidtv_demod_cnr_to_qual_s {
> +	/* attempt to use the same values as libdvbv5 */
> +	u32 modulation;
> +	u32 fec;
> +	u32 cnr_ok, cnr_good;

Move cnr_good to a separate line. Describe these variables.
Whatare they for and what they do.

> +};
> +
> +struct vidtv_demod_config {
> +	/* probability of losing the lock due to low snr */
> +	u8 drop_tslock_prob_on_low_snr;
> +	/* probability of recovering when the signal improves */
> +	u8 recover_tslock_prob_on_good_snr;
> +};
> +
> +struct vidtv_demod_state {
> +	struct dvb_frontend frontend;
> +	struct vidtv_demod_config config;
> +	struct delayed_work poll_snr;
> +	enum fe_status status;
> +	u16 tuner_cnr;
> +	bool cold_start;
> +	bool poll_snr_thread_running;
> +	bool poll_snr_thread_restart;
> +};
> +#endif // VIDTV_DEMOD_H
> 

thanks,
-- Shuah
