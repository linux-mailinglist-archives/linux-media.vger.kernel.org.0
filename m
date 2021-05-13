Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1022137FA43
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 17:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhEMPIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 11:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbhEMPIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 11:08:53 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE666C06174A
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 08:07:43 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id v4so11139229qtp.1
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=TLkSbdc1fw8jgiPXkD5Ij+EaQClDSHw8ek8z1tmir8s=;
        b=xLFFqHGJUuKACF0i4U8uJPm4Twx4FLRwFZ3bHS1rcLvjc7XLRx0eiQCtipmD/9Aj17
         qp+yYqr0XN5FRLxDmsV5BWl9A0aVboKsjGCtUP7RloVY9soeG0cvxBMt5bGg8YB87XCV
         FQUVBvw3ujSSW5spSdxqiFA4Q+e0OVlHan1ttnh5RYd968dQG5+5Lwo0Dr5PS6Ko38Mj
         LIcJ2jpay7bZ9RsUhr1z1bxmuazuKOpn//ABPNBQMBpAg7YglmRbAjj7svL0pORUVg2o
         7yuqP9/C/itpIXv1p5o34uXj01lDTBuiYfnZQeBeVWd6bYfyRb34Vr4AwjbM9+zl3lA0
         gEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TLkSbdc1fw8jgiPXkD5Ij+EaQClDSHw8ek8z1tmir8s=;
        b=ufL+2OpsHdljyys16G8h4LOemCeXJDV53xoGrVMqGFtoJW9rzVSDFUmGaAvfZLpHHt
         kXo8Hjxh6CV27skwUbnYCxKMZiNuray03tYQMI6JHtmbhM2SC/jkY8F5d3nawYqlIMLb
         QTEYtW6VbnUz/D/XmbKoeocHjY9VpE2vfSp+KDBZmQscRBxzPmL/1nSS6ElB1plJBiwA
         waaDv5+XJiGsjrKbAC8L/fASbNSBM2MTbo4SSnVuDIeYUEcWj4drXxX1pO2vO8EmtCX+
         X7QoQ6ydOUo2VidbyE+DcQfPZ1neV9gtxXo2PKlmZxE4QI2Vw5FUxrcx+bOiPcePnyyW
         Y4Aw==
X-Gm-Message-State: AOAM532ix19wWqxDsuLftzyTKxIwqJ/yDp61PmLA/DGmMtz2XUcfRLsQ
        eBPd75YkjO/+xzbFbBqgdc4oZg==
X-Google-Smtp-Source: ABdhPJzQjQznftnSoUznPn4Riax7X6sR3Jx0KiEsVldOVfBawDd633rhVFzGDWtrbUuPSud3+4cEsg==
X-Received: by 2002:ac8:5dcc:: with SMTP id e12mr27252202qtx.70.1620918462544;
        Thu, 13 May 2021 08:07:42 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id h65sm2413773qkc.128.2021.05.13.08.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 08:07:42 -0700 (PDT)
Message-ID: <83a807111f17c9e2db4e9f12a7ec1437c11d0f55.camel@ndufresne.ca>
Subject: Re: [PATCH v4 07/15] media: mtk-vcodec: vdec: add media device if
 using stateless api
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Date:   Thu, 13 May 2021 11:07:40 -0400
In-Reply-To: <CAPBb6MUKtxCS=JbtBmvwwEovrN8NCtLmMGcTkozo_gnDMRsqHw@mail.gmail.com>
References: <20210427111526.1772293-1-acourbot@chromium.org>
         <20210427111526.1772293-8-acourbot@chromium.org>
         <faa5553f-2ea5-27a5-7f85-e1418d2c7df1@xs4all.nl>
         <CAPBb6MUKtxCS=JbtBmvwwEovrN8NCtLmMGcTkozo_gnDMRsqHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 13 mai 2021 à 17:05 +0900, Alexandre Courbot a écrit :
> Hi Hans, thanks for the review!
> 
> On Thu, Apr 29, 2021 at 4:28 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > 
> > On 27/04/2021 13:15, Alexandre Courbot wrote:
> > > From: Yunfei Dong <yunfei.dong@mediatek.com>
> > > 
> > > The stateless API requires a media device for issuing requests. Add one
> > > if we are being instantiated as a stateless decoder.
> > 
> > Why for the stateless decoder only? Why not create one for all?
> > 
> > It's not a blocker, but I would recommend looking at this.
> 
> Would there be any use in creating a media device for a stateful
> decoder that does not need to use requests?

The only thing I can think of is classification. In GStreamer support for
stateless decoders, I use the topology to classify what is a decoder by walking
the toplogy and making sure it's what I expect, and that there is no other
branches or functions that I may not support. This makes it more strict, so less
likely to confuse driver function.

Note that v4l2-compliance just use the same old heuristic we have used for
stateful, which is to check that one side have only RAW format, and the other
side have only encoded formats. It works too, it's just less strict.

> 
> Cheers,
> Alex.


