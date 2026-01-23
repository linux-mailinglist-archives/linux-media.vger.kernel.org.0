Return-Path: <linux-media+bounces-51419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDaNHlh/c2mQwwAAu9opvQ
	(envelope-from <linux-media+bounces-51419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:02:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DC476959
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B74BF30541F0
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 13:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5FB2D1914;
	Fri, 23 Jan 2026 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZR9JCXd6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4652F361A
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176791; cv=none; b=ViUHD4n9ckdRoi+ww5Bp04NsV20U9fg8Z1ILq5UP2Gw9iHv6z1CT9fHvJPKv744G3T2aGkIBcusJ79u/pDnuHq9nKHz7dvofJDBPgoAzBdaN3j7MXbYokEIfFlyTOKjSUWJakLGe8CKEkW/Tn/Mt4v3yi+lKLf0lYYeXlYs6SUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176791; c=relaxed/simple;
	bh=bOwB+6jFlQ7iSC8wkTv30Rdr61wfqkVfXuMyGTo45zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BBSrugZiXfiO1x91NFACyKAOQ4EQiYkwjEjP2RTwwu85oBZohHAq/El57oRpuRkmWEJ/+ODQVyc3vV8QKt7HVEUaeU3PrI3H/NxOGq1/428XWZnVowWr6fe2f+7DcXBK39tO6EeVnKV+ZU8Jo1do7PhZkEEIY34aNTVjFIH4lNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZR9JCXd6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC29C4CEF1;
	Fri, 23 Jan 2026 13:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769176791;
	bh=bOwB+6jFlQ7iSC8wkTv30Rdr61wfqkVfXuMyGTo45zQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZR9JCXd6xZyxgzb7BalO7sgSdeQXuQ/yJ5xAj0Qyk6vLmNPa6JmFmhPPtEg0aSMWn
	 EVPwlM4DIV0+XUV7JgtBLX8AIFOsq/qJYAwDsTA7RY/Z1h1lZbAkcHfweccLSQsBFX
	 63FQBo0w3ajplA7z1tIN3mxU3javlWOIcg0hDT5Fyc39CEfK7QEkHXjA16L94p0iC7
	 tsuedUCMpy/6/WvYj/erJ633pPrd3AkFueLWWqEBvlBgr5Zv+r6gCMjvcVq4RVjUI9
	 l98FD3InLlGa833oEeSTNt5PEqdoszws16eUb/MV/0TkJZEYUMpQa+Ie2zK9ng7+dj
	 kOXmoqLsAE6jA==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vjHhV-000000063zU-2Gzn;
	Fri, 23 Jan 2026 14:59:49 +0100
Date: Fri, 23 Jan 2026 14:59:10 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>
Subject: Re: [PATCHv6 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <20260123145910.7b9fb258@localhost>
In-Reply-To: <f5e7f0fc-c259-4552-8513-a3862bee5c29@kernel.org>
References: <cover.1761571713.git.hverkuil+cisco@kernel.org>
	<1495ec4ccdcdfab788fa9d02e11a6028a455e31b.1761571713.git.hverkuil+cisco@kernel.org>
	<CANiDSCsJwYht4_v8B_1n2u+MxuHSo+nD5xsZ85VLujgAEEMqOw@mail.gmail.com>
	<f5e7f0fc-c259-4552-8513-a3862bee5c29@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51419-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6DC476959
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 14:42:30 +0100
Hans Verkuil <hverkuil+cisco@kernel.org> wrote:

> On 03/12/2025 13:27, Ricardo Ribalda wrote:
> > Hi Hans
> > 
> > Thanks for the new version
> > 
> > On Mon, 27 Oct 2025 at 14:51, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
> >>
> > 
> > I also prefer the original nomenclature for the roles:
> > 
> > Contributor: Anyone that posts a patch to the ML
> > Committer: Contributors that can commit (List provided by you)
> > Core Committer:  Laurent, Sakari, Sean and Sebastian  (Names in the
> > original presentation, should be updated)
> > Subsystem Maintainer: Mauro and Hans
> > 
> > In my head, a maintainer is someone that pushes to the upper tree,
> > rebases and merges. In the media-committer tree that is only you and
> > Mauro.
> 
> No, a maintainer is someone who decides when patches are ready for
> mainline inclusion and posts PRs. A committer is a maintainer who
> can directly push patches to the git tree and can skip the PR step.
> 
> Previous versions of this series mixed those concepts, which was very confusing.

The problem with this version is that it is also mixing/overriding
nomenclatures. Basically:

- a maintainer is anyone with his name at MAINTAINERS file;
- subsystem maintainer is also a clear concept.

We need to avoid more mess to the "maintainer" here. This was
clearer at the previous version, as "committer" and "core committer"
are clear concepts and won't conflict with existing nomenclature,
but now that we're splitting committer function as an orthogonal
attribute (nothing against that), we need better names for the
maintainers that are described on this profile. maybe:

- media core maintainer: for people responsible to maintain part of
  the media framework;
- media driver maintainer: for everyone else that is listed
  at MAINTAINERS with stuff under drivers/media and/or
  drivers/staging/media(*) and it is not a media core maintainer.

(*) Should the ones with drivers only at staging be placed on
    a different group like "staging media driver maintainer"?

Regards,
Mauro

