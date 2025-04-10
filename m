Return-Path: <linux-media+bounces-29953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB460A84926
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDBC2167C52
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19141E51F1;
	Thu, 10 Apr 2025 15:57:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3EA1E98FC;
	Thu, 10 Apr 2025 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744300672; cv=none; b=T39GgVafqjLr5/Rrux/eKRsXkdyNPHI2pPG/KqfF8CF7ahnbsJCX3flnkKq8lY+UEmIse6OX0Gj4E8srbvCv8G/H8K1JfpFRvHdaIndumdbxcN8HohsrkBUBQiA72Duw4L+E1dDISQXsjvaKVqU1emUMaC1MY/ZtmC+8QSCSjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744300672; c=relaxed/simple;
	bh=toEDVYlQ5gc+BWTPYsab9ywypW8wzVWZlN3gOPWpIFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/GVgV5foiz6F7J8d/GotypYXY5zXr2SJk1/Wj6Xrbw+0PkGj9I8y9mqq6sD5mtW8Hemv4p3A8zCfIeKZRgh+tL+ngA/fQur6jBASEQogBjow7G7QoGj19sgX/J5MMGgFiWfrG1qeQyQnw0baIGexh7QZIiKDgoI/ylBo14KTTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86715793b1fso398820241.0;
        Thu, 10 Apr 2025 08:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300669; x=1744905469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTlABCuj1Vx4ATPe93guMM4wCPJWzEZx3LEoHZZ4x/o=;
        b=aFMpS5pCiv1P4J6Kwc2B6pID2BcfBp9WILbzed16Z/YZAFx+GlAsWUFUBlTWnfkQ3Y
         Xz8Rhg5XuG9oXVnza2jyj0aChsD9CVnpOljwWaACwj2mymuth3Vm4X2DD+gNxFCHYnXP
         5xUMADj17y2aV66J0Xl6+vSzSFxxIl3/mLLepDly/Ah0M5dlT+htEswE1A+snbZGVcHP
         /P656I9gArOMQRBn/SvOei3OJ3Yx+aL84gGUDD12+mFrVggdoMFzcWU8T69hARPl4loK
         ic1ooDd/RF93S6F8FeF7njldV1iKlDvXSQcZ753Vij2xn7cicejXqMmBpjTpmSSwPWep
         472A==
X-Forwarded-Encrypted: i=1; AJvYcCU3s/0xxb/ti4y8SCJC82a3C5nCVzR9VicUaLPjfKlLS2IIDdxckTPUNufw7iL5H+ryWgvUTmIrHUPg@vger.kernel.org, AJvYcCV2WZqNCwYtLpBHUfZ6xudrGFe2ZiMH0l55W03Hz3SJqkNBQDj1ovQAAACh1IJhsKeFaG/lkoBlZAIjHAg=@vger.kernel.org, AJvYcCWos8YcBjj5m/fRVFiZAT4fg4pHNgJRuxJPR0klX+dsglYPqFb7fKhOpfPin1OLXR0Z/184vFJ53IbLyZ+B43eatXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBtPaqwm2Pd9op9M804kvC7P1llUd5KzkpRihZHmSgNBHnW3gu
	W+0k0/29ubtwmSMDr0wE+O9WqU9T3Xrrm3xJ/MTenjXMN+fQVEbSXg1lvScdx9g=
X-Gm-Gg: ASbGncv5Um/9vdX+1a8/JMo/OwkRKMkMh0vZ4kEGf+/HoFrTSYJNW0bIZxjwDT9imp9
	vmGLRVulsNVDIgoFlDWWx9REaokChdEJ2oJ04ff2OfZN/1Wox2p11uE7dkSjgWXfencVKS7srYM
	gYDzsdQhtZGON3G7beGD+cGXgWJlMy9VEemD3yFWRTfeQYtKhMjUz1Vql5Wguvn828XAOxfW9/V
	xAln3hj+i8bRy1x3KC0a4dEkg7xlHMmCCC8GXRAUEVaL19miIHBidk3ayh2mQ6zZ68iRkHKCbEg
	xhXfURJU/5csqTrcP2D2kO77A+7NWPv2QesdztLueDXqtXBIuVHam1WeQyCbQp0zNUJ+vMZaoqQ
	8/jI=
X-Google-Smtp-Source: AGHT+IF0OqWCTjXXUjJWbye1qhtZZSRSSO+dzF6ssSRXgkhuxHwpUI7UoGQJH6SFJ+s5do6Lw/HXcQ==
X-Received: by 2002:a05:6102:d91:b0:4bb:e8c5:b172 with SMTP id ada2fe7eead31-4c9d34a839dmr3484604137.8.1744300669360;
        Thu, 10 Apr 2025 08:57:49 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c9738360sm641249137.2.2025.04.10.08.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:57:49 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d30787263so406965241.1;
        Thu, 10 Apr 2025 08:57:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSPV4+zAneTJB+HR5/bjfJOmo5ySWicFnBHsF73GSm9hmglqxO4yvpsdNFbohuiSUmj473pv5TLCFarN0=@vger.kernel.org, AJvYcCVvw2kpqBaMdi/Tp3drXBz5vALN/MMEH6/NzyAJjJZM8RTUX6mfw4E9r1nkp3M1eSVQ6wvTUkKYXOvU@vger.kernel.org, AJvYcCWfMvrcuLsysgH5v4ce0kA5yXyFD57Nnx/hG78lG8Bdkce+evr/twhFSt9EqUqp8B0eOgRU831Ya7kunO91jexDvJY=@vger.kernel.org
X-Received: by 2002:a05:6102:3309:b0:4ba:971a:41fd with SMTP id
 ada2fe7eead31-4c9d35c5deamr2928169137.19.1744300668880; Thu, 10 Apr 2025
 08:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se> <20250315152708.328036-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250315152708.328036-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 17:57:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrvdKNNOymbeE7XBPc-jdqN0Zn=2DyFhH=36UrnoLXrA@mail.gmail.com>
X-Gm-Features: ATxdqUEPpj3_EQ7ScJL1cyuOmr3eI1I4T0RYCr9RHkR9JOp50RTDPPFLtPPI7Bo
Message-ID: <CAMuHMdXrvdKNNOymbeE7XBPc-jdqN0Zn=2DyFhH=36UrnoLXrA@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: renesas: r8a779h0: Add ISP core function block
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 15 Mar 2025 at 16:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The first ISP instances on V4M have both a channel select and core
> function block, describe the core region in addition to the existing cs
> region. While at it update the second ISP to match the new bindings and
> add the reg-names and interrupt-names property.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queuing in renesas-devel is postponed, pending acceptance of the DT
binding changes.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

