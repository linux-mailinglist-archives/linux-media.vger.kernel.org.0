Return-Path: <linux-media+bounces-57428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MDtDPKrx2nNaQUAu9opvQ
	(envelope-from <linux-media+bounces-57428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 11:22:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2B634E108
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 11:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82B81304C13A
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 10:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB35386578;
	Sat, 28 Mar 2026 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="O409+/aJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="anbg3YV2"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21752D73AE;
	Sat, 28 Mar 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774693303; cv=none; b=rHTPFd/uuiX9GhjNkTuPyA2gVx2rsmHsN5WN0DH10YmYYO1MsayERl9oSmxtxNscJzWLhW3XtQbvbNk3aaXG4T8sRYfE48Fisp/pD0L1F3+fQz8dlHhazFDY98tpKNOxJ0Xw7ygcwmGpsEg/m5OJQObkY90TUjZ2bkoLY/J4imQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774693303; c=relaxed/simple;
	bh=rG565eeekN4O8fh1pyKvCFYBqmHBIvM79s0tfBIYolY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0rzD0Vyf+HXDprAKIFVOqnUSr2BFFDcPL8cO0is4jNU+aFDOUPydmjLp6D2kUhcttJk9/r7DDVbDQKp1SWxTu9Sk6Otr4lIakO+onsuhBShuma+O0pmkwVxNRN5JV6ZOQA+iLmox0XRDE+GKp5xM3BfuJCOkT8v/2pskl2m1es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=O409+/aJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=anbg3YV2; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 164FC1D00009;
	Sat, 28 Mar 2026 06:21:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 28 Mar 2026 06:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774693297;
	 x=1774779697; bh=KNApZDYZ9r9b/kyaSUMYOzqKnJ2bmvMoejAncB7Lq6Q=; b=
	O409+/aJYgKUjy/y5VGjOuXtWj7VRsa2Kv7zb18GemGRj6JTiatNtLBAULC5lqXu
	WkfRq4kUOZO5muMJEBr8dcapMx3v0YIx+MvcHaugY7b/rNa/hi2uafye6e1m1aHr
	FeN+k3kOCMNqgQ7HcYdEfFdlOetMxp/Y14hTcK7q8MZcgfte/zxMywY2EjaW9Gwz
	1u0eNYu4Kel39rExLvPtIUfd51NKh7hxTkXnnXgxFxAusiYxE3iOXrc5ysg9qwer
	P/CCOxqwFVOVGKYyWtIHT8GnuH599uAeojqv4FcbU4LiszDiegy9CRP2KWSip4Pc
	Mcy/tVI6pSUhoPX8DcrNNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774693297; x=
	1774779697; bh=KNApZDYZ9r9b/kyaSUMYOzqKnJ2bmvMoejAncB7Lq6Q=; b=a
	nbg3YV2nK0EIa4O1n90nPeOGJxmgbgs3eAwUxjKSXi6464pHb+u2ywso+ecwjUiI
	gtI3GmCM+96OzlYHzkkypQDCIckCQ+eMwCNW8sEHgFdCsrDC6jOfkrH2iuOv0/+R
	Pf1h/VL9OEJ4AYhDJplnm5kQMX9qOFdUuPnd6VAu0U4ALZJXnRiiX1MT9z2d4ZEu
	moEn/pkgPLDiRqQqNkzGCVrqGYrpQP8gxAGe++jzZDddEXbwXf4SFps1n8LOnXRR
	TSSRbtYb2nWjaOqC8Jjfco9PmiX+0DtczriNuGsXeRkSSGqQ7qvB6uDRck+o6VCn
	Md+fzBdpVCf4lIdcYyjtg==
X-ME-Sender: <xms:savHaQrsc1xYN9JR0HV1UOR993isdgSmPh1QenlDZQ_WDDy4GmIUzA>
    <xme:savHaQVfMaYnhvlvhELDOxI1LrqrHP-F7yqN44uV8aVkf1UomOliC_qG_dbV1mK1v
    UooXpMurBYzFGoOwuCHgylf_Q3mdHZU_qYKuzS85qDu9M4yPgs>
X-ME-Received: <xmr:savHaUg0YQzpV8g_ec-10RMFlYPTYpzrCECbQoSUzZEHKIFeS3KldVkQYS-t16xuOJ4DWQI-KNQqj3ye6kP7k8U_3OIxhyvwi4_AMW6EHqU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedvleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesthekre
    dttddtjeenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepleekheejjeeiheejvdetheejveekudegueeigfefudefgf
    ffhfefteeuieekudefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomhdpnhgspghrtghpthhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeguvghvnhgvgigvnhesghhmrghilhdrtghomhdprhgtphhtthhopehlrghurhgvnh
    htrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohep
    mhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrrghnkhdrlhhise
    hngihprdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidr
    uggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtph
    htthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehjrggtohhp
    ohesjhhmohhnughirdhorhhgpdhrtghpthhtoheprghishhhvghnghdrughonhhgsehngi
    hprdgtohhm
X-ME-Proxy: <xmx:savHaf8QvUzL_Ch4OPl78alDw-8dRDCuR5Gcb63o-ACbsV9zYRt2bw>
    <xmx:savHaUSrobMZQuKmlIkfiw_uwnpksRyGsuuFTmrHooXsznS5hR2XYw>
    <xmx:savHaUGoXjNFOsMMjkGe7CBxAzz51iLTRTBH40DKGCOmgqiViuYhoA>
    <xmx:savHaQhnN4HWL11wLZ6kAjfq9FOQBQtvFL7mcrku_1TM6XP0oVXxGw>
    <xmx:savHafT71wd9gaDA9uMheZHjg7ZBWfKy40mITMqlmf1yGDtwAwEYMDlG>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 06:21:36 -0400 (EDT)
Date: Sat, 28 Mar 2026 11:21:13 +0100
From: Greg KH <greg@kroah.com>
To: David Carlier <devnexen@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jacopo@jmondi.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: nxp: imx8-isi: fix memory leaks in probe error
 paths and remove
Message-ID: <2026032803-tree-stubbed-1e9b@gregkh>
References: <20260327222711.268132-1-devnexen@gmail.com>
 <20260328100010.41236-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328100010.41236-1-devnexen@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57428-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kroah.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: CF2B634E108
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 10:00:10AM +0000, David Carlier wrote:
> mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> frees it on any probe failure path or in mxc_isi_remove(), leaking the
> allocation on every failed probe and every normal unbind.
> 
> Additionally, when mxc_isi_pipe_init() fails partway through the
> channel loop or when mxc_isi_v4l2_init() fails, the already initialized
> pipes are not cleaned up — their media entities and mutexes are leaked.
> 
> Fix both by adding kfree(isi->pipes) to all probe error paths and to
> mxc_isi_remove(), and cleaning up already-initialized pipes in the
> err_xbar error path.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

