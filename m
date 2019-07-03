Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A06515E081
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 11:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfGCJIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 05:08:25 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43363 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbfGCJIZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 05:08:25 -0400
Received: by mail-ed1-f67.google.com with SMTP id e3so1298454edr.10
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+njBmt5u39Z52isRPZqWyrlnKEOVRBmc1tIwuKRg8RY=;
        b=mRvc+FTf3hdCSxgvJnHM9UTrVktwXhPqu5ZJyY+ZpV3hl4g+Iut5FarQiCf7ISH1l2
         toePwMe7tyIZHf06N2++eNTTc2BT1/VmfvCv/Es2muOoz3Qu7hek54uxekkV5P7o4Hly
         GKP9kiRGuTjGHRQqFJDlMFnECYPcE3qDL8d50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+njBmt5u39Z52isRPZqWyrlnKEOVRBmc1tIwuKRg8RY=;
        b=k8AMON7tjVqAVAs1X5s7DK5MLvjMbftUqMisbvCDoDs/x0fIkK23kxxwW0FBmfwNUR
         8TFtx2yjDBH8p8p+HdAnUmF5c5kpk8SdcebsaXaeORVyxa6rzxcWDBumh+LFOS7b7AaR
         RWAAHe1cstC54l4lojo9stjWdAuhoI9AdeEn9NHhsL2Pph8YYBzc9Ml1YuzA7jX05kaB
         Nj9O58OrYPqzGySthfkwrR0dm6IayfruVLqOp+uS0nEIVvLTaASv04sJoFa2N/EVOT5z
         MI7q1u1U/iN43vKnpP/wbdMbGPwJocOE2jzPOoejqRu3j/PV9ohiZyabJuGkY+6o8zK2
         Py0g==
X-Gm-Message-State: APjAAAWgwpjIgu5ZKUbWOrjvR2T6i6Ip+wIcXq+/wjm330HWExRElmZD
        dRLvccfHffHxLwOEwHx/mzPD1tc8PEIQHA==
X-Google-Smtp-Source: APXvYqznZc9uJIJPxrsdJiyDGjdDrP+GdglgiIS3WEJ5ItuBRepS+dsOuqp+1d0cMhIIEvoBzPINnQ==
X-Received: by 2002:aa7:ca45:: with SMTP id j5mr40596966edt.217.1562144902837;
        Wed, 03 Jul 2019 02:08:22 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id i26sm341968eja.14.2019.07.03.02.08.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 02:08:22 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id p11so1861726wro.5
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 02:08:21 -0700 (PDT)
X-Received: by 2002:adf:ed41:: with SMTP id u1mr26548205wro.162.1562144901629;
 Wed, 03 Jul 2019 02:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
 <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com> <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl>
 <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl> <4e711a70-ef25-b9f2-e27a-ae6c80288388@xs4all.nl>
 <ddacf8a1-61c4-bc04-8c52-cd56dfd13842@samsung.com> <20190607135815.GN7593@pendragon.ideasonboard.com>
 <675dc8c2985754f6c72c06ec36a00ebca4f49fc8.camel@ndufresne.ca>
 <20190611102410.GD5016@pendragon.ideasonboard.com> <af1a05ba549c82a672718821282fd5af4e560f5c.camel@ndufresne.ca>
 <20190612081746.GB5035@pendragon.ideasonboard.com> <90c39a342ad8832546b12b522663732760b80cf4.camel@ndufresne.ca>
In-Reply-To: <90c39a342ad8832546b12b522663732760b80cf4.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 3 Jul 2019 18:08:10 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C32BqMakxJTHENiAcSyrt6qdczsKjzx70A-G=TveXwkg@mail.gmail.com>
Message-ID: <CAAFQd5C32BqMakxJTHENiAcSyrt6qdczsKjzx70A-G=TveXwkg@mail.gmail.com>
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR memory
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 13, 2019 at 9:21 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le mercredi 12 juin 2019 =C3=A0 11:17 +0300, Laurent Pinchart a =C3=A9cri=
t :
> > Hi Nicolas,
> >
> > On Tue, Jun 11, 2019 at 08:09:13PM -0400, Nicolas Dufresne wrote:
> > > Le mardi 11 juin 2019 =C3=A0 13:24 +0300, Laurent Pinchart a =C3=A9cr=
it :
> > > > On Fri, Jun 07, 2019 at 03:38:39PM -0400, Nicolas Dufresne wrote:
> > > > > Le vendredi 07 juin 2019 =C3=A0 16:58 +0300, Laurent Pinchart a =
=C3=A9crit :
> > > > > > On Fri, Jun 07, 2019 at 03:55:05PM +0200, Marek Szyprowski wrot=
e:
> > > > > > > On 2019-06-07 15:40, Hans Verkuil wrote:
> > > > > > > > On 6/7/19 2:47 PM, Hans Verkuil wrote:
> > > > > > > > > On 6/7/19 2:23 PM, Hans Verkuil wrote:
> > > > > > > > > > On 6/7/19 2:14 PM, Marek Szyprowski wrote:
> > > > > > > > > > > On 2019-06-07 14:01, Hans Verkuil wrote:
> > > > > > > > > > > > On 6/7/19 1:16 PM, Laurent Pinchart wrote:
> > > > > > > > > > > > > Thank you for the patch.
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Ve=
rkuil wrote:
> > > > > > > > > > > > > > The __prepare_userptr() function made the incor=
rect assumption that if the
> > > > > > > > > > > > > > same user pointer was used as the last one for =
which memory was acquired, then
> > > > > > > > > > > > > > there was no need to re-acquire the memory. Thi=
s assumption was never properly
> > > > > > > > > > > > > > tested, and after doing that it became clear th=
at this was in fact wrong.
> > > > > > > > > > > > > Could you explain in the commit message why the a=
ssumption is not
> > > > > > > > > > > > > correct ?
> > > > > > > > > > > > You can free the memory, then allocate it again and=
 you can get the same pointer,
