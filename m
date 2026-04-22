Return-Path: <linux-media+bounces-59324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCTFMy296GkHPgIAu9opvQ
	(envelope-from <linux-media+bounces-59324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:21:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A3C445D41
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35A6830358AB
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CC43D3331;
	Wed, 22 Apr 2026 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMYqGdC+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD3344DAD
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860438; cv=none; b=tbsAo0A9L6zeLDk3elJRXpPQ3oKmjAbfO3NlWiyaMdWxwO7ENF5JbgHgAFN6b8YCfe3FYIVKY+b1RUxk1Ll3pzDBGfCnUBtv76EQf0Mc1uSBrSdiS/RnazjWqunp5dWYBDcd0ePzWp4oQHT2L33GIVmbqm75LGf5wWyEvMqIbgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860438; c=relaxed/simple;
	bh=rmLpOD15ey5jJBcGlOs0VEkMCk8NVU61Cjr9b1lHTIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mvooc6pBhZV7wKw/EmGH/1NUeapRYfuNH7/zbbEYftDc/89Jg8+Bu2rTSxB3Tpi+Kj/kQl4tbpi/4IAA3fWD/ZAA0Nv4/KrCP8UGW120y0Xc64x7AngPWZI/LnDU92oFOZV2mhYMgKg2mNAvB4uLEHjoz5A6qRJoodN4ypfSkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMYqGdC+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82748257f5fso3421363b3a.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 05:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776860433; x=1777465233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6msxAJ7rXJwvY4InrEwD2UVkIE7nFuki3yGkdlRuzs=;
        b=WMYqGdC+Hzly99zaaWlMnzV0KtH9o0RHvehaCVzgn9T5sV6c7fHWqdHTO+GAhqNS3p
         y8T8YeYhNK51MfMcio9C19YMJ/boN39/WxvxwaT97fTxC80rfRhz+oN2/WXbBlvk8cYK
         jD+CvbZQIXvhg+PgXzxqKVhQbNADzcFYie57okPyupcNZYQ/6Ic7AQqkA6/7vqcyBHk+
         DJoE84m+6BUvp2Vm1p4HWCmWP8VeDOEgRXA1qn9n7o119Ka1M6J36JlA3WJyrtsK6SVi
         1LC+BAWeSJTD6nA7Oj5dxdtDggtzlB8P08xQdpAjikBsfXo9M7ML/YBb7tc4rTHXVB1p
         IUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860433; x=1777465233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G6msxAJ7rXJwvY4InrEwD2UVkIE7nFuki3yGkdlRuzs=;
        b=WWEs9Vf4tN2ls50a9t9Y9cvzReGRzQ7z5PEx4HjlYQiY/TGcSnOpxI7cAnAeA9rRjI
         NsVW/x4TkqDuMbHkp5GoRM5xWxbrOAm0MEMdd+MD1LKNRLoE48V6jJ5GYCT1lqcVDjAr
         xRNFtX9n9U3LT+hld2Af3oDqJ3WZEf0AnYQTX42qgL11feS414KDSy62Ovt2yYGKq5oD
         2OjW6E/kF4xYRo/TKjt5t/aQzds3a6vt9vZbRo28TW8eXiFqSAt2nSmXtIRLo4AtgfC9
         on5Q6+7/GfcGIsFcN1T0jBA6Aj0pgrttVLyh7whtXSdrqJ+g8O+iYYqoMPI1U3++9qP2
         owDA==
X-Forwarded-Encrypted: i=1; AFNElJ/FqHEhyy5IzZBjiUabq+iGLCRdCOsnqsKM5jmbRpZIzgTlUtFSzjgPoUWOpTN/sj5ihOSnjj948oAwEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyzIwr5n46KlfNqARbPu4DqJN/JcQxLH9qxVukNQZOw3k6vUQ+
	JM5o/KkBx5yO2xyHB4gLx4pShFaTpJf+LL2pW7GLL1EHaavNVbmolZXt
X-Gm-Gg: AeBDietMZnJF1LHH3Fz+4L2MGdoqmI+OCekhRr5fX+B/2GMuSqRBzzLExAN/07tcssj
	yPTx30u/ckuAzYRVLu7OdleGUv8vOxC9nkjDy8sYYLrUF2/CuDvF2bhfxUopEkA2SXkcaaUjTMT
	oQgpsL+1OMkZAlakoFP6wdlXvx9mkoYNvWUJMIdM7S0jf1mkfUjYhXEXd1wv2BJIpRgPh2DGFAT
	sg3KVgPjZP89l2T1FlIy9bEn9NWLFWQivOLk3+sZk4/FWPZZn4di4c7ZqShfuV83ffEUGpkzPMz
	DGWSzOiWTuAssocHK+pPKVndsLx5FSoWhpYgZWJni6zm5VhdxaSXQc6MFGMKg7AjYs9qURVNIke
	QgohN9KSzsijA6tpHDA5Ktu2ROIUtqtV4EQIsb6ZFYHVu5WOx+M/ytIwyFGaYb2p94MznJ9z19Y
	hyRGcrKaj86yYaOso7H3isNEzGYFjasmlb6cLTLqCQ7Mwu83zvQ6uP
X-Received: by 2002:a05:6300:6d04:b0:3a0:babd:b959 with SMTP id adf61e73a8af0-3a0babdbda5mr10203472637.9.1776860433590;
        Wed, 22 Apr 2026 05:20:33 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701b1a3sm12798030a12.19.2026.04.22.05.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:20:33 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: [PATCH v4 2/2] media: atomisp: Remove unused DPCM helper functions and declarations
Date: Wed, 22 Apr 2026 17:50:06 +0530
Message-ID: <20260422122006.29390-2-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422122006.29390-1-debjeetbanerjee48@gmail.com>
References: <aeiuhvqcT189lL5U@kekkonen.localdomain>
 <20260422122006.29390-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59324-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41A3C445D41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the DPCM-related helper functions and data structures that are no
longer used after simplifying the CSI2 source pad format handling:

- atomisp_subdev_uncompressed_code() function
- atomisp_subdev_is_compressed() function
- atomisp_find_in_fmt_conv_compressed() declaration
- compressed_codes[] array from atomisp_subdev.c

Since the driver does not support DPCM decompression, these functions
were dead code and have been removed to clean up the codebase.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
 .../media/atomisp/pci/atomisp_subdev.c        | 33 -------------------
 .../media/atomisp/pci/atomisp_subdev.h        |  3 --
 2 files changed, 36 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ecb7..ec5d3d7d7700 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -51,39 +51,6 @@ const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
 	{}
 };
 
