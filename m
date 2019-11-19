Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FEE102203
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 11:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfKSKWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 05:22:24 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40481 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfKSKWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 05:22:23 -0500
Received: by mail-ed1-f66.google.com with SMTP id p59so16583154edp.7
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2019 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UvOzBKq/bMPbVxv5Zr6ezcWtr9oBNP1iwx/oxCydvMM=;
        b=MeDfHuh4nKoxKQDBXul5Defa0CLXxm9ZbrXTguFlin62lkwDOz0D4j1aMtA4SOe++N
         cpkDug5d1rN0NVlkhQziK1wETlPjq18Uiyz1yRjLML1wnhPwbSbguRQeU80RYdRzUa0r
         evU8PL/GKDjisdoXLZNysYE3fimzjAqPc/2Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UvOzBKq/bMPbVxv5Zr6ezcWtr9oBNP1iwx/oxCydvMM=;
        b=qTuJ8XZOU72uL4jR9KYG878+QHbQFHNf2v8UEylUKMro3M6X4lnFSnpowMHGA3xZ2U
         aRRMhzDhtWq20Mldz7kD6Kv18xguc/Gk95FzpfsUWZbC+nl27VWcN6FIdRdHTTxHkOWU
         0cWZ6uL8XdIDVNwK+D4YuWwRy2rNwZjjOPMKcA44GNS5NnMfEFyy16hEn/2NYQAZer2Z
         SSRL/Jc3ouHWjhjBaWA3ZD8xOqWdFKsL/GFUhfcfZYvgT3697St61xIkd4UI437ZsdA8
         HwEpidLshuqtcU/N8Fj2osxlUvgtP5yDkShaBCikYy9vUuUi9rLrOjTXbkn78dFGxmex
         svNA==
X-Gm-Message-State: APjAAAXKvtQaoHOSm+g1kyzbqsZw3QuzQL2STBJCE6XJRr3GT7ftOcOZ
        5HC+l5p9K6l+ATG8RMZg509NjSnABURaow==
X-Google-Smtp-Source: APXvYqxbKng0r5iqAwNfvW6upStRikiyos7ImkxMWdStSiihAQha0YSsIVJRmrlMMlPBAi4HclTuIg==
X-Received: by 2002:a17:906:53cc:: with SMTP id p12mr33727287ejo.52.1574158938523;
        Tue, 19 Nov 2019 02:22:18 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id l16sm76399edj.34.2019.11.19.02.22.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2019 02:22:17 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id r10so23125349wrx.3
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2019 02:22:17 -0800 (PST)
X-Received: by 2002:adf:e505:: with SMTP id j5mr32684782wrm.46.1574158936595;
 Tue, 19 Nov 2019 02:22:16 -0800 (PST)
MIME-Version: 1.0
References: <756c2d9c-ef4d-9f56-d6bd-a09767ec2ae8@xs4all.nl>
In-Reply-To: <756c2d9c-ef4d-9f56-d6bd-a09767ec2ae8@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 19 Nov 2019 19:22:05 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AN1nCWwtGVRp0BasQHZvXwesMx4g2FU=KL4ZyZzPq81g@mail.gmail.com>
Message-ID: <CAAFQd5AN1nCWwtGVRp0BasQHZvXwesMx4g2FU=KL4ZyZzPq81g@mail.gmail.com>
Subject: Re: [ANN] Report of Media Summit: V4L2 Future Work
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Ashton <mpa@fb.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, Nov 2, 2019 at 11:06 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Media Summit: V4L2 Future Work
> October 30, 2019 - Lyon, France
>
> Many thanks to the Linux Foundation for hosting this meeting. Much apprec=
iated!
>
> Please reply to this report with any comments/corrections. Especially if =
I missed
> any action items or attendees!
>

Thanks for the notes. They look good to me.

I'll want to discuss some things about the vb2 begin/end CPU access
changes, but we should probably do it via a different channel.

Best regards,
Tomasz

