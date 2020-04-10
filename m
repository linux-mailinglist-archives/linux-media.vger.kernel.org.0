Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0E6A1A4529
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 12:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgDJKYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 06:24:12 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44783 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgDJKYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 06:24:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id z26so1477933ljz.11
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2020 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kyQQZTu8ilEJHmXqQc/fvsDyq+JakClHMUtKoqdpLhM=;
        b=Q2v9Ls4j8j/SoqK0nXmC9k/2StsBSV+zwfzA6uhkQDSN+0A1oIs2xgvSTAXQO1fv6l
         /wkOL/I7SWrN+sXkuE2k68iszuWDXPbfCLfWWEpqW4o6LK+TrGyFFN0FzXz1HFEg8ma6
         r/2NLAE4WzwMqlEAUU8+mi2WpxX9dk1SuQ3xSP1EmyrabpjQ9OoMPVqjl7b9rVmUqQvn
         8i1yCPqj+BoenDvbhz89xMBEIDrjYe6JYVwuLshjPda2oydUuZs6rqaSwK8C7EuGJXOy
         Pn0+Q/9rq8wiUyv3804XD9Qg0znkGP6W17bkLqtw5C22OJoyxtffKk1eCwGv5CctTfd3
         MbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kyQQZTu8ilEJHmXqQc/fvsDyq+JakClHMUtKoqdpLhM=;
        b=aoVudCYmD2Fo9g+3fHvLMKctd3RI50LxRn5ww4ad+gV46b6+jhWwvZBAjwLD6w1gtH
         SvGtU9RMj5SkKGTtjDpvKtANblW1svJ8Ppmc/wT64NGMz27j+mzdcCAw1+8QR49kqOa6
         QXWlqmyu/bIQRyOpQDXlXNxgwAJ+biISRjoaYiXIlQpCDcFhzeEcJSRmdVkN2KOpTFlo
         NQs5gtk7TaDMRBChvyQhT3WCuA4C6JUInQBBXxnBUBamwSdsDXAMxb2LrTqGU69kzbGN
         0DMsp4ahTxfA6RB7XwTQgy41hUIZv2yrOPeWaL86cukPwdca0SMxg0M+SJSQfzxEiLUL
         u3Uw==
X-Gm-Message-State: AGi0PuYv+6MhxORMQEvYuitpBWXztWX9/evO+/Pw92teXbLhn7f9M0X2
        ssr5Ecs2b8C9F74tjhnaSpI8s2qKxbs=
X-Google-Smtp-Source: APiQypJ0r4qc5K0psIo1R++pim3hLMNRg0W3OQynTISzhqJB4OhBrshtQ+GypZO5MQiBkCpOChDqGw==
X-Received: by 2002:a2e:904b:: with SMTP id n11mr2555224ljg.171.1586514248760;
        Fri, 10 Apr 2020 03:24:08 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id 64sm832464ljj.41.2020.04.10.03.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 03:24:07 -0700 (PDT)
Date:   Fri, 10 Apr 2020 12:24:06 +0200
From:   "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hyun Kwon <hyun.kwon@xilinx.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, Hyun Kwon <hyunk@xilinx.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/4] media: v4l2-subdv: Introduce get_mbus_config pad op
Message-ID: <20200410102406.GB2798828@oden.dyn.berto.se>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-3-jacopo+renesas@jmondi.org>
 <20200401223037.GB583@smtp.xilinx.com>
 <20200407222255.GS1716317@oden.dyn.berto.se>
 <20200409073507.yes2rnvqhbj3k3ya@uno.localdomain>
 <20200410003028.GB3396@smtp.xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200410003028.GB3396@smtp.xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Huyn,

