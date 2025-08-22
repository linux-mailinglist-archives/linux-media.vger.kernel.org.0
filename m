Return-Path: <linux-media+bounces-40761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 758F5B319EE
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 15:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94862BA2FF2
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 13:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E713054F0;
	Fri, 22 Aug 2025 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBogr2vu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F03054C0;
	Fri, 22 Aug 2025 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870034; cv=none; b=pfkNImE2IqRhAOAtsB4fgsGwk6CfyBd0/b/4662cFnls+dlqgLMJRV9kQSfU1NqqkN4PcY8ioBsxT0wcErZN9onXAjOQKmv5Vp0xanbDp/o6ul7jD3KZ+znn0ndwSa3ipNhqLd6wtf4EVVFqKCmLJbhtE9+KfmhyHh/jnFcAXtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870034; c=relaxed/simple;
	bh=eQQHZSEPtkXcDrqpXHPvW3DvKCOHUHCHnfIDCW2Le08=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=g1GU74r/c0J1y2ahDgUYAM3wEpYAAA3rTXd/w/1wZs0SmsOr8X7JWoXBhzkXoYmR02O+lcNSJ1Bn8vabfZ/xVamcTZAxljF4b/w29Ox2Q9sFJFhrJZZRue+JvGzmUJCs0eQUKa3PpNwzZo1hfgeuaI9i26ZkBZQZWBgOAY5+JxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBogr2vu; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b471737b347so1368316a12.1;
        Fri, 22 Aug 2025 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870032; x=1756474832; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXZ/sAuggXfZX1WzOY6LSYsTeS5jvsDoRkakZ9UPn2M=;
        b=eBogr2vuBvM0rh6ZrGkm3sUS4uFQY7ucixmJBpF72WfEBJD8uFPD026ehevP0rt4wy
         wB9Vw4DsKCIg2NgBMkEbUGywsmsEhJRFxlZNetUkGtxwR1oQ0ZYcCdmXiq80vK1A82TZ
         iGr5bf2SmDLFbJDqBuYaXCA0tJ9YP6zSjy4LfiaWi9RFi5dKnNcy8emngvhpT1pSqLHA
         oAR/Z6UI/85biGiih2dyoJ+0tq15l65dnyv8xSR/zhCoQna2X7rIGDlLvFMTmzLq+dNH
         JP2AXLUHdxsq8sErvD1hOWHyLesaD0Y64bcvHhmIYEJQxAKCQZZ1bHNLvTHF7I8E+evl
         +0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870032; x=1756474832;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXZ/sAuggXfZX1WzOY6LSYsTeS5jvsDoRkakZ9UPn2M=;
        b=eUN4NfWinWIqiCHRaObItSDgxI86rWrsTVU8ug86nmfufd2QonR1PI/IrHyD2lRRoR
         og3B37gzDRzwrHPFG2FaSjlHJkM0DTRaKm1yOzCC36BWAE/9UlCHctYEXO0flK6IfHZr
         NyrxIR5Jbv0C9K08n5gKF+JNb1FK4cdCOCh7H1PAlAuX/bA8eSAJtKrx3ZLyFcM/IdQh
         gw4/MN0TrhmStGckadk218vIWf7dPhzqBBAQzJwOn4HEgCmsRYaCwUvHRQmW7oAIObAL
         DQsl9AY+JkHQ8ZP3edwiabvt4cUeakwV+k2PpFeDzvifIrbUiUGE1eqJVXgLqWGjBUpb
         H69g==
X-Forwarded-Encrypted: i=1; AJvYcCVoTHBPQn34jRNvJhm0tAZm7awT2q17oZym1Z+f5aYBIQKEeQCioJ12xxN4lDQJ/V5c4XCg2TykkOe+scU=@vger.kernel.org, AJvYcCXCKG9/tO5htGgMBJHq51AUPNolWNBQycouBpWn76foxhd5KjyahC5zCiszcp3Q7i3KrnutDTorkNb5Mbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWUF9dM6nMM3CmxMAs+bNQMxJ1UecNa7N1UbeNrIyUhSfdVSaa
	Eesec/E9eHbLf20cEO1RZA415h5yt3pscWT+FceDiEaHHwL5qULwsZlA
