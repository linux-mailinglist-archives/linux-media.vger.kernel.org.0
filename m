Return-Path: <linux-media+bounces-10480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0650C8B7D66
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 18:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8844E1F23234
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 16:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE6817B4E1;
	Tue, 30 Apr 2024 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="nYYPCpFx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33609DDBE
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714495595; cv=none; b=RoxrbxG8V6+akbXg50gjdSWesym/wsvXn57bDuY0yI5A1k1NmZrxCm7L+1hF+GJrNMeELevX8wnvQEURp23tzMlxDVe8aBZwNSzpIWCDciNNLmHAax92Zli9cwk4o0QGtWDsDiqpMxB7482bwBuEv14VgaYpIRtlm6JILN8fRm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714495595; c=relaxed/simple;
	bh=Ff+C2tZT0M8cEKuqkPf/Z9qM54zwYFmeO7QdBe0RhjA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TQudEJTibt6w/fC4TXz+40RcLtpDfiSV4alRR59JOIEnBNxpl/Kqz5dITmikdTFXP+VIsHy+epnCnxkgMkBkTXNFZZbYTVvtm2yfY3ot0Dmd1u3L4Z2nBzlSbcorv8RvTN7RPZJYYTyV9haNzpvHP4f18g6MEsf88/wWgQ63cdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=nYYPCpFx; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-790ff1fa7b3so165636885a.2
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1714495593; x=1715100393; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rn+IhGhAZSRveiDJAFFfgLCX4zScoPQ59f4XApi9YUM=;
        b=nYYPCpFxmKiriIrG4RjRRyXcppLKp5cEmWBaM2HQ52V9ehUjAeWs/0j9kDAsPThhTv
         qLfsF/IweV5I7X4Q1VHDezwlhrZRZhLzgikCDZkW1tb/MgoLb+VXSVKNyk5m5YysRkFW
         hUu5eohIcyQrmltpDeH8MzrOiv7iz9iL+lVt60+8OUNNcp8TXDyC+sonfNK08cTkQh7r
         N/SCU/3tg3a3j0yKgrQPFQPU7Sxw3xP/TmjxvSn23bJLznO/7AsymtnVGVI0TZbMAHu/
         vSGjZxBE12JSiTyurcqS9D7SqhCD7Gjvhk3X/KRKlZMmQI8H+dZypvHHBNEtIHcMDecD
         8edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495593; x=1715100393;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn+IhGhAZSRveiDJAFFfgLCX4zScoPQ59f4XApi9YUM=;
        b=qPChR22Tf+I+bP/UgdDFJuZVSYsjYNiKEGqHmIEEyztIK4vFCz2yJLGfX70Z3dJmvf
         iA7bsIq/RRsWIpkSr16gONTZlzx3xHyHtidraFmXJ7gcqHwch8t9FyF7oElb8+1L2PfC
         H/f23NviEBtSYOYLl/TbQgMEMO8DIFMQvFJBr1kZywUL2defQo5hjS8nM+OXnPR8GmKm
         BP4w6iIeL3UEp809RqSdFqR/gcvoY7UfaZjGh1tvdtMhbENJ6BRF8oiXFGdIdpnEN2B5
         xDUQUw3/16L0TOFdKQbtYF8IZBV3W+tS6SILowrGOIubGmlXYGw6CGvuLeO5Ai+uXJkT
         1k3Q==
X-Gm-Message-State: AOJu0YwE7zxQmc0jiTjXBwZZbwzmvTem5Twd2RF9jcJxgCo0266T5Rzp
	4IVqT2eAFj7wslsIjaYDA+vShStAjI7EL8FFw3ZDpe9lo1eFj3J4VQuQ+g66FXU=
X-Google-Smtp-Source: AGHT+IFX2Eizu/CT4NXlhJ0dFQVo/1WkbBS08K+1/8CezLMby1skwWHSYOP6KQQ4BasUM+PP2i461g==
X-Received: by 2002:a05:6214:21a2:b0:69b:2523:fcd3 with SMTP id t2-20020a05621421a200b0069b2523fcd3mr11683584qvc.60.1714495592841;
        Tue, 30 Apr 2024 09:46:32 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id v5-20020a0cf905000000b006a0d1d120cesm1804619qvn.125.2024.04.30.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 09:46:32 -0700 (PDT)
Message-ID: <77872a349e77e61e69f160629e1b53a97bc472e4.camel@ndufresne.ca>
Subject: Re: Discuss the multi-core media scheduler
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Date: Tue, 30 Apr 2024 12:46:31 -0400
In-Reply-To: <3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com>
References: <3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Daniel,

