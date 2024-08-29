Return-Path: <linux-media+bounces-17115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B828963FDD
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 11:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7FEFB24EC0
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B7D18DF67;
	Thu, 29 Aug 2024 09:23:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8153E47B
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 09:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923410; cv=none; b=tpD4xg3KFn/UhzedBuED1gKso2gHokE5r+fi7H5SkczDF7GRQ+FeqDeoKY7vXrE3pdb9tfCaLPvYbdc5vNldD+lYa5p7WpnFqev/K7t7Vqdeg1ljUC53SCoPXjYp0aY+gFIR3QIZS8hF9EF3dHWDLlSo07R1Y5BuYcIeskM/vqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923410; c=relaxed/simple;
	bh=1rzj8VVU1+eaSlRo+NK16kiH3KaAQI3wIKo1fGui3zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFGY/A2wqFtm5pDcZ0qyksO1bW0i40A17g3NjG5aJGyaCda8axkd2+e/ciYvIrEQiVnf0Znwzwfke14jcEhrYupS7xxHTbK17NPRiM6sg1QNiqnGcZVKYv3HLpngi93BrmEx3OvHpf/3wmjmEqldt9wZxaCH0a2Dxi5U0BuggW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5FDC4CEC3;
	Thu, 29 Aug 2024 09:23:28 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Erling Ljunggren <hljunggr@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 2/3] utils/common: add V4L2_CAP_EDID support
Date: Thu, 29 Aug 2024 11:21:41 +0200
Message-ID: <220a3c1242ddcc80df6b6906ee0740f2dbfd7f84.1724923302.git.hverkuil-cisco@xs4all.nl>
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


