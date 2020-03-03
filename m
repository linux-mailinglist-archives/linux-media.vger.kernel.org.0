Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4A8C176FB1
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 08:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgCCHBh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 02:01:37 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46688 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgCCHBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 02:01:36 -0500
Received: by mail-ot1-f66.google.com with SMTP id g96so1938390otb.13;
        Mon, 02 Mar 2020 23:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SD5hC13RRY7Vw7nLNHm5iwrccr55FVHZ1Ac80dlGQsM=;
        b=uhJ+XyQhpzAefT/JDCvf8SXJgdoHVhV3mHo2maj92lOfYo9p2K5TC+MoYui50W+TBQ
         nmrHhtI2uOFg/mMQf9dg+UQkxWIQRda+qi2uJ8lQees2BXNbyUUlgvn0sk01NHEw+vDC
         bZ2WiOMnlOo/a1gn012gM5Tr9EvUbXtCvVBnrM9IZArNrTnGx9KH2WIb9pNJ7qeOxez6
         UrEb3w02fNtR/dSYRtQr997r9X/Es0u58ZnJdCqHaDdX80QrkrTpa9XU8vemdE9XX7Az
         o79oKwODC6zwHPDYLwSbCRI77ZZwj4OrzwBQ6esklVUCTjCcaQg8VXlVc6pWJGbu/URJ
         AQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SD5hC13RRY7Vw7nLNHm5iwrccr55FVHZ1Ac80dlGQsM=;
        b=FdNN091XIcTMZoATwLSOiBw5Oj9f6fKBLr3Z6T8dCt35VQaDnXlpCvzAA0O4NWLKTq
         WhJTDQO17qZOzvp5hXEqiikcZpyxs29Ma4klBrtTOvC37I/jFem0bUaSZhVIEx2vM/IK
         YUQ2xDSnctfuGsoTaAGHvoY0X3Hh6TLAg1on9nl6cq0qWbL5dR4sqDsf0dYBEfss5NhG
         oPgNMSXe11yzJoToKB3m1wdP2DnvVh7VOED1wjw8iJPFi5dzR3AGtLtZP9JOKfSm1bvd
         RWqtIV/mkLQVYXeml83RET8c81llFiDKN/5yAO5umVAxl7ye4EB/9tim+pE/4O6TJOn0
         FeTA==
X-Gm-Message-State: ANhLgQ0ruWzmmt64KKHfxz/L1JOHw2VtIcMAaDT3KKC65o/Y06dq4/t7
        Jvn7NGTJDrhVDV2DPF9IkGVSbN4+fgEUeqCKCGk=
X-Google-Smtp-Source: ADFU+vva+DtX0SFkaHIioz/BaBueewD+kpu8lTxfpdciTgvvJ02Ky6kRgu2FzqzhIHJtEt6USsccmJQ+6pC+UNLroyw=
X-Received: by 2002:a05:6830:1481:: with SMTP id s1mr704531otq.44.1583218895864;
 Mon, 02 Mar 2020 23:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20200228164126.17517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAOMZO5AP65Upj8v=KaPLzS10DNdwrz20gJGbwbcJfCDqZBx71Q@mail.gmail.com>
 <CA+V-a8s_d3Atp9J5KM=x4z2z_iAY8+9vcSHFUTyQ3XZ9HCCS3g@mail.gmail.com>
 <CAOMZO5DP3BMmmL3eM5dmhy0YdMGvD9UW1mUXb1tYds9eVbE6LA@mail.gmail.com> <CAAEAJfBmvGhMWCCh80Y+qG26OKg5Af5U+Zdtgrbt27cS9YgQug@mail.gmail.com>
In-Reply-To: <CAAEAJfBmvGhMWCCh80Y+qG26OKg5Af5U+Zdtgrbt27cS9YgQug@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 3 Mar 2020 07:01:09 +0000
Message-ID: <CA+V-a8uAWnw4QNvqROmbv75GOwwyTmvbyeFiOE9HOEuByv6=qQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5645: Add virtual_channel module parameter
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for the review.

On Tue, Mar 3, 2020 at 3:01 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Adding Niklas and Jacopo,
>
> On Mon, Mar 2, 2020, 12:33 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Prabhakar,
> >
> > On Mon, Mar 2, 2020 at 4:19 AM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> >
> > > > Should this be a device tree property instead?
> > > I did give a thought about it, but making this as DT property would
> > > make it more stiff.
> >
> > In case a system has two OV5645 and we want to operate each OV5645
> > with a different virtual channel, it will not be possible with the
> > module_param approach.
> >
> > Using a device tree property would make it possible though, so I think
> > it makes more sense to use a device tree property for this.
> >
>
> As often happens, driver parameter is probably the easiest and less
> invasive way to customize a driver, so I can imagine myself carrying
> something like this downstream if needed. Haven't we all?
>
> It's definitely not suitable upstream, as Fabio points out, but
> I don't think a devicetree approach is either.
>
Agreed. I was suggesting maybe v4l2-ctl instead ?

> It seems Niklas and Jacopo have been working on adding
> proper support to route this, via some new ioctls.
>
> https://patchwork.linuxtv.org/patch/55300/
>
> Not sure what's the status of it.
>
something similar needs to be implemented for ov5645 driver.

Cheers,
--Prabhakar

> Hope it helps,
> Ezequiel
