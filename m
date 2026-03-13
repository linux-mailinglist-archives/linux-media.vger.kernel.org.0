Return-Path: <linux-media+bounces-55762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL56KXlQtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:59:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1568128868A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C6B332738B6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838F93D648F;
	Fri, 13 Mar 2026 17:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZ692FdW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031532367DC
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424538; cv=none; b=QtntGB5ITgLR/RftoaLaguON2B1qKK+iFfTSDHfKFdxT0QaRPRzvaYhCBHgmfUytOTevRf2JyV7J/amr9qVkrJ08My3O7O+gNTjsK3CtwLoG4zQ8dlB45PcgOTu2qLX8DgmpXit9Dz7WVqgh3AFwQ0D0zvBIdpcMsZGSLlp36W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424538; c=relaxed/simple;
	bh=9Gq0qj8d/rF77AtAbVb6xF3t67Z8R3Se/h26S6GZoJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rYFWtp2oK1EW2wgWRuosnmkQwaZ9jSc++UB8X4BkQtaM3pJdvqriotmdUPEHB6+LGq5nSkQl20f13ZWBzVPl5GWcIahkxIR24SdOvhOetlyJFOGFxSdDTedjJe2OX2uXr9qwgOyi2DYSx+c7Hf0XOMNbC3R6QL5ub02cdfErkhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZ692FdW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae3a2f6007so18343855ad.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773424536; x=1774029336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDFQWeInsFvR4o1W+3qvLdyqVqLtdW4pPGax3mpxcUo=;
        b=WZ692FdW+QX7inFYw0LcC/zJn++AOHZ4QOVZlfNyK24nnEML8qWWqMxdqbh3JQ0YGk
         X0tN3mPVUz1CBteWQhxMNSgvXinW42dOBmU1vmN0gWf9wfxdlm91NvbPujKKu1GgxWiw
         L9gqAY26r/+pBYCTwdW91FAwFOGLN+dFjZZ1FRodGjWvHqy9MSgLHHm5r7aGweoMLO8a
         FneUDXyjqdjB+edjDiZIsFlUQAD9folanwOjqVKSSPU2xvlpreMCUGJp+mBTQ8MEHVSq
         h+I0lqT3PAyqxO84IveaLITrgPU5HJL/5ikbtzrck3Surr3hNOVjiLbBikd9mdDr2Mls
         tDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424536; x=1774029336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDFQWeInsFvR4o1W+3qvLdyqVqLtdW4pPGax3mpxcUo=;
        b=JGQgXXGHzxhUnDGpB/MxGwJn4AIeDCijAN8GXDLANKndZ/lnsmNzT1bc3sahjif/Gn
         GNb2MMZKt2kh0BKjZ5oaxCSGYPZasUpRt4R9P61cnJHecmVku7901eZ7s9cobaSjGtEp
         dOVl2hgurrNbgQErqsJXXGVYuatkm6+gPD+EGGWHuqg0tmBIfhGHoxFlvos03+6BQMbY
         XvyEA4LyT5d8CmC0H3BDBGzTssRhQ4eAqdzZbqVk/0RK5JPzHSsLWo1M/TKBC1LPqGTq
         KrLPLpNrryLjjZwY8Rr5sr8zGNSQo8My7CNw4cdxxwvk2IS7CafQ+r9NkhJOBr/PXlCr
         AJ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+t/Q78BVIrNyVxWK5kjihrZiMeaLlIv879bAJJxYuxHhfC20ook2NZEw6eMBMz5A/A4QgsEwjIm9szQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4uBz2pFnFF6SC7Sm1ONrP7wEBdlI3lAtByBlMujVEWpTU+XyJ
	E/MBoQwIg+4bsQ5G4nmM1YDb8G2+ow4jTFnlzf05bUVfwuVHitOCiO0IqNLjNDrQ
X-Gm-Gg: ATEYQzzAyZFZ0gBt/fxdsZPg2ySqkhEBnaksf74DU/kPGvsMDOvyxtn4Jo3dsIoCG2y
	+euPr5wpsAJeZKvvb8GyohK9HqjMktJF43++G8OICA6ZTYEyl1XECOfe6eEBg7f8Kv7suTvYr99
	OQwEql7ppicDBAl9JD6Qi4KLiKMbHbDYIeJVhLbpepXEyeFANkuHoN+xsE3CFQgqPXfSmvjx9jf
	GMJcxE+BIS/34x50fByWQ1ugR5KYZYiWVEFPTI+yoShh+/8sTJNZ4C4x2B/+ag6JYBm9XyZhxcv
	ZzDtHF7shRl3yOkIhdjwS96DC/0XYpeMUNiIKm0dax5WdU1QxBHyVTsKDGOTsaBFu9QQchURjqU
	42anYNrwDah7HrYVNMl1B6qYmr4SaxQ2NNiQ9nL+05FHOngVDjcqzyzYdZ9XH2+CkPP4RZgdjPc
	LfOA8CbBPNDtPwGwjCMI1ohkenDKcrNdgJSFnutizG99m8ZZeC8F5rcFIyWWii414EXlwHhIoC9
	ErdLEc0rLodhsUGZFNDnlW2+zQPg1RWRxDLpQ==
X-Received: by 2002:a17:903:3905:b0:2ae:a70a:2af2 with SMTP id d9443c01a7336-2aecab1ed76mr45383925ad.29.1773424536417;
        Fri, 13 Mar 2026 10:55:36 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1632-43cb-2c60-f383-892a.dynamic-ip6.hinet.net. [2001:b011:7803:1632:43cb:2c60:f383:892a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece80a3a0sm26209175ad.65.2026.03.13.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:55:35 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	starpt.official@gmail.com
Subject: [PATCH v3] staging: media: atomisp: use kmalloc_array() for sh_css_blob_info
Date: Sat, 14 Mar 2026 01:55:26 +0800
Message-Id: <20260313175526.14974-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <abQ1nYvEpKV-rkL8@ashevche-desk.local>
References: <abQ1nYvEpKV-rkL8@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55762-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[starptofficial@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1568128868A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the open-coded multiplication in kmalloc() with kmalloc_array()
to provide overflow protection and improve code readability.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
v3:
 - Resend as a single patch to fix the incorrect versioning and
   numbering (1/2, 2/2) in the previous submission.
v2:
 - Remove unnecessary parentheses in kmalloc_array() call as suggested
   by Andy Shevchenko.
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf5549c23..af12df2f9b09 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -253,9 +253,9 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
 	if (sh_css_num_binaries > NUM_OF_SPS) {
-		sh_css_blob_info = kmalloc(
-		    (sh_css_num_binaries - NUM_OF_SPS) *
-		    sizeof(*sh_css_blob_info), GFP_KERNEL);
+		sh_css_blob_info =
+			kmalloc_array(sh_css_num_binaries - NUM_OF_SPS,
+				      sizeof(*sh_css_blob_info), GFP_KERNEL);
 		if (!sh_css_blob_info)
 			return -ENOMEM;
 	} else {
-- 
2.34.1


