Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC7F1021D5
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 11:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfKSKRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 05:17:03 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46110 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfKSKRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 05:17:03 -0500
Received: by mail-ed1-f66.google.com with SMTP id t11so10565650eds.13;
        Tue, 19 Nov 2019 02:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9hbii1rvXe3OjAU+9EET7g3kuyKDkNC5l9tGGg3Rr0w=;
        b=Zak8ug59k2O1p0roRgoyW1n9sY288ZxRAFM6l3LASPNE2bU1tEjWuX/tkz4flnMmAu
         N0deW1GLG9hcW5axTEBU/FSyf5vpihs92jZkxdcOnP2Bs18i6UXzaVoL22WNrxgopVFh
         /eCKelOOPTL7GpSotCpSbTckD9pen8uMfHdorYfpqLBBbUhtSk8DvuBqkAc6tEW713Jn
         QIomHlDALijSRIvcJDh5PLwBesumZ8L9GG7AgVe0UObwBRt8Sb3VtH1Gd8ev3Z8X0uxU
         ZLbm60b4pdgJw593iGuqzjlXul3EkyHy8SUUMD4LBbJnpmJ55onltqIei/mu27INlGOh
         yy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9hbii1rvXe3OjAU+9EET7g3kuyKDkNC5l9tGGg3Rr0w=;
        b=ZVWt3tPE1MuLvA6JNneodKvZvH44+cu+YTkQowi6B1b21+3/TJr3EEMJMEz8a+4fXM
         bMYd5IVuqtkkmGGge+mWIFalgdyM292cqaYjiQksCkk9HnvD5xNWCLMQgLxzmPa5lLKP
         FGy10upRBXPh7VJZYdkoIDDWqqjhRxkkh162cw5+ZYaYQylC9ksbxK+HmXXoBews351Q
         xCVTDYwYVvrhJqYcc4dpUwnHydFTTbSEeW0Ij6TtHCJTDW/HvZ0GaP3ENx0II2BhcqcV
         5eOvmfdYnN/WpGTW9vwca6S8FjQRRQSPzRF0IHbxLKPodJQmiiUKyoQ46arDMaRH9FhM
         fPjw==
X-Gm-Message-State: APjAAAUy/L1Pfc+cOPzgerNm4v1CNkRTyh1OF+xu4HdzUySaJN/qKSAW
        Go1PLGYjt3+dKa1mi5Qqg6FFtXVxR4IPTeFEZ8w=
X-Google-Smtp-Source: APXvYqwkJxMqmg7ZsnrggMatLowQzCcmg0Qlbo3LHEuSiv/RFL5kc0e6TZc+eBNriQcNnlF72ydXy+R3Gn5WHvKUDNg=
X-Received: by 2002:a17:906:6b01:: with SMTP id q1mr34046962ejr.162.1574158620629;
 Tue, 19 Nov 2019 02:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20191114051242.14651-1-helen.koike@collabora.com>
 <20191114051242.14651-3-helen.koike@collabora.com> <09d4f683-d03d-46c9-e9d2-b8cceb72446e@xs4all.nl>
 <9cb116f6-64f4-1510-b128-8657d6d4889b@collabora.com>
In-Reply-To: <9cb116f6-64f4-1510-b128-8657d6d4889b@collabora.com>
From:   Jacob Chen <jacobchen110@gmail.com>
Date:   Tue, 19 Nov 2019 18:16:49 +0800
Message-ID: <CAFLEztRQfYE_Mssiq4KxK-QyJEe+KT4eTsvnLZQK5T=uVADUqA@mail.gmail.com>
Subject: Re: [PATCH v11 02/11] media: staging: rkisp1: add document for rkisp1
 meta buffer format
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        Eddie Cai <eddie.cai.linux@gmail.com>, kernel@collabora.com,
        Heiko Stuebner <heiko@sntech.de>,
        Jacob Chen <jacob-chen@rock-chips.com>,
        gregkh@linuxfoundation.org, Jeffy Chen <jeffy.chen@rock-chips.com>,
        =?UTF-8?B?6ZKf5Lul5bSH?= <zyc@rock-chips.com>,
        linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        robh+dt@kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        ezequiel@collabora.com, linux-arm-kernel@lists.infradead.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen ,

