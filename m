Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0336458B2
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 12:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiLGLPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 06:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiLGLPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 06:15:12 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE67333
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 03:14:32 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id vv4so13201753ejc.2
        for <linux-media@vger.kernel.org>; Wed, 07 Dec 2022 03:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sZ+f3Ksmsp99Bl7kbfNvWUpvzYm8UTtSSUzo6HxDGY=;
        b=g4uoWl969SXRUoMbbhzGRY2FQtylrrKnaFIWTWGI0MLbOtOorH+PttL/irIBoz558D
         TV6gHjE2d9Ccu7h6lMr2a/T19evSi4P4lg3YdGpBwDPd+4+Y0adDwupUbOhLFeekWW/w
         VpVuXqwuWcdiZwcF7ByXMjweAOhO6flDo7ouPzuojgcfAoq2dKGfJfNK1UkGSmCONU0g
         ihfbSm2H/FudjoU7m1HA7oHWDcPZK7psndwBNSqNF22891ELkrWgwsnsbAFILP/Bdk7H
         gcaAwHumBuLR1Juor6g3198CNmebhEUJMvqalVK3fAAfikrpKgLQc20vpoX/55YtSh1a
         a7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7sZ+f3Ksmsp99Bl7kbfNvWUpvzYm8UTtSSUzo6HxDGY=;
        b=7cf8+QYBk+u/R6qmuVdvxorQZjwEalKVDhEN/vsAEAi6RBtkkugijZK8RFQf6VpqZ6
         gXqIxA3Skcy+5YkYsWyXMRMQIsARuUEBD2j2QPZKud+8UAZwTm57SEdL0ZrVAad00oof
         2kHVHSK4zMsZeASMYhUpvD39MmWqOA212o5H6bfyGRTH24NwuclYl5BJpCnrV6lWF4LU
         wuHnVolIT/Rh7F1/W8fZBSwTz64tTOqUInSjNRsYw2OQUllp5h5GmVQ9wlYPdP4XssKR
         NT2SeoCTB0AtxSZvrXRibT+L0lv2vHicVN2eLNcE7lZU98pYfnKVR2rCy2q5E8OZ+/bo
         w9ow==
X-Gm-Message-State: ANoB5pkgdZyS/3BalWfkMlsTI2wz06tBkh+VfObr3mfuvF/LLY7Wt5NU
        c7VLNCYKxltpmlysYU5gXRETtiis1ZB5B3KT
X-Google-Smtp-Source: AA0mqf4FlQ6MkNXSCpDC1933Yri+rWlkzis4vlakG712q2/J/8bkkshaiVdzptnOorFnjXEkNvEMCQ==
X-Received: by 2002:a17:906:e93:b0:7c1:27b:d597 with SMTP id p19-20020a1709060e9300b007c1027bd597mr7823822ejf.249.1670411670892;
        Wed, 07 Dec 2022 03:14:30 -0800 (PST)
Received: from [10.0.0.215] (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id la9-20020a170907780900b007c0baedc9d0sm6440575ejc.95.2022.12.07.03.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 03:14:30 -0800 (PST)
Message-ID: <081cc2d3-1f3a-6c14-6dc7-53f976be7b2b@gmail.com>
Date:   Wed, 7 Dec 2022 12:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     linux-media@vger.kernel.org
Cc:     francesco.dolcini@toradex.com, marcel.ziswiler@toradex.com,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
From:   Aishwarya Kothari <aishwaryakothari47@gmail.com>
Subject: Issue with ov5640 camera sensor on apalis imx6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I was trying ov5640 camera sensor with the mainline BSP 6.0.0-rc3 kernel 
and it fails to works, while it works quiet well on v5.18. When I 
bisect, it points out to this commit 1f391df4 (media: v4l2-async: Use 
endpoints in __v4l2_async_nf_add_fwnode_remote()) by Laurent Pinchart 
and this is what it says in the logs :

[    4.291355] imx-ipuv3-csi imx-ipuv3-csi.0: Registered ipu1_csi0 
capture as /dev/video0
[    4.305228] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpenc capture 
as /dev/video1
[    4.317974] imx-ipuv3 2400000.ipu: Registered ipu1_ic_prpvf capture 
as /dev/video2
[    4.331039] imx-ipuv3-csi imx-ipuv3-csi.1: Registered ipu1_csi1 
capture as /dev/video3
[    4.344255] imx-ipuv3-csi imx-ipuv3-csi.4: Registered ipu2_csi0 
capture as /dev/video4
[    4.356940] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpenc capture 
as /dev/video5
[    4.369322] imx-ipuv3 2800000.ipu: Registered ipu2_ic_prpvf capture 
as /dev/video6
[    4.382119] imx-ipuv3-csi imx-ipuv3-csi.5: Registered ipu2_csi1 
capture as /dev/video7
[    4.395455] imx6-mipi-csi2 21dc000.mipi: Consider updating driver 
imx6-mipi-csi2 to match on endpoints
[    4.414971] stmpe-adc stmpe-adc: DMA mask not set

So, now when I try to revert the change done by this commit, it still 
fails. I assume there are a lot more changes following the commit that 
could lead to this failure. Below are the logs.
Is there a way to get it to work without reverting any changes? Or Is 
there something I'm missing or have to do any changes in the 
corresponding files to get it to work?

TDX Wayland with XWayland Upstream 6.1.0-devel-20221109+build.104 
(kirkstone) apalis-imx6-10774951 ttymxc0
Apalis-iMX6_Reference-Multimedia-Image-upstream

apalis-imx6-10774951 login: root
root@apalis-imx6-10774951:~# cat ov5640.sh
media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
# Configure pads
media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/1920x1080 field:none]"
media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/1920x1080 field:none]"
media-ctl -V "'ipu1_csi1':2 [fmt:AYUV32/1920x1080 field:none]"
root@apalis-imx6-10774951:~# sh ov5640.sh
root@apalis-imx6-10774951:~# gst-launch-1.0 v4l2src device='/dev/video3' 
! videoconvert ! waylandsink
[   56.031510] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
[   56.649032] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
Setting pipeline to PAUSED ...
[   57.082630] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed 
to allocate required memory.
Additional debug info:
../gst-plugins-good-1.20.3/sys/v4l2/gstv4l2src.c(759): 
gst_v4l2src_decide_allocation (): 
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.119459642
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Internal 
data stream error.
Setting pipeline to NULL ...
Additional debug info:
../gstreamer-1.20.3/libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop 
(): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)
Freeing pipeline ...
root@apalis-imx6-10774951:~# v4l2-ctl --device /dev/video3 --stream-mmap 
--stream-to=x.raw --stream-count=1
[ 1124.339793] ov5640 1-003c: ov5640_write_reg: error: reg=3008, val=2
            VIDIOC_STREAMON returned -1 (Broken pipe)


Kind regards,
Aishwarya
