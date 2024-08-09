Return-Path: <linux-media+bounces-16039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7294CBE9
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 302371F22343
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6365018CC0C;
	Fri,  9 Aug 2024 08:13:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08925C8D1;
	Fri,  9 Aug 2024 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723191194; cv=none; b=P1P6cMlGmURDvKYSW/OFPW4Fr0zgt1GLAvNUldAFV9+nXo6W20+vDGfOEkCMx3ZVRm4P5FO/q3LQSZ6I5Oy8q3uz+q/0NZczXGQ3n32h8Uop0eyx9hYEzbtXEqwrYAJKQJxwAjcvKlqBp5F7dyl/MHq8r44mqsmzTNw0lA9GSFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723191194; c=relaxed/simple;
	bh=aIvaALlZrp746VXN+DqthRgrtu8Hxy9kmVf1zc2oSwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WInS2FACeEBw0P3xkhcsPb+N7CxWtnK7m3e7j9KnhCIarC5E1pomS9JMcKCGXSqcfYXoyywFniElSIrA8Q+538RNN2wpI8FS9o/a4qiSwW6+GlixoZoSrQQFC+sECe6I1LeuU9U5M4Mxh69yZWFCZdFxRXajqbq3iPXZeM6Gcyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8746C4AF09;
	Fri,  9 Aug 2024 08:13:12 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	Erling Ljunggren <hljunggr@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/6] media: videodev2.h: add V4L2_CAP_EDID
Date: Fri,  9 Aug 2024 09:57:33 +0200
Message-ID: <485324508040defc0ba0fb211a6596dc65f2d994.1723190258.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Erling Ljunggren <hljunggr@cisco.com>

Add capability flag to indicate that the device is an EDID-only device.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/uapi/linux/videodev2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4e91362da6da..987c821aed79 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -502,6 +502,7 @@ struct v4l2_capability {
 #define V4L2_CAP_META_CAPTURE		0x00800000  /* Is a metadata capture device */
 
 #define V4L2_CAP_READWRITE              0x01000000  /* read/write systemcalls */
+#define V4L2_CAP_EDID			0x02000000  /* Is an EDID-only device */
 #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O ioctls */
 #define V4L2_CAP_META_OUTPUT		0x08000000  /* Is a metadata output device */
 
-- 
2.43.0


