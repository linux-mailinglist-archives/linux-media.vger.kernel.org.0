Return-Path: <linux-media+bounces-15340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF4993C12E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 13:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799A9283E09
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 11:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2822C199258;
	Thu, 25 Jul 2024 11:54:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D891741C4
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721908450; cv=none; b=gJdwFLCSg8HHpK1VDWzcPACB3hV+BeQR3L5zxyjpo28AW1sM1bQI1MFi/62iDP9raMpqR3igTUkUqkTypVxcsC1KM4FtRKeUESmvHfJ6tfcZmWh2I2utfV1v1f5Cdbw6AfvCZhF2MQZ4QKbhmY4HqRdqbPL3Tl9ht2KgKinFUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721908450; c=relaxed/simple;
	bh=HbfeVgiXN3zKSXCqnM2bVLTRjfMmbOBcobo0QRfy9OM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JpXHnQ6ZvK/ubH4Q487T7/ir8JFVOGFj6rmP5q2velJH+2/sFMPRwnE0aXnl2TVjbcuWsl5cu0vNQCvVMcEG5offrKkX73lqvv13xNUoLNv8Kl83XKHvunwUzcrR5c8TfuTOr/jXZJ/W9z9Qi4q6GGj+qBcvbJSfJ2fMtRl0q/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93CFC116B1
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 11:54:09 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/2] v4l-utils: add support for CEC_MSG_FL_REPLY_VENDOR_ID
Date: Thu, 25 Jul 2024 13:52:08 +0200
Message-ID: <cover.1721908330.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This relies on the uAPI CEC changes from (1).

It adds support for the new flag to cec-ctl and corresponding
compliance tests to cec-compliance.

Regards,

	Hans

(1): https://lore.kernel.org/linux-media/cover.1721907715.git.hverkuil-cisco@xs4all.nl/T/#m3dbb0e6242db004eb827d17012635be4cf83644f

Hans Verkuil (2):
  cec-ctl: add support for CEC_MSG_FL_REPLY_VENDOR_ID
  cec-compliance: add tests for CEC_MSG_FL_REPLY_VENDOR_ID

 utils/cec-compliance/cec-compliance.cpp   |  2 +
 utils/cec-compliance/cec-compliance.h     |  2 +
 utils/cec-compliance/cec-test-adapter.cpp | 90 ++++++++++++++++++++++-
 utils/cec-ctl/cec-ctl.cpp                 |  9 ++-
 utils/libcecutil/cec-info.cpp             |  2 +
 utils/libcecutil/cec-parse.cpp            |  2 +-
 6 files changed, 103 insertions(+), 4 deletions(-)

-- 
2.43.0


