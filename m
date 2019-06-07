Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75CAE395E3
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 21:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbfFGTip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 15:38:45 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36468 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729809AbfFGTip (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 15:38:45 -0400
Received: by mail-qt1-f196.google.com with SMTP id u12so3660114qth.3
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=y/She4vyCCpmb6c/GUFG7u4My6gP73rZiDX6zsfDPsI=;
        b=M161iYvdQQE+VGzQs4rv/EryJEpF/vDlvgc1lFlCZ7Mheli/GVbTe3o1w1+9c8bXcp
         sYTN7Y/2NBAvvBYnQdVqsg+AXNuXyunezqVN69FyyJMd2drA3ycfKZWLY+O5IBAWOnd+
         vSlWO90V2ny2yf2WxrhEJf9wxFL13TAP9nzJzX5m5RA5vqYdpUKUgQc5ulnb2VItJnw6
         yttsht+6xSbYw27j8hPdlh8BRa3VRndYHXbddL9++AI71FhaFG6IVDmsklM2muFhfly7
         wFX4lwDzWvAr5eUyqt0yvGp6WFAh5xpuGQnTE9jPos9K7Z+s3A2XCuChrwhgIkmmbucz
         4v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=y/She4vyCCpmb6c/GUFG7u4My6gP73rZiDX6zsfDPsI=;
        b=JKDowmVaCg5j+iilhIayQLIEWhfMNA2J3mVRbEoyOj2ftUZpBqPENN9rsWn+m5DVBo
         ShMuVFJNsOKNe/RjHW8HWJ6FSQOKY5MeMlclQkO5TFQYj9gMSkSq2aQ5+eXDi1DlurDh
         IUfeXraXS0RL1RKp8PvfQN3vvHxZfHZg+5fh6b0qcznq0dKA5GEhSSqyb1yRGbq1YUIk
         r1lInRYlEnyoqTxpJgw+VJcQoAz3+a5+KU+2aeNjn9qXtNiUag+ojWW2Un54UWUyBRqD
         CJq7gwxOEm9cNXe4tv93fWb1FYSA10rK5DSHfQs7VcG0gVRtxYyDEGVuwpEPmwHxFnP0
         +mEw==
X-Gm-Message-State: APjAAAVpgm/WLgMxBVVe0pc6I4vBvExFprn3bcqYAFUE/bXS08UVbDmU
        WlwZHMo0uGgS8dzVkB0iB33tXg==
X-Google-Smtp-Source: APXvYqz0DH5KEzPuGagnEjNQmqY6lpWPF0dUQ7jdvCDIXVRF0nc60DpLzy5Dyx/GhK6CRe3rF7CBEQ==
X-Received: by 2002:a0c:989d:: with SMTP id f29mr26796269qvd.209.1559936323784;
        Fri, 07 Jun 2019 12:38:43 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id z64sm1484128qke.35.2019.06.07.12.38.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 12:38:42 -0700 (PDT)
Message-ID: <675dc8c2985754f6c72c06ec36a00ebca4f49fc8.camel@ndufresne.ca>
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Fri, 07 Jun 2019 15:38:39 -0400
In-Reply-To: <20190607135815.GN7593@pendragon.ideasonboard.com>
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
         <20190607111634.GA7593@pendragon.ideasonboard.com>
         <CGME20190607120150epcas3p34178a04f712c89b013a263264cf2184f@epcas3p3.samsung.com>
         <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
         <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com>
         <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl>
         <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl>
         <4e711a70-ef25-b9f2-e27a-ae6c80288388@xs4all.nl>
         <ddacf8a1-61c4-bc04-8c52-cd56dfd13842@samsung.com>
         <20190607135815.GN7593@pendragon.ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-SLXXE5xDjBC6QBGOPUKR"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-SLXXE5xDjBC6QBGOPUKR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 07 juin 2019 =C3=A0 16:58 +0300, Laurent Pinchart a =C3=A9crit =
:
> Hi Marek,
>=20
> On Fri, Jun 07, 2019 at 03:55:05PM +0200, Marek Szyprowski wrote:
> > On 2019-06-07 15:40, Hans Verkuil wrote:
> > > On 6/7/19 2:47 PM, Hans Verkuil wrote:
> > > > On 6/7/19 2:23 PM, Hans Verkuil wrote:
> > > > > On 6/7/19 2:14 PM, Marek Szyprowski wrote:
> > > > > > On 2019-06-07 14:01, Hans Verkuil wrote:
> > > > > > > On 6/7/19 1:16 PM, Laurent Pinchart wrote:
> > > > > > > > Thank you for the patch.
> > > > > > > >=20
> > > > > > > > On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrot=
e:
> > > > > > > > > The __prepare_userptr() function made the incorrect assum=
ption that if the
> > > > > > > > > same user pointer was used as the last one for which memo=
ry was acquired, then
> > > > > > > > > there was no need to re-acquire the memory. This assumpti=
on was never properly
> > > > > > > > > tested, and after doing that it became clear that this wa=
s in fact wrong.
> > > > > > > > Could you explain in the commit message why the assumption =
is not
> > > > > > > > correct ?
> > > > > > > You can free the memory, then allocate it again and you can g=
et the same pointer,
> > > > > > > even though it is not necessarily using the same physical pag=
es for the memory
> > > > > > > that the kernel is still using for it.
> > > > > > >=20
> > > > > > > Worse, you can free the memory, then allocate only half the m=
emory you need and
> > > > > > > get back the same pointer. vb2 wouldn't notice this. And it s=
eems to work (since
> > > > > > > the original mapping still remains), but this can corrupt use=
rspace memory
> > > > > > > causing the application to crash. It's not quite clear to me =
how the memory can
> > > > > > > get corrupted. I don't know enough of those low-level mm inte=
rnals to understand
> > > > > > > the sequence of events.
> > > > > > >=20
> > > > > > > I have test code for v4l2-compliance available if someone wan=
ts to test this.
> > > > > > I'm interested, I would really like to know what happens in the=
 mm
> > > > > > subsystem in such case.
> > > > > Here it is:
> > > > >=20
> > > > > diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/=
v4l2-compliance/v4l2-test-buffers.cpp
> > > > > index be606e48..9abf41da 100644
> > > > > --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
> > > > >   	return 0;
> > > > >   }
> > > > >=20
> > > > > -static int captureBufs(struct node *node, const cv4l_queue &q,
> > > > > +static int captureBufs(struct node *node, cv4l_queue &q,
> > > > >   		const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
> > > > >   		unsigned &capture_count)
> > > > >   {
> > > > > @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, co=
nst cv4l_queue &q,
> > > > >   				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
> > > > >   				buf.s_request_fd(buf_req_fds[req_idx]);
> > > > >   			}
> > > > > +			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() =3D=3D =
V4L2_MEMORY_USERPTR) {
> > > > > +				printf("\nidx: %d", buf.g_index());
> > > > > +				for (unsigned p =3D 0; p < q.g_num_planes(); p++) {
> > > > > +					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
> > > > > +					fflush(stdout);
> > > > > +					free(buf.g_userptr(p));
> > > > > +					void *m =3D calloc(1, q.g_length(p)/2);
> > > > > +
> > > > > +					fail_on_test(m =3D=3D NULL);
> > > > > +					q.s_userptr(buf.g_index(), p, m);
> > > > > +					printf("new buf[%d]: %p", p, m);
> > > > > +					buf.s_userptr(m, p);
> > > > > +				}
> > > > > +				printf("\n");
> > > > > +			}
> > > > >   			fail_on_test(buf.qbuf(node, q));
> > > > >   			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
> > > > >   			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > Load the vivid driver and just run 'v4l2-compliance -s10' and you=
'll see:
> > > > >=20
> > > > > ...
> > > > > Streaming ioctls:
> > > > >          test read/write: OK
> > > > >          test blocking wait: OK
> > > > >          test MMAP (no poll): OK
> > > > >          test MMAP (select): OK
> > > > >          test MMAP (epoll): OK
> > > > >          Video Capture: Frame #000
> > > > > idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
> > > > >          Video Capture: Frame #001
> > > > > idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
> > > > >          Video Capture: Frame #002
> > > > > idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
> > > > > Aborted
> > > > To clarify: two full size buffers are allocated and queued (that ha=
ppens in setupUserPtr()),
> > > > then streaming starts and captureBufs is called which basically jus=
t calls dqbuf
> > > > and qbuf.
> > > >=20
> > > > Tomasz pointed out that all the pointers in this log are actually d=
ifferent. That's
> > > > correct, but here is a log where the old and new buf ptr are the sa=
me:
> > > >=20
> > > > Streaming ioctls:
> > > >          test read/write: OK
> > > >          test blocking wait: OK
> > > >          test MMAP (no poll): OK
> > > >          test MMAP (select): OK
> > > >          test MMAP (epoll): OK
> > > >          Video Capture: Frame #000
> > > > idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
> > > >          Video Capture: Frame #001
> > > > idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
> > > >          Video Capture: Frame #002
> > > > idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
> > > >          Video Capture: Frame #003
> > > > idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
> > > > Aborted
> > > >=20
> > > > It's weird that the first log fails that way: if the pointers are d=
ifferent,
> > > > then vb2 will call get_userptr and it should discover that the buff=
er isn't
> > > > large enough, causing qbuf to fail. That doesn't seem to happen.
> > > I think that the reason for this corruption is that the memory pool u=
sed
> > > by glibc is now large enough for vb2 to think it can map the full len=
gth
> > > of the user pointer into memory, even though only the first half is a=
ctually
> > > from the buffer that's allocated. When you capture a frame you just o=
verwrite
> > > a random part of the application's memory pool, causing this invalid =
pointer.
> > >=20
> > > But that's a matter of garbage in, garbage out. So that's not the iss=
ue here.
> > >=20
> > > The real question is what happens when you free the old buffer, alloc=
ate a
> > > new buffer, end up with the same userptr, but it's using one or more =
different
> > > pages for its memory compared to the mapping that the kernel uses.
> > >=20
> > > I managed to reproduce this with v4l2-ctl:
> > >=20
> > > diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v=
4l2-ctl-streaming.cpp
> > > index 28b2b3b9..8f2ed9b5 100644
> > > --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > @@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_que=
ue &q, FILE *fout, int *index,
> > >   		 * has the size that fits the old resolution and might not
> > >   		 * fit to the new one.
> > >   		 */
> > > +		if (q.g_memory() =3D=3D V4L2_MEMORY_USERPTR) {
> > > +			printf("\nidx: %d", buf.g_index());
> > > +			for (unsigned p =3D 0; p < q.g_num_planes(); p++) {
> > > +				unsigned *pb =3D (unsigned *)buf.g_userptr(p);
> > > +				printf(" old buf[%d]: %p first pixel: 0x%x", p, buf.g_userptr(p)=
, *pb);
> > > +				fflush(stdout);
> > > +				free(buf.g_userptr(p));
> > > +				void *m =3D calloc(1, q.g_length(p));
> > > +
> > > +				if (m =3D=3D NULL)
> > > +					return QUEUE_ERROR;
> > > +				q.s_userptr(buf.g_index(), p, m);
> > > +				if (m =3D=3D buf.g_userptr(p))
> > > +					printf(" identical new buf");
> > > +				buf.s_userptr(m, p);
> > > +			}
> > > +			printf("\n");
> > > +		}
> > >   		if (fd.qbuf(buf) && errno !=3D EINVAL) {
> > >   			fprintf(stderr, "%s: qbuf error\n", __func__);
> > >   			return QUEUE_ERROR;
> > >=20
> > >=20
> > > Load vivid, setup a pure white test pattern:
> > >=20
> > > v4l2-ctl -c test_pattern=3D6
> > >=20
> > > Now run v4l2-ctl --stream-user and you'll see:
> > >=20
> > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea identical n=
ew buf
> > > <
> > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea identical n=
ew buf
> > > <
> > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea identical n=
ew buf
> > > <
> > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea identical n=
ew buf
> > > <
> > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identical new buf
> > > <
> > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identical new buf
> > > < 5.00 fps
> > >=20
> > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identical new buf
> > > <
> > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identical new buf
> > >=20
> > > The first four dequeued buffers are filled with data, after that the
> > > returned buffer is empty because vivid is actually writing to differe=
nt
> > > memory pages.
> > >=20
> > > With this patch the first pixel is always non-zero.
> >=20
> > Good catch. The question is weather we treat that as undefined behavior=
=20
> > and keep the optimization for 'good applications' or assume that every=
=20
> > broken userspace code has to be properly handled.
>=20
> Given how long we've been saying that USERPTR should be replaced by
> DMABUF, I would consider that any userspace code using USERPTR is broken
> :-) One could however question whether we were effective at getting that
> message across...

