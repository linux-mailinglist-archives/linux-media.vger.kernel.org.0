Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B6C5688EC
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 15:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbiGFNER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 09:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233666AbiGFNEP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 09:04:15 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE3917E1C
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 06:04:13 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id f23so2739337ejc.4
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f2/mUOr0gTl6SXAbRBnUVAHRE4EPMFdpWejExlnSr54=;
        b=rP/2iM0bqmBq3a+3k4rxNb99AeMHX2fXiDb4ec6n3foKAldI1dus3xCmwF+or8H4jT
         wq93Zv2acqK2qVbQE1Q+tRRFes2ikewCV7rwvtZsOvid0iKLPiAjy2rhXADGVX9SjYlz
         1CH/1GZLWx6JPKncQ82+iRiH6tPAiOVaA79YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f2/mUOr0gTl6SXAbRBnUVAHRE4EPMFdpWejExlnSr54=;
        b=Wts2iUTjDcMakbhU/2BFDId7q6PYUR3UDQmV8nd7bZsCTMBfV980LZL6j0Jb2WhpL/
         PteDV69U8/oGlQLBPYRKoNgCic7yiiXT6DHNizRBpJKBqVvuqExqhAIyVb4EAxU7Pv8C
         T0sId4bTpsifX8Yovmgsf+tXbFkRFJv9QsXRHNAwgwSIvXPspE1ncUyCMD/O6A4R6dvJ
         G2jjD4YoQoNz0wRpyU2lcer4W4ukzCmzYL+30VtpnnB033Z04rivUMRyLsvzunY5Ys+T
         ybD19XyiYvRqKdq2o/JM9y/S/m5q8nEn+3VLvDv8miKWW0W0U0XHzfYCYHS94HZkpYhz
         TtHw==
X-Gm-Message-State: AJIora/ojrkROiKM1s2pFlEOyRoiECnrOhv8yVHB1E1/xYakhyrTa+3Z
        TFEP7H/3vo0pQkesJp2Zxapd43/GeLhPNA==
X-Google-Smtp-Source: AGRyM1sgch215n+OZA+Guy7kqZzRn0yOWdPl58aUEvvbUqcnO4iTRwQHrznxevAIYNpkxBHwS2FVdg==
X-Received: by 2002:a17:907:2717:b0:72a:fbc7:fdbe with SMTP id w23-20020a170907271700b0072afbc7fdbemr2235392ejk.658.1657112652180;
        Wed, 06 Jul 2022 06:04:12 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id au8-20020a170907092800b00722e19fec6dsm17234222ejc.156.2022.07.06.06.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 06:04:11 -0700 (PDT)
Date:   Wed, 6 Jul 2022 16:07:16 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsWJBEPhp9WhiYe1@p310.k.g>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <12352558.O9o76ZdvQC@steina-w>
 <YsRVAV8a48CwpaSY@p310.k.g>
 <2450654.irdbgypaU6@steina-w>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="wy3JSs4y4eSIwAxe"
Content-Disposition: inline
In-Reply-To: <2450654.irdbgypaU6@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--wy3JSs4y4eSIwAxe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22-07-06 08:18:20, Alexander Stein wrote:
> 
> Thanks! Indeed at a first glance it looks straight forward. I was trying to 
> get an imx327 running on a imx8mm, called TQMa8MxML. See [1] for some details. 
> The cover letter describes the config setup. The media-ctl commands might help 
> your setup. Note the settle times are an ugly bitch and are crucial to be set 
> on my board, but I'm not sure why they have to be that way. Patch 1-8 are 
> obsolete by now with the updates to drivers/media/platform/nxp/ 
> imx-mipi-csis.c. Patch 9 might help you configure the DT.

Right, media-ctl is it.  In fact the pipelines have been properly set up so i 
only had to change the format.  The attached media graph is below

Now, there are two problems i'm stumbling upon.  One is related to the capture 
device not actually supporting imx492 format(s), which are:

	MEDIA_BUS_FMT_SGBRG10_1X10
	MEDIA_BUS_FMT_SGBRG12_1X12

which i guess is why i am being greeted with (when using v4l2-ctl):

	imx7-csi 32e20000.csi: capture format not valid

When i manually force it to something that is actually supported, 
MEDIA_BUS_FMT_SGBRG16_1X16, i get:

	imx7-csi 32e20000.csi: pipeline start failed with -67

Since this isn't one of the usual error numbers i guess it comes from within the 
driver code.  I might be getting this error because the source is 12 bit while 
the sink is 16 and i am breaking something, dunno.

Shall i go ahead and add MEDIA_BUS_FMT_SGBRG12_1X12 to the capture driver or i 
am missing something here?


The other problem is when v4l2 tries to allocate buffer for even a single frame.  
This is 8192x5556 10/12bit bayer sensor and, maybe not surprisingly i get 
"buffer allocation failed".  Is it possible that i'm the first to step on this 
issue on imx8m-mini or in general?


thanks,
Petko

--wy3JSs4y4eSIwAxe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=media-graph

Media controller API version 5.19.0

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial          
bus info        platform:32e20000.csi
hw revision     0x0
driver version  5.19.0

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	pad0: Sink
		[fmt:SGBRG12_1X12/4096x2048 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
		<- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
	pad1: Source
		[fmt:SGBRG12_1X12/4096x2048 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
		-> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
	pad0: Sink
		<- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
	pad0: Sink
		[fmt:SGBRG12_1X12/4096x2048 field:none]
		<- "imx492 1-0010":0 []
	pad1: Source
		[fmt:SGBRG12_1X12/4096x2048 field:none]
		-> "csi":0 [ENABLED,IMMUTABLE]

- entity 15: imx492 1-0010 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
	pad0: Source
		[fmt:SGBRG12_1X12/4096x2048 field:none colorspace:raw xfer:none]
		-> "csis-32e30000.mipi-csi":0 []


--wy3JSs4y4eSIwAxe--
