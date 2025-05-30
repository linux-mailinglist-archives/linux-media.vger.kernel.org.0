Return-Path: <linux-media+bounces-33689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3CAC921E
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 17:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D72A28A68
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6820235362;
	Fri, 30 May 2025 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="NMK0Ee3V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF05235079
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 15:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748617876; cv=none; b=bfrLd2mesxhvcRgM1+lo8QojWCeliYnRN6ZsW3OoAX10VGxjQ0IKkzKRi5IRq2GViIwbm2S8lemgcx8c7OR1I6CjDMhmlvaNUHecsn92vDXIxHLLOVzULdg8bc/81YgLrOLOl/lKBRWOO9XAmlnZUUP0a3T3rZ8gEV/vvjIdrKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748617876; c=relaxed/simple;
	bh=VUVCD/ySoqKyvDc8sjktwgcubFB3ymtl7QClr6VCEQc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lf7U78DSrtu1UEH2l0NYQV+lMIXBHQc2ZREI82m/8fS5S8W32JeXaOlDtxeHMS/J/uBQVdWzjcOmw0Qv9O7zQGHNJ4Iz4O0aEmI46w6ajqz2VE7Vwmh8ZRuCFS80hZGOrLMtOjsybDOU2XmUGqBb0WOT/HkJPCE5eolNyj5dY5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=NMK0Ee3V; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5b8d13f73so222296085a.0
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748617873; x=1749222673; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VUVCD/ySoqKyvDc8sjktwgcubFB3ymtl7QClr6VCEQc=;
        b=NMK0Ee3VUpbSxU881VNAup097FHGefot3iFhsRoHiW2lIFkof+ro5ico3taUPYi/oy
         M+vTMW5LQ3V74AtrDMgHOFBR3Yxu08ETVK9JHYZOU6rAsyg8PEjSDDedRGUo/r7oJcA3
         xczIU2O7Jt8jl/cVgjqTVoFbP4TUqMRPE9P87GqEj1YVdGEmJ4n7fTxW+sxloDRILZm5
         wBTp6MMUPogC4pbsUfQTSKc9qaDOTILdGwI/M9JT3Ko95+s2FBxM7ByAotRE/nddbXqg
         oXN9FYlLIdaBuIwnroO4+O9gdm+r2iiyvaxQ7YPmwGjWl9mcWErLeqQuOCGFFQjHbLLg
         nT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748617873; x=1749222673;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUVCD/ySoqKyvDc8sjktwgcubFB3ymtl7QClr6VCEQc=;
        b=sfh6rJfyrSczrQkpBCzTBGFef74+g7dLV9RoukO8sQlpHzaUN1fmIr8CBXz9wHhK6j
         9U3v1U7saqFlIrIdKINnkJ7vA0V1wp6PndHatkkxIy/opCPNer9VK79oVpl6h36/pYS6
         ZP65G/QLL+7uGCuFB6l4c1JIDxPIwYJ5xOTfUm7N1rmuQluUpukLkfJfo4HPZ1dkLza/
         6Vlg00aUwY9dL6wnNBkmNxqNkr1v+IyT0sHHBELmBJ+iLqccR7p97D6IsQCTVFOxTlYB
         NUOTG79U1R58TtvGNGANg+ApiDvsHADHNlcndhWlrmmNGHh9cVTuoXSKn0f11hO6Zy3v
         MKoA==
X-Forwarded-Encrypted: i=1; AJvYcCUKWu0oQg/eqV/3zsWDaaSrv+jMMaPb7sqzbfZi/U37TIvN96XioBNnfnDyg+pZIchD/TUH1yqdzW0Hdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoOX30TH8HdRPI2+Y1tSf4Modybw43TQn4nA2vDQx8O/INLX9j
	nNp1dBaGXWQL/lvfdQV7Sv8lb0YfCaZKqqxAcSpFQ+/QBQwJa/az2IKoWNGWB3qDVLY=
X-Gm-Gg: ASbGnctAbWcI8HZD08Jsbwf+sK8uyS4zX2fnoCy82iHAjTUYrZ9rz+HCvyTVxhogIFJ
	Llv7hcAfdfEYkA3+kvn4mJcK/XQim1JHrrHSQ80ofUjXqhk3WdmJpFPf1y4z0ILl1R2h4Rt9Jul
	IOUyJsN9gF7YdPFawgSdiMGmhwFszQnkZMHS7p8MZhhMOEJJGO954j1iOjKUEhHsiVjnq/7kgJ3
	sQqmx0qnHAEI7h1ap4xzFE+zufDz6PilXgabNKfVI6CfeoZ4g3xYkXuNWk4Z2AT/DIkSV0GQTy2
	YV7hRztm1ctUAfPT5krBak6KJeJQHRfdIas9y3jzl5oOXHrrUnFw65T83nbJoGFQkXKJKIQhREQ
	mOQ==
