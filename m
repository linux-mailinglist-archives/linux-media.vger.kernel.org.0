Return-Path: <linux-media+bounces-23873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C146C9F9242
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BC1E7A13F6
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2F22147F6;
	Fri, 20 Dec 2024 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+s3eFk0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C926321423E
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697929; cv=none; b=H+QvVm9cCWQJujDUCUddVxDqpglKv32moVNAEpFO2iB5TDVIQj+V8m1k4haQvBnlcmwUidExj/m8qCyZnnXuQGn/izsjmp18ShucntikzLIHR0c7knOsNpNGxIl7h/3XnX7FhuEwpZqe1O7oDMcxDkdyMkjNj/DLVTtPixY1pOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697929; c=relaxed/simple;
	bh=6E2Co+szXTPte63hY6JUAN5dgLuPReb6z5fZ7KHx2aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVS/+iwi0E/ionzQusgXi5LXPyjs5eV5WVBHd0j6PYDZvudh42tL6+78Rk+5DDSIQMoA86CUkH+LjO04PGHVdqwkbESBWWY6V7HMNWWd+cXg/gwTaTwR76GFGWSDHe1qp/dE99rgHvnrzoderNUiangZLb3aS46a98oJ2fUobu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+s3eFk0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361c705434so13512675e9.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 04:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734697926; x=1735302726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3RVwnmHpDUz7lxPNsDqzKHweHcGyq4Mnz1jwuHWGIKA=;
        b=Y+s3eFk0Qjt2ipH/Q72njXJIwW7r6+ylJPo6t+ECPOSjAr/9k8+BPLqtFxQxwnPR3a
         AR3w3hkTnn3wQrB8+YJuOgOO3QBSd0MxuttQDxZ15Juq1Tld0YMzTpJpBn67arNebaJ5
         fXuIG8rVAbxLHe6cOgESe2GvsHUBnrJCek4GIHxkRzsKdPxE5Ig77G1ONk3JNpURm/Jz
         ShUVZGKVije7Tpgois9grFDgAyvoHpQ2Jz7UO/Ew/Sazr1tFLPwcrnDLjjKWn/YUPdKj
         3HhZDEzXTmiSlr2Z7WYC0Aw39audgk9Mnlvxob3QA/twrfAwp2Ob/TimYgiuTliXeRMu
         knyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697926; x=1735302726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3RVwnmHpDUz7lxPNsDqzKHweHcGyq4Mnz1jwuHWGIKA=;
        b=LfI9EFGwonMIm+qBUMXEKIUgF5x37rt3vi5r4p/2lWyU9nmDyapxV6CnXvHRlljF6h
         tAMcJMKNjL82Yo9s1IuavCl97stVxEb+2VrmQ3OUeNOOXmRBtKaTus17v4dIXYzRzIqa
         sZjFHUjrEMQ4lBC3m7GKt6zsdlxF4qAe2rIN4sN/aAIhB9U/IaV70u/PWFUZB014L1PQ
         TWrA+AwyleLvKWZNYma7t9ov3mfsnJp7U8j3hTcDZOxR/AI7L/5RMYIq+lUF20ysTDwG
         a9qdIm1+/dFJqcrvmEoW/j+rnCsJ3qX0F/bpqpiUcHkB8Ge4dWEA6uddelw0miTR2r9s
         CPmA==
X-Forwarded-Encrypted: i=1; AJvYcCVY65QpCmjgo12i8Mi2fFbM5TtT67IqpTghFjBytY0fBOsQVm6DZCtd+AlbFh5QO9UbnxzlnA/fd49L+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YztR/IXTkmluhGEZsvo6+x0ykpafY3nR+SBzE+WF6u7lFkc24+h
	e32TcZ4pVyJY51fahLTVbsygxJprMyvAR35INzyNVMeXfgEEIZdUg6HTq7xtET+ldcoXgs4wfsc
	l
X-Gm-Gg: ASbGnctBD6EEKk7tehQ6QrNTXElgHZqKxGiPxKnPvWCl4+ZlBX4i13ZpfZag9DNvSeO
	ePw1Pojul75Z83JjY9qtJcij88Dx+ac5p3GlWSXRiKYbV3zUE9FgRl92c/BTjiweEMa1GObRY3z
	+wWIFDi5yBkrihoRstHjOEjm10kxveMquB9IhgtoXFkujY1Ny1aCFzgoZzFR4gaBgefyNty3eBM
	+DQd9v66IKpzL17Rd7AD5FrDNrlbI/z6geODn9+Sr0kEfJD9ZyGC957eYxI4RqKe/TUIw==
X-Google-Smtp-Source: AGHT+IF2Mh0nu8Ar2G8IbnHQW0Ly/qPkxszKHEeQ2OL55m1cU0R66BfyLN3Z9CajwTFFeFlHCTDbkg==
X-Received: by 2002:a7b:cd95:0:b0:436:30e4:4590 with SMTP id 5b1f17b1804b1-43668b7a1d0mr19627945e9.32.1734697926116;
        Fri, 20 Dec 2024 04:32:06 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm44345395e9.6.2024.12.20.04.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 04:32:05 -0800 (PST)
