Return-Path: <linux-media+bounces-5154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A7854C2F
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 16:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF361282024
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 15:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061295C602;
	Wed, 14 Feb 2024 15:09:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07AB5BACE;
	Wed, 14 Feb 2024 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707923351; cv=none; b=eKYBMKxh3hJlGq6OXm1lVL9DdhgsjGaFVEQnfHzPQc/iiqIjrpqEoFaS/2GKaXNiz2wnfVMyNSY2n3LFH/0TJuO5D3LCe3tStilGuin9ZEE7NUX6Tzctnw4Dbhr1a2quxcWeLxQ68Wxb/ghy69zBjAZjm1IJ1e/oHhMrjeAom+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707923351; c=relaxed/simple;
	bh=M0iGHrbEWM4bnET7RmnkPdaOveYygV+hRXmW2nqXDZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMfQ5iJSjzNfFu5H2BdIyTrWO6lhk++5gpsF6TtlcqH6l9uNXhh/9kRTgxRmV7FPopPEs8kTjz0EbVrCMA6jB+aEa8Z5EeNFNgqfX4pr3kUnaoKECzWpcgaAf1h/TQvaxL+lHxcKHHWdfnpa11GZrNc9uhuLIS0pgcRgek48n3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F2EC433F1;
	Wed, 14 Feb 2024 15:09:10 +0000 (UTC)
Date: Wed, 14 Feb 2024 10:10:41 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alex
 Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 1/6] tracing, dma-buf: add a trace_dma_fence_sync_to
 event
Message-ID: <20240214101041.2fbf9b87@gandalf.local.home>
In-Reply-To: <137e8d79-bf19-4782-918e-0c09b029e3aa@amd.com>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
	<20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
	<20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
	<137e8d79-bf19-4782-918e-0c09b029e3aa@amd.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Feb 2024 13:00:16 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> > +DEFINE_EVENT(dma_fence_from, dma_fence_sync_to, =20
>=20
> For a single event you should probably use TRACE_EVENT() instead of=20
> declaring a class. A class is only used if you have multiple events with=
=20
> the same parameters.

FYI, TRACE_EVENT() is actually defined as:

#define TRACE_EVENT(name, proto, args, tstruct, assign, print) \
	DECLARE_EVENT_CLASS(name,			       \
			     PARAMS(proto),		       \
			     PARAMS(args),		       \
			     PARAMS(tstruct),		       \
			     PARAMS(assign),		       \
			     PARAMS(print));		       \
	DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));

So basically, you could really just declare one TRACE_EVENT() and add
DEFINE_EVENT()s on top of it ;)

I never recommended that because I thought it would be confusing.

-- Steve

