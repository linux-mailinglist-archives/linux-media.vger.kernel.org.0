Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFEF57CF8
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 09:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfF0HP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 03:15:59 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:16276 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbfF0HP7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 03:15:59 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 824852034F;
        Thu, 27 Jun 2019 09:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1561619752; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f1/5Z9n4REvDVdHCnPikWKciGEfqNbNYC3LEdIzWTAk=;
        b=u4L4t4wmWvi8iseBfC9qiTLfnSX/ZyjAH4jO+V2ooWNuU7twJVgVwPDTDoptMW5xVg7b42
        a0xVCp+kuWeRa1AwCgyoe5m46CrSTROnC9T5kBzxyWaZ9dO80xpPv/nuvqvDeKtmW8xltV
        Pd1Wfa6+lKdpdXgwvkmzemzsf+VxagbMk8cy4o7TUIRC5+5exIJUm57QYU+PtdI3iH6P4Q
        VXV+1EEgxPosP9mfyQtpyoVlGKXNiVIAmt5OIShvdNEC42YyCGQRYId6jbMOgT08HwaXhm
        tqvjlfXVYjAAPGIYDoE4UM2jPKimEUQFU36Fg6uGT+iT0FByxAWPwzqa70mWbg==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id 4E0A2BEEBD;
        Thu, 27 Jun 2019 09:15:52 +0200 (CEST)
Message-ID: <5D146D28.90204@bfs.de>
Date:   Thu, 27 Jun 2019 09:15:52 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Colin King <colin.king@canonical.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V2] media: vivid: fix potential integer overflow
 on left shift
References: <20190626144746.27607-1-colin.king@canonical.com>
In-Reply-To: <20190626144746.27607-1-colin.king@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[xs4all.nl];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         RCPT_COUNT_FIVE(0.00)[6];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.999,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         FREEMAIL_CC(0.00)[xs4all.nl];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 26.06.2019 16:47, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a potential integer overflow when int 2 is left shifted
> as this is evaluated using 32 bit arithmetic but is being used in
> a context that expects an expression of type s64.  Fix this by
> shifting 2ULL to avoid a 32 bit overflow.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 8a99e9faa131 ("media: vivid: add HDMI (dis)connect RX emulation")
> Fixes: 79a792dafac6 ("media: vivid: add HDMI (dis)connect TX emulation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: wharms <wharms@bfs.de>
 looks less confusing now, thx


> ---
> V2: use intermediate variables for the shifted expression to make code
>     a bit more readable.
> ---
>  drivers/media/platform/vivid/vivid-ctrls.c | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
> index 3e916c8befb7..df1598e81c7a 100644
> --- a/drivers/media/platform/vivid/vivid-ctrls.c
> +++ b/drivers/media/platform/vivid/vivid-ctrls.c
> @@ -1613,6 +1613,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	}
>  
>  	if (dev->num_hdmi_inputs) {
> +		s64 hdmi_input = (2ULL << (dev->num_hdmi_inputs - 1)) - 1;
> +
>  		dev->ctrl_dv_timings_signal_mode = v4l2_ctrl_new_custom(hdl_vid_cap,
>  					&vivid_ctrl_dv_timings_signal_mode, NULL);
>  
> @@ -1633,12 +1635,13 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  			V4L2_CID_DV_RX_RGB_RANGE, V4L2_DV_RGB_RANGE_FULL,
>  			0, V4L2_DV_RGB_RANGE_AUTO);
>  		dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
> -			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0,
> -			(2 << (dev->num_hdmi_inputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_inputs - 1)) - 1);
> +			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0, hdmi_input,
> +			0, hdmi_input);
>  
>  	}
>  	if (dev->num_hdmi_outputs) {
> +		s64 hdmi_output = (2ULL << (dev->num_hdmi_outputs - 1)) - 1;
> +
>  		/*
>  		 * We aren't doing anything with this at the moment, but
>  		 * HDMI outputs typically have this controls.
> @@ -1652,17 +1655,14 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  		dev->ctrl_display_present = v4l2_ctrl_new_custom(hdl_vid_out,
>  			&vivid_ctrl_display_present, NULL);
>  		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
> -			NULL, V4L2_CID_DV_TX_HOTPLUG, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
> +			NULL, V4L2_CID_DV_TX_HOTPLUG, 0, hdmi_output,
> +			0, hdmi_output);
>  		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
> -			NULL, V4L2_CID_DV_TX_RXSENSE, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
> +			NULL, V4L2_CID_DV_TX_RXSENSE, 0, hdmi_output,
> +			0, hdmi_output);
>  		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
> -			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
> +			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0, hdmi_output,
> +			0, hdmi_output);
>  	}
>  	if ((dev->has_vid_cap && dev->has_vid_out) ||
>  	    (dev->has_vbi_cap && dev->has_vbi_out))
