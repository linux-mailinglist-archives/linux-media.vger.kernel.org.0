Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B19D678FBC
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 06:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbjAXFTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 00:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjAXFTl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 00:19:41 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA155FE1
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 21:19:40 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 123so17516923ybv.6
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 21:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aajEhhXMmVsLvsRhsLFIHWTCer83l1wUnEHXjAc9R8E=;
        b=HXwn1ky8iT64aFx7McfTeeaiFLZbLoAJ3B9CEKlXlfz+ZIJPzk2W23dcFvmyfcHKm/
         /e1CKrRmP6kEOBWodZu2dJKR2oRUBcvo9MlAU1T1lqV/AV2amIqI71VFaPP0+mY3FaiA
         /x8RwfM5h4JAUDN56UjeDO00Cecdq7KGrX21h/aP+7/l2sjZPG1J8E62uOOTbvYC31dr
         m0ZdEYNY5CTl7cZqQnCupYNjrwq/o/wP9v9gjGfGEdUwvx82LQ4D2bkkGRiThX5nWRX2
         rbxvvO/oaio2bT6pDr3oTEmskoSdEM1K2HobUWF59zFD5BsXT0yKvPanPKIWuTTApNnA
         1/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aajEhhXMmVsLvsRhsLFIHWTCer83l1wUnEHXjAc9R8E=;
        b=Abufv4bXmN2ljw8/rmf99w980KbmAu8hsMbBZYDWAdJsFThaW9cQklX4lOdZR0VPaa
         MgCGMRWrxSVEKT+coB4RDkZWOu9K05RMRJ4pz63YL3+SWVPV01AvIT6YyNDZr+0LJmGt
         am8G7ubvKV7ycoT092AcrP0jgEfFCkyFaXhkg0ndmmajrf+VKy5XBM/wLJGgQ8E/O6ov
         37ShPv4x6PSAr3nSf588HHN0ijUKBLta4tg7MKmDd6uEyMyF94SZieG/sORdjQZQDUV2
         BaaCIN6Tp1nebj6gDvI15rB/g1rkApDhI3ESVw+ShHXtdGDeCFOu8xhHwqacHVrbJYJr
         enmg==
X-Gm-Message-State: AFqh2kohW6NK7mhMlnHyvLeoSu2nCfKoHKRaRLcuup5KFgRgldm397wN
        BCSX+WGPs0UjZPCvIBpqYH9y5b+eXrXqFuVhJs1n
X-Google-Smtp-Source: AMrXdXvQncnILbL8UBISoiDSpnnYYKPmxdsRjcxC8OI06Nei40MBcVTislakm2TngBoftXVs7J5nHk+E7v7/FzWgYHA=
X-Received: by 2002:a25:dd5:0:b0:801:7846:7e97 with SMTP id
 204-20020a250dd5000000b0080178467e97mr1160754ybn.49.1674537579258; Mon, 23
 Jan 2023 21:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com> <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
In-Reply-To: <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
From:   John Stultz <jstultz@google.com>
Date:   Mon, 23 Jan 2023 21:19:28 -0800
Message-ID: <CANDhNCoVkq4pQJvtgmvJJe=68ZoQOdjYFkbGG-PXVujX1py4aw@mail.gmail.com>
Subject: Re: DMA-heap driver hints
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        mchehab@kernel.org, James Jones <jajones@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 8:29 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
> > - I assume some drivers will be able to support multiple heaps. How do
> >    you envision this being implemented ?
>
> I don't really see an use case for this.
>
> We do have some drivers which say: for this use case you can use
> whatever you want, but for that use case you need to use specific memory
> (scan out on GPUs for example works like this).
>
[snipping the constraints argument, which I agree with]
>
> What we do have is compatibility between heaps. E.g. a CMA heap is
> usually compatible with the system heap or might even be a subset of
> another CMA heap. But I wanted to add that as next step to the heaps
> framework itself.

So the difficult question is how is userland supposed to know which
heap is compatible with which?

If you have two devices, one that points to heap "foo" and the other
points to heap "bar", how does userland know that "foo" satisfies the
constraints of "bar" but "bar" doesn't satisfy the constraints of
"foo".
(foo =3D"cma",  bar=3D"system")

I think it would be much better for device 1 to list "foo" and device
2 to list "foo" and "bar", so you can find that "foo" is the common
heap which will solve both devices' needs.


> > - Devices could have different constraints based on particular
> >    configurations. For instance, a device may require specific memory
> >    layout for multi-planar YUV formats only (as in allocating the Y and=
 C
> >    planes of NV12 from different memory banks). A dynamic API may thus =
be
> >    needed (but may also be very painful to use from userspace).
>
> Uff, good to know. But I'm not sure how to expose stuff like that.

Yeah. These edge cases are really hard to solve generically.  And
single devices that have separate constraints for different uses are
also not going to be solvable with a simple linking approach.

But I do wonder if a generic solution to all cases is needed
(especially if it really isn't possible)? If we leave the option for
gralloc like omniscient device-specific userland policy, those edge
cases can be handled by those devices that can't run generic logic.
And those devices just won't be able to be supported by generic
distros, hopefully motivating future designs to have less odd
constraints?

thanks
-john
