Return-Path: <linux-media+bounces-63129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AUNLBeHiGmqB9ggAu9opvQ
	(envelope-from <linux-media+bounces-63129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 15:15:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C760CEAE
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 15:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8671E300D4ED
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9E63C2B9C;
	Sat, 30 May 2026 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="W4LkjG3E"
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D193C2774
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780146904; cv=none; b=Th9Ek6nv98+wfsUGqDooRLyyIJBDLtth4hSYsl8xsJ8yCpc5I0KDVzipMd4iz6FNSL43D9e2bIj8MQooDKl/t6hkZmvxwbQt2yg9S28rc7gVqSN+JWt2nqF8mSyDyZQBMVsn/bdDiJPGnx8cdw31xIicW7fbkpYJ2hZ0NTF9LIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780146904; c=relaxed/simple;
	bh=GvzBEJRw3/vtPrVwibE6Y+Ejwqi4+H927KJOtKXAk1U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFNbSzS+Br7hTuW9aJGQp9+CZ8S9g3yTTPpNnXUVwoGExgE/ILgf6u82UCLlUbR+7Ka+vfNx7iEuhclfKQh5mMfdyhzwI6HSSxy8FBCMBPncIelP8SXAQWdQGPKwXRInGImSD3vR71cX7JCUmfDZgIX1uq1JFG8H3baj6mRimuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=W4LkjG3E; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1780146536; bh=GvzBEJRw3/vtPrVwibE6Y+Ejwqi4+H927KJOtKXAk1U=;
	h=Date:From:To:Subject:From;
	b=W4LkjG3ECV6tVP/fqG8AH/8VZCuSYIo2vWZtl6xA1h44v+cSIRFqNx+cfF3WHrEvB
	 eeak29tfRKF/4ReucuzTYcWINrhXhQefGR3eQZ8QK1vsabAttiFQVbdEhuLUd9CgSi
	 vLLyT7XUC1mn1/l3PdikBxWA93LhjvWNjugt5pvd/2HyLG7Yks/O1zc4qnU/yw4qMO
	 s1xm774AFkGFW4neHOGDWjZUUxqcDbzhBE62tzUtUr1vAzCwfrb5+AQ3DCbA5Xod9Z
	 o+vZhpRVCx0JFFGhz18hj+nBkxwmB5BMJmVQHy/QlkFCrYP1O7jvLg182k+XGW9GYa
	 oiEPfnEaFEB8A==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id E7F36409EC; Sat, 30 May 2026 14:08:56 +0100 (BST)
Date: Sat, 30 May 2026 14:08:56 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v7.1] Regression fix for igorplugusb
Message-ID: <ahrhaFOTPrcXYooY@extorris.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63129-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mess.org:+];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mess.org:dkim,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: F37C760CEAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

This fixes a regression in the igorplugusb driver.

Thanks,
Sean

The following changes since commit f78073e84c800ae146ce62447e7a685a5ceeb92d:

  Revert "media: renesas: vsp1: brx: Fix format propagation" (2026-05-29 13:32:05 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/seanyoung tags/v7.2c

for you to fetch changes up to 5e45e0291d1b599a3c5b34ffa75a79f9ff68ab8b:

  media: rc: igorplugusb: fix control request setup packet (2026-05-30 14:02:44 +0100)

----------------------------------------------------------------
v7.2c

----------------------------------------------------------------
Henri A (1):
      media: rc: igorplugusb: fix control request setup packet

 drivers/media/rc/igorplugusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

