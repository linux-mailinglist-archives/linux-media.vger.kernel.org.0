Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAAE195251
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 08:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgC0HtN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 03:49:13 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39465 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgC0HtN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 03:49:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id h6so1288059lfp.6
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2020 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xd3qTFAXr4cf1mT72QUSMZACuhEIZhlt1egZDbqQLcQ=;
        b=VDIrF+/PKJYGewqSuGThQWmnczhWDsApyzccp0p7BljD5ZL5PcKdd7FheHe9wXIwEl
         mvioh45//+49SMKI/4D4ZG2fZ9tLldDUdF4MbNk7q4sezAFfnimMIPTwzAGmFdW5G4cQ
         LFn3z4og1JF1CmQmpW8zKL+CJv2GytD+DaNMP10Z1vRSDM5Dh87VP4k24w6cVkM/LTIp
         ME3uCUeK9yZxKGIBNqJGajHirXg7ybi6aja5Cb2+pmzxFM4HpC9QRHfPqV/ysn7Nmguj
         DJWQFCzOixRG2u/Hek2Gj1hsutr4QGxxJhGM/zvYplJIBAOdY6ZCw8DFh587LHL+14BN
         QCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xd3qTFAXr4cf1mT72QUSMZACuhEIZhlt1egZDbqQLcQ=;
        b=GbhaqkApUG7dT+RfJEjurT3w9ZeZ7Rmh9xJZGxVO8pU2zoBZHFQgYVziYOIte2OCUh
         2HZWmhysX7lkdWQ1rmERUNoQjdKVUd2knhqjmpXM6V5CSR6TfORzmBvBp5Ei5KfNPbEH
         J8Qja1UxHoRIH5lW1wKC1dG0tTpbWZH1vxz9yRqKiwoMIAOgcPpCQKmFyfBBmHNDqawx
         ixdeaDeHo7EsOQFIn6LX/Iy0JYfn6HR6wtXxcLVhi88UAAuUQd0YG1/XEIzpmCdBEMew
         s2ojsTCoZvAk43I07yYwizSUDGlz8jKZwjeenJrAf+mdb0lZ69X8G2WetyTu7sNTFZco
         ouRQ==
X-Gm-Message-State: ANhLgQ3+iQRNWUzBRvvaoBTa5+RMsc9SIBn/qHgqxBCG5+jckOQRAMR6
        e7hyvslV8oGosmbnguGueL4BsHMiPW0bVg==
X-Google-Smtp-Source: ADFU+vul4WzuaUmsZjfxRvR3LeEoELVin7Ge+sW2He7pBqHEqLo1wnoYXtY8rwCtsOqM5h3Z3gWNXg==
X-Received: by 2002:a19:7e01:: with SMTP id z1mr8236798lfc.196.1585295349466;
        Fri, 27 Mar 2020 00:49:09 -0700 (PDT)
Received: from [192.168.7.22] ([217.148.211.220])
        by smtp.gmail.com with ESMTPSA id e14sm2358098ljb.97.2020.03.27.00.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 00:49:09 -0700 (PDT)
Subject: Re: IMX219 MIPI Sensor (meda-tree) with vaniila I.MX6Q media drivers
To:     Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <30c5947f-a026-66a9-75f2-d2531cc73a1e@gmail.com>
 <CAOMZO5Bz+qh7S3s8SfJRPVjjvokMx-r6udzFg=0poJmCbzMj9w@mail.gmail.com>
From:   Alex Mihaylov <minimumlaw@gmail.com>
Message-ID: <e9603747-f7d9-161f-b9e6-9adc7f1cdf7e@gmail.com>
Date:   Fri, 27 Mar 2020 10:49:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5Bz+qh7S3s8SfJRPVjjvokMx-r6udzFg=0poJmCbzMj9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Oooppps! My mistake. Before you answer in logs:

