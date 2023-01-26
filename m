Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E311E67C5CC
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 09:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236001AbjAZIcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 03:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235972AbjAZIcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 03:32:47 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B605E6A33B
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 00:32:39 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id w11so1241891edv.0
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 00:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+dNfuQD8R0OH1NRN4QQMGdpi2c3Ohq29FUGmeUeM6v0=;
        b=ADdFce1tt5QpaiY3ES4FU/cV7fSxaLZx52GpHGCuQLhgP5wr/fe9Y2Z4knOddsYGcs
         byIStlk4kW7IdL0pup9Le91exoJfOYaKc2FGdDKgQwHILBUHtPFueSwRX5PCsqXqbXs2
         ubQWNd4OUWAwLv1i7/QjxB9AOa5Z4ZzHqYIJ1ueuiqjSGYzU2ZhonUpGXrONWOn7KVO4
         xVQzOthLFWoGipcL/GTxu26C1PZ3Ij2XQvcOqAkaObyGEiuP+4HVVCfmA7uZb1kwa3yS
         WoXwxxWuNtPnfPiD84zx8hkUM7lHESKjC/unvNA/Q360ES7Cgw9+KLiato/YPsVCuoo3
         r4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dNfuQD8R0OH1NRN4QQMGdpi2c3Ohq29FUGmeUeM6v0=;
        b=MguFLmI8ZRL7RJwQu0K1XJUOivEkioSOPLbSmbGwlv+2uJ0BqbwHPcEp8rfs1dYBva
         57a5/HIlwa5u6OpVr6W5csm834oEEbp/6vbvsegMTHKA/lEFnXlsyU+BMJwAe/AF4mMx
         OOHjcoc9DWJwuNJUg930opJrD8IqthP4xgxRIds94ObCm06aQI8N+muHVL0ARXYbHpXA
         ydLc0GTbFhZUcfAU/wy4hMK+uo9zComwekP/IMQ73be7fUSi+JUptBSjvJqzLfPQ3KXi
         DChTsVhUNiQY+UzkDJcsCZdtnQ+XWUxPqRMyuZ/z4t81zhqCAEfo3vuYk2ABtUoKLQD/
         Svvw==
X-Gm-Message-State: AFqh2kqHJJ45p9WFpQ3HMdRU7U5EHAaLCg45QjFoEPZjsRsLIFI6XUBq
        9votYhF3AmpH5OPRkDKGYNc=
X-Google-Smtp-Source: AMrXdXs2JZt6IHXy7Vt4oyB4bsHDvQd01MApDhi4HjAniTw15k9NDoVLeiJKZB5mgYnbcHZFRdixuA==
X-Received: by 2002:a05:6402:28c6:b0:498:f2d:f52e with SMTP id ef6-20020a05640228c600b004980f2df52emr37688077edb.21.1674721958148;
        Thu, 26 Jan 2023 00:32:38 -0800 (PST)
