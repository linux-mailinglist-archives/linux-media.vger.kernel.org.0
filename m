Return-Path: <linux-media+bounces-56191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJpnHY52ummTWwIAu9opvQ
	(envelope-from <linux-media+bounces-56191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:55:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E32532B980C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 764C330774D1
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEF139280E;
	Wed, 18 Mar 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wHN3RzRG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B8E3A8751
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827593; cv=none; b=cNH7qcCXlZHjUMgn7Ab3P7mV4W6K5ybjAm7VeIfuZo5dvO6YbTuARxoXN1hZuOfvcHTtd4Sxuaf6+JixNVbYvHrJ9HvXQQiPIYmKYklgM7RmqCJ1+xN1ff56VrAjA3xvRynx0vnZthaZfMHh7XcM8aEOxIgqxKc/Nks0kTqJukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827593; c=relaxed/simple;
	bh=OjHPwmYyjB8OF1Y1cL882IXTPdxpQ51EMm7AksKnSK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NURs1SAEJRsKfNfEGGP1VFbYjClqOzKX0Lq1vUjPd0Y8QHnq34txDhtYSThWjk3K5hwHxLfhZmhya1veLXAu4XM0+Yefilv9GnsqRuYD1LRBPyxhNOYFYJboHDOIH0mMLNmH5XfIJ+jNnxgdsf70h6brkrXx8uKziLUs6JF65EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wHN3RzRG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-20-180.net.vodafone.it [5.91.20.180])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE4B3460;
	Wed, 18 Mar 2026 10:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773827512;
	bh=OjHPwmYyjB8OF1Y1cL882IXTPdxpQ51EMm7AksKnSK0=;
	h=Date:From:To:Cc:Subject:From;
	b=wHN3RzRGQBbpN2PGFsUZvfbTlC4Y7iAKm/Upe7iM7UlV+OSimL2zb002R2lIOjuOf
	 U240CDUPg0Kkt0ub7DE8L4lhgs8brtIORoldgLU0SSf61NrSIRl7bePYRMMOhXSTDc
	 zGtrQ/pSZyaMtONmJtCEpymN629XsYBkmweYyYXM=
Date: Wed, 18 Mar 2026 10:52:52 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, Daniel Scally <dan.scally@ideasonboard.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [GIT PULL for v7.1] Mali C55 and Renesas IVC fixes/updates
Message-ID: <abp0zwGEJZU4xXag@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56191-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: E32532B980C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit a93a51f42ac354425a252210183c4151d991f75d:

  media: lirc: increase IR_MAX_DURATION to send extended code sequences (2026-03-17 14:43:57 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/mali-ivc-updates-for-v7.1

for you to fetch changes up to f4d0df216d4a904e05c5b1bf664b1ee44305a5d9:

  media: rzv2h-ivc: Replace workqueue with direct function call (2026-03-18 09:12:05 +0100)

----------------------------------------------------------------
Updates and fixes for Mali C55 and Renesas IVC

Updates and small fixes for the Mali C55 ISP and the Renesas IVC
companion chip to properly support capture operations on Renesas
RZ/V2H(P)

CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1626547

Ignore the checkstyle issues as it is caused by an email address mismatch due
to the usage of the +renesas tag.

----------------------------------------------------------------
Barnabás Pőcze (4):
      media: rzv2h-ivc: Fix AXIRX_VBLANK register write
      media: rzv2h-ivc: Write AXIRX_PIXFMT once
      media: rzv2h-ivc: Fix FM_STOP register write
      media: rzv2h-ivc: Fix concurrent buffer list access

Daniel Scally (1):
      media: mali-c55: Fix Iridix bypass macros

Jacopo Mondi (6):
      media: mali-c55: Initialize the ISP in enable_streams()
      media: mali-c55: Fully reset the ISP configuration
      media: mali-c55: Bypass the Iridix Tonemap engine
      media: mali-c55: Bypass Purple Fringe Correction
      media: rzv2h-ivc: Avoid double job scheduling
      media: rzv2h-ivc: Replace workqueue with direct function call

 .../media/platform/arm/mali-c55/mali-c55-common.h  |   2 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    |  35 ------
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  37 +-----
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 128 +++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |   4 +-
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     |   2 +-
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   |  61 +++++-----
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   |  13 ++-
 8 files changed, 175 insertions(+), 107 deletions(-)


