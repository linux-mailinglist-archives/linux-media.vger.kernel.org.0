Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F2B372C5F
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 16:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhEDOtY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 10:49:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230313AbhEDOtY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 May 2021 10:49:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FCE2613C4;
        Tue,  4 May 2021 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620139709;
        bh=bSJNWoPTxsmjw9lgwCAD+AS0aeK+yfFlLEQuCSSvXnQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NzdVl1vE/HpTNbvRa+04w8VtolgUimmr0osBl+n8x5D8Y4ujpeOeofDBS6nB0uz3r
         K34SZzHcYShda3uAJZhQ5mRKKYxACPdQgh3fX9S/AvZhqY+rRyvcSE9U9mpgM8yBoc
         1qkXPBibcPsHxqmuJOVU/tPGzkNBsMjq5EZZ+WEZNAO3w4O7b3xxYCOp+jVV0W8gJm
         wKSC//OV80HwQAwzU5ac4hjHCDwCLPR6OZzksW/7g//0vTWAzeTEg+/HGyrr0Q388M
         9rmqNyGBWPv1qG1SbavfsqJWJThNd6e5zqeH3AVxCTEe1+6gcqyc3MTviacEwwTj7c
         4fEnzC231ZJ/g==
Received: by mail-qt1-f179.google.com with SMTP id t7so1512240qtn.3;
        Tue, 04 May 2021 07:48:29 -0700 (PDT)
X-Gm-Message-State: AOAM531biKX+wwzOc44lt6U2YTVonJVMOgnHf6nOHNJ4RN5Y80XEPRqE
        1TVFgTP0/3BZzOtRhdWssGO94WhPcX0FMx8bKA==
X-Google-Smtp-Source: ABdhPJx5atFlFwZpc+7ej9uT8D56VLMBLPhSM6lU+FgDf8UJdvAVnLaysl19h3fODAoht/lkSZv/rL3FKvgD/I3SVDk=
X-Received: by 2002:ac8:5d52:: with SMTP id g18mr23270245qtx.380.1620139708372;
 Tue, 04 May 2021 07:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-9-acourbot@chromium.org> <CAPBb6MWhP+uJSHzMHuH93fxgFosw=FPUoHOLuDX1ZYGunWX11g@mail.gmail.com>
In-Reply-To: <CAPBb6MWhP+uJSHzMHuH93fxgFosw=FPUoHOLuDX1ZYGunWX11g@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 4 May 2021 09:48:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL5ZZvq48c-3Dw70N8cqH1wNC-N9muAX41oD6OQ4E+Uig@mail.gmail.com>
Message-ID: <CAL_JsqL5ZZvq48c-3Dw70N8cqH1wNC-N9muAX41oD6OQ4E+Uig@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] dt-bindings: media: document mediatek,mt8183-vcodec-dec
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 4, 2021 at 7:56 AM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Hi Rob,
>
> On Tue, Apr 27, 2021 at 8:16 PM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > MT8183's decoder is instantiated similarly to MT8173's.
>
> Gentle ping on this, could we get your Acked-by for this minor change?

First, please don't ping for replies during the merge window. Second,
if you want to be sure of getting a response, you have to CC the DT
list and then you can check PW and see where you are in my queue[1].
Third, my ack really isn't needed on a simple compatible string
addition.

In any case,

Acked-by: Rob Herring <robh@kernel.org>

Rob
