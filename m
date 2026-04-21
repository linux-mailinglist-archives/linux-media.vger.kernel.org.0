Return-Path: <linux-media+bounces-59232-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFo9Kgqz52no/gEAu9opvQ
	(envelope-from <linux-media+bounces-59232-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 19:25:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A86A343DEC3
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 19:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C362D3007292
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 17:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E76D2F9D98;
	Tue, 21 Apr 2026 17:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sW4Jv+O0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725432EA749;
	Tue, 21 Apr 2026 17:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792318; cv=none; b=qNUFd5g1FymgE+B4ftzX3Ao8FE19DKrvQQoapl9xFuqJmD3rD0EQFfR2CDE3nJclS89bg4bLwnPtBQre8C41FxLO1cAoyU5oj2V+FoS7ueTxQc9E8bgCHq7FPGfmxqX74nDNI+4Mwv3fhbX2vsqCuVyjKCub05Vrbb0Tf+HMXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792318; c=relaxed/simple;
	bh=RuCIFZr/SEoQ0D3uTIrq4oqnPYR8TmflVF/o8S+Gruk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwDAqiGKfFFTN9kzkH/S52ImNrfSk0kREUkZTvvuB8kMBgGVBfeYyP0dkb4PRjPDwxDnNA830YviFHYhwjP730Yd298gg3VNYJgt7iDkYVYvtAUze+AX5McJPsmfgcQLyYoHHDIh6F6rTSks111CmR0Rt7XQE5FX9YRyOSMmXqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sW4Jv+O0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F09C2BCB0;
	Tue, 21 Apr 2026 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776792318;
	bh=RuCIFZr/SEoQ0D3uTIrq4oqnPYR8TmflVF/o8S+Gruk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sW4Jv+O0e8NbDdFfaeKpFSJFMq5rUF0KDz4WVOQcS7hcsbnr9mb4PolZ8FLuLCc7y
	 +d/N/9NQLnr4SbDxumT7pS6SNMF2wzqIWO9jZyKm8PXraCfRDPsRcJZwd7fK1myJEY
	 2o906CELNg1SSLnCofg3l/vlbvWHpS4Uy4yYBcnKb3X8ZK2+jT2UHkbDOOlZkyaJn9
	 9OltzpP+iSmDiUCDuopbxdvR/+4oj/eJco1j+Lg7BjjmtGuOubmDnKTwWOYphtUChy
	 hcShGK8TypX8ZEco4q2pbAp27yZRhCr5GGxfZYJpjDTAlv2DkrS9I2D8ooOLwMtpTw
	 rwYMSlSuw2AvA==
Date: Tue, 21 Apr 2026 10:25:17 -0700
From: Kees Cook <kees@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	lrcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-sound@vger.kernel.org,
	rcu@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] Documentation: adopt new coding style of type-aware
 kmalloc-family
Message-ID: <202604211023.2D82CE0025@keescook>
References: <20260419065824.165921-4-manuelebner@mailbox.org>
 <87se8rw8df.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se8rw8df.fsf@trenco.lwn.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59232-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A86A343DEC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 04:29:48AM -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebner@mailbox.org> writes:
> 
> > Update the documentation to reflect new type-aware kmalloc-family as
> > suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")
> >
> > ptr = kmalloc(sizeof(*ptr), gfp);
> >  -> ptr = kmalloc_obj(*ptr, gfp);
> > ptr = kmalloc(sizeof(struct some_obj_name), gfp);
> >  -> ptr = kmalloc_obj(*ptr, gfp);
> > ptr = kzalloc(sizeof(*ptr), gfp);
> >  -> ptr = kzalloc_obj(*ptr, gfp);
> > ptr = kmalloc_array(count, sizeof(*ptr), gfp);
> >  -> ptr = kmalloc_objs(*ptr, count, gfp);
> > ptr = kcalloc(count, sizeof(*ptr), gfp);
> >  -> ptr = kzalloc_objs(*ptr, count, gfp);
> >
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> 
> Just to be sure, did you write this patch yourself, or did you use some
> sort of coding assistant?
> 
> Adding Kees, who did this work and might have something to add here.
> 
> > ---
> >  .../RCU/Design/Requirements/Requirements.rst         |  6 +++---
> >  Documentation/RCU/listRCU.rst                        |  2 +-
> >  Documentation/RCU/whatisRCU.rst                      |  4 ++--
> 
> This patch will surely need to be split up; the RCU folks, for example,
> will want to evaluate the change separately.
> 
> >  Documentation/core-api/kref.rst                      |  4 ++--
> >  Documentation/core-api/list.rst                      |  4 ++--
> >  Documentation/core-api/memory-allocation.rst         |  4 ++--
> >  Documentation/driver-api/mailbox.rst                 |  4 ++--
> >  Documentation/driver-api/media/v4l2-fh.rst           |  2 +-
> >  Documentation/kernel-hacking/locking.rst             |  4 ++--
> >  Documentation/locking/locktypes.rst                  |  4 ++--
> >  Documentation/process/coding-style.rst               |  8 ++++----
> >  .../sound/kernel-api/writing-an-alsa-driver.rst      | 12 ++++++------
> >  Documentation/spi/spi-summary.rst                    |  4 ++--
> >  .../translations/it_IT/kernel-hacking/locking.rst    |  4 ++--
> >  .../translations/it_IT/locking/locktypes.rst         |  4 ++--
> >  .../translations/it_IT/process/coding-style.rst      |  2 +-
> >  .../translations/sp_SP/process/coding-style.rst      |  2 +-
> >  Documentation/translations/zh_CN/core-api/kref.rst   |  4 ++--
> >  .../translations/zh_CN/process/coding-style.rst      |  2 +-
> >  .../zh_CN/video4linux/v4l2-framework.txt             |  2 +-
> >  .../translations/zh_TW/process/coding-style.rst      |  2 +-
> >  21 files changed, 42 insertions(+), 42 deletions(-)
> >
> > diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
> > index b5cdbba3ec2e..faca5a9c8c12 100644
> > --- a/Documentation/RCU/Design/Requirements/Requirements.rst
> > +++ b/Documentation/RCU/Design/Requirements/Requirements.rst
> > @@ -206,7 +206,7 @@ non-\ ``NULL``, locklessly accessing the ``->a`` and ``->b`` fields.
> >  
> >         1 bool add_gp_buggy(int a, int b)
> >         2 {
> > -       3   p = kmalloc(sizeof(*p), GFP_KERNEL);
> > +       3   p = kmalloc_obj(*p, GFP_KERNEL);
> 
> So you have not gone with the "implicit GFP_KERNEL" approach that Linus
> added.  Given that, I assume, he wanted that to be the normal style, we
> should probably go with it.

Thank you for updating the documentation! Yes, please drop the "default"
GFP_KERNEL args in all these places. (Keep the non-GFP_KERNEL args; I
see at least GFP_ATOMIC in the docs.)

-- 
Kees Cook

