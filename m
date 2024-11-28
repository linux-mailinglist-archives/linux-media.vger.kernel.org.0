Return-Path: <linux-media+bounces-22260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0EB9DBD18
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FE4E281F3D
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431541C4609;
	Thu, 28 Nov 2024 20:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hH89A8WH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299DF1C32E2
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 20:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732827261; cv=none; b=WlrKFk+IXABOy6t1gG4LFUKFnKBNt4oAm2N1pd9k+UzwI3nOvKvMtaWyVV/tTJ9B/FQx/7H5qfhFXbRywz2fgmViyKTcw2M/dzo0wIk15VroSy4b/BVZ9og+hrdL2u6Q8PdVCi9QyFyMiTj5TIvpu1G7MteCePswPc9yqSP1waQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732827261; c=relaxed/simple;
	bh=H2sUBB+fsICTdnFjz8Lj6jJqXgJsJGlzoShvTjrlPXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQ0unLsxoj5wq7/pHFhYjelNmTlhv37DYoGroLy0V9Oxa25z7SzTObcTCCasIKE/1Esvp6104DPM3ZqX+0h8S+Wvijfe/6g/sboKdhJ2YM2qscZwZKvDYLYV2HLVIHlVOkxl/FBgWNQYLiilQCu+RY6vxPduCUqsh9Jt5l3EZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hH89A8WH; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-46684744070so9423891cf.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732827259; x=1733432059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4fn8wn/VKVd1lfp+Uuux+ZckEB87hkFaLSp4OUxjOQ=;
        b=hH89A8WHUG40tV201+z2UytElqO0LZFfvRmZ+eqK5zNiTc7jsWhaBu9sU8m9g4ALLQ
         4DDEss1NpXkE0+pYMyPRqEmPQGtL3G7yHltYR+KWtUDAxevdE+3tpbovp2PKQRMlDFpf
         GwNmOBQK3PhDGWkfz54onmfCP2YYkzukF00io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732827259; x=1733432059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4fn8wn/VKVd1lfp+Uuux+ZckEB87hkFaLSp4OUxjOQ=;
        b=XgOlid52S96ieQkabnbFGfxVst1wzpGbDMhkBToWGYG47MTrYo4bVEyhcvT5PMJsiE
         y6pdBwfRYWqmBePFHtEHwfyXBpo88OfCxXnEPIcUjPbmSWqbxGsUrLRT73UHfuCYaRdF
         4vB0yEzeJA9byAKt+Jlyw48hVI9MrR5dhAjQNLWioqfu4qflUOjyVH0uG/TmVmrIIT0W
         P1Xc9Ii7goRFa9yva7MQWYjLrUJ0AmBkvRuEQ6Awid+Qme4+nuFhokNcBQuagAnBVv+7
         0whPbNyhcPSsVYPIqJgWYtITVN1bfbb/3XCXBCLm1No6MsHcYBoK75RpHNuk15tQEt6M
         Z5GA==
X-Gm-Message-State: AOJu0YwgGGCIWgLTLtHEiJ4al2g6EG7UJ8dJapr+xf+ehUfaAJB3Fetb
	oQg66roZ10tB7+KYeBU36S7PgLppCPsKEK1dQ4nxpxPGksEx3eRRIMfPo08GMQ==
X-Gm-Gg: ASbGncucWhJNUAlZuBw7y0bR3rzQlYL+pMraPtzLqbtji98qpt6ynNoA+lCYBmwSleO
	psCyv6xacpkWc3T97EFPNamMxlnZ07E1dFSfcM74rmQ0gwGfcH6I2BLCDO+AZl+rXusN4pZNKCr
	Lytwpw1qvHSDKViaVAIQDpc0kWE/4YjcLSnIfvRVyFc38TDcMGHG+XpJLtMKPs4KLzyf5JvOqxS
	Yw1hjzN7Oav/y4gDQoIa51Pd2e6IeHUc9A6WPJmhr8UjgVpvMXEZ6aIAO0RzXe8MGjaB2gjMvOf
	wAptPDNsNTggXe8OyMgqJAI8
X-Google-Smtp-Source: AGHT+IGsQPPcE1Y6kRMFJwvkPvXDD4RZbAEeird+u3mx85igV+v5RYgUf1lgiIsUgpYQjUBWW7Ft1Q==
X-Received: by 2002:ac8:5d94:0:b0:464:c8f2:e553 with SMTP id d75a77b69052e-466b36549f8mr88277511cf.42.1732827259063;
        Thu, 28 Nov 2024 12:54:19 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466c407e6acsm9923421cf.52.2024.11.28.12.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 12:54:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Nov 2024 20:53:41 +0000
Subject: [PATCH v5 1/2] media: uvcvideo: Support partial control reads
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-uvc-readless-v5-1-cf16ed282af8@chromium.org>
References: <20241128-uvc-readless-v5-0-cf16ed282af8@chromium.org>
In-Reply-To: <20241128-uvc-readless-v5-0-cf16ed282af8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

Some cameras, like the ELMO MX-P3, do not return all the bytes
requested from a control if it can fit in less bytes.
Eg: Returning 0xab instead of 0x00ab.
usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).

Extend the returned value from the camera and return it.

Cc: stable@vger.kernel.org
Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index cd9c29532fb0..67f714bca417 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -79,6 +79,27 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	if (likely(ret == size))
 		return 0;
 
+	/*
+	 * Some devices return shorter USB control packets than expected if the
+	 * returned value can fit in less bytes. Zero all the bytes that the
+	 * device has not written.
+	 *
+	 * This quirk is applied to all controls, regardless of their data type.
+	 * Most controls are little-endian integers, in which case the missing
+	 * bytes become 0 MSBs. For other data types, a different heuristic
+	 * could be implemented if a device is found needing it.
+	 *
+	 * We exclude UVC_GET_INFO from the quirk. UVC_GET_LEN does not need
+	 * to be excluded because its size is always 1.
+	 */
+	if (ret > 0 && query != UVC_GET_INFO) {
+		memset(data + ret, 0, size - ret);
+		dev_warn_once(&dev->udev->dev,
+			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
+			      uvc_query_name(query), cs, unit, ret, size);
+		return 0;
+	}
+
 	if (ret != -EPIPE) {
 		dev_err(&dev->udev->dev,
 			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",

-- 
2.47.0.338.g60cca15819-goog