-static const struct {
-	u32 code;
-	u32 compressed;
-} compressed_codes[] = {
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8 },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8 },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8 },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8 },
-};
-
-u32 atomisp_subdev_uncompressed_code(u32 code)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(compressed_codes); i++)
-		if (code == compressed_codes[i].compressed)
-			return compressed_codes[i].code;
-
-	return code;
-}
-
-bool atomisp_subdev_is_compressed(u32 code)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(atomisp_in_fmt_conv) - 1; i++)
-		if (code == atomisp_in_fmt_conv[i].code)
-			return atomisp_in_fmt_conv[i].bpp !=
-			       atomisp_in_fmt_conv[i].depth;
-
-	return false;
-}
-
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 {
 	int i;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index e1d0168cb91d..a8d3ddeda3bf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -296,8 +296,6 @@ struct atomisp_sub_device {
 
 extern const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[];
 
-u32 atomisp_subdev_uncompressed_code(u32 code);
-bool atomisp_subdev_is_compressed(u32 code);
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code);
 
 /* ISP2400 */
@@ -309,7 +307,6 @@ const struct atomisp_in_fmt_conv
 *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format
 	atomisp_in_fmt);
 
-const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_compressed(u32 code);
 bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
 
 /* Get pointer to appropriate format */
-- 
2.53.0


