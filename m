Return-Path: <linux-media+bounces-20659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAEB9B827D
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 19:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E6A81F224F6
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 18:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AE41C9DCD;
	Thu, 31 Oct 2024 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aln31iLM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C811D1C9B6F
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398854; cv=none; b=Q3cGs7J3PdBtsomQpfat7K6lGQZ8DxCp9QafmaXRE6tL8LogDLqykEd6zeTu7ZIB5Z0GWEpSROBFSeVYZ+xGfMp7NkO/iChx3wxl3zCj2p7S0wDZ0NqbDTykG/bnDmUUbhhRD8iVAlypXboe9v73rEPQy3RCNXOmdd5Y/HclVcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398854; c=relaxed/simple;
	bh=FyWu/MmruUKcYDBZtwz3BWZ6sqrZ2UBNz2oBRpi4PAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUp9edyYfugKUmdoUM7XWUTYeNA5WYvFi+pu5v4grN7gaS4TCpwbtY9vGvaAZJ8aCWnz19R9z4IDRBqJ/0N0S5IyJv647sOFh4cztWmVRr0DQC5YPh0CSu9DIl/QW2dYHAINZTLlkeaXqBTuFlx61YxcG15YqxRpZ3tYMg8reB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aln31iLM; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e38ebcc0abso14345797b3.2
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730398851; x=1731003651; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WLDUJfbR6R9Q78ZWppjQCRBcAEdo3kQLDzuM0lwJU0g=;
        b=Aln31iLMzqOqdYV5Cu0h2Q6mWZYoIDO4Lmg8+HGaYQ4OrKF9EYeb5cQoNJSfEqpy/l
         gtWU4UuNN0fize5kCYFFMO6djBF62+KA8ixeoUFPe4dRqoOu2kLunlNJmySplDhz4Wkj
         NVVknNsyemdeG/ZpsYAZt+bbPJzV4GvW5cIFpR6h7djqxkdYVZdtJPOr620bI58WcPJl
         jTIjxiZkh+rXDKQzbyrruOmnzfyk8ju6QTDW3hFGR66VA3g8GgHVN+xLZ/BWos3vvcMd
         SqWydAHyxmD72WOd/90cqYAl8fJxciIj5phl3hHkS8w3Y+CCxRnKl/6TDfJ8MVJnNL86
         ZtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730398851; x=1731003651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLDUJfbR6R9Q78ZWppjQCRBcAEdo3kQLDzuM0lwJU0g=;
        b=KLC1oqLa7iLWg20v/xmZfe7XRUOrgBesgGij3h67oO7iQy10I0OHe6pxNhVTRjRe5g
         lNdrpTIpfdWvuMpfbPhp4sA9y1GG/Q7QNhpXOxA+v+bFovyRoS9rsNCdScr1+5hqyI4j
         ZvrR3gBxthDKXNfPEHQXvkHZEB93cwX4mZPVaG58eBZW+SLqrDXRsBNtc+/dB7zOgVC+
         jnlx4CcXGlaGhK6jTbf+g98jflBIS1YSl4dnS0qLpimUhd72juv2aGRt68B2hiDBtNV7
         FhcFyFB7WOJhcAXN0n3LWSHTL60Q4nN4lXJNcanT5Fivy8p2qUkfwDHWUl0HWMm4dDFK
         ye5w==
X-Forwarded-Encrypted: i=1; AJvYcCVCuKUM0BVb2mhmyDwH+uJAwt3D0Pf/3Fpr8xm4LrTxm1BfvVmH49HTemDwJW117rkZ/U9Sv0AJ6mGKkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGggt8sPhK3pbP1eTE9AdRCkYqbrPa3YSMGCoD7L6tr5p/AZ/c
	dQNFhOJkNgrDqvCZZTjaEfNco5QD1Y9DEn3Gw8f8iX/sWEzJeYfY6lUeZzXOLGA/+rPRkAVfAQG
	Vc/i/z0w2AVTdk3Dn/4lRirjPghCY72ePVAs3hQ==
X-Google-Smtp-Source: AGHT+IFAsMwssl3CsGQHQvM8bMdP93YVWcDHIhkTXiHlpvS1lZLveTm8hn3cb6TISveDQA5kxCdXkhevk4P4DApB+UQ=
X-Received: by 2002:a05:690c:fd5:b0:6e3:116c:ec0c with SMTP id
 00721157ae682-6e9d8aa40bcmr195925997b3.30.1730398850667; Thu, 31 Oct 2024
 11:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com> <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
 <TY3PR01MB11346F956733032EC10E997AF864A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5ycxltnw3vhik3iype6ncuh4nelwwtom745o5dlf32qyiqh5bv@yjj5l6kb2psm>
 <1e8526e5-d9b7-42ac-9db3-13b42ccc4fbe@nxp.com> <CAA8EJppAnfiVqNYN6CxaU1Q5fMwDgWhSsPU9qQz7KHb6px=grA@mail.gmail.com>
 <TY3PR01MB113467D658D6680491662BA3586542@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113467D658D6680491662BA3586542@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 20:20:39 +0200
