Return-Path: <linux-media+bounces-12770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FCE900F26
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 03:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 485A2B23950
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 01:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BE48F47;
	Sat,  8 Jun 2024 01:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fzrjdHEX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D6463C8
	for <linux-media@vger.kernel.org>; Sat,  8 Jun 2024 01:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717811445; cv=none; b=UOuWtyMMUxJsbyVQP26bK94t5p9QBIcKvfDcbXuLwGYFgLjn+hlkZfxnbMr8lSBrDtHvlJydJ+CVf+t1g4cPCOemZan5oUh+i4ZOXghXOl1TZthz3CX+r4FDSynHF62JkNXevWPpGcQJes4O4TR69aK2JCy07weypZ1g22pGTZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717811445; c=relaxed/simple;
	bh=pZ1HYMtD+hC5Xr98K4Qedt9r2KoP7q1TcHMjgqNmd4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1cGyhhnchKXGSUX4+CcMIANDgyBo3tUzEiSfv5NIVDafpy9xA1Mu824eXuRmTVMPG1Ux0qHX1CDpcCNTu9eNdaWClzQ2ljTVzMUGcCEhT+xznu+P6Ixie7xRhO6a8Z/6pFZcaK089lO9dXequ5eYX3m5NCPsNQE1FxVBOj0bzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fzrjdHEX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so40939391fa.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 18:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717811440; x=1718416240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7adnk0ro032GAE9wmPXDfWWhjxlszHC5NtwjfOrUNpE=;
        b=fzrjdHEXY4rvRtbxpeutNUWKWPMNrWRMPYwrFOee5axkCaHlG1/+a/mZj2H4Qug+Cf
         /xIS5rTrWcPX51LX84q39hPQ8B/sOGd9E/x2WEvUW+5gx0SF6Wsq1yPoXileGJFGZYJS
         o5TGu/tRmQPIDI4rDD5fPPZIhN5qS5XYAW5pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717811440; x=1718416240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7adnk0ro032GAE9wmPXDfWWhjxlszHC5NtwjfOrUNpE=;
        b=Die41t3ViP35mCxld0qpcwqtWHZ1inJk/c7AxexNr1SOgIXg5Gvm9k2CMqXK68tAdt
         R30mtb4w3EPdGYaXFBZRu70+XBkH5Hz9taZhFKma56tvcLeyHMpW430ClUDVqGvETFCM
         26+YI0crnL9+nFJfo25pCNHCgoSi4n6OxiB1kTF0YNX6JeQJfQ9nb2mFJRBNHNIJl+iR
         DELkTWoJbyL+n9p0AZsgAYbOIFesPu5EhCwE9niQL+mQw7P7gmWks6PBdJRld/ixZsEq
         XpPquPW4kSmbY9yHSdQ6s7ZlK2oEyMbH0FDQgIYHm3ffXx6doe9mDhHOqHRhV+ZulLbD
         ceaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB+uZ7a1LJ4om+wC5b0A2qkZrcJlx50DGZa20oVBoJa/UYC4tPv9FOwt0ylGp9jUI2Syji8rjAhvOhJQTThZDqRO3X4UusI36E7/0=
X-Gm-Message-State: AOJu0YwFq74HHbrEEuhZiJ191CFh4o+ZED/YI5oDjAimnNbaNVovmagz
	qQPcPPTcdV4VAmvVMUyHb/k/AIG64eKrP/B4c2h1zuCPaWU22Q4XqeBVqLEaCqwinNJx+0GfD6K
	Uqg==
X-Google-Smtp-Source: AGHT+IGKldULiVY2faTmIBRryBMjVTfK+XouvhNmyOYj2jnO6R2q3CBAye3nGomsPXd1yEqOUQIJfQ==
X-Received: by 2002:a19:5f53:0:b0:52c:76ac:329b with SMTP id 2adb3069b0e04-52c76ac335cmr336096e87.35.1717811439749;
        Fri, 07 Jun 2024 18:50:39 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806ec816sm320849066b.129.2024.06.07.18.50.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 18:50:39 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42175bce556so15305e9.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 18:50:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNSYhB0vwDeM8V4qCgeei1yuInZv0AYI7RfdQYwztkORmkEESRUbIzBXGqf7YxoXjYIA81F+bkJvwt4NPPlMSldpGngnAwsPLjJyU=
