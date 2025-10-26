Return-Path: <linux-media+bounces-45573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DCDC0AFE0
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 19:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC6014E90AD
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 18:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A012E9EB2;
	Sun, 26 Oct 2025 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oeeP6ro6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D65188713;
	Sun, 26 Oct 2025 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761502316; cv=none; b=QGR54DzgoSxJdpoFlFGYvzOoHALIGKRgiy42wETzXGflKlZuQVr7Rp840G89OnzgRU1bdzHV1WuUxx4J066xOtw89Vyw88wij1Ptu006DnxYU6ENPWL8n3fnblwUnVO5AZaoM4DnFMgpeGpnyznRPKuqOMrD/ED4YxKtqbwiil8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761502316; c=relaxed/simple;
	bh=SZKdj9IQeuqkQDHXZ37SPDE27z7HAZkXdYI72nGHUHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIpWv/Rnko6gn96Hcqvt8gwEhVzjuk6PJRiFNluRAkruncDsSg1HmHMJ5Vbr8E+PX2fB91Bfsme58ad3eK6fDyV19sQFsakq4+dmQbeE1i9xd/IJ8kgQgkwhdIPX6jooBvIXjsrNtAXotyR1eXjr9x8IBP8Z/xtqV5BIDJjFFjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oeeP6ro6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7FD2F2B3;
	Sun, 26 Oct 2025 19:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761502205;
	bh=SZKdj9IQeuqkQDHXZ37SPDE27z7HAZkXdYI72nGHUHw=;
	h=From:To:Cc:Subject:Date:From;
	b=oeeP6ro6qdba/E/NprQNv3G0g3C760h1FL0xtMhro6EEwytlkGj+mN6antmR84SuW
	 PE0/5P3AA1a9a5L5iCCmOe0k3FHUIGJcWIVNzSGwG3B2eGdoGvMMsIh5IJBXSyNYWE
	 owoUjwp9Am1XqLu306FPAihnJVvy7UyZlIHAiWyw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bod@kernel.org>
Subject: [PATCH] media: qcom: iris: Constify iris_v4l2_file_ops
Date: Sun, 26 Oct 2025 20:11:38 +0200
Message-ID: <20251026181138.13387-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The iris_v4l2_file_ops structure is never modified. Make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index d38d0f6961cd..c9b881923ef1 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -630,7 +630,7 @@ static int iris_enc_cmd(struct file *filp, void *fh,
 	return ret;
 }
 
-static struct v4l2_file_operations iris_v4l2_file_ops = {
+static const struct v4l2_file_operations iris_v4l2_file_ops = {
 	.owner                          = THIS_MODULE,
 	.open                           = iris_open,
 	.release                        = iris_close,

base-commit: ea299a2164262ff787c9d33f46049acccd120672
-- 
Regards,

Laurent Pinchart


