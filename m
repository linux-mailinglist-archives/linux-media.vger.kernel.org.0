Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8166D57D0C
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 09:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfF0HWd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 03:22:33 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:38441 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726054AbfF0HWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 03:22:32 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id gOjihdZLTF85OgOjlhn7m1; Thu, 27 Jun 2019 09:22:30 +0200
Subject: Re: [PATCH][next][V2] media: vivid: fix potential integer overflow on
 left shift
To:     Colin King <colin.king@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190626144746.27607-1-colin.king@canonical.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8ccbbf10-7af1-b7e3-69ba-a24fe0cda86d@xs4all.nl>
Date:   Thu, 27 Jun 2019 09:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190626144746.27607-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfANbeJQlQrExE+ktB/5E8tv9lBQS7REwX+UJwZtmUixBl4f9PhR5U7hB9pr5F3Nt53oyL7NTFI3n8unEsqNvUatk94MFJChn0g/Hy9AeGz3kF9Cig3bN
 SXmx5RdXGx1qesR6b+yPDV7W77NkHdChWolM7PwzAJWA/nRCDGJfojoFH1om4UpmqHkEoCIfdMQWzLIrSPcGQBBmMuDa0200ujR0qAwqlRdDXIRf6peRY+/E
 kfF3zU/GBQEfYiOQhFXlRFOuG5qn1MNtN6FMD3stlYVAgQkwgoonfNUK7giqL7OUYsLH5hChrruywdv5yJ3EWukWp+woKbpDnVgyYbweB18=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/26/19 4:47 PM, Colin King wrote:
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

Please call this hdmi_input_mask, ditto for the hdmi_output. This is a bitmask,
not an HDMI input index.

We should also use the GENMASK macro here:

	s64 hdmi_input_mask = GENMASK(dev->num_hdmi_inputs - 1, 0);

This is a lot easier to understand.

Regards,

	Hans

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
> 

