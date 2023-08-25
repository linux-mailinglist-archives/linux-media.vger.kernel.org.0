Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF9A78870F
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 14:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242844AbjHYMWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 08:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244855AbjHYMVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 08:21:55 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6ED26BD
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 05:21:28 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a1de3417acso405314966b.0
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 05:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20221208.gappssmtp.com; s=20221208; t=1692966023; x=1693570823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kWYyngDJ3qSSpaOwkQKw/6S3U2XYLWWAXr/ethxyWfY=;
        b=fWg8e+jR7J7GfrbzGYj+LejpRt6q8kD5MdO+pdHY0xIB0Y/p2244yhesvkI73MD8SW
         KuTlzEdwoX1d5TdleWVRkYyvjUdAZ8FxqjAP8Px6CgSSyDWmMSaKzWIgYNMNKd1fTszr
         ma8rdIxjXD+QIuwdkV5IgjS+/HdBPmY/9l+sGmVTatchUiVSRC4VmQG34lRPMrIj8uEH
         KFW2vJMnZkPFqML2Qsd3K1+qpz4N+FYXUP8iRpORRpKmsVuSGC1PVfHsJ2IL5HNK1XyK
         qofYpV/Rc7LlYZghHxTQBiO8b3trAn5cuc15cfdhzSsydx0Gj3nFYvYmdsyOzdvcTHE8
         IpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966023; x=1693570823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWYyngDJ3qSSpaOwkQKw/6S3U2XYLWWAXr/ethxyWfY=;
        b=BVkVpLLCtnIfNpX9iTXYcL5CRThJiF7CRdLfkkZhY6XtBdeEzaweQzpGDe8/vjRF83
         xquzc2ppZJc85ga80kFMQMa8MVqhe6wLbWt/eDjCG1Ewfi32jMgSlUMybrBLWsow6ue9
         jVSFaKS8ON7CFsFKDqY03WZpZ0Pm8yRDEGv59skmgWMGT4gWWFKEFdnRuqV5cobok0oW
         jS+hfZBGUPweFZQSeMgmkd2tdfRDasUWm/aWcA0+uQiFKBkBBLxCo7vY/Iy7f7vZZu3y
         3Uknk0QWXspB0hsHFCCvYm+kCC0VoX75c81Txy0CpD/u5eVckwGQNzUv3m8iJqn9feLG
         49iw==
X-Gm-Message-State: AOJu0YwnAXLo9dWB6H0uD8eYBOQBGw62OXW4U5pM3ho5xLxR+7KkH0x6
        om23yQiVAzvol8rD6cdIUazYSMW1Hz/xJxPletJlAg==
X-Google-Smtp-Source: AGHT+IErw8qnClNuZp9zL2W3R5DxEJmB8WAy3evsgCLSL46uQHxCzXGTVd96j/AToUUTTaIwJ1VU4czxprtRlgB5e0w=
X-Received: by 2002:a17:907:7da3:b0:982:a022:a540 with SMTP id
 oz35-20020a1709077da300b00982a022a540mr19879140ejc.11.1692966022330; Fri, 25
 Aug 2023 05:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
 <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com>
 <f8a168e8-1a23-c6b3-0f68-baa73396d594@synaptics.com> <20230825104052.4573ab7b@eldfell>
 <65432c20-a6fd-141c-2ced-a7e6599a1e7c@synaptics.com>
In-Reply-To: <65432c20-a6fd-141c-2ced-a7e6599a1e7c@synaptics.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Fri, 25 Aug 2023 13:20:09 +0100
Message-ID: <CAPj87rPQzRUmLAnu09wm8K6Skjb6KTGwL63b4DXPuwdsYXzbSw@mail.gmail.com>
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
To:     Hsia-Jun Li <Randy.Li@synaptics.com>
Cc:     Pekka Paalanen <ppaalanen@gmail.com>, daniels@collabora.com,
        ayaka <ayaka@soulik.info>, hughd@google.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        akpm@linux-foundation.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, 25 Aug 2023 at 08:56, Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
> On 8/25/23 15:40, Pekka Paalanen wrote:
> > if userspace cannot access things like an image's HDR metadata, then it
> > will be impossible for userspace to program KMS to have the correct
> > color pipeline, or to send intended HDR metadata to a video sink.
> >
> > You cannot leave userspace out of HDR metadata handling, because quite
> > probably the V4L2 buffer is not the only thing on screen. That means
> > there must composition of multiple sources with different image
> > properties and metadata, which means it is no longer obvious what HDR
> > metadata should be sent to the video sink.
> >
> > Even if it is a TV-like application rather than a windowed desktop, you
> > will still have other contents to composite: OSD (volume indicators,
> > channels indicators, program guide, ...), sub-titles, channel logos,
> > notifications... These components ideally should not change their
> > appearance arbitrarily with the main program content and metadata
> > changes. Either the metadata sent to the video sink is kept static and
> > the main program adapted on the fly, or main program metadata is sent
> > to the video sink and the additional content is adapted on the fly.
> >
> > There is only one set of HDR metadata and one composited image that can
> > be sent to a video sink, so both must be chosen and produced correctly
> > at the source side. This cannot be done automatically inside KMS kernel
> > drivers.
>
> There may be some misunderstanding.
> Let suppose this HDR data is in a vendor specific format.
> Both upstream(decoder) and downstream(DRM) hardware devices are coming
> from the same vendor.
> Then we just need to delivery the reference to this metadata buffer from
> the upstream to downstream, both of drivers know how to handle it.
>
> Despite the userspace, we just need to extend a wayland protocol that
> making wayland compositor know how to receive the reference to the
> metadata and set it to the DRM plane.
>
> If you want a common HDR formats for all HDR variants(HDR10+, DV), I am
> not against it. But it won't make the userspace be able to fill the HDR
> metadata even the HDR data comes from the bitstream(likes SEI). We must
> consider the case of Secure Video Path(Digital Right), the bitstream is
> not accessible from (REE) userspace nor linux kernel, the downstream
> must take what the upstream feed.

To summarise from IRC, so it's properly documented: the community will
not accept this.

The mechanism (shmem, dmabuf, copy_from_user, whatever) is _not_ the
problem. The problem is the concept.

There have been incredibly extensive discussions on this list about
colour management and HDR, summarised in documentation in the DRM
repository, as well as three talks at the last XDC. This design is the
result of discussion between many community participants - including
hardware vendors - who have all come up with a design which
prioritises transparency and explicit operation.

What you are suggesting is exactly the opposite of this. A design in
which opaque magic blobs are passed around and the kernel does unknown
things based on the contents of those blobs, contradicts this design.
(This is different to compression, where even if the format is
proprietary, the effect is well-understood - for the current
compression mechanisms, it is a lossless transform.)

The old Android Display Framework (ADF) was based around the same
design with blobs of opaque driver-specific data, where generic code -
either in the kernel or in userspace - could not understand the effect
of these blobs. This design was rejected, and we made a clear choice
to follow the DRM design principles instead.

Upstream will not accept any design which hides magic away. 'GKI is
hard', 'other vendors won't let us', etc, are not good enough reasons
to change our mind on this fundamental principle.

Cheers,
Daniel