localhost ~ # dmesg | grep -i imx219
IMX219_1V2: supplied by P3V3
IMX219_1V8: supplied by P3V3
IMX219_2V8: supplied by P3V3
imx219 9-0010: 9-0010 supply VANA not found, using dummy regulator
imx219 9-0010: 9-0010 supply VDIG not found, using dummy regulator
imx219 9-0010: 9-0010 supply VDDL not found, using dummy regulator
imx-media: imx219 9-0010:0 -> imx6-mipi-csi2:0
localhost ~ #

P3V3 always on regulator, so all 3 regs always on. On Raspberry Camera 
V2.1 all of them enabled by single GPIO. This GPIO on my schematic 
pull-up to 3,3V. So for first step I fix DTB
- clock-names = "xclk";
- DOVDD-supply = <&imx219_1v8_reg>; /* 1.8v */
- AVDD-supply = <&imx219_2v8_reg>;  /* 2.8v */
- DVDD-supply = <&imx219_1v2_reg>;  /* 1.2v */
+ VDIG-supply = <&imx219_1v8_reg>; /* 1.8v */
+ VANA-supply = <&imx219_2v8_reg>; /* 2.8v */
+ VDDL-supply = <&imx219_1v2_reg>; /* 1.2v */

Result:
localhost ~ # dmesg | grep -i imx219
[    0.102656] IMX219_1V2: supplied by P3V3
[    0.102737] IMX219_1V8: supplied by P3V3
[    0.102798] IMX219_2V8: supplied by P3V3
[   13.851525] imx-media: imx219 9-0010:0 -> imx6-mipi-csi2:0
localhost ~ #

No visible changes from original message.

Next step. Our schematic have separate, controlled by GPIO, voltage 
switch for raspberry camera 3,3V supply. I try use them:

@@ -111,7 +108,6 @@ p3v3_cam_reg: p3v3_cam_regulator {
  regulator-max-microvolt = <3300000>;
  vin-supply = <&p3v3_reg>;
  gpio = <&gpio2 25 GPIO_ACTIVE_LOW>;
- regulator-always-on; /* XP25: force on (1-2)/normal (2-3) */
};

also in all IMX219 regulators fix vin-supply and disable always-on mode
- vin-supply = <&p3v3_reg>;
- regulator-always-on;
+ vin-supply = <&p3v3_cam_reg>;

I see more noice about regulators in log, but capture still not start

localhost ~ # dmesg | grep -i imx219
[    0.103533] IMX219_1V2: supplied by P3V3_CAM
[    0.103612] IMX219_1V8: supplied by P3V3_CAM
[    0.103672] IMX219_2V8: supplied by P3V3_CAM
[   13.668314] imx-media: imx219 9-0010:0 -> imx6-mipi-csi2:0
[   35.671233] IMX219_1V2: disabling
[   35.671246] IMX219_1V8: disabling
[   35.671255] IMX219_2V8: disabling
localhost ~ # ./camera_init.sh
localhost ~ # gst-launch-1.0 v4l2src device=/dev/video2 ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed 
to allocate required memory.
Additional debug info:
/var/tmp/portage/media-plugins/gst-plugins-v4l2-1.14.5/work/gst-plugins-good-1.14.5/sys/v4l2/gstv4l2src.c(656): 
gst_v4l2src_decide_allocation (): 
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.017843333
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Setting pipeline to NULL ...
Freeing pipeline ...
#

So, I fix cosmetic with DTS. But, unfortunately, this not fix troubles.

> 
> No clock-names is described in
> Documentation/devicetree/bindings/media/i2c/imx219.yaml
> 
>>                  DOVDD-supply = <&imx219_1v8_reg>; /* 1.8v */
>>                  AVDD-supply = <&imx219_2v8_reg>;  /* 2.8v */
>>                  DVDD-supply = <&imx219_1v2_reg>;  /* 1.2v */
> 
> These supplies names do not match the ones described in:
> Documentation/devicetree/bindings/media/i2c/imx219.yaml
> 
