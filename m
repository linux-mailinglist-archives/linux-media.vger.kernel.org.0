Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE5DCFC1CA
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 09:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfKNIrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 03:47:18 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43129 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfKNIrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 03:47:18 -0500
Received: by mail-ed1-f66.google.com with SMTP id w6so4292912edx.10
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2019 00:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uFeS+uA4c3JpCfgrQSP5W4UkQmv75ra/a0iuWSrGw8w=;
        b=F6GUlB6iw2SB4SJnps1K+f1038Vraj5TlbOPJ3viIHEBnViOrPo1rXMIYnA/hYWUXq
         UuV5QaciRJDPLRS9hzYNmdJewiXmJB0pTCHoGsxIZWSbfcznBC9Wp4Aaq1RBIa94v6Oj
         iGhktZEqYhWMO1kdpDeTFv33ORLDA+36hWg1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFeS+uA4c3JpCfgrQSP5W4UkQmv75ra/a0iuWSrGw8w=;
        b=abZJOJCVZsCBDMvTJvqJEF08JCvQ1T1Jf2vDdz+5BvxK31k/N7k6x0Efg+5E3ozFzl
         xPdfNzZqiPWcExEcdr5zL56W3Bg83SmetNzA+E31uvzVvB4ilBj5AtQfJFZNq5or52P9
         4U2DdPxuFZEsnKi9VMFKSUK9YVswVx7ZwPorGPex5o4oWQopMSLTJdOo77E8/jGVFwT+
         fegVScHlFnRqilrsRvo77eqkzeXnUPseF/9NLrFGePyn5qjLG9sehWBu4FSKTCPIG/39
         lbPfW7GXm1s3fuqK970Dspbs0iTZNXHa6IU3MID2kN8/Cv3Ncpsv4VW4P1GcTJYo46C1
         Iwbg==
X-Gm-Message-State: APjAAAW+T7btSENIQ9eMndKx0hEnXvh38ohUrM0+RBIvlB5Dmu9dkyOg
        IpifFQT34pT7c1PEUwq0PO1ZnCxlQ8Tbwg==
X-Google-Smtp-Source: APXvYqy/EeZQ0OYlcfWSD772CQXP9XYNZEMxVNySwCd9t1DJPlJNBflt1fPqe0IP8nOaaqSy37cYNw==
X-Received: by 2002:a17:906:4dc8:: with SMTP id f8mr7120216ejw.62.1573721234225;
        Thu, 14 Nov 2019 00:47:14 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id s20sm389960edu.9.2019.11.14.00.47.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 00:47:13 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id l1so4747080wme.2
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2019 00:47:12 -0800 (PST)
X-Received: by 2002:a7b:cbd9:: with SMTP id n25mr7174991wmi.64.1573721232315;
 Thu, 14 Nov 2019 00:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20191114051242.14651-1-helen.koike@collabora.com>
 <20191114051242.14651-3-helen.koike@collabora.com> <09d4f683-d03d-46c9-e9d2-b8cceb72446e@xs4all.nl>
In-Reply-To: <09d4f683-d03d-46c9-e9d2-b8cceb72446e@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 14 Nov 2019 17:47:00 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CLhUtTAWr_zF5ZPH7kPMQxjwzUMDYWowbbbc9bLowmRQ@mail.gmail.com>
Message-ID: <CAAFQd5CLhUtTAWr_zF5ZPH7kPMQxjwzUMDYWowbbbc9bLowmRQ@mail.gmail.com>
Subject: Re: [PATCH v11 02/11] media: staging: rkisp1: add document for rkisp1
 meta buffer format
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Helen Koike <helen.koike@collabora.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeffy <jeffy.chen@rock-chips.com>,
        =?UTF-8?B?6ZKf5Lul5bSH?= <zyc@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Jacob Chen <jacob2.chen@rock-chips.com>,
        Jacob Chen <jacob-chen@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 14, 2019 at 5:21 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 11/14/19 6:12 AM, Helen Koike wrote:
> > From: Jacob Chen <jacob2.chen@rock-chips.com>
> >
> > This commit add document for rkisp1 meta buffer format
> >
> > Signed-off-by: Jacob Chen <jacob-chen@rock-chips.com>
> > [refactored for upstream]
> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> checkpatch gives me:
>
> WARNING: Missing Signed-off-by: line by nominal patch author 'Jacob Chen <jacob2.chen@rock-chips.com>'
>
> Looking at this series I see duplicate Signed-off-by entries for Jacob Chen and a total
> of three different email addresses:
>
> jacob2.chen@rock-chips.com
> jacob-chen@rock-chips.com
> cc@rock-chips.com

I remember there used to be two different people named Jacob Chen in
the project. Also FWIW at least one of them
(jacob2.chen@rock-chips.com) is not at Rockchip anymore.

Looking in my inbox, I don't see anyone matching
jacob-chen@rock-chips.com, so that could possibly be a mistyped
jacob2.chen@rock-chips.com?

Best regards,
Tomasz



>
> It's confusing.
>
> Regards,
>
>         Hans
>
> >
> > ---
> >
> > Changes in v11: None
> > Changes in v10:
> > - unsquash
> >
> > Changes in v9:
> > - squash
> > - migrate to staging
> > - remove meta-formats.rst update
> >
> > Changes in v8:
> > - Add SPDX in the header
> > - Remove emacs configs
> > - Fix doc style
> >
> > Changes in v7:
> > - s/correspond/corresponding
> > - s/use/uses
> > - s/docuemnt/document
> >
> >  .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    | 23 +++++++++++++++++++
> >  .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      | 22 ++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> >  create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> >  create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> >
> > diff --git a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> > new file mode 100644
> > index 000000000000..103b5cb79b7c
> > --- /dev/null
> > +++ b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> > @@ -0,0 +1,23 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +.. _v4l2-meta-fmt-rkisp1-params:
> > +
> > +============================
> > +V4L2_META_FMT_RK_ISP1_PARAMS
> > +============================
> > +
> > +Rockchip ISP1 Parameters Data
> > +
> > +Description
> > +===========
> > +
> > +This format describes input parameters for the Rockchip ISP1.
> > +
> > +It uses c-struct :c:type:`rkisp1_isp_params_cfg`, which is defined in
> > +the ``linux/rkisp1-config.h`` header file.
> > +
> > +The parameters consist of multiple modules.
> > +The module won't be updated if the corresponding bit was not set in module_*_update.
> > +
> > +.. kernel-doc:: include/uapi/linux/rkisp1-config.h
> > +   :functions: rkisp1_isp_params_cfg
> > diff --git a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> > new file mode 100644
> > index 000000000000..4ad303f96421
> > --- /dev/null
> > +++ b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> > @@ -0,0 +1,22 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +.. _v4l2-meta-fmt-rkisp1-stat:
> > +
> > +=============================
> > +V4L2_META_FMT_RK_ISP1_STAT_3A
> > +=============================
> > +
> > +
> > +Rockchip ISP1 Statistics Data
> > +
> > +Description
> > +===========
> > +
> > +This format describes image color statistics information generated by the Rockchip
> > +ISP1.
> > +
> > +It uses c-struct :c:type:`rkisp1_stat_buffer`, which is defined in
> > +the ``linux/rkisp1-config.h`` header file.
> > +
> > +.. kernel-doc:: include/uapi/linux/rkisp1-config.h
> > +   :functions: rkisp1_stat_buffer
> >
>
