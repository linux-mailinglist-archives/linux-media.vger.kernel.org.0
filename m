Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCD41F69F2
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 16:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgFKO2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 10:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728196AbgFKO2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 10:28:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28760C08C5C2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 07:28:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c3so6356890wru.12
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+MwiHwTDigrZz/osHSq5jwVMysur4yPnyLBBwzskG3k=;
        b=hF9rAdqc/Vs5/6fKuks+MMwm5u0HPIk5I3T763FaYv8nJfRnzVmYS6TkZwBkpQEK58
         OabTcSTw/chyT3nEYjpMZQDEOQc+ToSeZ2/XR3JxMVn51VBleocqPt81rwrJnQrtsfTu
         fNHm+OBopt1RhC9Zm1Z4ugCbwiZh785kwWvlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+MwiHwTDigrZz/osHSq5jwVMysur4yPnyLBBwzskG3k=;
        b=Qh+BrM6jYNOwSAOuGybM+wA+9cQxjLYmuD8L8lM1QqORU1Bc7Oaev7ZhJ/keesKnts
         WhqNCozxMeh+Cy2UdciauX9gSPTevg0FKTJVTDfkzKRK+iN3ruwm/o4tZ4O/Rzp5D3tr
         YsvR4bhm3rT9T3uC7bXnr+IgCC+f7fnWWbY6dq8Ja/vn50StTjjVp515Q5Ir5XUKKXCx
         qeVipbV3+GONYErUVpGM8oUG36C7HbELG6MOmTvmEglzdGUD25vZ+MjgceUxPdcnEJA3
         CZR5XlW2P6KwUqkBa+Hs14WC4Jffhxu/Hmvi4l6xhV9tM3tUrUA16cVOGgUDj2C3uKAN
         tFwA==
X-Gm-Message-State: AOAM531RSZ4PfRwgnA1lf/9d8tyICAc5sSODFDz/L/HB2Chahc0LmdnD
        D/k//v99E/BF8Va+IKq5e+TP3g==
X-Google-Smtp-Source: ABdhPJzQ9+KT5Krp0KhPaomhJuRwTmw/IshQSBBRqrbY7XioECHFV8tO/RyEuLgOWZRGG4tI3GvR+g==
X-Received: by 2002:a5d:4d4d:: with SMTP id a13mr10081847wru.252.1591885698879;
        Thu, 11 Jun 2020 07:28:18 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id w17sm5219529wra.71.2020.06.11.07.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:28:18 -0700 (PDT)
Date:   Thu, 11 Jun 2020 14:28:17 +0000
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
Subject: Re: [PATCH RESEND v9 10/18] media: platform: Stylistic changes for
 improving code quality
Message-ID: <20200611142817.GD158633@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-12-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-12-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:45PM +0800, Xia Jiang wrote:
> Change register offset hex numerals from uppercase to lowercase.
> Change data type of max/min width/height from integer to unsigned
> integer.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: move changing data type of max/min width/height to this patch
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h    |  8 ++++----
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h | 18 +++++++++---------
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
