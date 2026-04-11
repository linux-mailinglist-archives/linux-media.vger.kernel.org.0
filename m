Return-Path: <linux-media+bounces-58581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id l2u5OsQn2ml0ywgAu9opvQ
	(envelope-from <linux-media+bounces-58581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 12:51:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 578073DF66A
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 12:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21AAB3023043
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 10:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BC833FE26;
	Sat, 11 Apr 2026 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgImiblO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0DC33B6DF
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775904704; cv=none; b=gZ3cCVopdhb567v4TqvPGMCWpwWzfVb4hwwke4gsOVGnTcHpNdiT78OE4xyxGpME6t8DqPlNKDP5NAAPTT9mkQ/bUZNbFRrbysKDagDo00z9d/u4KfoEec+elZJnX5FJPi+QGQx0sSkv4/DhtIaFzK3rLrdi71sxb1ddCP1Iykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775904704; c=relaxed/simple;
	bh=ezhqd9sf2vBvqg4aMtnwxtu2Z09Vdce5h0Pr9eugotY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5wl4zvxYzZRa3G6EHtvsHP58GpNT56ZiVl7p8GbDdRQn4V3yZSdiLd4bJ/FLcVDgbnOpblz5KRCfIbfpJUrWXx+gH0TKucJYgGQXfambK72fIE5fsdGDs7j57bqgQGA7EPwITIzY+4yEFADHNDUrW54N8dBdZi6ZXVEJTo/Rxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgImiblO; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so2502591eec.1
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775904702; x=1776509502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4M5jn7C1lxcAJYyhs3VMbd2QV4JWlL8WEG2Ir7SPXS8=;
        b=qgImiblOfPT56vnPM8tuYZUnHNhwKiB58meYKmnnnZJ/nhqLNkCm67C5VDm00PeDRC
         kf+uws4//6d06RB/8gvVdkIU1jGzuTVwoz6KFiPwm83wAi+NGeX/YZfsU8xxagyHXtMA
         bT7sGxdwDV+psoZR50iXWaGUcCxB5CNXBBy3zYj3aYoyX81keIv85I7m2JLRYAPMBO1/
         NEimbtMp26lJA3qJSZEnqNN2FY9mNc/jn0GRGBG29IUEJLajstlMuRtUnvujrtdyRlhY
         thST5ogrT8qK9lK7yQriVKOqjBBr+wGLFS6TTFKAN1c8c7laKwz6VshG/IteTpBM6hEV
         R7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775904702; x=1776509502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4M5jn7C1lxcAJYyhs3VMbd2QV4JWlL8WEG2Ir7SPXS8=;
        b=hCkwIOODjDeGsAf5KvKiVJsjtBMN0Rs07K6y+jorAQn6NGjQMcPtxfW/xi0gsHX2dl
         xjO461MNmvIkt8p1MO3ggokJZerpciPZsq/VYldooavPr9RQtEWFgfRr6Km8HZJosd0W
         OjI3sf/H2F+gBrqhrZyyF79rqjsNpLxYyd+eT54z/CfSoilnlx9qpUs5wQV3IOQ8NVvh
         x13wF3335hLwcRgwg73/gPFpeiwpbh5fIRQOClMNugLANNbdq3Hwrk6/RC+HqxGFEd8T
         VFRVe089+m321xiK5UU3WaK8rBi2zVFStrgmGIigMTGmkeKtEGjpNk0jJUD9pgfmg4TM
         JHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXBjvtlW2IGI8DA/E5ong66eYPa4LkalzB2HJr84/uZDNwlwL9fSeLN8oLtLfAjEH6RPcE5Ju4YOfskQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTIky/s5qzY6eOZxGz3jZTyHS5MkFwlLeMOuGXmQrTSslIxSSF
	ATERHWYuqg1vYUUX/8wKfzcR2BEE/41qoimfrkv2wXLGTcICPviMMqmY
X-Gm-Gg: AeBDiesi9qPEDPRlFLtFos0aZYhTFhT7QTLgsH091ILbooqmpI/NnF6j/gjIIw7yuYB
	H8o9AaGqF12Sc6gA1Tsh9ASYIMdYm7ns24/OmbGz1hqqe93az7uwkuMtDt6tAfra+shd9C8NZYm
	/9mgyHa0kUydH2IU6BQA2U0NYcu16YdnOk34yfY9ZbULesYM0fN5Wyqu0Hsj6IkLCDFZy4l8cuF
	c/cFGQHY6qDlkDU6MxNumoylp/cd9wUuEVnx+ANirD4YWJdowNrIrB0/j04M5yvCMs2PlHWV/x2
	6vMqyC/aLeS/zCSXgtiHi15LQcInLD/rKpHl1RZT7U9hijA/6ygdNpHj8CVniVuCrku59ChMGe/
	F4q+b3gFTUyFUfJQhmF3HcGTUhH3RaiX75LVQQlBbrVWFSZYqIr7OVG/mRIGUw+euW5+HeCYZ+d
	96h8qPBrwv4MuKvt8=
X-Received: by 2002:a05:7300:220d:b0:2be:1f56:ed21 with SMTP id 5a478bee46e88-2d5876a0820mr3675263eec.7.1775904701741;
        Sat, 11 Apr 2026 03:51:41 -0700 (PDT)
Received: from localhost ([45.86.211.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2a4esm10532645eec.16.2026.04.11.03.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 03:51:40 -0700 (PDT)
Date: Sat, 11 Apr 2026 13:51:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Ugrin <mugrinphoto@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs
 instead of spaces
Message-ID: <adont11Sr92pi0_N@stanley.mountain>
References: <20260411005512.46142-1-mugrinphoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411005512.46142-1-mugrinphoto@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58581-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 578073DF66A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:55:12PM -0700, Michael Ugrin wrote:
> Fix whitespace issue where a continuation line used spaces
> instead of tabs for indentation.
> 
> Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
> ---
>  .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> index b411ca2f415e0..966d4efb200c5 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> @@ -1257,7 +1257,7 @@ ia_css_debug_pipe_graph_dump_stage(
>  					p--;
>  				/* Last comma found, copy till that comma */
>  				strscpy(enable_info1, ei,
> -                                        p > sizeof(enable_info1) ? sizeof(enable_info1) : p);
> +					p > sizeof(enable_info1) ? sizeof(enable_info1) : p);

Better to use:

	strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));

Same for the other strscpy() calls as well.

regards,
dan carpenter


