Return-Path: <linux-media+bounces-38703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC77B17637
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 20:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B8CD7B12AD
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 18:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D105024729A;
	Thu, 31 Jul 2025 18:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pv/st1ZG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACB81C5F06
	for <linux-media@vger.kernel.org>; Thu, 31 Jul 2025 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753987770; cv=none; b=qaTr3xaUaZMvrSxyWiq40SAxqt5M8NsfvTRsCOkHYW5rhM0Ylaf+fu9kZwg1GyI5nd2pzq8PRR3rTYUq/8v/QJV2nXz9Bq6ZZi8wqScH5DHKnoG4xBfjJSnThBzs5lGa1S2AIg4kPyDVhnrdCBodXV1R67dUYFZ08FbtFr7gmV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753987770; c=relaxed/simple;
	bh=WpeONNYp+mL7LtNVMo8I+sDSQBdNvee0u5rEhfqc2Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2s2JX9F1v+UTj2KE+zsKL5uPIHNPo4dM26CaMNhi0xtGdkN4zwcDX1/kWVOg4yjKPBUcs7bbUrGLefBN9uEtMokMvXQx75EgCceIoDvU6cz2rDEUJCyVPP62hrzWcJK2aLZGEHtTy+zKyLkrb20VCXRaj8rs/6fn+cF1VOm5lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pv/st1ZG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 75F3C778;
	Thu, 31 Jul 2025 20:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753987716;
	bh=WpeONNYp+mL7LtNVMo8I+sDSQBdNvee0u5rEhfqc2Ng=;
	h=From:To:Cc:Subject:Date:From;
	b=pv/st1ZGf2LRApHWPpVS9Bw6yujOrisYDJDqNX8tjf5l0e45hauzy3LZAy9z6gyGC
	 quiJhdirjA4UXhKnDRcMX1+T7Dckva0nsSDjT0MT4vf99gEVzzg4twQRMFxcyOj00w
	 +WeJM3tUq2LOwdJ4/K5ddU/3JCuHn84Dnfv6ctY0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: [PATCH 0/2] media: amphion: Delete v4l2_fh when closing the file handle
Date: Thu, 31 Jul 2025 21:49:09 +0300
Message-ID: <20250731184911.4323-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series prepares for a larger rework of the v4l2_fh
infrastructure that Jacopo is working on. The rework will require having
access to a struct file pointer when calling v4l2_fh_del(), which is not
currently possible in the amphion driver.

Patch 1/2 is a small drive-by cleanup. Patch 2/2 then moves the call to
v4l2_fh_del() (as well as v4l2_fh_exit()) from the vpu_v4l2_release()
function to vpu_v4l2_close(). The rationale, and why I believe this is
safe, is explained in the commit message of the patch.

The series is compile-tested only. I would appreciate if someone could
test (and review) the patches, especially patch 2/2. If a different
approach is needed we will need to know sooner than latter as it will
affect Jacopo's work.

Laurent Pinchart (2):
  media: amphion: Make some vpu_v4l2 functions static
  media: amphion: Delete v4l2_fh synchronously in .release()

 drivers/media/platform/amphion/vpu_v4l2.c | 19 ++++++++++++++-----
 drivers/media/platform/amphion/vpu_v4l2.h |  8 --------
 2 files changed, 14 insertions(+), 13 deletions(-)


base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
-- 
Regards,

Laurent Pinchart


