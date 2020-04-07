Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3431A17EF
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 00:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgDGWXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 18:23:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42203 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgDGWXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 18:23:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id q19so5475288ljp.9
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JVjv/iMNLYTvNloLYajdKiynxay+Ft9mmPFuTOX5WCA=;
        b=Q4fGCMOtiDvSzntXrtlORGtp3yq5PJA3CVPv8+VFoJvcRvw/1zjUx+s2TmuEKZI9cY
         9YF6mMK7usfL+vNGDbe2qCGhwJdmrSWeNUsk2Apq8r3j5wWnV5QEsHt52/ENHedPY/aE
         QGgTbNfCHn577snA7Hg66dNdG9tFfb18avos2GLzYhifiRpVU3Z1D0EeZOQvBVYUb3NC
         NZzqFRxJTh10ZBqV7R7C5IfbJSRzm5GOHEMO4fqXokwOeX0lKsEfOObXWK9etw4sgC6i
         AbLdXHxFLJc8shqeNymHZFqjEe+KO7V4S1H4t3KFgp6+DdcmD2WeLrOII7f0rdzu2cWQ
         tSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JVjv/iMNLYTvNloLYajdKiynxay+Ft9mmPFuTOX5WCA=;
        b=JKug6KAHBAja2xKocyEt7HyThosKHQ9khAOTEPFfqVIWvHF1B11X1LFARI1GVs3+oE
         Lwmb2iPglXc1mRYeJJR0NUlMkcV7+mTtuvBhejqsaqX2PWoAUe1dxlSz9opkQlJcY8a7
         HBCyH0ebR/wLtaRsSRr665ujitGkD+iCveNzgi4/qtF97GflkQ3lCo1hBrLfxsjSiY8l
         yy1akwX+5BKnZdEvnU6EeP52ZTuzsBvV3adhTJ4ZkTNCc+/QnYn2x9MniIzYw6yHR1aN
         qBdQ0J+q8u5JvapimPsPDVxHYyFbjj0Nyah0y9C3vkMVyUbthC0soQp6H/wU6cJExxS1
         id0w==
X-Gm-Message-State: AGi0PuZGgcaO5rp3rVmDgwtMoKveIamHefZMg1oLEhZHPZEYoCZJh7Sn
        sq41caWgOISZCHSDnoAlf6ByPA==
X-Google-Smtp-Source: APiQypK3FpInK03TcNoOZ7oV8xziVZb32E1LKiXVCLDdL2aPhSwALOJqvKwRb0eyRag4sfo61W7uKw==
X-Received: by 2002:a2e:8693:: with SMTP id l19mr3156462lji.132.1586298176734;
        Tue, 07 Apr 2020 15:22:56 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id z9sm12332865lfd.9.2020.04.07.15.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 15:22:56 -0700 (PDT)
Date:   Wed, 8 Apr 2020 00:22:55 +0200
From:   "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hyun Kwon <hyun.kwon@xilinx.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
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
Message-ID: <20200407222255.GS1716317@oden.dyn.berto.se>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-3-jacopo+renesas@jmondi.org>
 <20200401223037.GB583@smtp.xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200401223037.GB583@smtp.xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hyun and Jacopo,

