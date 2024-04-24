Return-Path: <linux-media+bounces-10093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B18B1784
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AA57B218E4
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348621E86F;
	Wed, 24 Apr 2024 23:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MxeTB9J1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A1141C68
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003074; cv=none; b=gpomBJ2FkK8g9U8v6BnYEKK3XpGxJEosreWOBp6qGkNCAL+GoJ4pG6l4IsDWuqC1TaycKQt22EmEbjBVLsgKWmTgtxEKLQzhuP/ma5z/v685Kd7ShsUA+W41L4IegdY3fRHtvUYioJR0QgomsKfdqKJqHS2J8Q29qw9Wciovjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003074; c=relaxed/simple;
	bh=DParDiem+PolXFYuzkrMLrrTqcArw7q95yhZvUHEkt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PslaqE3lcKFO1YGIAquomOvwGHLZpZQrquyW1rmE9xAj0b/GDIERsT41uYuMaYNvw0beYBnHSuc0nfJUQPqxvtAd0K/z2jv0vuG1VBeWFqcoS8JJHPO4XC5AB8bknNM/JdpG39cL3tYXLkUcy4ES9neTxQnSRiq8EJ+y2Ytk79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MxeTB9J1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 545174D0;
	Thu, 25 Apr 2024 01:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003019;
	bh=DParDiem+PolXFYuzkrMLrrTqcArw7q95yhZvUHEkt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MxeTB9J1yHNDC01oD0EiglUvNZWmBex58U6pxVY92scUWreBpi+PKpSozelCIwXli
	 tLxp1ZILFvB1i1VnIH73zvqZCU+TEASKz0KgGL5Feajqeoz/TGsvHH/Fwp1s8cK70T
	 QobJFjfC81ScyVX9LMmBE0zddCLlxuVcU7o7fcNs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 1/9] media: vimc: Don't iterate over single pad
Date: Thu, 25 Apr 2024 02:57:33 +0300
Message-ID: <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The .init_state() operations of the debayer and sensor entities iterate
over the entity's pads. In practice, the iteration covers a single pad
only. Access the pad directly and remove the loops.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-debayer.c |  9 +++------
 drivers/media/test-drivers/vimc/vimc-sensor.c  | 10 +++-------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index d72ed086e00b..e1bf6db73050 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -155,16 +155,13 @@ static int vimc_debayer_init_state(struct v4l2_subdev *sd,
 {
 	struct vimc_debayer_device *vdebayer = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
-	unsigned int i;
 
 	mf = v4l2_subdev_state_get_format(sd_state, 0);
 	*mf = sink_fmt_default;
 
-	for (i = 1; i < sd->entity.num_pads; i++) {
-		mf = v4l2_subdev_state_get_format(sd_state, i);
-		*mf = sink_fmt_default;
-		mf->code = vdebayer->src_code;
-	}
+	mf = v4l2_subdev_state_get_format(sd_state, 1);
+	*mf = sink_fmt_default;
+	mf->code = vdebayer->src_code;
 
 	return 0;
 }
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 5e34b1aed95e..b535b3ffecff 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -44,14 +44,10 @@ static const struct v4l2_mbus_framefmt fmt_default = {
 static int vimc_sensor_init_state(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state)
 {
-	unsigned int i;
+	struct v4l2_mbus_framefmt *mf;
 
-	for (i = 0; i < sd->entity.num_pads; i++) {
-		struct v4l2_mbus_framefmt *mf;
-
-		mf = v4l2_subdev_state_get_format(sd_state, i);
-		*mf = fmt_default;
-	}
+	mf = v4l2_subdev_state_get_format(sd_state, 0);
+	*mf = fmt_default;
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart


