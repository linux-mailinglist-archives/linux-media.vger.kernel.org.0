Return-Path: <linux-media+bounces-52335-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iARME/8Uh2nBTQQAu9opvQ
	(envelope-from <linux-media+bounces-52335-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 11:33:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C2F105860
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 11:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78918302417C
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 10:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D9033D6EE;
	Sat,  7 Feb 2026 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZ0Zs/3A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB6929992A
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460359; cv=none; b=ny2uu6f9Cy3TVMQqhETYjl0X2ZnHAwNjC4Wzviubn5YCLWPR1YlA3rM3IBYd7kpJzP23+yD3GKrWJf51I7tT+Q9CnhbEoHpawHSqxox9z4oIKxu8iqI7JQuMqZZuf39S1VfXKafXiMwjhXZuPy6GwAVX+i1q3/3Wz53Nk2TwGjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460359; c=relaxed/simple;
	bh=M9W0GSNrey9NvUygKYFNPFagV2ThOlSKeNb1KaNgINk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J0jLQBqbu8EB9vw4iDwOI6qGBEhtHMoOgS2HsC6RR9tRcBaFoGQVCzcGeomBihURK1m9Ye9STFk9VuwFUF6Vm6xfurDFRDKNRXD5I4uOfbbuNmkCoXS7aADhSFmzTQHs11a0gDW2cmvdSihHmqwIsTWGVdCnU9UICe85Md8c8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZ0Zs/3A; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso3991284e87.1
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 02:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460357; x=1771065157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zf9LCIc1kzu9VHa7rd6ONhcsgjfjhvw4Gxq8LU0j1dg=;
        b=QZ0Zs/3AS1j/y8DvNHyAI/NveMnP6Q49QG3e4xvP+Hv5esSbfNzXw3AX9PYpKHbUqj
         4iRbjKFLCJS/HJfjnaGQTenBvZxBEkhVsGW8JIKP3zRI5W4NYn/9ZhHLSD3R3bYhKFJ3
         3H9BKsG5Sn1pKRRyh25R/R/uZKTi/Gfk8lnxzyKepvM8YmMEDd8Wh0hKQytbVchucCUg
         dRKhPu1ty2asr7DG3LZjmjoTinVp5Q/itf9q/+ZmN0g6u7W/Csw0VHhAHq2DQZszM/SZ
         tywdE9m8bYsjZBTsC2nuvlw8gOYmmhULsGMVu6OD0gsBjV69VefqX5J3BvqxFlHVrb0I
         eU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460357; x=1771065157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf9LCIc1kzu9VHa7rd6ONhcsgjfjhvw4Gxq8LU0j1dg=;
        b=YwLun4bN29Ek2GV5czr2CQ3WOJLgQRTxwObe6cNNtWHOfvEo/83Lq1zCw7qsRPKUrU
         St6XA+TeLemJWTwwRLNkTUqvI0pvxNah/fH0VlyDAoZkpta+ESjqFVpHrsymHMj4OicX
         ByT5gcHbYVY6l1RIhZK0bkSV21Fk33iX10DHQTj3pceyiql0GUnND4az8RaYMUhcIXLo
         LEazGn5gNsq1UmqlfUU95BU7e2ukib7iKWQwNdSM8WRQuT8aXXNT/sy49HtANvCv8XRK
         QWJ2E+s524oSwaIkcCqu933OfQBOTQtaEsWfnm9mtGhzvIj6wPFve+yXaiN8mPHo4da+
         TeCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqVOU2HnV7gO+L91L7GjZq09c4beSchto+sDQal4Lty6kmC/K1Sd6gydtb3qixhk7SAI+i4DPbtqgphQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXvq0rIAe0N3gGe9HQ9M2M0lcZLJu4It/YncD1ZekHJQfsnCS5
	UiOkUArGbAv1K4axCqmu93qsN1RosaAMo2w81Cih294HyFvmK249fW3C
X-Gm-Gg: AZuq6aJjIIVxh6odOXIO973VocbFUTHkbrt6JPr10ujz1Yv13CdJ7Ji9r4s6iezpHUe
	7NLWIfGZmbPJ1jK5J3VOdG0/Y8bhtt9M3DWWB+G7VxR4oyuViVTzmAbkH7q33gKDQw0zidgJHy8
	9y00TP2DjD6xNTy6C/TWrOd1Ampjvca57Vtlgn5WKS8z0P6TEufDjbhh9GBpfrCb0FQerjBRQ8l
	mxPu1QJ4BxTTXYh0pwSVj2f3vGBkdxXrZmfJAIlhSmw7G7FHj/wIZA/pAHcp7PuziJOhiORsr+J
	+GNLzU/6PvypS7CwQMue1M6XlO85r5Dy+deNwRseO9VM0QNYocRgFClvzsPLxNEp9/X08GXT2FC
	fxaHjvlpX7ORjxH3RuGCq5NLOdMsRd7/U5DGZQ2SWY/Ekncas8i5DAiG5ly5lfJbo5bb/IzTbn/
	YkMWhv7ykBS8TTlOYds4AaA0N/BtKrAjmICODApn/IGmijIKRbWVmL9XLg/ZLMeL2dk2ucCnUz+
	yIKD2NO5TO1GRHQAU7NHRSWwg==
X-Received: by 2002:a05:6512:1155:b0:59e:1930:d932 with SMTP id 2adb3069b0e04-59e44bd7b71mr1859098e87.13.1770460357202;
        Sat, 07 Feb 2026 02:32:37 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e25ed3sm1212784e87.92.2026.02.07.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:32:36 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR deference
Date: Sat,  7 Feb 2026 13:32:24 +0300
Message-ID: <20260207103224.609938-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52335-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alperyasinak1@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C9C2F105860
X-Rspamd-Action: no action

The kthread_run() function returns either a valid task_struct pointer
or ERR_PTR() on failure. The return value was not checked and in the
error cleanup path, the code verifies if dev->irq_thread is non NULL
before calling kthread_stop(). Since ERR_PTR() values are non NULL,
this would result in passing an error pointer to kthread_stop(),
causing a kernel panic.

Add proper IS_ERR() check after kthread_run(), log the error, set
dev->irq_thread to NULL and fail the probe to prevent the driver
from operating in a broken state.

Fixes: e66ff2b08e4e ("media: chips-media: wave5: Fix Null reference while testing fluster")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 76d57c6b636a..bebe2bd6893b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -340,6 +340,12 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
 		sema_init(&dev->irq_sem, 1);
 		dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
+		if (IS_ERR(dev->irq_thread)) {
+			dev_err(&pdev->dev, "failed to create vpu irq thread\n");
+			ret = PTR_ERR(dev->irq_thread);
+			dev->irq_thread = NULL;
+			goto err_vdi_release;
+		}
 		hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_callback, CLOCK_MONOTONIC,
 			      HRTIMER_MODE_REL_PINNED);
 		dev->worker = kthread_run_worker(0, "vpu_irq_thread");
-- 
2.43.0


