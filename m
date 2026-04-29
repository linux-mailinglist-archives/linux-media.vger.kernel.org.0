Return-Path: <linux-media+bounces-59914-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNaRIimn8WmxjQEAu9opvQ
	(envelope-from <linux-media+bounces-59914-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:37:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F2A48FCAD
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 08:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD488302F73A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D1D2E9ED6;
	Wed, 29 Apr 2026 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhcZB74z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807DD2D5A01
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444634; cv=pass; b=jj5qTx76dzhVkGXMhjYiueAAMHZICJsx38exhR3sTuZ5EIQuta5XfM0DOxDQpLGH+osKHTJjtFd6VpAkRI+NQcU/qbwEjU/oDnKmszfjt3zkCkOORQi0mivSiNccU3lYRSIUzNNedf+3+Dh/3oQU+Y9dyagqZPve3vQH13KX92E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444634; c=relaxed/simple;
	bh=Q2vxHwF+w1NeyIBy9nFRIS4OBMvwxx+orrKuuS0Quww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6MTy/MetLCgceH/hUf6UxVm1vTzBYvSCUdu+PQSrDsGRyEoeuctJcmi0tShYNfQQcKlDY2awi7SKLzibgZUHcdmj2mbrJkHIYcLZ8oSLq7AYVm6A42gFN/mQegUJxOitYE57cxCN3q5CSs/SuoB45PIPxQ6kyL3DfX75TwKl40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhcZB74z; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso7021317241.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 23:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777444632; cv=none;
        d=google.com; s=arc-20240605;
        b=CPLxomfeDSoDUOG2dEG3TOwlYHTdExrgIj+UcNWvyciNw2Yu8OO24YuMAM0o1yp3by
         dLSR4yZMcuW0M1Z8lGRSR7x6CZSirh563blqxx2IhuLSSU74DRBlMJkdeGaRBAMmGaHZ
         NbrqqxuQs+KKL/VPS8DzrtSaqdNxC4ujJOyFwiNM1Uz74OPEvhcLUr+bmFmE1BQiCmI7
         P2GlATZ8U0Ze4b8Laxf3XKo71jVxV5bTcO9kjr0d3IuYUphyrfMYghzIQwtG2iodcOfp
         ZI9BeuoR0v2zda+pAbY9OXxcyFFtC13CyN8vJyRL6HOrZUC4CXywQd1MH+fp8dIHYWP1
         hjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J4JGbabSxe5kDg/hMbP2sAh1Oso0gASiI4ZSnSAcI7Q=;
        fh=bbkKc9UelRjonrXzJvdccjliR+ermr/TmdMPQq8F1yE=;
        b=D0uvWPwBZxtfC5zQRO6eRKpbm9epe6nVfkGi89f5uPSOasY9cFYEkPhEXj5Lh4gX0o
         EqWuTfIvB4FyIraNRJp/ZW2B93GqhQ9NU8d958OmjcVc71DmSe+wItYwqPjpM+CjfxmZ
         GZi43HOxQfX+Y4qUgbnFwL02zKbFAfcBVc0JhtuhCi5iawBq701dfasOKACjUmkcY2zl
         zQh8LRaBOgVZt5+9zSM8R31KnvxEdwnjdm3bpEy49lklHThvIohZyPMMWflPmXCYdn5M
         EeOddBIuH2+TiKsOEF4eqKXBhhPXaPZdVC/fbJxij93vXcvV1O/w1Fhbo3T9IgKVGnoM
         1eow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777444632; x=1778049432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4JGbabSxe5kDg/hMbP2sAh1Oso0gASiI4ZSnSAcI7Q=;
        b=IhcZB74z3qTipT2irKKaBm66Sy7n9HXXjdb19VgPXRN/Ot4hktTLvgGDT7Xs4ydD60
         mcmy/OyGLYKg+shxv6SM/hpJffQhE144iHHHZnQS2902ShxD+gUJgXFFrknLIVkxxaSP
         YZAQNbYL4j3w+yB5Izr03sgaw9U7KMw46v7MZFOsjp2poscSTIgYKUFV3Z5R3A6CXsSO
         xgnyHBlYilE1UNR9jhEFojsZUZJLl78/vwZ90rTD8Ho8qaclvdlvAI3Cu1z5fwVgVkG0
         KCedrTMB8jLW2eZ1+8ElMwWH0xAdSH/q+MkSqDL/+rXJbZ2X10utlKCcE1Y4e8eFubBP
         UTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444632; x=1778049432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4JGbabSxe5kDg/hMbP2sAh1Oso0gASiI4ZSnSAcI7Q=;
        b=bq5BFq6qQlnfRaLJ/XccetjQUHw5IzUEW/mu9KW7cvJVeEw2/1VfblWN0NNOBY6Xn+
         ins2Fe8t41ngL6Four+IfKfIez4Sqd6DeHiHAVp2u7Bvef8eawJuWiUmKWLNLNOGuou/
         1HDIefOPpJ+ZkEwlvTJK/3EufiEb4pbOQYp0RGTAYYV2JPdJ2XSfFHOepe9HeV9n6sHO
         JbedsowMAGrAQLm2/szSsoDNxiHP6ln/7szc17B1SoG/ArUuc1Njn57PqyMjBTZjwMph
         Ls9/JI6YGaWc2kVnFFab/Ql7LsN16mQ3LZbKoSTYLx2kx318wuJkyH+uyAySS11rbVo3
         twdg==
X-Forwarded-Encrypted: i=1; AFNElJ+9QLQmxHg8PEdwF19Tkdf6wQyK6SfVUagQ1KKo3en2/+dtlD+rs3gy72vc23FiXtGIEjuJqQuf/VmREQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWhaHVGFKXalovhkFxY8VdhfQQRHMwyYPVXuK0co4UL4IoGxjp
	F7bXr/3ARKuglDG7QrFjpv2wSggPckDBl6z5jbmt7dD7iZ3QiCf7/Lt3IIn7nR8teZp4k8M79wg
	BDdKsUErUc/tcBljpwO1fMBOts9xsPSg=
X-Gm-Gg: AeBDiesqKRzkYwqP77aBdPPqnCuRqi+owpCr/BXpne65wBxr1FQdCz44S2ehrplcLQe
	9Alc6RjetPp18xeGlnNaK8pOaJZa3pO9hFImXdNiH9MtONUU8BFaWjAd6S+sFQNqnGJLkubCUiG
	fDJU3uib+SZm2KHPd66Sh0smFNsgoWspjNJBuDyks1qscEuT1rYwioaRIbHzbNtNMq+IhPg72FX
	tJn5AoDy1wsAZTm3ZR6alSryPNhb3BriBVUCn4ut71WqG8RGPSWin4N9AeBlUStL7liVF9jkrap
	D+jkyY8HzlQDgO81tu4dl1wxboz85bxOu2xzCSB6b6G02ZCojA==
X-Received: by 2002:a05:6102:1609:b0:605:218d:ae0f with SMTP id
 ada2fe7eead31-6280a9b9ae0mr3204992137.18.1777444632395; Tue, 28 Apr 2026
 23:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com> <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
In-Reply-To: <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 29 Apr 2026 14:36:21 +0800
X-Gm-Features: AVHnY4JomMW4gOBIDoscYuhdxXx5fsSdnFlsuPTfAzSM9S-h5zn83OQeXtICICg
Message-ID: <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D2F2A48FCAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59914-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 9:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/25/26 12:52 PM, Pengyu Luo wrote:
> > Hi846 is found on my Gaokun3, descripting it.
> >
> > Note that it seems that only Goakun3(3.0GHz) version is equipped with
> > Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
>
> Are there any other noticeable hw differences between the two variants,
> that could warrant the DT to be split?
>

Except for the cameras and cpu, I think no.(But I couldn't tell all
3.0 variants are equipped with hi846) Before camera support, this DT
worked for both of them.

> [...]
>
> > +             orientation =3D <0>;      /* Front facing */
>
> Please either drop the comment or s/tab/space
>

I see.

Best wishes,
Pengyu

> Konrad

