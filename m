Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42A16FC968
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 16:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbjEIOrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 10:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233962AbjEIOrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 10:47:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DD612B
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 07:47:05 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-96649b412easo460545666b.0
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683643624; x=1686235624;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9NT8ykb9UPV2Yfzqbuf42dwLjWPtwuVf70ug1bnf2U=;
        b=VSM7cFa7m7y9SuKY15Q+fhJptaImMVjjFGVdw+g9rSgwl2gwibQtBh2l7uTQwjMadK
         nU1yPt5kL0iApBZyNUlCR66UHZoSgdirOcn6nU/tQYlwWpnRGXVf8YP2g86RmHJIYhL9
         45CSOzS/OpYfbZRW1jz6uLprl8W0H6fWz71euZyhINMSQFX5lSQLLOCpF/C0DkVyqTW6
         4oM/pv6Jkakf9e21ONS8m5Y4lnXv2m75KzXMRi6cdQot76jspbuwGznx0zJq8ntPI7hH
         vEpqjUjSMDVL1FvAv2eS0BgKtB/Yzv6LzdrlLqO90ykhx+bCmi7HSC7HVaBBGMBi/52H
         cfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683643624; x=1686235624;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q9NT8ykb9UPV2Yfzqbuf42dwLjWPtwuVf70ug1bnf2U=;
        b=CP6k77j3M6sNZTL1RhFp3nCNKv70pzDpCt3/AxJSa/hGxQdmbKNVZ2A2uWQlcwlvjX
         cK2oyAz7+ItiVoQPLPBswWEJ3hAtn6zWQpBI7X3+cO5GXAWzK/CI7YmZGKSiRYGRh3xg
         gX+G+lRUPk5Q2Kj6HKd4F6W0v3FzqdyjcCjkyFSYZwa60iECbQ36SKIHNxB89H7Nc49h
         HNzRfYXXLIlKlvJ2fATA2E9P2rhf88aIZnu1OzZtVR3/fRYTrmOo+akLWpbs8S+CLJGJ
         eFY5wpRlQor/iLSgTuDLqz43pbuMGFy0Oig6kkoVQMto8/zr5eskCUPtX1kUvlv7c77z
         8Clg==
X-Gm-Message-State: AC+VfDwGUJ7hGn8JmHKDYzstC4vG0u3EqhoCEollWVe/tEHEy64HqezX
        1IzC8C/Qh8Ky4AbhyKUdLPjDF2sWBhc=
X-Google-Smtp-Source: ACHHUZ4DVmlPnirnUphsT5HzFhjNcwc8DhBMW+UCAVZ45WkD2VI9HjX8u55CKxKBB66nhuUhy1kRiw==
X-Received: by 2002:a17:907:9810:b0:969:f677:11b4 with SMTP id ji16-20020a170907981000b00969f67711b4mr2233661ejc.37.1683643623639;
        Tue, 09 May 2023 07:47:03 -0700 (PDT)
Received: from [10.0.0.215] (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id q10-20020a170906388a00b0095386574c81sm1405044ejd.51.2023.05.09.07.47.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 07:47:03 -0700 (PDT)
Message-ID: <5f8ffbb2-7c61-c495-c378-292514f6be8f@gmail.com>
Date:   Tue, 9 May 2023 16:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
From:   Aishwarya Kothari <aishwaryakothari75@gmail.com>
Subject: Issues with HDMI-CSI2 TC358743 driver
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

TC358743 is a chip that captures HDMI signals and sends it over CSI2.
I'm working on Apalis iMX6 with the mainline BSP 6.2.0 kernel with which 
i'm not able to capture the video.
I followed the below steps:
1) v4l2-ctl --device=/dev/v4l-subdev15 --set-edid file=1080P60EDID.txt 
--fix-edid-checksums
2) run this script to form the pipeline :
media-ctl --links "'tc358743 1-000f':0->'imx6-mipi-csi2':0[1]"
media-ctl --links "'imx6-mipi-csi2':1->'ipu1_csi0_mux':0[1]"
media-ctl --links "'ipu1_csi0_mux':2->'ipu1_csi0':0[1]"
media-ctl --links "'ipu1_csi0':2->'ipu1_csi0 capture':0[1]"
media-ctl --set-dv "'tc358743 1-000f':0"
media-ctl --set-v4l2 "'tc358743 1-000f':0[fmt:UYVY8_1X16/1280x720]"
media-ctl --set-v4l2 "'imx6-mipi-csi2':1[fmt:UYVY8_1X16/1280x720]"
media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY8_1X16/1280x720]"
media-ctl --set-v4l2 "'ipu1_csi0':0[fmt:UYVY8_1X16/1280x720]"
media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:UYVY8_1X16/1280x720]"
3) The below commands fail :

root@apalis-imx6-10774951:~# v4l2-ctl --stream-mmap -d /dev/video0
[  216.963413] imx-ipuv3-csi imx-ipuv3-csi.0: capture format not valid
		VIDIOC_STREAMON returned -1 (Broken pipe)

or

