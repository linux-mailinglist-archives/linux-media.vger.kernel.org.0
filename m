Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE631DD2A5
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 18:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgEUQC3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 12:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728093AbgEUQC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 12:02:29 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5D2C05BD43
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 09:02:29 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id n18so6909129wmj.5
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 09:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FFgD33+aNouNGQWGPAQ82q8pOVxArb54Ymtj9k6c/CI=;
        b=IGMUFSuZHglbq89dE4lbiHY6u0LsaqFDfzsLsjDKYGX4etHufoYeD8MS2j3VMbQ2PM
         QYQ2wFMBSsxWjwvI7O4lhXaSNIwjtur44RocetRNs9sxRMWwWs7HxhKmb6El1eqr43uc
         qj5WC8JdzADa1cvKlTb2t6+rKtlh1XdmkFwVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FFgD33+aNouNGQWGPAQ82q8pOVxArb54Ymtj9k6c/CI=;
        b=iDbcrtCANR/VTPPA3FqqEB4gmW+gKT75CBCgZyLK0hLHLg+b0Ih1jIDGix8HUuS7IF
         lVWQ/0ASjzc9TFI3hM2K/oY6KvC+j8SvJQk7JjUZ3g3mS885rhQiuuhFo3MUfuyrGjD8
         dQdnv67cfr2gXmyOYW/+lV4h9M6Bk7HKRNMGmXpTgu2x4h45UdlHflPPaZkxyU++9LIr
         HvhWo+ziVyr0yQ0tMeURJCuYAWUH33rMa9+Gldg7jJvKQNj3cogjNYyrXW+eqXqWt6k0
         koGnSD9qVnKi5Epb5eCJkkvX2NGj5EF1VGIxiYnfNyUHNODmepqiLDg0jdwndBXNmtjY
         uUig==
X-Gm-Message-State: AOAM531MYdbHV1empKWQ16osDruuXYKnjOIRBGU0gLH5H2iIAS6RfOPr
        FGf3krkfLBa8JvWd1NbqgDumYA==
X-Google-Smtp-Source: ABdhPJyvZZpk19V7dcx34aHKaL1bXMZY4n4ffWiVEXRuCg9hQzx9AwjLNVAy7P/eRQEZ4BCf3LkRUw==
X-Received: by 2002:a7b:c207:: with SMTP id x7mr9976002wmi.79.1590076948087;
        Thu, 21 May 2020 09:02:28 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id x10sm7147943wrn.54.2020.05.21.09.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:02:27 -0700 (PDT)
Date:   Thu, 21 May 2020 16:02:26 +0000
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
Subject: Re: [PATCH v8 13/14] media: platform: Rename jpeg dec file name
Message-ID: <20200521160226.GK209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-14-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-14-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:32PM +0800, Xia Jiang wrote:
> Rename the files which are for decode feature. This is preparing
> path since the jpeg enc patch will be added later.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> 
> v7: no changes
> 
> v6: no changes
> 
> v5: no changes
> 
> v4: no changes
> 
> v3: no changes
> 
> v2: no changes
> ---
>  drivers/media/platform/mtk-jpeg/Makefile                      | 2 +-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c               | 4 ++--
>  .../platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}    | 2 +-
>  .../platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}    | 2 +-
>  .../mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c}       | 2 +-
>  .../mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h}       | 2 +-
>  .../platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}  | 0
>  7 files changed, 7 insertions(+), 7 deletions(-)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (99%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (98%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (100%)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
