Return-Path: <linux-media+bounces-19887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FAC9A4162
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 16:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57CC7B24097
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 14:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC311F4291;
	Fri, 18 Oct 2024 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="fxnfBkgR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5031F1F426D
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729262457; cv=none; b=oAJGKOMj5OM82CUh7wdgtCZz6DASl+VvJD+yn1two9Qg6hxohDxG5VeAa7kY7fySnXBaipCuqAy8c8W71XEunc2e5vZ7Y3itVPGy527nnEB6GEfx/Igqf3IntrLjQwZGDi3qS43v7mLBd0ciDlgQiAx8NFrmbkKqjF91hKhLES8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729262457; c=relaxed/simple;
	bh=G/rctGsRbjQ1D3z4Je7zoeaN91rroN5RG0xUiy6nHAU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mn6gvD2dmlXg/uz+d9v4uBL3CyrfZreubSHrONQYQNOsV+Xq4O4dVz7JRCh3dAzg4YoRzNJiSH2P70lOsc9VqzdjFCho19OimazhRnTUqI/kQUHPclBZS6mBoQTDxcHSfrUPSYu08TvUD/v89FPWUQUxr5AhNO1xyhWH0NmmNp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=fxnfBkgR; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b1539faa0bso104705885a.1
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 07:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729262453; x=1729867253; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uzdU+GZ7Tv72vigYOodvv8XDCGZgrWKcrOtffZWOPT8=;
        b=fxnfBkgRrFT+rLjEq+ARSVQW8RtarKoJvknfnLKdocud8vw163bZb3zMcI1KCd2ZPz
         DU2TbMNJjuIRItyx4LNwRmnWq+LXlm9IpiFKGI/sggHcEbWFZTHRUUfmabQ6CPSgDMzT
         516YTs7LS8UIFux3Kb73UIAcBU0bptlStWezMGcetkv74IQEcHZbsljk7V0Elvv1tPYO
         zbdWvUk+5pgc3U2szKzzIxvOu190a+k4lUeyziSeO5xS9IeUoy2jfQ1oQUhtzoiOru2r
         eFZ4Cv3WVk5dNvvJMUtkqGFlo2I0SBsCTNpGrM7Yi2Du2BKRetVksqpsQRGoD8yUHovx
         COFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729262453; x=1729867253;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzdU+GZ7Tv72vigYOodvv8XDCGZgrWKcrOtffZWOPT8=;
        b=SNL5iKIaSYBoIfItSoiEtacP8E+jwEAcTMwq2A9gmjDHKwhOvmIWfnr0L6pVWtdUWw
         y0in2zAwVnPrV8CJdt4xJAx71AoR1ItqfCrF2QRE8/bRz4kC2MpwFt951o7E0EeciN2F
         Ggvx5x8j6bSgDrDTYd02j37HsOmHKKq2MqZqfrX+us2jCGcXHLbcOIdzyfpUyqKh9MRX
         HoJMx/a6l0WhYAFZghGCp5GvaUTE8z4aciNRYInh2z4y5SafsnMuD3TDeAgNz8vlcKKn
         aV5PUQc1I7KoEus9NjQmVZuRyMwHFsHJkPSx9qU5y5cDLduAKtmHShOyvqWOOG1+J/Ug
         NAQg==
X-Forwarded-Encrypted: i=1; AJvYcCX1PpzKX8aqoDtv3eMNj9alE/GdB5sI/DTAfDsz89y2ZxJm516bfc0YbNdy3n1JQc4JlrZCRcTp5x5uTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNn6R4IfbeHujrfBCRKcUPMX7OM7ACvMDO8lOZ1+EErXUeDe2
	5DlkdWHtfGcnF/JXyw8WXhPyYJNAB6KkdSh2PxJSX4StagPLi7bIWIC6eUXGxQ0=
X-Google-Smtp-Source: AGHT+IGomj6FqcJ2k8c7cu/EtC48y+2ZY3WdKz4QDLJkLOw4W6rOta+qBTn1it2t1OADPBBrnbpVlQ==
X-Received: by 2002:a05:620a:45a9:b0:7b1:49cb:5842 with SMTP id af79cd13be357-7b157b5d08emr324589685a.15.1729262452998;
        Fri, 18 Oct 2024 07:40:52 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b156f8b33csm74893285a.21.2024.10.18.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:40:52 -0700 (PDT)
