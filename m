Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F63625B161
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgIBQSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:18:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:53504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgIBQKq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:46 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6DCE208CA;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=o6Sh4lf9iPZGm59TmPs0E72ml8wcW0c1F943Y0tZ+fU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q8vRkqBaakRSn5pZdvB0Iz/Uk04wuGVZ5NGOLRHAVU1NKm+g04R+Ic2PSCEAIHje0
         XTyYzYr7Tn968sW59wVoqt0U1E+4veme24+9Cfjaad0K0aSje46uYK48TBUTjpsj4r
         b/HxNImuKoH0l07N/riDO2pNYtn/WAPRFoXwtl5U=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000t9l-M7; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/38] media: v4l2-ioctl: avoid memory leaks on some time32 compat functions
Date:   Wed,  2 Sep 2020 18:10:05 +0200
Message-Id: <27254f9780e7ec8502761826c2888dbd51a536a8.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some reports about possible memory leaks:

	drivers/media/v4l2-core//v4l2-ioctl.c:3203 video_put_user() warn: check that 'ev32' doesn't leak information (struct has a hole after 'type')
	drivers/media/v4l2-core//v4l2-ioctl.c:3230 video_put_user() warn: check that 'vb32' doesn't leak information (struct has a hole after 'memory')

While smatch seems to be reporting a false positive (line 3203),
there's indeed a possible leak with reserved2 at vb32.

We might have fixed just that one, but smatch checks won't
be able to check leaks at ev32. So, re-work the code in a way
that will ensure that the var contents will be zeroed before
filling it.

With that, we don't need anymore to touch reserved fields.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 48 ++++++++++++++--------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a556880f225a..6f3fe9c4b64a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3189,17 +3189,16 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 #ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_DQEVENT_TIME32: {
 		struct v4l2_event *ev = parg;
-		struct v4l2_event_time32 ev32 = {
-			.type		= ev->type,
-			.pending	= ev->pending,
-			.sequence	= ev->sequence,
-			.timestamp.tv_sec  = ev->timestamp.tv_sec,
-			.timestamp.tv_nsec = ev->timestamp.tv_nsec,
-			.id		= ev->id,
-		};
+		struct v4l2_event_time32 ev32;
 
+		memset(&ev32, 0, sizeof(ev32));
+		ev32.type		= ev->type,
+		ev32.pending		= ev->pending,
+		ev32.sequence		= ev->sequence,
+		ev32.timestamp.tv_sec	= ev->timestamp.tv_sec,
+		ev32.timestamp.tv_nsec	= ev->timestamp.tv_nsec,
+		ev32.id			= ev->id,
 		memcpy(&ev32.u, &ev->u, sizeof(ev->u));
-		memcpy(&ev32.reserved, &ev->reserved, sizeof(ev->reserved));
 
 		if (copy_to_user(arg, &ev32, sizeof(ev32)))
 			return -EFAULT;
@@ -3210,21 +3209,22 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
 	case VIDIOC_DQBUF_TIME32:
 	case VIDIOC_PREPARE_BUF_TIME32: {
 		struct v4l2_buffer *vb = parg;
-		struct v4l2_buffer_time32 vb32 = {
-			.index		= vb->index,
-			.type		= vb->type,
-			.bytesused	= vb->bytesused,
-			.flags		= vb->flags,
-			.field		= vb->field,
-			.timestamp.tv_sec	= vb->timestamp.tv_sec,
-			.timestamp.tv_usec	= vb->timestamp.tv_usec,
-			.timecode	= vb->timecode,
-			.sequence	= vb->sequence,
-			.memory		= vb->memory,
-			.m.userptr	= vb->m.userptr,
-			.length		= vb->length,
-			.request_fd	= vb->request_fd,
-		};
+		struct v4l2_buffer_time32 vb32;
+
+		memset(&vb32, 0, sizeof(vb32));
+		vb32.index		= vb->index,
+		vb32.type		= vb->type,
+		vb32.bytesused		= vb->bytesused,
+		vb32.flags		= vb->flags,
+		vb32.field		= vb->field,
+		vb32.timestamp.tv_sec	= vb->timestamp.tv_sec,
+		vb32.timestamp.tv_usec	= vb->timestamp.tv_usec,
+		vb32.timecode		= vb->timecode,
+		vb32.sequence		= vb->sequence,
+		vb32.memory		= vb->memory,
+		vb32.length		= vb->length,
+		vb32.request_fd		= vb->request_fd,
+		memcpy(&vb32.m, &vb->m, sizeof(vb->m));
 
 		if (copy_to_user(arg, &vb32, sizeof(vb32)))
 			return -EFAULT;
-- 
2.26.2

