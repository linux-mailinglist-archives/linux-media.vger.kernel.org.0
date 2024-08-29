Return-Path: <linux-media+bounces-17114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A374E963FDC
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 11:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4862E1F2614A
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB3F18DF84;
	Thu, 29 Aug 2024 09:23:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF818CC18
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923408; cv=none; b=qw2PfKK3jE9M7MHWiMpIyZ80LB+JILEwfR/G0al45Jt1knYz3xatBSk52ZSZem3EIG9ORJSmaOam/0L0J3Ap/fHS5uzALBwFZwMf+/DhG2Lb5+nLn2QWS5UxNP6q6PujY1ZQNegkm8TUj169FWfu407FdkITg3f8tEWrM+8ZuKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923408; c=relaxed/simple;
	bh=21DfWFG1OLpDMw0d4jBnDJoi9K+S7qg8y9KMO7zwhdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fRaMPHYhB5OZ4T5AoAMVMjpL9kA92qAE1na/JFNjg5VCpt35REiiI+ufQSPbUwmFHkEyEh632XnXu3siGUUvibLBCVisQF2b26duUkgJpcAeVsUgXrXhQ/uy/H/NWOhvooezBPTyqwwlMPr02Gjk3OTYZAHF4/onCnhLq8SuczY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66473C4CEC2;
	Thu, 29 Aug 2024 09:23:27 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Erling Ljunggren <hljunggr@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 1/3] videodev2.h: add CAP_EDID (DO NOT COMMIT)
Date: Thu, 29 Aug 2024 11:21:40 +0200
Message-ID: <38c1b4818233dda5a20d37faf90e0a68f1a0f532.1724923302.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724923302.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724923302.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add capability flag to indicate that the device is an EDID-only device.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/linux/videodev2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index f18a40d4..dab68c8d 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -475,6 +475,7 @@ struct v4l2_capability {
 #define V4L2_CAP_META_CAPTURE		0x00800000  /* Is a metadata capture device */
 
 #define V4L2_CAP_READWRITE              0x01000000  /* read/write systemcalls */
+#define V4L2_CAP_EDID			0x02000000  /* Is an EDID-only device */
 #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O ioctls */
 #define V4L2_CAP_META_OUTPUT		0x08000000  /* Is a metadata output device */
 
-- 
2.43.0


