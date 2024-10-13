Return-Path: <linux-media+bounces-19512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F1099BA22
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 17:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15C13B211B3
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 15:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FAA147C91;
	Sun, 13 Oct 2024 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRN5pQFx"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A57146A6C
	for <linux-media@vger.kernel.org>; Sun, 13 Oct 2024 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728834070; cv=none; b=l1Kwif1PkNEJ79ubXsXI9coa0vl2CNVVezsWoax8F/DvoyG43cCdzV1LHe4hZRDKLsKXcRo4sp4k17G3lkQwo+G5jn8Gnzr5qyaWMnymEalPFc5GeTO8iSHpPDbwAq8KkM/HApGn1d5iKAtpWcbn5d/6j989LooTKZJMzHHMVaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728834070; c=relaxed/simple;
	bh=3cazwMJtsoHsgyTdJwUQjHhmVBKMX8oJ8sMHpXzyn6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRSs/NS/EiMArJUfnSp2poRJLxky6qkPem5HRkJjnXUGS1asIYy9gBUCWTRIp/BvDQotXIRj62w4sWS/I1k7rSRm9RnQf/af458dSocqD002VTgGLAoXg3vPKclJ968BYE+thWDbB8mPjrrghUnN6n8bw54ygTpBqky6Tz1LKJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SRN5pQFx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728834066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myIZloc/IR0tcmVaTEShSRjZ134QHehFws73ciXiCZw=;
	b=SRN5pQFxHUUIhvu320HSRusqbwAoOdGpKkyr9SOr0iQ9dC8cTwMTie08HckuHQkweQJLN4
	y/8kcHJK337/4ALPX9uSaD6nLViBhSrf0NE4X6akRNmw264Fz81GvNsAVuF3W2MpS+avGy
	UcKKFH+QM3KGczDRUXbmdYKMFghWKeA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-uyWBOKFOPcm0eE8GjQ4FfQ-1; Sun,
 13 Oct 2024 11:41:05 -0400
X-MC-Unique: uyWBOKFOPcm0eE8GjQ4FfQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98B6219560A2;
	Sun, 13 Oct 2024 15:41:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.70])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10B3219560AE;
	Sun, 13 Oct 2024 15:41:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Robert Mast <rn.mast@zonnet.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/4] media: atomisp: Fix WARN_ON() in vb2_start_streaming() triggering
Date: Sun, 13 Oct 2024 17:40:53 +0200
Message-ID: <20241013154056.12532-2-hdegoede@redhat.com>
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

If atomisp fails to start the stream the buffers must be returned to
the VB2_BUF_STATE_QUEUED state before returning an error from
atomisp_start_streaming().

This fixes the following WARN_ON():
[  250.313554] WARNING: CPU: 3 PID: 2178 at drivers/media/common/videobuf2/videobuf2-core.c:1801 vb2_start_streaming+0xcb/0x150 [videobuf2_common]

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d7e8a9871522..47d8a17379b0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -881,8 +881,10 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	mutex_lock(&isp->mutex);
 
 	ret = atomisp_pipe_check(pipe, false);
-	if (ret)
+	if (ret) {
+		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
 		goto out_unlock;
+	}
 
 	/*
 	 * When running a classic v4l2 app after a media-controller aware
@@ -895,6 +897,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	mutex_unlock(&isp->media_dev.graph_mutex);
 	if (ret) {
 		dev_err(isp->dev, "Error starting mc pipeline: %d\n", ret);
+		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
 		goto out_unlock;
 	}
 
-- 
2.47.0


