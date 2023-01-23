Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF606678C46
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 00:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjAWXzL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 18:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjAWXzJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 18:55:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A062CFD8
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 15:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674518061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lNxk5DC/yGhXC60vpQiNIfe/JhxgHiPlqLfRlRn3ULE=;
        b=Bz7Y73GlIuv8dRCg2mv/4HTK+pPUrnA991HgEWeLf3W18ldBMeHmyvb2kRzn38XrWF48mm
        uh5QaUfm9G5MFswCoxPayJCyuYmymEBYwrz6AdSn/D03JU5ceGnIoCQX+2FMnjgSRhMFqk
        0tM4AYoT0DJ6KgIcTKiMWVPDXcgHedA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-nL2ZBYJiOduuWyR4XIbNiw-1; Mon, 23 Jan 2023 18:54:19 -0500
X-MC-Unique: nL2ZBYJiOduuWyR4XIbNiw-1
Received: by mail-lf1-f69.google.com with SMTP id u13-20020a056512128d00b004b53d7241f6so5670918lfs.4
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 15:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNxk5DC/yGhXC60vpQiNIfe/JhxgHiPlqLfRlRn3ULE=;
        b=i/3do4KShiyvhc7OSqfQechbQFh3uYyhvk4qmP0QAPDuEjxsTDUkgqynQqDsf8hPrt
         lqU6/KWCEUnXaBm5o1LDJxDGEIIRZXy1e/G4v/XeJquFlxMLU3M3DEzf4cs4W5v3kshC
         tZBg0VynhAVH/epViwMHClPdFYZg2bNNZ72y9NpwzmzUDujf82NK8Xozof+oOVtB0OpT
         EZe37hEUNHrDvLnzX9H2p9ZtdB9syu51g8jrjPmBx9XhZomzBOwMdnox2hrXMwlhfp3V
         yQLH68CETfxZW6c908+r2L/HrLhztIpYTE8Pb2PXddKIq6DaJpV71aEJs9LfTIpRbMFl
         enxQ==
X-Gm-Message-State: AFqh2kqlr2CCENcvlnWZplMyL0x2SJUApQOYFa+5sD7CbjOjMQtytY+e
        pWu6/K42z0RV4DyYwmEm6YQ+xMtZJkFtal6zQW0VGL+Krs6Q9LfILnGAl/SxccyIGWnKEzTJPQc
        nYwtGUrvFTX/uDZKkzU8adCt0C3LV7sUmkB7peGI=
X-Received: by 2002:a2e:9446:0:b0:283:9a0a:a0f7 with SMTP id o6-20020a2e9446000000b002839a0aa0f7mr1967697ljh.81.1674518058540;
        Mon, 23 Jan 2023 15:54:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuNP8GPUIGSSJRf1EmIBEmZDEGtcqTHSreBbrxLLxfFznJMgOAqy0X72jFZfRkQokwUrc7DclRouJIA55tCoMM=
X-Received: by 2002:a2e:9446:0:b0:283:9a0a:a0f7 with SMTP id
 o6-20020a2e9446000000b002839a0aa0f7mr1967695ljh.81.1674518058318; Mon, 23 Jan
 2023 15:54:18 -0800 (PST)
MIME-Version: 1.0
References: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
 <Y86skCbxY5kZglo8@pendragon.ideasonboard.com> <CA+hFU4z-3iotNkUVr=aHrQ9GFNnGLrvL2B1isnx2x2UnnO+qXA@mail.gmail.com>
 <B55u__QnPBXyk6SrEEYETx1ugeGjZHT9Fva6b9fpZazX-v7nTFJqnKH9Y7OebmOTQ51zffSYMnrfnfYutoWSLzpt-bWk2K8V69Ru7327VlM=@emersion.fr>
In-Reply-To: <B55u__QnPBXyk6SrEEYETx1ugeGjZHT9Fva6b9fpZazX-v7nTFJqnKH9Y7OebmOTQ51zffSYMnrfnfYutoWSLzpt-bWk2K8V69Ru7327VlM=@emersion.fr>
From:   Sebastian Wick <sebastian.wick@redhat.com>
Date:   Tue, 24 Jan 2023 00:54:07 +0100
Message-ID: <CA+hFU4wQ14fn-giuL6oxMmXfg0WPPrXcHHeT5-7tagP54xuXFg@mail.gmail.com>
Subject: Re: [ANNOUNCE] pixfmtdb
To:     Simon Ser <contact@emersion.fr>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        wayland-devel <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 11:43 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Monday, January 23rd, 2023 at 21:25, Sebastian Wick <sebastian.wick@redhat.com> wrote:
>
> > Why is the TF defined for GL formats and both the primaries and TF for
> > Vulkan formats? The only exception here should be sRGB formats. Where
> > did you get the information from?
>
> This is what upstream dfdutils does [1]. Can you explain why you think
> it should be undefined instead of linear?

The channels have no meaning. You can put whatever you want in there.
It doesn't have to be linear, it doesn't have to be colors and
especially not colors with specific primaries. It's only when it's
used to form an image that the TF and primaries are known. Vulkan
specifically requires you to explicitly provide this information to
the WSI and YCC samplers (generally everywhere where knowing them is
required) and never assumes that certain pixel formats imply certain
TFs and primaries (exception being the sRGB variants).


(See also https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#_issues_26,
Q 23)

The problem here seems to be that the Data Format spec describes more
than the pixel format. If you want to share an image, the TF and
primaries are essential but they are not an inherent part of the pixel
format of the image. So yeah, I think what dfdutils does is...
probably not wrong but not what you're after.

>
> I was wondering what to do for DRM formats regarding these. I think it
> would be worthwhile to do like Vulkan: set TF = linear, primaries =
> BT.709, pre-multiplied alpha = yes. These are the things KMS assume
> when there is no override (ie, when there is no KMS property saying
> otherwise).

Please no. All undefined is absolutely the right thing to do. Adding
any more meaning to pixel formats is a horrible idea. The KMS
properties are also not an override, they describe the image and the
description has default values.

>
> [1]: https://github.com/KhronosGroup/dfdutils/blob/5cd41cbdf63e80b00c085c6906a1152709e4c0f2/createdfd.c#L47
>