Helen Koike <helen.koike@collabora.com> =E4=BA=8E2019=E5=B9=B411=E6=9C=8814=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:59=E5=86=99=E9=81=93=EF=BC=
=9A
>
>
>
> On 11/14/19 6:21 AM, Hans Verkuil wrote:
> > On 11/14/19 6:12 AM, Helen Koike wrote:
> >> From: Jacob Chen <jacob2.chen@rock-chips.com>
> >>
> >> This commit add document for rkisp1 meta buffer format
> >>
> >> Signed-off-by: Jacob Chen <jacob-chen@rock-chips.com>
> >> [refactored for upstream]
> >> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >
> > checkpatch gives me:
> >
> > WARNING: Missing Signed-off-by: line by nominal patch author 'Jacob Che=
n <jacob2.chen@rock-chips.com>'
> >
> > Looking at this series I see duplicate Signed-off-by entries for Jacob =
Chen and a total
> > of three different email addresses:
> >
> > jacob2.chen@rock-chips.com
> > jacob-chen@rock-chips.com
> > cc@rock-chips.com
>
> And I see a name in the Maintainers file as Jacob Chen <jacob-chen@iotwrt=
.com>.
> I was wondering if I could replace the email by jacob-chen@iotwrt.com, or=
 if I should
> keep the original ones.
>
> Helen
>

"jacob2.chen@rock-chips.com"/"jacob-chen@rock-chips.com" is me and
"cc@rock-chips.com" is another one.
' jacob-chen@rock-chips.com' is invalid now,  so you could replace the
email by 'jacob-chen@iotwrt.com'.

> >
> > It's confusing.
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >> ---
> >>
> >> Changes in v11: None
> >> Changes in v10:
> >> - unsquash
> >>
> >> Changes in v9:
> >> - squash
> >> - migrate to staging
> >> - remove meta-formats.rst update
> >>
> >> Changes in v8:
> >> - Add SPDX in the header
> >> - Remove emacs configs
> >> - Fix doc style
> >>
> >> Changes in v7:
> >> - s/correspond/corresponding
> >> - s/use/uses
> >> - s/docuemnt/document
> >>
> >>  .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    | 23 ++++++++++++++++++=
+
> >>  .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      | 22 ++++++++++++++++++
> >>  2 files changed, 45 insertions(+)
> >>  create mode 100644 drivers/staging/media/rkisp1/Documentation/media/u=
api/v4l/pixfmt-meta-rkisp1-params.rst
> >>  create mode 100644 drivers/staging/media/rkisp1/Documentation/media/u=
api/v4l/pixfmt-meta-rkisp1-stat.rst
> >>
> >> diff --git a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l=
/pixfmt-meta-rkisp1-params.rst b/drivers/staging/media/rkisp1/Documentation=
/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> >> new file mode 100644
> >> index 000000000000..103b5cb79b7c
> >> --- /dev/null
> >> +++ b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt=
-meta-rkisp1-params.rst
> >> @@ -0,0 +1,23 @@
> >> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +
> >> +.. _v4l2-meta-fmt-rkisp1-params:
> >> +
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >> +V4L2_META_FMT_RK_ISP1_PARAMS
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >> +
> >> +Rockchip ISP1 Parameters Data
> >> +
> >> +Description
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +This format describes input parameters for the Rockchip ISP1.
> >> +
> >> +It uses c-struct :c:type:`rkisp1_isp_params_cfg`, which is defined in
> >> +the ``linux/rkisp1-config.h`` header file.
> >> +
> >> +The parameters consist of multiple modules.
> >> +The module won't be updated if the corresponding bit was not set in m=
odule_*_update.
> >> +
> >> +.. kernel-doc:: include/uapi/linux/rkisp1-config.h
> >> +   :functions: rkisp1_isp_params_cfg
> >> diff --git a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l=
/pixfmt-meta-rkisp1-stat.rst b/drivers/staging/media/rkisp1/Documentation/m=
edia/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> >> new file mode 100644
> >> index 000000000000..4ad303f96421
> >> --- /dev/null
> >> +++ b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt=
-meta-rkisp1-stat.rst
> >> @@ -0,0 +1,22 @@
> >> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +
> >> +.. _v4l2-meta-fmt-rkisp1-stat:
> >> +
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >> +V4L2_META_FMT_RK_ISP1_STAT_3A
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >> +
> >> +
> >> +Rockchip ISP1 Statistics Data
> >> +
> >> +Description
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +This format describes image color statistics information generated by=
 the Rockchip
> >> +ISP1.
> >> +
> >> +It uses c-struct :c:type:`rkisp1_stat_buffer`, which is defined in
> >> +the ``linux/rkisp1-config.h`` header file.
> >> +
> >> +.. kernel-doc:: include/uapi/linux/rkisp1-config.h
> >> +   :functions: rkisp1_stat_buffer
> >>
> >
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
