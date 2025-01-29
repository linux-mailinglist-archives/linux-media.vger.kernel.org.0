Return-Path: <linux-media+bounces-25410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E3A21F9B
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 15:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E2D17A11E4
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 14:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A701BEF74;
	Wed, 29 Jan 2025 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9+vIdID"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BB22033A;
	Wed, 29 Jan 2025 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162148; cv=none; b=lrEv1Ls714vEG6WuqC9pVsGOL2JuSuVGUZ92l6MJTYIoUx6o4A3YxUW3w6iDuGGfS5V2V7HNaYfQKv3RbAtkE3SXM5RjANkJs9OkaS6v4KTzO4UIFxuSt11BSIw4gnSyn7kxWwdDj0voI7JpvCBcusSg8cMbH1/5sWQdQWElLW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162148; c=relaxed/simple;
	bh=t1NL0hBfeu93pwmSKWKCLe6DNvNe+PaCC8pPv9JXU7o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gvEj0wWWl/F7011CZWxfXes8bVbVbMMr42Y07KhFgst+SgCoUnlvGKSA+LBDkId3AAQGwll7EQwKaSc+Go2wkLZ1g615I+6ygBs8Oo3t0uRPJBNfUgTV/KlgtaPdBFgPl9p2TYpu1efCEttNeJ3C9HdzmJ8xFAOr7sTOp6hBUCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9+vIdID; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dc5c180a72so2604860a12.3;
        Wed, 29 Jan 2025 06:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738162145; x=1738766945; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wy9Kd1tRNPjJ7fX39Zk0IB/RiCX0HA9i6UGO0pbaFf0=;
        b=S9+vIdIDeh0iMrlhHBBBX8SYqm7xycKY95N96kRST2IBU8MSZ6BZog+Z22jSmCb/ot
         Au4t9d5jxzr6oXNtyGZ0a3JZoCr4eiCSZOlywYzCnSnD/4awwVkV7PF051XQQGcgkAyO
         BSi0t25RsMjKm64yZCe8JcuFIoLnp2Go+Pqx5zf7Wj3+nP/+p/KMD1MNJC11nIN3WMKA
         t6byeYazF+RD5J/8wgFqPDEAC0JCV+umif8GWIZMkyo3oQ752IQblPPfLBqCf/bBz194
         LjBHFdjPCaRbhJ43ztutd8x4rWCNG3JUY5JpqZDeHHNfsYfXq6HOaoqKZGif34qfBs9Y
         oBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162145; x=1738766945;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy9Kd1tRNPjJ7fX39Zk0IB/RiCX0HA9i6UGO0pbaFf0=;
        b=C0S0M/RoC9TQccXjVBf2FUpYNXVO+XCYWkqf+r5JFcGiK0eBeenE1z6o48h1p3Tfxi
         6ngHCCz4Yd27j5zURlHBIpBg5diI+n3hO6ux5wvJMSh3GaHNZCarWkAo7mc4zhyuqAW+
         saMkirSJxELtUmpUP1sqjUYta46pN5qnu/luX40VkPqy+cSihfRc8o1Ch6FNYFNHovF9
         WcfRVnvBVgP9f2lHFjOpOkt1Z0euiMAJ2pyspPvNDJLh3hIUZ/nY6grTO9S6qimciHEf
         SkL+dvoQIcFOjAP7ueE3MBLlo1l9qGttTMh5tgGKtaGoeRfph5dltAfeTfmdwYp4f9RY
         wtiA==
X-Forwarded-Encrypted: i=1; AJvYcCUoX4i8IIdP7Oyrm95WxJ+RrkahipER+AAw/hgRNP9xsuqcEYUmUOwSy7U52jSDBpviV8pbyjG6coxClew=@vger.kernel.org, AJvYcCVl5TmHu7+Z2SOekxeoiznot6hHsqvnTy4msR5B2Yvx0FDtBpMdMXa8cycT5YcgwB278Kx9awUuvctO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/bzxasO2TVvIXrYaLVD8wbD6JMkLv8JclPLqwld7pk1SCsCeO
	joLhm3fOPMqaSMV/cqJUfXgW9oDwV0yW5wwRNPxKj84cq6yLOZhH
