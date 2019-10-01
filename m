Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8BD5C3912
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 17:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389656AbfJAPah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 11:30:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37441 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfJAPah (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 11:30:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id i1so16095627wro.4;
        Tue, 01 Oct 2019 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ByOOtItgIM4fNNOqTAlMwS81tEwlXnu/a2LuoNS9e8=;
        b=gUwi/JDx/9cTu842z93GsTTTB1OuZzng8lqEXyrqdmlK8AlBqT53IN87bCGK2e+FmU
         Qhm3+N+llTrjeoau6n+30eHV+y/nMENj4N3nZn62CYdlrdVGOnX6QMHgz4yjIZ6WH2W6
         DK/pMaRAhtXh22ChQ3t3HACUUrLF/cfF+nIbwPA2D9rtlWd8rOcz3U0imP9zFUuFZ5b0
         zaZJtP0ZXEv4VtDUkKqQIQBDXvLyfCbVcB/noiqLB/faw7wfXCmYPnGSTh48hZQbe7b3
         SSWp3yu5hFSa3USSCVDNrExLHK3ymX9gm8KiLiZo3Ivm46d6IMhRXmbfPAKSee2lCtCZ
         4y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ByOOtItgIM4fNNOqTAlMwS81tEwlXnu/a2LuoNS9e8=;
        b=CW+Sbxq/Hk0xtvP+rx270O9EI/qx6Qxevo+hLUeeXFg8wV8N9K5BXRsHQOJfy9Bd9a
         m0Xowu5p03p9U1KQLNnYtfHS7Q/CkaztmDUO+qB7VLyHwS5bT8m1wDUSw3xJALgMnYy0
         d5li8uChnBfJYM7i/M5U58jzEzozmUKM0lSKsx1PHoI9x18qgLRW835+IGQiJKWJNAcD
         Q5jta9LE2xk6lFbC7cp46s0TFzP4o4/BgH01N7SYsvxCgDmdLDviQPGei3MheNlhfgEZ
         CpGdzKGMYduAzuUBqIOL8Kg0selFh2XjfXpDVV8zNC0hwCW7wwZVDvt9sG1biAH2QMf+
         ZcSQ==
X-Gm-Message-State: APjAAAUCUoaEVls9D2CmoRAKZbhz2/VeaTidXkLveHUKwWvIVOTRAelj
        ZgI6TCDPH2iQaUtag8yVLq7+9MF4LMXNq/a9KPA=
X-Google-Smtp-Source: APXvYqy248gqVjQ/m9t/UNg/TFP1nq+WUCpQgMZxJKjwgRClEliSnkAXErfmllhuOPB1BVX9fQnfNXzcNM+XuCdXLCE=
X-Received: by 2002:adf:d08b:: with SMTP id y11mr19211781wrh.50.1569943833109;
 Tue, 01 Oct 2019 08:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190909134241.23297-1-ayan.halder@arm.com> <20190917125301.GQ3958@phenom.ffwll.local>
 <20190917160730.hutzlbuqtpmmtdz3@e110455-lin.cambridge.arm.com>
 <11689dc3-6c3e-084b-b66d-e6ccf75cb8fb@baylibre.com> <CAKMK7uF7oKV4609Ca4mLj7gYC1rkWnWAV7_hM5Z48Ez1cBoMqA@mail.gmail.com>
 <20190930095134.xjcucw2rrij5f4np@DESKTOP-E1NTVVP.localdomain> <20190930125701.GA13998@arm.com>
In-Reply-To: <20190930125701.GA13998@arm.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 1 Oct 2019 11:30:20 -0400
Message-ID: <CADnq5_NmgeZqUwq46aMRFUNmUabaVwFVD-Q_wvN1n8qZaj_rBA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm:- Add a modifier to denote 'protected' framebuffer
To:     Ayan Halder <Ayan.Halder@arm.com>
Cc:     Brian Starkey <Brian.Starkey@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 30, 2019 at 8:57 AM Ayan Halder <Ayan.Halder@arm.com> wrote:
>
> On Mon, Sep 30, 2019 at 09:51:35AM +0000, Brian Starkey wrote:
> > Hi,
> >
> > On Tue, Sep 17, 2019 at 07:36:45PM +0200, Daniel Vetter wrote:
> > > On Tue, Sep 17, 2019 at 6:15 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On 17/09/2019 18:07, Liviu Dudau wrote:
> > > > > On Tue, Sep 17, 2019 at 02:53:01PM +0200, Daniel Vetter wrote:
> > > > >> On Mon, Sep 09, 2019 at 01:42:53PM +0000, Ayan Halder wrote:
> > > > >>> Add a modifier 'DRM_FORMAT_MOD_ARM_PROTECTED' which denotes that the framebuffer
> > > > >>> is allocated in a protected system memory.
> > > > >>> Essentially, we want to support EGL_EXT_protected_content in our komeda driver.
> > > > >>>
> > > > >>> Signed-off-by: Ayan Kumar Halder <ayan.halder@arm.com>
> > > > >>>
> > > > >>> /-- Note to reviewer
> > > > >>> Komeda driver is capable of rendering DRM (Digital Rights Management) protected
> > > > >>> content. The DRM content is stored in a framebuffer allocated in system memory
> > > > >>> (which needs some special hardware signals for access).
> > > > >>>
> > > > >>> Let us ignore how the protected system memory is allocated and for the scope of
> > > > >>> this discussion, we want to figure out the best way possible for the userspace
> > > > >>> to communicate to the drm driver to turn the protected mode on (for accessing the
> > > > >>> framebuffer with the DRM content) or off.
> > > > >>>
> > > > >>> The possible ways by which the userspace could achieve this is via:-
> > > > >>>
> > > > >>> 1. Modifiers :- This looks to me the best way by which the userspace can
> > > > >>> communicate to the kernel to turn the protected mode on for the komeda driver
> > > > >>> as it is going to access one of the protected framebuffers. The only problem is
> > > > >>> that the current modifiers describe the tiling/compression format. However, it
> > > > >>> does not hurt to extend the meaning of modifiers to denote other attributes of
> > > > >>> the framebuffer as well.
> > > > >>>
> > > > >>> The other reason is that on Android, we get an info from Gralloc
> > > > >>> (GRALLOC_USAGE_PROTECTED) which tells us that the buffer is protected. This can
> > > > >>> be used to set up the modifier/s (AddFB2) during framebuffer creation.
> > > > >>
> > > > >> How does this mesh with other modifiers, like AFBC? That's where I see the
> > > > >> issue here.
> > > > >
> > > > > AFBC modifiers are currently under Arm's namespace, the thought behind the DRM
> > > > > modifiers would be to have it as a "generic" modifier.
> > >
> > > But if it's a generic flag, how do you combine that with other
> > > modifiers? Like if you have a tiled buffer, but also encrypted? Or
> > > afbc compressed, or whatever else. I'd expect for your hw encryption
> > > is orthogonal to the buffer/tiling/compression format used?
> >
> > This bit doesn't overlap with any of the other AFBC modifiers, so as
> > you say it'd be orthogonal, and could be set on AFBC buffers (if we
> > went that route).
> >
> > >
> > > > >>> 2. Framebuffer flags :- As of today, this can be one of the two values
> > > > >>> ie (DRM_MODE_FB_INTERLACED/DRM_MODE_FB_MODIFIERS). Unlike modifiers, the drm
> > > > >>> framebuffer flags are generic to the drm subsystem and ideally we should not
> > > > >>> introduce any driver specific constraint/feature.
> > > > >>>
> > > > >>> 3. Connector property:- I could see the following properties used for DRM
> > > > >>> protected content:-
> > > > >>> DRM_MODE_CONTENT_PROTECTION_DESIRED / ENABLED :- "This property is used by
> > > > >>> userspace to request the kernel protect future content communicated over
> > > > >>> the link". Clearly, we are not concerned with the protection attributes of the
> > > > >>> transmitter. So, we cannot use this property for our case.
> > > > >>>
> > > > >>> 4. DRM plane property:- Again, we want to communicate that the framebuffer(which
> > > > >>> can be attached to any plane) is protected. So introducing a new plane property
> > > > >>> does not help.
> > > > >>>
> > > > >>> 5. DRM crtc property:- For the same reason as above, introducing a new crtc
> > > > >>> property does not help.
> > > > >>
> > > > >> 6. Just track this as part of buffer allocation, i.e. I think it does
> > > > >> matter how you allocate these protected buffers. We could add a "is
> > > > >> protected buffer" flag at the dma_buf level for this.
> >
> > I also like this approach. The protected-ness is a property of the
> > allocation, so makes sense to store it with the allocation IMO.
> >
> > > > >>
> > > > >> So yeah for this stuff here I think we do want the full userspace side,
> > > > >> from allocator to rendering something into this protected buffers (no need
> > > > >> to also have the entire "decode a protected bitstream part" imo, since
> > > > >> that will freak people out). Unfortunately, in my experience, that kills
> > > > >> it for upstream :-/ But also in my experience of looking into this for
> > > > >> other gpu's, we really need to have the full picture here to make sure
> > > > >> we're not screwing this up.
> > > > >
> > > > > Maybe Ayan could've been a bit clearer in his message, but the ask here is for ideas
> > > > > on how userspace "communicates" (stores?) the fact that the buffers are protected to
> > > > > the kernel driver. In our display processor we need to the the hardware that the
> > > > > buffers are protected before it tries to fetch them so that it can 1) enable the
> > > > > additional hardware signaling that sets the protection around the stream; and 2) read
> > > > > the protected buffers in a special mode where there the magic happens.
> > >
> > > That was clear, but for the full picture we also need to know how
> > > these buffers are produced and where they are allocated. One approach
> > > would be to have a dma-buf heap that gives you encrypted buffers back.
> > > With that we need to make sure that only encryption-aware drivers
> > > allow such buffers to be imported, and the entire problem becomes a
> > > kernel-internal one - aside from allocating the right kind of buffer
> > > at the right place.
> > >
> >
> > In our case, we'd be supporting a system like TZMP-1, there's a
> > Linaro connect presentation on it here:
> > https://connect.linaro.org/resources/hkg18/hkg18-408/
> >
> > The simplest way to implement this is for firmware to set up a
> > carveout which it tells linux is secure. A linux allocator (ion, gem,
> > vb2, whatever) can allocate from this carveout, and tag the buffer as
> > secure.
> >
> > In this kind of system, linux doesn't necessarily need to know
> > anything about how buffers are protected, or what HW is capable of -
> > it only needs to carry around the "is_protected" flag.
> >
> > Here, the TEE is ultimately responsible for deciding which HW gets
> > access to a buffer. I don't see a benefit of having linux decide which
> > drivers can or cannot import a buffer, because that decision should be
> > handled by the TEE.
> >
> > For proving out the pipeline, IMO it doesn't matter whether the
> > buffers are protected or not. For our DPU, all that matters is that if
> > the buffer claims to be protected, we have to set our protected
> > control bit. Nothing more. AFAIK it should work the same for other
> > TZMP-1 implementations.
> >
> > > > > So yeah, we know we do want full userspace support, we're prodding the community on
> > > > > answers on how to best let the kernel side know what userspace has done.
> > > >
> > > > Actually this is interesting for other multimedia SoCs implementing secure video decode
> > > > paths where video buffers are allocated and managed by a trusted app.
> > >
> > > Yeah I expect there's more than just arm wanting this. I also wonder
> > > how that interacts with the secure memory allocator that was bobbing
> > > around on dri-devel for a while, but seems to not have gone anywhere.
> > > That thing implemented my idea of "secure memory is only allocated by
> > > a special entity".
> > > -Daniel
> >
> > Like I said, for us all we need is a way to carry around a 1-bit
> > "is_protected" flag with a buffer. Could other folks share what's
> > needed for their systems so we can reason about something that works
> > for all?
>
> To make things a bit more specific, we are thinking of the following
> patch :-
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index ec212cb27fdc..36f0813073a2 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -279,6 +279,7 @@ struct dma_buf_ops {
>   *         kernel module.
>   * @list_node: node for dma_buf accounting and debugging.
>   * @priv: exporter specific private data for this buffer object.
> + * @is_protected: denotes that the buffer is
> secure/protected/encrypted/trusted.
>   * @resv: reservation object linked to this dma-buf
>   * @poll: for userspace poll support
>   * @cb_excl: for userspace poll support
> @@ -306,6 +307,7 @@ struct dma_buf {
>         struct module *owner;
>         struct list_head list_node;
>         void *priv;
> +       bool is_protected;
>         struct dma_resv *resv;
>
>         /* poll support */
>
> @all, @amdgpu-folks :- Is this something you can use of to denote
> secure/protected/encrypted/trusted buffers ?

I suppose.  At the moment, we don't really have a need for it since we
only our IPs support our encryption scheme and if we share buffers
between we can get to the secure status when we look up the amdgpu
buffer object internally in the kernel side.  Still might be useful
for cases where secure buffers get shared across drivers so we have a
generic check for secure status.

Alex

>
> The way 'is_protected' flag gets used to allocate
> secure/protected/encrypted buffers will be vendor specific.
>
> Please comment to let us know if it looks useful to non Arm folks.
> >
> > Thanks!
> > -Brian
> >
> > >
> > > >
> > > > Neil
> > > >
> > > > >
> > > > > Best regards,
> > > > > Liviu
> > > > >
> > > > >
> > > > >> -Daniel
> > > > >>
> > > > >>>
> > > > >>> --/
> > > > >>>
> > > > >>> ---
> > > > >>>  include/uapi/drm/drm_fourcc.h | 9 +++++++++
> > > > >>>  1 file changed, 9 insertions(+)
> > > > >>>
> > > > >>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > > >>> index 3feeaa3f987a..38e5e81d11fe 100644
> > > > >>> --- a/include/uapi/drm/drm_fourcc.h
> > > > >>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > >>> @@ -742,6 +742,15 @@ extern "C" {
> > > > >>>   */
> > > > >>>  #define AFBC_FORMAT_MOD_BCH     (1ULL << 11)
> > > > >>>
> > > > >>> +/*
> > > > >>> + * Protected framebuffer
> > > > >>> + *
> > > > >>> + * The framebuffer is allocated in a protected system memory which can be accessed
> > > > >>> + * via some special hardware signals from the dpu. This is used to support
> > > > >>> + * 'GRALLOC_USAGE_PROTECTED' in our framebuffer for EGL_EXT_protected_content.
> > > > >>> + */
> > > > >>> +#define DRM_FORMAT_MOD_ARM_PROTECTED       fourcc_mod_code(ARM, (1ULL << 55))
> > > > >>> +
> > > > >>>  /*
> > > > >>>   * Allwinner tiled modifier
> > > > >>>   *
> > > > >>> --
> > > > >>> 2.23.0
> > > > >>>
> > > > >>
> > > > >> --
> > > > >> Daniel Vetter
> > > > >> Software Engineer, Intel Corporation
> > > > >> http://blog.ffwll.ch
> > > > >
> > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