> > > > > > > > > > > > even though it is not necessarily using the same ph=
ysical pages for the memory
> > > > > > > > > > > > that the kernel is still using for it.
> > > > > > > > > > > >
> > > > > > > > > > > > Worse, you can free the memory, then allocate only =
half the memory you need and
> > > > > > > > > > > > get back the same pointer. vb2 wouldn't notice this=
. And it seems to work (since
> > > > > > > > > > > > the original mapping still remains), but this can c=
orrupt userspace memory
> > > > > > > > > > > > causing the application to crash. It's not quite cl=
ear to me how the memory can
> > > > > > > > > > > > get corrupted. I don't know enough of those low-lev=
el mm internals to understand
> > > > > > > > > > > > the sequence of events.
> > > > > > > > > > > >
> > > > > > > > > > > > I have test code for v4l2-compliance available if s=
omeone wants to test this.
> > > > > > > > > > > I'm interested, I would really like to know what happ=
ens in the mm
> > > > > > > > > > > subsystem in such case.
> > > > > > > > > > Here it is:
> > > > > > > > > >
> > > > > > > > > > diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cp=
p b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > > > > > index be606e48..9abf41da 100644
> > > > > > > > > > --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > > > > > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > > > > > @@ -797,7 +797,7 @@ int testReadWrite(struct node *node=
)
> > > > > > > > > >       return 0;
> > > > > > > > > >   }
> > > > > > > > > >
> > > > > > > > > > -static int captureBufs(struct node *node, const cv4l_q=
ueue &q,
> > > > > > > > > > +static int captureBufs(struct node *node, cv4l_queue &=
q,
> > > > > > > > > >               const cv4l_queue &m2m_q, unsigned frame_c=
ount, int pollmode,
> > > > > > > > > >               unsigned &capture_count)
> > > > > > > > > >   {
> > > > > > > > > > @@ -962,6 +962,21 @@ static int captureBufs(struct node=
 *node, const cv4l_queue &q,
> > > > > > > > > >                               buf.s_flags(V4L2_BUF_FLAG=
_REQUEST_FD);
> > > > > > > > > >                               buf.s_request_fd(buf_req_=
fds[req_idx]);
> > > > > > > > > >                       }
> > > > > > > > > > +                     if (v4l_type_is_capture(buf.g_typ=
e()) && q.g_memory() =3D=3D V4L2_MEMORY_USERPTR) {
> > > > > > > > > > +                             printf("\nidx: %d", buf.g=
_index());
> > > > > > > > > > +                             for (unsigned p =3D 0; p =
< q.g_num_planes(); p++) {
> > > > > > > > > > +                                     printf(" old buf[=
%d]: %p ", p, buf.g_userptr(p));
> > > > > > > > > > +                                     fflush(stdout);
> > > > > > > > > > +                                     free(buf.g_userpt=
r(p));
> > > > > > > > > > +                                     void *m =3D callo=
c(1, q.g_length(p)/2);
> > > > > > > > > > +
> > > > > > > > > > +                                     fail_on_test(m =
=3D=3D NULL);
> > > > > > > > > > +                                     q.s_userptr(buf.g=
_index(), p, m);
> > > > > > > > > > +                                     printf("new buf[%=
d]: %p", p, m);
> > > > > > > > > > +                                     buf.s_userptr(m, =
p);
> > > > > > > > > > +                             }
> > > > > > > > > > +                             printf("\n");
> > > > > > > > > > +                     }
> > > > > > > > > >                       fail_on_test(buf.qbuf(node, q));
> > > > > > > > > >                       fail_on_test(buf.g_flags() & V4L2=
_BUF_FLAG_DONE);
> > > > > > > > > >                       if (buf.g_flags() & V4L2_BUF_FLAG=
_REQUEST_FD) {
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Load the vivid driver and just run 'v4l2-compliance -s1=
0' and you'll see:
> > > > > > > > > >
> > > > > > > > > > ...
> > > > > > > > > > Streaming ioctls:
> > > > > > > > > >          test read/write: OK
> > > > > > > > > >          test blocking wait: OK
> > > > > > > > > >          test MMAP (no poll): OK
> > > > > > > > > >          test MMAP (select): OK
> > > > > > > > > >          test MMAP (epoll): OK
> > > > > > > > > >          Video Capture: Frame #000
> > > > > > > > > > idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6e=
b4010
> > > > > > > > > >          Video Capture: Frame #001
> > > > > > > > > > idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e=
7b010
> > > > > > > > > >          Video Capture: Frame #002
> > > > > > > > > > idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid point=
er
> > > > > > > > > > Aborted
> > > > > > > > > To clarify: two full size buffers are allocated and queue=
d (that happens in setupUserPtr()),
> > > > > > > > > then streaming starts and captureBufs is called which bas=
ically just calls dqbuf
> > > > > > > > > and qbuf.
> > > > > > > > >
> > > > > > > > > Tomasz pointed out that all the pointers in this log are =
actually different. That's
> > > > > > > > > correct, but here is a log where the old and new buf ptr =
are the same:
> > > > > > > > >
> > > > > > > > > Streaming ioctls:
> > > > > > > > >          test read/write: OK
> > > > > > > > >          test blocking wait: OK
> > > > > > > > >          test MMAP (no poll): OK
> > > > > > > > >          test MMAP (select): OK
> > > > > > > > >          test MMAP (epoll): OK
> > > > > > > > >          Video Capture: Frame #000
> > > > > > > > > idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e=
010
> > > > > > > > >          Video Capture: Frame #001
> > > > > > > > > idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15=
010
> > > > > > > > >          Video Capture: Frame #002
> > > > > > > > > idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e=
010
> > > > > > > > >          Video Capture: Frame #003
> > > > > > > > > idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
> > > > > > > > > Aborted
> > > > > > > > >
> > > > > > > > > It's weird that the first log fails that way: if the poin=
ters are different,
> > > > > > > > > then vb2 will call get_userptr and it should discover tha=
t the buffer isn't
> > > > > > > > > large enough, causing qbuf to fail. That doesn't seem to =
happen.
> > > > > > > > I think that the reason for this corruption is that the mem=
ory pool used
> > > > > > > > by glibc is now large enough for vb2 to think it can map th=
e full length
> > > > > > > > of the user pointer into memory, even though only the first=
 half is actually
> > > > > > > > from the buffer that's allocated. When you capture a frame =
you just overwrite
> > > > > > > > a random part of the application's memory pool, causing thi=
s invalid pointer.
> > > > > > > >
> > > > > > > > But that's a matter of garbage in, garbage out. So that's n=
ot the issue here.
> > > > > > > >
> > > > > > > > The real question is what happens when you free the old buf=
fer, allocate a
> > > > > > > > new buffer, end up with the same userptr, but it's using on=
e or more different
> > > > > > > > pages for its memory compared to the mapping that the kerne=
l uses.
> > > > > > > >
> > > > > > > > I managed to reproduce this with v4l2-ctl:
> > > > > > > >
> > > > > > > > diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/=
v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > > > > > index 28b2b3b9..8f2ed9b5 100644
> > > > > > > > --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > > > > > +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > > > > > @@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd=
, cv4l_queue &q, FILE *fout, int *index,
> > > > > > > >                    * has the size that fits the old resolut=
ion and might not
> > > > > > > >                    * fit to the new one.
> > > > > > > >                    */
> > > > > > > > +         if (q.g_memory() =3D=3D V4L2_MEMORY_USERPTR) {
> > > > > > > > +                 printf("\nidx: %d", buf.g_index());
> > > > > > > > +                 for (unsigned p =3D 0; p < q.g_num_planes=
(); p++) {
> > > > > > > > +                         unsigned *pb =3D (unsigned *)buf.=
g_userptr(p);
> > > > > > > > +                         printf(" old buf[%d]: %p first pi=
xel: 0x%x", p, buf.g_userptr(p), *pb);
> > > > > > > > +                         fflush(stdout);
> > > > > > > > +                         free(buf.g_userptr(p));
> > > > > > > > +                         void *m =3D calloc(1, q.g_length(=
p));
> > > > > > > > +
> > > > > > > > +                         if (m =3D=3D NULL)
> > > > > > > > +                                 return QUEUE_ERROR;
> > > > > > > > +                         q.s_userptr(buf.g_index(), p, m);
> > > > > > > > +                         if (m =3D=3D buf.g_userptr(p))
> > > > > > > > +                                 printf(" identical new bu=
f");
> > > > > > > > +                         buf.s_userptr(m, p);
> > > > > > > > +                 }
> > > > > > > > +                 printf("\n");
> > > > > > > > +         }
> > > > > > > >                   if (fd.qbuf(buf) && errno !=3D EINVAL) {
> > > > > > > >                           fprintf(stderr, "%s: qbuf error\n=
", __func__);
> > > > > > > >                           return QUEUE_ERROR;
> > > > > > > >
> > > > > > > >
> > > > > > > > Load vivid, setup a pure white test pattern:
> > > > > > > >
> > > > > > > > v4l2-ctl -c test_pattern=3D6
> > > > > > > >
> > > > > > > > Now run v4l2-ctl --stream-user and you'll see:
> > > > > > > >
> > > > > > > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea i=
dentical new buf
> > > > > > > > <
> > > > > > > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea i=
dentical new buf
> > > > > > > > <
> > > > > > > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea i=
dentical new buf
> > > > > > > > <
> > > > > > > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea i=
dentical new buf
> > > > > > > > <
> > > > > > > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identica=
l new buf
> > > > > > > > <
> > > > > > > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identica=
l new buf
> > > > > > > > < 5.00 fps
> > > > > > > >
> > > > > > > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identica=
l new buf
> > > > > > > > <
> > > > > > > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identica=
l new buf
> > > > > > > >
> > > > > > > > The first four dequeued buffers are filled with data, after=
 that the
> > > > > > > > returned buffer is empty because vivid is actually writing =
to different
> > > > > > > > memory pages.
> > > > > > > >
> > > > > > > > With this patch the first pixel is always non-zero.
> > > > > > >
> > > > > > > Good catch. The question is weather we treat that as undefine=
d behavior
> > > > > > > and keep the optimization for 'good applications' or assume t=
hat every
> > > > > > > broken userspace code has to be properly handled.
> > > > > >
> > > > > > Given how long we've been saying that USERPTR should be replace=
d by
> > > > > > DMABUF, I would consider that any userspace code using USERPTR =
is broken
> > > > > > :-) One could however question whether we were effective at get=
ting that
> > > > > > message across...
> > > > >
> > > > > Just a reminder that DMABuf is not a replacement for USERPTR. It =
only
> > > > > cover a subset in absence of an allocater for it. There is no cle=
an way
> > > > > to allocate a DMAbuf. Notably, memfds (which could have filled th=
e gap)
> > > > > are not DMABuf, even though they are they are similar to the buff=
ers
> > > > > allocated by vivid or uvcvideo.
> > > >
> > > > You always have the option to use MMAP to allocate buffers on the V=
4L2
> > > > device. What prevents you from doing so and forces usage of USERPTR=
 ?
> > >
> > > If you use MMAP on one v4l2 device, how do you import that into anoth=
er
> > > v4l2 device ?
> >
> > You can simply export the MMAP buffers on the V4L2 device that has
> > allocated them, and use DMABUF on the importing device.
> >
> > > Now, let's say your source is not a v4l2 device, and uses virtual
> > > memory, how does DMABuf replaces such a use case if you want to avoid
> > > copies and you know your HW can support fast usage of these randomly
> > > allocated buffers ?
> >
> > For this use case you should allocate buffers on the sink, mmap them,
> > and use the mapped memory on the source side. I agree that not all
> > sources may support this mode of operation, but that's a design issue
> > with the source. If we had a dmabuf allocator your problem wouldn't be
> > solved, as the source would still need to be modified to use it.
>
> I don't think any of this reflection covers the surface of the
> restrictions that V4L2 combined queue/allocation impose on userspace.
> One of our very common scenarios requires to capture from one source,
> and zero-copy that toward multiple sink. One source could be USB driven
> (non v4l2), or network socket. Allocating from one random sink isn't
> really working, in fact it would lead to ebusy prior to the orphaning
> mechanism that was added recently. Since as long as one buffer of a
> device is still active, the driver (and the HW behind) cannot be used
> anymore.
>
> Over your N sinks, you maybe have zero-copy for some of them, even if
> it's foreign allocation, while others will just fallback to mmap/copy,
> and that's could be all right for a specific application. But as the
> source does not always have a "dmabuf", USERPTR remains the only option
> one could try. I don't know how memfd works, but maybe memfd should be
> a memory type in replacement to USERPTR ? I'm really not sure what the
> replacement, but I'm quite clear that there is no zero-copy replacement
> for it atm.

We have udmabuf now:
https://elixir.bootlin.com/linux/v5.2-rc7/source/drivers/dma-buf/udmabuf.c
