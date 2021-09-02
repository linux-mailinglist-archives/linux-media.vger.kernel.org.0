Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187963FF065
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 17:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345837AbhIBPoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 11:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbhIBPoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 11:44:06 -0400
X-Greylist: delayed 1981 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Sep 2021 08:43:07 PDT
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0273C061575;
        Thu,  2 Sep 2021 08:43:07 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LornmkZP0lQKhLoromL1fI; Thu, 02 Sep 2021 17:43:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630597385; bh=RdEDT9De+c2SJiFCO546DdAMH0JUYanjgVAtRXnsSRs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QzJjafrf1lKL2ZX+C52DeIq5PNq/Vck4L2sNS7ldYopqMH6wotqLszgx1YRkHW9qp
         4gx6VfwAktgCsk7nzaNwGz4wdhfDCSKoyayyvZBquYZxEsWwVIK0pEsNS2IkIB2VH0
         ZURA2lIeBTjhm8moCEivcvqRDNMGunlV0ULm2f+GoHnqO8yclWL++EdPqcCvm6UxVS
         9hdWNnkC18uAVgN31/5mq4MJIYmOZvmi5DfMVOPd5lrDFId94oSeuSTDNMtO/vQ94E
         t95guzAP0DQi5MAG9KY9O/RQj6Yq/ZQ4swY/IiiF1bXmXGreWhSu5dNW35dPyy1j38
         PhQ4imWi5rDug==
Subject: Re: [RFC PATCH 0/2] Add the stateless AV1 uAPI and the VIVPU virtual
 driver to showcase it.
To:     daniel.almeida@collabora.com, stevecho@google.com,
        shawnku@google.com, tzungbi@google.com, mcasas@google.com,
        nhebert@google.com, abodenha@google.com, randy.wu@mediatek.com,
        yunfei.dong@mediatek.com, gustavo.padovan@collabora.com,
        andrzej.pietrasiewicz@collabora.com, enric.balletbo@collabora.com,
        ezequiel@collabora.com, nicolas.dufresne@collabora.com,
        tomeu.vizoso@collabora.com, nick.milner@collabora.com,
        xiaoyong.lu@mediatek.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20210810220552.298140-1-daniel.almeida@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1955f891-8c95-e1a1-dfa7-ba176302c70a@xs4all.nl>
Date:   Thu, 2 Sep 2021 17:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210810220552.298140-1-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEroQX5m2a3b0oAQnY8WOymcqI+wXsIydnvcGa5BFVku2tTkdZPN3l8gP25w1MrYaKizrjPmvq7ZRwdieJTAB/sTbHeKnEVH0ABWkQAM9vKkl/SKfRXw
 0SjLtJDlPe7jrKlElqP/QSNP6z2U4EIBR0IYsfmmPP66jOL81pibuqe+iWON67mPsrCTZufyQq6ZFJwHhF1J9r0VR+JCohtkzH4bXhn9AkZzxXlbl1c0Y5ZG
 sK2aXf/oFlm6cpBSit3AKP5LBlYrqSqEKCyNMzrmvWunX3D92zRCqZ/7JU4OACZtK8rK+wouOv5bkwHk1JMr0GCfdAZoiPv38hxK+sF5LdKgYaNJwSfmtX7K
 Vb9urR/fD/qGKJp7uKFoxlDHhArIGVKwY+aDuFbIckayNyY0tLW+h7dJmW7Y08zMOOC62u3/Pj8O7F9otF/GAP6bhMYvAQ9deCyE4evLv0NEzLvGXQ5arXfc
 94LL9sl8k6iEAjzgu6NIwxAAGViNy0mxp2EziFsi9K+6wbR2LGZns6H2VnlQuRbzWPCMTlKW4md3cnX2UhmVJ+fXiKVPT0uo/FfHWXD60o89tzNFw5gM+x3M
 kwJEVgCAYhjKW/5S+rD4gMylt1rr7IAnx7sfkCvxM9cAcjBjpFIhhq31R8Lj/MYNEVug7GDxyL4cFK9u4Vti1hc0LeOSRGzf/cUCBKz+8n61mFUhVopvaZeM
 rK0CJBxmTQABCoL2yjLz92rYPtSl8ZqlCQ7x8hENERkkBdDDzd8wBDN72stkS7yTMaOUUutT8CgEBj13CYJ1zeHwBCFpMYhDgAbhXnViqYqAOTgkO1IwyDHp
 wsjql1yMW7dt4HrtdUBaBKHz1q03Tku59t3u6f7kn6fNjXc1CYuxj9+sr10fzg9+MguqYC00ev3CP78hoFkUSQM/y2HQ5ZfVWEUjulWinN4BfWOiqnJZzarP
 i7unm7nrYUQ9rXHBZdWy8RBKz+8iImOaB8s2VKJNH7QYvIa/eLaudkgpJI3zov/+dOSGoGRTZslVvbqPp3hBhPJCrhM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/08/2021 00:05, daniel.almeida@collabora.com wrote:
