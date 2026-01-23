Return-Path: <linux-media+bounces-51430-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGqXJKqUc2ktxQAAu9opvQ
	(envelope-from <linux-media+bounces-51430-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 16:32:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 176BD77D25
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 16:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3B35304C957
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF15285C84;
	Fri, 23 Jan 2026 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIaqrHv9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205A1FECBA
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182277; cv=none; b=ZoRATxY7AUFtGCDyVl3BSsG6wwnmjYdrwhSlRbCBJmlsmrl2gtuvIG3QMMPRk9Pre8xZveKqngmAbjcJuIXG/2rjFt3EAZ0gTjau+WR9FJtmqd2HaDlfo7k4VZaxzmh30OPsb9+OCdsu6LrOF1s70r73odJCPisJYRqGX2eRolk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182277; c=relaxed/simple;
	bh=+oPqwWYB5kMihWxewcL2Fxdrxt3yA2VXqyiEP1tqgc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6ClgCCS4l+r3a/YNdZzXni6h6A4MI9QRX1sL2wz085eMuZGpW+X4Nkl8C7naaBZm/LZq1LTEe2Amb2LyhdamC4B6ChcZtehjvEIdZy3aWLnWnAGQqtrb57zyUXLpvaEEJALu0ZZm2/gZldV6vi72vFOitLDYryk6U/+q7k2AlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIaqrHv9; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so1543961a12.0
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 07:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769182276; x=1769787076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r1qk+ARscTtmVdRCZrEBAhBX3S2S46H1/xkuqvs8Pgo=;
        b=QIaqrHv9NWz9Qce6zutTEe+hhIHZT/czYxDYLLqoaCSMjfoxZevmZ0P4MNpokZyP4h
         7jfqb/MZ+mGyfKiJiZZzq+cEasghoXI8PoKhfo+jAkcQCzxo6ArJoPrpyBuyOGs8nkAC
         uk7dkfXCOMl7WjK2sefX/u7ZuID+sFpb1S8O9CYd8+O4sRwWlQQO6TZ/otqSsH430nUl
         Ja6iRaYXzuR7bLbub8z8hm2Ib0nItVIrYroKR1jbtryaTWCYg5vf4mV1BG0JJDMrpJjJ
         SDZTdFQpNxKOoIDBsQvxPpjwOxqBCuK2fAiVinxg4hkQWE6PNlwXyYOiBIQ7/wpb3zFr
         /C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769182276; x=1769787076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1qk+ARscTtmVdRCZrEBAhBX3S2S46H1/xkuqvs8Pgo=;
        b=ayniEVitpN3kMr8y/TzlX42CVkM2tyol+r0Vj4sYE3qjmFsV1Oi180Sqrui6j0jJYF
         W8QTEdPgLPVQ31brYSKjRvf3B61jeWBBo1TXhT0si7Dx3JCmJtamHE+Hd0rM6jwnO3vk
         gUi64TJqQ+2262vxSMw2RA3xbA82U11BtUgk+uzHrorIN3fz52KX57JJQrbz0i2Mqx5E
         P421wtjHG/F3r0YBBsTvzLg41LYgFiBZKrx3iM7WQeFeUwfwXhwXhuxYC3pFa5JKvv2T
         JvD3Q1B+4JpxH6TErsWVHZaUvDuLbCSyDJtoLZNv2tc1ug06AaXiBwibY5uMfik7tOwV
         aYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoZ/CxXPSzqMhf8dA7SbzIV4UtbuVeu4ILrP3VYaKK3ov8Ul0RlSQF2LF20AYzWACKF6F/eBbGYjOVfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaGfO0NCnvFvvQsiTJxKpSpcco3AtDpdbb7sGKdQWIxSVJ2lTM
	klVnWgXTCuWZl19epMrF8PsJczBHrMTWK4D5qD24KJbTNJ5shh8DQpNV
X-Gm-Gg: AZuq6aLVii9YUebp5mWNw7L6fEMjVjDR5/+x+TWP81gL5ddIMyxK56osyTUHzUCF7Dy
	khMKTqZY9G8BIWU5NrIwzFuh0psT7YfQmK5VBILt7DR6IV04cCL8W0XXx3H7ctmV2+FjLhTIdVB
	qKuiU3KlVGuWiQgNGI21vdfdrmL0sN6VkTicD4ZYyhtxoFRWIFS7xcyFIongnDWnF42JD1zIie3
	vxVB2Xa4f/y9jwefJb+HnPiU/oMPqvBG52xlxC+Q3RDEFK+Op+XhzENJjeUJ17tJvkBsnnb0B/L
	5IND62xLhE86RBphHm6KHgyXZxCKvzXsZkm+cGWXWPQgFerRCiuurK82bROHdSWMzjwfR/JaehB
	iV/CO6v1AFx+PxdvIv7907cVLGfty2SLoFpuLTv3yIhA1/uXbCzCmOkXSWrG+4UnCCrACl5sBFZ
	4FiGtm1gJO4jLbC9/hbMB8Bxg8915Pwa2pppMDDfqxaaT3L4utH3C7DSk8EeSn3mpkziietPKXm
	T4X6mXI/g==
X-Received: by 2002:a17:902:e786:b0:2a0:bea0:8207 with SMTP id d9443c01a7336-2a7fe7469f5mr33031065ad.49.1769182275581;
        Fri, 23 Jan 2026 07:31:15 -0800 (PST)
Received: from nickhuang.. (2001-b400-e2d9-1931-19a2-fdcf-8614-4260.emome-ip6.hinet.net. [2001:b400:e2d9:1931:19a2:fdcf:8614:4260])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97f3asm23453705ad.59.2026.01.23.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:31:15 -0800 (PST)
From: Nick Huang <sef1548@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kusogame68@gmail.com,
	Nick Huang <sef1548@gmail.com>
Subject: [PATCH] drm/xcsi2rxss: use str_true_false() for boolean dev_info output
Date: Fri, 23 Jan 2026 15:31:04 +0000
Message-ID: <20260123153108.19204-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-51430-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sef1548@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 176BD77D25
X-Rspamd-Action: no action

Refactor dev_info calls in xcsi2rxss_log_status() to use the
str_true_false() helper instead of inline ternary operators
("true" : "false"). This makes the code cleaner, more readable,
and easier to maintain. Added #include <linux/string_choices.h>
for future use if symbolic flag printing is needed.

Signed-off-by: Nick Huang <sef1548@gmail.com>
---
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 146131b8f..e0c5b2ceb 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -17,6 +17,7 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/v4l2-subdev.h>
+#include <linux/string_choices.h>
 #include <media/media-entity.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
@@ -400,19 +401,19 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 	dev_info(dev, "***** Core Status *****\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
 	dev_info(dev, "Short Packet FIFO Full = %s\n",
-		 data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFOFULL));
 	dev_info(dev, "Short Packet FIFO Not Empty = %s\n",
-		 data & XCSI_CSR_SPFIFONE ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFONE));
 	dev_info(dev, "Stream line buffer full = %s\n",
-		 data & XCSI_CSR_SLBF ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SLBF));
 	dev_info(dev, "Soft reset/Core disable in progress = %s\n",
-		 data & XCSI_CSR_RIPCD ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_RIPCD));
 
 	/* Clk & Lane Info  */
 	dev_info(dev, "******** Clock Lane Info *********\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
 	dev_info(dev, "Clock Lane in Stop State = %s\n",
-		 data & XCSI_CLKINFR_STOP ? "true" : "false");
+		 str_true_false(data & XCSI_CLKINFR_STOP));
 
 	dev_info(dev, "******** Data Lane Info *********\n");
 	dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
@@ -421,9 +422,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 		data = xcsi2rxss_read(xcsi2rxss, reg);
 
 		dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
-			 data & XCSI_DLXINFR_SOTERR ? "true" : "false",
-			 data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false",
-			 data & XCSI_DLXINFR_STOP ? "true" : "false");
+			 str_true_false(data & XCSI_DLXINFR_SOTERR),
+			 str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
+			 str_true_false(data & XCSI_DLXINFR_STOP));
 
 		reg += XCSI_NEXTREG_OFFSET;
 	}
-- 
2.43.0


