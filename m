Return-Path: <linux-media+bounces-5337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9DD858F0D
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B9531C20F18
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F58657AC;
	Sat, 17 Feb 2024 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cy6iL3Q/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A9651BD
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169097; cv=none; b=ArShToJVpc4UR3ziER75qdd7W8ryzMeE3hLk6TUWUhYXOeWyuuPVakRiwJTp/+RaUMzuSLkJhIYy/ow5IM+jLfbuJ7t0EJKDXHtbeuoiLhBq2yi0yi6oYiqXXRKkZFjUifDAyrRtZtV6KHRdesZ2ZCl0CYZfDdaLJajW3+hY2Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169097; c=relaxed/simple;
	bh=UrCQQxu8wBrCARkGsA0k45w/EsXOxfOGkfpkKb/drr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sY+pU85p+eWDw5klQC2WY9EPuUbTQUblU4fdBMkW+ePBdJpbWHEX7l9AYz5tyN0xd2EotjZVIfXiq730FisDGlXTj166WfqDeJsc8mxN9vh4TI+sfAH2TVp8XWlgaptZ0oitjQQZ7XvQvFNsdWxir5muwqLiYLrP6bgzKthg3zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cy6iL3Q/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Jk/Wjgit8vPCUNupIftP3Nnf9Um0EqGRiw6KxRGK0w=;
	b=cy6iL3Q/SrVbcA5UIDn7xY2PXq00a68WPKjoGGlf0LcRzujc4B0/qnqyv9kohdbgVwMEUe
	yOoqls8bONXtmTO5rEaJ52ojXliUn8RuRTJ+i0Bt77QUkbmnGZg4nL2uo22V1GZGiq8O2k
	CZYpeSvmkaNH++d6pHyWzBwlL0DkibE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-Lb0kwEu4OouNRHcJdb4mJg-1; Sat, 17 Feb 2024 06:24:49 -0500
X-MC-Unique: Lb0kwEu4OouNRHcJdb4mJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDA8287B2A0;
	Sat, 17 Feb 2024 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 654BA1C1C7E2;
	Sat, 17 Feb 2024 11:24:47 +0000 (UTC)
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
Subject: [PATCH 2/9] media: atomisp: Rename atomisp_set_crop_and_fmt()
Date: Sat, 17 Feb 2024 12:24:31 +0100
Message-ID: <20240217112438.15240-3-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-1-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Rename atomisp_set_crop_and_fmt() to atomisp_set_sensor_crop_and_fmt()
to make clear that it operates on the sensor subdev.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8593ba90605f..eb37bb6e41f9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3721,9 +3721,9 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	*padding_h = max_t(u32, *padding_h, min_pad_h);
 }
 
-static int atomisp_set_crop_and_fmt(struct atomisp_device *isp,
-				    struct v4l2_mbus_framefmt *ffmt,
-				    int which)
+static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
+					   struct v4l2_mbus_framefmt *ffmt,
+					   int which)
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_subdev_selection sel = {
@@ -3817,7 +3817,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 
 	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);
 
-	ret = atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
+	ret = atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
 	if (ret)
 		return ret;
 
@@ -4263,7 +4263,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 
 	/* Disable dvs if resolution can't be supported by sensor */
 	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-		ret = atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
+		ret = atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
 		if (ret)
 			return ret;
 
@@ -4281,7 +4281,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		}
 	}
 
-	ret = atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_ACTIVE);
+	ret = atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (ret)
 		return ret;
 
-- 
2.43.0


