Return-Path: <linux-media+bounces-9353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF058A4E57
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE9351C2123D
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01ED56BB50;
	Mon, 15 Apr 2024 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cvSolHNT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4BC69DFD
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182566; cv=none; b=Fni1/BX58gjYRZMjGwUqx4QMc6etZlSb4SwhqtGplbSR0pLc9hkPp5rJCIgGECSAEio80xlmTxg5n4xg4ZqrhRK5HSsW5iB6VihadBXMhWrThNv/YOAVYBsHKloail6Pa50gsS3Y9WukJM9dRcYE4S0DL7Oki8M1lkhM1PR78Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182566; c=relaxed/simple;
	bh=IBjycQH/ah2J6zEhfDYnafJcHq1wuOsLvoN3Mm1nCcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZfYRIYqUJCXVac5hpqfQmidMW81DeE+tN/CORr3mN63l37gavbKky0K0K9r2GFoFlJ3I1kwnXbUKvLSPHQlC0u+sYt+MUfBYgmjzN7G/hghrLOGeGipd2jubZVZ6GRxL5OyyEDkf10h9gksfUcIZRHeWVLVeh/3rtW1HSSGTNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cvSolHNT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BOItoHEXWBi06NOb9JNy1oZLgbJnOL7jxLkfa62azxc=;
	b=cvSolHNTOFhXYZsyGMSoNUz+nINMboArB0kkjk85ZmJ2Hb9ItKNOIMMU15QQGeMd8rU8eR
	nN8vhQowbIapbNzBnJ/YiULyDqmIox/9rWI3hnsBzvx2BOnbf711VQ2GCGTlMzJcYO8PPT
	zEb/aL/uA0jNKfF+FqD92IbIoOMkPmU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-NNeDycYkPWenH6Bs8heE3A-1; Mon, 15 Apr 2024 08:02:40 -0400
X-MC-Unique: NNeDycYkPWenH6Bs8heE3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 014C91049BC7;
	Mon, 15 Apr 2024 12:02:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBE19C13FA2;
	Mon, 15 Apr 2024 12:02:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/23] media: atomisp: Simplify atomisp_s_input() input argument checking
Date: Mon, 15 Apr 2024 14:02:01 +0200
Message-ID: <20240415120220.219480-5-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Simplify the checking of the input argument to atomisp_s_input():
- Remove the check for input >= ATOM_ISP_MAX_INPUTS, input_cnt
  never is > ATOM_ISP_MAX_INPUTS so checking only that is sufficient
- Remove the unnecessary camera local variable
- Move the 2 invalid argument checks to above the atomisp_pipe_check()
  which checks if the pipe is busy or not

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c  | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index b3ad53449cb8..1f8d44900a82 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -449,24 +449,18 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	struct v4l2_subdev *camera = NULL;
 	int ret;
 
+	if (input >= isp->input_cnt)
+		return -EINVAL;
+
+	if (!isp->inputs[input].camera)
+		return -EINVAL;
+
 	ret = atomisp_pipe_check(pipe, true);
 	if (ret)
 		return ret;
 
-	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
-		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
-		return -EINVAL;
-	}
-
-	camera = isp->inputs[input].camera;
-	if (!camera) {
-		dev_err(isp->dev, "%s, no camera\n", __func__);
-		return -EINVAL;
-	}
-
 	return atomisp_select_input(isp, input);
 }
 
-- 
2.44.0