Message-ID: <f91494d0676ac1a97b0590553ab26c1d5b5b8360.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ming Qian <ming.qian@nxp.com>, 
 "mchehab@kernel.org"
	 <mchehab@kernel.org>
Cc: "yunkec@google.com" <yunkec@google.com>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
 "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx
 <linux-imx@nxp.com>, "X.H. Bao" <xiahong.bao@nxp.com>, Ming Zhou
 <ming.zhou@nxp.com>, Eagle Zhou <eagle.zhou@nxp.com>, Tao Jiang
 <tao.jiang_2@nxp.com>, "Ming Qian (OSS)" <ming.qian@oss.nxp.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,  "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 18 Oct 2024 10:40:51 -0400
In-Reply-To: <bfd189a9-7bc2-43d1-80be-1092787311e1@xs4all.nl>
References: <20241018054448.3190423-1-ming.qian@nxp.com>
	 <20241018054448.3190423-6-ming.qian@nxp.com>
	 <6bde2e39-b422-490f-b3b1-142a5671e770@xs4all.nl>
	 <PAXPR04MB825420D7C8A88111F0F8084EE7402@PAXPR04MB8254.eurprd04.prod.outlook.com>
	 <bfd189a9-7bc2-43d1-80be-1092787311e1@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ming and Hans,

adding my two cents...

Le vendredi 18 octobre 2024 =C3=A0 11:54 +0200, Hans Verkuil a =C3=A9crit=
=C2=A0:
> Hi Ming Qian,
>=20
> On 18/10/2024 10:20, Ming Qian wrote:
> > Hi Hans,
> >=20
> > > -----Original Message-----
> > > From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > Sent: Friday, October 18, 2024 2:28 PM
> > > To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org
> > > Cc: yunkec@google.com; nicolas@ndufresne.ca; s.hauer@pengutronix.de;
> > > kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> > > imx@nxp.com>; X.H. Bao <xiahong.bao@nxp.com>; Ming Zhou
> > > <ming.zhou@nxp.com>; Eagle Zhou <eagle.zhou@nxp.com>; Tao Jiang
> > > <tao.jiang_2@nxp.com>; Ming Qian (OSS) <ming.qian@oss.nxp.com>;
> > > imx@lists.linux.dev; linux-media@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > > Subject: [EXT] Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrl=
s
> > >=20
> > > Caution: This is an external email. Please take care when clicking li=
nks or
> > > opening attachments. When in doubt, report the message using the 'Rep=
ort
> > > this email' button
> > >=20
> > >=20
> > > On 18/10/2024 07:44, Ming Qian wrote:
> > > > Add some ctrls to support the video encoder ROI feature.
> > > > Support 2 encoder ROI configurations that are rectangular region an=
d
> > > > QP map
> > > >=20
> > > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > > Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> > > > ---
> > > >  .../media/v4l/ext-ctrls-codec.rst             | 73 +++++++++++++++=
++++
> > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 29 ++++++++
> > > >  include/uapi/linux/v4l2-controls.h            | 11 +++
> > > >  3 files changed, 113 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.=
rst
> > > > b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > index 4a379bd9e3fb..6b972247778c 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > @@ -1667,6 +1667,79 @@ enum
> > > v4l2_mpeg_video_h264_hierarchical_coding_type -
> > > >      Codecs need to always use the specified range, rather then a H=
W custom
> > > range.
> > > >      Applicable to encoders
> > > >=20
> > > > +``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> > > > +    (enum)
> > > > +
> > > > +enum v4l2_mpeg_video_roi_mode -
> > > > +    Video roi mode. Possible values are:
> > > > +
> > > > +
> > > > +
> > > > +.. flat-table::
> > > > +    :header-rows:  0
> > > > +    :stub-columns: 0
> > > > +
> > > > +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
> > > > +      - No ROI in the MPEG stream
> > > > +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``
> > > > +      - Rectangle ROI mode
> > > > +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``
> > > > +      - Map ROI mode
> > > > +
> > > > +``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
> > > > +    Select rectangular regions and specify the QP offset. The
> > > > +    struct :c:type:`v4l2_ctrl_video_region_param` provides the
> > > > +    rectangular region and the parameter to describe QP offset.
> > > > +    The maximum number of rectangular regions depends on the
> > > > +    hardware.  This control is a dynamically sized array. This
> > > > +    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> > > > +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``. Applicable to
> > > > +    encoders.
> > > > +
> > > > +.. c:type:: v4l2_ctrl_video_region_param
> > > > +
> > > > +.. raw:: latex
> > > > +
> > > > +    \small
> > > > +
> > > > +.. tabularcolumns:: |p{4.0cm}|p{4.0cm}|p{4.0cm}|
> > > > +
> > > > +.. flat-table:: struct v4l2_ctrl_video_region_param
> > > > +    :header-rows:  0
> > > > +    :stub-columns: 0
> > > > +    :widths:       1 1 1
> > > > +
> > > > +    * - struct :c:type:`v4l2_rect`
> > > > +      - ``rect``
> > > > +      - The rectangular region
> > >=20
> > > What is the unit? I assume pixels. And inside what larger area is thi=
s rectangle
> > > located? It probably needs to refer to one of the SEL_TGT targets as =
described
> > > here:
> > >=20
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fh=
verkuil.
> > > home.xs4all.nl%2Fspec%2Fuserspace-api%2Fv4l%2Fv4l2-selection-
> > > targets.html&data=3D05%7C02%7Cming.qian%40nxp.com%7Cfe9348ba24504eb
> > > d98f608dcef3dffcf%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> > > 8648296786960098%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> > > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata
> > > =3DcTXaNWLZs4l6IytSu9TWmEb7OyvF4viby9IjpOJXvmE%3D&reserved=3D0
> > >=20
> >=20
> > We want to use pixels as the unit, but for some detailed encoder, there
> > may be alignment constraints, and the rectangular area should be inside
> > the encoded picture size, for example, we encode a 720P H.264 stream,
> > the largest area is 1280x720@(0,0). This doesn't involve scaling up or
> > down. I'm not sure if it's possible to align to crop or compose.
> >=20
> > Currently, we want to choose an area and increase or decrease the image
> > quality. so we want to use a parameter to set the qp offset.

