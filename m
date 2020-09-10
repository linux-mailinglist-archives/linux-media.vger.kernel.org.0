Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D6226404B
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 10:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730233AbgIJIpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 04:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730127AbgIJIoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 04:44:13 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB65C061798
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 01:43:38 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id q34so1238343ooi.13
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 01:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RM+6YCueDPy1nkorG5jfOVGfbj1m5UCHBF4PF2PU/iI=;
        b=INguoyube130+8WwnXu/RYMh/Ju9WC30cNYDrviHqjIJBbZccMMVak/rSrOZ3ijhHR
         OmyS41tmWGU9bUjUr28yjCNpFgi3MHy2KYoaUXyZmwIZPZiIiwAojnfIKdvrGosGbjPA
         JydJiXyNitT7guWnNfOTvv7Z4wIAc2T/tudn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RM+6YCueDPy1nkorG5jfOVGfbj1m5UCHBF4PF2PU/iI=;
        b=RBZsozyixY/DLIqSISPWG4og7z1foetjwztfQ/3V8I/I+qlhNN9H3xR92wwmBZ/WJR
         JPYh1PIq31wVNu1rgcHGc/weg0HmEYnkn57ku+1rQK1Vt9OYhsskaKV/FjwHtdLZiil4
         CgRMRMhT14MC+fZNGqA3Br5IG3MKpwuGBRCg8kTLx5nFON0knwzq/39nDS57iSmyFXH0
         xOXkFLDEIY4hjcFheWvDCrxny4SPc4dKKMRXxhVrddJcCqKyIlicm4pBAmJ1lHP6e5OK
         wzrJ72CBpEU4i6JHn16+yv00COntUOpqV403qzI+OmiVp+apsjixDiLtOF7duk1G2/IN
         75NQ==
X-Gm-Message-State: AOAM530u3flI7a0AXh53nLvSZLYuOU0+IaMG0EoghCDMG+vEtQ0k+1ej
        erT5YUSeznJ3t0w8NdytFzfBYYswDfGv6g==
X-Google-Smtp-Source: ABdhPJy1QBjFrYlzxZavtv330ziyF2jgtDwzc1sWTqFNa1QbsVecpcCs6jCSzTFGHpXOe0zfXP747g==
X-Received: by 2002:a4a:5258:: with SMTP id d85mr3620201oob.72.1599727417965;
        Thu, 10 Sep 2020 01:43:37 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id l63sm817040oia.56.2020.09.10.01.43.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 01:43:37 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id a3so5205854oib.4
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 01:43:36 -0700 (PDT)
X-Received: by 2002:aca:1209:: with SMTP id 9mr2982017ois.94.1599727416353;
 Thu, 10 Sep 2020 01:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200518174011.15543-1-ezequiel@collabora.com>
 <20200518174011.15543-3-ezequiel@collabora.com> <CAPBb6MXezNVxPrJ05mpS1=yE8V81DjeQ2gA4pGfC8QQzgfUi8A@mail.gmail.com>
In-Reply-To: <CAPBb6MXezNVxPrJ05mpS1=yE8V81DjeQ2gA4pGfC8QQzgfUi8A@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 10 Sep 2020 17:43:24 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVqq-3JLBe9k5WtYL-LHmXYwj7HFt8tAVLNnuqKJA0p9Q@mail.gmail.com>
Message-ID: <CAPBb6MVqq-3JLBe9k5WtYL-LHmXYwj7HFt8tAVLNnuqKJA0p9Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] media: uapi: Add VP9 stateless decoder controls
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-rockchip@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 10, 2020 at 3:04 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Hi Ezequiel, sorry for the late review!
>
> On Tue, May 19, 2020 at 2:40 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > Add the VP9 stateless decoder controls plus the documentation that goes
> > with it.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/biblio.rst        |  10 +
> >  .../media/v4l/ext-ctrls-codec.rst             | 550 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls.c          | 239 ++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> >  include/media/v4l2-ctrls.h                    |   1 +
> >  include/media/vp9-ctrls.h                     | 485 +++++++++++++++

Also another thing I missed: shouldn't the new pointer controls be
added to union v4l2_ctrl_ptr in v4l2-ctrls.h?