X-Received: by 2002:a05:600c:3d1a:b0:41b:8715:1158 with SMTP id
 5b1f17b1804b1-4217a999737mr752955e9.6.1717811437900; Fri, 07 Jun 2024
 18:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240607080045.1337046-1-aesteve@redhat.com> <b2abecb4-03a2-49ce-bfc3-2d95eb7a6956@opensynergy.com>
In-Reply-To: <b2abecb4-03a2-49ce-bfc3-2d95eb7a6956@opensynergy.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Sat, 8 Jun 2024 10:50:25 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW36YaZFaWgksePQ=fMC7QffJD6ZpHN-iSzhLYp9Ho0sg@mail.gmail.com>
Message-ID: <CAPBb6MW36YaZFaWgksePQ=fMC7QffJD6ZpHN-iSzhLYp9Ho0sg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
To: Alexander Gordeev <alexander.gordeev@opensynergy.com>
Cc: Albert Esteve <aesteve@redhat.com>, virtio-dev@lists.linux.dev, 
	Matti.Moell@opensynergy.com, cohuck@redhat.com, mst@redhat.com, 
	daniel.almeida@collabora.com, changyeon@google.com, alex.bennee@linaro.org, 
	gurchetansingh@google.com, ribalda@google.com, nicolas.dufresne@collabora.com, 
	eballetb@redhat.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 10:29=E2=80=AFPM Alexander Gordeev