In existing codec, the quantization factor is global to the macroblock bein=
g
encoded (not to the image). So for H.264, it will be aligned to 16 pixels i=
n
both directions. The documentation should be clear on that and perhaps we s=
hould
go further and defined the direction this should be rounded, which should b=
e to
round toward the edges, so X,Y gets rounded down, and width/height up.

> >=20
> > > > +    * - __s32
> > > > +      - ``parameter``
> > > > +      -
> > >=20
> > > So what is the parameter? It has no description.
> > >=20
> >=20
> > I newly add a ctrl type V4L2_CTRL_TYPE_REGION, and this struct is
> > related to the type, so I thought I need to define a general argument t=
o
> > meet different needs, then this type can support a series of controls.
> > For this patch, it's qp offset.
> > I thought if I name it as qp_offset, the ctrl type can't be used on
> > other similar controls.
> > Is it better to rename it or add more description and keep the name?
>=20
> This seems very specific to this use-case, so it makes sense if this is
> defined as such.
>=20
> If you want use generic types, then you would need two controls: one
> to define the regions (using type v4l2_rect), and one to set the
> QP offset (type integer). This assumes that both arrays are set to the
> same size.
>=20
> If you want to keep them together, then just make a new type for this.
>=20
> But a more general question regarding this feature: is this hardware
> specific? Or is this defined in some codec standard?

Most CODEC don't require a flat quantization. Each macroblock can be quanti=
zed
separately. There is multiple approach to give users control on what QP to =
use
for which macro-blocks. The ROI approach is notably found in VA API [0]. I'=
ve
seen ROI support left unimplemented in many of our stateful encoders, so th=
is is
common enough approach.

[0] https://intel.github.io/libva/structVAEncROI.html

More recent APIs, notably DX3D12 and Vulkan Video, have adopted the QP Map
approach. They offer both absolute and offset QP, placed in a 2D map, with =
the
number of effective pixels per map entry defined. Not much details are know=
n
about VKV, but on DX3D12, you can find some details in the AV1 encoder
documentation. While the ROI approach can easily be translate to QP Maps, t=
he
other direction may not be possible. Usually, the maximum size of a QP map =
is
way larger then the maximum number of ROI.

