Return-Path: <linux-media+bounces-49941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 286FACF5401
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 19:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A7A8305E3FC
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 18:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7369333ADB5;
	Mon,  5 Jan 2026 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hQrC04cu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230ED70809
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 18:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767637973; cv=none; b=tLXvmw4YuURjIRuLZkzlkNnyc+/ozEEns2kgRnigIoaD6v1Etdyv6e+FUZHM/Ad7xjfKR+B91sqDxUx5TF+zyVB52SztL/Kir6Wwvtdj7KP3QfthCEabDxqEQ+LaJUKDHCiN0CPzB79F2ITvrF4FMnbVevAw1WiEF2Z53ur6sv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767637973; c=relaxed/simple;
	bh=UcA2PKJWmLnQbodbzmcAjhreD3tSvaZhTxTKoHDkBRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRoY0o6ejkyq/73zj5MNpZiIx66hL+1LHED818tTc485ytN8CEau/hsuquZT/K7BiiofglbusIXM97PQEGfLybqCzmKijuO+cD7wujrTP1S4DR53yQ2GW5IMAft8CGdXrxs5Ps6W9JVfWqHvUzGJLMuC+78N5vhLFLBs2NtToJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hQrC04cu; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37d275cb96cso1992721fa.2
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 10:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767637970; x=1768242770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVTE+mywRMMvpNgWCLEV1bveDjP0Q+44SFkE/SVMdGY=;
        b=hQrC04cuhgVMQ601EV47N7N2vKU8hMqpOIsC/cGglPr6k81g/sBK1UPVDvTUlqnFUH
         4dXxubk1fQefDyGZi24w59eHOrrBtE1AYA5hWwlm7td2G8LdqRluC41Wf4mCPvvVMs2o
         K6bFes2hJWnAgaz6gUutZZCe/ubeA2BgeejB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767637970; x=1768242770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVTE+mywRMMvpNgWCLEV1bveDjP0Q+44SFkE/SVMdGY=;
        b=R/h++L+ABzMBjPbDJzfCQuOuW7hrq6OijW4Z8KB6P/D1v1GEfknjpgNj0aMloRehrc
         FTJUsL9oJv6MrCpUv6qfID7a49cprGfp84wjpxpWu1KTPmVjtL5jPuElCtRITo7XY7pM
         C+k2KYI7LFytC3UAGcXnKn/myxI3oSD7BJFV64PUYi1uFZVdL1Q/ehXZ7h4D1ZzJ09QC
         dPnP7v9CLIW8mFlTG3+XrlEJ+IHq3JYlN6X+/OnslmVxhi5w8dII1gBZCKCv5uIpo0qO
         dEXZpUOEPGSbp9I67zjgktalGJqq5NK9+J6lOfV1OJGdEemOZhf2xtOqy798bepKAeVD
         ipEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2W5kxhkegTkZUPlFEEqLBSkPLnbgi7Y86j+ETAgOLyt3BJOOAtHgPzDUHmHou6oM4Bfw9AAhaSlPxqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIsRL0Tr0F49dcjuMaCefZ7VTbxLA5EliNg56tqlSxNV9ccKZ
	GU7YlmZsD6rtVmsyx51CAA7s6vD/pf5Ig/gFZAP0q7bmDf0/3ly0y9toRphZAara8prV6b0qaXv
	uyaya3Q==
X-Gm-Gg: AY/fxX6Dc3c0NjxLAc71RMdjTOns7wR3Bh0Uh3bbnFSDBcjGFX6XZdnsXTuhp4Oei8b
	mHYaNxHfAgsUKCm697Ep+3b8XRxld+QAjW3dVQ79gh+yYpcDxtHH2STEo5ySqoGBysAVBDXiTrc
	4ZpuM73cl0DCQGqcgZWbZrKiCiQ/7UO+Rt9NePA+0ScpX/eSC3A9IExh56mW+TBp09bqTvN2PeM
	LU9ss95EQMWkkHKMSca3WuW5kMOnyxw5IFH9IQdHwTfDIq4bS1f5fpc3y6q6WubrvX3V8TMLhDo
	LUnudfi6ivN8v3YKPe6WodpU/F/lbY2/fOZOWjxrkiOacBXxAiDSJr52O8c3reNEV9SjgAWsh4w
	XCQzKY/r3weJufXLB8PcuAo+G81sp4Yz3o7SJIpac/vFLIjV6IO7GaEh8KrGlhO5ldjWTDm0nJ2
	++IiI5X1pSEBfrXzyO+cca1CNHnAifkcG/xkEA5DGCHYGRIZJQ5p6p
