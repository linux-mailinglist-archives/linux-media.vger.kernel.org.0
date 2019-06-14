Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 115B245A32
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 12:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfFNKSY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 06:18:24 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33752 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfFNKSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 06:18:23 -0400
Received: by mail-ot1-f66.google.com with SMTP id p4so2171182oti.0
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2019 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BluMzkCDQwyvUXl6lzhoZtoPJHAVNPhcRWOIM0TWe5A=;
        b=CHPvPl+jUh7JA/rRQipbNvx2eeCXj4MzMMwsR5yCx/D03/DvrLCHOLgRsWofA1G48U
         n4aIfJ3weW2OCpVKh2VRnG3ebK8M5ONtMEtIkC3fB3hNabi+ChyUQ9vYqqQbvssy8f4l
         fpe34arGIzFmrKgaR8q/8j9Lx0H8qNOC6IU60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BluMzkCDQwyvUXl6lzhoZtoPJHAVNPhcRWOIM0TWe5A=;
        b=uHlTt+skDzt+I0xfHdJlOroJeYH1MGAwVH5XBb4mQMKMSk6JUC2x25JNZWRyQtFos5
         MGMHfNtrLZYnVNSk1r8V6Cw5aeJnbkImmuK2WJ3ccsjlMzyl5QqA5HG/3pMWCQIp7sIL
         oQ+v/9l92Jf+2yOH9UekpwKO1u9XEYLVqfeIQV3PmxICTIW1pIl6OShVXkS0yRF76wZQ
         12ENVfwzlnyDyKnRN96McX8fM/3Fn9hRMaSDAYREuRgT0N/BVzeayZ8l91txRDXtIse0
         8ZgVaE73lqp9JlR22CQdCruG/WOUuL3zsNfYxsbJHgVQAVVTAFDvStT56fQoiySo3QOx
         82tg==
X-Gm-Message-State: APjAAAVjBUgtGob6RhJ59oj/WMW8K+UD+38KiviuRnVFrkVVjYPt5sn5
        b2f6uLo2e/rv8FpBEe5natDzRin1gWY=
X-Google-Smtp-Source: APXvYqwYQr9y58DoVNkIbeRkgPq8ZxYT2gGbIiiNpdzF1jG1RhXquYt1vMQc6c2ZZFcTDNtwnLgkuQ==
X-Received: by 2002:a9d:7d02:: with SMTP id v2mr3185666otn.112.1560507502751;
        Fri, 14 Jun 2019 03:18:22 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id i8sm989273oth.24.2019.06.14.03.18.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 03:18:21 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id r6so2142520oti.3
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2019 03:18:21 -0700 (PDT)
X-Received: by 2002:a9d:30c3:: with SMTP id r3mr9116550otg.141.1560507501049;
 Fri, 14 Jun 2019 03:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190614075640.106709-1-acourbot@chromium.org> <9fd990d12ea1488592c5a590046f001a187b9c3f.camel@perches.com>
In-Reply-To: <9fd990d12ea1488592c5a590046f001a187b9c3f.camel@perches.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 14 Jun 2019 19:18:09 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVRA_tBwg_r-Z8Rx7pUkR8W47CN1dqWH5uk+_1ONhViog@mail.gmail.com>
Message-ID: <CAPBb6MVRA_tBwg_r-Z8Rx7pUkR8W47CN1dqWH5uk+_1ONhViog@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: remove unneeded proxy functions
To:     Joe Perches <joe@perches.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 14, 2019 at 6:11 PM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2019-06-14 at 16:56 +0900, Alexandre Courbot wrote:
> > We were getting the codec interface through a proxy function that does
> > not bring anything compared to just accessing the interface definition
> > directly, so just do that. Also make the decoder interfaces const.
> []
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> []
> > @@ -485,16 +485,9 @@ static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
> >       return 0;
> >  }
> >
> > -static struct vdec_common_if vdec_h264_if = {
> > +const struct vdec_common_if vdec_h264_if = {
>
> probably better to fixup whatever chains prevent
> this (if any) from being static const

These are defined in per-codec source files and selected at runtime by
vdec_drv_if.c, so I don't think we can avoid declaring at least
something? The previous approach was to declare a function, but as you
can see we can remove quite some code by exporting the structs
directly.