Message-ID: <CAA8EJpryBmTXb53M1i5o9u+94du48AZnDeFQqXZtgxvOuoYR9A@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liu Ying <victor.liu@nxp.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, 
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "arnd@arndb.de" <arnd@arndb.de>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"sam@ravnborg.org" <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024 at 11:02, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Dmitry Baryshkov,
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 30 October 2024 03:17
> > Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
> >
> > On Tue, 29 Oct 2024 at 04:41, Liu Ying <victor.liu@nxp.com> wrote:
> > >
> > > On 10/28/2024, Dmitry Baryshkov wrote:
> > > > On Mon, Oct 28, 2024 at 11:12:00AM +0000, Biju Das wrote:
> > > >> Hi Dmitry, Liu,
> > > >>
> > > >>> -----Original Message-----
> > > >>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >>> Sent: 28 October 2024 10:20
> > > >>> Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI
> > > >>> converter support
> > > >>>
> > > >>> Hi,
> > > >>>
> > > >>> On Mon, 28 Oct 2024 at 04:37, Liu Ying <victor.liu@nxp.com> wrote:
> > > >>>>
> > > >>>> Hi,
> > > >>>>
> > > >>>> This patch series aims to add ITE IT6263 LVDS to HDMI converter
> > > >>>> on i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a
> > > >>>> transmitter, the IT6263 supports LVDS input and HDMI 1.4 output
> > > >>>> by conversion function.  IT6263 product link can be found at [1].
> > > >>>>
> > > >>>> Patch 1 is a preparation patch to allow display mode of an
> > > >>>> existing panel to pass the added mode validation logic in patch 3.
> > > >>>>
> > > >>>> Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to
> > > >>>> find the next non-panel bridge, that is the IT6263 in this case.
> > > >>>>
> > > >>>> Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver
> > > >>>> against "ldb" clock so that it can filter out unsupported display
> > > >>>> modes read from EDID.
> > > >>>>
> > > >>>> Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support,
> > > >>>> as they are supported by IT6263(with LVDS data bit reversed order).
> > > >>>>
> > > >>>> Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.
> > > >>>>
> > > >>>> Patch 6 supports getting dual-link LVDS pixel order for the sink
> > > >>>> side as needed by IT6263 driver.
> > > >>>>
> > > >>>> Patch 7 documents jeida-30 and vesa-30 data mappings in
> > > >>>> lvds-data-mapping.yaml, as needed by IT6263 DT binding.
> > > >>>>
> > > >>>> Patch 8 extracts common dual-link LVDS display properties into
> > > >>>> new lvds-dual-ports.yaml so that IT6263 DT binding can reference it.
> > > >>>>
> > > >>>> Patch 9 adds DT binding for IT6263.
> > > >>>>
> > > >>>> Patch 10 adds IT6263 bridge driver.  Only video output is supported.
> > > >>>>
> > > >>>> Patch 11 adds DT overlays to support NXP adapter cards[2][3] with
> > > >>>> IT6263 populated.
> > > >>>>
> > > >>>> Patch 12 enables the IT6263 bridge driver in defconfig.
> > > >>>>
> > > >>>> Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.
> > > >>>
> > > >>> This has pretty complicated structure from the merging point of view.
> > > >>>
> > > >>> I propose we take patches 6, 8, 9 (without 30-bit formats, they
> > > >>> can be dropped while applying), 11, 12
> > > >>> (?) and 13 through drm-misc in one batch (once DT maintainers
> > > >>> review the binding parts). This looks like a minimal set, having no extra dependencies.
> > > >>
> > > >>>
> > > >>> The second set might be 4, 5 + new patch, re-adding 30-bit formats
> > > >>> to
> > > >>> IT6263 binding (no driver changes are necessary). This can go in
> > > >>> separately, after an Ack from media maintainers.
> > > >>>
> > > >>> Of course both sets can go together if linux-media maintainers
> > > >>> reacts quickly and ack merging media- formats patch through drm-misc tree.
> > >
> > > I'm fine with merging the two sets through drm-misc tree as long as
> > > linux-media and dri-devel maintainers accept this.  Up to them.
> > >
> > > >>>
> > > >>> The rest of the patches don't have such strong dependencies and go in once ready / reviewed.
> > > >>>
> > > >>> WDYT?
> > > >>
> > > >> I guess, 6,8,9(without 30-bit formats), 10, 12 and 13.
> > > >>
> > > >> 11 may have dependency on 1, 2 and 3 as it is SoC specific.
> > > >
> > > > Yes, of course, 10, not 11.
> > > >
> > > >> Then 4, 5 + new patch, re-adding 30-bit formats to IT6263 binding.
> > >
> > > I think it would be good to directly support 30-bit formats in
> > > IT6263 DT binding, not re-add them to it.  This way, we'll have one
> > > version of the binding, not two.  So, a better first set would contain
> > > patch 6, 7(one existing A-b from Krzysztof), 8, 9, 10, 12 and 13.
> >
> > I'm not sure that 7 can go without an ack from linux-media maintainers.
>
> You mean in describing jeida-30 and vesa-30 format in
> patch#7, is valid only if patch#4 is ok with media people
> or they provide an ack for patch#7 to take it through drm tree?

The former one. I'd prefer an ack from linux-media maintainers to
accept bindings based on those names.

-- 
With best wishes
Dmitry