On 2020-04-09 17:30:28 -0700, Hyun Kwon wrote:
> Hi Niklas and Jacop,
> 
> On Thu, 2020-04-09 at 00:35:07 -0700, Jacopo Mondi wrote:
> > Hi Niklas, Huyn,
> > On Wed, Apr 08, 2020 at 12:22:55AM +0200, niklas.soderlund+renesas@ragnatech.se wrote:
> > > Hi Hyun and Jacopo,
> > >
> > > On 2020-04-01 15:30:38 -0700, Hyun Kwon wrote:
> > > > Hi Jacopo,
> > > >
> > > > Thanks for the patch.
> > > >
> > > > On Fri, 2020-03-13 at 07:40:33 -0700, Jacopo Mondi wrote:
> > > > > Introduce a new pad operation to allow retrieving the media bus
> > > > > configuration on a subdevice pad.
> > > > >
> > > > > The newly introduced operation reassembles the s/g_mbus_config video
> > > > > operation, which have been on their way to be deprecated since a long
> > > > > time.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > ---
> > > > >  include/media/v4l2-subdev.h | 67 +++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 67 insertions(+)
> > > > >
> > > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > > index 761aa83a3f3c..3a1afc00e094 100644
> > > > > --- a/include/media/v4l2-subdev.h
> > > > > +++ b/include/media/v4l2-subdev.h
> > > > > @@ -350,6 +350,70 @@ struct v4l2_mbus_frame_desc {
> > > > >  	unsigned short num_entries;
> > > > >  };
> > > > >
> > > > > +/**
> > > > > + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> > > > > + * @hsync_active: hsync active state: true for high, false for low
> > > > > + * @vsync_active: vsync active state: true for high, false for low
> > > > > + * @pclk_rising: pixel clock active edge: true for rising, false for falling
> > > > > + * @data_active: data lines active state: true for high, false for low
> > > > > + */
> > > > > +struct v4l2_mbus_parallel_config {
> > > > > +	bool hsync_active : 1;
> > > > > +	bool vsync_active : 1;
> > > > > +	bool pclk_rising : 1;
> > > > > +	bool data_active : 1;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
> > > > > + * @data_lanes: number of data lanes in use
> > > > > + * @clock_noncontinuous: non continuous clock enable flag
> > > > > + */
> > > > > +struct v4l2_mbus_csi2_dphy_config {
> > > > > +	unsigned int data_lanes : 3;
> > > > > +	bool clock_noncontinuous : 1;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_mbus_csi2_cphy_config - MIPI CSI-2 CPHY mbus configuration
> > > > > + *
> > > > > + * TODO
> > > > > + */
> > > > > +struct v4l2_mbus_csi2_cphy_config {
> > > > > +	/* TODO */
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_mbus_pad_config - media bus configuration
> > > > > + *
> > > > > + * Report the subdevice media bus information to inform the caller of the
> > > > > + * current bus configuration. The structure describes bus configuration
> > > > > + * parameters that might change in-between streaming sessions, in order to allow
> > > > > + * the caller to adjust its media bus configuration to match what is reported
> > > > > + * here.
> > > > > + *
> > > > > + * TODO: add '_pad_' to the name to distinguish this from the structure
> > > > > + * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
> > > > > + * video operations. Reuse the there defined enum v4l2_mbus_type to define
> > > > > + * the bus type.
> > > > > + *
> > > > > + * @type: mbus type. See &enum v4l2_mbus_type
> > > > > + * @parallel: parallel bus configuration parameters.
> > > > > + *	      See &struct v4l2_mbus_parallel_config
> > > > > + * @csi2_dphy: MIPI CSI-2 DPHY configuration parameters
> > > > > + *	       See &struct v4l2_mbus_csi2_dphy_config
> > > > > + * @csi2_cphy: MIPI CSI-2 CPHY configuration parameters
> > > > > + *	       See &struct v4l2_mbus_csi2_cphy_config
> > > > > + */
> > > > > +struct v4l2_mbus_pad_config {
> > > > > +	enum v4l2_mbus_type type;
> > > > > +	union {
> > > > > +		struct v4l2_mbus_parallel_config parallel;
> > > > > +		struct v4l2_mbus_csi2_dphy_config csi2_dphy;
> > > > > +		struct v4l2_mbus_csi2_cphy_config csi2_cphy;
> > > > > +	};
> > > > > +};
> > > > > +
> > > > >  /**
> > > > >   * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
> > > > >   *				  in video mode.
> > > > > @@ -670,6 +734,7 @@ struct v4l2_subdev_pad_config {
> > > > >   *
> > > > >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> > > > >   *                  may be adjusted by the subdev driver to device capabilities.
> > > > > + * @get_mbus_config: get the current mbus configuration
> > > > >   */
> > > > >  struct v4l2_subdev_pad_ops {
> > > > >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > > > > @@ -710,6 +775,8 @@ struct v4l2_subdev_pad_ops {
> > > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > > >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> > > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > > > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > > > > +			       struct v4l2_mbus_pad_config *config);
> > > >
> > > > Because this can be used in many different ways, there's more chance it can
> > > > be misused. That means, drivers call this in different locations, ex probe,
> > > > get format, start stream,,,, and on differnt pads, src or sink. So imagine
> > > > one set of drivers call on sink pad, and the other set call on source pad.
> > > > It works well only until those are mixed together.
> > 
> > I don't think we can right now establish all possible use cases, or
> > prevent people from shooting in their foot, moreover, the 'right'
> > usage really depends on the bus in use, and I can't tell where this is
> > will be used in the wild...
> > 
> > >
> > > That subdevice operations can be called at both probe and s_stream() is
> > > nothing new, I don't thin this is a new problem. But I agree maybe we
> > > could limit get_mbus_config() in the core to only be valid four source
> > > pads? Apart from this open question I think this patch looks good.
> > >
> > 
> > I'm a bit skeptical on limiting this to source pads as, again, this
> > really depends on the bus on which this operation is used. For my
> > limited knowledge, yes, the use case is always the receiver quering
> > the transmitter, but I don't feel like ruling out the opposite.
> > 
> > > >
> > > > So wouldn't it be better to put some restrictions? One is to document
> > > > recommendations. I think this better be called in stream on because
> > > > some bus config may change at runtime depending on other configuration.
> > > > So any bus config prior to stream-on may be outdated. The other is to
> > > > enforce in the code. Some, but maybe not all, can be handled in
> > > > v4l2_subdev_call_pad_wrappers, for example allowing this call only on
> > > > source pad.
> > > >
> > 
> > I hear your concern, but I think it really depends on the use cases
> > and I would have an hard time to provide recommendations that
> > address all use cases.
> > 
> > Is your concern due to some mis-uses example you can describe ?
> 
> Yeah, while trying this out, I was thinking how it should be used. I ended
> up with a specific way: single direction, starting from stream on,
> 
> (streamon) -> max9286 -> (g_mbus_conf) -> max96705 -> (g_mbus_conf) -> sensor1
> 
> It's this way because max96705 doesn't have own vsync polarity, and it
> should get it from the connected sensor. While someone may implement the same
> in complete opposite direction for another set of drivers, starting from
> sensor, or even in different entry point,

I agree with the use-case above.

> 
> (s_fmt) -> sensor2 -> (g_mbus_conf) -> some_ser -> (g_mbus_conf) -> some_des
> 
> When the sensor2 driver is used with max96705 above, there could be a problem
> such as circular calls or getting an outdated value. And it is harder to fix at
> that point. So I thought enforcing the direction works for current use cases
> (under my visilbity), and may help avoid such issue in future. Probably it may
> be just me over-thinking, as it sounds like? :-)

If a format is set on a subdevice we are operating on a subdevice that 
is part of a media device right? If so shall setting the format of the 
different entities of the graph involve cross entry calls? Shall not the 
entire pipeline format be validated at stream_start() and that is the 
time g_mbus_conf() would be involved like in the first case above. I 
might have misunderstood something if so I apologize.

> 
> Thanks,
> -hyun
> 
> > 
> > Thanks
> >    j
> > 
> > > > Thanks,
> > > > -hyun
> > > >
> > > > >  };
> > > > >
> > > > >  /**
> > > > > --
> > > > > 2.25.1
> > > > >
> > >
> > > --
> > > Regards,
> > > Niklas Söderlund

-- 
Regards,
Niklas Söderlund
