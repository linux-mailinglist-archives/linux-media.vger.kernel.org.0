Return-Path: <linux-media+bounces-53038-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMMhDxx9lWl8RwIAu9opvQ
	(envelope-from <linux-media+bounces-53038-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:49:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEAD1544A1
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93E2130626DD
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39FB321434;
	Wed, 18 Feb 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDn3CG+G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7DD2F49F6
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404295; cv=none; b=OEWrp76FhDiBX0UArWm2/rIsyRUaVOEgCRl3ITaCNmag4KrJL3lFArUrhSSFEZ24IM6G89HmtCcaJKROhv5W+vV/mjDnVZKgn8iqpJxef8RJqu8dNsBBHLn7TurNfHOBv4xNPqLYju6bNJhzLKbAwSXFWYNrp8bx0RbavJFyyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404295; c=relaxed/simple;
	bh=F1GBs5gqEy3379HyRiPCC6e5C2VAveRNCrKe3sIHkF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr5LUcQv6k9HJvezfEFwn5GL4JJPbFVq/c5yujiMjnPZIPeEV/764FYAsL3Mi2WYGyY4Tnn68Hrl8bhta3Wlc4dZW/1m/CTDfYmOO6UGe11w2Xr3rzRRWV3I/7ql8F2CKwBkAC+kaWCjr2rNC4Af6AGq5z3VEmFnU787lufg6xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDn3CG+G; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40f387a688dso2207104fac.0
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 00:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771404293; x=1772009093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQTXQYFav49jYyRtw64JUokHu/z2PFtLBgO8hXSnfbA=;
        b=QDn3CG+GehKnyRVQMZn+DPpMNxWYBg5Z4YAu9Gpa4xzUmyK48tdTOCGlGIVYwUC6Pe
         Qior2LnoW7B5Wa1reER3ozC2LhSfvmPXKqCHFDrFycYow2A2TJC3T/aQENgRYqycYD4T
         2eE2UgnM1gCxclJSGYAzqO7LMSzx2oVSLiKp25CkAGnjD7RAkdwrenHPGCrFGFGAcn27
         srR7gIIpbnYxUnFLvUy+6oj3V0A/P3ZNLRdx+PLDYhaJuAObAEEjoKZjFFSoiduJE1UV
         yo9QMliQD007qj0z1i0CiQTznsNfbyMQ5ws7pEMHcqyo5XIUAeVpIjp7WVuIzmSlNKV5
         ZVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404293; x=1772009093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQTXQYFav49jYyRtw64JUokHu/z2PFtLBgO8hXSnfbA=;
        b=HLA5LX0rxI5S79QvLEC4/ND6WtAtWRZTYXPY6oh4v1LQCTeJHHCsX9By/moOz5a/JO
         Ytg0CQ7y5wsY4yoT9dWpAF4xDbUBqgWxDp0REqb/OTU/YPsdkvwnV2sQNKudXtS0j3ss
         wm1OdecpY9pCysclpQcKEvkt817HwaqUAiGiS+1sikj3PcfSA0iaOvmjUsQ8ulddWtey
         sFDOPfRQWNHdwrePxh9xgGxwSYY0JfB5W5lIeGV8s4WDYFeaLqsuGSp3AF/Yc9W3MWpR
         DgRwmOQt6eKoTsBtowOC6/43PH/t/VrocdOrXoa8FVsEtA1sqNx27kC1ElYOPGpTRQDo
         3e1w==
X-Forwarded-Encrypted: i=1; AJvYcCUcBofqa8eqdmIOUeXfFAzR0+c90TI51OmUCfFh0+HsRaORLuz2hUq7fuUfRfy/AXG0H2EB+AMtxHCMbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsyreqAy1XMtBrgFH5Lv4VSCop/DgmuR/H+8IOQrOQw2bsRBmn
	kncoOt5a1QCsln/ijwI8w0MzWuBZ9g8oQ8VBlQwMaazrpHdbDZkW5y0o
X-Gm-Gg: AZuq6aJxisvUyw8zGWpnngcYg/BnxlKHRoVX8oteP/fQVuah6GJYdlcZ5wZ9PYCdzB/
	doR4lvAe/CCyGS/Occxcynr0br+h9EeqG7eCHPg0y2W5njmBe/ZASFj2DHEB2ol5oO5T655WSZP
	e9wUn23YPPen3Ug5ACNO3lR6ihYQqc+2sECOdghOtBwmvE2XxvVaiS6i0FHFuigvS1uL5NsRe25
	Rv8uqDIZZHUwJMUr0f9HLQsutogAM/CGt4rK1q90fvCkfs4va0H+KXZyf5vM0N7vWqRMdRMcUFa
	LQ4CdGq9ht1adZbvtXyyQWzJMMi12bQ05PO9xwEyWiY/oajideHkLCi7Lhvt0i0nJ32kYR4YoLA
	/tuALX1YA0NBtr62/AC7wyDxQzzS6tFFvXZ1pH3ignbBJYL6FXkVku6wu6h4sT3cTZb+C5v7sFH
	navbqxW75JluAeO4Sk0RS6TtL7EfoE02WqkFFrVu/v0bjDPoPS5DlUqpHEWocdWhNJ
X-Received: by 2002:a05:7022:a88:b0:119:e569:fb9b with SMTP id a92af1059eb24-12759a00d27mr429509c88.10.1771397414519;
        Tue, 17 Feb 2026 22:50:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:968c:f102:3683:408a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742b62274sm23152120c88.3.2026.02.17.22.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 22:50:13 -0800 (PST)
Date: Tue, 17 Feb 2026 22:50:10 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Chris Li <sparse@chrisli.org>, Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, 
	Petr Pavlu <petr.pavlu@suse.com>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, 
	Malcolm Priestley <tvboxspy@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aZVhE90b6dZbGpfj@google.com>
References: <aThSGiKwJRYOB6kx@agluck-desk3>
 <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com>
 <aTn0WdVv-S_EpQmS@agluck-desk3>
 <aTqAxfiVCR2ch4I5@stanley.mountain>
 <CABCJKufWw4VQA_k6Deuf5Bn6401cbYv_St8VV_0-LAau6F0nTw@mail.gmail.com>
 <083ebd92-4b3f-47f8-bf0f-395a604b5f05@kernel.org>
 <aUVI9smf2t7PvDF6@stanley.mountain>
 <aUV7kyjxlijuy5sC@agluck-desk3>
 <aV9vo7_turBr84bs@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV9vo7_turBr84bs@black.igk.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53038-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,zeniv.linux.org.uk,kernel.org,google.com,chrisli.org,rustcorp.com.au,suse.com,vger.kernel.org,gmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9AEAD1544A1
X-Rspamd-Action: no action

On Thu, Jan 08, 2026 at 09:49:39AM +0100, Andy Shevchenko wrote:
> On Fri, Dec 19, 2025 at 08:21:39AM -0800, Luck, Tony wrote:
> > On Fri, Dec 19, 2025 at 03:45:42PM +0300, Dan Carpenter wrote:
> > > On Fri, Dec 12, 2025 at 02:30:48AM +0900, Daniel Gomez wrote:
> > > > Maybe the flag fix just needs to be applied to the evaluation? Other op
> > > > structs do the same. But Dan's patch did not implement evaluate. E.g.:
> > > > 
> > > > static struct symbol_op constant_p_op = {
> > > > 	.evaluate = evaluate_to_int_const_expr,
> > > > 	.expand = expand_constant_p
> > > > };
> > > 
> > > I was waiting for you to send this as a patch.  I can do it if you
> > > need me to.
> > 
> > Al Viro thought this was wrong. His alternative patch is here:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/viro/sparse.git/commit/?id=2634e39bf02697a18fece057208150362c985992
> 
> Sparse still is PITA as of today, can we get some fix (Al's or alternative)
> ASAP to be applied and sparse tagged as 0.6.5 so the distros will pack the
> new version, please?

Any update on this?

Thanks.

-- 
Dmitry

