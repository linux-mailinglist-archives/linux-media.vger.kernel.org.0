Return-Path: <linux-media+bounces-50156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 283BACFE5A7
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24585300BED2
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939CA34F27D;
	Wed,  7 Jan 2026 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnixAfnA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01034EEFA
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797006; cv=none; b=mpOPDIZoQel2p0e+4W3gFThNpkUjqWn9Pdz/A3Jqe7+JKwCg+acA4mJ+rAP4WCnj9ppF1MwSICg9Fe/DlspZasFvcMdB7heTUHiBwzG1sGEvrO0ZMGW0mle2PjGHYY/nWnOBvI40tsw9LCU60hAxs9TphS55MyVrLgMcVZxBZoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797006; c=relaxed/simple;
	bh=F+gAIIyNiSdf9+OMh6aMRK9Uh/Iu6W/YK5YqgWTJwA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALlWRYuruZPQX8X3QpHzc+mFWkv5sgohfI9d2tGR/xOaNsjNaHxpXim15DJa2wWc+l693IqxOy6owSnGgFZDpKMk3hOAHsXazFbWcW+lRiaDlq6tWJh3+tfirhKWpyfSLiicHBwTtDq134BiBzIxrnP5PkMs9CIpWdrtnRw+Ss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnixAfnA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo1689335b3a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767797004; x=1768401804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymGRBUBEtOEh9YhC7XXdt7L3xfVzWmbMSF9czlDoLQk=;
        b=dnixAfnA1gvKi03TNfAV+/NSgpdTO4CDVMRYau/tOFJmlo58wTCAgDh/bku6r146AW
         Voc15RTCYiQmNWGaU1yTxrYES54f67OqIjofY2lD5SWRlki37L4/L9Oe9K7vkFBXP4CR
         Y6XcuaeXjfvRjwJMHGuPdaHX1x552K9/yvsvrUOe+knOMpgK47flOr6jC37r5eEVyStg
         14lOGG5rKGlz+BF1vyuEO46ih0eGFpf6LGjW3QiHMCc1KgALnT+vHEAe8+mfT0NRBt0Y
         FxG6DZwXie0yIqa1jT2HLoqnq9qMohghbgBPqGjqXm5G0BbVG2DsXnEdTlt9ryra4xnT
         f/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767797004; x=1768401804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ymGRBUBEtOEh9YhC7XXdt7L3xfVzWmbMSF9czlDoLQk=;
        b=JJ57410RK5Ba+E939ROndg6uffwhH0xR76U1/JCyDK+5VPL4yOH9EquqVQOp50D/Ms
         Nl3FCDBw/OB0AJrBBmxRuJY11I9Uer4BNSWepXZAdlv9wQBl3PwHbRUCzKTbqC054tis
         Br1O/3VzPxO13g0vAzlQ7iTgvxe+gaAP+IobTQJ0zXmL2qz6Dvw1s/piShoFO6uRdsaW
         0T0ykI+5Y02toiaJTtgvJxbB2jLClBsvZLw81gTjvu6StwY0AwpmUcmJ9vdIz3tZb1ke
         zNV1qbSKd7XnpR2S/NMAZTHmTZR2WGeAfb6r/+Kutp8ClKYxvWMivzqdWSFTpasOO45T
         BYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOoxwtbTJHatjDXxZIvpM3hT1F/KrprnsdPFP4t5Sbq8US6GuSHajlmy5JPIPbtNmcQgigDuaARMx3sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHPsrIHMfU0e3MPm5Np2brSYskCuB/ocGkjuiNuFDUfguN+m49
	84rt0O0/zT6ybU40h6ZGVmxRMdmBThGHT9Hdp+iUOP+ciDPrH7y53cpc
X-Gm-Gg: AY/fxX71qYjEXQEgcZU814aN3GROVHdKqVqNm3hVJcn3FNGPbKZBn+z35pJ+Wh7PtlG
	1KZSSwCw5qz1n1gwWEHDDP6v3mW29lRZMerKoK8yJkWHTHxm3UCP8pWVWjEBllHepXDLkTUW10F
	Y+giBGXySH8VQcn2vkwLmY77VFYlQTxHBD7Kg8Ur9tGpcOyXTXlDN8HrrGtqPrdf7T2N1W7l+Sn
	fGB9AF8Vqzghm79FeY3S8cYSPjmrCGcK9zJyBSAlHudE4VKKvcayq98ZG9AXebBJLgmoDMcY7Gd
	DXg/XvtxI/kdyPJPTwIBibbYoAjDoe3mcURYsC9aug4Td5Jyer3GjCeysaEzmj3qXALv318xFx2
	20fye8rl4YDoJibJ/xa9jfSS4HsdWt28sB5FQCWw/vV6EBXKJ+MFgQQ82nTDL0iWdq3957XYiUS
	fu3y2MS441b60=
X-Google-Smtp-Source: AGHT+IFsUPunjV/lY8Qb6jCnT9IV+LNp7BnjiA4+UFwp6AOzMaK/muVQLFCGpc1F7KohWjA1CTiNlg==
X-Received: by 2002:aa7:9a84:0:b0:7ef:3f4e:9182 with SMTP id d2e1a72fcca58-81b7fbc8cdemr2184402b3a.47.1767797003890;
        Wed, 07 Jan 2026 06:43:23 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59da826sm5168936b3a.46.2026.01.07.06.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:43:23 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v3 3/3] media: atomisp: propagate errors from ISP xnr and IRQ enable
Date: Wed,  7 Jan 2026 20:12:52 +0530
Message-ID: <20260107144252.74666-4-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107144252.74666-1-karthikey3608@gmail.com>
References: <20260107144252.74666-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the return value of atomisp_css_capture_enable_xnr() in

atomisp_xnr().

Also print an error message if atomisp_css_irq_enable() fails.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 58201dedf..a3dd8a5b6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -874,7 +874,8 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	if (!isp->asd.streaming)
 		goto out_unlock;
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	spin_lock_irqsave(&isp->lock, flags);
 	isp->asd.streaming = false;
@@ -925,8 +926,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_csi2_configure(&isp->asd);
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-			       atomisp_css_valid_sof(isp));
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+				   atomisp_css_valid_sof(isp)))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
 		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
@@ -1196,9 +1198,7 @@ int atomisp_xnr(struct atomisp_sub_device *asd, int flag,
 		return 0;
 	}
 
-	atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
-
-	return 0;
+	return atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
 }
 
 /*
-- 
2.43.0


