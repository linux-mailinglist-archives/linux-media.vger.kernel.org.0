Return-Path: <linux-media+bounces-26718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C6A410EE
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9870171C65
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D85316F288;
	Sun, 23 Feb 2025 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PM844Lyd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D61A29A
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 18:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740335690; cv=none; b=fA6GHlffMVmfuXL3LWQXfSvTzPuIWkzpfEXgVjjEVNtWoGxTairmZS/IBDNp+wufRwyeknoxfgAWUjQkCDgdKVR7HEd67eH7PZI25LiWp5nHTeW8i+iZ4P8fJXi3+JCMcCuptgkyLffhxXzMeb84lfqaFYHO2yL0wY2VCTr0z1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740335690; c=relaxed/simple;
	bh=Q7f0bptqboJdMiPWFy2P5hU0sfFsmUIydK6IWF+KPlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCZtkSi7BexbWZLedxTMuE7b+sCQJdGBLrSdxpR9FnqBu4Dag0T1Am4FU2tzM9NhUU6j3DDF2P/ZdjTbq1Z/o6T3BumSlhtKShT0FWokSqV+aMCmtDlVMDW/jdVUtPY3VPUYKUty8VDuEegLqqxFSZeyDlVx0BDIqj5z+G5fsfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PM844Lyd; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30795988ebeso37196351fa.3
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740335687; x=1740940487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U0C+iu1WeNs+zRFQEZ4WEKG2Hv7tO/tPX0DsKYx3e/U=;
        b=PM844LydsEN3vjz45qnaH1aNouiSe0VKYfL+PndvzEn4kll7AvORMYbOdnJ1fw08ib
         PcJUxexXtdVeC+6sHiAE92pfyr7pzNcWA/bgYhVJyLstlizLNKYCN3LSRDjXAirt53+0
         mougoisSfYUxX8cY8f5Pi7rERVuQFiWX+g7ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740335687; x=1740940487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0C+iu1WeNs+zRFQEZ4WEKG2Hv7tO/tPX0DsKYx3e/U=;
        b=IqHV4z0NOKbXFvSTLL1b+0DBFFl85j+mx1IZGRlV949G7i0/IxYJP4Vw/TQB/mfNau
         TXQhuO31T+GBbjaziv285JC72Q56iNu1uXv8GbLFrRuxhLdfS4FWo/BC5B3136aCqUNp
         dbkJVSTkuF2o+In8ODNq8HUOHRxstk3+VfeNzTYGUVUTQExEI9WT+A7skFwtamxSU1Q8
         iNoWAyZZ/9xUrgG87gH6SCVkter13zi5gddxl0PdGPAj+NypGHdHPhYNvsUkT7GDpZpj
         nDcz1IupD7thVtEvBDduj7IExIatiuLHu7MKZM8SJAjNOuSGspHldvrOwRNMuBhjC7wn
         Wbzg==
X-Forwarded-Encrypted: i=1; AJvYcCVLRKzsPcE/8bdrW2zJFUG4E5hR/XAoFt3jz1bA98W8ZI8McIbOCZnHKvEtm4K0FPGUvtEEwpeJOm9nTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWEKIr4LWTtZ2F5xm8dZwbisR3CQw1e6Kr1wSGRVUC8ayOFL2v
	IBE8VFQu2An8kY5d1A8N9pl8gJfVBnVURyx9wOeABmKPNINnH5w71kK2z6CwFY4hscHuuEJvJlw
	=
X-Gm-Gg: ASbGnctWtmNsj9SXS3z2v5Ip59RH7x6o/hSKlRjzRDoszvaZAzMLGJu8b/aI3qtl6CH
	hfUBi/N+bqUTbQIgkLZyhalceEK6axLRL6FvgfJpdGS7e/PIh5nOI1IeVm1LfERzlS7y5K/iPdb
	+BW+dElLSwn6qVxjDw6E/HpjcEx9S5PhEv5/7YS3S7ivvtjF9EPmH0Dv7EbnAMhOAMO+6w7/uIf
	SIZUUblZOsTCoPU3Mky7lEM/770npblyZOuQas22MDeZ3PD1nZ5PLmbB6FF48isznE7uYF9FECl
	GFTqiCQel+SI2Zdg5uzNz3cC/P/bGwCFwwv/kknAet4NdB8Kuu1+8JBslmSW98IN8nLb