X-Google-Smtp-Source: AGHT+IFWMPTNi274L3wSoVWSXBoYyZDlKk42Uri+h40HJdlIoNkplTOWnCT4J+gEJriJF9tgDnhIjA==
X-Received: by 2002:a05:651c:2548:10b0:37f:cd21:6ad2 with SMTP id 38308e7fff4ca-382eaa9d2b0mr478851fa.20.1767637969919;
        Mon, 05 Jan 2026 10:32:49 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382ea22d978sm701261fa.33.2026.01.05.10.32.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 10:32:49 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37fcec29834so2119281fa.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 10:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWs9hoVH0vCfoJqQhlDTB64P/UQVQB1XQeU8Elwjwn+/Swlx8v00QzcygpDYtncy1v+aMgBg209NuuypQ==@vger.kernel.org
X-Received: by 2002:a05:651c:3057:b0:37b:af2d:13a3 with SMTP id
 38308e7fff4ca-382ea9e6f93mr761391fa.7.1767637968327; Mon, 05 Jan 2026
 10:32:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aS8YBLEPwF0-NtJO@eldamar.lan> <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de> <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de> <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de> <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
 <20260105180033.GE10026@pendragon.ideasonboard.com>
In-Reply-To: <20260105180033.GE10026@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 Jan 2026 19:32:35 +0100
X-Gmail-Original-Message-ID: <CANiDSCtAhrVudmAG5uzrXF-BHQf7CSK+SUV0SorVAnbjLA-qQg@mail.gmail.com>
X-Gm-Features: AQt7F2oWjeR-frtJpBOVHGmX8D9NiYOfqgYVTg0rqMMZh14YYMdAc5LkQMGpKmA
Message-ID: <CANiDSCtAhrVudmAG5uzrXF-BHQf7CSK+SUV0SorVAnbjLA-qQg@mail.gmail.com>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ralf Jung <post@ralfj.de>, Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Jan 2026 at 19:00, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jan 05, 2026 at 04:29:24PM +0100, Ricardo Ribalda wrote:
> > Hi Ralf
> >
> > Thanks for the bisect and the report.
> >
> >
> > The patch to remove noprod parameter has been queued for 6.20 :S so we
> > should look into a more permanent fix soon.
> >
> > When you say zoom, do you mean the desktop version of zoom (
> > https://zoom.us/download?os=linux ) or the web version
> > I would assume that it is the zoom app, that is ignoring the "error"
> > flag from the frames and showing them to the users. Can you confirm
> > that? Hopefully we can reach zoom and they can fix it.
>
> Should we revert the nodrop removal in the meantime ?

I think if we have not heard back from zoom by rc6 we should revert.
But IMO we should wait until then.

Maybe we can find more users of nodrop that way.


>
> > Now about the error flag. I have given a fast look at your usb trace
> > and have only seen 4 frames with "error bits" [1]. Can you add more
> > tracing?
> > Do something like:
> > rmmod uvcvideo
> > modprobe uvcvideo trace=0xffffffff
> >
> > Then start zoom, trigger the error and share the content of your
> > dmesg. It should contain an explanation of why the driver thinks that
> > the frames are invalid.
> >
> > Thanks!
> >
> > [1] I used this filter in wireshark: usb.iso.data[1]!=0x0d &&
> > usb.iso.data[1]!=0x0c && usb.iso.data[1]!=0x0f &&
> > usb.iso.data[1]!=0x0e && usb.addr == "3.34.1"
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