X-Google-Smtp-Source: AGHT+IEJ486kPrLQeLBK/QJLJ6ATy9fQp9McA4lJd6E3HgVQz/e1wJNOdHvbUuORZdjfDcMFUi8h9A==
X-Received: by 2002:a05:620a:1786:b0:7c5:d1b2:166b with SMTP id af79cd13be357-7d0a1f8c025mr654468185a.8.1748617873087;
        Fri, 30 May 2025 08:11:13 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a1a7699sm242376585a.98.2025.05.30.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:11:12 -0700 (PDT)
Message-ID: <a3acaf1aab0ff43e19ba77e1ee5d43d573e1bf5f.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] Add media jobs framework
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	mchehab@kernel.org
Date: Fri, 30 May 2025 11:11:11 -0400
In-Reply-To: <20250519140403.443915-1-dan.scally@ideasonboard.com>
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Daniel,

Le lundi 19 mai 2025 =C3=A0 15:04 +0100, Daniel Scally a =C3=A9crit=C2=A0:
> Hello all
>=20
> This series adds a new API to the media controller framework, which
> I'm calling "media jobs". The framework is intended to facilitate
> communication between separate drivers which need to work together
> to fully operate a media pipeline. For example, the need for the
> framework arose when writing support for the ISP in the RZ/V2H; the
> ISP is fed by a DMA engine which is not part of the same IP block,
> and so is driven by its own driver (though sharing a media graph).
> The ISP driver needs to be able to communicate with the DMA engine
> driver to instruct it to push the next frame. Because the DMA engine
> might be different on a different platform that used the ISP, direct
> calls into functions exported by the DMA engine driver wouldn't be
> scalable, and so this driver agnostic route was adopted. The
> framework allows drivers to define the steps that need to be taken
> (for example writing configuration data, reading statistics data,
> writing buffer addresses and triggering data transmission) to complete
> a "job" (of which the only current example is the processing of a
> frame of data through the pipeline, though I expect that other use
> cases could become apparent too) and to then schedule them into a
> work queue once driver definable dependencies have been met. The
> dependencies might, for example, be the queuing of buffers to V4L2
> capture / output devices.

This is just a first impression, about the naming of course. If you
haven't been there, Request was once called Job, so bringing back
jobs next to request looks like it going to be very confusing.

When I look at your proposal, what I see here is a scheduler, the
jobs being the abstraction of the task being scheduled. What about
going forward with "Media Scheduler" ?

I can't stop finding similarities with the DRM scheduler. I'm not expert,
still learning, but it seems DRM agnostic and possible usable even by us.
It does support dependencies, but it also support priorities. Instead of
ops for deps, uses fences. The fences are not necessarily userspace facing,
they do allow having jobs that depends on foreign job without any sub-syste=
m
boundaries. They properly abstract the dependencies too.

I would like to see your impression about this. I would also see a reflecti=
on
around non-camera use cases, since MC is no longer just a camera API.

regards,
Nicolas

>=20
> The framework allows precise definition of the ordering of the steps
> regardless of the order in which the drivers populate the jobs. Steps
> can be flagged as being placed at a particular position from the front
> or back of the queue (I.E. last, or third from last) or as requiring
> no particular order. This would allow the construction of a job like:
>=20
> Step 0 (ISP Driver): Program the hardware with parameters
> Step 1 to N-1 (Both drivers): Program the hardware with buffers
> Step N (DMA Engine Driver): Send a frame of data to the ISP
> ... ISP processes data ...
> Step N + 1 (ISP Driver): Read out statistics data from the last frame
>=20
> The mali-c55 ISP driver and the DMA engine feeding it on the RZ/V2H
> (called the rzv2h-ivc driver) both use the framework, and will be
> posted shortly after this series with references back to it. I will
> reply to this message with links to those series for convenience.
>=20
> The first patch in this set is not strictly part of the framework,
> but also facilitates multiple drivers with V4L2 Video Devices
> sharing a single media graph. We have a requirement to delay the
> start of streaming until all of a pipeline's video devices have had
> their .start_streaming() operations called; these new entity ops
> provide a mechanism through which each driver can inform the other
> that the last video device in the pipeline has now been started.
>=20
> Thanks
> Dan
>=20
> Daniel Scally (3):
> =C2=A0 media: mc: entity: Add pipeline_started/stopped ops
> =C2=A0 media: mc: Add media jobs framework
> =C2=A0 media: Documentation: Add documentation for media jobs
>=20
> =C2=A0Documentation/driver-api/media/mc-core.rst | 154 +++++++
> =C2=A0drivers/media/mc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
2 +-
> =C2=A0drivers/media/mc/mc-entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 45 +++
> =C2=A0drivers/media/mc/mc-jobs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 446 +++++++++++=
++++++++++
> =C2=A0include/media/media-entity.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 ++
> =C2=A0include/media/media-jobs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 354 +++++++++++=
+++++
> =C2=A06 files changed, 1024 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/media/mc/mc-jobs.c
> =C2=A0create mode 100644 include/media/media-jobs.h

