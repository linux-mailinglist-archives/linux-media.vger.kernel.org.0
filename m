Return-Path: <linux-media+bounces-17113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33FA963FDB
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 11:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32D43B2488B
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A984F18D652;
	Thu, 29 Aug 2024 09:23:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5406818CC18
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923407; cv=none; b=PS0dTxX3uHnxlarGalosjABE/Y2262UCvs3OnhMXcDUSf6sywr7FqtAyCkYZ334E2+YURMlX3GvTmC+HYRkPG13zYzynshex5EjzCuFThYRMOCYcM/m+TliKX0Vi7VWCZ5Vb7Zt+Nxl4eZ6QJQH3uhpUr4PF9a6Ur/YSgN3d0oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923407; c=relaxed/simple;
	bh=QKvx4t08fLteIPM7Or+JePeORdGz6/uco0v5J8SX2LY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WRUnVd9Zkw7VH29xDpFFghew4wH4O/oTypxoTf/4FPPQTIF7iJGeqPhlExSqPEGs8Gyiag1ImCyBzxaOgyWEwqaL/guQNXQS/PxLMmARaLb8EZTtpFBHDIylOWZL5rgZy/f4bVE/DiTjzL1vSwRdF5heULrGi4nwqo3A5V5VBCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42516C4CEC1;
	Thu, 29 Aug 2024 09:23:26 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCHv2 0/3] v4l-utils: add support for V4L2_CAP_EDID
Date: Thu, 29 Aug 2024 11:21:39 +0200
Message-ID: <cover.1724923302.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for V4L2_CAP_EDID to v4l2-ctl and
v4l2-compliance.

This is for this series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=13364

Changes since v1:

- Check in v4l2-compliance that CAP_EDID isn't mixed with other video caps
  (and vice versa) as suggested by Ricardo.

Regards,

	Hans

Hans Verkuil (3):
  videodev2.h: add CAP_EDID (DO NOT COMMIT)
  utils/common: add V4L2_CAP_EDID support
  v4l2-compliance: add support for V4L2_CAP_EDID

 include/linux/videodev2.h                     |  1 +
 utils/common/v4l2-info.cpp                    |  2 ++
 utils/v4l2-compliance/v4l2-compliance.cpp     | 23 ++++++++++++++++---
 utils/v4l2-compliance/v4l2-test-io-config.cpp |  4 +++-
 4 files changed, 26 insertions(+), 4 deletions(-)

-- 
2.43.0


