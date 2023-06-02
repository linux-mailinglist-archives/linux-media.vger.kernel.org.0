Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1280471FB66
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 09:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbjFBHyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 03:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbjFBHyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 03:54:41 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5F0123
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 00:54:39 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-568928af8f5so28060077b3.1
        for <linux-media@vger.kernel.org>; Fri, 02 Jun 2023 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685692479; x=1688284479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4L0+8WIztOq/RD8wI+JtJlv8Oc62aW4Pjf+1VAl9aeI=;
        b=ogHJtaucak0hzisvS0AJfYi0UJHRKnPFdwoSFq+UKh5SYWExWLpI1eXiQSqpRkBn17
         PhidxzVFgfoKCFEL1WKU/aoSyljXQqaNJwGWRJrjlMK5pvz9/ymr3Loiavf7vEeWNOLc
         Lq08zXYQjF+3Aov3Z6+DuAjQQjdO9uoOJQoYalheKMANnhKUWdi+QAQXxUbueifLN8Bi
         WmG/n49B12/ksqoSv2yxrWkw8WuqSCZgMlB2VqZkK2YYmHiOSFU5cWa3QWHfiEk2cZen
         lnbh5c9H7p2y6ze0Yq87OT22j0OaiT3f1BLUyS5aBmEaOGBFPVlAC6ZCRh/G5/egYKwp
         9WPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685692479; x=1688284479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4L0+8WIztOq/RD8wI+JtJlv8Oc62aW4Pjf+1VAl9aeI=;
        b=BqjoTVvoBgH9cDVI6/50ScK3G3anVfUI7x5OIpszmRE+kvXCjS2MWGPS5kE4cHoD0C
         DMs7Bb11QkN60InN35ExO09zDG0whMPkzi+75dsfLU9uXdr8EWdlltJ1PaRTY90EzDkz
         bjPNIqV3XLDnDt/EgfKAO+rU3SCI8lU8MaurLp4GaX9JrRFl1nicYdELuyu0y465RadF
         b6C5vIUi5O+Lx2359zyk7/LSv9fotazSRWQMsZ8ivH1s5bG3/8MjxsZMvv5fXDggFlbg
         3LnzknyqUynqSaV4VrPIaOGRP6uOgAi3f7vyCVmpZdKJuSDQeZJt8H5PFpMkp18OuWyO
         BFyA==
X-Gm-Message-State: AC+VfDyWtex4SjKOLhIOyRu161CWXKlJFEMba1jGAmE6H0bXM3Vw4tmE
        VkpLyE7Z1QsQrbfhP8D8PdJQuDuKn4MW+VNgJlFeJw==
X-Google-Smtp-Source: ACHHUZ6SC1DdxdLpSx9p/enaKBen9GzgSe81ZOWHE3MZ/x1Wekal8ydnFFXKtag+IzW2riaGxQVl4HZJKgSqs4Ctj0g=
X-Received: by 2002:a0d:d54d:0:b0:55d:811f:6003 with SMTP id
 x74-20020a0dd54d000000b0055d811f6003mr4435452ywd.14.1685692478946; Fri, 02
 Jun 2023 00:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
From:   Naushir Patuck <naush@raspberrypi.com>
Date:   Fri, 2 Jun 2023 08:54:35 +0100
Message-ID: <CAEmqJPp_3e248mKRMK2fY2vwQi=HzqCsP6zTyWfOXFYbOFC0_Q@mail.gmail.com>
Subject: Re: [RFC 0/7] Generic line based metadata support, internal pads
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for working on this.  Sensor metadata is something that Raspberry Pi
do make extensive use of, and our downstream changes to support it, although a
bit hacky, are not too dissimilar to your proposal here.

