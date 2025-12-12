Return-Path: <linux-media+bounces-48729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4793CBA0AF
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 00:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C27D730CFA85
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 23:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1DB30FC22;
	Fri, 12 Dec 2025 23:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bbYUcLtU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580272D979F
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 23:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765581328; cv=none; b=FXg9qK8uCQZKGeo3iK0xaIlK75zDyke9hk7q9JV7KsPG76EoXrSeZdnOsh0z5w2Qc/QxmeCbLEoylRvLuzzvIFemtvABUcDWv5niu5tIXh1rj4QleXBSJrR0ienM9M0VCEpnDDXUkL91mJoxvQJ+X+18FTgwXl9MIuLGLidGVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765581328; c=relaxed/simple;
	bh=17wosSqZj5p71aiQjaFZiQPcALe3Ajm811gwDBtrsBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=om832flqT6JE1PHj6MkhP/Mu60w2m8KdOf3JRxqhPGMaOA9aGnZnJHiiEN3Y4BniAVHw8pQ8EuTku/Fpx0LBbfC2MSrnOBlcWNADFJUaUOzFFy+1nEXjkOVGsLnjWQg7ctb+rnoZQ6hKNHp15QVAt3D2nHG9zP2YR9AlJ2O4JdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bbYUcLtU; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ed9c19248bso14947621cf.1
        for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 15:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765581324; x=1766186124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yT06XYNAvCFdD62AsetIf+Si5GyylQ2GDn+zCANlZeY=;
        b=bbYUcLtUHN3tzWY8X52Rv5a+CC+UYrAAAS4UD3Zhdfl7zcOaQUUmuMz59twFMEJDCx
         5BwMefHiCHXCGuY8bmkKA/1QZ7P5TBTBt5EeyLFrG2l3kad6XwtVhbSTlU2KONuyJtim
         dGZtz+ZDTGkIAeiT7A1WaA0hAdSDJ5ObSRkEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765581324; x=1766186124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yT06XYNAvCFdD62AsetIf+Si5GyylQ2GDn+zCANlZeY=;
        b=v5EYgjcE5uX4IvED5V2T0AsbvvpZoEJRpDMXhAaqB880CKq0yAtiqY8jRBGuR+/FYJ
         nAHw871dyWMSaYI2kBc7Iqz/N3SPpoYT+xMrYyyZQaCTA83G9eOWIlahBpEbvayAwdOC
         O3ZJaR00zPsMqts3Oy1C81JSqnqV/VtB8AhdfM+bIpx4wPPyqyMwRZlk0PW737ytvkve
         yTuWX/oxvkunwPswzdlucEyGu42wFdjHmTVg8g+4T8CzIihGixwypCJXRp1FYdkPbnOz
         Ea+QNA8HURuNo4I+1VyGgqE1CinMDvVec0TuQIZHX6VEjDaEoFg9ev1T4WmiJcU3LG/W
         rkbA==
X-Forwarded-Encrypted: i=1; AJvYcCUlwnBbVvaVRdo/hpYvUv3HZyg2m6TvvPrSI2jDxnW2qnsMeBtMk69wO8ERRlNpvqVCzXWDiCzi6lwmow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNeRnzXqo1RSer5PTjUqqL3Yk8mBpoJV6gkqk03bR+++Iv8Bz
	KL36eBjG1ABGj2csT15fA9rIvFgT1T2cV60uknXB0dRCvclDL9EKw1B8fKKEh2BKysC6BBvmHMa
	8m5kbTwZGBlCeL/MHb4HZQ41hpkKZ5wyrhuoSPEBM
