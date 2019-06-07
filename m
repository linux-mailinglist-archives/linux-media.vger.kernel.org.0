Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEAAC39613
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 21:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbfFGTnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 15:43:11 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43616 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729482AbfFGTnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 15:43:10 -0400
Received: by mail-qk1-f196.google.com with SMTP id m14so1991111qka.10
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 12:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=AWFFSE6EC4yiRlI1GFJrnJbHOlrkXtWkn5pFZPWwJyM=;
        b=0V+gGj/StB/6sBrcgxjjqOyh88ES8tfW0cszKnsJ6AXD3gtKG3DDtjxsqiUFxUHlDq
         VlLjANruELKvEb9YOHKCA5tMGemUdNQ46i6x+e8fwX99uxViYYP9ra8RCrH8oAsYRzJm
         BbLttJ3f9upcco/2Sa8TMaYTNSBlUTHQbsXrhzWTVi4wKz7guQUIjLq4/WHbkrpVDqHh
         1WMGWp3O1YZ/xc/Hp5aQ0nu7uK/f/EXmyEgxnCYr+HF5mQPmsEloivIGiVdpJPsE3k7A
         TigQq2lqhCI8vLHGzviqFIoqqtuSxnTE7JWj/vtOcAa5w7zkUNmOmDeSLE6/h6aBAFby
         gAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=AWFFSE6EC4yiRlI1GFJrnJbHOlrkXtWkn5pFZPWwJyM=;
        b=UMn1V8y+1cVo7zCdpC36lgoKyC75yQNnE5HhrICHpptsKfhXtpS8Rxk7hedyYpdqis
         JglOOyeX31r0H1DJB7xkjaPdz9HjtvV8mcP+5rxmlQx3STNLjKOAJ8os7aff2yRJO3su
         BANSK2iJmWWgJU4NUnlER8kkADZZafu8jsMM50w3klDTydlYEflY8qQP2EpwtKth2s/v
         BmKG5Mw2HTB1nub09o+DI/vKjUd9kaRaNQMUpYo0b2oT0KxTQ0RjM4PvPKnB+zTWA3bn
         0pIh9rLXACdVATEkS+tdIvMqj7ijiJC3OgbSZSR4E0am2CaH0OBzP9RpybE+dK+29DM/
         b4lw==
X-Gm-Message-State: APjAAAWu9sUQXtlb5239UuzybaBKe3bNajp3jDWARjOgmT297UQAGTeP
        vNDuJbrquFW9qFX2LNUtF6Sp+Q==
X-Google-Smtp-Source: APXvYqxJj1YvwwwcMnGxwwkGgwX3mlfLH/R6JJFv9fHOIma6lHTD9/61eu/liDzk7kpbHzxHB5afDg==
X-Received: by 2002:a05:620a:69c:: with SMTP id f28mr26941133qkh.274.1559936584194;
        Fri, 07 Jun 2019 12:43:04 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id s125sm1427826qkc.43.2019.06.07.12.43.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 12:43:03 -0700 (PDT)
Message-ID: <5bc8b7842e16cfc31a2e86befab223b4cb01131b.camel@ndufresne.ca>
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Fri, 07 Jun 2019 15:43:01 -0400
In-Reply-To: <3e0cf83d-1f69-0d71-96b5-339dad660b1d@samsung.com>
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
         <20190607111634.GA7593@pendragon.ideasonboard.com>
         <CGME20190607120150epcas3p34178a04f712c89b013a263264cf2184f@epcas3p3.samsung.com>
         <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
         <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com>
         <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl>
         <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl>
         <4e711a70-ef25-b9f2-e27a-ae6c80288388@xs4all.nl>
         <ddacf8a1-61c4-bc04-8c52-cd56dfd13842@samsung.com>
         <07253fe3-0152-24e1-87f1-ba77d8630a97@xs4all.nl>
         <3e0cf83d-1f69-0d71-96b5-339dad660b1d@samsung.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-MTi6CpW9vlNGygIL9/Zg"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-MTi6CpW9vlNGygIL9/Zg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 07 juin 2019 =C3=A0 16:39 +0200, Marek Szyprowski a =C3=A9crit =
