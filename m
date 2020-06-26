Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA6020AB86
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 06:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgFZEzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 00:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgFZEzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 00:55:14 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3EBC08C5C1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 21:55:14 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id k15so7463847otp.8
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 21:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wi1GFCWALRog62SpR3oo7ajuACihs+N37wB4PqfLs6Q=;
        b=LFNJdaR0AkSuh3MJcgNrsQlDU/7wrBA3cC9RvNe5/S1FtK59iGcfNz1pqPRCOOZOHM
         D8oaKjuHKvY6H/P77GhepO6B2WNZrUoi6FKBVN7WfMu5721zquQvROmijyOcMMjgU8KS
         zanPdyNJEkfk2FvZ/WiZyQyGddNJ+XFEiseu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wi1GFCWALRog62SpR3oo7ajuACihs+N37wB4PqfLs6Q=;
        b=uVpHg+uwG3rMHYWz8cvjBIDBZonHGOS5SMMsPEZXONgEI/UrqkgmfWnE91mfBe8ymM
         ajuTIA4cv3mlzb35bGG5AEiXqzqtexQzldGfckjsXb9emcMkLTTeq4oXF5gW3twjNjKf
         +699nqecrzY0Yf1sClWqCT3C+kssOg7MUjkK+Cmd4M7Lzn7Tv4F0xKNw9JD05oucXNIS
         oqwumj/RGxjfDqoampzyCeCLABqyBKYbn0eWTC6F//oZb4IgX20pseCh8RB3zrFOf74k
         q+Oa26bgEsxyiex+tPj1RO6yKfD7xozdGHPLMqxUqIKQ0Gcv7YfBKBJImR8SuXAwsuPi
         HRlw==
X-Gm-Message-State: AOAM533OuKWUvKP6GejT/Y0QYjoRe2i1FESSyi5UPiSxq6NvbmjRHlTK
        /4d2fl3LjvThUSWlJ0YoNpm21WQJG2TBew==
X-Google-Smtp-Source: ABdhPJxR4OB+ViVLwP6cZC+4hLUQeYRN20XKBrg1COqakyesW0aT7HoW/+4wcmxynM4XrbjLbTX2sg==
X-Received: by 2002:a4a:e9e9:: with SMTP id w9mr879983ooc.3.1593147312447;
        Thu, 25 Jun 2020 21:55:12 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id z9sm5956810otk.74.2020.06.25.21.55.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 21:55:10 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id n5so7515428otj.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 21:55:09 -0700 (PDT)
X-Received: by 2002:a9d:64da:: with SMTP id n26mr976709otl.36.1593147309361;
 Thu, 25 Jun 2020 21:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082723.96136-1-acourbot@chromium.org> <20200520082723.96136-7-acourbot@chromium.org>
 <1592551593.32358.1.camel@mtksdaap41> <CAPBb6MXOPMhtSrAa+F+0BcC7Uzc4UJQU29eBMi5fv1zjF2D0jA@mail.gmail.com>
 <1592875738.26708.5.camel@mtksdaap41>
In-Reply-To: <1592875738.26708.5.camel@mtksdaap41>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 26 Jun 2020 13:54:57 +0900
X-Gmail-Original-Message-ID: <CAPBb6MU6GRwaSkJWkdt3_0a=TDoCuoBTv3QKuRDbDQ0htCYS5A@mail.gmail.com>
Message-ID: <CAPBb6MU6GRwaSkJWkdt3_0a=TDoCuoBTv3QKuRDbDQ0htCYS5A@mail.gmail.com>
Subject: Re: [PATCH 06/10] media: mtk-vcodec: venc: specify supported formats per-chip
To:     Tiffany Lin <tiffany.lin@mediatek.com>
Cc:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tiffany,

On Tue, Jun 23, 2020 at 10:29 AM Tiffany Lin <tiffany.lin@mediatek.com> wrote:
>
> On Mon, 2020-06-22 at 21:44 +0900, Alexandre Courbot wrote:
> > On Fri, Jun 19, 2020 at 4:26 PM Tiffany Lin <tiffany.lin@mediatek.com> wrote:
> > >
> > > On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> > > > Different chips have different supported bitrate ranges. Move the list
> > > > of supported formats to the platform data, and split the output and
> > > > capture formats into two lists to make it easier to find the default
> > > > format for each queue.
> > > >
> > >
> > > Does this patch pass v4l2 compliance test?
> >
> > This should not change the behavior towards userspace at all (it's
> > just moving data around and making it more flexible), so the test
> > results should not be affected either.
> >
> I remember that passing compliance tests is required for upstream.
> The tests try to make sure that all V4L2 driver implement interfaces in
> the same way.
> So user space applications could find/enumerate HW capability.

I have confirmed that this CL does not introduce any regression with
v4l2-compliance.
