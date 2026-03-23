Return-Path: <linux-media+bounces-56675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMcQEPoLwWmtPwQAu9opvQ
	(envelope-from <linux-media+bounces-56675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:46:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A380A2EF4A8
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 879A03037F15
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51FC387355;
	Mon, 23 Mar 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pafMiQWk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7577387361
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259051; cv=none; b=PjhW0Y3ndgpNDL1OCRMd20my3FpWBngF0XDxoShFaXoKJQh+NZR6YWRPqFnaNW7fZ9AQP3j4a8XOagM1HYVqds5dOCQkBPX10EH6oqNgkJ0S+pSTcCbLIiXo+HZHbBl1QrHzB4OKIrbZzCbqSX0lalNiX2v4d6/D9lKE4lWTUNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259051; c=relaxed/simple;
	bh=vnOxJagUTglJhgXlpp5kFHMwPJQ+MgucyGevDA2Ba2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/E9GUDO6lIKLA5vaxFezOzcl2ua7SzUTUS1vvUG2YuZ3tTbN1ETEfyqYMRRg1BbmJlR1rz9vtRC5SykKQBFR51nZ+Ad5gbeJRwiuCF57vDznKeic+ZAeD2fzRwF4ijF6+Hu1hozozZlm5MYCopgeEsP+9r6tbBYrfbOHdf0aHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pafMiQWk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6EFC19DF;
	Mon, 23 Mar 2026 10:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774258970;
	bh=vnOxJagUTglJhgXlpp5kFHMwPJQ+MgucyGevDA2Ba2k=;
	h=Date:From:To:Cc:Subject:From;
	b=pafMiQWkacj0ElQccCd51cS+dlJrYtda+QoVSAs5WrL3U5NUMXg2XmSvF46OQAb2k
	 wk51GlQC3ul+2SZoHpsw7mrkQHKR+kzV04k1HcjDIhOuj3NBjHOHs90XrbZEd2EwrA
	 8iGk1XQwEmjKGRDNgnEkvaykWy9/glNXhU00QSZc=
Date: Mon, 23 Mar 2026 10:44:03 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, Daniel Scally <dan.scally@ideasonboard.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [GIT PULL for v7.1 v2] Mali C55 and Renesas IVC fixes/updates
Message-ID: <acEK6Wyn7ezcOHyN@zed>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56675-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: A380A2EF4A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,
   this is v2 of the Mali/IVC PR for v7.1 this time with all the patches that
has been sent to the mailing list.

The following changes since commit d974a67033f4c4bd8cf6864a6b30c5f997c6841e:

  staging: media: tegra-video: tegra20: adjust luma buffer stride (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/mali-ivc-updates-for-v7.1-v2

for you to fetch changes up to f896475e0546dc599821bad76256f343131b12aa:

  media: rzv2h-ivc: Replace workqueue with direct function call (2026-03-23 09:58:15 +0100)

----------------------------------------------------------------
Mali C55 and Renesas IVC fixes for v7.1

----------------------------------------------------------------
Barnabás Pőcze (4):
      media: rzv2h-ivc: Fix AXIRX_VBLANK register write
      media: rzv2h-ivc: Write AXIRX_PIXFMT once
      media: rzv2h-ivc: Fix FM_STOP register write
      media: rzv2h-ivc: Fix concurrent buffer list access

Daniel Scally (2):
      media: mali-c55: Fix Iridix bypass macros
      media: rzv2h-ivc: Revise default VBLANK formula

Jacopo Mondi (7):
      media: mali-c55: Fix wrong comment of ISP block types
      media: mali-c55: Initialize the ISP in enable_streams()
      media: mali-c55: Fully reset the ISP configuration
      media: mali-c55: Bypass the Iridix Tonemap engine
      media: mali-c55: Bypass Purple Fringe Correction
      media: rzv2h-ivc: Avoid double job scheduling
      media: rzv2h-ivc: Replace workqueue with direct function call

 .../media/platform/arm/mali-c55/mali-c55-common.h  |   2 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    |  35 ------
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  37 +-----
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 134 ++++++++++++++++++++-
 .../platform/arm/mali-c55/mali-c55-registers.h     |   4 +-
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     |   2 +-
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   |  63 +++++-----
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   |  13 +-
 8 files changed, 179 insertions(+), 111 deletions(-)