root@apalis-imx6-10774951:~# gst-launch-1.0 v4l2src device='/dev/video0' 
! videoconvert ! waylandsink
Setting pipeline to PAUSED ...
Pipeline is live and does not nee[  279.222350] imx-ipuv3-csi 
imx-ipuv3-csi.0: failed to get src_sd format
d PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Internal 
data stream error.
Additional debug info:
../gstreamer-1.20.3/libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop 
(): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)
Execution ended after 0:00:00.008354813
Setting pipeline to NULL ...
Freeing pipeline ...

4) The log status looks as follows:

root@apalis-imx6-10774951:~# v4l2-ctl --log-status -d /dev/v4l-subdev15
Status Log:

    [  827.988944] tc358743 1-000f: =================  START STATUS 
=================
    [  827.999859] tc358743 1-000f: -----Chip status-----
    [  828.006018] tc358743 1-000f: Chip ID: 0x00
    [  828.011387] tc358743 1-000f: Chip revision: 0x00
    [  828.016167] tc358743 1-000f: Reset: IR: 1, CEC: 1, CSI TX: 0, HDMI: 0
    [  828.022703] tc358743 1-000f: Sleep mode: off
    [  828.027195] tc358743 1-000f: Cable detected (+5V power): yes
    [  828.034139] tc358743 1-000f: DDC lines enabled: yes
    [  828.041060] tc358743 1-000f: Hotplug enabled: yes
    [  828.047086] tc358743 1-000f: CEC enabled: no
    [  828.051389] tc358743 1-000f: -----Signal status-----
    [  828.056492] tc358743 1-000f: TMDS signal detected: yes
    [  828.061708] tc358743 1-000f: Stable sync signal: yes
    [  828.066783] tc358743 1-000f: PHY PLL locked: yes
    [  828.071430] tc358743 1-000f: PHY DE detected: yes
    [  828.090507] tc358743 1-000f: Detected format: 1280x720p60.00 
(1650x750)
    [  828.097227] tc358743 1-000f: horizontal: fp = 0, -sync = 370, bp = 0
    [  828.103899] tc358743 1-000f: vertical: fp = 0, -sync = 30, bp = 0
    [  828.110088] tc358743 1-000f: pixelclock: 74250000
    [  828.114914] tc358743 1-000f: flags (0x0):
    [  828.118982] tc358743 1-000f: standards (0x0):
    [  828.123464] tc358743 1-000f: Configured format: 1280x720p60.00 
(1650x750)
    [  828.130351] tc358743 1-000f: horizontal: fp = 0, -sync = 370, bp = 0
    [  828.136835] tc358743 1-000f: vertical: fp = 0, -sync = 30, bp = 0
    [  828.142959] tc358743 1-000f: pixelclock: 74250000
    [  828.147754] tc358743 1-000f: flags (0x0):
    [  828.151795] tc358743 1-000f: standards (0x0):
    [  828.156263] tc358743 1-000f: -----CSI-TX status-----
    [  828.161258] tc358743 1-000f: Lanes needed: 2
    [  828.165620] tc358743 1-000f: Lanes in use: 2
    [  828.171334] tc358743 1-000f: Waiting for particular sync signal: no
    [  828.178908] tc358743 1-000f: Transmit mode: no
    [  828.187628] tc358743 1-000f: Receive mode: no
    [  828.193422] tc358743 1-000f: Stopped: no
    [  828.197389] tc358743 1-000f: Color space: YCbCr 422 16-bit
    [  828.206541] tc358743 1-000f: -----HDMI status-----
    [  828.211373] tc358743 1-000f: HDCP encrypted content: no
    [  828.216761] tc358743 1-000f: Input color space: RGB limited range
    [  828.224550] tc358743 1-000f: AV Mute: off
    [  828.229628] tc358743 1-000f: Deep color mode: 8-bits per channel
    [  828.240354] tc358743 1-000f: HDMI infoframe: Auxiliary Video 
Information (AVI), version 2, length 13
    [  828.249632] tc358743 1-000f:     colorspace: RGB
    [  828.254407] tc358743 1-000f:     scan mode: No Data
    [  828.259318] tc358743 1-000f:     colorimetry: No Data
    [  828.264479] tc358743 1-000f:     picture aspect: 16:9
    [  828.269563] tc358743 1-000f:     active aspect: Same as Picture
    [  828.275582] tc358743 1-000f:     itc: No Data
    [  828.279972] tc358743 1-000f:     extended colorimetry: xvYCC 601
    [  828.286097] tc358743 1-000f:     quantization range: Default
    [  828.291788] tc358743 1-000f:     nups: Unknown Non-uniform Scaling
    [  828.298085] tc358743 1-000f:     video code: 4
    [  828.302562] tc358743 1-000f:     ycc quantization range: Limited
    [  828.308677] tc358743 1-000f:     hdmi content type: Graphics
    [  828.314460] tc358743 1-000f:     pixel repeat: 0
    [  828.319110] tc358743 1-000f:     bar top 0, bottom 0, left 0, right 0
    [  828.325664] tc358743 1-000f: ==================  END STATUS 
==================

But the same command doesn't work for /dev/video0
root@apalis-imx6-10774951:~# v4l2-ctl --log-status -d /dev/video0
VIDIOC_LOG_STATUS: failed: Inappropriate ioctl for device

The same bridge works well with the latest RaspberryPI kernel (6.1.y) 
but there the above script to form the pipeline is not required.

I'm grateful for any hints or comments?
Regards,
Aishwarya Kothari
