Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481FD508AB9
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 16:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379666AbiDTO0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 10:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379671AbiDTO0i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 10:26:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E4B44775;
        Wed, 20 Apr 2022 07:23:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62F4B2F2;
        Wed, 20 Apr 2022 16:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650464629;
        bh=N0kXKTT6a6phqhElAkC5LxBHq4zugZXpC+gcsdu4ed8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gZbyYKuAi5uPtSI0q61JE5DI4w2xyctxeKgF+B1EZeWTB3IeaM/TZdehFBI0FbUyT
         Gnc7r9Qp80bj6GzhmJ3Sa9HRZmyeJ149n6lXXGgeTqLqynhr/YpJvBlLZRKE1Dq8no
         v+6iRiC9SAJwcprDLQwfpu+1fxVC8QqpfCMXDYCM=
Date:   Wed, 20 Apr 2022 17:23:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com, linux-hwmon@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
Message-ID: <YmAXd5F2Rm/VDIb5@pendragon.ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
 <d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca>
 <3a4fad80-b16a-3780-a0f7-41dd6c80689e@roeck-us.net>
 <Yl8jF1KLzP6YO6t+@pendragon.ideasonboard.com>
 <1c700e5b-5bf2-f0eb-78f3-12290fd88234@roeck-us.net>
 <dec71c79-3141-8dcf-6d37-8495f4b7c7e9@foss.st.com>
 <YmAI3QVSPMq3mR7E@pendragon.ideasonboard.com>
 <76789333-bb0b-fcc2-6ba9-ab01c9aab62a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76789333-bb0b-fcc2-6ba9-ab01c9aab62a@roeck-us.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 20, 2022 at 06:58:32AM -0700, Guenter Roeck wrote:
> On 4/20/22 06:21, Laurent Pinchart wrote:
> > On Wed, Apr 20, 2022 at 03:01:18PM +0200, Benjamin Mugnier wrote:
> >> On 20/04/2022 00:04, Guenter Roeck wrote:
> >>> On 4/19/22 14:01, Laurent Pinchart wrote:
> >>>> On Tue, Apr 19, 2022 at 12:28:06PM -0700, Guenter Roeck wrote:
> >>>>> On 4/19/22 11:24, Nicolas Dufresne wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> adding linux-hwmon in CC for a wider feedback.
> >>>>>>
> >>>>>> Le vendredi 15 avril 2022 à 13:18 +0200, Benjamin Mugnier a écrit :
> >>>>>>> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
> >>>>>>> celsius as a volatile and read-only control, and its documentation.
> >>>>>>> Useful to monitor thermals from v4l controls for sensors that support
> >>>>>>> this.
> >>>>>>
> >>>>>> Any justification to expose a temperature sensor outside of the dedicated kernel
> >>>>>> API hwmon ? I know if may makes it harder to use, as the sensor isn't bound to
> >>>>>> the camera driver, and also the sensor may not work if the camera is not
> >>>>>> streaming. But in the end, the API in hwmon does not look that complex, and is
> >>>>>> perhaps more precise ?
> >>
> >> This sensor is able to read the temperature even if not streaming.
> >>
> >>>>>>
> >>>>>> All in all, I think we need a strong justification to implement a custom
> >>>>>> thermometer interface, something described here and documented with care to
> >>>>>> prevent abuse. I would also see opinion from folks outside of the linux-media,
> >>>>>> hence why I have CCed hwmon mailing list.
> >>>>>
> >>>>> All I can say is that this seems to be odd and a bit outside the scope of
> >>>>> v4l2. I would have expected the vgxy61 driver to register a hwmon device
> >>>>> instead.
> >>>>
> >>>> I don't have a definitive opinion yet, but as Nicolas raised the issue
> >>>> by pushing towards hwmon, I'll offer counter-arguments for the sake of
> >>>> it :-)
> >>>>
> >>>> The temperature sensor in the imaging sensor is used to measure the die
> >>>> temperature, in order to tune the noise and spectral response model of
> >>>> the imaging sensor. It's thus not a generic-purpose temperature sensor.
> >>>> If the feature were to be exposed through hwmon, userspace would need to
> >>>> associate an hwmon device to the imaging sensor V4L2 subdev (we have a
> >>>> way to do so through the MC API, it doesn't support hwmon at this point,
> >>>> but I suppose it could be added). There are also various constraints
> >>>> that tie the temperature reading to the imaging side, it could be that
> >>>> the temperature would only be readable while capturing frames. That's
> >>>> probably possible to handle too but returning an error from the
> >>>> temperature read.
> >>>>
> >>>> Code-wise, both the driver and userspace would be more complex, for very
> >>>> little practical gain (I don't dispute a theorical gain).
> >>>>
> >>>
> >>> All I can say is - not my subsystem, not my call to make. If you say this
> >>> is special and is better handled in V4L2, I'll take you by your word.
> >>>
> >>> Guenter
> >>>
> >>
> >> I'll happily implement whatever conclusion we make here.
> >>
> >> I could also drop this control for the first iteration of the driver,
> >> and come back later once a consensus is reached.
> > 
> > That would work too. By the way, what are your use cases for the
> > temperature sensor ? Have you added the control for the sake of
> > completeness, or do you have use cases ?
> 
> You provided a use case above. Are you saying you made it up ?
> Still fine with me, your call, just wondering.

It's the two most common use cases for imaging sensor temperature
measurements that I know of. My question to Benjamin is if he has the
same and/or other use cases.

-- 
Regards,

Laurent Pinchart