Le dimanche 28 avril 2024 =C3=A0 15:26 -0300, Daniel Almeida a =C3=A9crit=
=C2=A0:
> Hi everyone,
>=20
> There seems to be a few unsolved problems in the mem2mem framework, one o=
f
> which is the lack of support for architectures with multiple heterogeneou=
s
> cores. For example, it is currently impossible to describe Mediatek's LAT=
 and
> CORE cores to the framework as two independent units to be scheduled. Thi=
s means
> that, at all times, one unit is idle while the other one is working.
>=20
> I know that this is not the only problem with m2m, but it is where I'd li=
ke to
> start the discussion. Feel free to add your own requirements to the threa=
d.
>=20
> My proposed solution is to add a new iteration of mem2mem, which I have n=
amed
> the Multi-core Media Scheduler for the lack of a better term.
>=20
> Please note that I will use the terms input/output queues in place of
> output/capture for the sake of readability.

There is one use case that isn't covered here that we really need to move
forward on RPi4/5 is cores that can execute multiple task at once.

In the case of Argon HEVC decoder on the Pi, the Entropy decoder and the
Rescontruction is ran in parallel, but the two function are using the same
trigger/irq pair.

In short, we need to be able to (if there is enough data in the vb2 queue) =
to
schedule two consecutive jobs at once. On a timeline:

----------------------------------------------------->
[entropy0][no decoder]
                      [entropy1][decode0]
                                         [entropy2][decode1]

Perhaps it already fits in the RFC, but it wasn't expressed clearly as a us=
e
case. For real-time reason, its not really driver responsibility to wait fo=
r
buffers to be queued, and a no-op can happen in any of the two functions. A=
lso,
I believe you can mix entropy decoding from one stream, while decoding a fr=
ame
from another stream (another video session / m2m ctx).

Nicolas
         =20

>=20
> -------------------------------------------------------------------------=
------
>=20
> The basic idea is to have a core as the basic entity to be scheduled, wit=
h its
> own input and output VB2 queues. This default will be identical to what w=
e have
> today in m2m.
>=20
>  input        output
> <----- core ----->
>=20
> In all cases, this will be the only interface that the framework will exp=
ose to
> the outside world. The complexity to handle multiple cores will be hidden=
 from
> callers. This will also allow us to keep the implementation compatible wi=
th
> the current mem2mem interfaces, which expose only two queues.
>=20
> To support multiple cores, each core can connect to another core to estab=
lish a
> data dependency, in which case, they will communicate through a new type =
of
> queue, here described as "shared".
>=20
>  input           shared         output
> <----- core0 -------> core1 ------>
>=20
> This arrangement is basically an extension of the mem2mem idea, like so:
>=20
> mem2mem2mem2mem
>=20
> ...with as many links as there are cores.
>=20
> The key idea is that now, cores can be scheduled independently through a =
call
> to schedule(core_number, work) to indicate that they should start process=
ing
> the work. They can also be marked as idle independently through a
> job_done(core_number) call.
>=20
> It will be the driver's responsibility to describe the pipeline to the
> framework, indicating how cores are connected. The driver will also have =
to
> implement the logic for schedule() and job_done() for a given core.
>=20
> Queuing buffers into the framework's input queue will push the work into =
the
> pipeline. Whenever a job is done, the framework will push the job into th=
e
> queue that is shared with the downstream core and attempt to schedule it.=
 It
> will also attempt to pull a workitem from the upstream queue.
>=20
> When the job is processed by the last core in the pipeline, it will be ma=
rked
> as done and pushed into the framework's output queue.
>=20
> At all times, a buffer should have an owner, and the framework will ensur=
e that
> cores cannot touch buffers belonging to other cores.
>=20
> This workflow can be expanded to account for a group of identical cores, =
here
> denoted as "clusters". In such a case, each core will have its own input =
and
> output queues:
>=20
>  input      output           input      output      output=20
> <---- core0 ----->          <---- core1 ---->     ------->
>                                     <---- core2 ---->
>                                     input      output
>=20
> Ideally, the framework will dispatch work from the output queue with the =
most
> amount of items to the input queue with the least amount of items to bala=
nce
> the load. This way, clusters and cores can compose to describe complex
> architectures.
>=20
> Of course, this is a rough sketch, and there are lots of unexplained minu=
tiae to
> sort out, but I hope that the general idea is enough to get a discussion =
going.
>=20
> -- Daniel
>=20


