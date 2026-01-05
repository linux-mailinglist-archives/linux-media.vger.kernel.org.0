Return-Path: <linux-media+bounces-49928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C3ACF44EC
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 16:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33C74303BA90
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 15:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DE4314A6E;
	Mon,  5 Jan 2026 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLZ7nyLI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B63128DF
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625111; cv=none; b=uS8BDtLMnaMWwjKqrW9GEQFqwlJR8ED78WONsVT8N8KS9Tq6ZRiIk1di8rCrEycgFF3YIK0Fh7jQyAoOvntsO+iyZZ2A/y337NpglzHMF/tZEefYgTN7MFAKaXsq/tYHBbgq7tgLPt9PDKzchqlqrxXNMdPnpg6TjqhJm2SKXws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625111; c=relaxed/simple;
	bh=VcJC7sCWJodERaoTS9t7XlGBxL7hprZHiIDPn09Ne7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgoM1Ni5FD2bmXJOl2NBV4dQXKjQEodhMcZ+meF9QbgaQHvDKqKAYRBpgccvqVr2heNTsL9kYLE8QwzB5c8BJjDToYFaFB+WdsTMO9vAePhag6d9LcNzIHRFZ+9RgJWzs3gbqZuffELcebjnmw2t3QAkohkO7fkn5cz6KzhLzmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLZ7nyLI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81345800791so34115b3a.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 06:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767625110; x=1768229910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw6fgNtZmBe2W56ugS12P5lnC0TRTn4SZrhJOxug+wQ=;
        b=aLZ7nyLI5ISY1e8Lnq3V3hGK4/90QvWT0qYWnZb1+PYdO7fy7UZ7vi43XwCYtOclpc
         QLBJUZZNwX/paQs+dk8MPLJWjCNtsVBDQpGIZnhXX+ZnWd4zNkmx1O/YvZ8nOotQpjtn
         94PZ9IO52oTJEtSuattxoZnHbPMFnoGhb+TUCM6T527NkvE+hGVzi+UAhB8cMOKXnVpb
         rvtl6RMdBSQKtLznImarXMPZgFCUxkPrSiZONvHLuptKsIz3bCFg+I/SglobSpxhTR39
         EllzMR2Y0giGpBzyf82CSo/Myx9uP7weM+c6YbtcwNGsVK21nxwUd/n9fZJ2ebiD1781
         Qpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625110; x=1768229910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw6fgNtZmBe2W56ugS12P5lnC0TRTn4SZrhJOxug+wQ=;
        b=urd1K7mRN9wNkv3qGACmWyW5r5ABXw+hzcTvKu6hvFRwUj3NI/xNCPe9NkASDecRwA
         yRD8g6B+Olxp2mdv2PWYiL5m1PnJ8/jeyBuBxadjYVHAmCb/SixAErGh6ARbhqsnursE
         DTMvKscy4jXxiHLZ7r6q9ik+x4uewb6mDldQ/zvEtuwrM4UKVvMKIJGjkf2iuEgx4ByF
         PgSwrblsUi6YJFyc5KehgVRyYIi1QFOC3vGlvsT7MKMiZJcPbwNAZ6bFYVXPq2arqbZy
         gZzZK7Z7ZdkfFEaRIJ9EqoNAoPgq7utT+3R4ivwro/s5iUL3hlw8f+mKp/rErO9KYBxY
         iMnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOS8kZMEv5CjEP/I16EMkfRukBEFWUXtrEpXzmVk7OuFOr18NS8SQLh+tp/9yJyoMlVfXl5f2t8Gyeaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw32SRhpdNNakKNnAr03nNrrRYXvZwkU4p7p+tv+kemppY4Siv2
	2rBxFe2tWzSozACZczTDComcDAq29iR3mh1wAHMkHOvjXsIHbCi4QCeC
X-Gm-Gg: AY/fxX6twS9OH/vbr96k6Sq8+lsG8fsJa/A9Sti1cZweMKfQmj1jA2WIXJJcHHIj8gR
	eFL+RN0ogIHZWqd3exAkZiPlaVVWA3MVHqDsXLo7nSJdHYpXbYCahJx8pBS2O1IuJ2hAcmc0Dl5
	pu8zqZII5uma536v9+m/Nu/ccnq+Mq1Auh7hPWrvGb7poNeADRCl+Zwl88+0cmkTGzZZKASfh8l
	p727t3J+Q0aMLtOY40M3oRRHxFDrEbWX4D0JCY7rXaAvj1imC9raTIK7E4bIkA7Vf4IFEnFTCWO
	M0C1Puawltm37yZ6A2CF56CvxnHNc/rbih+hvSKGElnMUrmNDtSL5hcVASqeXgYAKPlLQXxvtnX
	y3mIAM/rm5nxpUy0JuDukBgFGZyRyaFpIOreiUPwM/3R+BIA5WiZcGI5Ruf9yyCdo+5dbQzjSEn
	QK6z7sfDAodlE=
X-Google-Smtp-Source: AGHT+IHd0J7CYDZvoLfOcn3yuW4Bcd7pC34RjnYz8x8yPWpwNDXN3La7THKi3GPsSVNRoAdXAZJ7RQ==
X-Received: by 2002:a05:6a20:6a08:b0:342:1f0:9af3 with SMTP id adf61e73a8af0-376a81dcc3dmr42857702637.29.1767625109526;
        Mon, 05 Jan 2026 06:58:29 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e2b81484sm715955ad.78.2026.01.05.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:58:29 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 3/3] media: atomisp: propagate errors from ISP xnr and IRQ enable
Date: Mon,  5 Jan 2026 20:27:24 +0530
Message-ID: <20260105145724.37305-4-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105145724.37305-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260105145724.37305-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the return value of atomisp_css_capture_enable_xnr() in

atomisp_xnr().

Also check the return value of atomisp_css_irq_enable() and log an

error once using dev_err_once() to avoid flooding dmesg.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4ed6b8aea..da2481af2 100644
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


