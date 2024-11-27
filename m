Return-Path: <linux-media+bounces-22176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B039DA7B8
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 818E5B2E1E4
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8281FC0FF;
	Wed, 27 Nov 2024 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NyzKEgCq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586D91FBE9E
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709702; cv=none; b=AE4T7nvOQ/PUp670vZ/UM2RbJUoiGAN/b5h51caXZ8Ve+DJXrfjuSwjvsipJaMRv2pPxg4I2CZG3EGWRpjoJnQ6p4RTei6idhTiDVvA52l89UcgylMJe5gxTG5MYZh7BtVmoqUkxzkSjIcNAEfIot1yJ+YlBUpTgQ2yBAmkqGTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709702; c=relaxed/simple;
	bh=qscvc4/+8WAanATzK91OtjUbi7ikSGl3avQzHX8sCU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PH+q2beqd+YnYqgncNr6dTrVD8ve+ImANBJCj+q+7kQlzb6+7tM6qWV2TH5yFGDwuagP0wXglJz4b/Zf/EZwVyOjNZ15Dd/ajZw96kMYeRAjMMb46xI/CvPv4pkDhQeIvPpySJHrlFHW6vJoBI+oK+t60kgN2+Z8p0rSK+r5meU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NyzKEgCq; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4668983b04eso30764821cf.1
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732709700; x=1733314500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkd0hfrtGi6wFG+eppx3CwdzsgWeJcO0RuYZmaKBy34=;
        b=NyzKEgCq8Wq1LGDpojFYKQpXwY78+p1Smzh8OPbK8G3A0e24oBbEs5KACNH+gHCigf
         3mdSo+7yWgpiR842B+/p0d7uqGRTAqUUnk7inw1M9PJ/7ahVbgqIRJqlFINF/bu1okuz
         mIN784VoxApKOZ8sZADAvdQ8acfofy8r8PoDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732709700; x=1733314500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkd0hfrtGi6wFG+eppx3CwdzsgWeJcO0RuYZmaKBy34=;
        b=B/HIIvH+TA3bxLDuSg7C7yP2lzb1H0z9zHz1V5ml4/k7I8GTJdeRT7hZo9brMpf6PZ
         lLy7gqBnn0hMdx5EJYz6UdZ+wfQcFkc3L6ZhIBvzFw0tPaiWfAwzytPkjDMhnymykj8k
         bz6cYCoxhdQHU6bH3uv+kTQVaGAAVPjnl7MIwkXReH5Cmw9zd4rzkUmLRk/jD0l8HOFV
         t8rN9idoZgBjFr1gf/wk1GLhIIOblk7fT5cIizfJAJUWtDrJylXppDKbAkcoMhaKz3jS
         Kn18cnhQbAsvJXjmSQOVsJID2DI4jCRVf3HDFEW6PJuH+4GlGYdpf8mOZw9eC+DzfQkZ
         lBqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz7mIFyvm/s6Ep6JR2Id6ew0Vw4UatrORIS/O+4qDAwOk432dxKJZmroSmxXQp2SZ2MLX2zMmwwAco8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwhxzkMTu9VOp8qu+jsQy16GNF8r6+n9ijm425v+LqFxSc13jO
	njIKOKjJOkKPRqYcFrF2oT4yRVPdSc82JTt5+ee64oHT3q5wl/AwKCBPN9ydqg==
X-Gm-Gg: ASbGnctf/JlPHeAXTvC3dhm2hwIn4kP858uB/D/nJRz7ROCWnnJ0G+XNZjFFXIN5//L
	nkftkg0umQfP33avSlDhhgZ1xmbZXIScQk0mIyQQx2BNE5ALuJJ4TtxyeLcS+ZK6DK4c0wpSc2G
	Ao9qqNTbF8rTKxL9sr8LN6w7rtdI6M4Za6gQzJkjFdZoEMjIO23Rplmg9JouAwcbnOuUz2HCmR8
	fASYDtRdN4sJAIVetMgpl1MfDknrtnLzkQdAZ36Yoa+HxJIWfYWlzpCBdqMheAR7Mg/3lAycmxK
	fbgU4EfT4CdUHNSXrRNXm/HA
X-Google-Smtp-Source: AGHT+IEJp12s0m0Yk1hs2ex6FW8MZF5oXzJGL5WHwF8YV678OPemZ9ffP4a8dvh2jsPCipIpLWswVw==
X-Received: by 2002:a05:622a:14ce:b0:466:8543:b96f with SMTP id d75a77b69052e-466b34d362emr28958981cf.6.1732709700243;
        Wed, 27 Nov 2024 04:15:00 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466be77cf7bsm371171cf.89.2024.11.27.04.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:14:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 12:14:51 +0000
Subject: [PATCH v2 3/4] media: uvcvideo: Annotate lock requirements for
 uvc_ctrl_set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-uvc-fix-async-v2-3-510aab9570dd@chromium.org>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
In-Reply-To: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Make it explicit that the function is always called with ctrl_mutex
being held.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3f8ae35cb3bc..99ddc5e9dff8 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1946,6 +1946,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	s32 max;
 	int ret;
 
+	lockdep_assert_held(&chain->ctrl_mutex);
+
 	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
 		return -EACCES;
 

-- 
2.47.0.338.g60cca15819-goog


