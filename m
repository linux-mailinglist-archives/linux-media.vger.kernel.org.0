Return-Path: <linux-media+bounces-19515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164699BA25
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 17:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C6A1C20A8E
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 15:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636B61474A7;
	Sun, 13 Oct 2024 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UCrddo/Y"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ABA1474D9
	for <linux-media@vger.kernel.org>; Sun, 13 Oct 2024 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728834078; cv=none; b=HTMPJVKb5SsR7IekJK3w5AR4rLL/rGGGgQfC0ea1e2D9j86cy5vp4lFT908qvGomWAGh2tBdEXuXsE6sZ8afazfhJM8voAXL2HWnGnb999nrnmyxMvK7d0LVvPc10DsBxWYC9kxkdn40JTnstTcyblYYPp0iY3/5y/nZ13rWMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728834078; c=relaxed/simple;
	bh=xG9LCXw1pL/9MIbtVaMsg8Kj1UVI+uhqwJaGwmF9m7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9yO/qe4aLsMtiCCUUqXJnXaFfUtDerDxoVrZvLlyeHWSymYuU6jMG88pMPUKJDu06uF5yOgoM6kgHQ6OyAp2158WWGBaOwLwtSa9rl71laY3YYp0P+5v2EqmxW06hB85UWgHv/IR75FZehlR2efmzNLSZYFqXoFmt/mXj9zqbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UCrddo/Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728834076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhUkJYLDXF80tVlJU0WIahMtJ/wu9t7rdx3rs8/W9Nc=;
	b=UCrddo/Y4RAq2C/ROqvOV223Rbf25toooD5XZsVGS+fbKKT/i6hGlL/GAtK5VAj6iiv1OM
	xqNjxUOmuBUW5vXyjIM6pVS5wlXXtXD2E2zRcvtaVM4IC0kG8USJq5BV978UEM9y1Nzkkp
	ohNdRegroxBkY8rwgsT7X4DQkseuGZA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-mmuebRVsPxiEn5xgrdExKw-1; Sun,
 13 Oct 2024 11:41:13 -0400
X-MC-Unique: mmuebRVsPxiEn5xgrdExKw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E258819560A2;
	Sun, 13 Oct 2024 15:41:11 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.70])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 71A5819560AA;
	Sun, 13 Oct 2024 15:41:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Robert Mast <rn.mast@zonnet.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/4] media: atomisp: mt9m114: Fix fmt->code not getting set on try_fmt
Date: Sun, 13 Oct 2024 17:40:56 +0200
Message-ID: <20241013154056.12532-5-hdegoede@redhat.com>
In-Reply-To: <20241013154056.12532-1-hdegoede@redhat.com>
References: <20241013154056.12532-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Fix mt9m114_set_fmt() not setting format.format.code when called with
format.which == V4L2_SUBDEV_FORMAT_TRY.

This fixes atomisp failing to start streaming with the mt9m114 on
an Asus T100TA because of __media_pipeline_start() returning -EPIPE.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 1a67f93a53d7..7cf543986b91 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -665,6 +665,7 @@ static int mt9m114_set_fmt(struct v4l2_subdev *sd,
 
 	fmt->width = res->width;
 	fmt->height = res->height;
+	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_state_get_format(sd_state, 0) = *fmt;
-- 
2.47.0


