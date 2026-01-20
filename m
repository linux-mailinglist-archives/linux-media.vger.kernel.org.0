Return-Path: <linux-media+bounces-51126-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIPhFgZCcGnXXAAAu9opvQ
	(envelope-from <linux-media+bounces-51126-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 04:03:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82E50337
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 04:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 275647032BD
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 13:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275AD428494;
	Tue, 20 Jan 2026 13:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fupmtsmm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E8E425CE9
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915415; cv=none; b=PtZyXM0SIsYd45A67Q72NUIE2sbo4u1TjIvz0y7/jvZQiSZKtf3DzAyoorEflCLy1+2VmMmzV4y2qv/Lt8BGKvErtB+DC4OTZAY1BoB7I8w0qOPKBRwgf+kdFujlXfxMpus5sF2V5SQZDrxjHb3Z1z3e8iihecnl4M83W67blY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915415; c=relaxed/simple;
	bh=dniG3HZgx9/bXQbDKmnpWfRvvD6BYMyLlOZ19YVT2kU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XLh3wTmjwivPNF1xJRnnOrM/pmmoX5vnwlh4zPi9WtwVm+4vWDvx0VRhf5uKgPgRBuci2Hh8yMDAsidbhHd90sGFN8HT7pjYZbV/S7WifXU2y+MgebjHESksPa5/q7RJBm7ppy/eR3ry2tDntdTCiSbU+pn9CWNcc4UjN6oyEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fupmtsmm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32938C16AAE;
	Tue, 20 Jan 2026 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768915415;
	bh=dniG3HZgx9/bXQbDKmnpWfRvvD6BYMyLlOZ19YVT2kU=;
	h=From:To:Cc:Subject:Date:From;
	b=Fupmtsmm0YtUJX/zmor0i2QQrdWtAzjPZS9UvaVCsziSeLss1Y0YlZkE/+YhY98oJ
	 XeiKMX761KVeDiE2x03iMrBbkAPCjNBE4/QvW+aBV5LvQv7jkM8zi+Gw+LeXuy2H9t
	 pg1WUIKeeW/K+nKmfdchLZsOGJuU3Q9qSCKgFEXCvXNgeg8fBHf5udcgAbRFLEMC5T
	 t6DdjryobyhAPfQWdBxs+9F7pXFAHVh5Kj92KewMf9MXfyFE6z6w45+bHXCcK+LKFs
	 LsWDedielzZCTL/tLMytdYbORCWhOagTer7N3L6ZwrSxPcjoLBe4fU63i6dqfNYYvb
	 6spMQgaiECfTw==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 6.20] Please pull platform-qcom-iris-6.20-improvements
Date: Tue, 20 Jan 2026 13:23:27 +0000
Message-ID: <20260120132331.6729-1-bod@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-51126-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 0D82E50337
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 4a2207a3736d0dc78ac2f16325189b307964a2cb:

  media: iris: Prevent output buffer queuing before stream-on completes (2026-01-19 09:50:34 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-iris-6.20-improvements

for you to fetch changes up to 665defe587f4112d8f2e44033c312fb2b2c25d74:

  media: iris: Introduce vpu ops for vpu4 with necessary hooks (2026-01-19 10:06:45 +0000)

----------------------------------------------------------------
This tag contains a number of new features and improvments
This tag depends on antecedent tag platform-qcom-iris-6.20-fixes

- Starting of with simple documentation/cocci fix - Ricardo Ribalda
- Next is a debug string change from Vishnu Reddy
- A series to support crop/scale/rotation/flipping from Wangao Wang
- Finally support for VPU4 - Vikash Garodia

----------------------------------------------------------------
Ricardo Ribalda (1):
      media: iris: Document difference in size during allocation

Vikash Garodia (6):
      media: iris: Add support for multiple clock sources
      media: iris: Add support for multiple TZ content protection(CP) configs
      media: iris: Introduce buffer size calculations for vpu4
      media: iris: Move vpu register defines to common header file
      media: iris: Move vpu35 specific api to common to use for vpu4
      media: iris: Introduce vpu ops for vpu4 with necessary hooks

Vishnu Reddy (1):
      media: iris: Change psc properties message to debug level

Wangao Wang (6):
      media: qcom: iris: Improve format alignment for encoder
      media: qcom: iris: Improve crop_offset handling for encoder
      media: qcom: iris: Add scale support for encoder
      media: qcom: iris: Add rotation support for encoder
      media: qcom: iris: Add flip support for encoder
      media: qcom: iris: Add intra refresh support for encoder

 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  95 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   3 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  23 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  65 +++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  19 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   2 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   8 +
 .../platform/qcom/iris/iris_platform_common.h      |  16 +-
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  25 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  96 ++++-
 .../platform/qcom/iris/iris_platform_sc7280.h      |   5 +
 drivers/media/platform/qcom/iris/iris_power.c      |   2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  20 +-
 drivers/media/platform/qcom/iris/iris_resources.c  |  16 +-
 drivers/media/platform/qcom/iris/iris_resources.h  |   1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |   6 +
 drivers/media/platform/qcom/iris/iris_utils.h      |   1 +
 drivers/media/platform/qcom/iris/iris_venc.c       |  33 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 199 +---------
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 369 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 402 +++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  24 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 188 +++++++---
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  61 ++++
 26 files changed, 1362 insertions(+), 323 deletions(-)
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu4x.c