> From: Daniel Almeida <daniel.almeida@collabora.com>
> 
> Dear all,
> 
> This patchset adds the stateless AV1 uAPI and the VIVPU virtual driver to
> showcase it.
> 
> Note that this patch depends on dynamically allocated control arrays, i.e. [0]
> and [1], which are part of the following series[2].
> 
> This cover letter will discuss the AV1 OBUs and their relationship with the
> V4L2 controls proposed therein. The VIVPU test driver will also be discussed.
> 
> Note that I have also written a GStreamer decoder element [3] to interface with
> the VIVPU virtual driver through the proposed control interface to ensure that
> these three pieces actually work. The MR in gst-plugins-bad is marked as "Draft"
> only because the uAPI hasn't been merged yet and there's no real hardware to
> test it.
> 
> Padding and holes have not been taken into account yet.
> 
> 
> 
> Relevant AV1 Open Bitstream Units (OBUs):
> -----------------------------------------
> 
> AV1 is packetized into a syntax element known as OBU, which stands for Open
> Bitstream Units. There are seven different types of OBUs defined in the AV1
> specification, of which five are of interest for the purposes of this API, they
> are:
> 
> Sequence Header OBU: Contains information that applies to the entire sequence.
> Most importantly, it contains a set of flags that signal which AV1 features are
> enabled for the entire video coded sequence. The sequence header OBU also
> encodes the sequence profile.
> 
> Frame Header OBU: Contains information that applies to an entire frame. Notably,
> this OBU will dictate the frame's dimensions, its frame type, quantization,
> segmentation and filter parameters as well as the set of reference frames needed
> to effect a decoding operation. A set of flags will signal whether some AV1
> features are enabled for a particular frame.
> 
> Tile Group OBU: Contains tiling information. Tile groups contain the tile data
> associated with a frame. Tiles are subdivisions of a picture that can be
> independently decoded, optionally in parallel. The entire frame is assembled
> from all the tiles after potential loop filtering.
> 
> Frame OBU: Shorthand for a frame header OBU plus a tile group OBU but with less
> overhead. Frame OBUs are a convenience for the common case in which a frame
> header is combined with tiling information.
> 
> Tile List OBU: Similar to a tile group OBU, but used in "Large Scale
> Tile Decoding Mode". The tiling information contained in this OBU has an
> additional header that allows the decoder to process a subset of tiles and
> display the corresponding part of the image without having to fully decode all
> the tiles for a frame.
> 
> 
> 
> AV1 uAPI V4L2 CIDs:
> -------------------
> 
> V4L2_CID_STATELESS_AV1_SEQUENCE: represents a Sequence Header OBU. This control
> should only be set once per Sequence Header OBU. The "flags" member contains a
> bitfield with the set of flags for the current video coded sequence as parsed
> from the bitstream.
> 
> V4L2_CID_STATELESS_AV1_FRAME_HEADER: represents a Frame Header OBU. This control
> should be set once per frame.
> 
> V4L2_CID_STATELESS_AV1_{TILE_GROUP|TILE_GROUP_ENTRY}: represents a Tile Group
> OBU or the tiling information within a Frame OBU. These controls contain an
> array of metadata to decode the tiles associated with a frame. Both controls
> depend on V4L2_CTRL_FLAG_DYNAMIC_ARRAY and drivers will be able to index into
> the array using ctrl->p_cur.p_av1_tile_group and
> ctrl->p_cur.p_av1_tile_group_entry as base pointers respectively. Frame OBUs
> should be split into their Frame Header OBU and Tile Group OBU constituents
> before the array entries can be set and there should be a maximum of 512 tile
> group entries as per the AV1 specification. In the event that more than one tile
> group is provided, drivers can disambiguate their corresponding entries in the
> ctrl->p_cur.p_av1_tile_group_entry array by taking note of the tg_start and
> tg_end fields.
> 
> V4L2_CID_STATELESS_AV1_{TILE_LIST|TILE_LIST_ENTRY}: represents a Tile List OBU.
> These controls contain an array of metadata to decode a list of tiles associated
> with a frame when the decoder is operating under "Large Scale Tile Decoding
> Mode". Both controls depend on V4L2_CTRL_FLAG_DYNAMIC_ARRAY, and drivers will be
> able index into the array using ctrl->p_cur.p_av1_tile_list and
> ctrl->p_cur.p_av1_tile_list_entry as base pointers respectively. In the event
> that more than one list is provided, drivers can disambiguate their
> corresponding entries in the ctrl->p_cur.p_av1_tile_list_entry array by taking
> note of the tile_count_minus_1 field.

