Return-Path: <linux-media+bounces-12561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1008FC4C2
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C48F1F2230A
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 07:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7A118F2E3;
	Wed,  5 Jun 2024 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="li7uccOq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0724418F2D9
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573248; cv=none; b=u5roZ4ua5FTGWTaEkkuPgGslfiIGhVqOBTJRjnPun1WhtqFmh+Kv1/HleMsTaEisPJPqhvloERoN7UOmrLNGeT7ggAkuRAMcxVOKtIFJqoXtfiZRE+U0OMivK9ecQlxlrINe1p1evgkRRnCZ3rHOTyrCjDLa0RURYIrk0J/1OMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573248; c=relaxed/simple;
	bh=n5fDZYdf8tnquDv4cDTSmY4cutIjFCCgX8eNH7j0RRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZ9urWbg0sVpeYBzIEUxaf37o1Reql59QkgDAtp0dOSrSp05NOU78UCpWIGZnJ2L7Wx5vzUDlZ58am4pDo7HYwhIGSzBZGGCuoB0i0/4PYE38/+fP9g6DvNg1FeuISxhsuaasIrdgAKeMc3lLO7w4SDbO6UQUmrtiZCVOeec2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=li7uccOq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7024d571d8eso4036425b3a.0
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 00:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717573246; x=1718178046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvM/pmj9mOQJ/m+0J3H6muW7b88nPJP7pDjAngMaRbo=;
        b=li7uccOqkJ9mcKQn37MJCz9IGgvMUx95k8T/HjTWbClL54ZI1hLGE1xrJVH58ALaIu
         ub6K4ohPYce4ujoyAKjuHicdGayXFkeFO5Uth7CSGa+/m8eOVyV5yjIC8sT+pcu7FXp1
         H8GuC8W4aqw34OUFuP6+5sXU1hmq/XgD5mvgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573246; x=1718178046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvM/pmj9mOQJ/m+0J3H6muW7b88nPJP7pDjAngMaRbo=;
        b=Hxlwt6j2UiYuwC1OcFN1WD8DCrCYR4bMqcYO/3EMUTncdhGCK/M38vxiVUaeMfojXX
         4SQu9fmBpAjWb28p+EWffYHH18kAjhnQRdLJBDp1fy8+6FLe4675s3tr5jK2CQwPooI7
         twi66B9SUogzxgBxKN6iLg6W62h41vB/ufAE2JDZoup8/4FIWRVyw8mso3AhMGiCvIeU
         vGlVhuvB/gKpW2d0nFiIwZgqH0C3oQMB3KGV9EXyGJtOIuJaknOV9jlBmR0uREGs8f5t
         xUBC7fqOallTuKPVA2MEAeEcmORj6mO2f5NaoOkVap6xocpiAwnpTKp874/YpDal35A+
         0G+A==
X-Gm-Message-State: AOJu0YyiMkgZtICUqiId0NkpGiLDH7GPhndq62n9QmhRRvxDukNdvaPQ
	knw5GblhQ/DKDWxueN49ffUVM9A1MLJ/HkSiAuRl7QOg8h3FoGs8mR5qF9b3mg==
X-Google-Smtp-Source: AGHT+IHeF4pUp6YVL0a+U+Df6O/eJtfdEKN0/mNghRnvTagvD1al64Cp0U7hAHg4LClX+W24kzDteA==
X-Received: by 2002:a05:6a21:188:b0:1b1:d7a3:a76b with SMTP id adf61e73a8af0-1b2b6fca806mr2279743637.33.1717573246083;
        Wed, 05 Jun 2024 00:40:46 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:f834:a68:ab2:f744])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6324e54besm95500405ad.254.2024.06.05.00.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:40:45 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v3 3/4] media: videobuf2-core: reverse the iteration order in __vb2_buf_dmabuf_put
Date: Wed,  5 Jun 2024 16:40:34 +0900
Message-ID: <20240605074035.2620140-4-yunkec@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605074035.2620140-1-yunkec@chromium.org>
References: <20240605074035.2620140-1-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release the planes from num_planes - 1 to 0.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
v3:
- Change local variable to an integer to make the code cleaner.
---
 drivers/media/common/videobuf2/videobuf2-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index a4fbc7a57ee0..cbc8928f0418 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -324,9 +324,9 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
  */
 static void __vb2_buf_dmabuf_put(struct vb2_buffer *vb)
 {
-	unsigned int plane;
+	int plane;
 
-	for (plane = 0; plane < vb->num_planes; ++plane)
+	for (plane = vb->num_planes - 1; plane >= 0; --plane)
 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
 }
 
-- 
2.45.1.288.g0e0cd299f1-goog


