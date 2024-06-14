Return-Path: <linux-media+bounces-13246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB490852F
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B7E92836B8
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44101494DE;
	Fri, 14 Jun 2024 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WG81ZioM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50E0148FE8
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350632; cv=none; b=GemUZ+RTMuAmLi66eNsC0giVcoplC4XnAD2+9ql4fs+4Xh3Tg21apcyZz1Qe2tdzZpLoov+rckTwL+xtP3qyqhjnAo08LigBBeDoMBQcqOSmU2J8dBJtud/sJvvjoS10UpkXEDEvLjEATateVBFoLm3kLpPsxgtlbWnZVXsdL/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350632; c=relaxed/simple;
	bh=BleE3YrUqki2L6wdH1PL/JIfe6lof/p6CEI/YRYhsC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQ26bGI/B6/EpVHgWtrp2dFfX/KZQsk2+CuqH10TmApovum6GuMymkAi01HlAHAF9zz2w9ZIZTG5TkwB2P6ZwuyTlvU1zpwFbgfAXXKN68sK7vvvWMINnrp/edA29l5WWBeuam/4Y9nadISkgmvDhyjvF2PluUmpUbKh8lgRrTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WG81ZioM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7046211e455so1454281b3a.3
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718350630; x=1718955430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgjUsjxAuhE7yxtL7mhkpWVXoSQBuyVhR4+JqVL2fPk=;
        b=WG81ZioM4vZQQHkhxvP6pARwjUFEA87tHzZi5A/2juoxH/224ZaGsCtstn7PscpNmH
         dkwq/hDmY4bmag5jSB75F3c3AQJaRlnezMQEce4eK4+QRa/JW1eiPFf+6OJ60aIuGmii
         qoaYX56PZK3GLclX+MEiPohQMAeM89ElCFMkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350630; x=1718955430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgjUsjxAuhE7yxtL7mhkpWVXoSQBuyVhR4+JqVL2fPk=;
        b=XPYbUKQi/nggD8yjHBhz/h/3qvf7Y4gf0MTN8Y2ZONuT2Y0bjPMn3RDbiYNW2lAyDV
         f1xyshRuPJ7m/Em/8trerZ3nq9ITniw7wUVX9GNAra/ZgLDcb45Js1EN8iaerqHr5VJE
         2qWsfYXmzkY/uiCCDGKTRDSgUDas15Nme/REldDaTkJJU8sITgqF8A0JnGad7Mg7QEnE
         bpHHGFNTM8IG8TIEQQ5ex3L6W2KZ52iI27dYAsOLqgGLvofVFRzIx683YYnvbgPMEL67
         w7zwzyy61J2wPTXyAOK8+ZjFAqnFtaYobxtLpN3f+YjzpCXjNf0PuyUikGoMC7Hnv0gM
         mRoQ==
X-Gm-Message-State: AOJu0YwTX4kXTgOTtz7YR6TZLYZggV9WbxcSGfcZnboxfKXU7KvUgfKE
	xHfl7T5fjRxWV0c6ZMkf2Y1hVyDfmUA1UMh2EoweyHPQ2vW3lSrUJeanewlzA/Ts5fifki9hCPw
	=
X-Google-Smtp-Source: AGHT+IG8G1B3MaGMB870Lg8J+uEaR37wTY5u7XVmYr7MDJRFsIWvwgB0U8NhCR3jmpBcRnnefm2MRw==
X-Received: by 2002:a05:6a00:bcf:b0:704:3491:d74e with SMTP id d2e1a72fcca58-705d71a6e30mr1788476b3a.22.1718350630074;
        Fri, 14 Jun 2024 00:37:10 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:336:17cf:71d5:5733])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc922643sm2468382b3a.31.2024.06.14.00.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:37:09 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v4 1/4] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Fri, 14 Jun 2024 16:36:59 +0900
Message-ID: <20240614073702.316810-2-yunkec@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240614073702.316810-1-yunkec@chromium.org>
References: <20240614073702.316810-1-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clear vb2_plane's memory related fields in __vb2_plane_dmabuf_put(),
including bytesused, length, fd and data_offset.

Remove the duplicated code in __prepare_dmabuf().

Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 358f1fe42975..a26130706506 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -312,6 +312,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
 	p->dbuf_mapped = 0;
+	p->bytesused = 0;
+	p->length = 0;
+	p->m.fd = 0;
+	p->data_offset = 0;
 }
 
 /*
@@ -1421,10 +1425,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 
 		/* Release previously acquired memory if present */
 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
-		vb->planes[plane].bytesused = 0;
-		vb->planes[plane].length = 0;
-		vb->planes[plane].m.fd = 0;
-		vb->planes[plane].data_offset = 0;
 
 		/* Acquire each plane's memory */
 		mem_priv = call_ptr_memop(attach_dmabuf,
-- 
2.45.2.627.g7a2c4fd464-goog


