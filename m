Return-Path: <linux-media+bounces-23470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1AB9F30B5
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45112166128
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 12:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA00204F70;
	Mon, 16 Dec 2024 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IdXC42cL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E8E1B2194
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734352878; cv=none; b=NrOuB74+5kB2Cak4a9GTQbjjv9kE3/p3GT/7sbNOGsTwC4pYpMw+AYGafjd+NQz0uVTntbo+aJ2AT/og+vb359OYoMcJN8R9pj83Hkx4HvuK9DGINxjYeSeajpazwokh/XsWK9mXbTP4ynPtbAfLO/z1jzWNVod8++qpv6YXLe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734352878; c=relaxed/simple;
	bh=UD2mQAtqM+jfjEsY+vhB3g8uihnpPfzEI53OxTYyelE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Urk28Nw2K2QapYvTzWIs5dT9vMUmlbdOfmkVjWj24R2WkQnGxen4PShlm6Dqs7r4iWGasvyiIKZS+yDAriu82iLMxPXBSNL52YerxWSzHyl/8vxCOAMFk6/BXsFZPlgBXsumccFyvpi0G/YHuxnh0hJj0LlhBy6NL57lI3ITc0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IdXC42cL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216281bc30fso42019475ad.0
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 04:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734352875; x=1734957675; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T4OWUS/H8nBASIPpqZoiQi6BbLg9mzfLcxiaLvV8/jM=;
        b=IdXC42cLoLdFj+eg++7T+oISfI1r+e5FD0tpT+etraCE1AJjwCIh07xaJByvZjRuP3
         fEJBEtQ+KItyz9FDKPA1s4d2pAY7UGdARKILCA7P1EIjs/kJPr+PlOKX+M2z1VhG8MHX
         BDMm1YWvj1Xe9zTCurIaAweBe1LHhjp8Yz5Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734352875; x=1734957675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4OWUS/H8nBASIPpqZoiQi6BbLg9mzfLcxiaLvV8/jM=;
        b=VAIG/w2eeZq8xdDUqI0f1/O5V8e6bq+sZ47BX4qTRbrcs13IDNwtH+Y/5FsXpszZyD
         tq3tbrMZf2L+3QMNcj6wm7VvPx6mQZEj6gEMYU1pSsyXXDDR3p7s82FyQ/EwLEdUebZA
         ph+qkjsh+7YoaUuOl8atREGL4zEhRcgPAFEfm+UoFZFfzWPI6dztdSIAUConztcgmfoX
         GiU3Q77wxTYZ6Mdv57PjHDkv5PXGTETi3LzimuLDGVCdaoeLMnxqO2mqqSuqevadiOGe
         XSOjzhNA95LxfPI4C49+O0tXKmz5JExGa63Rzl9/dxSQdo+eOikgfd/wMEsrfbx3d/8X
         q3UQ==
X-Gm-Message-State: AOJu0YzfARoVJjChfG3VriYpFSVNdptVNk+EAsijcKEpBMChhqr1uvbj
	tIu1L4z1VzY5NOPJIC32w/BPd254zuNxBnUgPshHYQz9L0UQ+kySsFpkjVNfq3PHfSGp94IPvSw
	=
X-Gm-Gg: ASbGncsOe5Ny4sV68aFvha0WOQrn6MIRMPmTuE9fZucWRt494ga5FYvmQI84byOweJ2
	HbDJnwMWkrdejnA7s11bkB5Z2IQcLQflpzs5XWddHu9Am5XXEEC3IyD+p5TOyeYG+erknnJGQ/P
	LHmJIlMEyhadi14I2S06R7eAgQ+hCQEtylVOqh3HE4CMZk7kHKwk9N+x0rkFWS87S38enhGqC/P
	sfS+Sd1YaEC9z2WDzqbGcDHastENX1RaH1CC2GBYBon6LLRGa2Ix+4SMg9cZKjEJEyluzwPwiHp
	qidlN0DETiLZuuw6V7o=
