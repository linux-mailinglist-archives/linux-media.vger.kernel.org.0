Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634AF1DD23B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 17:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgEUPpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 11:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728315AbgEUPpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 11:45:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3A9C05BD43
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 08:45:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u188so6843997wmu.1
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c5TekS/gqJoaBFfkjHpLDvrf7L/QxWIjFGYMdytg2QU=;
        b=Rgc33QsBa95gR1OJets/mqYh/8ScIm9Z5t7vXdmjSSxh5PLS1/t+6pIlBZO77OLD5J
         4/SThAZcFF4kRhjq9dnNJoF3MwPPSoaoUQRLMIzRbZ8uhGX2GCoKmgjKxF0R0USd1ST2
         Hxveu0oCMX2gddjgHaxcRfTayVTyvqoXZapjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c5TekS/gqJoaBFfkjHpLDvrf7L/QxWIjFGYMdytg2QU=;
        b=mjsEA6blCBi76DKtLmUVxOdPYtYuPeZhMnstqdBB0Y5lLmJlci2b1d5ZCRxaUXGOe7
         EBdLHDbRwy5wwfAuYrF1hHZzRDF+hYf+3IWrnXX1J37ewKpaCyOHd4TeesJ22iZDl6Q+
         xzk208N+LGJ2ijtoLv5/q3f2louNbCE0u2dQ6Jxqlz7wbS9H+sP4AEbkCc933Gx3t8Et
         +Uab0ajPZZlCr5jsuqo9Qb2JfOxzRZPWd/8K6523obxGrQTio0NOeWc9ZVIMxvzUU6Fp
         Acy/YZ+lQDLVJZFdzy5vzC1uBj4eWds7Ki2YJU4lOAPzqz1YxQSMb/QUUTcUXsSjDmvl
         ajBQ==
X-Gm-Message-State: AOAM532Ua+ZB1J1yysnbTtK5EeqJrtlO19ifvzEI3MSfb/b+H3HplzQV
        qdT1hp73xpi/OCW+Y6V42QkIFQ==
X-Google-Smtp-Source: ABdhPJwAVu5t0ZqfWJtIhj/nNKgxybzQqBLtV6Ok88bjUrcykbcSSAFQiIz/IgQV0Ib4W3Spc6IFAg==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr10060544wmh.31.1590075900750;
        Thu, 21 May 2020 08:45:00 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id l11sm7201650wmf.28.2020.05.21.08.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:45:00 -0700 (PDT)
Date:   Thu, 21 May 2020 15:44:58 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH v8 09/14] media: platform: Change MTK_JPEG_COMP_MAX macro
 definition location
Message-ID: <20200521154458.GH209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-10-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-10-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 03, 2020 at 05:40:28PM +0800, Xia Jiang wrote:
> Move MTK_JPEG_COMP_MAX definition to mtk_jpeg_core.h file, because it
> is used by mtk_jpeg_core.c file.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h | 2 ++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h  | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
