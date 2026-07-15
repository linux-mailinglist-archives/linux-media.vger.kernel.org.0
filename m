Return-Path: <linux-media+bounces-67645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S3pFKF9aV2oUKQEAu9opvQ
	(envelope-from <linux-media+bounces-67645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 12:01:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7784E75CBCD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 12:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mxICMSi5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67645-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67645-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEB553011788
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7F243B6C5;
	Wed, 15 Jul 2026 10:00:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285892931C2;
	Wed, 15 Jul 2026 10:00:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109654; cv=none; b=JkpZHFWn/aO1/okn2ZouC/EKJtoDBH/mXOf/r7nIy3IZVmuT+aIGb2Sq/F5nJrAWUbT1KwI4242OfVPMbtcoDHo4doSF+gho6x8Fqp91JZW82lmEAnNYirMyY9X1IKN5CptphDZx3Ur3YMKXrJPSqao6oXc/IRE0Y0G3YRULDKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109654; c=relaxed/simple;
	bh=FzYK9QBt5GoCU5ivUuGC6bBJW/oKmjeLkYYoQsNThss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeXyOq0qeckD9SqWtmzJ1SNV+jMzx7OJrZVaAWcvZvlv1QUUk5/Bj46QgPlEXk0Z3blRW5J3WPp5vgSuF8ku/Iva3+H/9kFWvNbrCagLGLeYXVH4ig4K2q/nAUXg5j0k+PEWVMV7gVXQjEcfJ7wahRroQN47zCkIhZEre7NWp8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxICMSi5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F261F000E9;
	Wed, 15 Jul 2026 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784109652;
	bh=VC01daqvSBQ0L3vAI4KvNrdPwbGLWa5Dj52SJ44ZAa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mxICMSi5AEs0IZ5zb2fizRpP/iLAT9s5sm/uOqpv2qLnetG1Dt5VIIFSXn6Fkt9ri
	 llNOtXAT5F+qRj7kwH+M4pOMjj8pe3YoO2X00zdqJ4Jzjjg3f5GpjaTgzTK4kIk+Dq
	 IbnH9UjdW2JtI/hQqSCOQqYjpnLYWbit8r0QC5y3BNE20copHUvGdAt3GHzEF91zAQ
	 0gbSv6AWGbmjudMdIrs6IA57pLKCEp9OmWapbHPwVbelnTc5jvkr8DcFJhNLMsCZ/I
	 Q8HQS1dUXOu35ymRf8tXFnwyJnlBlQgnidrfygQ098WAU5Dcv3gJP8YYvltDpnRq71
	 1uaDfspCUb8RQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wjwQ6-00000005uvP-2hXm;
	Wed, 15 Jul 2026 12:00:50 +0200
Date: Wed, 15 Jul 2026 12:00:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Lei Huang <huanglei814@163.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: Re: [PATCH v2 1/2] media: s2255: Rename CamelCase goto labels to
 snake_case
Message-ID: <aldaUlUq8bGDsJgT@hovoldconsulting.com>
References: <20260715092947.772768-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715092947.772768-1-huanglei814@163.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67645-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:huanglei814@163.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:huanglei@kylinos.cn,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,kylinos.cn:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7784E75CBCD

On Wed, Jul 15, 2026 at 05:29:46PM +0800, Lei Huang wrote:
> From: Lei Huang <huanglei@kylinos.cn>
> 
> Rename the error-path goto labels in s2255_probe() from CamelCase to
> snake_case to comply with the Linux kernel coding style:
> 
>   errorBOARDINIT -> err_boardinit
>   errorFWMARKER  -> err_fwmarker
>   errorREQFW     -> err_reqfw
>   errorFWDATA2   -> err_fwdata2
>   errorFWURB     -> err_fwurb
>   errorEP        -> err_ep
>   errorUDEV      -> err_udev
>   errorFWDATA1   -> err_fwdata1
> 
> No functional changes; all label definitions and goto references are
> updated consistently.
> 
> Signed-off-by: Lei Huang <huanglei@kylinos.cn>

This looks ok, but the fix should go before the cleanup (e.g. to
facilitate backporting).

Also, always include a changelog (in a coverletter) when updating a
series.

Johan

