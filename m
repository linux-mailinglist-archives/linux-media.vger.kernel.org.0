Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F029C729C13
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 15:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237713AbjFIN7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 09:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236066AbjFIN7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 09:59:40 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B183580
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 06:59:37 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-43ddbfd7479so298476137.2
        for <linux-media@vger.kernel.org>; Fri, 09 Jun 2023 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1686319177; x=1688911177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8crb0pgY06FJU+78Mqov3nBds4PRTFXBmRZWwpdg4ig=;
        b=p6I+qL/bhSsw7mfHJMx5uTF/6wrYbPXSR67OTZv0ESGWvl5CRYKVsHyzuLo83m1W3e
         t1yAkYRyVWohyLAzEHgxLHyFuz8NuzP1m0eXqWmZFob6/KN6xLVx1w8IjpvGvBMc81vm
         oEAt+JrFp9+BSqED+XN4jSbJz78R1cQ9lBHfgnm/G7+KUsL2wm23qRZY/jgDdpYHYpCM
         p4wO6Q1Pi4m6N53zrHb1Xq5qP4njnY3xu5mKqXHGRrPhtFC9vKedPxKze4cGDYkiXF49
         ykl9DI0M3V2gLV1PGK6XagIS0CHCIu3S2NmioGARJxATT5jzU63bhTrpqR1D/xHW4Itl
         sGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319177; x=1688911177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8crb0pgY06FJU+78Mqov3nBds4PRTFXBmRZWwpdg4ig=;
        b=kxPzlVqk7muXnF+FkxZjC2+4MhmkSG/MXkWx8RjLKYsCc10JHYcjXRULFvONlOhYeU
         m64SuHqVoOtwlKvTEgrrq2ozVgP/kC544Vyx03H3rxhEuThS4gb4cETEaSpJzNt/w9SL
         XgEQ4G2qByZWiYRd9LDpk5Q1AD/iIP2Q9hqD4YfA/gbKuRYlJrddzzGy0x5WNB9NVP6/
         qpQqcvlGhjB97BDlWNgcO1ylUjHaU/qYZ767PLKWeWhbeoTX+e4MCt003W9HpBA4vs53
         ixrhGSBc0fSe03kkzPdXjmC+vfjvEdCtT/WDyvSUWAH1N1Wlleg2+XKOFPOjUnCMzCu4
         DAlw==
X-Gm-Message-State: AC+VfDw1O4XwxWIflv/PJXwoWyklQECjwrH5UKxwmcmNvLLOR/0m0fh6
        rUzJ5socNL7Wyb5pLkix+Ha52O9gYLm9T4m1sfHCIj4kwpeCwxz/ofc=
X-Google-Smtp-Source: ACHHUZ4MHDPOV5wBZD8Y07oqGvQqPHR8aOSf3ru1tdxNYNspy0xqf0Drnj11l4Uwk6wyjEQC2Q1W6XDsloUr9scKMpI=
X-Received: by 2002:a67:f9c6:0:b0:436:4c8f:6684 with SMTP id
 c6-20020a67f9c6000000b004364c8f6684mr463861vsq.27.1686319176809; Fri, 09 Jun
 2023 06:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 9 Jun 2023 14:59:20 +0100
Message-ID: <CAPY8ntAQxojXVgaD9w8O41QEt6ZBdCB+dxNnnYwimnv6GMjgDQ@mail.gmail.com>
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

Hi Sakari

Sorry to be late to the party.

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

Just to confirm my own understanding, the muxed streams API currently
copes with situations such as the FPD-Link devices combining a single
stream from each of a number of subdevs into one multiplexed stream
using virtual channels, but it doesn't handle multiple data types from
the same subdev. You're addressing that omission.

All seems reasonable.

One detail that I haven't seen covered and think ought to be clarified.
For raw sensors where you have image data and metadata, in my
experience the line width of that metadata and the packing format
(8/10/12/14/16/20/24 bit) are all dictated by the image data
configuration. You can't have eg 640 pixel wide _SBGGR10_1X10 image
data and 320 pixel wide _META_1X8_8 metadata. (it has to be 640 pixel
wide _META_1X10_10)

Which layer would be responsible for validating the configuration, and when?
a) The driver validates in set_stream, and fails if mismatched. That
potentially results in lots of duplication between drivers.
b) set_pad_format on the image pad updates the formats and widths of
the metadata pads automatically. Is there a way of notifying clients
that the formats on potentially unrelated pads has changed, or is it
something that just gets documented?
c) something else.

Either is workable, but IMHO it needs to be specified as to which is
the expected behaviour.

Thanks
  Dave

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
