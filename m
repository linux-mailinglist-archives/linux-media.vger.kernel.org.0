Return-Path: <linux-media+bounces-64181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LwaENAi1JmoybgIAu9opvQ
	(envelope-from <linux-media+bounces-64181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 14:26:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E49656252
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 14:26:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aexewLCD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64181-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64181-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 897523021586
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 12:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D8C3783D1;
	Mon,  8 Jun 2026 12:21:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8B0379C44
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 12:21:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921302; cv=none; b=cbIEhm9Cmr3PIDQKf+zutRV85+TLsnlWcN7gppnWUlgfoYNg9oeTzriWTEAlrxru2ebLh3JW/ZmMjko2R5lzcrOZSp7sRm3IXK+Hb8y6qH1YntE2xpiU/mWybz4zIBiwheF+92nrisefLCtSntlqiICjYH7YGnc72Ld7nf6ETJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921302; c=relaxed/simple;
	bh=4x97u10WPQA6igiQIJfTndpOIGYqMwn0Ex4yNJjfw98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=saSeRgWckUaXKjQuZYrcz6oeESu797UDmN7vtplqJmVmDVVuCRh5I1dUd2fcqxvuaNd/eUtcLkLlXMhfh02cJt6+szzL15P7sH8fyAhDMz5KAREPiVBWEFnvnZhJHfWI3hTQTJzWghXJnWPwFZ091K2Grc5n4fKutVqCRB8miVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aexewLCD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721A41F00893
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780921301;
	bh=4x97u10WPQA6igiQIJfTndpOIGYqMwn0Ex4yNJjfw98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aexewLCDY6oJNDyREF8cyw1g40n1YhP7Wq+o32uj2sK2/GLfvHsKcPuBO3qQtF8wj
	 le08HK2JviZaeV5GKT3LqOqyDfuYOQT0v+JbvtGHjo5zbNyXuFH37VxUcaM/L45pEI
	 KJYvZIGIjOqqZ9sNek3NE6V2pMRg2G8Uy97vP375tp3BG4Ex7031pc+EN9VBMDW2Qf
	 ZoFeX+/5CK0sbPlii44YdzVLQXLQMU2fK+Iy9D/gk0egrKxWIrk7rw5Dh2qPtoy93D
	 vekXhMDijXTXTVqArNevW6+gCiVLFFrIYWluz5QSkMX+Zc9MGQ8/K0FTFkMpILIrGI
	 SsXuW5h2kSUgg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3967717c951so43509471fa.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9VkzRjzMEXdOC771k0ajztD+dNQNjPLOxcoPKSAVQeSPbkvF693rDZctgL+5O3kD+i6SmfTYd3b8j9cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiRXvO/vS61L//0KRS3ZEHvodTwiX8tX5pQkrkAQBW0DZpzNfQ
	ApRj+Q6ndzz9MaWRpEkDzexENheN8dwq/c+GoDFf7XIXuPRjEilCZeXSgpFx9o1n3CIcEBMisWU
	T6tJmo33Yv00BK37bXrjnt/fn4I1CPY0=
X-Received: by 2002:ac2:5fe9:0:b0:5aa:7083:51bc with SMTP id
 2adb3069b0e04-5aa87c23b43mr3237125e87.43.1780921299797; Mon, 08 Jun 2026
 05:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601194040.18223-1-miguel.vadillo@intel.com> <ah_bFVtDCzWPeE4z@kekkonen.localdomain>
In-Reply-To: <ah_bFVtDCzWPeE4z@kekkonen.localdomain>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Jun 2026 14:21:21 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h-wOi7atHzTpFmCgC-P3qRzG9d-941MCzXd=kzTbkQeg@mail.gmail.com>
X-Gm-Features: AVVi8Ccx4p9jSrFAw2U3kSbJtqpFb6_IQjpRfiURo9dQDT_HL2qhpP5vB07XXOE
Message-ID: <CAJZ5v0h-wOi7atHzTpFmCgC-P3qRzG9d-941MCzXd=kzTbkQeg@mail.gmail.com>
Subject: Re: [PATCH] ACPI: scan: Honor _DEP for Intel CVS devices
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mehdi.djait@linux.intel.com, wei.a.xu@intel.com, 
	atul.raut@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64181-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:miguel.vadillo@intel.com,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mehdi.djait@linux.intel.com,m:wei.a.xu@intel.com,m:atul.raut@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72E49656252

On Wed, Jun 3, 2026 at 9:43=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Miguel, Rafael,
>
> Thanks for the patch.
>
> On Mon, Jun 01, 2026 at 12:40:40PM -0700, Miguel Vadillo wrote:
> > CVS (Computer Vision Sensing) is an ACPI-enumerated device that sits
> > inline in the CSI-2 path between the camera sensor and Intel IPU.
> > On platforms where CVS is present, the camera sensor's ACPI node
> > declares a _DEP dependency on the CVS device.
> >
> > The CVS driver must be fully initialized before camera sensor drivers
> > probe, because CVS controls the CSI-2 link ownership handshake (via
> > GPIO REQ/RESP), the MIPI/CSI-2 lane configuration, and the camera
> > power domain. Without CVS ready, the sensor driver can bind but the
> > CSI-2 stream will not function correctly.
> >
> > The CVS driver calls acpi_dev_clear_dependencies() at the end of its
> > probe() to unblock waiting consumers once it is ready.
> >
> > Move the CVS HIDs from acpi_ignore_dep_ids[] to acpi_honor_dep_ids[]
> > so that camera sensor enumeration is deferred until the CVS driver has
> > finished probing, matching the behavior already in place for IVSC.
> >
> > Signed-off-by: Miguel Vadillo <miguel.vadillo@intel.com>
>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> Rafael: do you think this could still make it to 7.2? Otherwise cameras
> might not work on a some laptops where they did use to.
>
> The default configuration is appropriate in some laptops so camera used t=
o
> work without the CVS driver but now that we have the CVS driver merged an=
d
> the CVS device is part of the software node / ACPI graph, probing the
> camera sensor driver will in fact not take place at all (and obviously th=
e
> camera won't work in this case).

Applied as 7.2 material, thanks!

