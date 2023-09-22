Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D97F7AAF0D
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 12:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbjIVKDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 06:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjIVKC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 06:02:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2C98F;
        Fri, 22 Sep 2023 03:02:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9E0FBC4;
        Fri, 22 Sep 2023 12:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695376873;
        bh=7DJuGSBjgqiikfMDbfWTFQ2gWoEcSHou+PD8obXlPvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=geogg32EiSJMnuKItsszIHdWEaGHkXxAJTvifpUVeklKEb9otTUsWW/Xd3P/kBzWo
         iOTBbLFJdxyIe9fv2Xp5w/esJ6KI/LD2fHt3TVKtXuOcKKVbdU+1VigqqaKksxFzjl
         ouZ0JzvpT7Klf3pTe27QSZvvNQGoNnYa1Aex2mfs=
Date:   Fri, 22 Sep 2023 13:03:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Gordeev <alexander.gordeev@opensynergy.com>
Cc:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        acourbot@chromium.org, alexlau@chromium.org, daniel@ffwll.ch,
        dgreid@chromium.org, dstaessens@chromium.org, egranata@google.com,
        fziglio@redhat.com, hverkuil@xs4all.nl, keiichiw@chromium.org,
        kraxel@redhat.com, marcheu@chromium.org, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com, devicetree@vger.kernel.org,
        alex.bennee@linaro.org, aesteve@redhat.com,
        Matti.Moell@opensynergy.com, andrew.gazizov@opensynergy.com,
        daniel.almeida@collabora.com, cohuck@redhat.com,
        mwojtas@google.com, mst@redhat.com, peter.griffin@linaro.org,
        bag@semihalf.com, bgrzesik@google.com, hmazur@google.com,
        mikrawczyk@google.com, srosek@google.com
Subject: Re: Potential ways to describe virtio-video device capabilities
Message-ID: <20230922100303.GF19112@pendragon.ideasonboard.com>
References: <a9235fe7-7448-fa9f-ea52-fd27f4845bc4@opensynergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9235fe7-7448-fa9f-ea52-fd27f4845bc4@opensynergy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 22, 2023 at 07:07:34AM +0200, Alexander Gordeev wrote:
> Hi,
> 
> I'm working on updating virtio-video draft v8 spec [1] and the 
> virtio-video V4L2 driver [2]. One of the things, that I don't like in 
> the current spec draft is sharing the device's capabilities with the 
> guest VM. The main requirement is making these capabilities compatible 
> with V4L2.
> 
> These capabilities could be pretty complex, see [3] and [4]:
> 1. First there could be several coded video formats. Coded formats have 
> their specific sets of supported controls.
> 2. Then for each coded video formats there could be different sets of 
> raw video formats, that could be used in combination with the selected 
> encoded format for decoding/encoding.
> 3. Then for each combination of the coded and raw format there could be 
> different sets of supported resolutions.
> 4. (Optional) for each coded format, raw format and resolution there 
> could be different sets of supported frame rates/intervals.
> 
> In the future new formats, controls, flags, etc could be defined. Right 
> now there is a rather static structure, see section 5.20.7.3.1 
> (VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS) in [5]. It looks too inflexible.
> 
> The V4L2 approach with many different ioctl's and complex querying logic 
> doesn't fit well for virtio-video IMHO. syscall overhead is only a few 
> hundred nanoseconds, so doing tens or hundreds of them is bearable in 
> case of video. But a roundtrip over virtio may take hundreds of 
> microseconds even in the local case. We at OpenSynergy already have 
> setups where the real hardware is accessed over a network. Then it can 
> take a millisecond. People already seem to agree, that this amount of 
> overhead makes V4L2-style discovery process unbearable on a per stream 
> basis. So all the relevant data has to be obtained during the device 
> probing. This means, that in many cases there is a complex structure 
> with all the data on the device side, and we just need to move it to the 
> driver side. Moving it in one step seems easier to me and better because 
> of the latency. Boot time matters too sometimes.

No disagreement here. For what it's worth, I think V4L2 should also
evolve and get a way to query capabilities with a single (or a very
small number of) ioctl.

