Return-Path: <linux-media+bounces-16472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC849569D4
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 13:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C7171C22413
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 11:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE8B16A956;
	Mon, 19 Aug 2024 11:47:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20C166F34
	for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068073; cv=none; b=W/HgbhUcYNKFTjfEWdiR/bhqRj9pGB9xxy+DoAZIttmwOoeJXekjxTk9c5zo7+fsHjiEhjtH533KCRdvrDzF5Xs63Ch+WVEsgfKExLiupIekJlkVNT8FI4Ijb9SJ3wgf9LBkdEfbj0FdNYSeYEBjBd8F1YEUCOp9iiEmlFBLayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068073; c=relaxed/simple;
	bh=1rzj8VVU1+eaSlRo+NK16kiH3KaAQI3wIKo1fGui3zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMh1JfX7Ve1ydToB1hCN5iiEOIiAtM9r7eDQu6ZlrKZG3nBET2VP/z9PhF9UStuDBGZok3U2YFsWv6eqeHhQe9RBE/VEt7lF2GAaD7/+TRko3D1SqGxZixl6zqvT7FKJsvKkgRNUQIAvDjkf0rnz+Furea+xMW1nOJtMkwdjIZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F76AC32782;
	Mon, 19 Aug 2024 11:47:52 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Erling Ljunggren <hljunggr@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] utils/common: add V4L2_CAP_EDID support
Date: Mon, 19 Aug 2024 13:45:43 +0200
Message-ID: <7ab24b375c3d23ffbf2836de16834d94ee8fd88a.1724067944.git.hverkuil-cisco@xs4all.nl>
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

Understand V4L2_CAP_EDID and log it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/common/v4l2-info.cpp | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index aaf7b0b5..7dd7e708 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -91,6 +91,8 @@ static std::string cap2s(unsigned cap)
 		s += "\t\tI/O MC\n";
 	if (cap & V4L2_CAP_READWRITE)
 		s += "\t\tRead/Write\n";
+	if (cap & V4L2_CAP_EDID)
+		s += "\t\tEDID Only\n";
 	if (cap & V4L2_CAP_STREAMING)
 		s += "\t\tStreaming\n";
 	if (cap & V4L2_CAP_EXT_PIX_FORMAT)
-- 
2.43.0