<alexander.gordeev@opensynergy.com> wrote:
>
> Hi Albert,
>
> On 07.06.24 10:00, Albert Esteve wrote:
> > Hi,
> >
> > This a formal attempt of including virtio-media
> > device specification.
> >
> > Virtio-media came from a discussion on virtio-dev
> > mailing list, which lead to presenting virtio-v4l2[1]
> > specification as an alternative to virtio-video.
> >
> > Later, virtio-v4l2 was renamed to virtio-media[2]
> > and published through:
> >
> > https://github.com/chromeos/virtio-media
> >
> > The repository above includes a virtio-media driver able
> > to pass v4l2-compliance when proxying the vivid/vicodec
> > virtual devices or an actual UVC camera using the
> > V4L2 vhost device (available in the repository).
> > Steps to reproduce are also detailed[3].
> >
> > There is some overlap with virtio-video in regards
> > to which devices it can handle. However,
> > as virtio-media will likely be the virtualization
> > solution for ChromeOS (already landed into the chromeos
> > organization) and possibly other Google projects for
> > media devices, it would be desirable to include the
> > specification in the next virtio release despite
> > the aforementioned overlap.
> >
> > The device ID in this document differs from
> > the ID in the virtio-media project repository.
> > And it will probably need some discussion on which
> > would be the correct definitive ID.
> >
> > Full PDF: https://drive.google.com/file/d/1pNCFP06VoV8Zuyx0aDVQ7HAT4xp-=
pZ0a/view?usp=3Dsharing
> > PDF with the media section only: https://drive.google.com/file/d/1sn3NU=
UeCm46zVyJKHkpytTIgGw1fUt5T/view?usp=3Dsharing
> >
> > [1] https://mail.google.com/mail/u/0?ui=3D2&ik=3D73ebd65ebd&attid=3D0.1=
&permmsgid=3Dmsg-f:1767388565327924962&th=3D1887068940754ee2&view=3Datt&dis=
p=3Dinline&realattid=3Df_libalimc0
> > [2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg126=
65.html
> > [3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
> >
> > Albert Esteve (1):
> >    virtio-media: Add virtio media device specification
> >
> >   conformance.tex                           |  13 +-
> >   content.tex                               |   1 +
> >   device-types/media/description.tex        | 578 +++++++++++++++++++++=
+
> >   device-types/media/device-conformance.tex |  11 +
> >   device-types/media/driver-conformance.tex |   9 +
> >   5 files changed, 608 insertions(+), 4 deletions(-)
> >   create mode 100644 device-types/media/description.tex
> >   create mode 100644 device-types/media/device-conformance.tex
> >   create mode 100644 device-types/media/driver-conformance.tex
>
> I'd like to add some general considerations:
>
> 1. virtio-media device capability discovery is very chatty
>
> V4L2 requires potentially hundreds of system calls to get the full view
> of the device capabilities. This is inherited by virtio-media.
> AFAIU V4L2 developers agree there is room for enhancement here, see [1],
> [2]. Also I've been told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were
> added for similar reasons.
>
>  From the point of view of virtualization developers like my colleagues
> and me hundreds of hypervisor "exits" are excessive and costly. It can
> noticeably increase boot times, which is something we fight against in
> automotive. AFAIU other virtio developers agree with this, see [3].

There is a simple way to mitigate this: allow an arbitrary number of
commands to be submitted by the driver with each command buffer. The
host processes the commands sequentially and stops at the first error,
if any.

That way, when enumerating formats, the guest can place a bunch of
VIDIOC_ENUM_FMT ioctls covering an arbitrary range 0..n in its command
buffer, and get all these formats in one vmexit instead of n. In the
case of a video decoder supporting 5 input formats, all the formats
are enumerated in 5 exits.

Having this option could also enable other optimizations, like the
guest being able to queue all its CAPTURE buffers in a single vmexit,
although I doubt this would result in a noticeable performance boost.

But at the very least this should address concerns about noisy
enumeration. I haven't noticed any slowness due to format enumeration
with the current scheme, but the option is trivial to enable.

>
> In contrast virtio-video has been doing this in one command from day
> one. Yes, the data was incomplete. That's why in draft v9 I added TLV as
> a way to store all possible capabilities. I hope the linux-media folks
> could take a look on it. Maybe this is something, that can be adopted in
> V4L2?
>
> 2. virtio-media has a hard dependency on V4L2
>
> There are certainly some "patches" on top of V4L2 in virtio-media, like
> the representation of the extended controls (which actually looks
> similar to the representation of the controls in virtio-video) or
> VIRTIO_MEDIA_EVT_DQBUF. But how far can this go? Is it OK to add your
> own ioctl ids in virtio-media?

virtio-media doesn't add any ioctl ID and the extended controls use
the same structure as their V4L2 counterparts.

>
> AFAIK the linux-media maintainers have been overloaded for years, see
> [4]. Would they be happy to deal with the additional requirements? Would
> virtio community like to have a dependency here?

The burden of having a couple new events in virtio-media seems lighter
to me on the V4L2 maintainers than the one of having a whole new video
protocol to maintain.

>
> 2.1. an example: format modifiers
>
> There is a patchset aiming at unifying V4L2 pixel formats and extending
> them with DRM format modifiers. It is now at version 7 submitted in
> 2023, see [5]. The first version was submitted in 2019, see [6]. Not
> merged yet AFAIK.
>
> In virtio-video I just added them in draft v9.
>
> I'm absolutely not trying to criticize here. I just try to highlight
> that there is a lot of legacy and the process is painful. Right now we
> have an opportunity to design a new API according to the current state
> of the art of the stateful codecs.
>
> 3. uncertainty with cameras
>
> AFAIK there is still no agreement about how cameras should be
> virtualized, see [3], [7], [8], [9]. virtio-media provides support for
> cameras in a specific way, which might not be desirable.

There is definitely an agreement on how cameras should work on V4L2 ;
and thanks to that you can operate a camera using virtio-media,
*today*.

I'm sure the virtio-camera specification, driver, and host devices
will be very impressive once they are released ; it's just that I
would enjoy a solution, however imperfect, within my life span.

>
> 4. (minor) is it possible/hard to implement the device in hardware/on a
> micro controller?
>
> This is something I thought about recently, there might be a use-case
> for it in the future. One of the concerns is that dynamic memory
> allocations are IMHO inevitable in virtio-media or virtio-video up to
> draft v8. I think multiple virtqueues in virtio-video draft v9 would
> help here. Not sure yet...

V4L2's MMAP buffer type has that covered.

>
> There are also other minor concerns, that are probably tolerable.
>
> [1]
> https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.idea=
sonboard.com/
> [2] Page 6 in
> https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hsia-Jun%20Li%20-%20=
V4L2%20M2M%20EXT%20API%20enhancement.pdf
> [3] https://old.linaro.org/blog/the-challenges-of-abstracting-virtio/
> [4]
> https://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@=
xs4all.nl/
> [5]
> https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.i=
nfo/
> [6]
> https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillo=
n@collabora.com/
> [7] https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/
> [8]
> https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@=
xs4all.nl/
> [9]
> https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9=
ddZxVNvNS3ArA@mail.gmail.com/
>
> --
> Alexander Gordeev
> Senior Software Engineer
>
> OpenSynergy GmbH
> Rotherstr. 20, 10245 Berlin
> www.opensynergy.com

