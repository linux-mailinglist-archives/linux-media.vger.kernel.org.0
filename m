Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B426226E80
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 20:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730330AbgGTSoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 14:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730265AbgGTSoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 14:44:38 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547C8C061794;
        Mon, 20 Jul 2020 11:44:38 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r19so21280533ljn.12;
        Mon, 20 Jul 2020 11:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+YoXpwk7+8kuOjoleHTDa96KM6kzZ75tpCzm0nZWWaU=;
        b=ESMpNVJF/NxfVpKqVnHl7npKijZaUQm3z8AqQVPAdMb8u51bt56KlvHxXnpTid5oDh
         9TnlUuh340J9MySBVYyFuisXpXgJsDjWr2F+K4CEhxfJzIWP44I7FoZiN2oWYOFSunFw
         x6KeBBpdO07zO9NWl9e/Wg7JJPW9gmFTSfuOYGfp+7GCuaY1Pkz2IqZK0Orl6DlePfIN
         wdyhR2UHpovRqfvjtDegaPKOoMkGdhmwxtnZ6sLjpAx39U1Kbe9xlXWLHrJ3vJlotCxm
         wJOPutfYncHTD5Z2q+hZXpP80hBRu/f4Gqq9GNKV/wAP0grozEzhYZan/D5IRrrsesXX
         Kxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YoXpwk7+8kuOjoleHTDa96KM6kzZ75tpCzm0nZWWaU=;
        b=NiFVVQHUjUem/NhFxhSfDL7BKXOBHYtguETF95ZAtuU+4/GohyZK5NrkOmHIxFqJuu
         N64BYRjLtLzKj/ByZHtiuIpmHnrHG0HJ7bckeXoAFI4evQ7ggzEObNN8aKIoJTbNdlZ8
         VIEwM/jxGyG0cLv8HA7fY8vp6QGyaJ4Cs5/tESFYKqvQRPuxRRW5UMe/C2wVcIhfAo0Y
         MPzHE/9L7m/RzaWRvQycjQseXMpOm4Xkntg82wkwf3/h3r6cZKcRCFrOCnmTsZIHZFgv
         TGTBEwLd4KGFut0cxfFlwcxpzoPZojPHK7eVMEIs2v3i/MAlX6m+ri/EOsagaz2G3QXO
         5VlQ==
X-Gm-Message-State: AOAM532qB9mHAtB8buWprnqpbZLOp/cn3YTMqPOUcUG4nDbqWA3aZkf2
        IxCO/d/SIpfKkwYFCRFWVjo=
X-Google-Smtp-Source: ABdhPJwDeY/fWPYjfqsDsul7O1Bq3/OL7AVLo9ZOy6N7J5PYqyIYj2LCn8igYUrH+xZ+vDsL312Lhw==
X-Received: by 2002:a2e:9050:: with SMTP id n16mr10763202ljg.376.1595270676741;
        Mon, 20 Jul 2020 11:44:36 -0700 (PDT)
