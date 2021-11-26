Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B83545F542
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 20:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237455AbhKZTiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 14:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237520AbhKZTgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 14:36:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF418C0613BE;
        Fri, 26 Nov 2021 11:03:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6ED5162339;
        Fri, 26 Nov 2021 19:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAADC9305B;
        Fri, 26 Nov 2021 19:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637953379;
        bh=TuzXVBqhnzassDzQH6WK9CNxr5U+CTB3GUMvwU6qJO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mNDBV3aTr4vMdbD4tMK3jUHRFiVgwF3EjCB99atYiG9m2JSXISezm/V/t5J4fqxxc
         3c06YOlPgG1i4f5a2j4IK1a2CR6nKjZS2RG1QBOeKNvNo2OACG1AkgufcdC52dl2ze
         G0VezTUG3ym1HiKmb4/qSqf1xPfuT75r2wpWYWYrj2khQekVUm4hU5+tmwfq+Urahr
         EBx93tFyR9eIsTaSyeeVBp52LWyWv6/w4rHwZXkQL0oAD5ihHIRwWDfuSBNmBl2j3K
         BzI+nLKzYg/WQ3pYyAEjZMmHjtZa4+focbUy+frrHVg7WFxPoVeyWwmuJxTlP/fevL
         Y5/qWsy3a9dpg==
Date:   Fri, 26 Nov 2021 12:02:54 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/20] media: drxk: drop operation_mode from set_dvbt()
Message-ID: <YaEvXpVHRUXv1xtZ@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <1a2a3fa651a90bd1e4d00318d67bfe0488e98df2.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a2a3fa651a90bd1e4d00318d67bfe0488e98df2.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:08PM +0100, Mauro Carvalho Chehab wrote:
> This var is set, but never used. So, drop it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/dvb-frontends/drxk_hard.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
> index d7fc2595f15b..afa0ac85313f 100644
> --- a/drivers/media/dvb-frontends/drxk_hard.c
> +++ b/drivers/media/dvb-frontends/drxk_hard.c
> @@ -3720,7 +3720,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
>  {
>  	u16 cmd_result = 0;
>  	u16 transmission_params = 0;
> -	u16 operation_mode = 0;
>  	u32 iqm_rc_rate_ofs = 0;
>  	u32 bandwidth = 0;
>  	u16 param1;
> @@ -3760,7 +3759,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
>  	switch (state->props.transmission_mode) {
>  	case TRANSMISSION_MODE_AUTO:
>  	default:
> -		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_MODE__M;
>  		fallthrough;	/* try first guess DRX_FFTMODE_8K */

I think that all these fallthrough annotations in these blocks are
useless now and can be eliminated, as the block contains no code to
fallthrough on.

>  	case TRANSMISSION_MODE_8K:
>  		transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_MODE_8K;
> @@ -3774,7 +3772,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
>  	switch (state->props.guard_interval) {
>  	default:
>  	case GUARD_INTERVAL_AUTO:
> -		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_GUARD__M;
>  		fallthrough;	/* try first guess DRX_GUARD_1DIV4 */
>  	case GUARD_INTERVAL_1_4:
>  		transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_GUARD_4;
> @@ -3795,7 +3792,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
>  	case HIERARCHY_AUTO:
>  	case HIERARCHY_NONE:
>  	default:
> -		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_HIER__M;
>  		/* try first guess SC_RA_RAM_OP_PARAM_HIER_NO */
>  		/* transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_HIER_NO; */
>  		fallthrough;
> @@ -3815,7 +3811,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
>  	switch (state->props.modulation) {
>  	case QAM_AUTO:
>  	default:
> -		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_CONST__M;
>  		fallthrough;	/* try first guess DRX_CONSTELLATION_QAM64 */
>  	case QAM_64:
>  		transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_CONST_QAM64;
> @@ -3858,7 +3853,6 @@ static int set_dvbt(struct drxk_state *state, u16 intermediate_freqk_hz,
>  	switch (state->props.code_rate_HP) {
>  	case FEC_AUTO:
>  	default:
> -		operation_mode |= OFDM_SC_RA_RAM_OP_AUTO_RATE__M;
>  		fallthrough;	/* try first guess DRX_CODERATE_2DIV3 */
>  	case FEC_2_3:
>  		transmission_params |= OFDM_SC_RA_RAM_OP_PARAM_RATE_2_3;
> -- 
> 2.33.1
> 
> 
