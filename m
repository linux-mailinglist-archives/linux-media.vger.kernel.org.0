Return-Path: <linux-media+bounces-63024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB+hKHtrGWrGwQgAu9opvQ
	(envelope-from <linux-media+bounces-63024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 12:33:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0018C600E1F
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 12:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE5443128C53
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 10:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499C13C1985;
	Fri, 29 May 2026 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rv7j/+Af"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C6255F2D
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050599; cv=none; b=a1sEfcJotD/JbN3VJnoAb2STJBA3sUP3jOR2OFd2G4X5QPqRfth03OuFPTD14FEsuTCcnuwGstC3gppBwOtxcxjxmUATBv0uBMkOlJ2pGrpWV6pHM9z3q3ufze1/gIL/ukS/DYHTxD1ikMpKMyQasENSTNTLX4DFeSvPVdVmd7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050599; c=relaxed/simple;
	bh=A/sv2GjbkdCH0Qv4NuDgZScGCiBxjpcL2hQbeliVOR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUF935IcIVb1wQ1ddbQQtz5nwIhjNU/B0cm0odahdE11EM5bc1IzVpGnmaLNCMckOFuvufhVpmMIIjlwXFQwDUBZYkHssIVVuyJpsfgItsJhQIJU7dY4Nazl0lNUYduzHkZddIuYqko4lLgdzz2aqvLgJIWL5ggWW3TLXquxDzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rv7j/+Af; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (184.31.0.109.rev.sfr.net [109.0.31.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 012F0741;
	Fri, 29 May 2026 12:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780050576;
	bh=A/sv2GjbkdCH0Qv4NuDgZScGCiBxjpcL2hQbeliVOR0=;
	h=Date:From:To:Cc:Subject:From;
	b=Rv7j/+AfgWrDycX2TqkZ0aKUm4VDHoseDbBCF2xj2+sHQRGwqpga+GuLlJMXEzU66
	 rSny8OuiNEXKVu6vEfJ+XJn4UXNpsDQsiV2Dk/AWCf8NPkDzfUdmJipEiEaN94/1/v
	 Wzpj2aKc5i9Vc9/E38f/SwfnYyGBh/hJhUGkUXFQ=
Date: Fri, 29 May 2026 12:29:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v7.1] Regression fixes for Renesas VSP1 driver
Message-ID: <20260529102955.GA675012@killaraus.ideasonboard.com>
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
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63024-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 0018C600E1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

The following changes since commit 646ebdd3105809d84ed04aa9e92e47e89cc44502:

  media: rc: ttusbir: fix inverted error logic (2026-05-04 08:33:39 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/fixes-media-renesas-20260529

for you to fetch changes up to 54a0060cd17842ccd3054b37c8b8595c8b47fe9e:

  Revert "media: renesas: vsp1: brx: Fix format propagation" (2026-05-29 11:35:17 +0200)

----------------------------------------------------------------
Fix VSP1 BRx format propagation regression that broke R-Car DU

----------------------------------------------------------------
Laurent Pinchart (2):
      Revert "media: renesas: vsp1: Initialize format on all pads"
      Revert "media: renesas: vsp1: brx: Fix format propagation"

 drivers/media/platform/renesas/vsp1/vsp1_brx.c    | 10 ++--------
 drivers/media/platform/renesas/vsp1/vsp1_entity.c |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)

-- 
Regards,

Laurent Pinchart

