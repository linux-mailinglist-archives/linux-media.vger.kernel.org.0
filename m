Return-Path: <linux-media+bounces-15343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD993C23F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 14:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE5271C20DE7
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 12:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FE51993A3;
	Thu, 25 Jul 2024 12:43:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3D198A2C
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721911412; cv=none; b=HIgg7trP4nzMxrnkHydhx1IDQOxmciWYuulodhWJHnSoMCgIwjTYZI5qGLyF4dmwmA9h7Q9e+KyMtLLdjTRtZM6xMZ+9BfkRqXQveMS3j6gAjCVybQdkQfVt5v06aw2Pm1/iwed+bZRhkE25L/iZHlu/KoUbc8BTmCvns3IbRyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721911412; c=relaxed/simple;
	bh=qrodQQskSmZzSpPXR3RAIXyGTmPAzDKTzsgWv4Ae0FM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=E8aEUXWxMXrmttQKDOKjUXMDl9HkESrsjtkCEL0rVHpbCTy/HRE3CDqX2+fU/DRYSEjtF1YpjXW925NDi+Eg4aq/vQ7x0wSN2AL8X0fFsN390gBAAeGNd5FloGBS0neSznpxUB1RSMVDurEXqtk7suGdhhYnqiZQaHmWXarU0vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB9AC116B1
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 12:43:31 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 0/2] media: cec: add new CEC_MSG_FL_REPLY_VENDOR_ID flag
Date: Thu, 25 Jul 2024 14:40:37 +0200
Message-ID: <cover.1721911239.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Often <Vendor Command With ID> messages start with a vendor-specific
opcode, and expect a reply with the same Vendor ID, but a different
opcode. It is very convenient if the same CEC core framework support
for waiting for replies to regular CEC messages could be used for this
as well.

Add support for this by creating the CEC_MSG_FL_REPLY_VENDOR_ID flag
and the CEC_CAP_REPLY_VENDOR_ID capability.

Also add support for <Vendor Command With ID> to the vivid driver
to allow this feature to be tested by cec-compliance in combination
with vivid.

A separate patch series will be posted for v4l-utils.

Regards,

	Hans

Changes since v1:
- The abort check in cec_received_msg_ts was accidentally
  changed to check against data->match_reply[0]. That's
  the reply, and not the opcode that was aborted.
  Revert that change, and now cec-compliance passes again.

Hans Verkuil (2):
  media: cec: core: add new CEC_MSG_FL_REPLY_VENDOR_ID flag
  media: vivid: add <Vendor Command With ID> support

 .../media/cec/cec-ioc-adap-g-caps.rst         |  6 +++
 .../media/cec/cec-ioc-receive.rst             | 15 ++++++
 drivers/media/cec/core/cec-adap.c             | 52 +++++++++++++------
 drivers/media/cec/core/cec-core.c             |  2 +-
 drivers/media/test-drivers/vivid/vivid-cec.c  | 48 +++++++++++++++--
 include/media/cec.h                           |  2 +
 include/uapi/linux/cec.h                      |  3 ++
 7 files changed, 109 insertions(+), 19 deletions(-)

-- 
2.43.0