X-Gm-Gg: AY/fxX454hyzEbDHX1iRTfa9N1ZVeL021S831qyRnSyjPNeD+zrNsaw/tdrgGsWUEI0
	P4PAQL3yJ41GgLZwl89N8zX7mTMul3k1Uox4nW0p5Um1FnnKYB7kh2SN4bIeN+HzNqcTOqCcfRc
	AAEpTgZONd4oZAutZAQlylmQQtj4aQ1lcFhSTXC40xScRSQ/8JwHQBflgdqjD8Z2KVi0xRZFcDh
	kkQH67hyBebFkz9tJKZLyH68c93f8EqapEKUsA4vQrDzAOE6oNDiEhUWZrTaNr79IA7UXpzgL8i
	wYDbSyefkgAGg5fQaa5bWfQ=
X-Google-Smtp-Source: AGHT+IFQinDNPOhcrqbYUUrLXy3kUSlghi+Xm+zImptnONfGcuG/Qzy3NYJHLbufmRVBipzjG3ZOg7cJo8UWFGjvsUE=
X-Received: by 2002:a05:622a:4acb:b0:4ee:5aa:9c2c with SMTP id
 d75a77b69052e-4f1d0463ba1mr50927831cf.8.1765581324138; Fri, 12 Dec 2025
 15:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
 <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org> <5d367bbb-551f-4164-8473-a6c4b68793c0@kernel.org>
In-Reply-To: <5d367bbb-551f-4164-8473-a6c4b68793c0@kernel.org>
From: Hirokazu Honda <hiroh@chromium.org>
Date: Fri, 12 Dec 2025 15:15:13 -0800
X-Gm-Features: AQt7F2q6CoPXJ2cr15n1LwNAe2LKr6p1XHmaKwezOCUGd4mmlFf2VO3h1Dk6tqY
Message-ID: <CAO5uPHPKLxySgwWUi6w0Nm-PbDSPkN=OySbLK8wNKwXdp3p1Rg@mail.gmail.com>
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, 
	Boris Brezillon <bbrezillon@collabora.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Hans for your quick response.
And I apologize for my late reply.

> So that's were I am: I'm not opposed to supporting this feature, but I
> feel that struct v4l2_buffer has reached end-of-life, and that it is
> time for a modern replacement.

I got it.
I will discuss in my team if I can contribute to v4l2_buffer_ext work
or sponsor that work next year or in 2027.

