Return-Path: <linux-media+bounces-34847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF725ADA5BA
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 03:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25261188FFAC
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FCB1B6D08;
	Mon, 16 Jun 2025 01:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGhMw6fC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206719E97A;
	Mon, 16 Jun 2025 01:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037638; cv=none; b=Tms027wUTxT29SIvKkcXTZtcKMqbuJ+oUZ8sQ2xpNDDChTGybxiWRtARYOQdaxM+3+6QABL13o6uCAFU6/V1bKyDIIR3x/twU+e+zP7qeka1sJHT+PC42rvz59G9Xi03+5J832Cz0gA6X515JBxZfpmDak6hr8PQUMs2q49DBHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037638; c=relaxed/simple;
	bh=GuTlDs1pey6YnUsri3tfJ0DTgcqiRWdCk8ZIUpCJoO8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GyNgRlLoniN4W5TVspYd7BvCFZUigQXLAQWe+3KlqKS5hOMboOYvPvCG6hE87AkC+y2S4PRiNY0HXTvfHSJfdXbYaKM5BUVqoJGr1ZASPALm1Zj1iDKUYpXothivitnCYlS9aT7coo3mMXc623HTQjglJvEFH6aAZlAOM9Y9GG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGhMw6fC; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e7d925ff60bso3376678276.2;
        Sun, 15 Jun 2025 18:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037635; x=1750642435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Mhr82+8yMnKVdjTTOu7Z+DWlwcJ9GjNXcEnTyRA0Ag=;
        b=LGhMw6fCRWPWmv5bagTI27sJrlCPpVaXTVTVJgxmgPwFSAv8k/3NPLpz4Is9Mq5JPN
         D/Y10YK+BDdA3uYRmtIWZRouKC0JaagClvA8uWfaQ1cGDhI+u7Gkqp6YkI19w0samuK/
         5DUo5r1ra1TCIXdmlZ3sur31AIBnpFvK8o9tbfINef862I5KeZty3aB9WlHBVnSMn6zR
         fNFqgTlFJAC4r3zDe9I2NV1IaGV0+5Zz3rkC4t7AS+Fd5DnGSilApfJuGxvIDxtOUQqa
         X0GMEVG0sIqNqLFgy/ukZaig+0gufrhx3hjAtnXAQs89HnhVGyCryachIHZyCgnM+5OG
         1Lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037635; x=1750642435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Mhr82+8yMnKVdjTTOu7Z+DWlwcJ9GjNXcEnTyRA0Ag=;
        b=AN6DjJ+Omr3ALpLf9UppXG55QsYQrhTl3cLr52GzCVjQgQjt/sZO6fb3phivPhW60v
         4PPzyTXpuV7OEPny3aw/XC1epaQE2ArtiZ9RqJN1JabIBV2vXMJdmC1Z+2/v4YZnP8xG
         uh0Zo3o9lygM6NFXxCEk6kjwARjZy8a8V8osqfAYkbt5OEdrQfW5iK8DHP3Mg+qAwmeZ
         75LBYGxkfP6E7sgLNOZAPhuFEMRRAAZpJQt8/RkaGXdc+O0FTVKNNzxHkKLkt2KpTx21
         u/mp6JobC2w9dQ6ZGgKxnDkJaqvwZPxmkzyJ/Mz3ai0XReLdgU5uZddj8zPnQciPW6yf
         gN9A==
X-Forwarded-Encrypted: i=1; AJvYcCVU9na1dgj0acfNYZDX4m0ZTCrmJS+aV5NO8l7+sGDHJs2J7zzq8vsrNB3cdal/TzBMibQOnODtE4anYGA=@vger.kernel.org, AJvYcCW/H0bkatHrNlljhZqrHLCAsVV2ZkqfpTgPYNYp93QmWpH34ywuM7QTeNWrjayIPUr3aJmGc4L5AZeB3FA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMIYYYu2FYiyVczBudoJx2K/IvKxxSHQjSgOHRy3kwvawsrgYE
	bK0oV3CHl0+SlBO8jsALzSNK9WugLeqLRiR/q4ioR5ghgGwRz3G4BfN/
X-Gm-Gg: ASbGncsXYOatI0tPa1+s9z9fFxdjidFQSfAf35FkIlnwAWQ5ob+Ah5TMhXzgJEH6kNK
	EH/pgqmiIMMRAmnUjcTnOKqWUghEiq5Q/KYJDnaZGyFDTNhM22scaoVtMl7SIHmebUdpjaAJHT5
	ZAydhjezpcYXK31C1KrJ9HqJwnwkCvHRc4E5xBrnOj/39Y2ndT27HRUaO5cOQ/DrkPnheaHKhQW
	sL69DaiuSiGcqYOZt1a6vMSteWoZnZn9BBDz85J4qQosjMgRvmZIfwyi6kR8TLfMh06XblG/W38
	HZHQoroqnTntZWY1ksOZ5ZZPcHTApBOHKklM29CACQhEOIw7eWj9AUxXWrlXnvqGnqr2r86gNKo
	B
X-Google-Smtp-Source: AGHT+IGaRf9HGt/bXeI1CaTSx6acXH7kp7ioX0y7qc14kUSXSCEkRrmzcCNjg6PwYJ3u4aNoCE6RlQ==
X-Received: by 2002:a05:6902:2001:b0:e7d:ca6c:7357 with SMTP id 3f1490d57ef6-e822acc73c2mr11133568276.47.1750037635589;
        Sun, 15 Jun 2025 18:33:55 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e06cc36sm2653510276.19.2025.06.15.18.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:55 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	algonell@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: w7090p: fix null-ptr-deref in w7090p_tuner_write_serpar and w7090p_tuner_read_serpar
Date: Sun, 15 Jun 2025 21:33:53 -0400
Message-Id: <20250616013353.738790-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In w7090p_tuner_write_serpar, msg is controlled by user. When msg[0].buf is null and msg[0].len is zero, former checks on msg[0].buf would be passed. If accessing msg[0].buf[2] without sanity check, null pointer deref would happen. We add
check on msg[0].len to prevent crash.

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/dvb-frontends/dib7000p.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/dvb-frontends/dib7000p.c b/drivers/media/dvb-frontends/dib7000p.c
index 9a309e23443a..93e5e873103e 100644
--- a/drivers/media/dvb-frontends/dib7000p.c
+++ b/drivers/media/dvb-frontends/dib7000p.c
@@ -2193,6 +2193,8 @@ static int w7090p_tuner_write_serpar(struct i2c_adapter *i2c_adap, struct i2c_ms
 	struct dib7000p_state *state = i2c_get_adapdata(i2c_adap);
 	u8 n_overflow = 1;
 	u16 i = 1000;
+	if (msg[0].len < 3)
+		return -EOPNOTSUPP;
 	u16 serpar_num = msg[0].buf[0];
 
 	while (n_overflow == 1 && i) {
@@ -2212,6 +2214,8 @@ static int w7090p_tuner_read_serpar(struct i2c_adapter *i2c_adap, struct i2c_msg
 	struct dib7000p_state *state = i2c_get_adapdata(i2c_adap);
 	u8 n_overflow = 1, n_empty = 1;
 	u16 i = 1000;
+	if (msg[0].len < 1 || msg[1].len < 2)
+		return -EOPNOTSUPP;
 	u16 serpar_num = msg[0].buf[0];
 	u16 read_word;
 
-- 
2.34.1


