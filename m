Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E08BB4393A4
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 12:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbhJYK2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 06:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbhJYK1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 06:27:54 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE292C061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 03:25:31 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id exAUmLyYpUo2HexAWmI7RE; Mon, 25 Oct 2021 12:25:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635157529; bh=0OJN3y5PP3Jv7n42p6GtN0Z10UzkVVwnuXDlcEXKOB8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uxRF86T+vAnavei8Qwm5FFgNPN26pynLqf16/4yW4j03e51nLAqYuThU5kyuf7lTG
         TvXffZLZB7HXbHlem4eyirxNxYI4bJuxJcFgKAYWgc0y22aFOHiLPQJzt87FKAhJE4
         m/Wp8bBEnHkN+rH7P403pkMaSFnArbKE5Z3Jb6X01gp4keYgFX2UjBXpdbjlF7H4CQ
         zyJA96tjZVWlPAerENJw9pmVRMbdbm2bgM8WDKdmXZ106kL5Q5OHLOQ5Ln9kS/sJuy
         1zEkVmrbIhulYyQX++u1hDLqc1tghTHQVVugVL63FcfWbGceHScYFKHPv6wb7FFsWj
         937JdHvkubf8w==
Subject: Re: Userspace API for controlling the focus of the Surface Go [2]
 main/back-camera
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
References: <c7c94544-8af4-ad29-04ef-6131774e68b8@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e6a098ad-5155-b51c-74dd-f467c574efe0@xs4all.nl>
Date:   Mon, 25 Oct 2021 12:25:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c7c94544-8af4-ad29-04ef-6131774e68b8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMlHhv6KPET7P5D1Ss8BmgRQob3Yz1u0IkfRx7Nwsm//sHKbysim7pXs7viN7f0e5m1UC2dTePTP1BGECJGkA88xlbLM5fbdBboofr3jGB2wqmdr9W6i
 8FeUulQWuTL+kwkxyH9mLOHPYiD6YDHAq/I99hniTFkwWlRYQ7JvNRKleBH+wco/pMXYkHDzlFUDOY+oYPkgMpa7EoQRH947UU7yubso/5iTrfgH5YztMxLT
 /EbirVRewwTYcAcaOPFPGETAqaINtlaeCOVZ6f1E3fL5aO+XMzOu80CLGowBdgf/Bu+iNR7TIdOVssRyXfo5OZTaFhnU5Byoh8K0Z9RQUvM+arfQe+HvrZO3
 rNOE1VZnAzr60MTE0uEgtMNUlIcl1K1E3S6lOUUvWTtgx/BWiaUc+52H5NmmJqloMkTmZ/FrPtw5A5QnjQSJngoXOcCdpVSFW409QiyPYKzRUHiQGA4q3v43
 ywR4Xu0lnfEKta8tl/QYKZSe2XDpWz94FOrI8sLBUjQyhxlurL6u327mFBQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/10/2021 12:06, Hans de Goede wrote:
> Hi All,
> 
> With my (and Dan's) kernel patch-series to enable the back camera on
> the Surface Go shaping up (and hopefully going upstream soon),
> the next step is to enable control of the focus lens for the back
> camera.
> 
> The focus is controlled through a separate i2c-client which is
> described by a 2nd I2cSerialBusV2 resource entry in the ACPI
> device for the ov8865 sensor. By default the kernel only instantiates
> an i2c-client for the first I2cSerialBusV2 resource entry for an
> ACPI device, getting an i2c-client for the 2nd one is easy and
> out of scope for this discussion.
> 
> The question which I have is, assuming we have the 2nd i2c-client
> instantiated and we have a i2c-driver binding to it, how do we
> represent the focus control to userspace.
> 
> I see 2 possible directions we can go here:
> 
> 1. Somehow inject an extra v4l2ctrl for this into the v4l2ctrl
> list of the sensor. AFAIK we don't have infra for this atm, but
> we could add some generic mechanism to do this to the v4l2-ctrls
> core. IMHO from a userspace pov this is the cleanest, but at the
> cost of some extra work / possible ugliness on the kernel side.
> 
> 2. Register a separate v4l2_subdev for the focus-ctrl and in
> some way provide information to userspace to which sensor this
> belongs.
> 
> I believe that both are valid approaches. So before diving into
> this I wonder what others are thinking about this.
> 
> Specific questions:
> 
> 1. Hans Verkuil, what do you think about adding
> support for another driver to inject ctrls into the ctrl
> list of another v4l2(sub)dev ? Maybe something like this
> already exists ? If not do you think this is feasible
> and desirable to add ?
> 
> 2. If we go with a separate v4l2_subdev, how do we communicate
> to which sensor the focus-control belongs to userspace ?

What is the bridge driver that controls the sensor? I would need to
know a bit more about the architecture.

Is it MC-centric? Or is everything controlled through a video device?

In the latter case you want the video device to inherit the controls of
the sensor and the focus sub-devices, that's supported by the control
framework.

In the MC-centric case you probably want to have libcamera support that
can tie the focus subdev and the sensor subdev together.

v4l2_async_nf_parse_fwnode_sensor() supports linking LEDs or lens-focus
devices together with the sensor, so that's how a focus device can be
associated with a sensor at the ACPI/DT level. So support for 2) is
already available. A separate subdev is in my view certainly the correct
approach.

Regards,

	Hans
