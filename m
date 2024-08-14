Return-Path: <linux-media+bounces-16263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BDB9511D8
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 04:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DDF4B21B0F
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 02:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEDD1BF3F;
	Wed, 14 Aug 2024 02:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZS60BXT3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9860E182B9
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 02:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601216; cv=none; b=Sw5eTcTfGZN8GxYv48HfDnbGeoctvfXPjSFRa2/ISPeiXZzjCwz+S+NdwkC1de1IljuqVlmBLlo+G6W5GcfsBrHhbQm+BPDQsNhRTJNFKuzSQNk54kpPwV2FP7qWK8ZXD4gzIA5rMJdlD+IS8w+mqWIwqrAvyptXBnmeAVY5nCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601216; c=relaxed/simple;
	bh=Xne+rVjNAcc5kRmcQZLto5wJQ7I2JV1rtsao/d8sfqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDmFylT+u5VIDZOACNOS5QVrZh6J1J2f2DqL2yAwnUGNnfoJaVdXY988ryd0Ji9g4TfeyzQFTmhmnuGmCnujUrXIbgTkLeeCqbEPHcXI/N+8CXIwyeIbsH+NDTJQCrrMRLICzANIoQMOK84o4quE2Av6zLIaliNuwsoe+OEz9ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZS60BXT3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d396f891c4so1060222a91.3
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 19:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723601214; x=1724206014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi3V3fI46LiV16A3WIik80YAuBbVgPRhK72w/FdirxA=;
        b=ZS60BXT3TYyWm0Dy176fPHAdJui4sRq7ondGkYFn2NeatQzF8hQ+0UBvJlbXDXyNKZ
         j05eGybLeIJm8G8LfqTcvqICuUVDUqz1aWN3fdiakwscYSYgDE05Q8f8XQYcGU8Obf7d
         wq7d4q44jP8CI5tTSzuNp3UY6k5W16aQ205z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723601214; x=1724206014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oi3V3fI46LiV16A3WIik80YAuBbVgPRhK72w/FdirxA=;
        b=PGzzz8spHOJDzQnf+bD68pAN8kArL4zuMPoxn7ePovFcP1f+bGT+EiRQYmmEYfhaG5
         piYx0Cw+inzEQZjoGprXR3mCDLMkGBQhPnjL0Dd+ZvNkGnkrBl98yyPCVLpoKV1nBBKw
         hgpMGK946g0WyE+LRyj5pN0mE+/Y40kQ8gOry1DCG2P+MZRMyZ+ymmjXfL7lNIPIUnCJ
         Ns5HvA0OOwKeO5jN9el4VwpdFcyZVHdzXb+qydMNZgDW1Xos//kNYYIJZQo3UpXSdumJ
         nadupavIaeAXckpquk8vG48fM4kkhwDFLcyOFy+bicG0p7ll5cXNB9IROWmpGfxV6h8R
         DKIA==
X-Gm-Message-State: AOJu0Yy6JXpC8LMLIOVhuRXpTX7r7REJmsed3ivfTgA7d4acBmruu/cd
	t7fbN5N6imHpiGrsppOpPbCHYatQOn9Lv8GFtKXcSba7n8MpuXJtOqoBiQX3tw==
X-Google-Smtp-Source: AGHT+IHzY55y/xX+ZkwrM/W0HMovzqMcNN221t6HuM8ICTReT7tbG357Y7ppjGo+SlrBVdjiIOtb1A==
X-Received: by 2002:a17:90b:33c5:b0:2c9:888a:7a7b with SMTP id 98e67ed59e1d1-2d3aaab9b0dmr1626611a91.25.1723601213936;
        Tue, 13 Aug 2024 19:06:53 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:269a:7c5:e4f2:518c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7d65b1sm303064a91.4.2024.08.13.19.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 19:06:53 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v5 1/4] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Wed, 14 Aug 2024 11:06:40 +0900
Message-ID: <20240814020643.2229637-2-yunkec@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240814020643.2229637-1-yunkec@chromium.org>
References: <20240814020643.2229637-1-yunkec@chromium.org>
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
Acked-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 0217392fcc0d..4d232b08f950 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -311,6 +311,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
 	p->dbuf_mapped = 0;
+	p->bytesused = 0;
+	p->length = 0;
+	p->m.fd = 0;
+	p->data_offset = 0;
 }
 
 /*
@@ -1420,10 +1424,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 
 		/* Release previously acquired memory if present */
 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
-		vb->planes[plane].bytesused = 0;
-		vb->planes[plane].length = 0;
-		vb->planes[plane].m.fd = 0;
-		vb->planes[plane].data_offset = 0;
 
 		/* Acquire each plane's memory */
 		mem_priv = call_ptr_memop(attach_dmabuf,
-- 
2.46.0.184.g6999bdac58-goog


