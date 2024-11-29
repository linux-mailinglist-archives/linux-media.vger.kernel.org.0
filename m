Return-Path: <linux-media+bounces-22363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBA9DEC5F
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 20:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FB27B22E12
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 19:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245911A726F;
	Fri, 29 Nov 2024 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBf+X/Bb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064001A3A94
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732908315; cv=none; b=V488/2A5o3ajNXZKoCW2DwM5kYHfFNx5xGIzwiWmVn9seE9ZA9A4R4iMtaYpHVo3wDQtQ5w/LKR67m8p2350mZ4Mptyy3W34o3fu/0gocZ/t4EDwSvoZD+A6lHkOo9RIP90KmJZmyB47M8DmVOOgkmTzIVUefWVSNZF+EqLr4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732908315; c=relaxed/simple;
	bh=mTx9kJaioWNO5uqqFbQnJEwHqDWVPPS5kmBz66j5EZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCbQqV63xgj+WxDXHXxURYMtSR0YdcxHaGn8BAPP04sAwuMuRWQu8kBDbf+Nj7tSUfifB2VZ1aOzeZGPC40/MNLCCLQvKc7SNWgQj8/P+bruVKV7HjDY2QipRrxLJao8g6UM8Zpa+AVyX5CrUtM6Bl+oG7s5rPooQsTbNlyY2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBf+X/Bb; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d87fffeb13so10975356d6.1
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 11:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732908313; x=1733513113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lc5F8NAtNe3x2vw3Nhwg+vdINmv6+xp/VOBllqqRjXg=;
        b=aBf+X/BbIT2TBPYOdGMT3WNce3nAk91uPGEa1eSOjtxItwyhmnyzpA81asTyUdYVoR
         MF9yw609uGMtYkgpsjcfMnrQLxu0zU8KXbBa7gnM0Gsbfcj2tPiwMScxk6of278MNOKb
         MDWXtw//kOGgY0OiVjGUj17CLF2Q4HlhxO5A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732908313; x=1733513113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc5F8NAtNe3x2vw3Nhwg+vdINmv6+xp/VOBllqqRjXg=;
        b=V0tD+9U/DQu6KfyKW83gOZHaTLa+vc5CZbDqxCBkAl5Nz6oaZj4ZJ0m9IZMQ+rbGn6
         8ypUI7L2utjU+RK85XvoJGtAmhPlFqYiJuBcVGHujW4/T4icTehwafTJxId9LU+XN8ro
         qQGGGrPCf9IXfYlbV8OXlVj3jus4nitvZaH0gzjPBYLBr6xtfdE3LYtmkFncA4UU9RbI
         xxOWdxRHk1EKnuEuxSeJ0h68FsF0g0fVu6YzDUVx4XIUZcGziRz2y27BTvym+c7OH5Hi
         CyILJU+tbyiPEVcyzQUUXMONnxcWNbIiLXADeoseM026CrRB3iSy2bon7ETXU4MA/sOL
         Hi+w==
X-Forwarded-Encrypted: i=1; AJvYcCVEvIhFMaw5kvYib8y6pa9NytLZYB6MqIGPVqU1oA5PBc+qfM4BGHheiCCSo2CQKR2avhDp+6J02J29vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOnrVb45gEp5fH3Yn8dP9hdfVtF+o/E713jSuyD8N9u3YNCEQm
	PD40c5B4rO2BMiw3cW7JlkH//wXpKugmtaP2nW/+lmzxzp4TypGn/UYjhBLwtA==
X-Gm-Gg: ASbGncuM9CnQ1s1nqSA7QE3dx1wfmMu05nOoPdKTnbfBCkJr2asBcWjYDihgB590eTG
	/bYnRWGMuwHoIwfUko9uXsNG4j4AT7V/VYulpGBK7+V9SoRx1/h2WvR0F/2CpYbfgawu2xi+DVX
	yQXcH7Kzm9OTd6aIF673MW5qnzWGfzrRfhQ3yCzS34F/qQ5dwSYtn7Ew4Hib0Yxr5JAeM118if1
	xtXgZr8IbpwPeXAM7ZJnSHphUH3PWVW5JtLmVPsEm+ALZV6lgNN5jF/wM5LOwKTHCY2LE99qjZH
	oGNtPId93zeb/+hGU3cDYhIy
X-Google-Smtp-Source: AGHT+IFdLvcLiH4k2Om49MhI8qLceyQxgKY9mTSa5zTIbcimzBKS55ZzkocL0pPO1xLeZHkbghcwGA==
X-Received: by 2002:ad4:5aa5:0:b0:6cb:ec71:f1a1 with SMTP id 6a1803df08f44-6d864d44973mr199471616d6.17.1732908313178;
        Fri, 29 Nov 2024 11:25:13 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d87d899ec2sm14462146d6.50.2024.11.29.11.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 11:25:12 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 19:25:04 +0000
Subject: [PATCH v3 3/4] media: uvcvideo: Annotate lock requirements for
 uvc_ctrl_set
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-uvc-fix-async-v3-3-ab675ce66db7@chromium.org>
References: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Make it explicit that the function is always called with ctrl_mutex
being held.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0a79a3def017..1b58e558604b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1958,6 +1958,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	s32 max;
 	int ret;
 
+	lockdep_assert_held(&chain->ctrl_mutex);
+
 	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
 		return -EACCES;
 

-- 
2.47.0.338.g60cca15819-goog


