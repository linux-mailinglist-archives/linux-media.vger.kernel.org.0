Return-Path: <linux-media+bounces-61646-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLIBG1XwBmrOowIAu9opvQ
	(envelope-from <linux-media+bounces-61646-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:07:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0187854D06B
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B67D03035B38
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 09:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4F243E9D6;
	Fri, 15 May 2026 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nNthWIfH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6796B43DA33
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838804; cv=none; b=tNxaDyanLBwzPRzsJed04ssgaB5k7RPR8AWIDEpQq+RqGqYmXS7oKfvrLrECQb8icTO+r3qzrZNGDmbDfYBpOwteF+tYnLVD/Pk7jKa5agXcvNd2PqxjM/rXaTOAdA50vUx/uM2bmoOu0d606YwL0jCuGCMqYrX9riuUfpXh4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838804; c=relaxed/simple;
	bh=S06a9puuG1cNW+yvSWjSUkTLH+7TpM6XqdcrsoWOrP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IeXuQvXRTIudcN/yMdK8jt6N5LJ3N6JD7Im0PdaYSWD81hh2rb2JTWY5/9YG2Z9u4ZMT2/mDembXbf2t3WxjDaPR/fCaulvgcYhr4ii3MiN9JxEE0Y0LUcLw+obHhq9aUn1rpbRcxhxH9OXWxlqRbRbdwgoXUrDB5N+gveiXIpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nNthWIfH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15282454;
	Fri, 15 May 2026 11:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778838791;
	bh=S06a9puuG1cNW+yvSWjSUkTLH+7TpM6XqdcrsoWOrP8=;
	h=Date:From:To:Cc:Subject:From;
	b=nNthWIfHy58lrLNV6hxALPuLF9Y8to6mC358Mj+dwuPipVTeymWASRIdrfqzK04Y3
	 o9c52rQxzWezmpHWAyrLPWokaMN9m8/oNedX8uA+9SV3NB+nZcKYVpZXDvXhYbeYrh
	 2pRbG/nVs/Mz4tdb82VLNhnQBhDSOPDBMFPe1BUs=
Date: Fri, 15 May 2026 11:53:17 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [GIT PULL for v7.2] Renesas RZ/V2H(P) media updates
Message-ID: <agbsLnO-T7xQLaJ4@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Rspamd-Queue-Id: 0187854D06B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61646-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Hans, Mauro,

The following changes since commit 10f943b12e7cb338da00f10e129043ae27b33af4:

  media: rzg2l-cru: Add MAINTAINERS entry (2026-05-12 09:39:03 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/mali-ivc-cru-for-v7.2

for you to fetch changes up to d744abbe39d17e49d1e8bb50e0fb2d3b1370c349:

  media: mali-c55: Disable pm_runtime on probe error (2026-05-15 11:20:21 +0200)

----------------------------------------------------------------
IVC, CRU and Mali-C55 updates for v7.2

Collect patches for the CRU, IVC and Mali C55 camera subsystem for
Renesas RZ/V2H(P) SoC for Linux v7.2

CI pipeline at
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1667961

Please ignore the "Missing committer signoff" errors reported from checkpatch:
https://gitlab.freedesktop.org/linux-media/media-ci/-/work_items/126

----------------------------------------------------------------
Alper Ak (1):
      media: mali-c55: Fix possible ERR_PTR in enable_streams

Chen Ni (2):
      media: mali-c55: Remove unneeded semicolon
      media: mali-c55: core: Remove redundant dev_err()

Daniel Scally (1):
      media: rzg2l-cru: Rework rzg2l_cru_fill_hw_slot()

David Carlier (3):
      media: mali-c55: Add missing of_reserved_mem_device_release()
      media: mali-c55: Power-off the peripheral in remove()
      media: mali-c55: Disable pm_runtime on probe error

Jacopo Mondi (13):
      media: rzg2l-cru: Modernize locking usage with guards
      media: rzg2l-cru: Use proper guard() in irq handler
      media: rzg2l-cru: Remove locking from start/stop routines
      media: rzg2l-cru: Do not use irqsave when not needed
      media: rzg2l-cru: Remove wrong locking comment
      media: rz2gl-cru: Introduce a spinlock for hw operations
      media: rzg2l-cru: Split hw locking from buffers
      media: rzg2l-cru: Manually track active slot number
      media: rz2gl-cru: Return pending buffers in order
      media: rzg2l-cru: Remove the 'state' variable
      media: rzg2l-cru: Remove debug printouts from irq
      media: rzg2l-cru: Simplify irq return value handling
      media: rzv2h-ivc: Wait for frame end in stop_streaming

Tommaso Merciai (2):
      media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
      media: rzg2l-cru: Use only frame end interrupts

jempty.liang (1):
      media: mali-c55: Initialise dev for tpg/rsz/isp subdevs

 .../media/platform/arm/mali-c55/mali-c55-core.c    |  24 +-
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |   8 +
 .../media/platform/arm/mali-c55/mali-c55-resizer.c |   1 +
 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c |   1 +
 .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |   4 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  29 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 326 ++++++++-------------
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   |  31 +-
 8 files changed, 190 insertions(+), 234 deletions(-)


