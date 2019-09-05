Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB71DA9FF9
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732779AbfIEKjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:39:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60065 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732233AbfIEKje (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 06:39:34 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5pAr-0004l5-H5; Thu, 05 Sep 2019 12:39:33 +0200
Message-ID: <1567679973.3958.1.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] media: uapi: h264: Add
 num_ref_idx_active_override_flag
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Date:   Thu, 05 Sep 2019 12:39:33 +0200
In-Reply-To: <CAHD77H=q48Zx=dWMOMT527au8FzKZdQ9SrRr4sos8oNfCeCzQw@mail.gmail.com>
References: <20190905101533.525-1-p.zabel@pengutronix.de>
         <CAHD77H=q48Zx=dWMOMT527au8FzKZdQ9SrRr4sos8oNfCeCzQw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-09-05 at 19:31 +0900, Tomasz Figa wrote:
> On Thu, Sep 5, 2019 at 7:15 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > 
> > This flag tells the kernel whether the slice header contained the
> > num_ref_idx_l[01]_active_minus1 syntax elements, or whether the
> > num_ref_idx_l[01]_default_active_minus1 from PPS should be used
> > instead.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 +++
> >  include/media/h264-ctrls.h                       | 1 +
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index bc5dd8e76567..451a5b0f2a35 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -1860,6 +1860,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
> >        - 0x00000008
> >        -
> > +    * - ``V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE
> > +      - 0x00000010
> > +      - Corresponds to the num_ref_idx_active_override_flag syntax element.
> > 
> 
> As far as I remember, the idea was for the userspace to always put the
> right num_ref_idx in the slice_params and the drivers always use that.
> Was there any problem with that?

I don't think so, at least for currently known hardware.

In that case we should drop the unused
num_ref_idx_l[01]_default_active_minus1 fields from struct
v4l2_ctrl_h264_pps and document that userspace should fill
the defaults into v4l2_ctrl_h264_slice_params themselves if
num_ref_idx_active_override_flag wasn't set.

regards
Philipp
