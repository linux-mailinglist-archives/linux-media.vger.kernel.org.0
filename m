Return-Path: <linux-media+bounces-55852-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIV7BFyyt2nUUQEAu9opvQ
	(envelope-from <linux-media+bounces-55852-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:33:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 145F2295AB7
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9E8E30055D0
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA7A34F48A;
	Mon, 16 Mar 2026 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wEifpidi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DBB7080E;
	Mon, 16 Mar 2026 07:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646422; cv=none; b=Kym7B77Dj7vxvbOmZtDdKh0gBfdVtMJVnvnr9dMiq6+adkSlrz4EWaghhUJ+HczEgRg+OVx6H/UnTUUJjxlRetfIwWXTzUhjDL458cHMAFVraI+K+DD6lis/odu0hMROahW8s7CFY0aalX+2wCDiU1iB0HPhbUYl0LCekDvgjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646422; c=relaxed/simple;
	bh=lMJh/B8s6RKKLsGwHJ9H9BCGQ0cL1TiCz3Zn0+0Z9dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgqYdQYDDemWc7vDoCQNlVzWtRsGYnleMXBIdMMXakuroiKVCTug1U/E8T8wHIvw4t/0jH154/WqYJGZvC5mdemARjvNgmdOfxgV8pGpJtLMaggrEmlh0AZEq7KdlIWVq+diScd1wcBQCKtANJ3tJ69qLP8VSZ3jgjMuvl/tuno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wEifpidi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-83-225-32-8.net.vodafone.it [83.225.32.8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05487B1A;
	Mon, 16 Mar 2026 08:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773646346;
	bh=lMJh/B8s6RKKLsGwHJ9H9BCGQ0cL1TiCz3Zn0+0Z9dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wEifpidintO8wKQ01n2nATYJzlgq8Gw2294JWvRrUeLHPC4GjAXD9WX1kUsPmELGN
	 bbNVFUyU0Lnf9JDFsyQiP7y27kmSVyxeLQopX0o8Xk2assds6i9U4ys2OcwcV8L976
	 ePQLpr/yeAuUqLhbytmh3lTBTQ2jOkLW6pCPzZsg=
Date: Mon, 16 Mar 2026 08:33:33 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>
Subject: Re: [PATCH] media: subdev: Fix error pointer dereference
Message-ID: <abex6C3WpLYDRDP5@zed>
References: <20260314030228.1133429-1-ethantidmore06@gmail.com>
 <DH2693U3WV7A.3HE6S9RPAFP4E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DH2693U3WV7A.3HE6S9RPAFP4E@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55852-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 145F2295AB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ethan

On Fri, Mar 13, 2026 at 10:06:43PM -0500, Ethan Tidmore wrote:
> On Fri Mar 13, 2026 at 10:02 PM CDT, Ethan Tidmore wrote:
> > The function media_pad_remote_pad_unique() returns an error pointer upon
> > failure, not null.
> >

A patch has already been submitted to fix this issue
https://patchwork.linuxtv.org/project/linux-media/patch/20260313063946.3220962-1-nichen@iscas.ac.cn/

> > Add check for error pointer and extract the error code with PTR_ERR().
>
> Detected by Smatch:
> drivers/media/v4l2-core/v4l2-subdev.c:2588 v4l2_subdev_get_frame_desc_passthrough() warn:
> 'remote_source_pad' is an error pointer or valid
>
> drivers/media/v4l2-core/v4l2-subdev.c:2595 v4l2_subdev_get_frame_desc_passthrough() error:
> 'remote_source_pad' dereferencing possible ERR_PTR()
>

Chen Ni: have you used Smatch as well ? Should you add the above lines
to attribute the bug report to it ?

Thanks
  j

> >
> > Fixes: a564839e630c1 ("media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper")
> > Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> > ---
>
> Forgot to add the Smatch warnings, if this version is good please add
> this to the commit message.
>
> Thanks,
>
> ET

