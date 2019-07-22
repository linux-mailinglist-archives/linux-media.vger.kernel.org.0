Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDF27047C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 17:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730293AbfGVPuk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 11:50:40 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39639 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729690AbfGVPuj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 11:50:39 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so39918719wrt.6
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2019 08:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5BmOYJCTAFi1ZioqJGf50HDu9/7ffTUqmPVkpEs96dE=;
        b=muXE1cFQCW61p3SDvz1qP6cJ32KKZKYaSx5QhJftX0TR0xweGaojTWNPl5OeoTdegX
         JkEvZKtbvRhgK42Q2aidZ5Xj1ClZ1hOCSozj19VYps8/H/F7mYSKaQ2iYFLDwcTT+gK+
         fMNPva0pNr40zUilXvl9A1M6b6BDtmNJtvbFhksA9f8h7zRB6ss64s8oftS6xcj5eWL6
         7QPvb6hzWmSjqnqI5/UqigXD1UAdE6SyBfuOIGutnatS7stlJfvi7iN8hD6+np7EOsVW
         VUJNnNrSNo+MogzSuThsFTFujGk4nLUhkdNw64E2jnupT+ArtX+oyOJbmWAqrXKIDu3S
         XcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5BmOYJCTAFi1ZioqJGf50HDu9/7ffTUqmPVkpEs96dE=;
        b=IiEIfTZja84LxrWZ12610bF5XMf1IW1kWY20ZsjFyiJps+y05kprwBC+7Ee1O1Sz9E
         Dj2aOhQYGyfICqW2iqxHVamIi5m7BFvVkR6pLG12Tm5hYOp9Td0gjvDCCZwW3/i/Nf2k
         v5EuN03w0Qc70PmD9IFyzQwH/9ph+bdGIL6lRtxdPGsyOoSI4fbB/qDrOmuo7/WAbq45
         S+0qdOM3Ni2AnjXDWxT8sKob980d+LMsbpmaQvyhXskkiKOHkK39pZfeL1K9sxnlQOi/
         SMG4ZVNFzF8mdj25MGF2g9P4mhJzD9S3qlc26fjALBDwZXAu5i3Uu2kl/97mcEcO5dKJ
         /7mQ==
X-Gm-Message-State: APjAAAXVs/NCgZSd/3cjkLbi7QGa1fSF6qbOEoIjIGasOfJdxAUDwWEV
        9NyiGTufG9EsKn46wWXHGddMldIx
X-Google-Smtp-Source: APXvYqzydg0+7BmupwmiYvAsP9ru4rO3FQ8/9EPZSiW7dbdfWeC9zXl1Jq+Mo2gmXlkBwIPGq5tiIw==
X-Received: by 2002:adf:fa42:: with SMTP id y2mr55864056wrr.170.1563810637035;
        Mon, 22 Jul 2019 08:50:37 -0700 (PDT)
Received: from [192.168.197.233] (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id i18sm51466084wrp.91.2019.07.22.08.50.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 08:50:36 -0700 (PDT)
Subject: Re: Issues with ov5640 camera on i.MX6Q
To:     Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     loic.poulain@linaro.org, linux-media <linux-media@vger.kernel.org>
References: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
 <CAOMZO5B3GV8fPLAdsxx2F+dyH68xPn6MN5rehEvwDvjJmirZrg@mail.gmail.com>
From:   Laura Nao <laura.nao@kynetics.com>
Message-ID: <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
Date:   Mon, 22 Jul 2019 17:50:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5B3GV8fPLAdsxx2F+dyH68xPn6MN5rehEvwDvjJmirZrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Fabio!

I tried tweaking the PLL configuration in the driver and did some 
further tests on 5.2 kernel.

I was finally able to capture RAW frames that match the test pattern for 
1280x720 and 1920x1080 resolutions. The 2592x1944 frame is still not 
perfectly aligned, but it looks much closer to the test pattern.

I uploaded the images here:

https://imgur.com/a/ywHokMf

The changes I made in the driver are below. Not sure these changes make 
much sense, but they seem to fix 1280x720 and 1920x1080 frames.

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 759d60c6..cfa678e 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -795,13 +795,13 @@ static int ov5640_mod_reg(struct ov5640_dev 
*sensor, u16 reg,
   * FIXME: to be re-calcualted for 1 data lanes setups
   */
  #define OV5640_MIPI_DIV_PCLK	2
-#define OV5640_MIPI_DIV_SCLK	1
+#define OV5640_MIPI_DIV_SCLK	2

  /*
   * This is supposed to be ranging from 1 to 2, but the value is always
   * set to 2 in the vendor kernels.
   */
-#define OV5640_PLL_ROOT_DIV			2
+#define OV5640_PLL_ROOT_DIV			1
  #define OV5640_PLL_CTRL3_PLL_ROOT_DIV_2		BIT(4)

  /*
@@ -836,8 +836,8 @@ static unsigned long ov5640_compute_sys_clk(struct 
ov5640_dev *sensor,
  	unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;

  	/* PLL1 output cannot exceed 1GHz. */
-	if (sysclk / 1000000 > 1000)
-		return 0;
+	// if (sysclk / 1000000 > 1000)
+	// 	return 0;

  	return sysclk / sysdiv;
  }
@@ -1818,7 +1824,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
  	 * All the formats we support have 16 bits per pixel, seems to require
  	 * the same rate than YUV, so we can just use 16 bpp all the time.
  	 */
-	rate = mode->vtot * mode->htot * 16;
+	rate = mode->vtot * mode->htot * 8;
  	rate *= ov5640_framerates[sensor->current_fr];
  	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
  		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;

Thanks,

Best,

Laura

On 7/22/19 2:45 PM, Fabio Estevam wrote:
> [Adding Steve and Philipp]
> 
> On Thu, Jul 18, 2019 at 10:06 AM Laura Nao <laura.nao@kynetics.com> wrote:
>>
>> Hello Loic,
>>
>> I'm having some issues with RAW8 mode on the OV5640 camera and I'd like
>> to kindly ask for your advice, as I saw that you added support for RAW
>> mode in the mainline kernel driver.
>>
>> I'm trying to capture some raw images on a i.MX6Q based board. I
>> configured the pipeline as follows:
>>
>> media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
>> media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
>> media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
>> media-ctl -V "'ov5640 1-003c':0 [fmt:SBGGR8_1X8/2592x1944 field:none]"
>> media-ctl -V "'imx6-mipi-csi2':2 [fmt:SBGGR8_1X8/2592x1944 field:none]"
>>
>> I'm capturing the frame using v4l-utils:
>>
>> v4l2-ctl -d /dev/video5 --verbose --set-fmt
>> video=width=2592,height=1944,pixelformat=BA81 --stream-mmap
>> --stream-count=1 --stream-to=bggr_2592x1944.raw
>>
>> The images I'm obtaining are completely garbled. I tried both 5.2
>> mainline and 5.1.18 kernels.
>>
>> I'm able to correctly capture YUV frames in all resolutions with the
>> same driver (with the pipeline configured to go through the
>> ipu1_ic_prpenc node first).
>>
>> Do you have any insight on what might be causing these issues? Is the
>> PLL configuration supposed to be changed when RAW8 format is selected?
>>
>> Thanks for your help,
>>
>> Best regards,
>>
>> Laura
