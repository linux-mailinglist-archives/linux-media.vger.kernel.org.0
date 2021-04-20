Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D907365D63
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 18:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhDTQde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 12:33:34 -0400
Received: from mga11.intel.com ([192.55.52.93]:5792 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232473AbhDTQda (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 12:33:30 -0400
IronPort-SDR: 9Hr8hvmqPl9EIDqAWkiTD4oZh7/PRA7jv/FDl86gxVHigzI21f8sY3wsHdwlENHiFMYa1gEpHP
 8pUdWvF+OiGA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="192352448"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="192352448"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 09:32:59 -0700
IronPort-SDR: MDh+EdRzx5Bki9aimmx70ySp7XidH0JXW1aKlSC9TxGjhE5A7mT9Ms78tdX0PjmfOX+guSx28Z
 6GasMEyZNOKw==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="523873563"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 09:32:56 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 484CB2051E;
        Tue, 20 Apr 2021 19:32:53 +0300 (EEST)
Date:   Tue, 20 Apr 2021 19:32:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 16/24] v4l: Add CSI-2 bus configuration to frame
 descriptors
Message-ID: <20210420163253.GT3@paasikivi.fi.intel.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-17-tomi.valkeinen@ideasonboard.com>
 <YHyHhqk+SoZLlA3S@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHyHhqk+SoZLlA3S@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Apr 18, 2021 at 10:24:54PM +0300, Laurent Pinchart wrote:
> Hi Tomi and Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 15, 2021 at 04:04:42PM +0300, Tomi Valkeinen wrote:
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Add CSI-2 bus specific configuration to the frame descriptors. This allows
> > obtaining the virtual channel and data type information for each stream
> > the transmitter is sending.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 85977abbea46..30ec011d31e3 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -308,6 +308,17 @@ struct v4l2_subdev_audio_ops {
> >  	int (*s_stream)(struct v4l2_subdev *sd, int enable);
> >  };
> >  
> > +/**
> > + * struct v4l2_mbus_frame_desc_entry_csi2
> > + *
> > + * @channel: CSI-2 virtual channel
> 
> Maybe s/channel/virtual_channel/ ? Or vc and dt ?

Either seems good.

It's inherently about CSI-2 so maybe vc and dt below?

> 
> > + * @data_type: CSI-2 data type ID
> > + */
> > +struct v4l2_mbus_frame_desc_entry_csi2 {
> > +	u8 channel;
> > +	u8 data_type;
> > +};
> > +
> >  /**
> >   * enum v4l2_mbus_frame_desc_flags - media bus frame description flags
> >   *
> > @@ -331,11 +342,16 @@ enum v4l2_mbus_frame_desc_flags {
> >   *		%FRAME_DESC_FL_BLOB is not set.
> >   * @length:	number of octets per frame, valid if @flags
> >   *		%V4L2_MBUS_FRAME_DESC_FL_LEN_MAX is set.
> > + * @bus:	Bus specific frame descriptor parameters
> 
> s/Bus specific/Bus-specific/
> 
> > + * @bus.csi2:	CSI-2 specific bus configuration
> 
> Ditto.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Sakari Ailus
