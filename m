Return-Path: <linux-media+bounces-23413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B77C29F1D94
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 09:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAE8D168572
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 08:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665E014884D;
	Sat, 14 Dec 2024 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="I8iGpV/X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD5D11712
	for <linux-media@vger.kernel.org>; Sat, 14 Dec 2024 08:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734166142; cv=none; b=MGnkkRnS97PnMyZwbyzxjl1mlNUydNd6wzIxuygsD/gqRB2wo4wp23S9Js94r2PgCebEJBlPAuaNYdjmnHtQzN+M7/Ey4mjUjNPjfjCJDm1+FFg0q0YdOPRUph/IClXsG7JjjIzQQf09IGXULDk1dSpkdFHHBpaO/dplS3fGKyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734166142; c=relaxed/simple;
	bh=CYI7vOrU0xRL9qcZAqEz/5KscTXOZJeTvIYfjsl7HTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GS4hobDIs8yIF1JuJquA5TH65Qih1c10hOYcxYj0MwpLNTxA7VcAvEDI01ZGe3Q93/pV7HBb4whg/OAPsVeKG2GRY3i/nS7DPzkK+KcdNHSQtIGEPk2icy1LCmFZqCn43DigKDVwHPCEeOefLcRGiQxdQxOLljlQWbGAhMsgSoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=I8iGpV/X; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725f4623df7so2161319b3a.2
        for <linux-media@vger.kernel.org>; Sat, 14 Dec 2024 00:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734166140; x=1734770940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3QUxLUOvwMstaMIOGtWsgVoCeJUCLU/xGgiEr0r4SNw=;
        b=I8iGpV/XfDwjfBmuyOzycjd64yAmaLwb+05bNzXGLGVgQPE+niNIxvRdMusDB3/f6e
         K9WfZQdi9QlBnU47qXX56Gq1oDi8yt5kmLyOrX1et9rLhfQCvNqvVg2R2biw+WY6xw1b
         xYqHW52npzPCPN3i+k/WTsQ276nbabhvMQxXMl5+vPSruceyKq8kquP23S6UvWRO4IdQ
         8AoE1k9AYFWZAnapdNvoSaPM20cn7at2ga+8eSzCRuuXQZUaTbW7XtKZAGyvbYhNoo6H
         DKSQg42ibM/K2bOOpzau387bx3s1bKTLwjWyAJBdNEGU2H8w+dXG9+kr4WwJvWQdo4H3
         LlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734166140; x=1734770940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QUxLUOvwMstaMIOGtWsgVoCeJUCLU/xGgiEr0r4SNw=;
        b=DIFspwos12kmGbPSGLFs3ZWfBe9/tMJBHvlyibuVPC+y7OpXYlrcAAGaS6kKbO9HD0
         5ljQXE8/AFeBUG0ee5m0Ycy1uTxHmXQFsI3qq9IcfJpiqU38K/BSuC6KOaJK1j/zONRL
         mi5Qc6FooVnIgtB6onAeUpeCFow37u7AqGyqs/qkJD5vyCb+b4w2iamQke/BdX6gD1eU
         Ck4EPR7703aZ+xB2su4JcQFqIGetFWixHgsf406xub9hSWU7pL/6m5Vr1bJL74Qlga9f
         ySbLWS7oIkutnAthUDytDN9CG+j8Va4Orn6lOjhFlnIiYV+F44CpPfUOCKOpucMa4hO8
         BTQA==
X-Gm-Message-State: AOJu0Yztsk/BQQuJe0FdafF8m0hMstdQRZKL9+/CCG26U4du7dzSh4Fm
	5RTtreE8CdC/wYImxt3NIbRGG/VDzaCiGVKv68TFi2UsBX12W89UmqSxRc8Q5ftls62jvU6/2Iw
	X0UbZYA==
X-Gm-Gg: ASbGncvZa8GzFio9eMVg7T4nwl4TdimucaEXkfFa3NTCrRLryKCFxEazXZlrHmpx1eL
	n6xR+qEToGmP5DjwrGULBqiw1kTiq03wo0BoJAJGVanJmfLE0hWfSP1ywraoAIeFWPuP5833ITV
	EmfHcngfeKo6ACUoMP8vPgx6QOR1KJkJ7hwwBhGPn1EzNpDhIkDNHfLzUUy55KPKAfS8ynRhVGb
	2slOEDPkw8kM4d9WKzAZCzLLULmVvqXjjnPqNOt938mGktzYBXTCav0QpfRG6RlXOElGAUng6qH
	YHZ6cqEMhsHbw8AWp8QoZcV4xkQ+fq8J1bBG5VUwF2k=
X-Google-Smtp-Source: AGHT+IEIiTqruVxLfsqTGn8wW8ds7xRYXdH6+Ti6mpe+egiSvY+J0ASmTWmbvPDA0imlMoVwR1cnIw==
X-Received: by 2002:a17:90b:4d05:b0:2ee:f80c:687c with SMTP id 98e67ed59e1d1-2f2901b07d6mr7527144a91.31.1734166139828;
        Sat, 14 Dec 2024 00:48:59 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142daea53sm4423235a91.14.2024.12.14.00.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 00:48:58 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] media: v4l2-core: balance the refcount in the error path of __video_register_device()
Date: Sat, 14 Dec 2024 17:48:53 +0900
Message-Id: <20241214084853.1781426-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the device_register() in __video_register_device() fails, current
implementation does not decrement the refcount of the device which was
obtained in device_initialize(). Balance the refcount by calling
put_device() before jumping to the cleanup label.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 5bc3cb743bba ("[media] v4l: move v4l2 core into a separate directory")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/media/v4l2-core/v4l2-dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5bcaeeba4d09..1e48778cd7de 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1058,6 +1058,7 @@ int __video_register_device(struct video_device *vdev,
 	mutex_lock(&videodev_lock);
 	ret = device_register(&vdev->dev);
 	if (ret < 0) {
+		put_device(&vdev->dev);
 		mutex_unlock(&videodev_lock);
 		pr_err("%s: device_register failed\n", __func__);
 		goto cleanup;
-- 
2.34.1


