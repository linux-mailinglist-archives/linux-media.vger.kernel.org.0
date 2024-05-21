Return-Path: <linux-media+bounces-11665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 056188CA564
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 02:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 819B9B22087
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 00:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C528F47;
	Tue, 21 May 2024 00:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PyC6e4pB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A02441F
	for <linux-media@vger.kernel.org>; Tue, 21 May 2024 00:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716251733; cv=none; b=OYbanrTfg7krO7T65TAzdqt7eL7iJp1AFexxXnRlK6/225SqYbu6qTp8n+G0eGcLQfdqVMAJvsojIwlbfEUlyD76K1UBgpVylzLMXR38b43n0+ISdyyiGW0ZQ9Qd665j/qowmRms55LoYEUW53XCiVvX9b65/cgsloCVViq6L7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716251733; c=relaxed/simple;
	bh=JcjQq3Y/hoDek6F5UoJex5CmssRYiAFOnlRMpLISlVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cW7ETB9LRWQV4C8OIOeTkoB3cRs95qeP2neUy+gKaldN2B/X/UsQloaMsz7HXF0/lqCFtoAymf7RfzoK9ps0u8SLv90aBw76n5OyCvyk3SNle/2q/vzno8DOtTHTrTTibG3NXGoMA/BE7KZg75/NMqMVD+I7ozIX8thb3iE8GRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PyC6e4pB; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5238b5c07efso3773929e87.3
        for <linux-media@vger.kernel.org>; Mon, 20 May 2024 17:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716251728; x=1716856528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcjQq3Y/hoDek6F5UoJex5CmssRYiAFOnlRMpLISlVM=;
        b=PyC6e4pBbdOhfhnZQHCRH9zvnsTyuZUugNIpFDU0dxNR81cFQvGdchwuNzG2z/SJ8X
         8pSW/H4wgOIm5Q5O1BnyKMvK9Usy4CEbAFAo1rpuOZOKgvihkSgCZmXT6y2/etg4aULM
         L1QtoZgK+Pg4S0yoXF1qIUCdDHmQd8BeCKb2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716251728; x=1716856528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcjQq3Y/hoDek6F5UoJex5CmssRYiAFOnlRMpLISlVM=;
        b=JnFNyIYPxFNDpw7lAyoASWz4v4mjn+CmgFwUPtlZCr0riv6Yz8grIdv+oPtIGq6Q5F
         qfcd84XGuiuGhmgUc4KnAANRA6SBZc8Jjk5qamOERFJe7gBWQ/KfkAaztG8VPU8yEFId
         bAKd1tqiebMfry7HDIJAoPjRaNmwfZT3zXO/hrWzNDlXhrQYzxQg/4E3CLpZa842oVwX
         IrZQxumC2P7IxyG5JDBRpk6H3GIvq4f+Htv8O8giTeO8cEkebgdDx1Ymv0PIbimDbC0o
         p//jUSGts4iSPJuRj1ZJGkGU0SswTvAe2fUDWYrLu95dfUcDZT1K/XadO53FEkF/j1/n
         wggw==
X-Forwarded-Encrypted: i=1; AJvYcCVKHg7pmgJO9rw2zGif6X7L5ed7DNR/f32j3yoH9izH7dc1iZwUsXBUODmfVUsQUqnZbybtleXA0UzXmoqpmVwgREE0n9e2VVf9EWg=
X-Gm-Message-State: AOJu0YzHrnAQr4WL967gYr8eYuuDxdlvRr97/lnJV2fyWze2Dz/J55vl
	w6xBdzKecOo99k1IRxopcWQ5xUEqZjYUKBdAE2rXVASQJBbEtv7BEQmJ0AB3rdj/XrStln3Z9Bk
	=
X-Google-Smtp-Source: AGHT+IH3rlH0F+YMEJLEataShLblqztmOkEvMCMxRUGAO9es/cWLs3k2MC6f6rYpMnu5mKqkOQRiQA==
X-Received: by 2002:ac2:5e30:0:b0:523:8c7a:5f7 with SMTP id 2adb3069b0e04-5238c7a066emr9949678e87.6.1716251727833;
        Mon, 20 May 2024 17:35:27 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad59asm4518739e87.45.2024.05.20.17.35.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 17:35:26 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f174e316eso3950895e87.0
        for <linux-media@vger.kernel.org>; Mon, 20 May 2024 17:35:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4oK1ii1FmcWwF/lYa5z50XTMGck8ObOs2PJRpbQtK3rR4gJvOPmbChrLCz6Q4PEVz09E7/yfWZ1UVmrNdB4stDkBvOxeNn49fQAg=
X-Received: by 2002:a05:6512:3d87:b0:523:a89f:aa64 with SMTP id
 2adb3069b0e04-523a89fab47mr12749993e87.20.1716251726185; Mon, 20 May 2024
 17:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230914145812.12851-1-hui.fang@nxp.com> <CAAFQd5CcN+TiVd8vhMxQRbmrJuBGYwL5d6C0fKzOy4ujjM_JMQ@mail.gmail.com>
 <353919fd-932e-5d81-6ac5-7b51117366cd@arm.com> <20230926065143.GB5606@lst.de>
 <4d0f3de5-1d34-d998-cb55-7ce7bfaf3f49@arm.com> <20230926094616.GA14877@lst.de>
 <06d476e5-ba85-1504-d69b-a8c1cf617d54@arm.com> <20231228074645.765yytb2a7hvz7ti@chromium.org>
 <DB9PR04MB9284C2494A3A0799FBC187DD87E22@DB9PR04MB9284.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB9284C2494A3A0799FBC187DD87E22@DB9PR04MB9284.eurprd04.prod.outlook.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 21 May 2024 09:35:04 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DGdUCmtFPKuQAd83s9Mcy+_MdMhPJd1sqQkbmubH5wDg@mail.gmail.com>
Message-ID: <CAAFQd5DGdUCmtFPKuQAd83s9Mcy+_MdMhPJd1sqQkbmubH5wDg@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH] MA-21654 Use dma_alloc_pages in vb2_dma_sg_alloc_compacted
To: Hui Fang <hui.fang@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Anle Pan <anle.pan@nxp.com>, 
	Xuegang Liu <xuegang.liu@nxp.com>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 6:49=E2=80=AFPM Hui Fang <hui.fang@nxp.com> wrote:
>
> On Dec. 28, 2023, 7:46 a.m. UTC, Tomasz Figa wrote:
> > I have a crude (and untested) series of patches that extend
> > dma_alloc_noncontiguous() with scatter-gather allocations according to =
the
> > new max_dma_segments parameter.
>
> Is the change merged? If merged, in which version, so I can test on my de=
vice. Thanks!

Sadly nothing really came out of it. The code I posted was just a
quick attempt to implement what was suggested in the thread and still
has some open items, which need some follow up. Maybe I should just go
ahead and post it as a proper RFC series instead.

