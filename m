Return-Path: <linux-media+bounces-60053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNGpJCMX82llxAEAu9opvQ
	(envelope-from <linux-media+bounces-60053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:47:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B2749F630
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6825308BF05
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 08:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FA83FE653;
	Thu, 30 Apr 2026 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWYq7h+9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A534A773;
	Thu, 30 Apr 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538522; cv=none; b=JI/umac8Aar2DowA9hURxT9EOSUc1ChoIvshGd4ru8VpwgyK/q4g2GiHFJJo/RQxdZiwMLoTCMq90/+BFoO+jkcD6JtcnGL8Tl87Nvvs8tstZ9rHsYi5u9CGggqi1cYwdxAAkUGOeL2wvH0GEQNVP6HJVGoEg/4R5T1o27LO+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538522; c=relaxed/simple;
	bh=4eFJARbEGhVdWHysJfoWeIBmAK2t7W0gsE9NqtndKSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYCZKsPN0NnD8P15fRZ85dRu706wDWChuHGLISZeC4a7X4UJPXQ0A/aeRjcPEOZ7Zg+b9YCnOERy2hWtyMBf1gf9Ru4L9W2LH7e3uWpi7pqn+lPvSiC4E7T1K8Ieg1dRV5cpIBFBC2s4cq6jGp2urv1rgzPPyhaqmdS6FznuDow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWYq7h+9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3B2C2BCB3;
	Thu, 30 Apr 2026 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538521;
	bh=4eFJARbEGhVdWHysJfoWeIBmAK2t7W0gsE9NqtndKSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWYq7h+9i/Az4xLiL52WqmlAdnc+xtHXeI0r+YxD+hUAsqQ+eI9jEuj7I2jDw8Rj6
	 1hjXdZAyu24jmfs1KM8WI+//i5wLjylnxQKAsOfm3e/OFB73PITMAbakR36rZxN9m+
	 Bif23I5GhYUN67zTk+j0tiHrtgN9ThQ/yttG9sUhoYxqq2K8BlA+Z1P3p6YLgOOfVp
	 aXUoi/TdMaj6KI+4wEcrponlnEOIY46CzszF4fu35qBsiqVWodKbBQl2FJ9xrcESU3
	 2A2dSbPhV5Rg+1peitzYYZGHs4E+nNk26+TY0VyW2diJvryMu/WDDNtH8POgBFtWJR
	 m+Gz4UjxnNKtw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wIMy7-00000000vS6-1G3S;
	Thu, 30 Apr 2026 10:41:59 +0200
Date: Thu, 30 Apr 2026 10:41:59 +0200
From: Johan Hovold <johan@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: cx231xx: fix devres lifetime
Message-ID: <afMV1z9FD7sQOXFn@hovoldconsulting.com>
References: <20260330093727.1622465-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330093727.1622465-1-johan@kernel.org>
X-Rspamd-Queue-Id: 33B2749F630
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-60053-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid]

On Mon, Mar 30, 2026 at 11:37:27AM +0200, Johan Hovold wrote:
> USB drivers bind to USB interfaces and any device managed resources
> should have their lifetime tied to the interface rather than parent USB
> device. This avoids issues like memory leaks when drivers are unbound
> without their devices being physically disconnected (e.g. on probe
> deferral or configuration changes).
> 
> Fix the driver state lifetime so that it is released on driver unbind.
> 
> Fixes: 184a82784d50 ("[media] cx231xx: use devm_ functions to allocate memory")
> Cc: stable@vger.kernel.org	# 3.17
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> 
> Changes in v2
>  - Drop CC tag for Mauro to make the CI bot happy

Can this one be picked up now?

Johan

