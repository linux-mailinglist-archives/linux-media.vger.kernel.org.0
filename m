Return-Path: <linux-media+bounces-67447-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IrtuFkepVGoPpAMAu9opvQ
	(envelope-from <linux-media+bounces-67447-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:00:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C54797490B9
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:00:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=SqeFR9li;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67447-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67447-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED35E300C393
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3113D522C;
	Mon, 13 Jul 2026 08:55:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971703B7759;
	Mon, 13 Jul 2026 08:55:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932935; cv=none; b=GsBd7vdHnBgP9qW5BcXT2QJ6zO2bNM87kNRLUBbOsf4NbN/KHHYEQ4QBK+mxk+N+sn1MOzeNbSmSikGKNEk+/g1wpK/n+ej46e2Asg9ulsVurH7LnsFP/mbj5hhSDVSqt6O3u2nABdvBcf5LWlHtj2l9kDkcn3//kP3mj3z/UGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932935; c=relaxed/simple;
	bh=f0/SSL5f80JFYI51KCPSLvowOM6aSxhCDCyPxpSVayU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqa+KTutnlcnZC+kAx6vw1s5hUjQeu6eT9SVmXg/IXIN4DEKW/jWwqX1ldaCXKtCeoswtyISvTMygtuXfuvJTLAhI+p3hcU1aHGaGFTmVnJM/4ohGV6NBfXdzfTmpqzdP9WVSN+h7ThqKG7d/QUGdQxOg9WuUotEQq5/ZI4Y5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqeFR9li; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783932934; x=1815468934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0/SSL5f80JFYI51KCPSLvowOM6aSxhCDCyPxpSVayU=;
  b=SqeFR9li/yB2a2sb2QUapfLmvNj+l3xUU6MxwF1LLKH8r5iCMGsrJIXM
   DSOzF6vFr2lnvoZtjh0LY+g7/7tQkWPi1XrVbkJ5jDAWXg7w0823nvLk2
   Pq4ywaEnHARxH8JsgLotA+mpdyM18gmiPfM6a4MWHSae4QGz4MyyEiKsx
   fqBFo0snqqq1ZfxCrkUOu2PDRd+EwXJcJQgj37uDZ9HZJAJ6wxh9f82WQ
   dcJhEy86TP8Bm+KiX12qORQ1MyeQVl5JZ8FIUKgL8hYyjRb9oOQdlYRvi
   M1OwNw9TJ7zU2PI8PzBSHYuU0rPeJS4Zh2vYhBCDl2YuAD5fAIc9iAj2k
   A==;
X-CSE-ConnectionGUID: ZgPhYeZnRoqIoNcjtfhJrg==
X-CSE-MsgGUID: UnWd38zLRPWSBwtD3q+WRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88440409"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88440409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 01:55:33 -0700
X-CSE-ConnectionGUID: RCHUGXzEQMi6yqzB91MmKg==
X-CSE-MsgGUID: tLaJrZFlQ+OsQ7V5QUxhIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259791846"
Received: from carterle-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.117])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 01:55:31 -0700
Date: Mon, 13 Jul 2026 10:55:19 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Jang Ingyu <ingyujang25@korea.ac.kr>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rkcif: Use IS_ERR() check for
 media_entity_remote_source_pad_unique()
Message-ID: <alSnze0rfa6wnWk3@mdjait-mobl>
References: <20260710203016.2250058-1-ingyujang25@korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710203016.2250058-1-ingyujang25@korea.ac.kr>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67447-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ingyujang25@korea.ac.kr,m:michael.riesch@collabora.com,m:mchehab@kernel.org,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,vger.kernel.org:from_smtp,korea.ac.kr:email,linux.intel.com:from_mime,mdjait-mobl:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C54797490B9

Hello,

On Sat, Jul 11, 2026 at 05:30:16AM +0900, Jang Ingyu wrote:
> From: Ingyu Jang <ingyujang25@korea.ac.kr>
> 
> media_entity_remote_source_pad_unique() returns either a valid struct
> media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
> ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
> therefore never triggers, and the "pad not connected" error path is
> unreachable.
> 
> Replace the NULL check with an IS_ERR() check so the validation
> actually detects malformed media graphs.
> 
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad559..542aa877919df 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -466,7 +466,7 @@ static int rkcif_stream_link_validate(struct media_link *link)
>  	struct rkcif_stream *stream = to_rkcif_stream(vdev);
>  	int ret = -EINVAL;
>  
> -	if (!media_entity_remote_source_pad_unique(link->sink->entity))
> +	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity)))
>  		return -ENOTCONN;

This was already fixed in:
https://lore.kernel.org/linux-media/20260522065548.2438545-1-nichen@iscas.ac.cn/

--
Kind Regards
Mehdi Djait