:
> Hi Hans,
>=20
> On 2019-06-07 16:11, Hans Verkuil wrote:
> > On 6/7/19 3:55 PM, Marek Szyprowski wrote:
> > > On 2019-06-07 15:40, Hans Verkuil wrote:
> > > > On 6/7/19 2:47 PM, Hans Verkuil wrote:
> > > > > On 6/7/19 2:23 PM, Hans Verkuil wrote:
> > > > > > On 6/7/19 2:14 PM, Marek Szyprowski wrote:
> > > > > > > On 2019-06-07 14:01, Hans Verkuil wrote:
> > > > > > > > On 6/7/19 1:16 PM, Laurent Pinchart wrote:
> > > > > > > > > Thank you for the patch.
> > > > > > > > >=20
> > > > > > > > > On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wr=
ote:
> > > > > > > > > > The __prepare_userptr() function made the incorrect ass=
umption that if the
> > > > > > > > > > same user pointer was used as the last one for which me=
mory was acquired, then
> > > > > > > > > > there was no need to re-acquire the memory. This assump=
tion was never properly
> > > > > > > > > > tested, and after doing that it became clear that this =
was in fact wrong.
> > > > > > > > > Could you explain in the commit message why the assumptio=
n is not
> > > > > > > > > correct ?
> > > > > > > > You can free the memory, then allocate it again and you can=
 get the same pointer,
> > > > > > > > even though it is not necessarily using the same physical p=
ages for the memory
> > > > > > > > that the kernel is still using for it.
> > > > > > > >=20
> > > > > > > > Worse, you can free the memory, then allocate only half the=
 memory you need and
> > > > > > > > get back the same pointer. vb2 wouldn't notice this. And it=
 seems to work (since
> > > > > > > > the original mapping still remains), but this can corrupt u=
serspace memory
> > > > > > > > causing the application to crash. It's not quite clear to m=
e how the memory can
> > > > > > > > get corrupted. I don't know enough of those low-level mm in=
ternals to understand
> > > > > > > > the sequence of events.
> > > > > > > >=20
> > > > > > > > I have test code for v4l2-compliance available if someone w=
ants to test this.
> > > > > > > I'm interested, I would really like to know what happens in t=
he mm
> > > > > > > subsystem in such case.
> > > > > > Here it is:
> > > > > >=20
> > > > > > diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/util=
s/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > index be606e48..9abf41da 100644
> > > > > > --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
> > > > > >    	return 0;
> > > > > >    }
> > > > > >=20
> > > > > > -static int captureBufs(struct node *node, const cv4l_queue &q,
> > > > > > +static int captureBufs(struct node *node, cv4l_queue &q,
> > > > > >    		const cv4l_queue &m2m_q, unsigned frame_count, int pollmod=
e,
> > > > > >    		unsigned &capture_count)
> > > > > >    {
> > > > > > @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, =
const cv4l_queue &q,
> > > > > >    				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
> > > > > >    				buf.s_request_fd(buf_req_fds[req_idx]);
> > > > > >    			}
> > > > > > +			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() =3D=
=3D V4L2_MEMORY_USERPTR) {
> > > > > > +				printf("\nidx: %d", buf.g_index());
> > > > > > +				for (unsigned p =3D 0; p < q.g_num_planes(); p++) {
> > > > > > +					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
> > > > > > +					fflush(stdout);
> > > > > > +					free(buf.g_userptr(p));
> > > > > > +					void *m =3D calloc(1, q.g_length(p)/2);
> > > > > > +
> > > > > > +					fail_on_test(m =3D=3D NULL);
> > > > > > +					q.s_userptr(buf.g_index(), p, m);
> > > > > > +					printf("new buf[%d]: %p", p, m);
> > > > > > +					buf.s_userptr(m, p);
> > > > > > +				}
> > > > > > +				printf("\n");
> > > > > > +			}
> > > > > >    			fail_on_test(buf.qbuf(node, q));
> > > > > >    			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
> > > > > >    			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > Load the vivid driver and just run 'v4l2-compliance -s10' and y=
ou'll see:
> > > > > >=20
> > > > > > ...
> > > > > > Streaming ioctls:
> > > > > >           test read/write: OK
> > > > > >           test blocking wait: OK
> > > > > >           test MMAP (no poll): OK
> > > > > >           test MMAP (select): OK
> > > > > >           test MMAP (epoll): OK
> > > > > >           Video Capture: Frame #000
> > > > > > idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
> > > > > >           Video Capture: Frame #001
> > > > > > idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
> > > > > >           Video Capture: Frame #002
> > > > > > idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
> > > > > > Aborted
> > > > > To clarify: two full size buffers are allocated and queued (that =
happens in setupUserPtr()),
> > > > > then streaming starts and captureBufs is called which basically j=
ust calls dqbuf
> > > > > and qbuf.
> > > > >=20
> > > > > Tomasz pointed out that all the pointers in this log are actually=
 different. That's
