Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D67B21B4A9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 14:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgGJMFL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 08:05:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41218 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgGJMFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 08:05:10 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2C6AB2A694F;
        Fri, 10 Jul 2020 13:05:06 +0100 (BST)
Date:   Fri, 10 Jul 2020 14:05:02 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 07/12] media: uapi: h264: Add DPB entry field reference
 flags
Message-ID: <20200710140502.627b2b54@collabora.com>
In-Reply-To: <6232d8475e169ee53b5864959af21d14bf0fc620.camel@collabora.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <20190901124531.23645-1-jonas@kwiboo.se>
        <HE1PR06MB4011559BF2447047C66285D2ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <233509924f72d69824920d9312373eced68674c0.camel@collabora.com>
        <20200710101333.05077f18@collabora.com>
        <6232d8475e169ee53b5864959af21d14bf0fc620.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Jul 2020 08:50:28 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> On Fri, 2020-07-10 at 10:13 +0200, Boris Brezillon wrote:
> > On Fri, 10 Jul 2020 01:21:07 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >   
> > > Hello Jonas,
> > > 
> > > In the context of the uAPI cleanup,
> > > I'm revisiting this patch.
> > > 
> > > On Sun, 2019-09-01 at 12:45 +0000, Jonas Karlman wrote:  
> > > > Add DPB entry flags to help indicate when a reference frame is a field picture
> > > > and how the DPB entry is referenced, top or bottom field or full frame.
> > > > 
> > > > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > > > ---
> > > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++++++
> > > >  include/media/h264-ctrls.h                       |  4 ++++
> > > >  2 files changed, 16 insertions(+)
> > > > 
> > > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > index bc5dd8e76567..eb6c32668ad7 100644
> > > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > @@ -2022,6 +2022,18 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > > >      * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
> > > >        - 0x00000004
> > > >        - The DPB entry is a long term reference frame
> > > > +    * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE``
> > > > +      - 0x00000008
> > > > +      - The DPB entry is a field picture
> > > > +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_TOP``
> > > > +      - 0x00000010
> > > > +      - The DPB entry is a top field reference
> > > > +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM``
> > > > +      - 0x00000020
> > > > +      - The DPB entry is a bottom field reference
> > > > +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME``
> > > > +      - 0x00000030
> > > > +      - The DPB entry is a reference frame
> > > >  
> > > >  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
> > > >      Specifies the decoding mode to use. Currently exposes slice-based and
> > > > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > > > index e877bf1d537c..76020ebd1e6c 100644
> > > > --- a/include/media/h264-ctrls.h
> > > > +++ b/include/media/h264-ctrls.h
> > > > @@ -185,6 +185,10 @@ struct v4l2_ctrl_h264_slice_params {
> > > >  #define V4L2_H264_DPB_ENTRY_FLAG_VALID		0x01
> > > >  #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
> > > >  #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
> > > > +#define V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE	0x08
> > > > +#define V4L2_H264_DPB_ENTRY_FLAG_REF_TOP	0x10
> > > > +#define V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM	0x20
> > > > +#define V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME	0x30
> > > >      
> > > 
> > > I've been going thru the H264 spec and I'm unsure,
> > > are all these flags semantically needed?
> > > 
> > > For instance, if one of REF_BOTTOM or REF_TOP (or both)
> > > are set, doesn't that indicate it's a field picture?
> > > 
> > > Or conversely, if neither REF_BOTTOM or REF_TOP are set,
> > > then it's a frame picture?  
> > 
> > I think that's what I was trying to do here [1]
> > 
> > [1]https://patchwork.kernel.org/patch/11392095/  
> 
> Right. Aren't we missing a DPB_ENTRY_FLAG_TOP_FIELD?
> 
> If I understand correctly, the DPB can contain:
> 
> * frames (FLAG_FIELD not set)
> * a field pair, with a single field (FLAG_FIELD and either TOP or BOTTOM).
> * a field pair, with boths fields (FLAG_FIELD and both TOP or BOTTOM).

Well, my understand is that, if the buffer contains both a TOP and
BOTTOM field, it actually becomes a full frame, so you actually have
those cases:

* FLAG_FIELD not set: this a frame (note that a TOP/BOTTOM field
  decoded buffer can become of frame if it's complemented with the
  missing field later during the decoding)
* FLAG_FIELD set + BOTTOM_FIELD not set: this is a TOP field
* FLAG_FIELD set + BOTTOM_FIELD set: this is a BOTTOM field
* FLAG_FIELD not set + BOTTOM_FIELD set: invalid combination

but I might be wrong.
