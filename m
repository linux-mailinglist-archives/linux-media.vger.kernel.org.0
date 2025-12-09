Return-Path: <linux-media+bounces-48496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C82CB11C9
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 22:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 954EE30E0B4F
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 21:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEC13191D0;
	Tue,  9 Dec 2025 21:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b="JU031yjD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A51318157
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 21:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765314578; cv=none; b=UNbBuTEJbDmG2BFiUbeT7bWKIqIeTOFOk3Q0gL4zl5SSJT1Nb43rOZ33VX0YZ9KinuUIjPLX9maXKdMfasWBBiD8cbueSGvpOPNPfJeq3d3rOsyh6L96tTZLG5DKPRE/pwlRIQIxjWyqWsi41pHVld4cpTMV20XZxy5W2QRB5p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765314578; c=relaxed/simple;
	bh=2k0PC6ht6M6NEOEFT/PgcJz9mrmgPJtjnaFtGClyTHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tEIKkGn8Y/Ae2gcIRn1ZMm1Dg+vEPR8HKgYVSUEkL0xtc8EQ9k3kHwB3WJi+YOQb0MhW/jhXaW/xI9/g/lXT7DVQ1bYp80aUwAfi9FTtL+ae0WoQMxtqu3rAw+I2XZoULfstJP7DKTuIEHPj69iyIRmH3OoeDXIse7gSVtRk2pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net; spf=pass smtp.mailfrom=opensrcsec.com; dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b=JU031yjD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47789cd2083so36937875e9.2
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1765314575; x=1765919375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtsQDaRhPI3iWLZbIBK7GGrlOKhFHrt2R62TxY8kPXA=;
        b=JU031yjDtbqjYmXuxc5HbG9mF8JDMdPVDQeZ90Bqi+09+PVRmlvdOonklMjp6sEhad
         41Cu95ZLaNqfCgp5UiWAheFDB+NIsrjNs8whKaI/+2Bnc3InEYn6ezrDmwhziB0ulijo
         Pb+thyAwfrUmrlrtfcYnC2uKZGEoWy0L0ZAUBeKaTAF7WIY87OVUJLXX9xiOfp1J1veA
         gXa+MDY0MoWqj8pBNgStY3nnSDCEQA+Q1aGWoPOG+EJgQRCpPbYcphoxePXmIYBWOmgO
         BOiW5qX2DMdJYbEyHA+RssvGFd09l0DhrEpv3/9isW9fz92n6MJlptCLNit2/p6YI1ou
         +Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765314575; x=1765919375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtsQDaRhPI3iWLZbIBK7GGrlOKhFHrt2R62TxY8kPXA=;
        b=Lo0kWlYfVgp5XTwxCXv1e1CGXO+p3D7a1H+nxTRYLLDMEgUKKwcVN35lVlDkH2nkys
         y/Vjnj9MzCxBHRYmWkGWBUrUy2p37F2xoVIpAoPRpn4NToFNN4mJZ2tECBkeo4ZYSNTG
         bl6TfdSC4iu4vGmRtlaRHLeuFvkZojVAM5gTnfe5mpYROhQiCOreAlBV07AiwntXXL2j
         8KEhYQ9EFjGjaOP24BOQjWytbSyEMKPt5s9S7/DEVG4Ba6/4I6a7H2hTzsaillGlg1Wx
         RVS5MvHBTIfzVvDitUw6q6zayX5jnCF/jyL65csDA7TDh2MeNF7pO9RWD5QVxrEPeGw2
         1nww==
X-Forwarded-Encrypted: i=1; AJvYcCUWbzQXFPRMTr3WkHPn7xGl2fJlvgK45SoTKbcVF1pIII4ECcNN6b3DKZEnaqK2Ztg+cVcCrPRi0zaCyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaeSB+DeW/eiKI+jZOpIAyfDO4bppJHNWKD3q6A0BpOMntyprf
	VZ8kuUQLc0+IeKqiruf4gzndHDAY3CD4MIlYCJE5OCv4RedjXby1AbhAkrJFCgRKroo=
X-Gm-Gg: ASbGncvzGJLPNMjBFnnvta3bD4JbuerAMExmXc5wNPHpYBq5HOXGuEnkN5ClL92Eakg
	ezB47+J/WhKjNUMzKlJs7KRs4Cw0NuwBsSLvlT4ZnDt3MyRwRM+44NBNtTVdrwN0IK8yWoLT4jm
	zHrwWip753Zpjih1mr21iqgpJblNs2VpNSp6OyTnMG3/iYj71voKjDF54Kb9bjlsVR0ixjwkpH2
	s9XPGyU+DeAU/nzf+XX83vF/bhhrPmNm/Q99e4JvYE0RT+dLVMTZzd9R2Qa55GFB+uOcYTJ0vkm
	Hz86ID+jfKuKdHVQjO+TPbOCCNqNaMU+Fn92qVc6FYjzixJOu4Hm3Eb3g62AsZ55i/zSQeu4hqu
	FFUcPY6VLhmoGxTeXcOafvig7xgXizJKVp8c18GoZdFV2cNYY6crVsM0YxSCdmcUIMkx85UTKZd
	ihFWkHgVveddVmnE1cA9LMqvdyAmWccxqaL0v2zQ3DKbhzU4tbsRAJ5ESKozz2BP4JDh54QTRdA
	tba1x8=
X-Google-Smtp-Source: AGHT+IES3w0dcuVSm0JMkRvuCMXWp1JC484g7fQlkWdPEF/a4S7wXCybAkGBmrOuHEVsvSoC2JcobA==
X-Received: by 2002:a05:600c:c165:b0:477:214f:bd95 with SMTP id 5b1f17b1804b1-47a838436bdmr1345995e9.23.1765314574917;
        Tue, 09 Dec 2025 13:09:34 -0800 (PST)
Received: from bell.fritz.box (p200300faaf29b100e8b27dbf0b1165fc.dip0.t-ipconnect.de. [2003:fa:af29:b100:e8b2:7dbf:b11:65fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d9243b2sm27982455e9.1.2025.12.09.13.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 13:09:34 -0800 (PST)
From: Mathias Krause <minipli@grsecurity.net>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-media@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mathias Krause <minipli@grsecurity.net>
Subject: [PATCH] media: mc: fix potential use-after-free in media_request_alloc()
Date: Tue,  9 Dec 2025 22:09:03 +0100
Message-ID: <20251209210903.603958-1-minipli@grsecurity.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6f504cbf108a ("media: convert media_request_alloc() to
FD_PREPARE()") moved the call to fd_install() (now hidden in
fd_publish()) before the snprintf(), making the later write to
potentially already freed memory, as userland is free to call
close() concurrently right after the call to fd_install() which
may end up in the request_fops.release() handler freeing 'req'.

Fixes: 6f504cbf108a ("media: convert media_request_alloc() to FD_PREPARE()")
Signed-off-by: Mathias Krause <minipli@grsecurity.net>
---
 drivers/media/mc/mc-request.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 2ac9ac0a740b..3cca9a0c7c97 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -315,12 +315,12 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 
 	fd_prepare_file(fdf)->private_data = req;
 
-	*alloc_fd = fd_publish(fdf);
-
 	snprintf(req->debug_str, sizeof(req->debug_str), "%u:%d",
-		 atomic_inc_return(&mdev->request_id), *alloc_fd);
+		 atomic_inc_return(&mdev->request_id), fd_prepare_fd(fdf));
 	dev_dbg(mdev->dev, "request: allocated %s\n", req->debug_str);
 
+	*alloc_fd = fd_publish(fdf);
+
 	return 0;
 
 err_free_req:
-- 
2.47.3


