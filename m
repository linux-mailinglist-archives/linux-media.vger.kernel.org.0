Return-Path: <linux-media+bounces-60052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CcSIcQW82llxAEAu9opvQ
	(envelope-from <linux-media+bounces-60052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:45:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA19849F5E3
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEE3330421F4
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 08:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0013FE651;
	Thu, 30 Apr 2026 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uF1azfM4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B6E3FE364;
	Thu, 30 Apr 2026 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538441; cv=none; b=FsQWT+rI7nS9m+KN5cc92S/UorEocsPOWl77y/I0mIU5vx2+9VlZ6GyGc2KxMJwcdWeXhxPNXsYvHj3W7sia2sqPWYOLWCB0WaAXUPN+z42BitkSgji1qeqLQvAYtgpGrAozmSnKhLRKrQCw8WVKzwzw2Ox6Dw90Qju7aSphoJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538441; c=relaxed/simple;
	bh=oXrZ5fbQMgE1CwdtITSghYBpPKoljD2/jQEyRbdG238=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAPUKZcEqlzaRyTekQ3jKLmP2pua/i/uzI77CbZ5V1IUr4QRkB0DgflWePmx30VPnyw38mCYWXGImKoclCeiomdkqlLVPT6XAzcykNMpWWwOM5NS16bcbELDFM01jc986r3qiVmt4ZflE2X0m/PFICDFuL2O10S3LTmmnii0UWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uF1azfM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485E4C2BCB3;
	Thu, 30 Apr 2026 08:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538441;
	bh=oXrZ5fbQMgE1CwdtITSghYBpPKoljD2/jQEyRbdG238=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uF1azfM4HctZTiVkeWFoEl0I2P8jAkLhES3QpyAOuLgrodnVswTb7nodVNqOkmP6v
	 JNNsT5PKz0wHUzuEgtRul03jbHY7R0fB9zYoDgwEg81DXO22oGSuYIvGCQ9cM1d66R
	 t53RKuAXVpHCPZFgwKEPMGX87zZn4t6c3NYTPq7hfAj2HdK5S9kguKa4PupyBvpcuq
	 5MS68XdMzWjYLa/pANZYIbJoefcIDHxlAtzBLyxgqI1/hn6Lj5kzyQrBBgjcBw49eu
	 rZarkBmGPMRLwd5NkkfuLx7/OIeJf+zer0VibFxTAuhN3bUD0TQfjkxd/hrGr4TaLg
	 Ko0FKcC92OeCA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wIMwp-00000000vQn-08f6;
	Thu, 30 Apr 2026 10:40:39 +0200
Date: Thu, 30 Apr 2026 10:40:39 +0200
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] media: refactor USB endpoint lookups
Message-ID: <afMVh6cPZ1_tff9T@hovoldconsulting.com>
References: <20260330101141.1664143-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330101141.1664143-1-johan@kernel.org>
X-Rspamd-Queue-Id: DA19849F5E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60052-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid]

On Mon, Mar 30, 2026 at 12:11:35PM +0200, Johan Hovold wrote:
> Use the common USB helpers for looking up bulk and interrupt endpoints
> instead of open coding.

> Johan Hovold (6):
>   media: si470x-usb: refactor endpoint lookup
>   media: imon_raw: refactor endpoint lookup
>   media: irtoy: refactor endpoint lookup
>   media: gspca: refactor endpoint lookup
>   media: hdpvr: refactor endpoint lookup
>   media: s2255: refactor endpoint lookup

Can these be picked up now?

There was some complaint from the media CI robot which did not look
valid so I'm hoping these have not been silently rejected.

Johan

