Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682971E7DBD
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 15:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgE2NAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 09:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgE2NAK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 09:00:10 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F03C03E969
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 06:00:09 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id f7so1981569ejq.6
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EhFSDXU1We6MxQ3A30hDWSzixs2ZuY4gm72YbRtPSf0=;
        b=H3WKE33Yfrk2ofx0uBESQHJLLUkIeecskcmrdXLXas9E8mbcYywjhIDw9bv8Yuc3g9
         lCsuTTsdvojnpa1X6GemeCELH+tvho4BL2/5kO7mNp/o0hJOpNYSn1hJxcorocJO65wm
         +rH9AApLN161WUw5okckWwfAIhbAsIN1U8Cqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EhFSDXU1We6MxQ3A30hDWSzixs2ZuY4gm72YbRtPSf0=;
        b=hRlUUEpnr8SWThWsSpcV/Bq6Vl4z5BYQSWIr+lRxfmJbeOGUHywjosSAGoUAKsic2W
         orJuRgtJCIJcQrlX/ypjKu4WwhTwdIhBMJdf5gz3VNe56vNbu1gYw7ZiXCDc1ExItpnJ
         88ppky4ADuMS7FtFsvpsOgpUzfp3wphGYudmG+ITEvf77j/GTP22xCy99h1aqpxPLmY3
         LVYzbmS6Lt3RQOcthKopsRWdA2E+QHBpCO/fD6ph0ZwBNfqrr4HXydNrFHgg83xDr9IU
         XLTvFhfOeRj4/3pYuSMmA1fYugUYRPJvbUiwLILl4/sCOHZ0p0ZOd61KcEBaOKqYclXN
         o3Sw==
X-Gm-Message-State: AOAM532FO7vC+pavYtEy+YHpv0q+2P6kKC1JKI7aHkcdXSVS7mmVMSxb
        VK5pqMeJepHYhD/jCOpfDwadhooD9V/VJw==
X-Google-Smtp-Source: ABdhPJxTBXUUOzOfieTSSz4dHaAW1oFe2PwdWXpb0GmbJ3N4r9c3iclcfAum51kOUViz0YAWdYdU+g==
X-Received: by 2002:a17:906:2f8d:: with SMTP id w13mr7943382eji.102.1590757207714;
        Fri, 29 May 2020 06:00:07 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id ci6sm7180804ejc.60.2020.05.29.06.00.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 06:00:06 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id l10so3438795wrr.10
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 06:00:06 -0700 (PDT)
X-Received: by 2002:a5d:6750:: with SMTP id l16mr8589349wrw.295.1590757206037;
 Fri, 29 May 2020 06:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-5-Jerry-Ch.chen@mediatek.com> <20200521182825.GA249683@chromium.org>
 <1590156658.27807.84.camel@mtksdccf07> <CAAFQd5DodDfWsHkhQZP-M70k9_2sUwwb4zHtWfTx5EDyEKkwow@mail.gmail.com>
 <1590755163.23156.24.camel@mtksdccf07>
In-Reply-To: <1590755163.23156.24.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 29 May 2020 14:59:55 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BBfapVv_3cwGte=p=6G8QXZQP=-ciZ8NBZZeSBGrHmCA@mail.gmail.com>
Message-ID: <CAAFQd5BBfapVv_3cwGte=p=6G8QXZQP=-ciZ8NBZZeSBGrHmCA@mail.gmail.com>
Subject: Re: [RFC PATCH V4 4/4] platform: mtk-isp: Add Mediatek FD driver
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, yuzhao@chromium.org,
        zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 2:26 PM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> I Appreciate your review comments, here's the reply.
>
> On Mon, 2020-05-25 at 14:24 +0200, Tomasz Figa wrote:
> > r
> >
> > On Fri, May 22, 2020 at 4:11 PM Jerry-ch Chen
> > <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Thu, 2020-05-21 at 18:28 +0000, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Wed, Dec 04, 2019 at 08:47:32PM +0800, Jerry-ch Chen wrote:
[snip]
> > Isn't still a need to clamp() width and height to min/max, though?
> Yes, I'll add them back.
>
> This function will be refined as :
>
> static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
>                                   u32 pixfmt)
> {
>         v4l2_fill_pixfmt_mp(dfmt, pixfmt, dfmt->width, dfmt->height);
>
>         dfmt->field = V4L2_FIELD_NONE;
>         dfmt->colorspace = V4L2_COLORSPACE_BT2020;
>         dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>         dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>         dfmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
>
>         /* Keep user setting as possible */
>         dfmt->width = clamp(dfmt->width,
>                             MTK_FD_OUTPUT_MIN_WIDTH,
>                             MTK_FD_OUTPUT_MAX_WIDTH);
>         dfmt->height = clamp(dfmt->height,
>                              MTK_FD_OUTPUT_MIN_HEIGHT,
>                              MTK_FD_OUTPUT_MAX_HEIGHT);

Note that this would cause the other fields of dfmt to be inconsistent
with width and height. The correct way to do this would be to first
clamp and then call v4l2_fill_pixfmt_mp().

Best regards,
Tomasz