X-Gm-Gg: ASbGncvaG8KNFQjgEkstkUBGK6UBxhzLyhPOHne7wPl4wP3Ajnw/oMvTnNqTZgPTzRD
	rcjDi3uR7xiu1mzYOJNjXGmZoA6sngo6xVWx04YYrCt0rHfmFvyCbbS7kAq7mNbGt5uyiERaSFF
	r60wFfL5W951BeX7z8GBlT48j8wubFknOV68QUqfsTcCCAKIyHjOi1JD3XqFYcR8T90EPXmLA3U
	cRvMqr96kYyjKLLSOuNWQ+TA5ytLPLe8q7Nzj+R1MsgkOtcz/JWgDG1ZXfg0tpIlBYG0Q4ljsPk
	6RjL96Ba6AeRSknkgiGN184sK5XAHKfid9qhzfJbowFjyJd9pXH1L1MWFfSKTwKuh1DnV83WOzC
	lq3a0mQxtOhr2SK80p6S5vM+5uWgF0saRTfgb7qLdV5D79R3OrQE=
X-Google-Smtp-Source: AGHT+IH9nxsyqvs27fylRl2mMO59er2SNabWSwTNf+dYqMgaIQr0qEX93B+9UsxE1dpdHi8PwoTcPg==
X-Received: by 2002:a05:6a20:5493:b0:23e:af6d:d24d with SMTP id adf61e73a8af0-24340defc6fmr4202341637.45.1755870031646;
        Fri, 22 Aug 2025 06:40:31 -0700 (PDT)
Received: from smtpclient.apple ([2804:7f1:c242:a307:7992:d717:bc22:e8df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324fb7f3d7csm1794016a91.11.2025.08.22.06.40.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Aug 2025 06:40:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] media: vidtv: fix to initialize local pointers upon
 transfer of memory ownership
From: Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <20250822065849.1145572-1-aha310510@gmail.com>
Date: Fri, 22 Aug 2025 10:40:16 -0300
Cc: mchehab@kernel.org,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <7FD2157E-6F0B-40E0-9984-7485845DAC51@gmail.com>
References: <20250822065849.1145572-1-aha310510@gmail.com>
To: Jeongjun Park <aha310510@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)

Hi Jeongjun,

> On 22 Aug 2025, at 03:58, Jeongjun Park <aha310510@gmail.com> wrote:
>=20
> vidtv_channel_si_init() transfers ownership of each object to the =
correct
> table through functions such as vidtv_psi_*_assign().
>=20
> However, since it does not set the local pointer to NULL afterwards, =
if it
> fails for various reasons and jumps to a place such as free_*it, =
memory
> that was freed in vidtv_psi_*_table_destroy() will be accessed and =
freed
> again, resulting in use-after-free and double-free vuln.

I get what you=E2=80=99re trying to say, but what you actually wrote is =
hard to
parse, can you improve the wording here?

>=20
> Therefore, local pointers that have completed ownership transfer must =
be
> initialized to NULL to prevent re-access to already freed memory.
>=20
> Reported-by: syzbot+1d9c0edea5907af239e0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1d9c0edea5907af239e0
> Fixes: 3be8037960bc ("media: vidtv: add error checks")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> drivers/media/test-drivers/vidtv/vidtv_channel.c | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c =
b/drivers/media/test-drivers/vidtv/vidtv_channel.c
> index f3023e91b3eb..3541155c6fc6 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
> @@ -461,12 +461,15 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
>=20
> /* assemble all programs and assign to PAT */
> vidtv_psi_pat_program_assign(m->si.pat, programs);
> + programs =3D NULL;
>=20
> /* assemble all services and assign to SDT */
> vidtv_psi_sdt_service_assign(m->si.sdt, services);
> + services =3D NULL;
>=20
> /* assemble all events and assign to EIT */
> vidtv_psi_eit_event_assign(m->si.eit, events);
> + events =3D NULL;
>=20
> m->si.pmt_secs =3D =
vidtv_psi_pmt_create_sec_for_each_pat_entry(m->si.pat,
>     m->pcr_pid);
> --

The patch itself is ok, thanks a lot, however:

> media: vidtv: fix to initialize local pointers upon transfer of memory =
ownership

Can you please use imperative voice here? i.e.:

"media: vidtv: initialize local pointers upon transfer of memory =
ownership=E2=80=9D

=E2=80=94 Daniel=

