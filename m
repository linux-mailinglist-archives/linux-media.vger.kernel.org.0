Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D04C866D9B8
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 10:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236150AbjAQJVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 04:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235952AbjAQJUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 04:20:51 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF2B39CF7
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 01:15:10 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30H9Ebbh121465;
        Tue, 17 Jan 2023 03:14:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1673946877;
        bh=gnYJuGskxNbRgtPBoC2dG0gyQ+nDidUztusEmYgE6xs=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=rLQalGSb1V3bJQusDoy64x7D9LNk3VdqRiIaqUGDdgwblPvREM6z/adTuI2nSrCa9
         l1C0/vs3HMKmDYqlRC4RDlH0iYS/Pru0827R636IL0IYnZyOUPGmv2jkNybeF3dG7Q
         5EL7BGtjV9UGg45ow6PCZfD4ERwhCpNKWFlib8FM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30H9Ebkq116899
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Jan 2023 03:14:37 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 17
 Jan 2023 03:14:37 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 17 Jan 2023 03:14:37 -0600
Received: from [172.24.145.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30H9EX8G125601;
        Tue, 17 Jan 2023 03:14:33 -0600
Message-ID: <3e040760-1daa-113d-e8f5-00bcc64c2bae@ti.com>
Date:   Tue, 17 Jan 2023 14:44:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] media: ov5640: Fix analogue gain control
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
CC:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <aford173@gmail.com>, <festevam@gmail.com>,
        <eddy.khan@vergesense.com>, <paul.kocialkowski@bootlin.com>,
        <eugen.hristev@microchip.com>
References: <20221128080201.15104-1-laurent.pinchart@ideasonboard.com>
From:   Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20221128080201.15104-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the patch.

On 28/11/22 13:32, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
> 
> Gain control is badly documented in publicly available (including
> leaked) documentation.
> 
> There is an AGC pre-gain in register 0x3a13, expressed as a 6-bit value
> (plus an enable bit in bit 6). The driver hardcodes it to 0x43, which
> one application note states is equal to x1.047. The documentation also
> states that 0x40 is equel to x1.000. The pre-gain thus seems to be
> expressed as in 1/64 increments, and thus ranges from x1.00 to x1.984.
> What the pre-gain does is however unspecified.
> 
> There is then an AGC gain limit, in registers 0x3a18 and 0x3a19,
> expressed as a 10-bit "real gain format" value. One application note
> sets it to 0x00f8 and states it is equal to x15.5, so it appears to be
> expressed in 1/16 increments, up to x63.9375.
> 
> The manual gain is stored in registers 0x350a and 0x350b, also as a
> 10-bit "real gain format" value. It is documented in the application
> note as a Q6.4 values, up to x63.9375.
> 
> One version of the datasheet indicates that the sensor supports a
> digital gain:
> 
>    The OV5640 supports 1/2/4 digital gain. Normally, the gain is
>    controlled automatically by the automatic gain control (AGC) block.
> 
> It isn't clear how that would be controlled manually.
> 
> There appears to be no indication regarding whether the gain controlled
> through registers 0x350a and 0x350b is an analogue gain only or also
> includes digital gain. The words "real gain" don't necessarily mean
> "combined analogue and digital gains". Some OmniVision sensors (such as
> the OV8858) are documented as supoprting different formats for the gain
> values, selectable through a register bit, and they are called "real
> gain format" and "sensor gain format". For that sensor, we have (one of)
> the gain registers documented as
> 
>    0x3503[2]=0, gain[7:0] is real gain format, where low 4 bits are
>    fraction bits, for example, 0x10 is 1x gain, 0x28 is 2.5x gain
> 
>    If 0x3503[2]=1, gain[7:0] is sensor gain format, gain[7:4] is coarse
>    gain, 00000: 1x, 00001: 2x, 00011: 4x, 00111: 8x, gain[7] is 1,
>    gain[3:0] is fine gain. For example, 0x10 is 1x gain, 0x30 is 2x gain,
>    0x70 is 4x gain
> 
> (The second part of the text makes little sense)
> 
> "Real gain" may thus refer to the combination of the coarse and fine
> analogue gains as a single value.

LGTM.

In another Omnivision sensor (OV2312), they refer the same register pair 
as both "analogue gain" and "real gain" at different places in the 
datasheet - and it has separate digital gain registers as well.

> 
> The OV5640 0x350a and 0x350b registers thus appear to control analogue
> gain. The driver incorrectly uses V4L2_CID_GAIN as V4L2 has a specific
> control for analogue gain, V4L2_CID_ANALOGUE_GAIN. Use it.
> 
> If registers 0x350a and 0x350b are later found to control digital gain
> as well, the driver could then restrict the range of the analogue gain
> control value to lower than x64 and add a separate digital gain control.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Jai Luthra <j-luthra@ti.com>

> ---
>   drivers/media/i2c/ov5640.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 2d740397a5d4..c65c391bc1eb 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3458,7 +3458,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>   	/* Auto/manual gain */
>   	ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
>   					     0, 1, 1, 1);
> -	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
> +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
>   					0, 1023, 1, 0);
>   
>   	ctrls->saturation = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION,