https://microsoft.github.io/DirectX-Specs/d3d/D3D12_Video_Encoding_AV1.html

We should also document what happens when ROI overlap, if that supported ? =
are
the offset summed ? I don't think absolute QP is widely supported, but to b=
e
verified. A split approach would make adding support for absolute a lot eas=
ier.

For a practical use of ROI, see:

https://obsproject.com/forum/resources/encoder-region-of-interest-editor.19=
04/

>=20
>=20
> And to be clear, this has nothing to do with the UVC ROI patch series tha=
t
> you linked to, right? You just reused some of the work that was done ther=
e

I believe the UVC ROI refers to rectangles used in 3A. Usually user or AI
driven, these will tell the camera the location of the interesting object. =
This
reflects on Mobile to tapping on an object in order to focus on it.

ROI can also be used to communicate back the bounding box of objects in an
image. Though, on modern system we tend to need more then that, as we want =
to
put these objects in relation to each other, and want to use other shapes. =
Think
of your eyes that are in relation to your face.

> .
>=20
> I am leaning to splitting this up in two controls: one defines the ROIs, =
and
> one defines the parameter for each ROI. This makes it very easy to reuse =
in
> other scenarios (such as UVC).
>=20
> But I really need to know a bit more about this feature.

Hope this drop of info helped a bit. I don't have a very strong opinion bet=
ween
using a compound control vs two array control. Though your proposal makes t=
he
built-in min/max/def feature usable, where with compound controls we don't
really have an API to expose that, and need to hand-write validation. It al=
so
enables possible sharing a bit with future QP Maps implementation.

Perhaps good to know that GStreamer do have a metadata representation of RO=
I. It
is generic with the rectangle and location as base value and additional typ=
e and
arbitrary parameters. That is used for VA-API encoders. Before AI boom, thi=
s is
what we'd use to place objects detected with libraries like OpenCV. Typical=
ly,
an app would translate let's say faces ROI to an encoder QP offset based on=
 its
own logic. AI systems in GStreamer are now moving to the GstAnalyticMeta, w=
hich
is more powerful and allow for relations to be expressed.

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/=
gst-plugins-base/gst-libs/gst/video/gstvideometa.h?ref_type=3Dheads#L308

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/=
gst-plugins-bad/gst-libs/gst/analytics/gstanalyticsmeta.h?ref_type=3Dheads

regards,
Nicolas

