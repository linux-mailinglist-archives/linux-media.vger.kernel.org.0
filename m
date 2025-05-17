Return-Path: <linux-media+bounces-32671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB9CABA9D2
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A08DB189B241
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D73B1FAC29;
	Sat, 17 May 2025 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hz3dTjWg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E601F8725
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482153; cv=none; b=FfHL672k+6hNx6Rp2gozR5MBDptx3oJiDEWoiKCU7HoHeQH/pBi6oJBaXQoGs1/kObVCQ4DUuOE7U0apoFGIsqM/Ie/9qIZAhEtoRu9yE+iUBoAr6gq9nO04iqI+mJVTkHXWeVHzT6RlorJU2LyZ0JnT8Rirx7/ZqkNk7MW4cQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482153; c=relaxed/simple;
	bh=WqZGmpEk3vxwwUIWJwfn1HYSoEqI/BkNDa3C3E2cEkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hw0hfsswSTrG+QuLYkQ0jI198Uzust84QNuJRLVSX6wPR5s4fZGsWD3nkeP4bJNWwgdzpa0Gm7MSYNgszBkMHD4q/ofmFBoNzWhbuKHhrBrwQfdSf69Zf8UGy/ghqpj3geJG98gDe7fLZBo5ApwA1wgdUAfC1cTUA4jMsMbINsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hz3dTjWg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZZqZ5gfyYgjgP5y0/m1L5GU/Z5B/x2lcV+xdaYXqL4=;
	b=Hz3dTjWgqotvJhjz3VahbQxbUvH8AkEKcBwJFAIHCMkXid7ek+ojECS68aK4aeOxnJpcQS
	XSDvcvVKmpfx9RSqvqL6vTaLqh38ZxZJ9VtJabFmQ60zZGyFhSh18IBywrFgRHje9NlBjA
	F5aCFRrr+Oes/6FhRcY7mpDj7y6yg64=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-onfJIfqAO5SKOECpAw3dJA-1; Sat,
 17 May 2025 07:42:28 -0400
X-MC-Unique: onfJIfqAO5SKOECpAw3dJA-1
X-Mimecast-MFC-AGG-ID: onfJIfqAO5SKOECpAw3dJA_1747482147
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BBA5A1800570;
	Sat, 17 May 2025 11:42:27 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2B254180045B;
	Sat, 17 May 2025 11:42:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 13/23] media: atomisp: gc0310: Remove unused is_streaming variable
Date: Sat, 17 May 2025 13:40:56 +0200
Message-ID: <20250517114106.43494-14-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

is_streaming is only set and never read, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 162b81789eca..948579c0373d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -88,7 +88,6 @@ struct gc0310_device {
 	struct media_pad pad;
 	/* Protect against concurrent changes to controls */
 	struct mutex input_lock;
-	bool is_streaming;
 
 	struct regmap *regmap;
 	struct gpio_desc *reset;
@@ -522,13 +521,11 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	if (!enable)
 		pm_runtime_put(&client->dev);
 
-	sensor->is_streaming = enable;
 	mutex_unlock(&sensor->input_lock);
 	return 0;
 
 error_power_down:
 	pm_runtime_put(&client->dev);
-	sensor->is_streaming = false;
 	mutex_unlock(&sensor->input_lock);
 	return ret;
 }
-- 
2.49.0


