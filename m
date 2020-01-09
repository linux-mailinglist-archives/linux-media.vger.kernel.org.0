Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC2A9135BA0
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 15:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbgAIOqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 09:46:45 -0500
Received: from mailoutvs8.siol.net ([185.57.226.199]:59521 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729054AbgAIOqp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jan 2020 09:46:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 313305220DE;
        Thu,  9 Jan 2020 15:46:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Jkx5YzaTqnNS; Thu,  9 Jan 2020 15:46:41 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id B7B3452123B;
        Thu,  9 Jan 2020 15:46:41 +0100 (CET)
Received: from jernej-laptop.localnet (unknown [194.6.237.34])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 93E4E5220DE;
        Thu,  9 Jan 2020 15:46:40 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        hverkuil@xs4all.nl, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] media: uapi: hevc: Add segment address field
Date:   Thu, 09 Jan 2020 15:46:40 +0100
Message-ID: <4523910.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20200108153126.49698491@kernel.org>
References: <20191213160428.54303-1-jernej.skrabec@siol.net> <20191213160428.54303-4-jernej.skrabec@siol.net> <20200108153126.49698491@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne sreda, 08. januar 2020 ob 15:31:26 CET je Mauro Carvalho Chehab 
napisal(a):
> Em Fri, 13 Dec 2019 17:04:27 +0100
> 
> Jernej Skrabec <jernej.skrabec@siol.net> escreveu:
> > If HEVC frame consists of multiple slices, segment address has to be
> > known in order to properly decode it.
> > 
> > Add segment address field to slice parameters.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 5 ++++-
> >  include/media/hevc-ctrls.h                       | 5 ++++-
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst index
> > aab1451e54d4..5415d5babcc2 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -3975,6 +3975,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > 
> >      * - __u32
> >      
> >        - ``data_bit_offset``
> >        - Offset (in bits) to the video data in the current slice data.
> > 
> > +    * - __u32
> > +      - ``slice_segment_addr``
> > +      -
> > 
> >      * - __u8
> >      
> >        - ``nal_unit_type``
> >        -
> > 
> > @@ -4052,7 +4055,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > 
> >        - ``num_rps_poc_lt_curr``
> >        - The number of reference pictures in the long-term set.
> >      
> >      * - __u8
> > 
> > -      - ``padding[7]``
> > +      - ``padding[5]``
> > 
> >        - Applications and drivers must set this to zero.
> >      
> >      * - struct :c:type:`v4l2_hevc_dpb_entry`
> >      
> >        - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > 
> > diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> > index 1592e52c3614..3e2e32098312 100644
> > --- a/include/media/hevc-ctrls.h
> > +++ b/include/media/hevc-ctrls.h
> > @@ -167,6 +167,9 @@ struct v4l2_ctrl_hevc_slice_params {
> > 
> >  	__u32	bit_size;
> >  	__u32	data_bit_offset;
> > 
> > +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header 
*/
> > +	__u32	slice_segment_addr;
> > +
> 
> Why are you adding it in the middle of the data? This will break any
> existing userspace code that might be relying on it.
> 
> Ok, I know that this header is not yet under include/uapi,and there's a
> warning on it for letting people know that it shouldn't be used anywhere.
> 
> Still, people might be using it.

I did it that way to keep fields aligned. Cedrus is currently the only 
mainlined driver to use this structure and userspace users are also very rare 
at this time.

Anyway, not all HEVC features are supported at this time, which means that 
this structure might grow. Once that happens, you'll lose binary compatibility 
anyway, but source compatibility should be fine.

Best regards,
Jernej

> 
> >  	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
> >  	__u8	nal_unit_type;
> >  	__u8	nuh_temporal_id_plus1;
> > 
> > @@ -200,7 +203,7 @@ struct v4l2_ctrl_hevc_slice_params {
> > 
> >  	__u8	num_rps_poc_st_curr_after;
> >  	__u8	num_rps_poc_lt_curr;
> > 
> > -	__u8	padding;
> > +	__u8	padding[5];
> > 
> >  	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header 
*/
> >  	struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> 
> Cheers,
> Mauro




