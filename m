Return-Path: <linux-media+bounces-15336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3372193C114
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 13:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6224E1C213C2
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 11:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F652198A09;
	Thu, 25 Jul 2024 11:46:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB13C3C
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721907995; cv=none; b=Jmyqqh3XirdpFs5iFtNPw6OqJl/LnrSyWJfHvZ40PsksHQI1qtZ1bmdLcxo8Kq6mGVRUzvK8TggdcZ7I+oz7MeYK+axTau2SFt2Qcny5YzDTU/lSOxxEtLMYhddlnMndTBj1QKjXBbx6in5PHYeMoOwUvVBXao0xCDEzxHOeHJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721907995; c=relaxed/simple;
	bh=NsXDrZMcx3OwdPoij8XacA0qo+sqX3rpP9hKtkal8Z8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=EvRICnh52/M2KGhs3vmN6C/fxvqkyzSu2Fj7nhoAjOqZVD4t+hU43Yzci31nCWdmXwM0+1fNDkvE4mUFdr6SuXQwbzr+Q/tD+FJowlpHlenbBHt2im+YaDERwEGPKEQ5zc40CxOWwDxEbhnoaiN1IJjK8U4a/J14CAVVkGv9LqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F8DC116B1
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 11:46:34 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: cec: add new CEC_MSG_FL_REPLY_VENDOR_ID flag
Date: Thu, 25 Jul 2024 13:41:53 +0200
Message-ID: <cover.1721907715.git.hverkuil-cisco@xs4all.nl>
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

Hans Verkuil (2):
  media: cec: core: add new CEC_MSG_FL_REPLY_VENDOR_ID flag
  media: vivid: add <Vendor Command With ID> support

 .../media/cec/cec-ioc-adap-g-caps.rst         |  6 +++
 .../media/cec/cec-ioc-receive.rst             | 15 ++++++
 drivers/media/cec/core/cec-adap.c             | 54 +++++++++++++------
 drivers/media/cec/core/cec-core.c             |  2 +-
 drivers/media/test-drivers/vivid/vivid-cec.c  | 48 +++++++++++++++--
 include/media/cec.h                           |  2 +
 include/uapi/linux/cec.h                      |  3 ++
 7 files changed, 110 insertions(+), 20 deletions(-)

-- 
2.43.0


