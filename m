Return-Path: <linux-media+bounces-28147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F559A5F42B
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 13:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADBF019C0A3F
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A91B2676D1;
	Thu, 13 Mar 2025 12:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ah5iSIxS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4703A2676CB
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868445; cv=none; b=iVl4peXNwb1En9rZ2l7E8/2PbaCbLCYXcBURnuvqTbkIzOkkdzJgxdZpBRv6BA5VMiz7gPjcRWE8XkGfHIi6VTGw52aehvcbYmh6X4Od9XZ9OkY+MRrkvUIUbu3xzSmaTCGQRqdacJ0Sngjte9yuFpv/O/AZAtr2GN+lLqnkjgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868445; c=relaxed/simple;
	bh=BwgDyyHIsbebUjnhMSTS4dLo89prxllUAC1gteUe9+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sn9Q4ywUoqMiiXacXaH7KcWaD4VL/WrIbcIDeBfCpqSKnheQwmCqjWTlVhVAgb3PX+xubZGsxrg+eF3br7wgqHvK0SSB/5o62KyyOLJxlWGL+/QYAsa3FdaaHL9EreOJa+x8BccXnRWk96tgj9ZgBOgjTTxEREtyTy++boVwfEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ah5iSIxS; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f05acc13so10207186d6.2
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741868442; x=1742473242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vcY7CKAqwG/zbhJLiCG47Bjs6dQB9a8QmJmLIP3Qqw=;
        b=ah5iSIxS7Aj+YxIWECxRvdVPVmXgxyLGb16fC/p9+NwgWFl0dFjyFOCYzSHh646dGW
         KkiaHLayq8ztEjWYi68ec/2tK5tp9cUzzGr60NIlNMNjCv4z+0h04XHSv02kS1LXULLi
         01mXtaOmlFmt5hkM3MkpqfafTV49xgkM48fwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868442; x=1742473242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vcY7CKAqwG/zbhJLiCG47Bjs6dQB9a8QmJmLIP3Qqw=;
        b=KbRMVjNfhYVZv9zrRdaJRsZ1+EYFOHOZ4ZQADvXA3KaN+ijwZR/TXGiWph3rjEsBAW
         EMZHNkvs28/ty7pkLoF3p/KetpviVp3xx56YAmBpXfXV1ZcpdmFvNnAAN5WgWG/JsB4M
         yvHFGeKIpBEx+7tSXdRmwDIDKzHlH46Hj5TmPR51sbaEyICZ9XBB/+RlY1NykhsWyJFW
         KB4TW2QZewJVA1rc5C3+H2/fTQmFdDMazBVAV89hkvnQvNJXBKePJ+T7415F4iQ6Cn13
         f9cxS46Dk/el/y1cZQjZlT3LGZoFHGHp7BZIEmJLe6WrwB30lIcZZ/8h9krguePSjD1T
         2WUg==
X-Forwarded-Encrypted: i=1; AJvYcCW08lJiT3XuQ6qVO1a0hjxu64I17Tp6J1dRABWOYUhSbPA7gf8jtF8Z3Z6bgfx029LEy7s7gvpFDM1lUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxzhEE5sYc5IO7i9s+LgOuA5trf/Sfneq8sTFUMWYmPqA5l2a1
	Qe/F3cZWWQwaECe7o1OqcFMHvnr4YLcF6bxZVAxVYXP9OlEpOghrKuOL93ZWRg==
X-Gm-Gg: ASbGnct4eWu4NVRqbTolAZbb3WcWBLipi7gJzJBmec666ka8BNcavgrZlLbqLIJZ1jj
	I/I8X6ArE/4IdR9zkg6oWqIyI1dtadKdLUOebxaeJEac4RooFh7gOmA6mQlLgDvggsqJ6lu5MK4
	QEeL1m4XevAzhwS0gRRjJATC499JIaB/ygLqHrjHaVZhY9jQilLUPW0DfrgqsdMrWt5sArIPrHA
	0e0DAwvtikohsIMq4pCecBdljE5bgUWKLus9DDgkj6BPOOWuwVdyx0d7WnIZnu6NyJaZOGVSz9D
	Y+oUS2GEn7qn+aDTZbJU70XSl4s0qoaCQrWc4IJBKL7UdtRZt3XgYuqgy/aJ68Iql6sWgSE2gNb
	D6LLotDwOyM3vZUP7h2+p0N8IOn8YWXLn
X-Google-Smtp-Source: AGHT+IGxu2l67R32KRhYTVLsCIiUHIBqUN26a2hLoa3PyEKo82RHqkFlvKoqmyrBpM6B8yDc3nFn+w==
X-Received: by 2002:ad4:5f85:0:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6e90060978amr408704926d6.20.1741868442139;
        Thu, 13 Mar 2025 05:20:42 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade235f9bsm9038616d6.29.2025.03.13.05.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:20:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 13 Mar 2025 12:20:40 +0000
Subject: [PATCH v3 2/2] media: uvcvideo: Use dev_err_probe for
 devm_gpiod_get_optional
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-uvc-eprobedefer-v3-2-a1d312708eef@chromium.org>
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
In-Reply-To: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2

Use the dev_err_probe() helper for devm_gpiod_get_optional(), like we do
with gpiod_to_irq()

That eventually calls device_set_deferred_probe_reason() which can be
helpful for tracking down problems.

Now that all the error paths in uvc_gpio_parse have dev_err_probe, we
can remove the error message in uvc_probe.

Suggested-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e966bdb9239f345fd157588ebdad2b3ebe45168d..d8e51c3db7575bebe7bb700b53b50ae02d355d8e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1297,8 +1297,13 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 
 	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
 					       GPIOD_IN);
-	if (IS_ERR_OR_NULL(gpio_privacy))
-		return PTR_ERR_OR_ZERO(gpio_privacy);
+	if (!gpio_privacy)
+		return 0;
+
+	if (IS_ERR(gpio_privacy))
+		return dev_err_probe(&dev->intf->dev,
+				     PTR_ERR(gpio_privacy),
+				     "Can't get privacy GPIO\n");
 
 	irq = gpiod_to_irq(gpio_privacy);
 	if (irq < 0)
@@ -2240,10 +2245,8 @@ static int uvc_probe(struct usb_interface *intf,
 
 	/* Parse the associated GPIOs. */
 	ret = uvc_gpio_parse(dev);
-	if (ret < 0) {
-		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
+	if (ret < 0)
 		goto error;
-	}
 
 	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		 dev->uvc_version >> 8, dev->uvc_version & 0xff,

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


