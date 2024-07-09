Return-Path: <linux-media+bounces-14749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C13692BB12
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 15:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9DD01F21D46
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 13:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5FA15EFC9;
	Tue,  9 Jul 2024 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MqgSuIOL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6815ECCD;
	Tue,  9 Jul 2024 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720531761; cv=none; b=kMgAtkf9fOkN7qcHAOkqiZKIlBhp4N9Xl5QJj+cJseNcgP52NJJIexX1zPHfYE2H5/Q5xxIzbexLdm6t3tnf7xrIPmpXzbiXHU1QNZk8uxTPayQ7Yq0CRnZmHP+3SO86hVYwt4CVt0LMYZvrtSnEitI3XFoGVi01AO4QmPn9meY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720531761; c=relaxed/simple;
	bh=mFsO24iG5YUpUaNSD2UNlN/Wjjn30XanUhAge6n4OLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CncVrORA6VtkwxAzLaK6GdLyuyxpVKJssEuyrE08M7zGFfbGiWI64g+Eye183qHand71DB83idk4WTCWclMCnTspbHCpl+iji6vlp1h8eNb2kt8pdSY8X2ztISONai22JPX9yOZQVMtU6tpFgHk6D47zk++VMsU8Y8pvDwADYLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MqgSuIOL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 835A816C3;
	Tue,  9 Jul 2024 15:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720531724;
	bh=mFsO24iG5YUpUaNSD2UNlN/Wjjn30XanUhAge6n4OLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MqgSuIOLin6RcfsQCFDAAy8ebHsAbqA3fmvxgXTPzmaGL2J6H7e1cezgtfVuJk0jt
	 4XR1DfAdNgUDL47cuGlR4sCfcbQWalY6i/dQr0MRp6uKE3yOfJdom6Embg7xWCi53M
	 h9KRBCOa5H6ihKvSMANmkglTvyjXEObMHssjfusc=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v6 01/18] media: mc-entity: Record number of video devices in a pipeline
Date: Tue,  9 Jul 2024 14:28:49 +0100
Message-Id: <20240709132906.3198927-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
References: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Record the number of video devices in a pipeline so that we can track
in a central location how many need to be started before drivers must
actually begin streaming.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v6:

	- New patch. This is intended to support Sakari's requirement for the
	  driver not to start streaming before all of the video devices have
	  called streamon(). This was the cleanest way I could think to acheive
	  the goal, and lets us just check for start_count == required_count
	  before streaming.

 drivers/media/mc/mc-entity.c | 5 +++++
 include/media/media-entity.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 96dd0f6ccd0d..1e8186b13b55 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -596,6 +596,9 @@ static int media_pipeline_add_pad(struct media_pipeline *pipe,
 
 	list_add_tail(&ppad->list, &pipe->pads);
 
+	if (pad->entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
+		pipe->required_count++;
+
 	dev_dbg(pad->graph_obj.mdev->dev,
 		"media pipeline: added pad '%s':%u\n",
 		pad->entity->name, pad->index);
@@ -713,6 +716,8 @@ static void media_pipeline_cleanup(struct media_pipeline *pipe)
 		list_del(&ppad->list);
 		kfree(ppad);
 	}
+
+	pipe->required_count = 0;
 }
 
 static int media_pipeline_populate(struct media_pipeline *pipe,
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 0393b23129eb..ab84458b40dc 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -104,12 +104,14 @@ struct media_graph {
  * @mdev:		The media device the pipeline is part of
  * @pads:		List of media_pipeline_pad
  * @start_count:	Media pipeline start - stop count
+ * @required_count:	Number of starts required to be "running"
  */
 struct media_pipeline {
 	bool allocated;
 	struct media_device *mdev;
 	struct list_head pads;
 	int start_count;
+	int required_count;
 };
 
 /**
-- 
2.34.1