Received: from [10.0.0.215] (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id f5-20020a056402068500b0046dd0c2a08esm394387edy.36.2023.01.26.00.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:32:37 -0800 (PST)
Message-ID: <cacfe146-101b-35b3-5f66-1a1cabfd342f@gmail.com>
Date:   Thu, 26 Jan 2023 09:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Content-Language: en-US
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        francesco.dolcini@toradex.com, marcel.ziswiler@toradex.com
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <Y8afrhfjw+EhAH4o@paasikivi.fi.intel.com>
 <Y8aivWrN6Hg/O7Wr@pendragon.ideasonboard.com>
 <d45fa085-ce6f-2141-fba9-ac4e6094ef2a@gmail.com>
 <20230120163311.GA15915@pengutronix.de>
From:   Aishwarya Kothari <aishwaryakothari75@gmail.com>
In-Reply-To: <20230120163311.GA15915@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On 20.01.23 17:33, Philipp Zabel wrote:
> Hi,
> 
> On Wed, Jan 18, 2023 at 02:14:54PM +0100, Aishwarya Kothari wrote:
> [...]
>> I stumbled over the commit 1f391df44607 ("media: v4l2-async: Use endpoints
>> in __v4l2_async_nf_add_fwnode_remote()") and started this discussion :
>> https://lore.kernel.org/linux-media/Y8AIRPd4RFYmssal@valkosipuli.retiisi.eu/
>>
>> I applied this patch on top of the commit c1649ec55708.The hardware used is
>> Apalis iMX6 (i.MX 6Q) with ov5640 mipi-csi2 camera.
>>
>> The /dev/media0 is created and pipeline was configured using below script :
>> root@apalis-imx6-10774951:~# cat ov5640.sh
>> media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
>> media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
>> media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
>> # Configure pads
>> media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
>> media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
>> media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
>>
>> But it gives the following error when trying to set up the pipeline:
>>
>> [   37.211276] ipu1_csi1: entity ov5640 1-003c does not implement
>> get_mbus_config()
>> [   37.218872] ipu1_csi1: failed to get upstream media bus configuration
>>
>> When adding the missing functionality as follows:
>>
>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>> index e0f908af581b..618c677ec89b 100644
>> --- a/drivers/media/i2c/ov5640.c
>> +++ b/drivers/media/i2c/ov5640.c
>> @@ -3733,6 +3733,17 @@ static int ov5640_init_cfg(struct v4l2_subdev *sd,
>>          return 0;
>>   }
>>
>> +static int ov5640_get_mbus_config(struct v4l2_subdev *sd,
>> +                                  unsigned int pad,
>> +                                  struct v4l2_mbus_config *cfg)
>> +{
>> +       cfg->type = V4L2_MBUS_CSI2_DPHY;
>> +       cfg->bus.mipi_csi2.num_data_lanes = 1;
> 
> Isn't OV5640 dual-lane by default?

Thank you for pointing this out, I updated the number of data lanes to 2 
in this function and applied your patch and everything works now.

I tested on top of v6.2-rc5 on an Apalis iMX6Q with an ov5640 camera.
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com>

> 
>> +       cfg->bus.mipi_csi2.flags = 0;
>> +
>> +       return 0;
>> +}
>> +
>>   static const struct v4l2_subdev_core_ops ov5640_core_ops = {
>>          .log_status = v4l2_ctrl_subdev_log_status,
>>          .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>> @@ -3753,6 +3764,7 @@ static const struct v4l2_subdev_pad_ops ov5640_pad_ops
>> = {
>>          .get_selection = ov5640_get_selection,
>>          .enum_frame_size = ov5640_enum_frame_size,
>>          .enum_frame_interval = ov5640_enum_frame_interval,
>> +       .get_mbus_config = ov5640_get_mbus_config,
>>   };
>>
>>   static const struct v4l2_subdev_ops ov5640_subdev_ops = {
>>
>> The script was executed correctly without any errors and the links were
>> created. Now when running the Gstreamer it gives the below output :
>>
>> root@apalis-imx6-10774951:~# gst-launch-1.0 v4l2src device='/dev/video3' !
>> videoconvert ! waylandsink
>> Setting pipeline to PAUSED ...
>> Pipeline is live and does not need PREROLL ...
>> Pipeline is PREROLLED ...
>> Setting pipeline to PLAYING ...
>> New clock: GstSystemClock
>> [  192.526110] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor driver
>> bug, expect capture failures.
>> [  192.535550] imx6-mipi-csi2: phy_state = 0x00000200
> 
> This is timing out in the imx6-mipi-csi2 driver, waiting for OV5640 to
> signal the LP-11 stop state on lane 0 (phy_state bit 4).
> 
>> [  192.833456] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
> 
> A write to the SYS_CTRL0 register failed, presumably trying to clear the
> software reset or power down bits. Could this be the reason that OV5640
> doesn't put the MIPI CSI-2 link into LP-11 as expected?
> 
> All further errors follow from the timeout above.
> 
> [...]
>> While going through the dmesg kernel logs I found this :
>>
>>      4.333202] imx6-mipi-csi2 21dc000.mipi: Consider updating driver
>> imx6-mipi-csi2 to match on endpoints
>> [    4.347001] imx6-mipi-csi2 21dc000.mipi: Consider updating driver
>> imx6-mipi-csi2 to match on endpoints
>> [    5.173588] video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider updating
>> driver video-mux to match on endpoints
> 
> These shouldn't cause any issue. These drivers should be updated
> to set the subdev->fwnode field to an endpoint fwnode before calling
> v4l2_async_register_subdev().
> 
> regards
> Philipp
> 

Kind regards,
Aishwarya
