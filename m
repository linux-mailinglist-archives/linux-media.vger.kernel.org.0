Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027D4521B0E
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 16:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244604AbiEJOIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 10:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244991AbiEJOFz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 10:05:55 -0400
X-Greylist: delayed 312 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 May 2022 06:40:55 PDT
Received: from mailgate1.beam.ltd.uk (mailgate1.beam.ltd.uk [88.96.138.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652F22E1DDC
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 06:40:55 -0700 (PDT)
Received: by mailgate1.beam.ltd.uk (Postfix, from userid 900)
        id 7C00C5C00D7; Tue, 10 May 2022 14:35:41 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailgate1.beam.ltd.uk 7C00C5C00D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beam.ltd.uk;
        s=default; t=1652189741;
        bh=UXyYgldC6omj/ZIJwwLfDlZjwdtRjlg2b1wanIgy/6U=;
        h=Date:To:From:Subject:From;
        b=dFCLG3tE0gh6yQ1gMnLOBfpum3RjDTRqDQvrGer7iePz6omxvylSSLuCIutmEUkZf
         fKwvMsOSZGEii1LtasPgnDpL72eCKo2mBrcCoBcHnHrFOWRef8r+q1c5P3HP2uLgNP
         eR+hckjpMyYksi3+PUoKgxYeYRD8CAaVDMEWNvY8=
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
Received: from [192.168.202.2] (king.beamweb.co.uk [82.69.10.222])
        by mailgate1.beam.ltd.uk (Postfix) with ESMTPSA id D6F305C00D2
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 14:35:38 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailgate1.beam.ltd.uk D6F305C00D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beam.ltd.uk;
        s=default; t=1652189738;
        bh=UXyYgldC6omj/ZIJwwLfDlZjwdtRjlg2b1wanIgy/6U=;
        h=Date:To:From:Subject:From;
        b=omR8Y41Y8Nn6CrEKS5tLCVfy7OySfZ57qxvSEMgKw2BYn9LVhL1v/VZEMreBE9tbz
         cHWbYiZH+Wpym3+AbAt8oksfL6bXjVmbe5tpZZZlt+yXee1znfj/Ztyjpq4EfQqGZT
         V+XavtCmlEsWGlLtx7jqthAebdn7fy18iRklVHPM=
Message-ID: <908eb507-677c-359e-154b-da3a7147af0d@beam.ltd.uk>
Date:   Tue, 10 May 2022 14:35:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To:     linux-media@vger.kernel.org
Content-Language: en-GB
From:   Terry Barnaby <terry1@beam.ltd.uk>
Subject: Video4Linux: Call an I2C subdev function to start a stream after a
 CSI2 driver has been started
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

We are working on a system that uses a NXP IMX8MP SOC with a TP2855 
analogue video front end chip that can capture 1920x1080p25 or PAL 
720x576i25 analogue video streams which is generally working using 
gstreamer as the higher level software driving this.

We have an intermittent video stream start up problem which we believe 
is down to:

1. The TP2855 is initialised first and its subdev *_s_stream() call is 
called to start the video input.

2. The NXP CSI2 video input hardware is then started: 
imx8-mipi-csi2-sam.c: mipi_csis_s_stream().

3. The TP2855 enables the CSI2 clock after its *_s_stream() call, 
probably in hardware after its PLL's have locked, by sending a CSI2 
start sequence on the CSI2 clock pair. This clock is then a continuous 
clock ie. it does not go into low power mode during horizontal/vertical 
blanking.

4. The NXP CSI2 video input hardware, based on some Samsung IP, does not 
see the CSI2 clock unless it sees the CSI2 start sequence and depending 
on timings it may not see this at video pipeline startup and we get not 
video stream from the CSI2 hardware.

I was hoping the subdev *_s_stream() call would be after all of the 
hardware's pipeline was setup so I could instigate a CSI2 clock restart 
in the TP2855 driver, but unfortunately this is called before the CSI2 
hardware is setup.

I can add a one shot timer to do this in the TP2855 subdev *_s_stream() 
call, but obviously this is not ideal. Is there anyway to get a subdev 
function called in the video4linux API automatically once all of the 
video streams hardware is setup ?

Any ideas/recommendations ?

Terry


