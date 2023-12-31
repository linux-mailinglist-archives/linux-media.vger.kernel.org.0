Return-Path: <linux-media+bounces-3116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A02AE820B00
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56173281E49
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7673C37;
	Sun, 31 Dec 2023 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bRB/NhWA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C895133D5
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/D5kn92EyIN4VJYiMHV5JLGxxxixiL9iUiAsEf8zGsM=;
	b=bRB/NhWAUwDcIThPgQwbAyAcZULQICPZ0o8Zc9zK/cth/FFlEPSIzZjDnIyYTnUnTmNNCP
	NTrIBoPxFHodul26NValAvn50Wfqn9BrlXmzERYLMepsW65oor/JbxM4h95QOBOpP1F7vx
	gQeAMDK7vc1N5693GVsc8FhlpDelxcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-ENkHbEGaOL-1Ps9WN0biJw-1; Sun, 31 Dec 2023 05:31:13 -0500
X-MC-Unique: ENkHbEGaOL-1Ps9WN0biJw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F7A833944;
	Sun, 31 Dec 2023 10:31:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C31E492BC6;
	Sun, 31 Dec 2023 10:31:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 03/15] media: atomisp: Remove s_routing subdev call
Date: Sun, 31 Dec 2023 11:30:45 +0100
Message-ID: <20231231103057.35837-4-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
References: <20231231103057.35837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

sensor drivers do not implement the s_routing subdev call, so there is
no use in calling it.

Also the 3 0 arguments are not the arguments which a successful
s_routing call is supposed to take.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 404317f6c57b..85d0847d7e1c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -666,14 +666,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		return ret;
 	}
 
-	/* select operating sensor */
-	ret = v4l2_subdev_call(isp->inputs[input].camera, video, s_routing,
-			       0, 0, 0);
-	if (ret && (ret != -ENOIOCTLCMD)) {
-		dev_err(isp->dev, "Failed to select sensor\n");
-		return ret;
-	}
-
 	if (!IS_ISP2401) {
 		motor = isp->inputs[input].motor;
 	} else {
-- 
2.43.0


