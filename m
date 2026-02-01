Return-Path: <linux-media+bounces-51907-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNp6LYQKf2kEiwIAu9opvQ
	(envelope-from <linux-media+bounces-51907-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 09:10:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A72C52E0
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 09:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2BD53024A50
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 08:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF4631986E;
	Sun,  1 Feb 2026 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p7ybh4nx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F62D061D;
	Sun,  1 Feb 2026 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769933416; cv=none; b=TUDtKSzSX+eHjHB3ZqQztXVLFINy1UU6zdOjBrmZY/tHZXlhfBt7gwhxfx3tkf++0DexFljgd9Nl2fzZud14k2K+pXN62DI8EVK3RSOsUYrf1yqWIEbaq9Lebfk36urUStyQz8ZmcCFc2ANl1NwsKGHzG2Mx7zQeTNyzzBxqGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769933416; c=relaxed/simple;
	bh=QVUPPyi0Q6yHUSxcWcuz+4VlCKMlW0eUTqvgjfZT2/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eR6vUxjkx0IqqaP6YBR2zt0+HlYpE5RSMG0OXfkgHZ3r+j/42Y/z75nvX77n+g4Hp8sef9Z/RDs9ozwUMRqE834aKxsePJC+IR9fRRwopZrmPiwz0Wa+Jk5h2+/6X0XnADpHhT1UM17xyVIv0spyL+AjzaIbtBALyT1Dq0EV8HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p7ybh4nx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54835C4CEF7;
	Sun,  1 Feb 2026 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769933415;
	bh=QVUPPyi0Q6yHUSxcWcuz+4VlCKMlW0eUTqvgjfZT2/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7ybh4nxrKehy/ltSYR/jjeipLwlSukaJjbuIpurob61pkSu6IrROghdgstHDGWJi
	 e3y+/D/mJTL8145ZDcZngTJMcfYK1ux9wuJDInvQnjAwm2aN23OcujAmQSeeR5Eiaj
	 eOTo02Gf5mA2mubqXQ18cTty2yPV8/d7uXcq/B3I=
Date: Sun, 1 Feb 2026 09:10:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: Fix memory leak in
 atomisp_fixed_pattern_table()
Message-ID: <2026020156-carry-progeny-168c@gregkh>
References: <20260201072107.1797351-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201072107.1797351-1-zilin@seu.edu.cn>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-51907-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41A72C52E0
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 07:21:07AM +0000, Zilin Guan wrote:
> atomisp_v4l2_framebuffer_to_css_frame() allocates memory for
> raw_black_frame, which must be released via ia_css_frame_free().
> However, if sh_css_set_black_frame() fails, the function returns
> immediately without performing this cleanup, leading to a memory leak.
> 
> Fix this by assigning the error code to ret and allowing the code to
> fall through to the ia_css_frame_free() call.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> and code review.

Please properly document this as per the rules we have for using tools
like this.

thanks,

greg k-h

