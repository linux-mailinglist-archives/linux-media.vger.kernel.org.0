Return-Path: <linux-media+bounces-60031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAQXDKWN8mnKsQEAu9opvQ
	(envelope-from <linux-media+bounces-60031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 01:00:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B5D49B36E
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 01:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F392F301F32D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 23:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C8E2F99B8;
	Wed, 29 Apr 2026 23:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IZzRe5mL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C86C7478;
	Wed, 29 Apr 2026 23:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777503645; cv=none; b=krn7iT7M9s720XK92ZbKfXRWWCQEMxb2V3uirXOGYNKYm7m+kr5uXN75AOnRt+E/OYhnSOyf82gWC9e+7aFHvIL+4/zZX9bansnUxvNG3zVaF7nzatGd0MLBeLTGHqOZYiieZJ13L1ThcZfDysUqBT+77opw9OAA3C7ia8W01bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777503645; c=relaxed/simple;
	bh=Kn0iDoQ79AShUn/Bi3HbD2ivdrt9AMiXPcpYk7swLII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpdBLUwLIz82zjrKzOmS+psDI4nOyBcOcN99X88Q6veOSDcuOGHU74iwL/Pq26WmiRVLUjdgj2UXY5YN0GHd3A1Un16jXaMb6vp7vF3pwJwthaLCbm2o3XbvEOYFuOh9mjVMF2KUuFuRcSASOkQvl3/h6IiFh0akJu9/m2ox5b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IZzRe5mL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FE4C2EE;
	Thu, 30 Apr 2026 00:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777503536;
	bh=Kn0iDoQ79AShUn/Bi3HbD2ivdrt9AMiXPcpYk7swLII=;
	h=Date:From:To:Cc:Subject:From;
	b=IZzRe5mL9kdApKOwHwaiTRo27hjxp6a+iD9YKr4knDLioccT2HrpqOT8/DZI2yz7o
	 4mgziKyeTpAgTmoqK94y/I+q6RL4NusOVWYilnblQOR6hlXRZl4xgFEV1el7v3Kkni
	 WI19v9mzXtf8tlaYxQJOWCy0XgWTHvJHWaGH69S8=
Date: Thu, 30 Apr 2026 02:00:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [GIT PULL FOR v7.2] FCP and VSP1 DT bindings for RZ/G3E and RZ/G3L
Message-ID: <20260429230038.GA213730@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Rspamd-Queue-Id: C5B5D49B36E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60031-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url,ideasonboard.com:dkim]

Hi Hans, Mauro,

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20260430

for you to fetch changes up to af6c6bcd52b970f591fb8cdde97d95662ea8cca8:

  media: dt-bindings: media: renesas,vsp1: Document RZ/G3E (2026-04-30 01:50:09 +0300)

----------------------------------------------------------------
FCP and VSP1 DT bindings for RZ/G3E and RZ/G3L

----------------------------------------------------------------
Biju Das (2):
      media: dt-bindings: media: renesas,fcp: Document RZ/G3L FCPVD IP
      media: dt-bindings: media: renesas,vsp1: Document RZ/G3L VSPD

Tommaso Merciai (2):
      media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
      media: dt-bindings: media: renesas,vsp1: Document RZ/G3E

 Documentation/devicetree/bindings/media/renesas,fcp.yaml  | 4 ++++
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 2 ++
 2 files changed, 6 insertions(+)

-- 
Regards,

Laurent Pinchart

