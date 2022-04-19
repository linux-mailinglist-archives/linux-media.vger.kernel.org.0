Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250CA507B99
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 23:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357887AbiDSVEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 17:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357478AbiDSVEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 17:04:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81EFD34664;
        Tue, 19 Apr 2022 14:01:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-5-145-nat.elisa-mobile.fi [85.76.5.145])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 548CB305;
        Tue, 19 Apr 2022 23:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650402074;
        bh=ubXytSwKrFbHqk6isQkxfRoAUtE8jii3ldEPlvDfykY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mg9o9F14cwEuyi2wKLDVm2mlnsjEDr4mm5p6uRyHLK4uMOWYz9eCH0a7CBzwe5CeE
         W6VKMdJRTmUv/UfALo4M2xYznqa0Q43M6j8L+n6PI/Ekf0idxSRCM/k8TxeZjQUYdn
         khMy364pAkjC6EJ6jmU6gXD0fydB7lGXHPxLYMdY=
Date:   Wed, 20 Apr 2022 00:01:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com, linux-hwmon@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
Message-ID: <Yl8jF1KLzP6YO6t+@pendragon.ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
 <d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca>
 <3a4fad80-b16a-3780-a0f7-41dd6c80689e@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a4fad80-b16a-3780-a0f7-41dd6c80689e@roeck-us.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 19, 2022 at 12:28:06PM -0700, Guenter Roeck wrote:
> On 4/19/22 11:24, Nicolas Dufresne wrote:
> > Hi,
> > 
> > adding linux-hwmon in CC for a wider feedback.
> > 
> > Le vendredi 15 avril 2022 à 13:18 +0200, Benjamin Mugnier a écrit :
> >> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
> >> celsius as a volatile and read-only control, and its documentation.
> >> Useful to monitor thermals from v4l controls for sensors that support
> >> this.
> > 
> > Any justification to expose a temperature sensor outside of the dedicated kernel
> > API hwmon ? I know if may makes it harder to use, as the sensor isn't bound to
> > the camera driver, and also the sensor may not work if the camera is not
> > streaming. But in the end, the API in hwmon does not look that complex, and is
> > perhaps more precise ?
> > 
> > All in all, I think we need a strong justification to implement a custom
> > thermometer interface, something described here and documented with care to
> > prevent abuse. I would also see opinion from folks outside of the linux-media,
> > hence why I have CCed hwmon mailing list.
> 
> All I can say is that this seems to be odd and a bit outside the scope of
> v4l2. I would have expected the vgxy61 driver to register a hwmon device
> instead.

I don't have a definitive opinion yet, but as Nicolas raised the issue
by pushing towards hwmon, I'll offer counter-arguments for the sake of
it :-)

The temperature sensor in the imaging sensor is used to measure the die
temperature, in order to tune the noise and spectral response model of
the imaging sensor. It's thus not a generic-purpose temperature sensor.
If the feature were to be exposed through hwmon, userspace would need to
associate an hwmon device to the imaging sensor V4L2 subdev (we have a
way to do so through the MC API, it doesn't support hwmon at this point,
but I suppose it could be added). There are also various constraints
that tie the temperature reading to the imaging side, it could be that
the temperature would only be readable while capturing frames. That's
probably possible to handle too but returning an error from the
temperature read.

Code-wise, both the driver and userspace would be more complex, for very
little practical gain (I don't dispute a theorical gain).

-- 
Regards,

Laurent Pinchart
