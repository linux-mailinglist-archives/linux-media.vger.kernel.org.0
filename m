Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503DAB0D3B
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 12:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731223AbfILKwL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 06:52:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:53796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731218AbfILKwK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 06:52:10 -0400
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFFF120678;
        Thu, 12 Sep 2019 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568285530;
        bh=KwCFUpMIc51ZQrrZ5Pst1c2DVUJ0KQNPr8Z6qMKPklU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rrXMs1RPO5chWrIQHFdlo0bkhKko9dN1mWrYY0X7IgyV6kCNjjrygyFhEJoqYT1NX
         zoiYMCJbjwU0Mno2RD3gY3jWUwsc+1JAMNOqdLO/JNBoXMxqY7gvgV1lNGaLF/9ccm
         VY7s3QxxKMlrj7jlVlNZBlsGB72iV3KnshqPJ39Y=
Received: by mail-lj1-f174.google.com with SMTP id a4so23113962ljk.8;
        Thu, 12 Sep 2019 03:52:09 -0700 (PDT)
X-Gm-Message-State: APjAAAWF0BmoecmEW61i0PZt77MO2MLxvDCnX75C7vStQaWKOe6+HFcL
        da7JWpNhmKswX2T2MEbT5J/8CsRVuD4hR2e8FFw=
X-Google-Smtp-Source: APXvYqyG6/tcsqsyfqRFRqXPK0ImcChBAEVnerDWxcFFeR78703ENdInutO0ecRhHphfVeVW+Ne3WyEnFhUHga+b1O4=
X-Received: by 2002:a2e:b167:: with SMTP id a7mr26718879ljm.236.1568285527962;
 Thu, 12 Sep 2019 03:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190823123737.7774-1-ribalda@kernel.org> <20190823123737.7774-3-ribalda@kernel.org>
 <20190826074059.bby3k6vr25axfbqc@uno.localdomain>
In-Reply-To: <20190826074059.bby3k6vr25axfbqc@uno.localdomain>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Thu, 12 Sep 2019 12:51:51 +0200
X-Gmail-Original-Message-ID: <CAPybu_290wASRs+LLLNup-MYb3W35Zj7W3_qBZSKYJrZCKUJ+g@mail.gmail.com>
Message-ID: <CAPybu_290wASRs+LLLNup-MYb3W35Zj7W3_qBZSKYJrZCKUJ+g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] Documentation: media: Document V4L2_CTRL_TYPE_AREA
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Jacopo

(Sorry for the late reply, I have been in holidays plus with plenty of
family matters)

On Mon, Aug 26, 2019 at 9:39 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Ricardo,
>
> On Fri, Aug 23, 2019 at 02:37:33PM +0200, Ricardo Ribalda Delgado wrote:
> > A struct v4l2_area containing the width and the height of a rectangular
> > area.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> > index a3d56ffbf4cc..c09d06ef2b08 100644
> > --- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> > +++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
> > @@ -443,6 +443,12 @@ See also the examples in :ref:`control`.
> >        - n/a
> >        - A struct :c:type:`v4l2_ctrl_mpeg2_quantization`, containing MPEG-2
> >       quantization matrices for stateless video decoders.
> > +    * - ``V4L2_CTRL_TYPE_AREA``
> > +      - n/a
>
> Can an area be negative ?
> I would set these fields to ">= 0" ">= 1" and ">= 0" respectively.
>

Dont min, max and step only make sense for integer controls?

> Thanks
>    j
>
> > +      - n/a
> > +      - n/a
> > +      - A struct :c:type:`v4l2_area`, containing the width and the height
> > +        of a rectangular area.
> >      * - ``V4L2_CTRL_TYPE_H264_SPS``
> >        - n/a
> >        - n/a
> > --
> > 2.23.0.rc1
> >