Message-ID: <a2efc7e7-6e73-41b0-b8df-ae28175d7dda@linaro.org>
Date: Fri, 20 Dec 2024 12:32:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: ov08x40: Properly turn sensor on/off when
 runtime-suspended
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-2-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219134940.15472-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 13:49, Hans de Goede wrote:
> Commit df1ae2251a50 ("media: ov08x40: Add OF probe support") added support
> for a reset GPIO, regulators and a clk provider controlled through new
> ov08x40_power_off() and ov08x40_power_on() functions.
> 
> But it missed adding a pm ops structure to call these functions on
> runtime suspend/resume. Add the missing pm ops and only call
> ov08x40_power_off() on remove() when not already runtime-suspended
> to avoid unbalanced regulator / clock disable calls.
> 
> Fixes: df1ae2251a50 ("media: ov08x40: Add OF probe support")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov08x40.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index b9682264e2f5..aae923da1e86 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -2324,11 +2324,14 @@ static void ov08x40_remove(struct i2c_client *client)
>   	ov08x40_free_controls(ov08x);
>   
>   	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		ov08x40_power_off(&client->dev);
>   	pm_runtime_set_suspended(&client->dev);
> -
> -	ov08x40_power_off(&client->dev);
>   }
>   
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_on,
> +				 ov08x40_power_off, NULL);
> +
>   #ifdef CONFIG_ACPI
>   static const struct acpi_device_id ov08x40_acpi_ids[] = {
>   	{"OVTI08F4"},
> @@ -2349,6 +2352,7 @@ static struct i2c_driver ov08x40_i2c_driver = {
>   		.name = "ov08x40",
>   		.acpi_match_table = ACPI_PTR(ov08x40_acpi_ids),
>   		.of_match_table = ov08x40_of_match,
> +		.pm = pm_sleep_ptr(&ov08x40_pm_ops),
>   	},
>   	.probe = ov08x40_probe,
>   	.remove = ov08x40_remove,

Here's a trace of what I'm finding on the qcom crd with this patch.

[    4.383434] ov08x40 1-0036: ov08x40_power_on
[    4.393299] ov08x40 1-0036: ov08x40_power_on
[   10.119144] ov08x40 1-0036: ov08x40_set_stream
[   10.127842] ov08x40 1-0036: ov08x40_set_stream do 
pm_runtime_resume_and_get
[   10.135067] ov08x40 1-0036: ov08x40_power_off
[   10.139608] ov08x40 1-0036: ov08x40_start_streaming
[   10.150832] ov08x40 1-0036: ov08x40_start_streaming failed to set 
powerup registers
[   10.165625] ov08x40 1-0036: ov08x40_power_on


diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 579b4aa5f041d..c1dead0ca0756 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1321,7 +1321,7 @@ static int ov08x40_power_on(struct device *dev)
         struct v4l2_subdev *sd = dev_get_drvdata(dev);
         struct ov08x40 *ov08x = to_ov08x40(sd);
         int ret;
-
+dev_info(dev, "%s\n", __func__);
         ret = clk_prepare_enable(ov08x->xvclk);
         if (ret < 0) {
                 dev_err(dev, "failed to enable xvclk\n");
@@ -1356,6 +1356,8 @@ static int ov08x40_power_off(struct device *dev)
         struct v4l2_subdev *sd = dev_get_drvdata(dev);
         struct ov08x40 *ov08x = to_ov08x40(sd);

+dev_info(dev, "%s\n", __func__);
+
         if (ov08x->reset_gpio)
                 gpiod_set_value_cansleep(ov08x->reset_gpio, 1);

@@ -1874,6 +1876,8 @@ static int ov08x40_start_streaming(struct ov08x40 
*ov08x)
         const struct ov08x40_reg_list *reg_list;
         int ret, link_freq_index;

+dev_info(&client->dev, "%s\n", __func__);
+
         /* Get out of from software reset */
         ret = ov08x40_write_reg(ov08x, OV08X40_REG_SOFTWARE_RST,
                                 OV08X40_REG_VALUE_08BIT, 
OV08X40_SOFTWARE_RST);
@@ -1967,9 +1971,11 @@ static int ov08x40_set_stream(struct v4l2_subdev 
*sd, int enable)
         struct i2c_client *client = v4l2_get_subdevdata(sd);
         int ret = 0;

+dev_info(&client->dev, "%s\n", __func__);
         mutex_lock(&ov08x->mutex);

         if (enable) {
+               dev_info(&client->dev, "%s do 
pm_runtime_resume_and_get\n", __func__);
                 ret = pm_runtime_resume_and_get(&client->dev);
                 if (ret < 0)
                         goto err_unlock;


