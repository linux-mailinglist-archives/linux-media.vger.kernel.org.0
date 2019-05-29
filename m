Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED5F62E2B4
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 19:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfE2RAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 13:00:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54102 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfE2RAA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 13:00:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D1499260D33
Message-ID: <87ee90d1f42dfbaff43ac29ecadcb5c1d5748230.camel@collabora.com>
Subject: Re: [PATCH] media: v4l2: Initialize mpeg slice controls
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com
Date:   Wed, 29 May 2019 13:59:50 -0300
In-Reply-To: <20190529180635.0fef93bd@collabora.com>
References: <20190503114221.28469-1-boris.brezillon@collabora.com>
         <b025d972-b7a9-ae0d-a286-e0364d1b52ea@xs4all.nl>
         <100592967e3c3546b4dcbbb8a0369297b27fa8e8.camel@collabora.com>
         <70396bcf-7fdc-f69b-7b8a-f0d6958093dc@xs4all.nl>
         <20190529180635.0fef93bd@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-05-29 at 18:06 +0200, Boris Brezillon wrote:
> On Wed, 29 May 2019 17:42:58 +0200
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
> > On 5/29/19 5:36 PM, Ezequiel Garcia wrote:
> > > On Wed, 2019-05-29 at 16:41 +0200, Hans Verkuil wrote:  
> > > > On 5/3/19 1:42 PM, Boris Brezillon wrote:  
> > > > > Make sure the default value at least passes the std_validate() tests.
> > > > > 
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > ---
> > > > >  drivers/media/v4l2-core/v4l2-ctrls.c | 20 +++++++++++++++++++-
> > > > >  1 file changed, 19 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > > index b1ae2e555c68..19d40cc6e565 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > > @@ -1461,7 +1461,14 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
> > > > >  static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> > > > >  		     union v4l2_ctrl_ptr ptr)
> > > > >  {
> > > > > -	switch (ctrl->type) {
> > > > > +	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> > > > > +
> > > > > +	/*
> > > > > +	 * The cast is needed to get rid of a gcc warning complaining that
> > > > > +	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS is not part of the
> > > > > +	 * v4l2_ctrl_type enum.
> > > > > +	 */
> > > > > +	switch ((u32)ctrl->type) {
> > > > >  	case V4L2_CTRL_TYPE_STRING:
> > > > >  		idx *= ctrl->elem_size;
> > > > >  		memset(ptr.p_char + idx, ' ', ctrl->minimum);
> > > > > @@ -1486,6 +1493,17 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> > > > >  	case V4L2_CTRL_TYPE_U32:
> > > > >  		ptr.p_u32[idx] = ctrl->default_value;
> > > > >  		break;
> > > > > +	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> > > > > +		p_mpeg2_slice_params = ptr.p;
> > > > > +		/* 4:2:0 */
> > > > > +		p_mpeg2_slice_params->sequence.chroma_format = 1;
> > > > > +		/* 8 bits */
> > > > > +		p_mpeg2_slice_params->picture.intra_dc_precision = 0;
> > > > > +		/* interlaced top field */
> > > > > +		p_mpeg2_slice_params->picture.picture_structure = 1;
> > > > > +		p_mpeg2_slice_params->picture.picture_coding_type =
> > > > > +					V4L2_MPEG2_PICTURE_CODING_TYPE_I;  
> > > > 
> > > > Oops, this isn't complete. It should still zero the p_mpeg2_slice_params
> > > > struct first. Right now any fields not explicitly set just have whatever
> > > > was in memory.
> 
> Oops.
> 
> > > > Can you post a patch fixing this?
> > > > 
> > > >  
> > > 
> > > I was wondering if we want to zero all the cases, and not just
> > > the struct types ones.  
> > 
> > The others either overwrite the data with the default_value, or memset
> > the whole control (default case). It's only for these compound controls
> > that something special needs to be done.
> > 
> > The code can be restructured, though: instead of break do return in all
> > the simple type cases.
> > 
> > Then call memset followed by a new switch for the compound types where you
> > need to set some fields to non-zero.
> 
> memset(0) will fix the undefined val issue, the question is, is it the
> default we want? I haven't worked on MPEG2 (just posted patches
> Ezequiel worked on) so I can't tell.
> 

Well, any fields where zero is not a good default, should be assigned here.

