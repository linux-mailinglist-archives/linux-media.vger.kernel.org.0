Return-Path: <linux-media+bounces-67546-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SSRWH2vwVWrRwQAAu9opvQ
	(envelope-from <linux-media+bounces-67546-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 10:16:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECEE752459
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 10:16:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=PzrAcsxX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67546-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67546-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8F20301C968
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 08:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C086E3FADFC;
	Tue, 14 Jul 2026 08:15:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45DD286409;
	Tue, 14 Jul 2026 08:15:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016921; cv=none; b=Kcte6J1XET8gQf3WYPGxrmpWQBWce08Azwqx+2P1fyXlyVxqrqRnL6Z5yqgGql/VFj5wa0975c5O7N4O4VdPYU1Q78pjXu4CJMT0g9FsfMlehk9jDcer2uVhRiRZEdtWJ5mFgtFbAwOF1we63XGdmiDFxsbzZ9Vwf89fgVTTEeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016921; c=relaxed/simple;
	bh=mH5ovusdX2PkuFsDOJP/5IHW9PCLk6DvxtbTbPvIkT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQYdMMPdKHnDkM6qkWg8fkgadFlLz31A+q9P/AuZAGWazgt3ZKJnHncBfix5+i+RCe1n9cvO7XVar7ZI1jUjN+fTRe+c707dPOhCbBPm5QJGmbY3r2eTfMsyE9ulP+sxCmhf6zD8DuJ70Q3GJKbNEw67xt6lHSVlKHqg/OaaPt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PzrAcsxX; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 289DB6AF;
	Tue, 14 Jul 2026 10:14:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784016863;
	bh=mH5ovusdX2PkuFsDOJP/5IHW9PCLk6DvxtbTbPvIkT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzrAcsxXKw6HNKl8DAAVGIKJWGnVwSjRgXAGYPC6469KkOLNYgBQmzH0SBun8PCeh
	 8I6HyFTH1zIxxj1Vg4ruIb7yQkMyNmwLhNrSHVeFjPF9DIEFeLieWVEXYdb3gNbPfU
	 EahnWAy1a8RwX3b2Pe0IMQLKrn7zoPnKCmU2L9gM=
Date: Tue, 14 Jul 2026 11:15:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>, linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Subject: Re: [PATCH 1/1] checkpatch: Deprecate V4L2 pipeline power management
 code
Message-ID: <20260714081515.GM1127719@killaraus.ideasonboard.com>
References: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67546-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:apw@canonical.com,m:joe@perches.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6ECEE752459

Hi Sakari,

Thank you for the patch.

On Mon, Jul 13, 2026 at 07:13:27PM +0300, Sakari Ailus wrote:
> The V4L2 pipeline power management code, in particular
> v4l2_pipeline_link_notify(), v4l2_pipeline_pm_get() and
> v4l2_pipeline_pm_put() are deprecated and shall not be used in new code.
> 
> The drivers need to use the Runtime PM instead.

I'll be happy to see this API go, so we certainly need to make sure no
new drivers use it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  scripts/checkpatch.pl | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2b7a42bbdd94..a8a7374dc9c4 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -879,6 +879,9 @@ our %deprecated_apis = (
>  	"DEFINE_IDR"				=> "DEFINE_XARRAY",
>  	"idr_init"				=> "xa_init",
>  	"idr_init_base"				=> "xa_init_flags",
> +	"v4l2_pipeline_link_notify"		=> "",
> +	"v4l2_pipeline_pm_get"			=> "",
> +	"v4l2_pipeline_pm_put"			=> "",
>  );
>  
>  #Create a search pattern for all these strings to speed up a loop below

-- 
Regards,

Laurent Pinchart

