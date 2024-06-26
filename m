Return-Path: <linux-media+bounces-14169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE8917F2F
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 13:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F305F1F21C33
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E626A149C52;
	Wed, 26 Jun 2024 11:07:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D391662E5
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719400070; cv=none; b=HlVjrDa7Mb6u80Kg+nW/YC7kmVA19h2GyimZQ7LE6svuv4YxN7LojbryBng2jVtz9BanV51yDVtVfPe/T4CPqfFkrnrTrNgbf944CTwMiCCFh+JFnztgGsHSC5LdZuz6+fPwD8AxeN62bRrugVjEx9tFU6uZ9ncvuC7Dqo9Gzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719400070; c=relaxed/simple;
	bh=tC/cdr3ADI9yqVofnpSWCRTvaP3Y/pH0DNxwEg0nPHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdKJXt8pAJx+Xm6O7ANazLV18TovfesVr6bG3aVDspJq61XK2UB8/lGVEqxu2yJDPhkmoNLkULtk9vIRRze8rkejvqAxgOptobueTxyfoFJPLO0H23MPev50GlElaQS6amXwkO13TVa+Gd3BNPHJnKOWINYk02dMCEXGM3oSLf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651A6C2BD10;
	Wed, 26 Jun 2024 11:07:49 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/2] media: vivid: sizeimage/CREATE_BUFS fixes
Date: Wed, 26 Jun 2024 13:06:15 +0200
Message-ID: <cover.1719399977.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After improving the CREATE_BUFS tests in v4l2-compliance I
discovered several bugs in the vivid driver, primarily related
to the multiplanar formats and the queue_setup callback.

This series fixes those bugs in order to make the regression tests
pass once the v4l2-compliance fixes are committed.

Regards,

	Hans

Hans Verkuil (2):
  media: vivid: fix wrong sizeimage value for mplane
  media: vivid: fix CREATE_BUFS support in queue_setup()

 drivers/media/test-drivers/vivid/vivid-sdr-cap.c |  7 ++++++-
 .../media/test-drivers/vivid/vivid-touch-cap.c   |  6 +++---
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c |  2 ++
 drivers/media/test-drivers/vivid/vivid-vbi-out.c |  2 ++
 drivers/media/test-drivers/vivid/vivid-vid-cap.c |  5 +++--
 drivers/media/test-drivers/vivid/vivid-vid-out.c | 16 +++++++++-------
 6 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.43.0


