Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13AC920B150
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728411AbgFZMWT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 26 Jun 2020 08:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728318AbgFZMWS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:22:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A97C08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 05:22:18 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jonN3-0003sz-DV; Fri, 26 Jun 2020 14:22:17 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jonN1-000089-50; Fri, 26 Jun 2020 14:22:15 +0200
Message-ID: <e55548ad47eacd9acf3aa94cc98a46b3f4924cd9.camel@pengutronix.de>
Subject: Re: [RFC v4 4/8] v4l2: add support for colorspace conversion API
 (CSC) for video capture and subdevices
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org, skhan@linuxfoundation.org,
        Hans Verkuil <hans.verkuil@cisco.com>
Date:   Fri, 26 Jun 2020 14:22:15 +0200
In-Reply-To: <973edb0c-4c52-c29c-4b22-54a05eca6f7a@xs4all.nl>
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
         <20200605172625.19777-5-dafna.hirschfeld@collabora.com>
         <973edb0c-4c52-c29c-4b22-54a05eca6f7a@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Mon, 2020-06-08 at 12:00 +0200, Hans Verkuil wrote:
[...]
> > diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
> > index 123a231001a8..0f916278137a 100644
> > --- a/include/uapi/linux/v4l2-mediabus.h
> > +++ b/include/uapi/linux/v4l2-mediabus.h
> > @@ -16,6 +16,8 @@
> >  #include <linux/types.h>
> >  #include <linux/videodev2.h>
> >  
> > +#define V4L2_MBUS_FRAMEFMT_SET_CSC	0x0001
> > +
> >  /**
> >   * struct v4l2_mbus_framefmt - frame format on the media bus
> >   * @width:	image width
> > @@ -36,7 +38,8 @@ struct v4l2_mbus_framefmt {
> >  	__u16			ycbcr_enc;
> >  	__u16			quantization;
> >  	__u16			xfer_func;
> > -	__u16			reserved[11];
> > +	__u16			flags;
> > +	__u16			reserved[10];
> >  };

The the flags field should also be added to the kerneldoc comment.

> >  
> >  #ifndef __KERNEL__
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 5d2a1dab7911..972e64d8b54e 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -65,6 +65,8 @@ struct v4l2_subdev_crop {
> >  	__u32 reserved[8];
> >  };
> >  
> > +#define V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC	0x00000001
> > +#define V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION	0x00000002
> >  /**
> >   * struct v4l2_subdev_mbus_code_enum - Media bus format enumeration
> >   * @pad: pad number, as reported by the media API
> > @@ -77,7 +79,8 @@ struct v4l2_subdev_mbus_code_enum {
> >  	__u32 index;
> >  	__u32 code;
> >  	__u32 which;
> > -	__u32 reserved[8];
> > +	__u32 flags;
> > +	__u32 reserved[7];
> >  };

Same as above.

regards
Philipp
