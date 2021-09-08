Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3D94035F2
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 10:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347914AbhIHITE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 04:19:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38862 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347475AbhIHITD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 04:19:03 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 649CD993;
        Wed,  8 Sep 2021 10:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631089074;
        bh=Fq/MTfvcyDZiPp/lDZs1ogyA4SXQQVjB35SB66BkyV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WvpWFMZwwKFDWv6wNulbtR6tNinhA57Zf/CeRH3kCUWyqFAqxiaDMQChlrGF3Ed2m
         csZCHuzKvvdcZk0axQ/HIVHP4FA+K5Sg4CM8p22YINNfujbjejXG0U4gemydyF1g28
         6esceZ6y/teBeSd/G5M74+biI7OthnsVuBUBWCYM=
Date:   Wed, 8 Sep 2021 11:17:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     bingbu.cao@intel.com, Tian Shu Qiu <tian.shu.qiu@intel.com>,
        sakari.ailus@linux.intel.com
Cc:     linux-media@vger.kernel.org,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>
Subject: Re: [RFC PATCH] media: staging: ipu3-imgu: add the AWB memory layout
Message-ID: <YThxnoukNwJjSUOr@pendragon.ideasonboard.com>
References: <20210831185140.77400-1-jeanmichel.hautbois@ideasonboard.com>
 <YS6gR2YSWPSftCO0@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YS6gR2YSWPSftCO0@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

(CC'ing Tomasz)

Gentle ping.

On Wed, Sep 01, 2021 at 12:34:00AM +0300, Laurent Pinchart wrote:
> On Tue, Aug 31, 2021 at 08:51:40PM +0200, Jean-Michel Hautbois wrote:
> > While parsing the RAW AWB metadata, the AWB layout was missing to fully
> > understand which byte corresponds to which feature. Make the field names
> > and usage explicit, as it is used by the userspace applications.
> > 
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > ---
> > This structure layout is defined in CrOs:
> > https://chromium.googlesource.com/chromiumos/platform/arc-camera/+/refs/heads/master/hal/intel/include/ia_imaging/awb_public.h
> > 
> > There are a few things not really understood right now:
> > - Is sat_ratio a full scale ratio (I can't get more than some values out
> >   of it, is it a ratio of 25%, 50%, 75%, 100% ?)
> > - What are the real minimum and maximum values for the grid size ? From
> >   CrOs it appears to be [16, 80] for width and [16, 60] for height while
> >   in this file it seems to be [16, 160] for width and not really defined
> >   for height AFAICT ?
> > - Same for the block_width_log2 and block_height_log2 which are [3, 7]
> >   in this file and [3, 6] in the awb_public.h header ?
> > 
> >  .../media/ipu3/include/uapi/intel-ipu3.h      | 38 ++++++++++++++-----
> >  1 file changed, 29 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> > index fa3d6ee5adf2..83191aff2ddd 100644
> > --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> > +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> > @@ -61,20 +61,40 @@ struct ipu3_uapi_grid_config {
> >  	__u16 y_end;
> >  } __packed;
> >  
> > +/**
> > + * struct ipu3_uapi_awb_raw_buffer - Memory layout for each cell in AWB
> > + *
> > + * @Gr_avg:	Green average for red lines in the cell.
> > + * @R_avg:	Red average in the cell.
> > + * @B_avg:	Blue average in the cell.
> > + * @Gb_avg:	Green average for blue lines in the cell.
> > + * @sat_ratio:  Saturation ratio in the cell.
> > + * @padding0:   Unused byte for padding.
> > + * @padding1:   Unused byte for padding.
> > + * @padding2:   Unused byte for padding.
> > + */
> > +struct ipu3_uapi_awb_raw_buffer {
> > +    unsigned char Gr_avg;
> > +    unsigned char R_avg;
> > +    unsigned char B_avg;
> > +    unsigned char Gb_avg;
> > +    unsigned char sat_ratio;
> > +    unsigned char padding0;
> > +    unsigned char padding1;
> > +    unsigned char padding2;
> > +} __packed;
> > +
> >  /*
> >   * The grid based data is divided into "slices" called set, each slice of setX
> >   * refers to ipu3_uapi_grid_config width * height_per_slice.
> >   */
> >  #define IPU3_UAPI_AWB_MAX_SETS				60
> > -/* Based on grid size 80 * 60 and cell size 16 x 16 */
> > -#define IPU3_UAPI_AWB_SET_SIZE				1280
> > -#define IPU3_UAPI_AWB_MD_ITEM_SIZE			8
> > -#define IPU3_UAPI_AWB_SPARE_FOR_BUBBLES \
> > -	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
> > -	 IPU3_UAPI_AWB_MD_ITEM_SIZE)
> > +#define AWB_PUBLIC_NUM_OF_ITEMS_IN_SET			160
> > +/* Based on max grid height + Spare for bubbles */
> > +#define AWB_PUBLIC_NUM_OF_SETS_IN_BUFFER IPU3_UAPI_AWB_MAX_SETS + \
> > +	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES)
> >  #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
> > -	(IPU3_UAPI_AWB_MAX_SETS * \
> > -	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
> > +        AWB_PUBLIC_NUM_OF_SETS_IN_BUFFER * AWB_PUBLIC_NUM_OF_ITEMS_IN_SET
> >  
> >  /**
> >   * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
> > @@ -83,7 +103,7 @@ struct ipu3_uapi_grid_config {
> >   *		the average values for each color channel.
> >   */
> >  struct ipu3_uapi_awb_raw_buffer {
> > -	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
> > +	struct ipu3_uapi_awb_raw_buffer meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
> >  		__attribute__((aligned(32)));
> >  } __packed;
> >  

-- 
Regards,

Laurent Pinchart
