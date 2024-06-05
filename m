Return-Path: <linux-media+bounces-12569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081E68FC92B
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 12:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EC7C1C23822
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 10:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4403190485;
	Wed,  5 Jun 2024 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+svB26I"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7414BF85
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717583720; cv=none; b=M4fY3njirWCr1Ek3eC3lXPa0gix7zw7aPoUIdjlk5uhHDFIkDbV13GhtPs5RIdNE+r33OwaOA+tTkPcCytLrKfbDm7djtTsqirpRR6LfGub387+qV3AuCdP21DRBejWSTbFO7sDWKp/C1o9qjVmAOIzeE6lTp0UoEoC5+cX5XSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717583720; c=relaxed/simple;
	bh=Mb+TnFNbSJP6Iep0qkTlKxbTWCbIxU0ja2Tjq4yoXwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cWLErmWMrIlV3gWPV/yZH4GqHrJ7A6YYiHZxAwaxG2pdfeMdTKmE8GyH1BeeBJamN6k3E6KNzCuERTKLmrM4ck+COSfwYPJObkrzti8ZM3A4eyAMJFqAFr7MkKFHKuo6BemajVP89SqyRSTcW8o659YMXPAmPXJeOIND8kP1QMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+svB26I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717583717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HqE6+ZExwsfv3CDHi3cvTIz9k4eRgqbrcI7yiUUwvrI=;
	b=Z+svB26Il6kEgnL2gkqEUsUSP2B/86GwMDWIWcYGQZvNNPt0iSY+614GRp1WAfudqqC2M7
	h6dlfRbQ6XNeLYmirezcA8n6VcExE96HzTLlteXMGYtFwdf71NrZwxP5NEuTuhDO0SRpyO
	QmuzUfSRIiIWwbgJPvtS9jwcVr66Yow=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-nUIz1wMtPB-C15hNo4XwrA-1; Wed, 05 Jun 2024 06:35:16 -0400
X-MC-Unique: nUIz1wMtPB-C15hNo4XwrA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52b7e000358so3939564e87.2
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 03:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717583713; x=1718188513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqE6+ZExwsfv3CDHi3cvTIz9k4eRgqbrcI7yiUUwvrI=;
        b=RyA2dKlGTqmXD7CMxlQ7zakja9KajHIHbersUJgtVjTQj2agbmXwQeZ67NXktHJ999
         YCFRE+2skPetySCTfqXij5U7EmtTBcbDkVsj4KUC6aU2RcT00sNpD4d5EA7aa6uJoyJR
         ihBstN8iEJFMGrxA5wbK84k5pWUD4h9H9ot4TSsArw4z6T72xYOzXvC5JDrT3T5NTXGu
         jJEtyugX2cMZulgxtygjVh5p3reG4Rj6mjVkA4hhPiaTv1VQRc80AIeJ3CfNvrcvGA4u
         mGe+Yeztph/xohmHg8+uhk54MZLHDHQ4C+1biojyjcdTy7qUnWqG64L55yNOWBHbffVu
         QH0g==
X-Gm-Message-State: AOJu0YwrN2CnoQhlXG/5XmfmfK0f6uo6coPPrKG3fqikef2NJqZHWMeL
	JWITpK6yG6KD7our+rrU8r0bNjQxwCpF2CR/9iQ7VuMyC2G+2aIyDQSV8xE1oS4IAvaWU+R0z41
	xsXf0Tpdal4SVIBBbDLS3ciSHk0KQCh+gI2LSrFth+Pg4xv+CSYbvqrspj1XmGYFvfGGbLWKXvh
	lRPn9yL/s7yRETG3x3gQqFlJ7/LnJjmJpvsj+1wnxlTESQzQpOXOmjkUg=
X-Received: by 2002:a05:6512:6e:b0:52b:4f30:9cac with SMTP id 2adb3069b0e04-52bab4fb68bmr1161288e87.56.1717583713395;
        Wed, 05 Jun 2024 03:35:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFScFipmjnd9YRJftMrA4XM5aDawcrdEIFgRPt5cn7mZi1tS5PiDgihkECS8ZKU1LlOXFBSVg==
X-Received: by 2002:a05:6512:6e:b0:52b:4f30:9cac with SMTP id 2adb3069b0e04-52bab4fb68bmr1161274e87.56.1717583712884;
        Wed, 05 Jun 2024 03:35:12 -0700 (PDT)
Received: from toolbox.redhat.com ([2001:9e8:89ab:ee00:9c20:c1a3:e856:8e0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0d77sm14377142f8f.5.2024.06.05.03.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 03:35:12 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2] edid-decode: Cannot support NonMixed MS without MS
Date: Wed,  5 Jun 2024 12:35:09 +0200
Message-ID: <20240605103512.568660-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When `Max Stream Count` is zero, the sink does not support multistream
and thus cannot support NonMixed MS.

An EDID with Max Stream Count = 0 and Non Mixed MS = 1 can be found in
linuxhw/EDID ./Digital/TCL/TCL5655/1723FF2DC6D1 at commit cff7fe4d44.

v2:
 * Log a failure instead of silently ignoring Non Mixed MS

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 parse-cta-block.cpp | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git ./parse-cta-block.cpp ../parse-cta-block.cpp
index 4d2afc6..e976de5 100644
--- ./parse-cta-block.cpp
+++ ../parse-cta-block.cpp
@@ -2498,10 +2498,13 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 		fail("Empty Data Block with length %u.\n", length);
 		return;
 	}
-	if (x[0] & 3)
+	if (x[0] & 3) {
 		printf("    Max Stream Count: %u\n", (x[0] & 3) + 1);
-	if (x[0] & 4)
-		printf("    Supports MS NonMixed\n");
+		if (x[0] & 4)
+			printf("    Supports MS NonMixed\n");
+	} else if (x[0] & 4) {
+		fail("MS NonMixed support indicated but Max Stream Count == 0.\n");
+	}
 
 	num_descs = x[1] & 7;
 	if (num_descs == 0)
-- 
2.45.0


