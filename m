Return-Path: <linux-media+bounces-4130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3802B83A2E0
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 08:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8AF6B267DB
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 07:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDFA168A8;
	Wed, 24 Jan 2024 07:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g1jAxvYh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA46ABB
	for <linux-media@vger.kernel.org>; Wed, 24 Jan 2024 07:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706081295; cv=none; b=KdEMwG3DgqopDWruBWL0aUaVRn6WBcXKcb8KaELkBvUbpCm8lAdtXnMoKy9RR0u72UQXc3QhMbQ8PVyX2GK6pH64bTEchh/xbxUybhMOJ1irCIKyq11TfEREKcWRD3F9zEEhMME9mF6kThDKxVjuBe9Apgfrfw4q/GRaT5Q5ooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706081295; c=relaxed/simple;
	bh=+ndYxjos0Y+6Em63SC7c4TLkSBRbBtlIsiwz3kZg4Ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJpFm1nm9ihrtPw9l/p4AeICrI1C33wBwqNYq0WDJHoH2iKf0wxa5LSah/zgA9QrOrDSdkjjZbfYITa0TH4y2tyNfeE65HuW1u/uswrH7rb66kNTvsfuLQSyESz6GAijBCj3Bu/eFZ8Eet7AqTLlWKc1f1wGb7+jCKWxpAknnIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g1jAxvYh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso504904266b.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 23:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706081291; x=1706686091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjyqm2IeXH7wh2tBT6gZo5jWDqMA67fsqoDW3afo7vc=;
        b=g1jAxvYhlln7/dp8mvv65WotOibTgJY6/Fu+PIv2ngM3WsDz0qlk9exCqEY2B7MBiz
         j9OGFtxQSzOzwSU6uMf+2Aw5K833ta4C1ngjyHgAqI8oSMokyt/HsyBEL79QzdUkgPdM
         UL9fsRm0OGZTcEjXj6dsJcf+fJeYDDToaPoFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706081291; x=1706686091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjyqm2IeXH7wh2tBT6gZo5jWDqMA67fsqoDW3afo7vc=;
        b=mT3dxts4ZK13DVtCv33HzRGhWobyJJYNJnF/F3ZZT77Akg8WOQ2gkUSwBLuO4q/JC3
         bNhdzkYIl3daJNb26KiSaaw7/Cmg036LNYipF/2I8zseMdErrprUuC6KOWOCvGEjQXVA
         4wQnDq3aKuGKiPWiSezv3zJc493mxCI7fbtnO8lc0zSPY+1lofzvYs5Cx6DvRXz8dG0f
         TJDhiMoNzUKIE91L7ceDrWuS4b2+qHd8sT3uQ2AxvLPx40hlWJRlwOtEFU6s5kMsmonU
         LJ1AJj73qUuxHmUH1Rng98QIXqrZ7cIRrtcj5Zam4n8lYwS8K+c686Lq1LC64BfRdhu5
         i3KQ==
X-Gm-Message-State: AOJu0Ywcgfb3W1/tjAP8uUyXJGdtm6NNDPTV6pz5gz8/w9EuZTyVhUlI
	Jh/9iK9T7N6E+C+2qm0DUdEhRXEvYxb1GjFQJSRs/j/RnM7ogMWkD6Vuevx6T3H9MdV1/t6O478
	oig==
X-Google-Smtp-Source: AGHT+IGHhF2feOPibhQzWTibQULUooTrNaRHSaY94yahSogJYsmeuhb3yatd9iBqCjSMwgnTVcXf4g==
X-Received: by 2002:a17:906:3592:b0:a2a:d44a:cada with SMTP id o18-20020a170906359200b00a2ad44acadamr631892ejb.129.1706081291350;
        Tue, 23 Jan 2024 23:28:11 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id tk4-20020a170907c28400b00a2ce236ed71sm13706521ejc.43.2024.01.23.23.28.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 23:28:10 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-337d58942c9so5395836f8f.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 23:28:10 -0800 (PST)
X-Received: by 2002:a5d:564f:0:b0:337:9a6a:a403 with SMTP id
 j15-20020a5d564f000000b003379a6aa403mr274737wrw.20.1706081290350; Tue, 23 Jan
 2024 23:28:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124033154.834344-1-jason.z.chen@intel.com> <20240124071837.GA3976836@google.com>
In-Reply-To: <20240124071837.GA3976836@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 24 Jan 2024 16:27:51 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BjBgTWNW4M5NPseLxm0aFzjhrF-q=jLth2eXM+5RM09g@mail.gmail.com>
Message-ID: <CAAFQd5BjBgTWNW4M5NPseLxm0aFzjhrF-q=jLth2eXM+5RM09g@mail.gmail.com>
Subject: Re: [PATCH v5] media: ov08x40: Reduce start streaming time
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: "Chen, Jason Z" <jason.z.chen@intel.com>, sakari.ailus@linux.intel.com, 
	bingbu.cao@linux.intel.com, linux-media@vger.kernel.org, andy.yeh@intel.com, 
	qingwu.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 4:18=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (24/01/24 11:31), Chen, Jason Z wrote:
> [..]
> >  /* Write registers up to 4 at a time */
> >  static int ov08x40_write_reg(struct ov08x40 *ov08x,
> >                            u16 reg, u32 len, u32 __val)
> > @@ -2936,6 +1827,19 @@ static int ov08x40_start_streaming(struct ov08x4=
0 *ov08x)
> >               return ret;
> >       }
> >
> > +     /* Use i2c burst to write register on full size registers */
> > +     if (ov08x->cur_mode->exposure_shift =3D=3D 1) {
> > +             ret =3D ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_=
FIRST_A,
> > +                                           OV08X40_REG_XTALK_LAST_A, 0=
x75);
> > +             ret =3D ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_=
FIRST_B,
> > +                                           OV08X40_REG_XTALK_LAST_B, 0=
x75);
>
> If we have to be pedantic then second ov08x40_burst_fill_regs()
> overwrites whatever first ov08x40_burst_fill_regs() returns.
>
> But it's unlikely to be a real problem.

Hmm, good point. I guess in theory we could have a situation when the
first write fails and the second succeeds and no error is returned
ultimately... I guess I'll leave the final call on this one to Sakari,
as the maintainer. :)

Best regards,
Tomasz