Regards,
-Hiro
On Wed, Dec 3, 2025 at 12:28=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> Hi Hiro,
>
> For those who are interested, the original thread is here:
>
> https://lore.kernel.org/linux-media/20220322132329.6527-1-dmitry.osipenko=
@collabora.com/
>
> On 02/12/2025 21:07, Hirokazu Honda wrote:
> > Hi all,
> >
> > How does the community think about this change these days?
> > This unblocks using a frame whose planes are actually in the
> > same dma buffer with multi-planar format in CAPTURE queue whose
> > memory type is DMABUF in decoding.
> > I agree that the v4l2_buffer_ext API is a right way to support it,
> > but we haven't achieved the new API support for about 5 years, and
> > not sure if we will do in the near future.
> >
> > Could the community elaborate merging this change?
>
> As I mentioned back in 2022, I am very hesitant to fiddle with data_offse=
t.
> It was a bad idea that should never have been implemented in hindsight.
>
> The reason that the v4l2_buffer_ext API was never pursued is that nobody
> was sufficiently motivated to keep working on it and keep pushing for it.
> It is not because it was a bad idea.
>
> I keep hoping that someone will revisit it and start working on it again.
> The current API is old and awkward to use for multiplanar buffers. And it
> is missing features that would be nice to add.
>
> Dmitry's last post [1] in the thread back in 2022 was interesting, both h=
is
> comments on whether the new ioctls would actually be needed, and his prop=
osal
> for adding a new buf_offset field to struct v4l2_plane.
>
> That said, I still think a new v4l2_buffer_ext struct would be really nic=
e.
> The old v4l2_buffer is inefficient (complex compat32 and Y2038 handling,
> almost out of reserved fields, useless timecode struct, awkward to work
> with multiple planes), so even without adding new fields there is a lot
> that can be improved here.
>
> The problem with adding a field to v4l2_plane only is that it limits
> support to multiplanar drivers. It's probably possible to hack it in
> struct v4l2_buffer as well, but that's just piling more crap into an
> already crappy struct.
>
> So that's were I am: I'm not opposed to supporting this feature, but I
> feel that struct v4l2_buffer has reached end-of-life, and that it is
> time for a modern replacement.
>
> Other may disagree, I'm happy to hear arguments for that.
>
> Regards,
>
>         Hans
>
> [1] https://lore.kernel.org/linux-media/f66a02b6-5e2d-5e28-8c92-0a76d5326=
9f7@collabora.com/
>
> >
> > Best Regards,
> > -Hiro
> >
> > On 2022/03/22 =E5=8D=88=E5=89=8D6:23, Dmitry Osipenko wrote:
> >> Use data offsets provided by applications for multi-planar capture
> >> buffers. This allows V4L to import and use dma-bufs exported by other
> >> subsystems in cases where application wants to customize data offsets
> >> of capture buffers in order to meet hardware alignment requirements of
> >> both dma-buf exporter and importer.
> >>
> >> This feature is wanted for providing a better support of media hardwar=
e
> >> found on Chromebooks. In particular display and camera ISP hardware of
> >> Rockchip and MediaTek SoCs require special handling by userspace becau=
se
> >> display h/w has specific alignment requirements that don't match defau=
lt
> >> alignments expected by V4L and there is a need to customize the data
> >> offsets in case of multi-planar formats.
> >>
> >> Some drivers already have preliminary support for data offsets
> >> customization of capture buffers, like NVIDIA Tegra video decoder driv=
er
> >> for example, and V4L allows applications to provide data offsets for
> >> multi-planar output buffers, let's support such customization for the
> >> capture buffers as well.
> >>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> ---
> >>   Documentation/userspace-api/media/v4l/buffer.rst | 9 ++++++++-
> >>   drivers/media/common/videobuf2/videobuf2-v4l2.c  | 7 +++++++
> >>   2 files changed, 15 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Docume=
ntation/userspace-api/media/v4l/buffer.rst
> >> index 4638ec64db00..75b1929e2acb 100644
> >> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> >> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> >> @@ -369,13 +369,20 @@ struct v4l2_plane
> >>         - ``data_offset``
> >>         - Offset in bytes to video data in the plane. Drivers must set=
 this
> >>      field when ``type`` refers to a capture stream, applications when
> >> -    it refers to an output stream.
> >> +    it refers to an output or capture stream.
> >>
> >>      .. note::
> >>
> >>         That data_offset is included  in ``bytesused``. So the
> >>         size of the image in the plane is ``bytesused``-``data_offset`=
`
> >>         at offset ``data_offset`` from the start of the plane.
> >> +
> >> +       For capture planes data_offset may be specified by application=
s
> >> +       and by drivers. Driver may override application's offset or er=
ror
> >> +       out buffer if offset can't be satisfied by hardware. This allo=
ws
> >> +       applications to customize data offsets of imported dma-bufs.
> >> +       Handling of application's offsets is driver-dependent, applica=
tion
> >> +       must use the resulting buffer offset.
> >>       * - __u32
> >>         - ``reserved[11]``
> >>         - Reserved for future use. Should be zeroed by drivers and
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers=
/media/common/videobuf2/videobuf2-v4l2.c
> >> index 6edf4508c636..929107a431cc 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >> @@ -263,6 +263,13 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_bu=
ffer *vb, struct v4l2_buffer *b
> >>                                              psrc->bytesused : pdst->l=
ength;
> >>                              pdst->data_offset =3D psrc->data_offset;
> >>                      }
> >> +            } else {
> >> +                    for (plane =3D 0; plane < vb->num_planes; ++plane=
) {
> >> +                            struct vb2_plane *pdst =3D &planes[plane]=
;
> >> +                            struct v4l2_plane *psrc =3D &b->m.planes[=
plane];
> >> +
> >> +                            pdst->data_offset =3D psrc->data_offset;
> >> +                    }
> >>              }
> >>      } else {
> >>              /*
>

