Return-Path: <linux-media+bounces-38889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA8CB1AE1B
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 08:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 939CC179D8E
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 06:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4672D21ABCF;
	Tue,  5 Aug 2025 06:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki1Yrpi/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADD42135A1;
	Tue,  5 Aug 2025 06:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754374727; cv=none; b=eHiC1VkZ+hF83XQENsKfDYzStqKHYlgbq1X41Wk0rVKTclab49uXpYlTITVt5YZbRbslnCYLfBdq/Djs+VSDDCw63CJJgGtJgXQ95xLMR01F1Xvq0wI6fRrvFpbceGsNTfotXkxoI31+OcC1vbEBdTYE4TmlZne0FdxZVoTx6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754374727; c=relaxed/simple;
	bh=kTQH6NaZ9sbv1f+Rm2ugFeEMF2AGrfqtpW2DSd2AFPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j+HE2G/bZb7jdfhRvC2b7DcE3Px5c1H9ZLoI/QXQxRCzJHdFaxbazeRXUu4goCrpMMP1BanmAe+JOUpJVZV7B1HukEByVG8Wkml/63L4cgE7RsttlkuQmvEHPEdD1RraUfoS6Vvdnp6sFaG6O/x8VzEcaOcKU8JUDCNPW1L45/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki1Yrpi/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76bd050184bso5886522b3a.2;
        Mon, 04 Aug 2025 23:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754374725; x=1754979525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fGHZJELToikpWrlEcySa0pC3zkPCl8tzMg7YyI1CbFU=;
        b=Ki1Yrpi/G3KVFyc0Vc2A/beUeMhgI3olOzhx1wlaK5VC3y3uez3CH5za88p/FFSwHO
         XK1MayDxpCA3SJTsJAgnhtJ1rQZRLjRWf4refgeFUcrifi0naLN6bKhCAmKvyzbD9pCL
         3k+ZTLMTSoQicR+ZZ3cz/S5Iak3qW4c4Oyl1oOUkVvjdJ7WjQXywMtK3bOjnPFKdR8xn
         uPl8ANm1eQoTVZTIKDP9TTDeshYojuor8e6L3wK7MyaXS5KKvj6aZ5JSYCNU/dcWszjd
         6SLuPIFMSxgPvOPpITiyXuSkLdnA1EPUoZZ1JZ2bnEPNBlbtxtKfR/gNNKt7quCzqUMM
         CpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754374725; x=1754979525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGHZJELToikpWrlEcySa0pC3zkPCl8tzMg7YyI1CbFU=;
        b=HrXqq2+PvhgYdGisNXjqHFh0eWBlXVWm8DJEdIr8NyiZFwSRp7fvlueFqO1Rn95Pi1
         m7v8FMmotxsFBzoUJ0CCrMPjnQSrOEpPHKt/y5OPioKl1tgM45jpOdIm8JxlB1vW7pbD
         wabDDWHGSNIvxe4n9WfmQ8p700vBs0KDcznOvqY9g9AB9NjV1wmWycSvLJFWbSIKU7fB
         pFJsbLjEGL3PESnMs9Wgh6gj+Idz9u9T1Y6KYyfdlx9xDYJSRHGdMjJXGVHRj283Zhrp
         B2avooc/v5dE65ChFM+unAxSNSw/urLOg35DL+SWpOr04x06Kt2mGhrzINjWq+kRWX/c
         /aVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBoZmznEZa0soRcj1x2YnyzE4FcUrzVAjR8GtcbYPNeHazU+XxRTu0B4O5nE+V8gqDXCDhu2JvRbYGCDQ=@vger.kernel.org, AJvYcCUUsWX2JHOqZsOM/lfxb5NvKSe32iCYgw+L3myJy8DjN7gZ6H5J1YCI3NbVJA+GsFYBDA5O0vmbWmpwTAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcOg8MTvxQkBjrPRE7vcKHtpYjTCkP0ZuIxISg8gV+9b84IAY/
	hKVvoo7WkdcJjHE6Nuw7bk+qNundQ3yumXtX7VvYdAOnFtGh0UwjqwZd
X-Gm-Gg: ASbGnct4xXj2J5jy5wwmgzqjfQIwH8F2aI6tyh/Qdtx14Gq6cRO6/zwakmjBi+G52Fk
	SzJPPlyh9rPh1I9mSvLOFzAyxLgPLhr+89bSb4YOkyJbt4W5uKLbOWGlUz5XzZ0XPrM9+V1RE0b
	pV7TmT4UbCG+sXCH/gSiFDy7LSWev3sMs1BKlOzgoFa11LTTw0WfPo5R+0ZJj3DSO9tSuksoMny
	WksFR9BuNU+g7NRvdyUvs06IlU1LBZ2cjjJ7GKgHSRTebweyFYUtRZUPM+ifIJY5b1cmH5+gil1
	pW+XlRV5NrPCe48nk4BtUL5wwrY5jHVGvUeQ9fhhuyRgJVQNm16BsqYR9TE2bgkYeiiC6cwdqiV
	WHu66x/gJGSXCtecYK4+XcY6/
X-Google-Smtp-Source: AGHT+IE8nPyMvHh3pB8DMo8HilMGNFFOAKHrsxWK8FE8utvRKfVlcZipsi1Qi7BgLY3ug6Mpthh3cw==
X-Received: by 2002:a05:6a00:3d47:b0:740:67aa:94ab with SMTP id d2e1a72fcca58-76bebfb33c7mr16586220b3a.0.1754374725467;
        Mon, 04 Aug 2025 23:18:45 -0700 (PDT)
Received: from c45b92c47440.. ([202.120.234.58])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-76be9143a4asm8058029b3a.24.2025.08.04.23.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:18:45 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] media: rkvdec: Fix incorrect NULL check for iommu_paging_domain_alloc
Date: Tue,  5 Aug 2025 10:18:33 +0400
Message-Id: <20250805061833.3670085-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iommu_paging_domain_alloc returns error pointers on failure.
Replace the NULL check with IS_ERR to correctly handle error cases
and avoid invalid pointer dereference.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc..1d40e81f44b9 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1162,7 +1162,7 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (iommu_get_domain_for_dev(&pdev->dev)) {
 		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
 
-		if (!rkvdec->empty_domain)
+		if (IS_ERR(rkvdec->empty_domain))
 			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
 	}
 
-- 
2.35.1


