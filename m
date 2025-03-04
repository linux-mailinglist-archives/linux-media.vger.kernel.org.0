Return-Path: <linux-media+bounces-27463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7023DA4DC20
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6D61779C7
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7EF1FF7D4;
	Tue,  4 Mar 2025 11:11:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57385202C36
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086688; cv=none; b=lkzQ0gonpHDnda3kEoVl9gyAupJ87KvcdMXzlIaC+Musoroos558HrWfsemw4P4BE5LzpwcDcQLc+At+aaoUYW3nvBCNx15EXV2ZNWpU/e57VadYpKdYAElJZA88LRjBEUp2d3z+CZSZJ/E9MuT5WPpVNjWlyLNGhccQOaHh5sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086688; c=relaxed/simple;
	bh=53oFQiSHOijz9stsb5FR7oloHky2qizF+nvvB35c4Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtqgqLA0DXq2ULnl7ZOMEyToHqzQapw/XmAyqtf86cI996xSh0YlUj6tTxCvjTqc9TK5i3F4CfDe4DDiyWZM++B6hrF85bb6GxY8e5nqeByMvypnz+XPu7187lhJjAP2dvihjHIrU26yfdAO3O1otmUCsgw0C2tAewG6a05qHWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7A4C4CEE5;
	Tue,  4 Mar 2025 11:11:27 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 3/8] staging: media: atomisp/starfive: use (t,l)/wxh format for rectangle
Date: Tue,  4 Mar 2025 12:08:09 +0100
Message-ID: <b610e3fb637d65f99bd9ae59751c65c2df560255.1741086494.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1741086494.git.hverkuil@xs4all.nl>
References: <cover.1741086494.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize reporting of rectangles to (t,l)/wxh.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
 drivers/staging/media/starfive/camss/stf-isp.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 02ccf80e6559..8feb627ddcca 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3742,8 +3742,8 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 
 	ret = v4l2_subdev_call(input->camera, pad, set_selection, sd_state, &sel);
 	if (ret)
-		dev_err(isp->dev, "Error setting crop to %ux%u @%ux%u: %d\n",
-			sel.r.width, sel.r.height, sel.r.left, sel.r.top, ret);
+		dev_err(isp->dev, "Error setting crop to (%d,%d)/%ux%u: %d\n",
+			sel.r.left, sel.r.top, sel.r.width, sel.r.height, ret);
 
 set_fmt:
 	if (ret == 0)
diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
index 4e6e26736852..df7a903fbb1b 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.c
+++ b/drivers/staging/media/starfive/camss/stf-isp.c
@@ -278,7 +278,7 @@ static int isp_set_selection(struct v4l2_subdev *sd,
 		isp_set_format(sd, state, &fmt);
 	}
 
-	dev_dbg(isp_dev->stfcamss->dev, "pad: %d sel(%d,%d)/%dx%d\n",
+	dev_dbg(isp_dev->stfcamss->dev, "pad: %d sel(%d,%d)/%ux%u\n",
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
 	return 0;
-- 
2.47.2