On 2020-04-01 15:30:38 -0700, Hyun Kwon wrote:
> Hi Jacopo,
> 
> Thanks for the patch.
> 
> On Fri, 2020-03-13 at 07:40:33 -0700, Jacopo Mondi wrote:
> > Introduce a new pad operation to allow retrieving the media bus
> > configuration on a subdevice pad.
> > 
> > The newly introduced operation reassembles the s/g_mbus_config video
> > operation, which have been on their way to be deprecated since a long
> > time.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 67 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 761aa83a3f3c..3a1afc00e094 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -350,6 +350,70 @@ struct v4l2_mbus_frame_desc {
> >  	unsigned short num_entries;
> >  };
> >  
> > +/**
> > + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> > + * @hsync_active: hsync active state: true for high, false for low
> > + * @vsync_active: vsync active state: true for high, false for low
> > + * @pclk_rising: pixel clock active edge: true for rising, false for falling
> > + * @data_active: data lines active state: true for high, false for low
> > + */
> > +struct v4l2_mbus_parallel_config {
> > +	bool hsync_active : 1;
> > +	bool vsync_active : 1;
> > +	bool pclk_rising : 1;
> > +	bool data_active : 1;
> > +};
> > +
> > +/**
> > + * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
> > + * @data_lanes: number of data lanes in use
> > + * @clock_noncontinuous: non continuous clock enable flag
> > + */
> > +struct v4l2_mbus_csi2_dphy_config {
> > +	unsigned int data_lanes : 3;
> > +	bool clock_noncontinuous : 1;
> > +};
> > +
> > +/**
> > + * struct v4l2_mbus_csi2_cphy_config - MIPI CSI-2 CPHY mbus configuration
> > + *
> > + * TODO
> > + */
> > +struct v4l2_mbus_csi2_cphy_config {
> > +	/* TODO */
> > +};
> > +
> > +/**
> > + * struct v4l2_mbus_pad_config - media bus configuration
> > + *
> > + * Report the subdevice media bus information to inform the caller of the
> > + * current bus configuration. The structure describes bus configuration
> > + * parameters that might change in-between streaming sessions, in order to allow
> > + * the caller to adjust its media bus configuration to match what is reported
> > + * here.
> > + *
> > + * TODO: add '_pad_' to the name to distinguish this from the structure
> > + * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
> > + * video operations. Reuse the there defined enum v4l2_mbus_type to define
> > + * the bus type.
> > + *
> > + * @type: mbus type. See &enum v4l2_mbus_type
> > + * @parallel: parallel bus configuration parameters.
> > + *	      See &struct v4l2_mbus_parallel_config
> > + * @csi2_dphy: MIPI CSI-2 DPHY configuration parameters
> > + *	       See &struct v4l2_mbus_csi2_dphy_config
> > + * @csi2_cphy: MIPI CSI-2 CPHY configuration parameters
> > + *	       See &struct v4l2_mbus_csi2_cphy_config
> > + */
> > +struct v4l2_mbus_pad_config {
> > +	enum v4l2_mbus_type type;
> > +	union {
> > +		struct v4l2_mbus_parallel_config parallel;
> > +		struct v4l2_mbus_csi2_dphy_config csi2_dphy;
> > +		struct v4l2_mbus_csi2_cphy_config csi2_cphy;
> > +	};
> > +};
> > +
> >  /**
> >   * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
> >   *				  in video mode.
> > @@ -670,6 +734,7 @@ struct v4l2_subdev_pad_config {
> >   *
> >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> >   *                  may be adjusted by the subdev driver to device capabilities.
> > + * @get_mbus_config: get the current mbus configuration
> >   */
> >  struct v4l2_subdev_pad_ops {
> >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > @@ -710,6 +775,8 @@ struct v4l2_subdev_pad_ops {
> >  			      struct v4l2_mbus_frame_desc *fd);
> >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> >  			      struct v4l2_mbus_frame_desc *fd);
> > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_pad_config *config);
> 
> Because this can be used in many different ways, there's more chance it can
> be misused. That means, drivers call this in different locations, ex probe,
> get format, start stream,,,, and on differnt pads, src or sink. So imagine
> one set of drivers call on sink pad, and the other set call on source pad.
> It works well only until those are mixed together.

That subdevice operations can be called at both probe and s_stream() is 
nothing new, I don't thin this is a new problem. But I agree maybe we 
could limit get_mbus_config() in the core to only be valid four source 
pads? Apart from this open question I think this patch looks good.

> 
> So wouldn't it be better to put some restrictions? One is to document
> recommendations. I think this better be called in stream on because
> some bus config may change at runtime depending on other configuration.
> So any bus config prior to stream-on may be outdated. The other is to
> enforce in the code. Some, but maybe not all, can be handled in
> v4l2_subdev_call_pad_wrappers, for example allowing this call only on
> source pad.
> 
> Thanks,
> -hyun
> 
> >  };
> >  
> >  /**
> > -- 
> > 2.25.1
> > 

-- 
Regards,
Niklas Söderlund
