Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 631E4508DC4
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 18:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380778AbiDTQya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 12:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241525AbiDTQy3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 12:54:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAE03E5C4;
        Wed, 20 Apr 2022 09:51:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69A1B25B;
        Wed, 20 Apr 2022 18:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650473500;
        bh=iIo4wLto1vt5xoR+vGrIeQIO5gQyyzd0m3pIes+f0P8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kuWG1e3EhoCr5f8oYRJIveR56YEojMLFSq8leqiLfDLJDfrpbdcdRZdVjnxvVCXtZ
         Cq0rHLkM/95EmxlsrfKHHxOw+iWY8+mE2ZVGDMlG5QeNWiimdjpmJ6ndcoJGEOnk0i
         Dl99SQywbYmvNQO8Xkz+kEn7XRAYXd2cM/jJh7yA=
Date:   Wed, 20 Apr 2022 19:51:41 +0300
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
Message-ID: <YmA6HbHybCkhTYFH@pendragon.ideasonboard.com>
References: <d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca>
 <3a4fad80-b16a-3780-a0f7-41dd6c80689e@roeck-us.net>
 <Yl8jF1KLzP6YO6t+@pendragon.ideasonboard.com>
 <1c700e5b-5bf2-f0eb-78f3-12290fd88234@roeck-us.net>
 <dec71c79-3141-8dcf-6d37-8495f4b7c7e9@foss.st.com>
 <YmAI3QVSPMq3mR7E@pendragon.ideasonboard.com>
 <76789333-bb0b-fcc2-6ba9-ab01c9aab62a@roeck-us.net>
 <YmAXd5F2Rm/VDIb5@pendragon.ideasonboard.com>
 <8b8aa915-d08c-9cc6-fc01-2f062a79b078@foss.st.com>
 <57bb64db-9273-0e52-cf6d-0c7ff172ddde@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <57bb64db-9273-0e52-cf6d-0c7ff172ddde@roeck-us.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 20, 2022 at 09:19:53AM -0700, Guenter Roeck wrote:
> On 4/20/22 08:19, Benjamin Mugnier wrote:
> [ ... ]
> >>
> >> It's the two most common use cases for imaging sensor temperature
> >> measurements that I know of. My question to Benjamin is if he has the
> >> same and/or other use cases.
> >>
> > 
> > Just like you said in a previous mail. This temperature sensor can
> > be used to implement a retroactive loop from the host according to
> > its value, such as noise correction for instance.
> > We don't have anything in the Linux user space that implements this
> > yet, this was in anticipation.
> > So dropping it is fine, I will come back to it if need be ;)
> 
> When you implement this in userspace, you might want to consider situations
> where the temperature is _not_ reported via media controls (which might
> at least in theory happen if the temperature sensor is not part of the
> v4l device), or for existing drivers with hwmon support
> (drivers/media/i2c/video-i2c.c comes into mind).

That's a good point. I wouldn't expect external temperature sensors to
be very useful for this use case though, as what we really need is the
temperature of the camera sensor die.

-- 
Regards,

Laurent Pinchart