>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> > > > +    * - __u32
> > > > +      - ``reserved[2]``
> > > > +      -
> > >=20
> > > Add "Applications and drivers must set this to zero."
> > >=20
> >=20
> > Yes, I missed it
> >=20
> > > > +
> > > > +.. raw:: latex
> > > > +
> > > > +    \normalsize
> > > > +
> > > > +``V4L2_CID_MPEG_VIDEO_ROI_MAP (integer)``
> > > > +    Specifies the QP offset for each block. This control is a
> > > > +    dynamically sized array. The array size can be calculated
> > > > +    from video resolution and the roi map block size which can
> > > > +    be got from ``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE``. This
> > > > +    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> > > > +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. Applicable to
> > > > +    encoders.
> > > > +
> > > > +``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE (struct)``
> > > > +    This control returns the roi block size in pixels. The struct
> > > > +    :c:type:`v4l2_area` provides the width and height in separate
> > > > +    fields. This control is applicable when
> > > > +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> > > > +    ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. This control depends on the
> > > > +    encoding format. Applicable to encoders.
> > > > +
> > > >  .. raw:: latex
> > > >=20
> > > >      \normalsize
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > index 1ea52011247a..54219a3b215a 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > @@ -612,6 +612,13 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
> > > >               NULL,
> > > >       };
> > > >=20
> > > > +     static const char * const mpeg_video_roi_mode[] =3D {
> > > > +             "None",
> > > > +             "Rectangle",
> > > > +             "Map",
> > > > +             NULL,
> > > > +     };
> > > > +
> > > >       switch (id) {
> > > >       case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
> > > >               return mpeg_audio_sampling_freq; @@ -750,6 +757,8 @@
> > > > const char * const *v4l2_ctrl_get_menu(u32 id)
> > > >               return camera_orientation;
> > > >       case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
> > > >               return intra_refresh_period_type;
> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MODE:
> > > > +             return mpeg_video_roi_mode;
> > > >       default:
> > > >               return NULL;
> > > >       }
> > > > @@ -971,6 +980,10 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > >       case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:               retur=
n "Frame
> > > LTR Index";
> > > >       case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:                retur=
n "Use LTR
> > > Frames";
> > > >       case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:                    retur=
n "Average
> > > QP Value";
> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MODE:                      retur=
n "Video ROI
> > > Mode";
> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_RECT:                      retur=
n "Video ROI
> > > Rectangle";
> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MAP:                       retur=
n "Video ROI
> > > Map";
> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:            retur=
n
> > > "Video ROI Map Block Size";
> > > >       case V4L2_CID_FWHT_I_FRAME_QP:                          retur=
n "FWHT I-Frame
> > > QP Value";
> > > >       case V4L2_CID_FWHT_P_FRAME_QP:                          retur=
n "FWHT P-
> > > Frame QP Value";
> > > >=20
> > > > @@ -1512,6 +1525,22 @@ void v4l2_ctrl_fill(u32 id, const char **nam=
e,
> > > enum v4l2_ctrl_type *type,
> > > >               *type =3D V4L2_CTRL_TYPE_INTEGER;
> > > >               *flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > >               break;
> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MODE:
> > > > +             *type =3D V4L2_CTRL_TYPE_MENU;
> > > > +             *flags |=3D V4L2_CTRL_FLAG_UPDATE;
> > > > +             break;
> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_RECT:
> > > > +             *type =3D V4L2_CTRL_TYPE_REGION;
> > > > +             *flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY |
> > > V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> > > > +             break;
> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MAP:
> > > > +             *type =3D V4L2_CTRL_TYPE_INTEGER;
> > > > +             *flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY |
> > > V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> > > > +             break;
> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:
> > > > +             *type =3D V4L2_CTRL_TYPE_AREA;
> > > > +             *flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > > +             break;
> > > >       case V4L2_CID_PIXEL_RATE:
> > > >               *type =3D V4L2_CTRL_TYPE_INTEGER64;
> > > >               *flags |=3D V4L2_CTRL_FLAG_READ_ONLY; diff --git
> > > > a/include/uapi/linux/v4l2-controls.h
> > > > b/include/uapi/linux/v4l2-controls.h
> > > > index 974fd254e573..169a676fd64c 100644
> > > > --- a/include/uapi/linux/v4l2-controls.h
> > > > +++ b/include/uapi/linux/v4l2-controls.h
> > > > @@ -900,6 +900,17 @@ enum v4l2_mpeg_video_av1_level {
> > > >=20
> > > >  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE +
> > > 657)
> > > >=20
> > > > +enum v4l2_mpeg_video_roi_mode {
> > > > +     V4L2_MPEG_VIDEO_ROI_MODE_NONE,
> > > > +     V4L2_MPEG_VIDEO_ROI_MODE_RECT,
> > > > +     V4L2_MPEG_VIDEO_ROI_MODE_MAP
> > > > +};
> > > > +
> > > > +#define V4L2_CID_MPEG_VIDEO_ROI_MODE         (V4L2_CID_CODEC_BASE
> > > + 658)
> > > > +#define V4L2_CID_MPEG_VIDEO_ROI_RECT         (V4L2_CID_CODEC_BASE =
+
> > > 659)
> > > > +#define V4L2_CID_MPEG_VIDEO_ROI_MAP          (V4L2_CID_CODEC_BASE =
+
> > > 660)
> > > > +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE
> > > (V4L2_CID_CODEC_BASE + 661)
> > > > +
> > > >  /*  MPEG-class control IDs specific to the CX2341x driver as defin=
ed by V4L2
> > > */
> > > >  #define V4L2_CID_CODEC_CX2341X_BASE
> > > (V4L2_CTRL_CLASS_CODEC | 0x1000)
> > > >  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE
> > > (V4L2_CID_CODEC_CX2341X_BASE+0)
> >=20
>=20