It's a bit hard to tell for non-AV1 experts how these tile controls relate to
one another.

This is my understanding:

Without tiling only a V4L2_CID_STATELESS_AV1_FRAME_HEADER is needed.

With tiling you need a V4L2_CID_STATELESS_AV1_FRAME_HEADER and
V4L2_CID_STATELESS_AV1_{TILE_GROUP|TILE_GROUP_ENTRY} arrays.

With 'Large Scale Tile Decoding' you need a V4L2_CID_STATELESS_AV1_FRAME_HEADER
and V4L2_CID_STATELESS_AV1_{TILE_LIST|TILE_LIST_ENTRY} arrays (I think). It's
not clear to me if these TILE_LISTs replace TILE_GROUPs or add to them. If it
is the latter, then the V4L2_CID_STATELESS_AV1_{TILE_GROUP|TILE_GROUP_ENTRY}
arrays also need to be set for each frame.

In any case, this should probably be clarified in the documentation as well.

Regards,

	Hans

> 
> V4L2_CID_STATELESS_AV1_PROFILE: this control lets the driver convey the
> supported profiles to userspace.
> 
> V4L2_CID_STATELESS_AV1_LEVEL: this control lets the driver convey the supported
> AV1 levels to userspace.
> 
> V4L2_CTRL_AV1_OPERATING_MODE: this control lets the driver convey the supported
> operating modes to userspace. Conversely, userspace apps can change the value of
> this control to switch between "general decoding" and "large scale tile
> decoding". As per the AV1 specification, under *general decoding mode* the
> driver should expect the input to be a sequence of OBUs and the output to be a
> decoded frame, whereas under *large scale tile decoding mode* the driver should
> expect the input to be a tile list OBU plus additional side information and the
> output to be a decoded frame.
> 
> 
> 
> VIVPU:
> ------
> 
> This virtual driver was written as a way to showcase and test the control
> interface for AV1 as well as the GStreamer decoder[3]. This is so we can detect
> bugs at an early stage before real hardware is available. VIVPU does not attempt
> to decode video at all.
> 
> Once VIVPU is loaded, one can run the following GStreamer pipeline successfully:
> 
> gst-launch-1.0 filesrc location=<path to some sample av1 file> ! parsebin !  v4l2slav1dec ! fakevideosink
> 
> This is provided that the patches in [3] have been applied and the v4l2codecs
> gstreamer plugin is compiled.
> 
> It is also possible to print the controls' contents to the console by setting
> vivpu_debug to 1. This is handy when debugging, even more so when one is
> comparing two different userspace implementations because it makes it easier to
> diff the controls that were passed to the kernel.
> 
> [0] https://patchwork.linuxtv.org/project/linux-media/patch/20210610113615.785359-2-hverkuil-cisco@xs4all.nl/
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/patch/20210610113615.785359-3-hverkuil-cisco@xs4all.nl/
> 
> [2] https://patchwork.linuxtv.org/project/linux-media/list/?series=5647
> 
> [3] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/2305
> 
> Daniel Almeida (2):
>   media: Add AV1 uAPI
>   media: vivpu: add virtual VPU driver
> 
>  .../userspace-api/media/v4l/biblio.rst        |   10 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 1268 +++++++++++++++++
>  .../media/v4l/pixfmt-compressed.rst           |   21 +
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   36 +
>  .../media/v4l/vidioc-queryctrl.rst            |   54 +
>  .../media/videodev2.h.rst.exceptions          |    9 +
>  drivers/media/test-drivers/Kconfig            |    1 +
>  drivers/media/test-drivers/Makefile           |    1 +
>  drivers/media/test-drivers/vivpu/Kconfig      |   16 +
>  drivers/media/test-drivers/vivpu/Makefile     |    4 +
>  drivers/media/test-drivers/vivpu/vivpu-core.c |  418 ++++++
>  drivers/media/test-drivers/vivpu/vivpu-dec.c  |  491 +++++++
>  drivers/media/test-drivers/vivpu/vivpu-dec.h  |   61 +
>  .../media/test-drivers/vivpu/vivpu-video.c    |  599 ++++++++
>  .../media/test-drivers/vivpu/vivpu-video.h    |   46 +
>  drivers/media/test-drivers/vivpu/vivpu.h      |  119 ++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  286 +++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   79 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  include/media/v4l2-ctrls.h                    |   12 +
>  include/uapi/linux/v4l2-controls.h            |  796 +++++++++++
>  include/uapi/linux/videodev2.h                |   15 +
>  22 files changed, 4342 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/test-drivers/vivpu/Kconfig
>  create mode 100644 drivers/media/test-drivers/vivpu/Makefile
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-core.c
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-dec.c
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-dec.h
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-video.c
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-video.h
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu.h
> 

