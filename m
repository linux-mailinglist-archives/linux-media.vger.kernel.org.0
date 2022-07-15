Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEDD8575EAA
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 11:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbiGOJfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 05:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiGOJfV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 05:35:21 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F9F7B7BD
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 02:35:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y4so5569898edc.4
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qz1vaI806twjHVRbeoVX2v+eCO93gVEBsIYf7vs9iMo=;
        b=dVMZ0dpveVKCqU1iCzIbWnHOZf4iaSOdcHDy3GCFIY3ElZcU/HpW4hb9xhncDHC8ep
         /TxUBWxioaJXT7zXMVUzx3UpLMimy/0TECfbR830LA6bwg2m9qxBgLzjhpDPFqMhLfEF
         gqVDhKm0Ik/0NWpekDeG20LJFIuQg+kaX+omY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qz1vaI806twjHVRbeoVX2v+eCO93gVEBsIYf7vs9iMo=;
        b=05pO6TDX0TljjVQtBm4NX1nIYz+rABGvPgnlXcZdC++GXv9erm7exMGAaYYUhm5qCT
         w60qx/8fH14bjQTXZpMI7Eap+JuGj0B/U2YzCeWJR5Nxxz24QKV+3oSX8ayyViGfuKTk
         9Pmknz26JzBsf1sOwJR0Nrap1We1yB5EEaqmwx0UormeObU02vD/koc3LZrdkZf5QBoi
         0kagVU6nfqGF0zMIb2+plOvgfVbCjRamThSdaWK+oc5fVFGXWx5noC6qnz6IZBMqqvGV
         w8gpCpkPDGLO+FiT6YpF9w/qOtD5O9xqMkbcAQINH0ex95rF7xT5AakodP5yJy4WCeuA
         2ZWQ==
X-Gm-Message-State: AJIora9FGNbfRrmHJwpga9aiz1JbUEFA7AL76bK56riBSmXACm15BGcF
        cQYzOkfAdKi7BaOy3Tn1NNpOXw5MjTLihA==
X-Google-Smtp-Source: AGRyM1v/FF04Lg+9GEW9eFE/WizVpBNK2itanZ85z1pcFV4GmAFQvSc4ARpc7UhfexsYqn5+zS4hvA==
X-Received: by 2002:a05:6402:274c:b0:43a:9204:95fb with SMTP id z12-20020a056402274c00b0043a920495fbmr17977101edd.259.1657877718604;
        Fri, 15 Jul 2022 02:35:18 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id q10-20020a1709063d4a00b0072b3182368fsm1804936ejf.77.2022.07.15.02.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 02:35:17 -0700 (PDT)
Date:   Fri, 15 Jul 2022 12:38:36 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: properly set test pattern to a sub-device
Message-ID: <YtE1nHBo2aQ7k+sB@p310.k.g>
References: <YtA0oTgCRlRP8K53@p310.k.g>
 <165784088978.3944957.6816198396634347236@Monstersaurus>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zwwx0yeiznfSMct4"
Content-Disposition: inline
In-Reply-To: <165784088978.3944957.6816198396634347236@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zwwx0yeiznfSMct4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22-07-15 00:21:29, Kieran Bingham wrote:
> 
> As I understand it - it shouldn't be happening, so I suspect it's something in 
> your CSI2 receiver driver initialising some defaults perhaps.

I've attached 'media-ctl -p' output for clarity.  This is imx8m-mini based board 
on 5.19.0-rc6.

When selecting a test pattern with:

	v4l2-ctl -d /dev/v4l-subdev2 --set-ctrl=test_pattern=2

I get this from v4l2-ctl:

	VIDIOC_S_EXT_CTRLS: failed: Invalid argument
	test_pattern: Invalid argument

but the fun part is that my .s_ctrl() routine receives V4L2_CID_TEST_PATTERN and 
ctrl->val is indeed 2, hence i'm setting sensor registers according to this 
data.

I (falsely) assumed this would be a 'sticky' attribute so when i ask the 
receiver driver (/dev/video0) to start streaming, it wouldn't change the test 
pattern value under my feet.  Instead the imx492 driver once again receive 
V4L2_CID_TEST_PATTERN, this time with ctrl->val == 0, which kind of ruins all 
the fun.

Following you advice, i tried to find which CSI2 driver might be the culprit. 
None of the relevant drivers in drivers/staging/media/imx have v4l2_ctrl_ops 
callback registered.  If that's what i am supposed to look for, which now seems 
unlikely.

Do you have other recommendations about what (and where) should i look next?


		Petko

--zwwx0yeiznfSMct4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=mctl

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
		[fmt:SGBRG12_1X12/8192x4320 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
		<- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
	pad1: Source
		[fmt:SGBRG12_1X12/8192x4320 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
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
		[fmt:SGBRG12_1X12/8192x4320 field:none colorspace:raw]
		<- "imx492 1-0010":0 [ENABLED]
	pad1: Source
		[fmt:SGBRG12_1X12/8192x4320 field:none colorspace:raw]
		-> "csi":0 [ENABLED,IMMUTABLE]

- entity 15: imx492 1-0010 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
	pad0: Source
		[fmt:SGBRG12_1X12/8192x4320 field:none colorspace:raw xfer:none]
		-> "csis-32e30000.mipi-csi":0 [ENABLED]


--zwwx0yeiznfSMct4--