X-Gm-Gg: ASbGncuQagCpZHOqyEzjvcQdZCPqOVAs44C6uD6dnytoZiKjbT8ANgFEBzjShP0IgF/
	ejGLSN50AWvbDR9FoYLpA51FvQL9A4AqkSwnfv2BaA7cyD17Y4w5HlxB2hEDUmCfejRLcxdnnub
	tIQNTWZ1WZBWHCvjVIMdEFOA2351bJE+yqmjmnWyyjLqRlHcypWJ7DbNeR857N6i7ARP2KbsFoH
	0l7iDi9WCKHIOEcW4Ipt1kFJj2RhV9QaQqoTBhHbn8L7eHlsYsUhX3IvqJyYcNMZ4mSSEbFFI5o
	Pe9oA5P3PGkOVcYR4j/aZjGVj9hrMNALAbuUaCzOf4nvk8icJc2EhhiOyY4GSqOYmFk6c8Cg
X-Google-Smtp-Source: AGHT+IH2RX223oR2m9txbeNFTWl5Np8ejjscYRjYqWj/WLr3tsu0nZkXz1s69kvMjRYyH6ERTmSECQ==
X-Received: by 2002:a05:6402:5251:b0:5d9:cde9:29c6 with SMTP id 4fb4d7f45d1cf-5dc5effb151mr3128289a12.27.1738162144793;
        Wed, 29 Jan 2025 06:49:04 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18628a5dsm9075610a12.26.2025.01.29.06.49.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:49:04 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <5969581.LvFx2qVVIh@arisu>
Date: Wed, 29 Jan 2025 15:48:51 +0100
Cc: linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <3333233.eAoTOS8U2s@bagend> <5969581.LvFx2qVVIh@arisu>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 15 cze 2024, o godz. 21:44:
>>=20
>>=20
>>=20

> Yes, the vdpu34x decoder on rk356x socs should be supported by this =
driver but=20
> I don't have boards to test that unfortunately.
>=20

Detlev,

Just FYI:

I done some tests of rkvdec2 on 6.12.11 on 3588, 3568 and 3566

For enabling rkvdec2 on 356x i:
-add 356x compatible in rkvdec2.c
-add dtsi nodes like this: =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.12/f=
iles/1078-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch=


With this i can say:
-on rk3588 i have some hevc 4k decoding perfectly but some others are =
failing
-on rk3566/3568 only subset of 3588=E2=80=99s samples is decoded well. =
(but is works then works perfectly fine)
-when not failing on 3588 sample fails on 356x - is see errors like:

[   95.666669] iova: 0x00000000f2e80000 already mapped to =
0x0000000037378000 cannot remap to phys: 0x000000002f8c0000 prot: 0x3
[   95.745082] iova: 0x00000000f2f46000 already mapped to =
0x00000000372b6000 cannot remap to phys: 0x000000003a403000 prot: 0x3
[   95.822012] iova: 0x00000000f2ee6000 already mapped to =
0x0000000037126000 cannot remap to phys: 0x000000003a803000 prot: 0x3
[   95.896802] iova: 0x00000000f2ec6000 already mapped to =
0x0000000029fe6000 cannot remap to phys: 0x000000003a403000 prot: 0x3
 turning-off iommu makes above errors disappear - but sample still =
fails.

If anybody hints me for way/tool to analyse of playing/failing samples =
to catch: what encoding specifics makes given sample failing to decode  =
on rkvdec2 - i'll be more that happy to provide details=E2=80=A6    =20
(doing simple mediainfo <file> shows no differences for me=E2=80=A6)



