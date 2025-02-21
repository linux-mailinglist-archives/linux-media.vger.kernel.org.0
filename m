Return-Path: <linux-media+bounces-26563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2584A3F295
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EEC719C50EC
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215D0207E04;
	Fri, 21 Feb 2025 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="hYqiCWs5"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC12B20102C
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740135415; cv=pass; b=Q+rOOIvxHW+StvWPxqAtOUE4sHmhfFrthgMiDDZvmilhGOOSdIkP2WZE9AuF7vv6MW3ilRNfN/oSZkwUCINvDrq8LYpvNs5hjf925n3X6cuyhbcxgCnq08ZxrpPMqztQovf4KqcD6uUt7WOmbbQGlX5P4gIjv7uAq9GEh8I+QyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740135415; c=relaxed/simple;
	bh=uFVeh+Ik93By6CTA7X1LcIPwjTMwZccZ7FQc7DuF4U8=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=MJKnmoLD3kjzk1SAaaInjoMDcn7jprPqo2wv9OesYRlD4LiCk+wLi38lrUI42a7KhAWCihCbN3QyAymCv6Cwu60EekeYRlINv4k1Ht8XJncAfQ4AJNPJsu5/bL0lz82DGLUPFCT2i2c3lNJ5SBmde6tFb2absozpTP4bfq315LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=hYqiCWs5; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740135411; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ayQ8OCFBd/4AD1B1cxHbBm/umeHw5awdbQjT87R5rPN5GuHD3QwWfsMPxcdulszEPYfCPOZR76pQY6+nedv7S4Ca3s3GgRpYuDc5/nW8+wWqxnEF+m7gP2jSPF70BnFZfm7bsfNkfChPBSmkMdcziXfD2oZL4hn6EiqMO2popiM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740135411; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=43Tp4oP1t0HJTrkzxfmaxePUcrlXlHu3cU9ftYs49Ro=; 
	b=kgMgXY1sM1X3jhMlvM0kEBTZeDHcQyBCduERYO72W/WDeA1B7opvwEQyZ+2pnRTLJ9JSgYU4Ff/KiKjajoFA5uM1jIsvbFoYTfqyHTXPs9XfqesxQWQ9F9jF9/jkVitlS2QldhAHL5iHzPGi5IAvWtybZQRVOGtUk+G78BsGjDI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740135411;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=43Tp4oP1t0HJTrkzxfmaxePUcrlXlHu3cU9ftYs49Ro=;
	b=hYqiCWs5YxVfIGQR8AbrydsWendE8FSgHY2rL1NOgfFaDDJFMMK1Id8S2UPkH2aX
	VEXZJonUEd4rr9Lt6EO9UUSCXgTzNKsdrnSxzWHF5+cvl/wVB1Aja3uyHIlEq7fBRHO
	JMZ93WCm7UK5sgfcdH/kFpnVmNI9Pi2yzxmIVO0w=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1740135409638616.7327544910326; Fri, 21 Feb 2025 02:56:49 -0800 (PST)
Date: Fri, 21 Feb 2025 11:56:49 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "linux-media" <linux-media@vger.kernel.org>
Message-ID: <195282727cc.b364c0d9814541.7545431242452457251@collabora.com>
Subject: [GIT PULL FOR 6.15] Versilicon changes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello Hans & Mauro,

Two small changes, a critical fix and a typo fix.

Please pull.
---
The following changes since commit 70d4fd1200ca6cdd670c51ec3f1895b5a262261c:

  media: tuners: Constify struct tunertype, tuner_range and tuner_params (2025-02-21 10:33:15 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/sebastianfricke.git tags/for-6.15-versilicon-hantro-changes

for you to fetch changes up to 635fc8ea9998366854acd511a6ac24da68705824:

  media: verisilicon: VP9: Fix typo (2025-02-21 11:53:17 +0100)

----------------------------------------------------------------
One critical fix and a small typo fix

----------------------------------------------------------------
Benjamin Gaignard (2):
      media: verisilicon: HEVC: Initialize start_bit field
      media: verisilicon: VP9: Fix typo

 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 1 +
 drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c  | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

Regards,
Sebastian Fricke 