Received: from z50.localnet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id y2sm3349402lji.8.2020.07.20.11.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 11:44:35 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v6 1/9] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
Date:   Mon, 20 Jul 2020 20:44:33 +0200
Message-ID: <8674885.rMLUfLXkoz@z50>
In-Reply-To: <f60dc28c-ac30-0ddc-efb5-62b22d4cbaa7@xs4all.nl>
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org> <4043309.ejJDZkT8p0@z50> <f60dc28c-ac30-0ddc-efb5-62b22d4cbaa7@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Monday, July 20, 2020 10:48:36 A.M. CEST Hans Verkuil wrote:
> On 19/07/2020 13:18, Janusz Krzysztofik wrote:
> > Hi Hans,
> > 
> > On Wednesday, July 15, 2020 5:08:05 P.M. CEST Hans Verkuil wrote:
> >> On 14/07/2020 15:58, Jacopo Mondi wrote:
> >>> Introduce two new pad operations to allow retrieving and configuring the
> >>> media bus parameters on a subdevice pad.
> >>>
> >>> The newly introduced operations aims to replace the s/g_mbus_config video
> >>> operations, which have been on their way for deprecation since a long
> >>> time.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> ---
> >>>  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
> >>>  1 file changed, 27 insertions(+)
> >>>
> >>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >>> index f7fe78a6f65a..d8b9d5735307 100644
> >>> --- a/include/media/v4l2-subdev.h
> >>> +++ b/include/media/v4l2-subdev.h
> >>> @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
> >>>   *
> >>>   * @set_frame_desc: set the low level media bus frame parameters, @fd 
array
> >>>   *                  may be adjusted by the subdev driver to device 
capabilities.
> >>> + *
> >>> + * @get_mbus_config: get the media bus configuration of a remote sub-
device.
> >>> + *		     The media bus configuration is usually retrieved 
from the
> >>> + *		     firmware interface at sub-device probe time, 
immediately
> >>> + *		     applied to the hardware and eventually adjusted 
by the
> >>> + *		     driver. Remote sub-devices (usually video 
receivers) shall
> >>> + *		     use this operation to query the transmitting end 
bus
> >>> + *		     configuration in order to adjust their own one 
accordingly.
> >>> + *		     Callers should make sure they get the most up-to-
date as
> >>> + *		     possible configuration from the remote end, likely 
calling
> >>> + *		     this operation as close as possible to stream on 
time. The
> >>> + *		     operation shall fail if the pad index it has been 
called on
> >>> + *		     is not valid.
> >>> + *
> >>> + * @set_mbus_config: set the media bus configuration of a remote sub-
device.
> >>> + *		     This operations is intended to allow, in 
combination with
> >>> + *		     the get_mbus_config operation, the negotiation of 
media bus
> >>> + *		     configuration parameters between media sub-
devices. The
> >>> + *		     operation shall not fail if the requested 
configuration is
> >>> + *		     not supported, but the driver shall update the 
content of
> >>> + *		     the %config argument to reflect what has been 
actually
> >>> + *		     applied to the hardware. The operation shall fail 
if the
> >>> + *		     pad index it has been called on is not valid.
> >>>   */
> >>
> >> Hm, I'd hoped I could merge this, but I think include/media/v4l2-
mediabus.h
> >> also needs to be updated.
> >>
> >> So the old g_mbus_config returned all supported configurations, while the
> >> new get_mbus_config returns the *current* configuration.
> >>
> >> That's fine, but that means that the meaning of the struct v4l2_mbus_config
> >> flags field changes as well and several comments in v4l2-mediabus.h need to
> >> be updated to reflect this.
> >>
> >> E.g. instead of '/* How many lanes the client can use */' it becomes
> >> '/* How many lanes the client uses */'.
> >>
> >> Frankly, these flags can be redesigned now since you only need a single
> >> e.g. V4L2_MBUS_HSYNC_ACTIVE_HIGH flag since if it is not set, then that
> >> means ACTIVE_LOW. And since it is now a single bit, it is also easy to
> >> make each flag a bit field.
> > 
> > Even if this makes sense for .get_mbus_config() which returns current 
> > configuration, how about keeping the old semantics of the flags and let 
> > .set_mbus_config() accept a potentially incomplete or redundant set of flags 
> > specified by the caller to select a supported configuration from?  That 
approach 
> > was actually proposed before by Jacopo when he argued against my 
suggestion to 
> > add a wrapper with a check for mutually exclusive flags[1], and I found it 
a 
> > very good alternative to my other rejected suggestion of adding TRY 
support.
> 
> The information on how a sensor (or similar device) is wired up is not 
something
> that should be negotiated. Even if a combination is theoretically possible, 
it
> may not have been tested by the board designer and in fact it might not 
work.
> (Yes, that happens)
> 
> It is just a bad design trying to negotiate this.
> 
> In fact, the only values that can be set as far as I am concerned are lanes 
and
> channels. I wouldn't mind if the other settings are purely read-only. The 
only
> driver that actively sets this is the pxa_camera driver and I wish it 
didn't.
> 
> But there are still two pxa boards that use this mechanism, so I guess we 
still
> have to allow this.
> 
> Anyway, do you have a specific use-case in mind?

Non-DT platforms in general.  You repeat quite often that configuration 
should come from DT.  While that's obvious, does that mean media is soon going 
to drop non-DT support completely?  If not then I think that it may be better 
to allow negotiation where possible than require each platform driver that 
still wishes to support non-DT platforms to define its own platform data 
structure.  At least parallel link settings seem to be a good candidate to me.

Anyway, as long as .set_mbus_config() is going to be supported, it is still 
possible for a platform driver to iterate through its supported configurations 
if passing incomplete or redundant flags and let the sensor handle that is not 
allowed.  More complicated, more time consuming, more error prone, I believe, 
but still possible.

Thanks,
Janusz


> Note that this is an internal
> API, so it can always be changed later.
> 
> Regards,
> 
> 	Hans
> 
> > 
> > [1] https://www.spinics.net/lists/linux-media/msg171878.html
> > 
> > Thanks,
> > Janusz
> > 
> >>
> >> The CSI2 lanes/channels can just be a bit field for the number of lanes/
channels,
> >> which is much easier to read. I strongly recommend making this change at 
the minimum.
> >>
> >> Now all this can be done in a follow-up series, but the v4l2-mediabus.h
> >> definitely needs to be updated to reflect the new code.
> >>
> >> This can be done as a v6 5.5/9 patch (since it should come right after 
the
> >> g/s_mbus_config removal).
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> >>>  struct v4l2_subdev_pad_ops {
> >>>  	int (*init_cfg)(struct v4l2_subdev *sd,
> >>> @@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
> >>>  			      struct v4l2_mbus_frame_desc *fd);
> >>>  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> >>>  			      struct v4l2_mbus_frame_desc *fd);
> >>> +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> >>> +			       struct v4l2_mbus_config *config);
> >>> +	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> >>> +			       struct v4l2_mbus_config *config);
> >>>  };
> >>>  
> >>>  /**
> >>>
> >>
> >>
> > 
> > 
> > 
> > 
> 
> 




