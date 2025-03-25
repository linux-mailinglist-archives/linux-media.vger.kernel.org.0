Return-Path: <linux-media+bounces-28657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A1DA6EAE7
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 08:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 960C4188DE8A
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 07:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00151253B52;
	Tue, 25 Mar 2025 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqFJ6SZG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00321FE471;
	Tue, 25 Mar 2025 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889306; cv=none; b=gKB0AuOqX6DNbQnTsQ3dflogGCcAqSJzdiMu80pSkRRG+2FN9PtQ2+/lys/NecAcBrzTe4usDNQT5QW4ojoTxk4q7KeruliR8zzeR5hhHeoZBvt3gPf2QonoovSFRhddqov1K5fvE+7BWn9onmz4gRyE88bgK6w5jPDvcHPijlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889306; c=relaxed/simple;
	bh=tim0CjBCZCUNSYsfdqpjhc5M/8LJk7xy34yXEObHoD4=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=BxVLlcGqj8do2EOYKVE5UHPsBG9vL752L7c7iuLDlHFYFKRhYx5V80AtTiV86io3DVNK6Sj/D2QZuzodeWR4rP3XvUJqQ8OIbsVNHTSWJtm2AaCemb/JaUcQlV2SYevyGuEGDWVzU4mdMQfjiLywUehqvw19WGcYHohyjCqDAl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqFJ6SZG; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so41379736d6.1;
        Tue, 25 Mar 2025 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742889304; x=1743494104; darn=vger.kernel.org;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PWvyL5zaWl1iiCY61g6KYx0pemuqXQhwV74VbVAQYeI=;
        b=XqFJ6SZGajbYjAuirkkiaUQ8twxx8De3StcuyvmYdHHJrB1bLKyawD35BkLqTzkrI2
         +LbcpCvYnKgtywisHF7QAJDeRBDWAw61SO8WhDsMjFcxxVioHX6BjL1DsZyTe4P5fm+Y
         AOdijbRKmDb9KUI7xV7dz1+PIIQQ1fIe5NnVc1IUa2MAKaU46EucqBwHwNYn2g75tm3e
         oRCLKcplsqFZcYKgjPZl4jrW/9Y5r5/T2I/baCSsmZCNuVCytKqQg6/9RkeRWl1obEtL
         lI0ypvlEpzI4WckNyxIwqSDlYUITz0QxNNjQgHkitPpqz6qjmoIGFRVyaHsN90pM1oS6
         VhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889304; x=1743494104;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWvyL5zaWl1iiCY61g6KYx0pemuqXQhwV74VbVAQYeI=;
        b=UbMV8wiz0ktyKGkcLridZPy9+KGkRy88QmvK23qpJh0L7jdhsOYfrZ7IrPVnBfmfS4
         BvfSWMqNAE7DWPFyYoZsPPH11EB2Ypao1TfNiEGeBXiA9Wg2s2EQOupwR3y2vGFqT6ic
         Z+lQoO+D1PU5DMwswN0xMOFjotBkKnAk+jr55DvZcB/UkIUzxIVBp0WGpPSKLTLE1r8W
         5Sn/TUKYMGOs3Zl+gnxiEgNsO5Bg+ysm4jXR+DmkfTX8qJ1tVXcPqVvFCvHqRRWsqlcP
         w5yFbBhPfmY4JtUVMmsXSRWIhjwvLgE+juQfIlONjtd0KViRBJ+x1I5aTxBpFUEBux6o
         ANIA==
X-Forwarded-Encrypted: i=1; AJvYcCUNowKZ0oUEt9hg5D3ocyo3sbQEJs6IykFB7D8Ot64eWoNxpz+l2n3L5zzjGF0Ye+s2VfILZgkJjjqz5CA=@vger.kernel.org, AJvYcCXPHRLsSu8onPV0xaQAotgooTB+qjjaJFnMKfao0D4WUmgMFmi0RbuCNVHr+RmO7LzFBprE+P5QSs46Ci0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZRrv2KpjGC95vI9HIFJz0D6QE0YiyqJ+3xro+j4T4j6/feevd
	TTx41gf46jWrYEsEOek5mdrM3cH+LqkjYrRBx3Bkov5xUo+RRLLl
X-Gm-Gg: ASbGncuRTSt0ccp5lxRomlOzs5c+KLPg4mrPpeTMjWy3PEsVbo9eW5ivISSb9frrJEk
	N8e8KcMMqElzyN79bR95rhTzr+lJ025e5gKQ9y3lTyDqWoEuZFrgh13IIG9HnHl11ji+uUqgAn2
	75oGSbmDkX69XpYyFITlMKyPg609sFPrdvlidcDwemPTq1MXyoHXvGVdMsCjGsuL02xoOCFq73x
	iHhAeHx2kl9aktinVOMkSjlujX3ot9NNxx4gaMDwR7ax0sntsdvqfmZQEdB/Ki5xjPfQAW3bpLE
	rxg6jBn+3Xi+qSz7xz04yYMVVl+ofKHuEcMoaYd5S3DLyQHBnPSMUcd+GRKDxgDHGaTD2/CDyJ+
	F9flvahkuyA==
X-Google-Smtp-Source: AGHT+IFgkpLgyaIuwi/UunIPUrsPIRmIsJVPGwvLNiNpYyWjTpkB7W61WX2Jz2rW00HVhpv5PQjWIw==
X-Received: by 2002:a05:6214:194b:b0:6e8:9b52:7a1d with SMTP id 6a1803df08f44-6eb3f27f3a0mr229361886d6.8.1742889303599;
        Tue, 25 Mar 2025 00:55:03 -0700 (PDT)
Received: from [127.0.1.1] (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efe0c9csm54518066d6.95.2025.03.25.00.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 00:55:03 -0700 (PDT)
Message-ID: <67e26157.0c0a0220.36adcd.506e@mx.google.com>
Date: Tue, 25 Mar 2025 00:55:03 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============1076553333254439057=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: laurent.pinchart@ideasonboard.com
Cc: 
 hdegoede@redhat.com,mchehab@kernel.org,linux-media@vger.kernel.org,linux-kernel@vger.kernel.org,syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com,skhan@linuxfoundation.org,kernelmentees@lists.linuxfoundation.org
Subject: [PATCH] media: Fix invalid link creation when source entity has 0
 pads

--===============1076553333254439057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From 307209d175be0145e36b9cf95944e2e62afeab11 Mon Sep 17 00:00:00 2001
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 24 Mar 2025 19:45:55 -0400
Subject: [PATCH] media: Fix invalid link creation when source entity has 0
 pads

This patch addresses the warning triggered in the media_create_pad_link()
function, specifically related to the check WARN_ON(source_pad >=
source->num_pads). The fix proposed adds an additional check to ensure that
source->num_pads is non-zero before proceeding with the
media_create_pad_link() function.

Reported-by: syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=701fc9cc0cb44e2b0fe9
Tested-by: syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com
Fixes: a3fbc2e6bb05 ("media: mc-entity.c: use WARN_ON, validate link pads")
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/media/usb/uvc/uvc_entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index cc68dd24eb42..5397ce76c218 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -43,7 +43,7 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
 		source = (UVC_ENTITY_TYPE(remote) == UVC_TT_STREAMING)
 		       ? (remote->vdev ? &remote->vdev->entity : NULL)
 		       : &remote->subdev.entity;
-		if (source == NULL)
+		if (source == NULL || source->num_pads == 0)
 			continue;
 
 		remote_pad = remote->num_pads - 1;
-- 
2.43.0


--===============1076553333254439057==--

