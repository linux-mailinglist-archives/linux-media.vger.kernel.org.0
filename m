Return-Path: <linux-media+bounces-67555-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2bn/JN4PVmrBygAAu9opvQ
	(envelope-from <linux-media+bounces-67555-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 12:30:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07C7536B1
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 12:30:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67555-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67555-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71549302EEB6
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 10:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E4E370AE7;
	Tue, 14 Jul 2026 10:28:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77ED364038;
	Tue, 14 Jul 2026 10:28:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024899; cv=none; b=vFUzZ587j2YSEs/SxY6wLDBtAdSqiULoUxZGMiXykTnrv0M7sWUBEk3BNA8VRT1EC+hm0HhxBWZjCi6L6KgHeFlGHsYmDOgJVEnEY8dh0of4lAUnkginLN++g4xBmjjgHO3eta+EDnhlKieBOAUc//caCkN2ZEX6bl0gpFzg6M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024899; c=relaxed/simple;
	bh=Z7jMdt1lQgWD9x0ibyUtxdvDazVsQ8MyR8kjqNUtrQg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L9AQtCQNRhuNMYj2bGz7s4G4HV3ZnerAS5lxkr+Lb+GkVG3LptglKrvM2hp76EY1q1TeY10kI5hxb1fIOV+ueXAsaZllXlzNKKFCyI4GklB9MW+Ork1q8Nd2SLuGWPgkqzsW/D5BlCFzh0kl/eRnVk6iTjAX8reudu0XrGqSjZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 52E45140308;
	Tue, 14 Jul 2026 10:28:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 0249E20025;
	Tue, 14 Jul 2026 10:28:13 +0000 (UTC)
Message-ID: <54ae65ff1286e2192b5a6575277e347469d4c44b.camel@perches.com>
Subject: Re: [PATCH 1/1] checkpatch: Deprecate V4L2 pipeline power
 management code
From: Joe Perches <joe@perches.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org,  Andy Whitcroft <apw@canonical.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hans@jjverkuil.nl
Date: Tue, 14 Jul 2026 03:28:13 -0700
In-Reply-To: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
References: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: xmfec7spatuo1g4zktew886tzq6c3whk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19uIil6KtO762kAvDjb7kuZQ2NReEX9XDE=
X-HE-Tag: 1784024893-759597
X-HE-Meta: U2FsdGVkX18uLo1E7NDu02dPHgMGPxA58yQwfLZhNdnkIVbjHU4EXvX6M64+Gn/XTMmB35YKl+Pcz8vrFkDOiz8W9amiNwlxSQusrC3YjmYO9bxqgO1il6j3BO6mk/OouwbhfUsEWX8T1h+4XKBv1RdE9Pm84KUfmK3+o3iWyxndo8BVgFA0hS7jxIyQaQEf0rlw2nopgWIgDe/VazmIsE66LQspfMUyGGva+jvQGYJo/wNsmRAqNVxEEY612mktz1mGZHh/N9bDLqZllX/889z04LfI2Op6bf0A0isssdxthsx3QpaCP4a8a6SAUsYV
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67555-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,perches.com:from_mime,perches.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF07C7536B1

On Mon, 2026-07-13 at 19:13 +0300, Sakari Ailus wrote:
> The V4L2 pipeline power management code, in particular
> v4l2_pipeline_link_notify(), v4l2_pipeline_pm_get() and
> v4l2_pipeline_pm_put() are deprecated and shall not be used in new code.
>=20
> The drivers need to use the Runtime PM instead.

Nack. Say that in the error output.

Given this patch, checkpatch's message would be something like

"Deprecated use of 'v4l2_pipeline_pm_get', prefer '' instead"

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -879,6 +879,9 @@ our %deprecated_apis =3D (
>  	"DEFINE_IDR"				=3D> "DEFINE_XARRAY",
>  	"idr_init"				=3D> "xa_init",
>  	"idr_init_base"				=3D> "xa_init_flags",
> +	"v4l2_pipeline_link_notify"		=3D> "",
> +	"v4l2_pipeline_pm_get"			=3D> "",
> +	"v4l2_pipeline_pm_put"			=3D> "",

Add something like "v4l2 runtime power management API" instead
At least point out what that is.

And in today's '-next' there's seems to be no indication in
documentation or code these calls are deprecated.

