Return-Path: <linux-media+bounces-16471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 080319569D3
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 13:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A9F01C22392
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 11:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8D916A930;
	Mon, 19 Aug 2024 11:47:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838D315DBAB
	for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068072; cv=none; b=bctMrCTdPmXBKa4auAkLRUYIYLg6poYkMy/N6WKZjTm/KWF6Y3cAfu/bR/FVv+SLfM9vEuiHfxdjW50wop1f8+HpOL/rBKkxowsErRG7dDr2QJgkVgOjjIjNMQPMEDlsIXQ+x28Ya6yvlUHvNxkEwNWw4n0xhvvTYB2thxMxabo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068072; c=relaxed/simple;
	bh=21DfWFG1OLpDMw0d4jBnDJoi9K+S7qg8y9KMO7zwhdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eylGpaay4jc7BfXp7K0/lWXNl+3dgsJsksCgmDSFDOM45ZJQyPY8/8HnwAApSOyJsTQxsXiHGa3NDYBgqgL0wAp/QJQlI1jv47UtbOlGHt5QfUvAK707bNbr1JKuJmJE/eC1GQSaEuWwDiLfl/iNACWahOLsGIKKYdJhYVKush4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B9EC4AF0C;
	Mon, 19 Aug 2024 11:47:50 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Erling Ljunggren <hljunggr@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] videodev2.h: add CAP_EDID (DO NOT COMMIT)
Date: Mon, 19 Aug 2024 13:45:42 +0200
Message-ID: <26dd745a0b3c99b92da21eb767272928fa4a6742.1724067944.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724067944.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724067944.git.hverkuil-cisco@xs4all.nl>
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


