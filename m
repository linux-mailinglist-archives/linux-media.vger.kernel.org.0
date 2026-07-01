Return-Path: <linux-media+bounces-66182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1DO4ImzYRGr41woAu9opvQ
	(envelope-from <linux-media+bounces-66182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:05:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 121616EB705
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:05:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eCRLF34e;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66182-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66182-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30316300E276
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 09:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5683644C5;
	Wed,  1 Jul 2026 09:03:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEA93EE1E0
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 09:03:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896586; cv=none; b=o3dm3+q2I0tcx/zDMHkVgFrrKyh9FF0lTlFOsPVBM9iTIqY3RqfzO5biW/0r6pQxq/4D16UZhtkoJbI2CQdDxi/O5wrSGIY34nuunGAaenwejL9V3qy9pokpDuwlrlDgrhpzDoUheJgqVw7bTHIeyNkJz4ck/CAx/rUoHD9FL8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896586; c=relaxed/simple;
	bh=R9uULzp0C+6c8usDkmUHCpuUMCd58rIgV2Hh/1C2SdI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bWkKnuJRxEE9AWaAer6HyIGs0GmexMRNZQ1aQu6B4n+Gif+NrBH+66HZxTE4RD2nDxN72uyu4Z2N6lwoSW/EQb+6gRY1S1jHQc+StZEK5zpFoM1Gy/ohvuTlfRt7Rl/20YiONoYmLBRahKRVNDLRnkZ8DxC5i4phjt31LqejgzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCRLF34e; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A911F000E9;
	Wed,  1 Jul 2026 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782896585;
	bh=+Y4fC8ZtSFnU7d7Z3vzJwUYZFX7DbcdhPfRjFOCgpK4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=eCRLF34exSpjKMPq3zo6vOvUDSCmhp5vmTwxJAuRAIvKqaVZL0AhgSw9irk9HWQ8U
	 BGdSGbYriwdRu5c60jV3xvlLzpXh4Xtsncmb6s64aJmxD3bl7+ZvFcYMYDfCzXhRJY
	 GK4vzvbUcY9I3gcvRjxhIeyBnHeb/io7YdFRmy8AN4PUYNa/4UqHB2CybBCEZ7vgUy
	 +oDdbs6YUmmC7pdQxK3j9VDrKy/T/afqh214L9ZUZaGj6RDQBcHR3h8He8oIhVVAb4
	 XxmeN/ZFQ39V1vG91rTnZP7nQdrRGFRij9gwlqcQzVGodMnqtGrfl1T1Z3UTmDAEhY
	 mKBD9v0TIi9AQ==
Message-ID: <440e969e-425a-4ed1-9aaa-85addb332278@kernel.org>
Date: Wed, 1 Jul 2026 11:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: v4l2-ctrls: document expected validation scope
To: Linus Walleij <linusw@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
References: <20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66182-lists,linux-media=lfdr.de,cisco];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:laurent.pinchart@ideasonboard.com,m:vincenzo.frascino@arm.com,m:jacopo.mondi@ideasonboard.com,m:nayden.kanchev@arm.com,m:Konstantin.Babin@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 121616EB705

On 01/07/2026 10:11, Linus Walleij wrote:
> After discussion on the mailing list it became clear that these
> validations are not expected to be exhaustive.
> 
> Link: https://lore.kernel.org/linux-media/20260629133209.GG3054459@killaraus.ideasonboard.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index b8698b85bd80..58184b6e386f 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -118,6 +118,18 @@ correct. This prevents the situation where only some of the controls
>  were set/get. Only low-level errors (e. g. a failed i2c command) can
>  still cause this situation.
>  
> +The validation of controls is not expected to be exhaustive, for example
> +custom controls under ``V4L2_CTRL_CLASS_USER`` would become very voluminous.

CLASS_USER has nothing to do with this. I'd rephrase this as:

"...compound controls can be very complex."

> +The expected behaviour is to reject settings that could:
> +
> +1. Pose stability issues, such as turning the hardware unresponsive requiring
> +   a hard reset, such controls must be rejected.
> +
> +2. Pose security issues, such as compromising unrelated kernel-contained
> +   data to userspace.
> +
> +Extended validation of control values should be performed in userspace.
> +

I don't like this. If drivers do not validate controls well enough, and so allow
stability or security issues, then that's simply a bug. Ideally that check is done
when the controls are set, but this is not always possible. Sometimes this is only
possible when e.g. streaming is in progress.

And what "Extended validation" actually means is rather vague.

I would actually prefer to make some changes elsewhere in this file:

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b8698b85bd80..d78328152b75 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -72,12 +72,6 @@ partial array, all elements have to be set or retrieved. The total size
 is calculated as ``elems`` * ``elem_size``. These values can be obtained
 by calling :ref:`VIDIOC_QUERY_EXT_CTRL <VIDIOC_QUERYCTRL>`.

-To change the value of a set of controls applications initialize the
-``id``, ``size``, ``reserved2`` and ``value/value64/string/ptr`` fields
-of each struct :c:type:`v4l2_ext_control` and call
-the :ref:`VIDIOC_S_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` ioctl. The controls will only be set if *all*
-control values are valid.
-
 To check if a set of controls have correct values applications
 initialize the ``id``, ``size``, ``reserved2`` and
 ``value/value64/string/ptr`` fields of each struct
@@ -86,6 +80,15 @@ initialize the ``id``, ``size``, ``reserved2`` and
 values are automatically adjusted to a valid value or if an error is
 returned.

+To change the value of a set of controls applications initialize the
+``id``, ``size``, ``reserved2`` and ``value/value64/string/ptr`` fields
+of each struct :c:type:`v4l2_ext_control` and call
+the :ref:`VIDIOC_S_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` ioctl.
+:ref:`VIDIOC_S_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` will implicitly call
+:ref:`VIDIOC_TRY_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` first and return an
+error if that fails. So the controls will only be set if *all*
+control values are valid.
+
 When the ``id`` or ``which`` is invalid drivers return an ``EINVAL`` error
 code. When the value is out of bounds drivers can choose to take the
 closest valid value or return an ``ERANGE`` error code, whatever seems more

The main change here is that it explicitly states that S_EXT_CTRLS implies
a call to TRY_EXT_CTRLS is called. Something that was never clearly stated
before, but it's important to know this. Because of this change the TRY_EXT_CTRLS
and S_EXT_CTRLS paragraphs are swapped since S_EXT_CTRLS now refers to
TRY_EXT_CTRLS.

And the TRY_EXT_CTRLS documentation already says that: "It is up to the driver
whether wrong values are automatically adjusted to a valid value or if an error is
returned."

I just saw Jacopo's reply that the discussion was for parameter buffers, not
for extended controls, but the reasoning is the same: the driver must validate
at some point (ideally when the buffer is queued up so userspace gets the error
immediately), and ensure there are no security or stability issues. But if there
are, then that's just a driver bug.

Regards,

	Hans

>  .. tabularcolumns:: |p{6.8cm}|p{4.0cm}|p{6.5cm}|
>  
>  .. c:type:: v4l2_ext_control
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-v4l2-doc-c60195d38d00
> 
> Best regards,
> --  
> Linus Walleij <linusw@kernel.org>
> 
> 