X-Google-Smtp-Source: AGHT+IEf2BV2If5J7giIaxuUwh0LCCqX/EXLKquPrmibqKIOR+O9kbcgZD9qnJYtx+dYBKTFcThy1Q==
X-Received: by 2002:a17:902:ce8c:b0:216:644f:bc0e with SMTP id d9443c01a7336-21892a45a64mr190774035ad.24.1734352875201;
        Mon, 16 Dec 2024 04:41:15 -0800 (PST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e54057sm41912995ad.146.2024.12.16.04.41.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 04:41:14 -0800 (PST)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so3369759a91.2
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 04:41:14 -0800 (PST)
X-Received: by 2002:a17:90b:3c86:b0:2ee:7411:ca99 with SMTP id
 98e67ed59e1d1-2f28fa54f59mr17291683a91.1.1734352873684; Mon, 16 Dec 2024
 04:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <qiDpaTpmUiihs32PnSJ5OBrVm201qlAyraYycyW8Fo72UIcSkWQ2FgQPnddO_56Euepf508o_SsViFu1cQiSHlgD06m2rdnoqQvEeLe7NZo=@brettrd.com>
 <CANiDSCv+Gh3E5TuJkxbqWnJ8fcM=WhJbh+hJjNbM=D2ZwSwf=Q@mail.gmail.com> <QZMkPVqtorkeIbj5BHOKAfQE7IJHh6Shg3K9xKeg4d6t4wPI7o94SkiH7znorWctNAqQ4Pr4jZhq6nPQjAk0GprUjcYqknpmVXwne8-H094=@brettrd.com>
In-Reply-To: <QZMkPVqtorkeIbj5BHOKAfQE7IJHh6Shg3K9xKeg4d6t4wPI7o94SkiH7znorWctNAqQ4Pr4jZhq6nPQjAk0GprUjcYqknpmVXwne8-H094=@brettrd.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 13:41:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCspg89eRXB__MA9ZgxeweHku15UbbYvZxp-M51i8fy+bw@mail.gmail.com>
X-Gm-Features: AbW1kvbafOBm6yktLsPaN0F9Bn5pLmwpS25aCuAz9PQuAhlJYwP3qj3qKG-pxT0
Message-ID: <CANiDSCspg89eRXB__MA9ZgxeweHku15UbbYvZxp-M51i8fy+bw@mail.gmail.com>
Subject: Re: new UVC thermal camera vid:pid and quirk
To: BrettRD <brett@brettrd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi

I was going through old emails... have you made any progress preparing
the patch?

Regards!

On Fri, 26 Jul 2024 at 07:24, BrettRD <brett@brettrd.com> wrote:
>
> Hi Ricardo,
>
> On Monday, July 22nd, 2024 at 6:15 PM, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi BrettRD
> >
> > Thanks for your report.
> >
> > Do you want to give it a try at sending a patch for the device?
> >
> > It looks something like this:
> > https://lore.kernel.org/linux-media/20221101-easycam-v3-1-2c9881a7a4f7@chromium.org/
>
> I'd love to, I'm still reading up on how to build modules under Debian
> A first attempt is attached, I'll send it standalone once I've tested it.
>
> > Make sure the vid:pids are alphabetically ordered.
>
> Thanks! I wouldn't have noticed that, the struct is inserted in vid:pid order
>
> > Regards!
> >
> > On Fri, 19 Jul 2024 at 07:55, BrettRD brett@brettrd.com wrote:
> >
> > > Hello,
> > >
> > > I have a device not listed among the UVC supported devices, '2bdf:0102 HIK Camera', It's sold as a "mini640" thermal camera.
> > >
> > > It needs the quirk 'UVC_QUIRK_PROBE_MINMAX' before it runs happily under gstreamer using v4l2src, no errors for all reported resolutions.
> > >
> > > Attached is the libusb output from it, and the v4l2_compliance report generated without the quirk applied. (with quirk=2 it reports no failures)
> > >
> > > Thanks for a great driver and documentation
> > > Brett
> >
> > --
> > Ricardo Ribalda
>
> Cheers,
> Brett



-- 
Ricardo Ribalda

