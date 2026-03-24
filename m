Return-Path: <linux-media+bounces-56869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHuVNSp/wmnqdAQAu9opvQ
	(envelope-from <linux-media+bounces-56869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:10:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC34307F0E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89415304BDFA
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD3C3F54B9;
	Tue, 24 Mar 2026 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WxFG4wrf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474FC3F0A9A
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354143; cv=none; b=Dk1ORsTBJkOgPj+pkA/oNOo9R0M7/RjxUXUuDJ+nLqmY2Ps1c2IDjJL6iYmD7ZfXibIqrkpCEaZYcJYvqO4RQ+83OoCSkOyXFH886zJn7Bj02S9QCYgAYMpjscMBQ0bLwdlb6skkPf4OMdEQ5YIocWRvHQfcUVmLp5YhUo4lHQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354143; c=relaxed/simple;
	bh=sq33+YgCPqmEgWSzdWvvek8ZSS7lCrmVWB6qcVZLYsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WrHcWcW155mbfJOweYvNv+kn9F3y5iJzY+Ijtn259ZxOtQale1EqWnpWV96Pybdsh7MfzAWTfT3CfzbSB31JchsVByA08dl5e5RPZC9DSp60hiqMYf5YtVvknsuPJ85NiHyT3kaY03IzJqCWZItriq3fKfflDs21QAy0wG8a0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WxFG4wrf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6BF5B225;
	Tue, 24 Mar 2026 13:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774354059;
	bh=sq33+YgCPqmEgWSzdWvvek8ZSS7lCrmVWB6qcVZLYsU=;
	h=Date:From:To:Cc:Subject:From;
	b=WxFG4wrfAvQOp6ACdUqKhqe6rLHBBDONeNAsMSHg3Zd4WZA0fourpEhH9710IzKFp
	 VZfoC6e5WSelJdOFVX3V72zl6nvwLBLx8WT9XYxaOIMR8cKimx2DfdXebqjY6BWqtn
	 4iVFRfwPrcvawEXGpJZ7p8FHdAKP+24LjICFa7gI=
Date: Tue, 24 Mar 2026 14:08:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [GIT PULL FOR v7.0] media: uvcvideo fix
Message-ID: <20260324120855.GA2401834@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56869-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 7BC34307F0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

The following changes since commit e8d97c270cb46a2a88739019d0f8547adc7d97da:

  media: verisilicon: Fix kernel panic due to __initconst misuse (2026-03-18 13:17:25 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/fixes-media-uvc-20260324

for you to fetch changes up to 5cfbea8eab5bb816df283f898f0b95e789f84753:

  media: uvcvideo: Fix bug in error path of uvc_alloc_urb_buffers (2026-03-24 00:45:21 +0200)

----------------------------------------------------------------
uvcvideo: Fix bug in buffer allocation error path

----------------------------------------------------------------
Ricardo Ribalda (1):
      media: uvcvideo: Fix bug in error path of uvc_alloc_urb_buffers

 drivers/media/usb/uvc/uvc_video.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
Regards,

Laurent Pinchart

