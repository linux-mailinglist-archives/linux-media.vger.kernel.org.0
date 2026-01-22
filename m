Return-Path: <linux-media+bounces-51313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDc+DGqZcWngJgAAu9opvQ
	(envelope-from <linux-media+bounces-51313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 04:28:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C299B6155F
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 04:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8828A4E1844
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 03:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853E13B95E6;
	Thu, 22 Jan 2026 03:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LXvhqBAX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDFB32AAA1
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 03:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052305; cv=none; b=nXAHjd46TdDCPeKjK0SaoQSo+TT+mQGtfdIW0g1y4bzybBWbAOTuUnSGggKzL0WaAsuEYEWL98ww2LGVKRAszj+zqMoYiyc5fLlWTWBYF3duHGmOvPIDE2CwcQLI0Hr3Lvm2PCbvyNSyOjxj7EZWJ89KakIsEEqyao3MQJr1ECI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052305; c=relaxed/simple;
	bh=2KxPpmLUSEvAz1IAa0NXPHc13znn8+LLv97mEoYxw5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iId9T8LgjDo6b2alF4Xcs8Ir0QxQpy12YbZoIvC15tgCNMnzoZXycdw7hmTH4SjIbchypq7+rOI6TdYRd4Lfhz3bBaXOEcn4yDN62jAVciV5vK5yz4itViBpbOSVGxvBehoRVFQVfRl5dxiUTnEeabSReLpZ514DXP2YMyiWZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LXvhqBAX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8516E2DD;
	Thu, 22 Jan 2026 04:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769052268;
	bh=2KxPpmLUSEvAz1IAa0NXPHc13znn8+LLv97mEoYxw5g=;
	h=Date:From:To:Cc:Subject:From;
	b=LXvhqBAXv/b0HLxpAmO0M6PqZOnJ3eHUhRfH0yWD43wLFZ0yhoawThrX8Cy/YaNpc
	 SiLKZhva4+jAps4Ib2kKUij5ybX4bntM8Biq4ILaJboeWyGHOrd+q1RCj8sXVcTjHT
	 MTw/xa4mJdlgU0WZ7OcpjTD4iDyOIU3aMP6NETHE=
Date: Thu, 22 Jan 2026 05:24:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [GIT PULL FOR v6.20] uvcvideo driver fixes
Message-ID: <20260122032459.GA215800@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51313-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,chromium.org,kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: C299B6155F
X-Rspamd-Action: no action

Hi Hans, Mauro,

Sorry for the late pull request, this should be my last one for v6.20.

The following changes since commit e3b5b77e36894b4d61374ecb916355809c6e4aa4:

  media: rkvdec: Add HEVC support for the VDPU383 variant (2026-01-21 14:43:10 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20260121

for you to fetch changes up to 81611a213bdf88d654835acf42d6c541ac35a8f2:

  media: uvcvideo: Pass allocation size directly to uvc_alloc_urb_buffer (2026-01-22 04:08:38 +0200)

----------------------------------------------------------------
uvcvideo driver fixes:

- Fix support for devices with unit and terminal ID collisions
- Return queued buffers on stream start failure
- Fix URB allocation for small buffers

----------------------------------------------------------------
Michal Pecio (1):
      media: uvcvideo: Return queued buffers on start_streaming() failure

Ricardo Ribalda (3):
      media: uvcvideo: Create an ID namespace for streaming output terminals
      media: uvcvideo: Fix allocation for small frame sizes
      media: uvcvideo: Pass allocation size directly to uvc_alloc_urb_buffer

 drivers/media/usb/uvc/uvc_driver.c | 54 +++++++++++++++++++++++---------------
 drivers/media/usb/uvc/uvc_queue.c  | 12 +++++----
 drivers/media/usb/uvc/uvc_video.c  | 15 ++++++-----
 drivers/media/usb/uvc/uvcvideo.h   |  3 ++-
 4 files changed, 51 insertions(+), 33 deletions(-)

-- 
Regards,

Laurent Pinchart

