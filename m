Return-Path: <linux-media+bounces-28473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F09A68BB9
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9461E88339D
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 11:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28436255E27;
	Wed, 19 Mar 2025 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TExOnI0y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5CA254B08;
	Wed, 19 Mar 2025 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383711; cv=none; b=XhXqch5AEb0uUXVfIwTWq1pk/o8kcluASRTzsQk3Wk0dQn7pghdvL+mwV2XEOPzuaNOgJMM85s1xuqHja0S3prrpQ1Ez4nZ8FLA7gIyDDZQDzOeC4gCxITrqU6l9fTIQ0hrB6xNl/n+OMixe0djjtnUY/dPNtdsXNmnV9qa0kuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383711; c=relaxed/simple;
	bh=ZN1jlt5fzffXHX7r0+lU8IjtsYcES1i+/u6V6QY9S6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pk/otwutYDYA5cguxL02hrcYRj+LD3chiRtolq7xGeu8yaWlBn9ii7VvD6txMf8BoD00Fm+fFPM2QEY12CJ8ycChUeLCU303x42RfvFbH/9R/b263VHRLqWACnT7hExSpuzhqHHMfsghdmA3xXwyMLy5QhLfXpWEeX7mvjDRhWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TExOnI0y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 675BFBDB;
	Wed, 19 Mar 2025 12:26:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742383602;
	bh=ZN1jlt5fzffXHX7r0+lU8IjtsYcES1i+/u6V6QY9S6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TExOnI0yG25T6clDf1Pf/7ZiWVuZVsgqSNcxULPz5OY3KFZrZGJUtkC0a11LLKT5I
	 z0Yc+FRrEHq4JR4TQ90bCvSy00tS6F7eXdDeyJe8LCeziihAgIBzGPY3pzR/5SwmIL
	 kMT9d96UC2IPQGVPjs/VtNSGvAytL4mRYFkyuUP4=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Wed, 19 Mar 2025 12:28:15 +0100
Subject: [PATCH v5 2/7] media: vsp1: dl: Use singleshot DL for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250319-v4h-iif-v5-2-0a10456d792c@ideasonboard.com>
References: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
In-Reply-To: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=ZN1jlt5fzffXHX7r0+lU8IjtsYcES1i+/u6V6QY9S6U=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2qpWb4Fv9iuCiXSv0aBXKp6IyO60vpbXCx4Wh
 iMeGjwTjS6JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9qqVgAKCRByNAaPFqFW
 PKupD/44h1ZcSXhQnfd8PO6XjZMptZweLSZcX9ztHAvHV4my0k3Gj7Xuoa1jq2jUzcmdCtXwy8b
 2Vzm9UTAn6taX+J6MRwe0V5i++Zy+KkShUqzbgKanBObj4fXMRo2Jka5kKuongw2zdgbBwGEPrw
 OkvP1MLkrSG0Yq64bow5nh++iWMqA4h1ZS/gSM/JO+hkVbX0dWqMkRvvtHcB5squ+fUhmZ41gbi
 HiJbcIxqcJ4shW8Ndc3TV0tPxQugHrCJq6FO2opwqV21Qc3HvQrXAGD5kDPDoDyz/uIy1n6k5ig
 cLOullxowOHKzk85dKyXjJTc/6FQX7Y1F19AwYL5J5CCeVC1W99wyLk0a/XQcClnqZnKRC4olyO
 2XU9C3ktuLKUWfha4DqA4bC3XkXuw518011Ay/B0dj+tuYq8u4ZPgdG6uM6I3+NidwHMtV/hE2L
 /lDXqUOhwd1Hkjy7dqDzA323GkZw4UJ6d5TAmLmdnT0DJLosh2a1nlYOQoWHNXMdno3hmspoTDh
 QDpNzFUcEWnKeHudw2/RvUxSCHGENeEC3yHWhNArQUjIOpSuqLGQnWO8GDzEmHUc5g9NCUKfvYG
 nbEOVD60ZJPns6R94s327MvASfW956V7vsUDJfOMUIxw2gLabu7it+VNHTktiQ0nUV1dd6fq3hG
 OpJ9bB8zuOA9WhA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The vsp1_dl library allows to program a display list and feed it
continuously to the VSP2. As an alternative operation mode, the library
allows to program the VSP2 in 'single shot' mode, where a display list
is submitted to the VSP on request only.

Currently the 'single shot' mode is only available when the VSP2 is
controlled by userspace, while it works in continuous mode when driven
by DRM, as frames have to be submitted to the display continuously.

For the VSPX use case, where there is no uapi support, we should however
work in single-shot mode as the ISP driver programs the VSPX on
request.

Initialize the display lists in single shot mode in case the VSP1 is
controlled by userspace or in case the pipeline features an IIF entity,
as in the VSPX case.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v2->v3:
 - Drop () in condition
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index ad3fa1c9cc737c92870c087dd7cb8cf584fce41b..bb8228b198249943399719b5f37c337fc43eed5b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -1099,7 +1099,12 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
 		return NULL;
 
 	dlm->index = index;
-	dlm->singleshot = vsp1->info->uapi;
+	/*
+	 * uapi = single shot mode;
+	 * DRM = continuous mode;
+	 * VSPX = single shot mode;
+	 */
+	dlm->singleshot = vsp1->info->uapi || vsp1->iif;
 	dlm->vsp1 = vsp1;
 
 	spin_lock_init(&dlm->lock);

-- 
2.48.1


