Return-Path: <linux-media+bounces-59404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGb6JEkX6mlHtwIAu9opvQ
	(envelope-from <linux-media+bounces-59404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:57:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920B45263A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D53E30C1462
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975653EE1E0;
	Thu, 23 Apr 2026 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBIeCqv7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A1D3EE1E5
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948764; cv=none; b=GAqyhAo5D+tSc5J125q8xpptL97KeDYd5H/asnuXcE9yAKRDvbFDGz0GBpR10nXAQmLzIqeczOrL9nk1HTI4Sa0hVpEbvMiaVhn647aE2laOOa8aQUL8J6DM8NlhWx7HjHxtizNJx8mg8055B9k1OPeTHYssGfLbU9ikiAR9xKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948764; c=relaxed/simple;
	bh=LRYRTI1R6uFPtNm9boDuQ+J2WejITXqetBV3qvxnKrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNE6AMCZXzkI8g3wMEizBsgvx2aDBf2iEXgIHBISA2Z0KqZnSQzM0eMbgOdWiRpjW/UA119MQ0KFwo/YIgQrSytkN8No2f9hDjIm2Fo6TY0xbHx3c+FlRAmMfI+a+cvLLIu0C6rqwEDe2765q5msiwqea7ZIB5yTUsYLA3mfbS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBIeCqv7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8296dabef74so5593230b3a.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948761; x=1777553561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWTak0AZpT5PAGRyOPrLhAfTDkzNQwl7PRRG7ggCKJA=;
        b=NBIeCqv7SRrPuee/kwhnCo2cq8CHQyYdsAz8nHlaGU1zpCXTHjejbJ7vxwQnyQfDL0
         1BXd8UjObTFx+pRY1vWettcV3q7M4/HiIZGaHSM3BH+pz5TD1aiXZsKUrwNqUzzxVhD2
         oZKzrlh+qekGm4eFA5OlNAseLX1HXP8YYNRg7zk0eQRupM3ZIl4GVSoBWL1WCwh6BchD
         KSFU1dhTLFOUk4sjJ8q9Pc9PxnlkZEyJR9rXHNaWhoeRvmNqlJ9KbAvrbxzEyd/qlHtC
         roKcm2DuEzh6a4MRzFsxDuEGxgPl/PXWeUaaDlveOzij0dXLsi7E8rHCC3xpOGk5dTG7
         UIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948761; x=1777553561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oWTak0AZpT5PAGRyOPrLhAfTDkzNQwl7PRRG7ggCKJA=;
        b=bp6f7yjdh12Ahxr6a+n7HcRkhZ/llnoIrAyeFZl7fWHjjLYPkWYKlb7EL0U8OhN2I8
         rsdfAcE/BWhMBsGEZtcdsX7KqvDFTf9OJ8xIrEWelEvhZ946My+8LoG5IxXX+vuNhy0V
         ywCrWQWw70jnySyfAMJ6VBGoCTBR8n5GfYcj1wjvKcGQgfwAh6MNLChJTRfZrA6OySWj
         0GvcqnN61mqz4jbw6MWbs/c5K328ACmrOAqVgPGFody4WkVk4Iks2FmbK1V2fZcEqOQa
         mr6Jk+6CFFmZnW0zDKH9TjCHjqN2tX9G2EYPgcPsqchXECJh4sRhuchx7m6jAbDYYJdC
         IeIg==
X-Forwarded-Encrypted: i=1; AFNElJ+37eFZetqzidciXZyQ6o17Vk0K2vVJZglXIDH0coUspiTulg/Wn8WN9T/OP4gxKnke+Ok2pOHVS/OtPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHaKX3xVO9xrRuIAWBgaBAlgq/lUYQZQcuY3zo6kEQyf6sPeCj
	kq6c4TaEUFm2FrnKmW0Ghac3yEUdaYwgEZ9yznsFOrXKnXco38YjlB1i
X-Gm-Gg: AeBDievoqLlsqlQFVc/GRS5dhJZ8gRt6MEZT0lbhG/XrMIFo51lLCQAXbXBdYYJrvYi
	nk0SibcABe1wlTdvsbDCd5pQ9KCx+Q1wCB5Wpe9INyHmBlr1KcOcuqu4cZUMLo3pOvWM53Seuyt
	Iozd5SsWWbvfQyp5CqbgpMKKi1+DXVxa1RcwR9x/BvBNm0iJyeKui0y/tNAA0zv3j6bLCkM204L
	qAK5dTeMzZeb5WbwTuhfbHNQHzZ2bB5b9304serv/ypejs5yYaQjQLGsv/pkOVCKl7aUKj1Jr3u
	EM69yptpgAan3j6AnBuDEvq60RBd06dAo/CLePgoPaRnKc2gYzw2w/+TSpcnrsgAt53NoJvPdZW
	CuERLdvg4ykI7/7JLuM2AFri3TVYACgidbDZcaLw+dScykRWDeh4YxcVtF7s4jLXu5kJq6F6CGF
	SkBDBPCkgzzYFu5c1HZUEJu5L2Si9L9VwnRE6toGi9uDOr9H1GnGu7
X-Received: by 2002:a05:6a00:3017:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-82f8c92c6f9mr27395845b3a.33.1776948761480;
        Thu, 23 Apr 2026 05:52:41 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0092bsm22043687b3a.50.2026.04.23.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:52:41 -0700 (PDT)
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
Subject: [PATCH v5 2/2] media: atomisp: Remove unused DPCM helper functions and declarations
Date: Thu, 23 Apr 2026 18:22:16 +0530
Message-ID: <20260423125216.19217-2-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423125216.19217-1-debjeetbanerjee48@gmail.com>
References: <aejF4OlVJtKSknxg@kekkonen.localdomain>
 <20260423125216.19217-1-debjeetbanerjee48@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59404-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1920B45263A
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
index 9de9cd884d99..07189230c308 100644
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
index b12bb65be3f2..b399319ae2c9 100644
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