> One of the ideas is to replace the mentioned 
> VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command response with a standalone 
> Device Tree Blob. It looks the most promising to me right now. I guess, 
> it may sound crazy to many people, but actually it fits into one of the 
> device tree usage patterns outlined in [6]. This document is referenced 
> in the kernel device tree documentation, so I assume it is correct.

If we want to pass flexible structured data we need a binary format, and
DT provides a binary format. Whether it's the best option or not, I
don't know, but it doesn't seem too crazy to me.

> A simplified version could look like this, for example:
> 
> /dts-v1/;
> 
> / {
>      virtio-video {
>          compatible = "virtio,video";
> 
>          virtio,video-caps {
>              h264 {
>                  profiles-mask = <0x3ffff>;
>                  levels-mask = <0xfffff>;
>                  num-resources-range = <1 32>;
>                  buffer-size = <0x100000>;
>                  bitrates-range = <100000 10000000>;
> 
>                  yuv420 {
>                      plane-layout-mask = <0x3>;
>                      plane-align = <1>;
>                      stride-align-mask = <0x10>;
>                      widths-range-stepwise = <96 1920 8>;
>                      heights-range-stepwise = <96 1080 1>;
>                      num-resources-range = <4 50>;
>                  };
> 
>                  nv12 {
>                      /* ... */
>                  };
> 
>                  rgba {
>                      /* ... */
>                  };
>              };
> 
>              hevc {
>                  /* ... */
>              };
> 
>              vp8 {
>                  /* ... */
>              };
> 
>              vp9 {
>                  /* ... */
>              };
>          };
>      };
> };
> 
> Or maybe the resolutions could be defined separately and linked using 
> phandles to avoid duplication because they are going to depend on the 
> raw formats exclusively in most cases, I think.
> 
> There are many benefits IMO:
> 
> 1. Device tree can be used to describe arbitrary trees (and even 
> arbitrary graphs with phandles). The underlying data structure is 
> generic. It looks like it can fit very well here.
> 2. There is a specification of the format [7]. I hope it could be 
> referenced in the virtio spec, right?
> 3. There is already DTS, DTC, libfdt and DTB parsing code in Linux. All 
> of this can be reused. For example, at the moment we have a custom 
> configuration file format and a big chunk of code to handle it in our 
> virtio-video device. These could be replaced by DTS and calls to libfdt 
> completely, I think. There is also an implementation in Rust [8].

How does libfdt fare when it comes to ease of use and performance ?
License-wise it seems to be dual-licensed under the terms of the GPL v2
and BSD-2, so it should be fine.

> 4. I think the standalone DTB could be integrated into a board DTB later 
> reducing the amount of queries to zero. It is not going to make a big 
> difference in latency though.
> 
> If device trees are used, then we'll need add a binding/schema to the 
> kernel or to the dt-schema repo [9]. Maybe the schema could be 
> referenced in the virtio-video spec instead of duplicating it? This 
> would reduce the spec size.
> 
> I don't know if anybody has already done anything like this and I'm not 
> sure if the device tree maintainers and other involved parties would 
> approve it. That's why I'm starting this thread. Please share your 
> opinions about the idea.
> 
> An alternative to using device trees would be inventing something 
> similar and simpler (without phandles and strings) from scratch. That's 
> fine too, but doesn't allow to reuse the tooling and also is going to 
> make the virtio-video spec even bigger.
> 
> [1] https://lore.kernel.org/virtio-comment/20230629144915.597188-1-Alexander.Gordeev@opensynergy.com/
> [2] https://lore.kernel.org/linux-media/20200218202753.652093-1-dmitry.sepp@opensynergy.com/
> [3] https://docs.kernel.org/userspace-api/media/v4l/dev-decoder.html#querying-capabilities
> [4] https://docs.kernel.org/userspace-api/media/v4l/dev-encoder.html#querying-capabilities
> [5] https://drive.google.com/file/d/1uPg4kxThlNPBSiC4b5veyFz4OFGytU7v/view
> [6] https://elinux.org/Device_Tree_Usage#Device_Specific_Data
> [7] https://www.devicetree.org/specifications/
> [8] https://github.com/rust-vmm/vm-fdt
> [9] https://github.com/devicetree-org/dt-schema

-- 
Regards,

Laurent Pinchart
