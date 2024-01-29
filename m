Return-Path: <linux-media+bounces-4374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE43841429
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 21:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06D1728B317
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 20:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F098876048;
	Mon, 29 Jan 2024 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jBPjWz2H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725D476053
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706559821; cv=none; b=gvpoMrIYPud0czAeOBdMgB9Y6xVH9XbcDtiYxW9gBd3defpaG1cUDiCZCldB0tY6VfLYcafvbdGkdoanB8iPde6djv9qDfoCjZf9FrlD2s21suW2YUNpRAdo+4DSPwfldzxEDSgcj7H2lBpiZaRlz7ODKJcHat3530qbabw6O84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706559821; c=relaxed/simple;
	bh=YWG8CmzKubJdFKXSw2HqQKL1M446C1ZATh7csfQ+A8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E08xId+k27uZdfXXGCs64d8wX3GbCEW+DqjJD2F/P3+oy9Py8n4yDKW8Cw/ai/BbMmZmouPc9FVC8HTuNv844JozN5R8rIFi+owevBc71tvzbMoPPFA0iGBkEyUkr6pEOpImHwzb9K3bIwK4tuAwON/eWf0pUd8ryst/3H65zaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jBPjWz2H; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a293f2280c7so339635866b.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 12:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706559817; x=1707164617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oE6W35lEetVAB3eg8tehPOxi2QHoyhdMj4ExMler4UE=;
        b=jBPjWz2Hg+7hmt72dVvJDryMWDvVXyOHkUOuXmjSlSSZxSsZ1+jDkxiwmjV+56TBac
         CnrsTf+nCt96vcG5mxBNPESu/F3PD8s1zoARgbekLyrVogrgMLp34tkKk0/vz+6+FHd7
         HV8VTB5ipOGrcEs6jTLDGLNoXx1MN7xW6v2mKugrd8bSNZZtvAk3DD38QScgDoLsxEgQ
         qfjWL6XK7hZG64b4RZzG2tUlJQ4Xznx6ALNMdM/8N71zwYcotZ5nlAB3qbJIEX0zUDyx
         VQjPL4SujCPCGbajqnXJB93V+FMYDwgaoRE+Tr1mYm2jbZ4+9gKDqOG5xdjOG639pysh
         ex4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706559817; x=1707164617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE6W35lEetVAB3eg8tehPOxi2QHoyhdMj4ExMler4UE=;
        b=Gst6yJ+92KEY6a99k2vIIVp9Y8trkWHDEkTxkJSvcxoZiZ3/kuZ6PMWObY6jYK9tpw
         JnltE/I9QE4q1xscdT6BXuYjc8qpuntFa4+UaZSwOAGVyqMuJIEH6hKecE6iYi5g/u8z
         qLgEW/TEO8df/DMtgHHrYSUjl19GnbmHz/vtmMXuaJPqDOjUTz0jZY0BQlZ0t8LS5MIz
         fLD7vowDDCr9j22ScHtXkfMR96y+aG5qFUBk+nWrnrHOpxK3X+EFciPSW8luwmvWqsmV
         Uhb5GyEg+iasl5VlosL1AuKfIfMfRiFIfwvO1fAo7pZf6nNCg3St3UiNOeETvwPlPAwd
         e/zg==
X-Gm-Message-State: AOJu0YzVJFrqBs8hzmWKqGg5HEUTBLDi0g70WmJGvLvf1c6EzFT/R0Rc
	DfR6ZIPzOi837RTRP2nlOMK3foSYVSMwobjSWBp6IqVKdRC4UNfsX0O8Rxl8P5BFgglMQdgIh4n
	f
X-Google-Smtp-Source: AGHT+IFRd7Y8onCkOcHtW4j+5UkkKadTRq1UsjG2UtELDSqfo/CZHCAGZQNAuYMuTMu1jx3/tiF7rQ==
X-Received: by 2002:a17:906:d7b2:b0:a31:6811:bf99 with SMTP id pk18-20020a170906d7b200b00a316811bf99mr5268746ejb.56.1706559817580;
        Mon, 29 Jan 2024 12:23:37 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm4316386ejb.54.2024.01.29.12.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:23:37 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/6] media: rcar-vin: Register the media device together with the group
Date: Mon, 29 Jan 2024 21:22:52 +0100
Message-ID: <20240129202254.1126012-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare for replacing the shared group notifier with an individual
notifier per VIN by moving the media device registration and
un-registration to the group. This is needed as the media device will
still be shared between all VIN:s.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index d8b9c3b991b1..ffc79c26a303 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -85,7 +85,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 
 	media_device_init(mdev);
 
-	return 0;
+	return media_device_register(mdev);
 }
 
 static void rvin_group_release(struct kref *kref)
@@ -97,6 +97,7 @@ static void rvin_group_release(struct kref *kref)
 
 	rvin_group_data = NULL;
 
+	media_device_unregister(&group->mdev);
 	media_device_cleanup(&group->mdev);
 	mutex_destroy(&group->lock);
 
@@ -215,10 +216,6 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 	unsigned int i;
 	int ret;
 
-	ret = media_device_register(&vin->group->mdev);
-	if (ret)
-		return ret;
-
 	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
 	if (ret) {
 		vin_err(vin, "Failed to register subdev nodes\n");
@@ -260,8 +257,6 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 	}
 
 	mutex_unlock(&vin->group->lock);
-
-	media_device_unregister(&vin->group->mdev);
 }
 
 static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
-- 
2.43.0


