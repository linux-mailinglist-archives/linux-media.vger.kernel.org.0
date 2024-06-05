Return-Path: <linux-media+bounces-12559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 702A28FC4C0
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1068D1F2296A
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 07:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1154418F2C2;
	Wed,  5 Jun 2024 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kaEB8mcs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8BB18C33D
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573244; cv=none; b=UeYy6GH9I0Sb9kDoslH0GMb2aNiiLrndqHv1XC0+0RhqafUXaAlCtOOzXbI7fPf6JsQkfSvftPe6GoykrXSI39QUVFFHFOwnpZPifeYaOnCXfw0jn/1CdlqQU22CB3zG58+ABNGKvHA9RVE8rJMLEqfgA6BRtA46E+PykavH4UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573244; c=relaxed/simple;
	bh=cBUdsEQEmRsJtFBO41zY8/qOnOSKknyAZhoMVlwwvD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0NhC0HQOrSlxBztRJHyLpBdjKAchBj6t8q8/vXxNt3fuYACWi7X36ilszkvwT6F2B3EQv0IwaCrkucrhTbghj1JMUlICXJxHs2gqL5eVixPuST1cDGXYMI9Ngo3isERq7HHyJdvhkNtbJ156w6XULUAasdweuQJC6xXfhGGNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kaEB8mcs; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f32a3b9491so47265875ad.0
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 00:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717573242; x=1718178042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K99XTOadvLNAR21f4ztYi4Gw0/02GndsgmS6EKAyR3w=;
        b=kaEB8mcsLlPnDgjq9bVJ8oquhvb5KOuAkcB03UmduIee6nP+/58iLTSZBPanWz35sl
         BVxqaD1RXGeCvcNj271L1lhbpiWAC6YxGr/jZfhDorXPWOPbdh7vYIbQItc1iEGT+vIy
         Z+oNIolmPSwy7jicTbFs9c0oQqBqsQUOgq5hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573242; x=1718178042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K99XTOadvLNAR21f4ztYi4Gw0/02GndsgmS6EKAyR3w=;
        b=tWbuevnf7Sv8qjHv43/EuSYfQ+1a29+wTIzCMTFfakvD+l+KMvGPQJtZB9QkcxELHv
         kvQ8AoNnqI47a+0tDio5dOCSvApyzb10D+6orCWFX6ZBW4zjZH5NfuhsJ0GdG47fpF0k
         sLBR0zAvj5gp9dmcuAgV8PZgDPKVa565VGdbO5MIK3pwJkNtd0kH41/nxpOaQRA+SEfi
         ZKT3FFgIyBn4ZCPwZrzMAhH7lw/rpbUvuTB0Z4Wp+IXh3Frv/VVpWbXen2ibfopfrwwF
         IsC404G2epWyG2y5nD/sDIjkBPmgEGGrqE/iqTZ6Aeeiw6xwUGfh6j+7DIOlyg+mgE4M
         fZEw==
X-Gm-Message-State: AOJu0Yyn9eYFjxu43k9CXe4ki7qaAw9rAknrujbSAhaylDTDn3McABAe
	uGyR806zEtLHBIVp6FC8miJxLuvHuNpBeNa8DvL3yb0odagBiuSaOXTP/ovjNIhOOzaWQW6nzvw
	=
X-Google-Smtp-Source: AGHT+IHPwq9i7kIhUGoDcsxLyX+vdeh4twogd5MEOG278kTBY3wsKeKIF7cPiwKP7rUD8aOeDDZ/2A==
X-Received: by 2002:a17:902:e80f:b0:1f6:8c07:ca41 with SMTP id d9443c01a7336-1f6a5a24e23mr20674905ad.36.1717573242405;
        Wed, 05 Jun 2024 00:40:42 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:f834:a68:ab2:f744])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6324e54besm95500405ad.254.2024.06.05.00.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:40:42 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v3 1/4] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Wed,  5 Jun 2024 16:40:32 +0900
Message-ID: <20240605074035.2620140-2-yunkec@chromium.org>
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
2.45.1.288.g0e0cd299f1-goog


