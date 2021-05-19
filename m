Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2420F38867D
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 07:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238866AbhESFZC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 01:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbhESFZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 01:25:01 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856C5C06175F
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 22:23:41 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id c15so14088845ljr.7
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 22:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mgekGujD0L3/nuy0lfC+9c6pRyC5gvzSw48ji+1o7eY=;
        b=BxXwbNi9geW7T+UQxXc7H28320kvwfeHhK6Z/pd+0AYTKV/reJlbzKJC4H19m0YnoU
         iFW1hqFzgcsSMO9x503aMETpWJfSZP1YRNossqQlHRVF3YwT6NpR35ZR9ioalX8zjyLC
         VRhwJtGk99MfU9GmkdCBAIaYcg8r5cKy5Aa/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mgekGujD0L3/nuy0lfC+9c6pRyC5gvzSw48ji+1o7eY=;
        b=JhP1VpSYk5oLMjvmlcy6CF9w8Ai0Ex0VgYOueIcmk1MTB6KAQpfOESGjZ7IydEFylu
         APCtsDpWno43RuHbJ+DLl56SHcuLm8eT1YVfh/3aP/QhAnRIrPJ5JCvL6OAwG47u6i8P
         jhtlPAglq/u8cjdsXn39kFfTR/vo0LvDFQRAiCi0ljILeBbGuXVvw5ujkNL3vU+nROPr
         3ms37k2mGV/eF5j9chLHV2ORu3y9l56ZOvjqeyDhMoZNI5MqhAirt5VvLHV08uI0Ed7s
         L0ulFLichEXatk7wdYuPwy4QLA7+u/T09F4ht6uv/26DFRo4HPJPkcWCI82ZYj+BVund
         DAog==
X-Gm-Message-State: AOAM531VS0uFsul4BP3z4BC8iudwLUD5XqT+voU+CfwgnVD5W6E6/Z5N
        hilnBUZ2CpaOVWpEJQsXGzgHgsinsIbUsw==
X-Google-Smtp-Source: ABdhPJyVwaZh6wmvaromzlwPP7sKRNi/QT0td5F5GbgCD8me2cQ039MIQkhsHKFgML7QWCjNvjznWA==
X-Received: by 2002:a2e:9586:: with SMTP id w6mr7206735ljh.131.1621401819766;
        Tue, 18 May 2021 22:23:39 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id k5sm2529474lfu.0.2021.05.18.22.23.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 22:23:39 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id z13so17186769lft.1
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 22:23:39 -0700 (PDT)
X-Received: by 2002:a05:6512:33c8:: with SMTP id d8mr7286426lfg.614.1621401818561;
 Tue, 18 May 2021 22:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-8-acourbot@chromium.org> <CAJMQK-g=bnr9bAkvN61sFapX_XOKmUF8LPivtCEzUhP-LjoHUw@mail.gmail.com>
In-Reply-To: <CAJMQK-g=bnr9bAkvN61sFapX_XOKmUF8LPivtCEzUhP-LjoHUw@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 19 May 2021 14:23:25 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXgG2fENJXgCrKoUxaeV6H0Azo7BWpwf9-4ZyJZ9JiSTg@mail.gmail.com>
Message-ID: <CAPBb6MXgG2fENJXgCrKoUxaeV6H0Azo7BWpwf9-4ZyJZ9JiSTg@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] media: mtk-vcodec: vdec: add media device if
 using stateless api
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 17, 2021 at 1:35 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Tue, Apr 27, 2021 at 7:16 PM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > The stateless API requires a media device for issuing requests. Add one
> > if we are being instantiated as a stateless decoder.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > [acourbot: refactor, cleanup and split]
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/media/platform/Kconfig                |  1 +
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 39 +++++++++++++++++++
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
> >  3 files changed, 42 insertions(+)
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index ae1468aa1b4e..4154fdec2efb 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -315,6 +315,7 @@ config VIDEO_MEDIATEK_VCODEC
> >         select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> >         select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> >         select V4L2_H264
> > +       select MEDIA_CONTROLLER
>
> Should this also select MEDIA_CONTROLLER_REQUEST_API config?

Yup, it probably should. hantro and rkvdec also select it, so let's do the same.

Thanks!
Alex.
