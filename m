Return-Path: <linux-media+bounces-67561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fXapB18oVmox0QAAu9opvQ
	(envelope-from <linux-media+bounces-67561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:15:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B75754601
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:15:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67561-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67561-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2575F30E3C70
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 12:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DAA3A6B6D;
	Tue, 14 Jul 2026 12:11:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC039B970;
	Tue, 14 Jul 2026 12:11:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031087; cv=none; b=GyvRRZNGxjZGZfVfWT2tgYM33M/5aGEbiaurkxj/7Y791j6DNoY1h20a/fS1bIue0RkWTM2olnUMxBhkjb2caTaEGGYgUcPSEaZNeJ4+/5yQKfcpoO0MmAJsNSE9+TQ3WBOHcK51RPojJ5+fR5ux4WMh+FDbQ7jXbOD54Rwnjuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031087; c=relaxed/simple;
	bh=O2QnN5ChhXWQNmFMBh+60tj96GJXERFa3E048iXmwiQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYR+UQO1XogvWMR/NYDhXsOMXzad8ihfhvbM4T8WGAgiC5KVTVuqGDNXMDS1jLJ0KTG4kZv4GMZfFuWIQiGl31tFcx7M/9CS0PrAqQ2biTivIEkUv5zulJmK54Zo6Qr0JM2zZWqG/fFgJ+OZHzUJ35mRTAkAMiVZ3Pm2aZaiYX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 4334316039E;
	Tue, 14 Jul 2026 12:11:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 1CB963D;
	Tue, 14 Jul 2026 12:11:18 +0000 (UTC)
Message-ID: <3e7b6acec459836275940908320db45a84f170b7.camel@perches.com>
Subject: Re: [PATCH 1/1] checkpatch: Deprecate V4L2 pipeline power
 management code
From: Joe Perches <joe@perches.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, 
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hans@jjverkuil.nl
Date: Tue, 14 Jul 2026 05:11:17 -0700
In-Reply-To: <alYaJNtPID_c3eZn@kekkonen.localdomain>
References: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
	 <54ae65ff1286e2192b5a6575277e347469d4c44b.camel@perches.com>
	 <alYaJNtPID_c3eZn@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: g6d9wmjfcakgrxcy9jrd17wcpx1pujzk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/k9+EGrc2nnpm3fBgaBtFgVYRvyQXBofQ=
X-HE-Tag: 1784031078-325384
X-HE-Meta: U2FsdGVkX18AhRnt8AiOuD3FW2hohlPAieRsTpz0FXVWmakKirpHg0JHeLAfKiqDrwC4IYHeqSeQXLBTEiQsfgzItZt6MnHbEPKw7al79LaNPmvnnYmvflQ1nMHVUuV1v37CVYmx3V64IaO5XgFoLM1JVrDK30OH6DScP66Z1gd49DfL2MWZ5BuLNWGpyc/lQurwsEDzcRSCoqCWlvZYh/4czqacWCgrfg1XMuhIVooBLO+JvnaETUNeXvaxYAkl38YDm3hWW6uh1B++QGmuO4qyEED/Hg6/BHymbyDYzcRTLBqP0zKbqTlFrLfpL6jE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67561-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[perches.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:apw@canonical.com,m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hans@jjverkuil.nl,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[joe@perches.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86B75754601

On Tue, 2026-07-14 at 14:14 +0300, Sakari Ailus wrote:
> > Given this patch, checkpatch's message would be something like
> >=20
> "Deprecated use of 'v4l2_pipeline_pm_get', prefer '' instead"
>=20
> That's even technically correct: these functions serve no useful purpose
> anymore, all new drivers effectively use Runtime PM anyway.

OK, but given that there are only 32 uses in 16 files in all
of -next, why not just fix the uses then delete the functions?

$ git grep -P -w 'v4l2_pipeline_(?:link_notify|pm_get|pm_put)' | \
  grep -vP '^(?:include|drivers/media/v4l2-core)' | \
  wc -l
32

$ git grep -P -w -l 'v4l2_pipeline_(?:link_notify|pm_get|pm_put)' | \
  grep -vP '^(?:include|drivers/media/v4l2-core)' | \
  wc -l
16

> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > []
> > > @@ -879,6 +879,9 @@ our %deprecated_apis =3D (
> > >  	"DEFINE_IDR"				=3D> "DEFINE_XARRAY",
> > >  	"idr_init"				=3D> "xa_init",
> > >  	"idr_init_base"				=3D> "xa_init_flags",
> > > +	"v4l2_pipeline_link_notify"		=3D> "",
> > > +	"v4l2_pipeline_pm_get"			=3D> "",
> > > +	"v4l2_pipeline_pm_put"			=3D> "",
> >=20
> > Add something like "v4l2 runtime power management API" instead
> > At least point out what that is.
>=20
> How about simply "Runtime PM"?

Better than nothing IMO.

