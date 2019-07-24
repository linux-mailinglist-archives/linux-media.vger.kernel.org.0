Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 178FF7277A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 07:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfGXFqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 01:46:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55310 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfGXFq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 01:46:29 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C7FD228AEAC;
        Wed, 24 Jul 2019 06:46:27 +0100 (BST)
Date:   Wed, 24 Jul 2019 07:46:24 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 3/3] media: uapi: h264: Get rid of the p0/b0/b1
 ref-lists
Message-ID: <20190724074624.508388aa@collabora.com>
In-Reply-To: <CAHD77H=KMXbtFPAYDDv-cFNwU4tQAdneA8o3Vqp73eYWWEFLJQ@mail.gmail.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
        <20190703122849.6316-4-boris.brezillon@collabora.com>
        <CAHD77H=KMXbtFPAYDDv-cFNwU4tQAdneA8o3Vqp73eYWWEFLJQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 24 Jul 2019 12:39:55 +0900
Tomasz Figa <tfiga@chromium.org> wrote:

> Hi Boris,
> 
> On Wed, Jul 3, 2019 at 9:28 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Those lists can be extracted from the dpb, let's simplify userspace
> > life and build that list kernel-side (generic helpers will be provided
> > for drivers that need this list).
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> > * None
> >
> > Changes in v2:
> > * None
> > ---
> >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 9 ---------
> >  1 file changed, 9 deletions(-)
> >
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index 47ba2d057a92..237c8e8e6bca 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -1946,15 +1946,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __u16
> >        - ``nal_ref_idc``
> >        - NAL reference ID value coming from the NAL Unit header
> > -    * - __u8
> > -      - ``ref_pic_list_p0[32]``
> > -      - Backward reference list used by P-frames in the original bitstream order
> > -    * - __u8
> > -      - ``ref_pic_list_b0[32]``
> > -      - Backward reference list used by B-frames in the original bitstream order
> > -    * - __u8
> > -      - ``ref_pic_list_b1[32]``
> > -      - Forward reference list used by B-frames in the original bitstream order
> >      * - __s32
> >        - ``top_field_order_cnt``
> >        - Picture Order Count for the coded top field  
> 
> Thanks for the patch.
> 
> Don't we also need to remove these fields from the UAPI structs?

Oops, indeed. I'll drop them in the next version.
