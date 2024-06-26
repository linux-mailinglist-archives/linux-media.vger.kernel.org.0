Return-Path: <linux-media+bounces-14197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 944C8918DA9
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 19:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DCE51F2343E
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 17:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8972C190461;
	Wed, 26 Jun 2024 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="e1T6aAMQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A4D190056
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 17:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719424611; cv=none; b=aZcyU4pCrrHilfgLjOJubI3lifY70GC4t1ZC2e6zDDTdIVyEqNt5n9sMJpsHUu/2PrGDFEoStR2kGCq04OzBlxFdml6X4i/5vdKOJAXhuiMEsLWERyfzmokWDvxNerbMd2eKBErTHe6ou1RYjtzeIdd3HQOE3BKR5Oco50V0PSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719424611; c=relaxed/simple;
	bh=Ot4v4xZ8mAcGHfBbEgU+l8sAbosxzZ/IErDZEAPeSQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVArniH+1r/C78bXrunrY4mKUKgj/Twf/079Pr9f8o4KFsBqSKcAqEepmhEYaHrKX0QqPZumNASzSM/sn+PPuZwNSxJ++z8rCUfxFod1u4KC+2QpgPxORxYUjr6BddCO6sew5sd8vmdz7Ti+cP+8b4jGeIAU9fRS/TgYJFpGnOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=e1T6aAMQ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ed5af6b214so955071fa.1
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 10:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1719424607; x=1720029407; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZM4co7+zgQAd1qBwWCVAAvV8TVVgRW2ezKZ6IWngwg=;
        b=e1T6aAMQYWZpd9vQyBhcD5kRot3hGvWhA3k4dsONVc2gn4Ms8QSEHDSuF8J4WxgwY3
         +ctR+GrhJLtcqnpeHwXoJzGl2jIZxY5/Vox/GLQtNztSyQqigMa2BgB3az6Kj5s+/5qj
         EkZNjm1qC5sYvDlyYMrhsKbzWJGEsUdOxP6Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719424607; x=1720029407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZM4co7+zgQAd1qBwWCVAAvV8TVVgRW2ezKZ6IWngwg=;
        b=CcS7t/G9UottQmjdipPloDBeH/Sf1WgU53dmKuVaHFr3si7TdEDcilZUL7H6P9Arrq
         SapH7fhcvALGP8kIv9/HY/8XAii9SivwLHjgBdcTaWpVwdGx67OBN15yU+6SZ4M4oAwY
         fboXDyS8bDvpDtM5e4yJa6nWruTpR1yeko16TgckkwklBWnI5A7lg12wxQhlX2j/2Qpl
         HNmwZTXNBBBlqz2npK8dljjzYetKUnENMM1Fo++n9oHrNRbvA2GQD39YGkVJwMYUJqlf
         CLKS6dAEH28yZ/vhHg/ZtPtIwzfcxYBj57hbk8DPtgMpdMyQy8dG/0Rygl3PBsa6rqSW
         XJcA==
X-Forwarded-Encrypted: i=1; AJvYcCXEWaewscSm6SON0sMetquaQXiTQr1AP3In3OOF3wVoVZcJ+0Hn1pUggNfeNp0fn9i+G1fsyt9/laIvdUgxW8hLO0v1nK9mQamjvXI=
X-Gm-Message-State: AOJu0Yw3J8q3nQtsemCK2H3gRXUKM5U4aP+hQGXsSlHUmVTZLG+lftHt
	/1BZ1Ath+CSXWOIXxDIYCVH+AMK4AL+271ZqqDSt3WtlcVPvMZcOTm0ewnj9mgA=
X-Google-Smtp-Source: AGHT+IHpT050wLlCJMuYquS/RZZlwvPNrgj194MZbf2u4dKv3AnFWfObCpyKJAMPQnTOJYHQGnJJZA==
X-Received: by 2002:a2e:9903:0:b0:2ec:4176:dcaf with SMTP id 38308e7fff4ca-2ec54ce1c2bmr76783881fa.3.1719424605371;
        Wed, 26 Jun 2024 10:56:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c84245f0sm34437855e9.33.2024.06.26.10.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 10:56:44 -0700 (PDT)
Date: Wed, 26 Jun 2024 19:56:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"jstultz@google.com" <jstultz@google.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
	"willy@infradead.org" <willy@infradead.org>,
	Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>,
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
	"pavel@ucw.cz" <pavel@ucw.cz>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"contact@emersion.fr" <contact@emersion.fr>,
	"logang@deltatee.com" <logang@deltatee.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"tjmercier@google.com" <tjmercier@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"joakim.bech@linaro.org" <joakim.bech@linaro.org>,
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Message-ID: <ZnxWWtdShekGSUif@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"jstultz@google.com" <jstultz@google.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
	"willy@infradead.org" <willy@infradead.org>,
	Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>,
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
	"pavel@ucw.cz" <pavel@ucw.cz>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"contact@emersion.fr" <contact@emersion.fr>,
	"logang@deltatee.com" <logang@deltatee.com>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"tjmercier@google.com" <tjmercier@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"joakim.bech@linaro.org" <joakim.bech@linaro.org>,
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Wed, Jun 26, 2024 at 12:49:02PM +0200, Christian König wrote:
> Am 26.06.24 um 10:05 schrieb Jason-JH Lin (林睿祥):
> > > > I think I have the same problem as the ECC_FLAG mention in:
> > > > > > https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/
> > > > > > I think it would be better to have the user configurable private
> > > > information in dma-buf, so all the drivers who have the same
> > > > requirement can get their private information from dma-buf directly
> > > > and
> > > > no need to change or add the interface.
> > > > > > What's your opinion in this point?
> > >  > Well of hand I don't see the need for that.
> > > > What happens if you get a non-secure buffer imported in your secure
> > > device?
> > 
> > We use the same mediatek-drm driver for secure and non-secure buffer.
> > If non-secure buffer imported to mediatek-drm driver, it's go to the
> > normal flow with normal hardware settings.
> > 
> > We use different configurations to make hardware have different
> > permission to access the buffer it should access.
> > 
> > So if we can't get the information of "the buffer is allocated from
> > restricted_mtk_cma" when importing the buffer into the driver, we won't
> > be able to configure the hardware correctly.
> 
> Why can't you get this information from userspace?

Same reason amd and i915/xe also pass this around internally in the
kernel, it's just that for those gpus the render and kms node are the same
driver so this is easy.

But on arm you have split designs everywhere and dma-buf import/export, so
something else is needed. And neither current kms uapi nor
protocols/extensions have provisions for this (afaik) because it works on
the big gpus, and on android it's just hacked up with backchannels.

So yeah essentially I think we probably need something like this, as much
as it sucks. I see it somewhat similar to handling pcip2pdma limitations
in the kernel too.

Not sure where/how it should be handled though, and maybe I've missed
something around protocols, in which case I guess we should add some
secure buffer flags to the ADDFB2 ioctl.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

