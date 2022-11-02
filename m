Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91818615D72
	for <lists+linux-media@lfdr.de>; Wed,  2 Nov 2022 09:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiKBIP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Nov 2022 04:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbiKBIPt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Nov 2022 04:15:49 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5BC1FCD9
        for <linux-media@vger.kernel.org>; Wed,  2 Nov 2022 01:15:47 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2825E24000B;
        Wed,  2 Nov 2022 08:15:45 +0000 (UTC)
Date:   Wed, 2 Nov 2022 09:15:43 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     claus.stovgaard@gmail.com
Cc:     linux-media@vger.kernel.org
Subject: Re: VIDIOC_QUERYCAP on v4l subdevice - v4l-subdev*
Message-ID: <20221102081543.hbtgmdkpdw5valvr@uno.localdomain>
References: <93834b3d7d4abfabdc7285af0c5e57d015c97107.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93834b3d7d4abfabdc7285af0c5e57d015c97107.camel@gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Claus,

On Tue, Nov 01, 2022 at 01:50:16PM +0100, claus.stovgaard@gmail.com wrote:
> Hi Folks.
>
> I am working on a system based around the Intel Apollo Lake with an
> IPU4. The system is having a configuration with a number of subdevices.
> Going from v4l-subdev0 to v4-subdev10.

I premit that as far as I know IPU4 is not supported by mainline
linux-media, the community that runs this mailing list. Your system is
likely working with vendor provided drivers, hence the level of
support you can get here might be limited by the fact you're running
vendor's code which is not upstreamed and which we don't know much
about.

>
> Running gst-device-monitor-1.0 results in a number of errors like.
>
> GStreamer-CRITICAL **: 13:27:36.763:
> gst_element_message_full_with_details: assertion 'GST_IS_ELEMENT
> (element)' failed
>
> The reason is because a VIDIOC_QUERYCAP on the subdevice fails.
>
> Looking at the documentation
>
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-querycap.html
>
> it states that "All V4L2 devices support the VIDIOC_QUERYCAP ioctl"
>
> On the other hand VIDIOC_QUERYCAP is not part of the subset mentioned
> in documentation for V4L2 sub-device.
>
> https://www.kernel.org/doc/html/latest/driver-api/media/v4l2-subdev.html
>
> So is I correct that gstreamer has a bug in gst-device-monitor-1.0, and
> it should not try to use the VIDIOC_QUERYCAP ioctl for a sub-device?
>

Please provide a strace or a more complete log of the failure to help
confirming what the actual issue is.

You're however correct that VIDIOC_QUERYCAP does not apply to
subdevices as subdevices implement VIDIOC_SUBDEV_QUERYCAP
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-subdev-querycap.html

Now, the IPU4 is a complex camera system, which exposes many
subdevices and cannot be operated by simply controlling only
/dev/video0 as a simpler webcam does.

As far as I know gstreamer does not know how to handle the subdevices
configuration and media graph linking. Could you please post the
output of 'media-ctl -p' to show how many subdevs your pipeline is
composed of ?

For mainline/upstream systems, libcamera is the library that handles
the configuration of complex camera systems. It provides a gstreamer
element as a replacement of the v4l2src element, and configures the
media pipeline on behalf of applications. libcamera supports IPU3 but
not IPU4 as there's no upstream driver support for these systems. I
would guess that your vendor provides tools for you to operate the
camera with their drivers infrastructure ?

> It could be that gstreamer should just skip the sub-device.

That I can't tell, but if you're not running some vendor specific
gstreamer element I'm afraid it's quite unlikely things will work for
you. Maybe, as you're not using gstreamer for capturing yet but only the
device monitor, the device monitor is meant to be working regardless
of the complex/non-complex camera you're operating. I suggest to check
with the gstreamer community about that.

Thanks
  j

>
> Regards
> Claus Stovgaard
>
