Return-Path: <linux-media+bounces-39346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA379B1F7F0
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2CFA17D4FF
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352811DED53;
	Sun, 10 Aug 2025 01:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SbW11P5R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3F618C02E
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789606; cv=none; b=EiJMIM4NhrF7Gnale0L57fpHknUGF/Jnqrgzytktbcsx9ldi6+Q/tWnwpm8Z7AS6rBdqnsZBK+LiaxgelohiS5K0WF1hsgffNWs51vxAz8cHZYMwdN6oImhtSeI5dwIxZPZVdM2L96LT7E2zbvC3n3vrsrqy2C1deRJYWXNlhNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789606; c=relaxed/simple;
	bh=z6ckcRlS4aI+68Vt5QBmnaAGj1a8kv3hSRAwwv4O8Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xri3A/tDNZhPHCSoKWFgeGSC4skwk9pJzsrCFu8CN4sTuVnFDPuLRMNgqTj0/XDDSXChiqWd4UfTbCCSHFXii+popyyAmiSp/hNQ+Q2rrbL5WZ1mdaCCSIE5M1vqtCExZv8G9PJi4zUpkBCXiXGtApvM7jCU2rWxtj2JzWDjC/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SbW11P5R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AACA67E6;
	Sun, 10 Aug 2025 03:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789550;
	bh=z6ckcRlS4aI+68Vt5QBmnaAGj1a8kv3hSRAwwv4O8Po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SbW11P5RiOmNCypkhEMley7O4/mq38MAVzwvJlLlLWhNYjYBUNQT9iCQ7a4zxUl24
	 jCPK1nb0StVzl1WseEXarwOvWTqonauRnXYvoQfO7UToQ5EeeEfx4t/so2w9tG5mwQ
	 GLa460sdm6yIpCmp02OBRqGZ2leLmJa1IAZdph0M=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v3 73/76] media: v4l2-pci-skeleton: Rename second ioctl handlers argument to 'void *priv'
Date: Sun, 10 Aug 2025 04:30:55 +0300
Message-ID: <20250810013100.29776-74-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second argument to the ioctl handlers is not a file handle any more.
Rename it to 'void *priv', to avoid misconceptions. This is particularly
important in the v4l2-pci-skeleton driver, as it is meant to be a base
for new drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 samples/v4l/v4l2-pci-skeleton.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index d709d82800cd..69925d30329e 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -470,7 +470,7 @@ static int skeleton_querystd(struct file *file, void *priv, v4l2_std_id *std)
 	return 0;
 }
 
-static int skeleton_s_dv_timings(struct file *file, void *_fh,
+static int skeleton_s_dv_timings(struct file *file, void *priv,
 				 struct v4l2_dv_timings *timings)
 {
 	struct skeleton *skel = video_drvdata(file);
@@ -509,7 +509,7 @@ static int skeleton_s_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int skeleton_g_dv_timings(struct file *file, void *_fh,
+static int skeleton_g_dv_timings(struct file *file, void *priv,
 				 struct v4l2_dv_timings *timings)
 {
 	struct skeleton *skel = video_drvdata(file);
@@ -522,7 +522,7 @@ static int skeleton_g_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int skeleton_enum_dv_timings(struct file *file, void *_fh,
+static int skeleton_enum_dv_timings(struct file *file, void *priv,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct skeleton *skel = video_drvdata(file);
@@ -544,7 +544,7 @@ static int skeleton_enum_dv_timings(struct file *file, void *_fh,
  * can lock but that the DMA engine it is connected to cannot handle
  * pixelclocks above a certain frequency), then -ERANGE is returned.
  */
-static int skeleton_query_dv_timings(struct file *file, void *_fh,
+static int skeleton_query_dv_timings(struct file *file, void *priv,
 				     struct v4l2_dv_timings *timings)
 {
 	struct skeleton *skel = video_drvdata(file);
@@ -573,7 +573,7 @@ static int skeleton_query_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int skeleton_dv_timings_cap(struct file *file, void *fh,
+static int skeleton_dv_timings_cap(struct file *file, void *priv,
 				   struct v4l2_dv_timings_cap *cap)
 {
 	struct skeleton *skel = video_drvdata(file);
-- 
Regards,

Laurent Pinchart