>
> Original announcement:
>
> https://lore.kernel.org/linux-media/2ef17f32-5957-7b52-fea3-19913ec1c7b3@=
xs4all.nl/T/
>
>
> Attendees:
>
> Michael Ashton <mpa@fb.com> (Facebook/Oculus)
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org> (Google, Chrome OS)
> Nicolas Dufresne <nicolas@collabora.com>
> Tomasz Figa <tfiga@chromium.org> (Google, Chrome OS)
> Ezequiel Garcia <ezequiel@collabora.com>
> Daniel Gomez <daniel@qtec.com>
> Peter Griffin <peter.griffin@linaro.org>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Eugen Hristev <eugen.hristev@microchip.com>
> Shuah Khan <skhan@linuxfoundation.org>
> Helen Koike <helen.koike@collabora.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Hans Verkuil <hverkuil@xs4all.nl> (Cisco Systems Norway)
>
>
> V4L2 Future Work
> ----------------
>
> This discussion was intentionally not very structured. The goal was
> to see what the main pain points are and how to fix those.
>
> Boris Brezillon made an RFC v3 with proposed new ioctls:
>
> https://patchwork.linuxtv.org/cover/59345/
>
>
> The main blockers for drivers/userspace today with our current
> API are:
>
> - Missing format (DRM) modifier support
> - one dmabuf fd with per-plane offsets (mplane API today requires
>   separate dmabuf fds for each plane)
> - userspace cannot specify offsets of planes
>
> Note that the DRM modifiers are per frame and not per plane.
> Typically the modifiers describe tiled and/or compressed formats.
> Compressed formats are typically lossless HW compression schemes
> (often proprietary) used to reduce memory bandwidth. Compressed
> formats are considered opaque formats by userspace.
>
> EGL has a dma-buf extension that supports modifiers (see
> EXT_image_dma_buf_import_modifiers). Also see Wayland protocol:
> https://gitlab.freedesktop.org/wayland/wayland-protocols/blob/master/unst=
able/linux-dmabuf/linux-dmabuf-unstable-v1.xml
>
>
> While not strictly a blocker feature, it is desirable to get
> rid of the distinction between the single and multiplane APIs
> and always describe formats as multiplane. The advantage of
> the multiplane API is that bytesperline and sizeimage are
> described per plane, which is much easier to understand, and it
> does not require userspace to calculate bytesperline for the chroma
> planes.
>
>
> The RFCv3 replaces v4l2_format with a new struct, but the consensus
> was that it is much better to create a new ioctl just to replace the
> v4l2_pix_format struct and leave the other structs in the v4l2_format
> union alone. Two reasons: there is no need to change anything for the
> other VBI etc. buffer types, it's only v4l2_pix_format that no longer
> scales; and it is easy to extend a struct v4l2_pix_format_ext in the
> future. You can't really do that if it is in a union.
>
>
> If a new ENUM_FMT_EXT ioctl is created, then let it return all
> pixelformats + modifiers combinations rather than having to enumerate
> over all combinations. This reduces the number of ioctl calls that
> userspace has to do.
>
> To indicate if a format supports supports putting all planes in one
> buffer, or supports putting each plane in a separate buffer, new format
> flags are needed. Userspace needs to know this.
>
> The vb2 core should check if all planes belong to the same buffer or not,
> and validate it based on the driver requirements. I.e. in the case of
> dmabuf import it should check that all dmabuf FDs refer to the same
> memory and that the per-plane offsets are valid.
>
> The current RFCv3 drops the v4l2_timecode field. Nicolas mentioned that
> while this is not used by any mainline drivers (except virtual drivers)
> this is in fact used by out-of-tree drivers. While they don't use the
> same struct, they do return this information since it is used by broadcas=
t
> systems. So this field needs to return.
>
>
> In the past there was a discussion of creating new fourcc codes to
> describe pixelformats for both DRM and V4L2. This didn't work out, but
> it was suggested that we just document the mapping between DRM and V4L2
> pixelformats as a reference to end-users. We can maintain that as part of
> our V4L2 documentation.
>
>
> The suggestion was made to add a channel number to the new format struct
> and to the streaming I/O ioctls to indicate support for streaming
> multiple channels. This would allow the M2M framework to support multiple
> capture and output streams per instance, something that is not possible
> today. One use-case would be support for H.264 Scalable Video Coding.
> Another is support for compositors.
>
> This would need more research, but the new API should prepare for this.
>
>
> A known outstanding issue is syncing buffers between the CPU and the
> device. Drivers that want to update the buffer before returning it
> to userspace do not make the right dmabuf calls. A patch series fixing
> this was never finished. Google offered to pick this up and give it
> another try.
>
>
> The general consensus was that these proposed new ioctls only address
> part of the problems. The complexity of modern camera pipelines creates
> too many video and v4l-subdev devices, making it very hard for userspace
> to control all of this.
>
> Ideally it should be possible to control a camera ISP through a single
> /dev/mediaX only, rather than though a myriad of other devices. This
> is however a huge change, requiring a lot of work. Quite possible a
> completely new API would be required for this. There is real interest
> in solving this problem, which includes assigning resources to work
> on this.
>
> Google will collect some requirements and report on that later this year.
> Based on that we might decide on a three day brainstorm session in
> Brussels before or after FOSDEM (Feb 1-2, 2020).
>
>
> Action Items
> ------------
>
> Nicolas Dufresne:
>
> - provide more info about timecode use in userspace for Hans Verkuil
>   to verify if struct v4l2_timecode provides sufficient information.
>
> Tomasz Figa:
>
> - Check if we can drop support for using two memory banks for luma and
>   chroma planes? It's only used by the s5p architecture, and dropping
>   support for that would simplify some of the code. Note that s5p doesn't
>   support dmabuf.
>
> - Continue work on my old patch series dealing with dma_buf_begin/end_cpu=
_access():
>
>   https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=3Dvb2-cpu-access
>
>   This series converts most drivers to use these dmabuf functions.
>
>   See also this thread: https://patchwork.kernel.org/patch/7159871/
>   As mentioned in my last reply, the outstanding drivers that are not
>   converted are netup_unidvb, coda, exynos4-is, rcar_jpu and au0828:
>   as far as I remember I did not know how to convert coda and exynos4-is
>   and never found the time to figure that out. The others are new and nee=
d
>   to be looked at again. There are probably more drivers that need work
>   since my patch series is from September 2015.
>
> - Collect API requirements for a camera ISP API and report on that later
>   this year.
>
> Boris Brezillon:
>
> - Post an RFCv4 that takes more of these issues into accounts. Research
>   multistream support a bit more to see what would be involved adding sup=
port
>   for that.