X-Google-Smtp-Source: AGHT+IHcUlvQdWWFPwp7QjWZLoYEm6UROHvsrDtemJv/QGYFgeGc430WYzkP38Z/sG8+8Qw9gkNZSw==
X-Received: by 2002:a2e:8941:0:b0:307:e031:15a8 with SMTP id 38308e7fff4ca-30a5986fdabmr34893621fa.8.1740335687043;
        Sun, 23 Feb 2025 10:34:47 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a598a2ec1sm8306191fa.39.2025.02.23.10.34.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 10:34:44 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30762598511so33262581fa.0
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:34:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwMZIG+CYak9hN8+X3qOGzrLoahFBADQ0xcQ6MTGf6J1BiV1foesTFT8zoKxua/fRYfCq2qQe7USd4rg==@vger.kernel.org
X-Received: by 2002:a2e:b614:0:b0:308:f84b:6b34 with SMTP id
 38308e7fff4ca-30a5990b2ebmr35382051fa.20.1740335683340; Sun, 23 Feb 2025
 10:34:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
 <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org> <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
 <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl>
In-Reply-To: <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 19:34:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>
X-Gm-Features: AWEUYZkxdyzd_jgZvmXlXPTuqCYemf2QEgvVhq5WasLvpB-Xk2V4c6RpmAx6ZOg
Message-ID: <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 21/02/2025 10:04, Hans Verkuil wrote:
> > Hi Ricardo,
> >
> > On 21/01/2025 22:14, Ricardo Ribalda wrote:
> >> When we obtain a reference to of a platform_device, we need to release
> >> it via put_device.
> >>
> >> Found by cocci:
> >> ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> >> ./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> >> ./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> >> ./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> >
> > This driver uses this construct:
> >
> >                 struct device *ece_dev __free(put_device) = &ece_pdev->dev;
> >
> > to automatically call put_device. So this patch would 'put' the device twice.
> >
> > Does cocci understand constructs like this? If I hadn't looked closely at the
> > code first, I would just have merged it.
>
> Oh wait, now that I am reading the following patches I see that it was those later
> patches that add the __free code.
>
> This is far too confusing. Please post a v2 that just combines the 'fix references'
> and 'use cleanup.h macros' in a single patch. It makes no sense to have this two-phase
> approach.

I believe this is discouraged.

cleanup.h macros does not exist in old kernel versions, so makes it
impossible to backport the fix to them.

This is an example of other series following this policy:
https://lore.kernel.org/lkml/173608125422.1253657.3732758016133408588.stgit@devnote2/

They also mention the same here:
https://hackerbikepacker.com/kernel-auto-cleanup-1 .... I am pretty
sure that I read the policy in a more official location... but I
cannot find it right now :)


>
> Regards,
>
>         Hans
>
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >>  drivers/media/platform/nuvoton/npcm-video.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> >> index 024cd8ee1709..7b4c23dbe709 100644
> >> --- a/drivers/media/platform/nuvoton/npcm-video.c
> >> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> >> @@ -1673,6 +1673,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
> >>
> >>              regs = devm_platform_ioremap_resource(ece_pdev, 0);
> >>              if (IS_ERR(regs)) {
> >> +                    put_device(&ece_pdev->dev);
> >>                      dev_err(dev, "Failed to parse ECE reg in DTS\n");
> >>                      return PTR_ERR(regs);
> >>              }
> >> @@ -1680,11 +1681,13 @@ static int npcm_video_ece_init(struct npcm_video *video)
> >>              video->ece.regmap = devm_regmap_init_mmio(dev, regs,
> >>                                                        &npcm_video_ece_regmap_cfg);
> >>              if (IS_ERR(video->ece.regmap)) {
> >> +                    put_device(&ece_pdev->dev);
> >>                      dev_err(dev, "Failed to initialize ECE regmap\n");
> >>                      return PTR_ERR(video->ece.regmap);
> >>              }
> >>
> >>              video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
> >> +            put_device(&ece_pdev->dev);
> >>              if (IS_ERR(video->ece.reset)) {
> >>                      dev_err(dev, "Failed to get ECE reset control in DTS\n");
> >>                      return PTR_ERR(video->ece.reset);
> >>
> >
> >
>


-- 
Ricardo Ribalda