> > > > > correct, but here is a log where the old and new buf ptr are the =
same:
> > > > >=20
> > > > > Streaming ioctls:
> > > > >           test read/write: OK
> > > > >           test blocking wait: OK
> > > > >           test MMAP (no poll): OK
> > > > >           test MMAP (select): OK
> > > > >           test MMAP (epoll): OK
> > > > >           Video Capture: Frame #000
> > > > > idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
> > > > >           Video Capture: Frame #001
> > > > > idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
> > > > >           Video Capture: Frame #002
> > > > > idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
> > > > >           Video Capture: Frame #003
> > > > > idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
> > > > > Aborted
> > > > >=20
> > > > > It's weird that the first log fails that way: if the pointers are=
 different,
> > > > > then vb2 will call get_userptr and it should discover that the bu=
ffer isn't
> > > > > large enough, causing qbuf to fail. That doesn't seem to happen.
> > > > I think that the reason for this corruption is that the memory pool=
 used
> > > > by glibc is now large enough for vb2 to think it can map the full l=
ength
> > > > of the user pointer into memory, even though only the first half is=
 actually
> > > > from the buffer that's allocated. When you capture a frame you just=
 overwrite
> > > > a random part of the application's memory pool, causing this invali=
d pointer.
> > > >=20
> > > > But that's a matter of garbage in, garbage out. So that's not the i=
ssue here.
> > > >=20
> > > > The real question is what happens when you free the old buffer, all=
ocate a
> > > > new buffer, end up with the same userptr, but it's using one or mor=
e different
> > > > pages for its memory compared to the mapping that the kernel uses.
> > > >=20
> > > > I managed to reproduce this with v4l2-ctl:
> > > >=20
> > > > diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl=
/v4l2-ctl-streaming.cpp
> > > > index 28b2b3b9..8f2ed9b5 100644
> > > > --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > @@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_q=
ueue &q, FILE *fout, int *index,
> > > >    		 * has the size that fits the old resolution and might not
> > > >    		 * fit to the new one.
> > > >    		 */
> > > > +		if (q.g_memory() =3D=3D V4L2_MEMORY_USERPTR) {
> > > > +			printf("\nidx: %d", buf.g_index());
> > > > +			for (unsigned p =3D 0; p < q.g_num_planes(); p++) {
> > > > +				unsigned *pb =3D (unsigned *)buf.g_userptr(p);
> > > > +				printf(" old buf[%d]: %p first pixel: 0x%x", p, buf.g_userptr(=
p), *pb);
> > > > +				fflush(stdout);
> > > > +				free(buf.g_userptr(p));
> > > > +				void *m =3D calloc(1, q.g_length(p));
> > > > +
> > > > +				if (m =3D=3D NULL)
> > > > +					return QUEUE_ERROR;
> > > > +				q.s_userptr(buf.g_index(), p, m);
> > > > +				if (m =3D=3D buf.g_userptr(p))
> > > > +					printf(" identical new buf");
> > > > +				buf.s_userptr(m, p);
> > > > +			}
> > > > +			printf("\n");
> > > > +		}
> > > >    		if (fd.qbuf(buf) && errno !=3D EINVAL) {
> > > >    			fprintf(stderr, "%s: qbuf error\n", __func__);
> > > >    			return QUEUE_ERROR;
> > > >=20
> > > >=20
> > > > Load vivid, setup a pure white test pattern:
> > > >=20
> > > > v4l2-ctl -c test_pattern=3D6
> > > >=20
> > > > Now run v4l2-ctl --stream-user and you'll see:
> > > >=20
> > > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea identical=
 new buf
> > > > <
> > > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea identical=
 new buf
> > > > <
> > > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea identical=
 new buf
> > > > <
> > > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea identical=
 new buf
> > > > <
> > > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identical new bu=
f
> > > > <
> > > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identical new bu=
f
> > > > < 5.00 fps
> > > >=20
> > > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identical new bu=
f
> > > > <
> > > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identical new bu=
f
> > > >=20
> > > > The first four dequeued buffers are filled with data, after that th=
e
> > > > returned buffer is empty because vivid is actually writing to diffe=
rent
> > > > memory pages.
> > > >=20
> > > > With this patch the first pixel is always non-zero.
> > > Good catch. The question is weather we treat that as undefined behavi=
or
> > > and keep the optimization for 'good applications' or assume that ever=
y
> > > broken userspace code has to be properly handled. The good thing is t=
hat
> > > there is still imho no security issue. The physical pages gathered by
> > Yeah, that scared me for a bit, but it all looks secure.
> >=20
> > > vb2 in worst case belongs to noone else (vb2 is their last user, they
> > > are not yet returned to free pages pool).
> > I see three options:
> >=20
> > 1) just always reacquire the buffer, and if anyone complains about it
> >     being slower we point them towards DMABUF.
> >=20
> > 2) keep the current behavior, but document it.
> >=20
> > 3) as 2), but also add a new buffer flag that forces a reacquire of the
> >     buffer. This could be valid for DMABUF as well. E.g.:
> >=20
> >     V4L2_BUF_FLAG_REACQUIRE
> >=20
> > I'm leaning towards the third option since it won't slow down existing
> > implementations, yet if you do change the userptr every time, then you
> > can now force this to work safely.
>=20
> Is there are valid use case for third variant? I would rather go for seco=
nd.
>=20
> There is one more issue related to this. There are many apps which use=
=20
> either USERPTR or DMAbuf, but in a bit odd way: they use the same=20
> buffers all the time, but they ignore buf->index and never match it to=
=20
> respective buffer pointers or fds. This makes the current caching=20
> mechanism useless. Maybe it would make a bit sense do rewrite the=20
> caching in qbuf to ignore the provided buffer->index?

Notably GStreamer, which inherited this issue from a public API design
error some 15 years ago. Complaint wise, I don't remember someone
complaining about that, so option 1) would simply make the performance
consistent for the framework.

>=20
> > > > I wonder if it isn't possible to just check the physical address of
> > > > the received user pointer with the physical address of the previous
> > > > user pointer. Or something like that. I'll dig around a bit more.
> > > Such check won't be so simple. Pages contiguous in the virtual memory
> > > won't map to pages contiguous in the physical memory, so you would ne=
ed
> > > to check every single memory page. Make no sense. It is better to
> > > reacquire buffer on every queue operation. This indeed show how broke=
n
> > > the USERPTR related part of v4l2 API is.
> > OK, good to know. Then I'm not going to spend time on that.
> >=20
> >=20
> Best regards

--=-MTi6CpW9vlNGygIL9/Zg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPq+RQAKCRBxUwItrAao
HHcDAKDDqJeecx+h8pYkmOtW38z1unDuzgCeKB5PV/GdkF9lTcFd2mmXBByVS5o=
=Iubb
-----END PGP SIGNATURE-----

--=-MTi6CpW9vlNGygIL9/Zg--

