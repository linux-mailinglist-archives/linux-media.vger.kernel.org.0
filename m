Return-Path: <linux-media+bounces-56214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGZpB362umlWawIAu9opvQ
	(envelope-from <linux-media+bounces-56214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 15:28:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 886892BD1F4
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 15:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0422632AAE80
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 14:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E523DDDAB;
	Wed, 18 Mar 2026 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PFTTwueV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FE83DC4D6;
	Wed, 18 Mar 2026 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843423; cv=none; b=BRqWlRosdZCp0r28Ad9plsLRCpJI1oHaD5FQ9w81zUxMX6VKfO/HP0Gn/bZ0TO6+hlqWyXttXcflkd5gdts6/8BKSjWRsCK+HAQ8HwWe9+fGk6YEYxpBbDFY+qiMGgo655oYhnSg5g+qldO4nva8rCNh3rx1CcK7VeeHC/mUij4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843423; c=relaxed/simple;
	bh=vnbiVrDtPvHs7XAoWbMh6J1bPNLpJn29L3fekQqI4l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K81gEgjRues7F9Jpwb+Zh2n8+9YcRclqTA158m4b1NwTjhfuV7BzruP5LwmL1Y742BViKyWiPOrs9F7vTMqgd5/7BGMLSdWZru35sZ1ZRZwCnCyFKGqe4ALcYJ2wHm+A32+uUjtbktMgNJGPq0VduBwCQTK87d4CYzUFIImj7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PFTTwueV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE1BC4AF0B;
	Wed, 18 Mar 2026 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773843423;
	bh=vnbiVrDtPvHs7XAoWbMh6J1bPNLpJn29L3fekQqI4l4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFTTwueVyNo37a2GTJtlFPsyjuwKrue6BF0U/iAl4cWbpvi5+LQfUydJBizFZzz7a
	 WlZSGeiXKLZlEb1IfecAaexKMIXa6YZ/kiMFLTSIa+I4o1l/yZ5Y1YO4g7YBfU1Ak/
	 ILQHym+KlJTwYw6DvCin5Gtb2sVfoy7v72eo5xEg=
Date: Wed, 18 Mar 2026 15:16:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: uvcvideo: RFC: Convert
 allow_privacy_override into Kconfig
Message-ID: <2026031852-unplowed-ocelot-142a@gregkh>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-4-19cd4657e1f3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-uvcdynctrl-v3-4-19cd4657e1f3@chromium.org>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56214-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 886892BD1F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:34:47PM +0000, Ricardo Ribalda wrote:
> This patch is just shared for discussion purposes! Do not land.
> 
> In a perfect world, after a deprecation process, we will be able to
> remove allow_privacy_override and block all privacy related controls.

Why add something you are only going to remove in the future?  What has
changed to require this now, and will change in the future to make it
not needed?

> If there is any usecase out in the field that resists, we shall move it
> into a Kconfig.

What does this mean?  How will anyone know to "resist"?

> This patch shows how the transition to Kconfig can look.

I'm confused as to what you want to do here...

greg k-h