Just a reminder that DMABuf is not a replacement for USERPTR. It only
cover a subset in absence of an allocater for it. There is no clean way
to allocate a DMAbuf. Notably, memfds (which could have filled the gap)
are not DMABuf, even though they are they are similar to the buffers
allocated by vivid or uvcvideo.

>=20
> > The good thing is that=20
> > there is still imho no security issue. The physical pages gathered by=
=20
> > vb2 in worst case belongs to noone else (vb2 is their last user, they=
=20
> > are not yet returned to free pages pool).
> >=20
> > > I wonder if it isn't possible to just check the physical address of
> > > the received user pointer with the physical address of the previous
> > > user pointer. Or something like that. I'll dig around a bit more.
> >=20
> > Such check won't be so simple. Pages contiguous in the virtual memory=
=20
> > won't map to pages contiguous in the physical memory, so you would need=
=20
> > to check every single memory page. Make no sense. It is better to=20
> > reacquire buffer on every queue operation. This indeed show how broken=
=20
> > the USERPTR related part of v4l2 API is.

--=-SLXXE5xDjBC6QBGOPUKR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPq9PwAKCRBxUwItrAao
HIFyAJ9aY/t8UQgHH2hdBS2B9Pp1UQSs/wCg1PCbZfPxFXYBRtsyZr+cDbFHo/o=
=/7sF
-----END PGP SIGNATURE-----

--=-SLXXE5xDjBC6QBGOPUKR--

