Return-Path: <linux-media+bounces-60690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGsbF7PK+2lsEwAAu9opvQ
	(envelope-from <linux-media+bounces-60690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 01:11:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC284E1765
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 01:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E302300B18E
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 23:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64F73537EB;
	Wed,  6 May 2026 23:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vh85dBQo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DB1362156
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 23:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778109099; cv=none; b=fz+VAV+0uzVuA9zPor9s4fi7Bea1JPEG/SD3k0iJEKZ2L2v7YAHcfx2z3c4aH9TU3sdusl3A6dznI7YUtf7ZTCvkUbJAlumRB5KuN5b9QWHg4adlaDATP/96FEJbI4SLStPf1SjCiao2HHi+H+5Aa/1Y3ccTptOUfqYgj72PRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778109099; c=relaxed/simple;
	bh=RizAJKbZmWCC7RocCBL7McUklWUnlBNtzpn1YAGad5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hk2oFdWkjQ2gYKOC/DO7Khf1xohTUiSa84I2aDBEUBjjZMHozCMGzKZXk+Vx/Jp9I+z9rih4t+L+wrekDE1xb0MCIk6eoLuIHDTOPdoRGA2MgWz74IdL068wwpBq5Q2jSTLhBLLBQesb+WHuGdOabIUJ89IekEGQr93CzfjrUdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vh85dBQo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EFB0241;
	Thu,  7 May 2026 01:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778109092;
	bh=RizAJKbZmWCC7RocCBL7McUklWUnlBNtzpn1YAGad5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vh85dBQonmuABvuITp+UCczNn+7dppUcBhScMcCTUd23UElo7azgmvoxGQ5i4K2uX
	 d3oCUGDsgnOqFrtrWtivfsaa++rgNRizJ7T4ymTfNqAHX1ThGYU9EcyVe7c9QFGZpZ
	 0Q3jkfBU0Sihr6YlARuJ0u4GnDndhd+PU3YvU3eU=
Date: Thu, 7 May 2026 02:11:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [v2,0/2] media: renesas: vsp1: Fix display pipeline regression
Message-ID: <20260506231134.GD1778786@killaraus.ideasonboard.com>
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <69fbc7c8.9d0a0220.1bdb77.e857@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69fbc7c8.9d0a0220.1bdb77.e857@mx.google.com>
X-Rspamd-Queue-Id: ECC284E1765
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60690-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 03:59:20PM -0700, Patchwork Integration wrote:
> Dear Laurent Pinchart:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test media-patchstyle:./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch media style
> ERROR: ./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
> ERROR: Commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6 found in the stable tree, but stable@vger.kernel.org not in Cc:
> 
> # Test media-patchstyle:./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch media style
> ERROR: ./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by

I'm not going to add your SoB to my patches :-)

> ERROR: Commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f found in the stable tree, but stable@vger.kernel.org not in Cc:

I don't see these commits in any of the stable branches. Does the
message mean the mainline tree, not the stable tree ?

Given that this series should be merged in v7.1 as a regression fix, why
should it CC stable ?

> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99198847/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

-- 
Regards,

Laurent Pinchart