On Fri, 5 May 2023 at 22:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi folks,
>
> Here are a few patches to add support generic, line based metadata as well
> as internal source pads. While the amount of code is not very large, to
> the contrary it is quite small actually IMO, I presume what this is about
> and why it is being proposed requires some explaining.
>
> Metadata mbus codes and formats have existed for some time in V4L2. They
> however have been only used by drivers that produce the data itself and
> effectively this metadata has always been statistics of some sort (at
> least when it comes to ISPs). What is different here is that we intend to
> add support for metadata originating from camera sensors.
>
> Camera sensors produce different kinds of metadata, embedded data (usually
> register address--value pairs used to capture the frame, in a more or less
> sensor specific format), histograms (in a very sensor specific format),
> dark pixels etc. The number of these formats is probably going to be about
> as large as image data formats if not larger, as the image data formats
> are much better standardised but a smaller subset of them will be
> supported by V4L2, at least initially but possibly much more in the long
> run.
>
> Having this many device specific formats would be a major problem for all
> the other drivers along that pipeline (not to mention the users of those
> drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
> receiver drivers that have DMA: the poor driver developer would not only
> need to know camera sensor specific formats but to choose the specific
> packing of that format suitable for the DMA used by the hardware. It is
> unlikely many of these would ever get tested while being present on the
> driver API. Also adding new sensors with new embedded data formats would
> involve updating all bridge and CSI-2 receiver drivers. I don't expect
> this to be a workable approach.
>
> Instead what I'm proposing is to use specific metadata formats on the
> sensor devices only, on internal pads (more about those soon) of the
> sensors, only visible in the UAPI, and then generic mbus formats along the
> pipeline and finally generic V4L2 metadata formats on the DMAs (specific
> to bit depth and packing). This would unsnarl the two, defining what data
> there is (specific mbus code) and how that is transported and packed
> (generic mbus codes and V4L2 formats).
>
> The user space would be required to "know" the path of that data from the
> sensor's internal pad to the V4L2 video node. I do not see this as these
> devices require at least some knowledge of the pipeline, i.e. hardware at
> hand. Separating what the data means and how it is packed may even be
> beneficial: it allows separating code that interprets the data (sensor
> internal mbus code) from the code that accesses it (packing).
>
> These formats are in practice line based, meaning that there may be
> padding at the end of the line, depending on the bus as well as the DMA.
> If non-line based formats are needed, it is always possible to set the
> "height" field to 1.

One thing that may be worth considering or clarifying - for the case of the
BCM2835 Unicam CSI-2 device, we only have 2x DMA output channels.  So one will
match image data packets, and the other will match "everything else".  Typically
"everything else" would only be CSI-2 embedded data, but in the case of the
Raspberry Pi Camera v3 (IMX708), it includes embedded data, PDAF data, and
HDR histogram data.  Each of these outputs can be programmed to use a different
packet ID in the sensor, but since Unicam only has a single DMA for "everything
else", it all gets dumped into one metadata buffer.  But given we know the exact
structure of the data streams, it's trivial for useland to find the right bits
in this buffer.  Of course, other CSI-2 receivers with more DMA channels might
allow these streams to end up in their own buffers.

Nothing in your series seems to stop us operating Unicam in this way,
particularly because there is no fixed definition of the data format for
V4L2_META_FMT_GENERIC_8. So I don't think it's a problem, but perhaps it's worth
documenting that the metadata might include multiple streams from the sensor?

Regards,
Naush

>
> The internal (source) pads are an alternative to source routes [1]. The
> source routes were not universally liked and I do have to say I like
> re-using existing interface concepts (pads and everything you can do with
> pads, including access format, selections etc.) wherever it makes sense,
> instead of duplicating functionality.
>
> Effectively internal source pads behave mostly just like sink pads, but
> they describe a flow of data that originates from a sub-device instead of
> arriving to a sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable
> and disable routes from internal source pads to sub-device's source pads.
> The subdev format IOCTLs are usable, too, so one can find which subdev
> format is available on given internal source pad.
>
> This set depends on these patches:
>
> <URL:https://lore.kernel.org/linux-media/20230505205416.55002-1-sakari.ailus@linux.intel.com/T/#t>
>
> I've also pushed these here and I'll keep updating the branch:
>
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>
>
> Questions and comments are most welcome.
>
>
> [1] <URL:https://lore.kernel.org/linux-media/20220831141357.1396081-20-tomi.valkeinen@ideasonboard.com/>
>
> Sakari Ailus (7):
>   media: mc: Add INTERNAL_SOURCE pad type flag
>   media: v4l: subdev: Support INTERNAL_SOURCE pads in routing IOCTLs
>   media: uapi: v4l: Document source routes
>   media: mc: Check pad flag validity
>   media: uapi: Add generic serial metadata mbus formats
>   media: uapi: Add generic 8-bit metadata format definitions
>   media: v4l: Support line-based metadata capture
>
>  .../media/mediactl/media-types.rst            |   7 +
>  .../userspace-api/media/v4l/dev-meta.rst      |  15 +
>  .../userspace-api/media/v4l/dev-subdev.rst    |  18 +
>  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
>  .../media/v4l/metafmt-generic.rst             | 317 ++++++++++++++++++
>  .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++
>  .../media/v4l/vidioc-enum-fmt.rst             |   7 +
>  .../media/v4l/vidioc-subdev-g-routing.rst     |   5 +
>  drivers/media/mc/mc-entity.c                  |  20 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   8 +
>  drivers/media/v4l2-core/v4l2-subdev.c         |   6 +-
>  include/uapi/linux/media-bus-format.h         |   9 +
>  include/uapi/linux/media.h                    |   1 +
>  include/uapi/linux/v4l2-subdev.h              |   6 +-
>  include/uapi/linux/videodev2.h                |  19 ++
>  15 files changed, 691 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
>
> --
> 2.30.2
>
