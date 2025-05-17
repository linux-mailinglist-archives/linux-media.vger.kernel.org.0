Return-Path: <linux-media+bounces-32680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A1ABA9DF
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E350D3AF343
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8BD1FAC4E;
	Sat, 17 May 2025 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CZbK/N3z"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654C1F8725
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482203; cv=none; b=ZmQEIyYnrU3Lvwis7U4aD0Z2qV6Ur2bVWUyTZFjMTtdzvYAc8IIfHPOc+IB8WU3KTqc27NpsH+d2ollwGZWQT6Ss1JdXZEJy+rbw3NoS4mTG+O8Ms/CfOo2PEVIw+PbWq9j7MgCqcaofgL1jEFqLpgsjq9ae/2sCx7M2cisB81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482203; c=relaxed/simple;
	bh=/SB1vAjPIxWiNlOV9rnIEVvEAPZBA1W2H0w6marqKOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3N3+9fXOz8pdjgyJiMrpAS/lJCZPrb/l4FbbYXPYdc4aZOzmjYVPYSUiD2yXXJEQizLu38mHvVcmNuv/0dkweKJTbD6yvi1iedAOPGGawLlPFhbILy7tGL9+Elt2xwoBFP0GormdWCeU0pFrSn2nnCDv50ZTRRwR6ND3NgVlZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CZbK/N3z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnM++5sgw0x3MaThs2NW6M7uSZL/DrL8OMpNuFmVLPo=;
	b=CZbK/N3zUEIENwyLOg9/H1QmEjPqUsUDiuPD8fs97HaXUoRj2IlsakJS9E9iUWu2oKyV9F
	lAqNqyT2SNk7ubWVlTBIRmBFpT4oXHS8USCikjF9TfnHZDTHoD0/6znVsyVRn2NmPqsWwQ
	KCbdJuip2niwGxykNjkEwsjdp00ipoY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-1AGOrKE2MxOvTV-jOwdyqw-1; Sat,
 17 May 2025 07:43:17 -0400
X-MC-Unique: 1AGOrKE2MxOvTV-jOwdyqw-1
X-Mimecast-MFC-AGG-ID: 1AGOrKE2MxOvTV-jOwdyqw_1747482196
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 68CFB1800446;
	Sat, 17 May 2025 11:43:16 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABA1018003FC;
	Sat, 17 May 2025 11:43:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 22/23] media: atomisp: gc0310: Drop gc0310_g_skip_frames()
Date: Sat, 17 May 2025 13:41:05 +0200
Message-ID: <20250517114106.43494-23-hdegoede@redhat.com>
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

The g_skip_frames sensor-op is obsolete, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 73779c20ca68..edcad228272a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -541,16 +541,6 @@ static int gc0310_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int gc0310_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
-{
-	*frames = GC0310_SKIP_FRAMES;
-	return 0;
-}
-
-static const struct v4l2_subdev_sensor_ops gc0310_sensor_ops = {
-	.g_skip_frames	= gc0310_g_skip_frames,
-};
-
 static const struct v4l2_subdev_video_ops gc0310_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
@@ -569,7 +559,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 static const struct v4l2_subdev_ops gc0310_ops = {
 	.video = &gc0310_video_ops,
 	.pad = &gc0310_pad_ops,
-	.sensor = &gc0310_sensor_ops,
 };
 
 static int gc0310_init_state(struct v4l2_subdev *sd,
-- 
2.49.0


