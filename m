Return-Path: <linux-media+bounces-18218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEC1976B93
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 16:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2E47B226AE
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EDA1B9837;
	Thu, 12 Sep 2024 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlUugUgj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0711A0BDC;
	Thu, 12 Sep 2024 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150024; cv=none; b=d7wfXt9CZ4Udfc2syfwCyaq+VHdH6lUM6xwslUQEyQf2SRz34HAZ9TYU9xWVCt7WXcjS3XaLmeizA2NrLYSzHdkkffvt0h4KeV6KC+YAkJm7Fr2MHgWtQWdeutX3JyAmKL6GoHtCZssYBfNCFbOukmCS+K7iJ8EqGPc3WBgdt6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150024; c=relaxed/simple;
	bh=1wuhFnjzHjnZXKk+8BsD7jkJlXjXQN3CjqkG66ioOCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ekyHGF4QkYlralL1h5TkO8M3vHoOVBjFzusV80ofl+T0RvGEgUBaUw2pNF0Hh9AjcgGdccGjUVo4/mKY7pdeJuk9X9v1SWCzaYCcp1kOg2YNR2aH+P/3VEt4qpTnWOURG8HqUlYRUVOEjAEoX1rkAE0BBaA6xHFYzPKvrCc+kZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlUugUgj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso181826866b.1;
        Thu, 12 Sep 2024 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726150020; x=1726754820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4LvXyh+IczEwXXfGWtotAZdHB+yCvx0c4gFfil8tlo=;
        b=BlUugUgj8wRDdffiUG1gzW3w8mmC65Qarkbxmf9vLbiA4O2FahdUCkOy9OEErp5n5O
         tL+fWmFrGD0y9jc4w+TsNYLioaRoJ73O/WU7VYYlXXEl30rkk4aYpDD6I9IkOuzXtpR/
         YgvhE1rZPz4hNgyfjOae1lnfWmTr+NYQe67UMG9NWwav01TaEr9yuXoomi5eOV6hx0nW
         OlofL6zgv/kkZaTW0+No8EVPDOkqA5xciG2kwZq+sI1yegMUoW2TUI+NH3H7BsXRtzSa
         goxkGYTrw7DDlcfVyEwsGoQ6fOU/P1lVsuR0KNMWZsvktLRzPiqssp/f8cqgdopGl5UQ
         5mIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726150020; x=1726754820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4LvXyh+IczEwXXfGWtotAZdHB+yCvx0c4gFfil8tlo=;
        b=nq8xoJYzet9Xy2jK114jyiVMDuRTToC963RR5qRD4L7jlxPpsR6FC1h0PXqEb2fV3M
         /mH4r214uP3kA9SEOClF8smpWaFYG8qLT8RXamKCmiT/zm+tkMS6Rr6HyI4E8EVA6Kiy
         QrPBRmSPxg4EV+hFaiBfSNAOZsp6JdZ6kH3ho4SGYUMQFEn7oXuo+VJQJJvP6zjQv19I
         XRMRpvD77BjIBGgWyYWptd8anIQPSRO4Gu2HxJ6vT9RIyDeneRQ21lFssFhfquKQmdbU
         AzUdxeGR60xPcpcVbuUaE+ssEz00Jbnz3Sh2E9pzuhZxhxM0I+Qrw4kMSaePXaOncKlE
         YUEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0dw7Q1C+DtC64/zpWBVl//+j+A0Ju/dU2eEi06yHbEfuw23+U90O/oBw6Bj+yv+jVFiP/5rQOpgXtg7g=@vger.kernel.org, AJvYcCUKy6qa7trFCc1ZP3+TsjZKHoQJnE+ygiSrhRaRSwzITTGN3V+4+REz28XgRpeKmFjERQhDK2KYyPBZwfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU4bxgbIclDjCkyrml/9chKR5AYe1bJzJ+89NIv1+KzYwhiWLx
	oj6WZ1jiTr6R46C31a/gEIkYvC7RESFH8m4C9eVodME8stRXicRZ
X-Google-Smtp-Source: AGHT+IEA+7GluesvwN92M9aCzHXP7NLD/idrPe1nsWoZYe5oH+GxsJlMZ7k2ToSRMo6b10uJhIb2AA==
X-Received: by 2002:a17:907:2ce1:b0:a8d:41d8:14ad with SMTP id a640c23a62f3a-a8ffae3fd9fmr974362866b.29.1726150019198;
        Thu, 12 Sep 2024 07:06:59 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a258a3sm748268466b.89.2024.09.12.07.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:06:56 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: max96717: add HAS_EVENTS support
Date: Thu, 12 Sep 2024 16:06:49 +0200
Message-Id: <20240912140649.1243602-3-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912140649.1243602-1-tomm.merciai@gmail.com>
References: <20240912140649.1243602-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Controls can be exposed to userspace via a v4l-subdevX device, and
userspace has to be able to subscribe to control events so that it is
notified when the control changes value.
Add missing HAS_EVENTS support: flag and .(un)subscribe_event().

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes Since v1:
 - Add missing .(un)subscribe_event() as suggested by LPinchart
 - Fix commit body and commit msg

 drivers/media/i2c/max96717.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 4e85b8eb1e77..755e27271b1b 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -17,6 +17,7 @@
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -576,6 +577,8 @@ static const struct v4l2_subdev_pad_ops max96717_pad_ops = {
 
 static const struct v4l2_subdev_core_ops max96717_subdev_core_ops = {
 	.log_status = max96717_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_internal_ops max96717_internal_ops = {
@@ -689,7 +692,8 @@ static int max96717_subdev_init(struct max96717_priv *priv)
 		goto err_free_ctrl;
 	}
 
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &max96717_entity_ops;
 
-- 
2.34.1


