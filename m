Return-Path: <linux-media+bounces-55890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIztHJHht2lDWwEAu9opvQ
	(envelope-from <linux-media+bounces-55890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:55:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 80415298505
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 938D83002D15
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8593909AA;
	Mon, 16 Mar 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HaGSGGqy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jyisup4R"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124DA38F658
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658508; cv=pass; b=Ips/2040QRewelkKMlJsJ+fGks14/y2iVPsdIH/bzcdFRqYO+uSC1imrOzXzeFL80czv7mWKfG9fdst63Q4B1YaAvDhQgpj8uWeu71Egrhbq+gsgelkVrj2K3xjwZ9zrKJrlLyi4zcSyiyx1XkZA/f9NqyCucnn+Nw6fUTKWudo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658508; c=relaxed/simple;
	bh=PENpEpatLH0WgmJ8nuINA9vJeOA32NMCLpwxPNCjmic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsHDabXwaTarNDTRcfIS/vBKXI6/Glgbnk7ABzcw9ZfsEwC4l8gsftdBwMUIuW4L3PI/87VH6U8oRtRG4zT+1gI3Ys+9qUhNa7oMaoN/8Fncc1z/Sib1/g3gjEPgNTkU6hd9bxrHhCBvOKg9Igz4XXxN2kaAfQ6yt3AK0h0/8DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HaGSGGqy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jyisup4R; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773658505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/4AllVOKh8z4TecylNv9BZB3czFOIQzZj3H/I9GZN8=;
	b=HaGSGGqyqNoof3Zy7y+eQNFzjoTXW0vtCtSIvGUpyOha2YVjkbhCCul/gYrsRmYCZ1atdf
	xQ3XqLxoGgvUkxVkgv0wJeZTNJHvCqWSY3Bs0g2oMXhTCyyAR0E/PdM29OP4I/+JHpDGRD
	8jzhMTWWrd68PYOpc4IXtzmwkqkgmL8=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-0L5BtaAOMTWeQ2ypeeCN0A-1; Mon, 16 Mar 2026 06:55:04 -0400
X-MC-Unique: 0L5BtaAOMTWeQ2ypeeCN0A-1
X-Mimecast-MFC-AGG-ID: 0L5BtaAOMTWeQ2ypeeCN0A_1773658503
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-64ad18e7ffaso6942134d50.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 03:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773658503; cv=none;
        d=google.com; s=arc-20240605;
        b=lFd5T4D4FN2SUTtd8ObgYi0JauSv6xWWyzGVQdedtAMCIMRREv/AhZ+0DPmzva9Phk
         ua9CeaQaTYfZ8ocY5NjQRcUiLTNAaiYQt9kusiW6p3LeOk7INZfWlqWeqkpGnRpEfY6a
         XMaNb20FW0EokoQnkW0u/Rii/44xMW3Q6jfwLGNtla6C/hUmqOKCgTsO9ZzUpYjcMn88
         Fm6rUGek3KrCBRQ4xtXXr3z1jHqxI7Sbbt29vvje3kmA53No5ObrRobKFlTMn/Dwr5Bb
         eixRghGzNqkQstIUik1VmNwFngxQifgK0QXiHMZJssyBRLdvvW5yWvCjYFwEke52uhwZ
         858A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/4AllVOKh8z4TecylNv9BZB3czFOIQzZj3H/I9GZN8=;
        fh=B6/m9m3msN3SzGaTx4aUUl2FqtUZKmgnA0lMnFJQqDo=;
        b=FzYWrMCK+48nsN5xxy9KgRbpYHMuGsIq/37wmMh6fU/UqN/gyQWTrFAFSVf56nFH7h
         6KNWKrqUofJ1In0tlcGbnDV28UsKVHC9eTCCmK4IcJhnjyvGHIhNmoB8j5Q8ZynxAsTe
         KNj/bSOMIvBn9vGr2p0TpYFnLmDSxMXzPC60u5I0meEV7XniWJvbMhGZUX+qlCzGiPRl
         4Rks1TqBu42VMnCAJahCbJNo64vSmec/z8Y57M9cI4vINDhTuLuCof4xpmrHJWi1uYtY
         HSVAlB6+IH+ACvLbF/62YKFNcQY2kHn9UWponyrP+ZN2sjufCPnfgVskjEEQvBLARZeg
         uQLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773658503; x=1774263303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/4AllVOKh8z4TecylNv9BZB3czFOIQzZj3H/I9GZN8=;
        b=jyisup4RP0zLN67GpUM8espMWmKxjaknfhj53x+FKhqaDgN03OAc2StAD20sOpK0zx
         ys1uOwlLaTf8AChqX+k/3mZxZV1RtkTwraz2M4JsJepZxUcYOU/AaICeiBW5vxfxGN36
         oaIgjNmgdil2pCyW3lofgS1zvVq4QsF0vUTl8eF9/MAwAVEvxNqkg6eFGoDVtqA/qF2E
         YcaHxCl9Cvl88JsYcOczKXisYrCJ/u95V3VU3BGDotUiv5sPfrgbpoDeW4hgpSaPTlSe
         zFEmI61QLTkUFOELFdPi59a+yqnHdGSJPJADrVji79RFsYhBHfSLagltZn1W7s2COMHC
         bcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658503; x=1774263303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/4AllVOKh8z4TecylNv9BZB3czFOIQzZj3H/I9GZN8=;
        b=dcZf7ax4BXylAMqy2yj2wmxc553MXZuQ+2XMpR3DAXkn52ubHtH9Hx7ehT7eFHZRut
         MWcYigdhOiaA7tIhoNzaPJ4eTvS8zs/a9uX0qc4XXEe+CWTCqDF50w1IylQnFXq5kwYQ
         NtzKV2rwOaJGZsIqLMewo0dz/B4USRibvSD7S7W6dGOoPpcTufKNCetjSLOKmAmdDQee
         q/Yee9KK8UCnxuZIo/eJ1/fDXt5se4td5x1qHA76fWmdZM1sKL87zb5PqZPAcG/ZYh2v
         isYP4d4tRkUVmw15/EX4bfdTc2X3xrTa2chRerez05uzIRInmw91U3H4OFNNdRUOgFYa
         A98A==
X-Forwarded-Encrypted: i=1; AJvYcCWvkeCWY2kJlSSTORJLzwL6iyjqmA+wfO4Gn6qEczIBDJkRGpw1u0sa5mog3HqCnubfL83r6Z6A04hgWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrcitHIaAyEGaJWliT2N0I0ngLT7lkDXIFeDNIWJNrCFqSNBP7
	ZLo7QlWT69S/U4RDH2cbVnPBpu4nyFdGVD8bvT/3fFXeljJaYzXplOj3TZCapzqG9EzXcOFQNKp
	TKvTMKAC2ewSJyl9IrlT/5fyS3ksrBrAsN4g39BwbqBk78toPRKqaDUCU/hNLJ06AYhxA57tDZb
	sYWpqbeZ+Np6ZWxeQQ6WxZZpkuq5ZjtX+Gplk4TuQ=
X-Gm-Gg: ATEYQzxK3m5LB/F2VXS7C5WTEBRYJ2O/Ud35sYAGJjrNSb9X49oEC6/55D3F4FFYFt6
	d13edW7nZ3ekJmwiX90eVBGHAfZfbwghEqbfsRShReUuin0hVchcw562+/0s4dq/4z+fiJOvaou
	3I+z5V2qfuP3Xkg4s3bD3T+mJfIkKOCEh16wxo1HQrEy8DbUDMp8aJ/3xHWrF8T+GiYasBjbhwr
	A==
X-Received: by 2002:a05:690e:449a:b0:64a:db50:fab2 with SMTP id 956f58d0204a3-64e630d964emr9195121d50.80.1773658503292;
        Mon, 16 Mar 2026 03:55:03 -0700 (PDT)
X-Received: by 2002:a05:690e:449a:b0:64a:db50:fab2 with SMTP id
 956f58d0204a3-64e630d964emr9195107d50.80.1773658502956; Mon, 16 Mar 2026
 03:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
 <20260306-b4-dmabuf-heap-coherent-rmem-v3-3-3d00d36c9bc4@redhat.com> <20260313230629.GA3603067-robh@kernel.org>
In-Reply-To: <20260313230629.GA3603067-robh@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 16 Mar 2026 11:54:51 +0100
X-Gm-Features: AaiRm51o4lEgIIRwy7J8EQU-dh_zU9bcODR7YayBvstmpxh8vjYCQuobudoxI8I
Message-ID: <CADSE00JymMjob5J02bh+YSw+2zyjx8OWxks5aEhuM2GX8ZB7=A@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] of_reserved_mem: add a helper for rmem device_init op
To: Rob Herring <robh@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, mripard@redhat.com, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55890-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80415298505
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 12:06=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Fri, Mar 06, 2026 at 11:36:34AM +0100, Albert Esteve wrote:
> > Add a helper function wrapping internal reserved memory
> > device_init call and expose it externally.
>
> Why?
>
> The diff tells us what. The commit msg needs to tell us why. Maybe the
> rest of the series explains it, but this commit needs to stand on its
> own.

ACK.

This patch prepares for the heap implementation in patch #4, which
uses the new helper function. I will add the information to the commit
body.

>
> >
> > Use the new helper function within of_reserved_mem_device_init_by_idx()=
.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
>
> Version history?

You mean track it in the commit body? History is already detailed in
the cover letter.

>
> >  drivers/of/of_reserved_mem.c    | 68 ++++++++++++++++++++++++++-------=
--------
> >  include/linux/of_reserved_mem.h |  8 +++++
> >  2 files changed, 52 insertions(+), 24 deletions(-)
>


