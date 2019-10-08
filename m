Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92AA7D0298
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 23:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730832AbfJHVBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 17:01:44 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51601 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730720AbfJHVBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 17:01:43 -0400
Received: by mail-wm1-f66.google.com with SMTP id 7so4662980wme.1
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jSPyD+NFUfaJf22CPp39ptAF13OYoJWbOFlSOM2zNk=;
        b=XxWL9t8JbrVzJbIxugwxmrvjq344s63MRvX6BlkxCH20Tq4ruIY2bgH6prnI7Mv+EH
         5eD1Y6oat/CbydhJEIbOljgFLzBLuuCqGfRnpvWlab6YlkNZRBpvrXZYA98AvWr9KzsF
         ZlolZIBf1HtbkEnGQ1QPrQF5p3UrWwddS6fPKOb0yf5FOEGDj5Esp6U8U/5Ww++Vzfs8
         QiUl/oOJ7inAlePe4TnDULHus2MDJQc9JXzVvjE8j+hoGSJ95EnEGItNccF+JZuTpJC/
         32ZQ/8/ZXPtqQ7tu28T1sKUAvxGp5HfCZIPZxtshOXfL6SINqv5KP3DhbRhTxlCFHj9V
         l9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jSPyD+NFUfaJf22CPp39ptAF13OYoJWbOFlSOM2zNk=;
        b=Lwm8FqBhOfxZ4BxbqPB+UYjt2Ib2Y6hmhsoSmG0YMtJp6SsRlsjB/1Lm69XZDe3Wbp
         oCZPwCmNb081bTyX6wVToVgZ6VcU8FU4WciFJwrvpWROae9CyFbat5BUfcfoAPx4+nEG
         cRB30dhvjNJR6g/s0yxhQWSNjqoqWXp4VSuUOeLktJo7NYa9DrbTfW4phHmFVDKqgbGW
         LlVm/bIpgbqE1Vib8TxX9yWbyZG3kfdI+9SEljdwYeqLf8ve6zSnNQeOeDsBqCsCRRXq
         /vhXYJcQ2kIcQDD/1JUzeRU5BzwNDFZNpvulCkRUqGi998Ig4H+P/WmKZYqfPg1Ex24h
         hN7A==
X-Gm-Message-State: APjAAAXGp49rOtIUMTCwrDBRjSGu8Kzoludbndt83blDxVqGpzg8nRlo
        6yJYiZS+vchcFLZ9dPJ7TfI3mM5WQAo3DLYdMHPuJQ==
X-Google-Smtp-Source: APXvYqyQuJ/ds5TBnC3WhvTNy/d0C5txSL1/benve3H+pTwmJlwDic6DH8QtVhSL9ZxsU/U4JvSUFdCVfxkyu54Xzl8=
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr5574095wml.14.1570568500369;
 Tue, 08 Oct 2019 14:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com> <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com> <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
 <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com>
 <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com> <CAOMZO5ATZw80cz6WsNUxWfgsqqX-R6A6SKz7tFQa=Tdy2ynWJA@mail.gmail.com>
In-Reply-To: <CAOMZO5ATZw80cz6WsNUxWfgsqqX-R6A6SKz7tFQa=Tdy2ynWJA@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 8 Oct 2019 14:01:29 -0700
Message-ID: <CAJ+vNU1X6kCeA=CVcGqEU4DCH8ZO_EwdARpyuXdGVMH_Uu7+7w@mail.gmail.com>
Subject: Re: ADV7180 Capture with i.MX53
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 8, 2019 at 1:34 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Tim,
>
> On Tue, Oct 8, 2019 at 1:55 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> > I still carry around a patch from Steve for imx-csi that drops first
> > few frames from BT656 sources:
> > https://github.com/Gateworks/linux-imx6/commit/959fbd42ee6433f49ef4a04fb1abe8f8c78db5ad
> > to deal with this.
>
> Tried this patch and now I see the scrolling happening horizontally
> (from right to left).
>
> Stil trying to get stable video from ADV7180.

Ok that's strange indeed. I did recently test 5.3 on a Gateworks IMX6
board with ADV7180 and the one patch to drop the first few frames and
its stable. What does your testing show on an IMX6 and do you know
when it may have broken for IMX53?

I do have a discussion going on here about NEWAVMODE and BT.656-3 vs
BT.656-4. I wonder if its something to do with that as that issue
causes rolling video on IMX6 with ADV7280:
https://patchwork.kernel.org/patch/11117579/

Tim
