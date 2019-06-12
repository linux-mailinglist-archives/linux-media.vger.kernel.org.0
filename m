Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C36941947
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 02:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403831AbfFLAJR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 20:09:17 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:44434 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392154AbfFLAJR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 20:09:17 -0400
Received: by mail-qk1-f194.google.com with SMTP id w187so8838711qkb.11
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 17:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=r58XyA83BWx23lPFypqIAajiB3Y8g8UWGkEbB6ALfgA=;
        b=rIpeaUdTsh5aahq0FqyH/kwu0e86zA3M5iEOA9MtUDa8FtS2rYBgtibzqdKS8BGl7g
         xjS2icZxJWWkp2/d7GPqA/JextNNATpNuQAIrDWsOuRkAp770KljB0Ga20rFUHicJmNY
         TNxQHMvX5vvm/2CHX5MoAN5QcZkr0G/knrJe1MpErAoe4y5e3n9ttBvUkEXRPk+mJP8m
         W5Z6+RiF6WlpDSSQFG6EMBEmz16AGM74jhDaliOHwlHQM9cwPYyWyMTiNzJvNthE0dZH
         ZVSZqTA4YohnNgZ4CCYlHULPCVgPZWSMeUniOFgGrRo1EXSpeu41KTA5Cxe60fsTC+Bz
         4RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=r58XyA83BWx23lPFypqIAajiB3Y8g8UWGkEbB6ALfgA=;
        b=buVHjY426IhNWj+P7iYZ2tqm/qinJYnfusY2KwP95dze/VK7U3CiJXDlypT79m8suu
         htS6bLwd0iLLBg/GqqVVoJBWszlm9LI/3LObW/wpqCyZRQhAd33fb8fnel65tVYAVZaq
         bojFrGuzY9/Gw7cEN1fKCAxRHG6UwkI7lwd/2rHowGmTXSINLcK0nf70ZKM/SbS9St0+
         0EtvSAjaiKM7Ufp+TYyqtgglyEcuf1FWiS32nejPpbC8tAkDzBZqgw1p/WeMKjsnFAfR
         YI0m5Obw8uwzk/J2O5hTWceggAAJMjxnAlCHxG1pDHy0SFeE6fUiFzXEm+LaZqsd3SlT
         RaKg==
X-Gm-Message-State: APjAAAVk4awC972YxPjEB4ppT43/TMtPdTTX04qY72hQj2iZUM0ElCTB
        BazkYGtSSlu2ix0mj+0Xm7rb5Q==
X-Google-Smtp-Source: APXvYqxOSUSQhXU0shYgnZxDcQENJlwOgC+oZp3gHIRN2I/1ZNVW95F64yOlBp10F1Qlqz2dv6fLZg==
X-Received: by 2002:a37:7bc3:: with SMTP id w186mr62827838qkc.225.1560298155909;
        Tue, 11 Jun 2019 17:09:15 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id a15sm152418qtb.43.2019.06.11.17.09.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 17:09:15 -0700 (PDT)
Message-ID: <af1a05ba549c82a672718821282fd5af4e560f5c.camel@ndufresne.ca>
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Tue, 11 Jun 2019 20:09:13 -0400
In-Reply-To: <20190611102410.GD5016@pendragon.ideasonboard.com>
References: <20190607111634.GA7593@pendragon.ideasonboard.com>
         <CGME20190607120150epcas3p34178a04f712c89b013a263264cf2184f@epcas3p3.samsung.com>
         <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
         <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com>
         <6c3ffe98-9d64-b881-470a-bfef8b9280de@xs4all.nl>
         <1f754020-296c-cf9b-1331-598bb774fa42@xs4all.nl>
         <4e711a70-ef25-b9f2-e27a-ae6c80288388@xs4all.nl>
         <ddacf8a1-61c4-bc04-8c52-cd56dfd13842@samsung.com>
         <20190607135815.GN7593@pendragon.ideasonboard.com>
         <675dc8c2985754f6c72c06ec36a00ebca4f49fc8.camel@ndufresne.ca>
         <20190611102410.GD5016@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 11 juin 2019 à 13:24 +0300, Laurent Pinchart a écrit :
> Hi Nicolas,
> 
> On Fri, Jun 07, 2019 at 03:38:39PM -0400, Nicolas Dufresne wrote:
> > Le vendredi 07 juin 2019 à 16:58 +0300, Laurent Pinchart a écrit :
> > > On Fri, Jun 07, 2019 at 03:55:05PM +0200, Marek Szyprowski wrote:
> > > > On 2019-06-07 15:40, Hans Verkuil wrote:
> > > > > On 6/7/19 2:47 PM, Hans Verkuil wrote:
> > > > > > On 6/7/19 2:23 PM, Hans Verkuil wrote:
> > > > > > > On 6/7/19 2:14 PM, Marek Szyprowski wrote:
> > > > > > > > On 2019-06-07 14:01, Hans Verkuil wrote:
> > > > > > > > > On 6/7/19 1:16 PM, Laurent Pinchart wrote:
> > > > > > > > > > Thank you for the patch.
> > > > > > > > > > 
> > > > > > > > > > On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
> > > > > > > > > > > The __prepare_userptr() function made the incorrect assumption that if the
> > > > > > > > > > > same user pointer was used as the last one for which memory was acquired, then
> > > > > > > > > > > there was no need to re-acquire the memory. This assumption was never properly
> > > > > > > > > > > tested, and after doing that it became clear that this was in fact wrong.
> > > > > > > > > > Could you explain in the commit message why the assumption is not
> > > > > > > > > > correct ?
> > > > > > > > > You can free the memory, then allocate it again and you can get the same pointer,
> > > > > > > > > even though it is not necessarily using the same physical pages for the memory
> > > > > > > > > that the kernel is still using for it.
> > > > > > > > > 
> > > > > > > > > Worse, you can free the memory, then allocate only half the memory you need and
> > > > > > > > > get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
> > > > > > > > > the original mapping still remains), but this can corrupt userspace memory
> > > > > > > > > causing the application to crash. It's not quite clear to me how the memory can
> > > > > > > > > get corrupted. I don't know enough of those low-level mm internals to understand
> > > > > > > > > the sequence of events.
> > > > > > > > > 
> > > > > > > > > I have test code for v4l2-compliance available if someone wants to test this.
> > > > > > > > I'm interested, I would really like to know what happens in the mm
> > > > > > > > subsystem in such case.
> > > > > > > Here it is:
> > > > > > > 
> > > > > > > diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > > index be606e48..9abf41da 100644
> > > > > > > --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > > > > @@ -797,7 +797,7 @@ int testReadWrite(struct node *node)
> > > > > > >   	return 0;
> > > > > > >   }
> > > > > > > 
> > > > > > > -static int captureBufs(struct node *node, const cv4l_queue &q,
> > > > > > > +static int captureBufs(struct node *node, cv4l_queue &q,
> > > > > > >   		const cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
> > > > > > >   		unsigned &capture_count)
> > > > > > >   {
> > > > > > > @@ -962,6 +962,21 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
> > > > > > >   				buf.s_flags(V4L2_BUF_FLAG_REQUEST_FD);
> > > > > > >   				buf.s_request_fd(buf_req_fds[req_idx]);
> > > > > > >   			}
> > > > > > > +			if (v4l_type_is_capture(buf.g_type()) && q.g_memory() == V4L2_MEMORY_USERPTR) {
> > > > > > > +				printf("\nidx: %d", buf.g_index());
> > > > > > > +				for (unsigned p = 0; p < q.g_num_planes(); p++) {
> > > > > > > +					printf(" old buf[%d]: %p ", p, buf.g_userptr(p));
> > > > > > > +					fflush(stdout);
> > > > > > > +					free(buf.g_userptr(p));
> > > > > > > +					void *m = calloc(1, q.g_length(p)/2);
> > > > > > > +
> > > > > > > +					fail_on_test(m == NULL);
> > > > > > > +					q.s_userptr(buf.g_index(), p, m);
> > > > > > > +					printf("new buf[%d]: %p", p, m);
> > > > > > > +					buf.s_userptr(m, p);
> > > > > > > +				}
> > > > > > > +				printf("\n");
> > > > > > > +			}
> > > > > > >   			fail_on_test(buf.qbuf(node, q));
> > > > > > >   			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
> > > > > > >   			if (buf.g_flags() & V4L2_BUF_FLAG_REQUEST_FD) {
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > Load the vivid driver and just run 'v4l2-compliance -s10' and you'll see:
> > > > > > > 
> > > > > > > ...
> > > > > > > Streaming ioctls:
> > > > > > >          test read/write: OK
> > > > > > >          test blocking wait: OK
> > > > > > >          test MMAP (no poll): OK
> > > > > > >          test MMAP (select): OK
> > > > > > >          test MMAP (epoll): OK
> > > > > > >          Video Capture: Frame #000
> > > > > > > idx: 0 old buf[0]: 0x7f71c6e7c010 new buf[0]: 0x7f71c6eb4010
> > > > > > >          Video Capture: Frame #001
> > > > > > > idx: 1 old buf[0]: 0x7f71c6e0b010 new buf[0]: 0x7f71c6e7b010
> > > > > > >          Video Capture: Frame #002
> > > > > > > idx: 0 old buf[0]: 0x7f71c6eb4010 free(): invalid pointer
> > > > > > > Aborted
> > > > > > To clarify: two full size buffers are allocated and queued (that happens in setupUserPtr()),
> > > > > > then streaming starts and captureBufs is called which basically just calls dqbuf
> > > > > > and qbuf.
> > > > > > 
> > > > > > Tomasz pointed out that all the pointers in this log are actually different. That's
> > > > > > correct, but here is a log where the old and new buf ptr are the same:
> > > > > > 
> > > > > > Streaming ioctls:
> > > > > >          test read/write: OK
> > > > > >          test blocking wait: OK
> > > > > >          test MMAP (no poll): OK
> > > > > >          test MMAP (select): OK
> > > > > >          test MMAP (epoll): OK
> > > > > >          Video Capture: Frame #000
> > > > > > idx: 0 old buf[0]: 0x7f1094e16010 new buf[0]: 0x7f1094e4e010
> > > > > >          Video Capture: Frame #001
> > > > > > idx: 1 old buf[0]: 0x7f1094da5010 new buf[0]: 0x7f1094e15010
> > > > > >          Video Capture: Frame #002
> > > > > > idx: 0 old buf[0]: 0x7f1094e4e010 new buf[0]: 0x7f1094e4e010
> > > > > >          Video Capture: Frame #003
> > > > > > idx: 1 old buf[0]: 0x7f1094e15010 free(): invalid pointer
> > > > > > Aborted
> > > > > > 
> > > > > > It's weird that the first log fails that way: if the pointers are different,
> > > > > > then vb2 will call get_userptr and it should discover that the buffer isn't
> > > > > > large enough, causing qbuf to fail. That doesn't seem to happen.
> > > > > I think that the reason for this corruption is that the memory pool used
> > > > > by glibc is now large enough for vb2 to think it can map the full length
> > > > > of the user pointer into memory, even though only the first half is actually
> > > > > from the buffer that's allocated. When you capture a frame you just overwrite
> > > > > a random part of the application's memory pool, causing this invalid pointer.
> > > > > 
> > > > > But that's a matter of garbage in, garbage out. So that's not the issue here.
> > > > > 
> > > > > The real question is what happens when you free the old buffer, allocate a
> > > > > new buffer, end up with the same userptr, but it's using one or more different
> > > > > pages for its memory compared to the mapping that the kernel uses.
> > > > > 
> > > > > I managed to reproduce this with v4l2-ctl:
> > > > > 
> > > > > diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > > index 28b2b3b9..8f2ed9b5 100644
> > > > > --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > > +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > > > > @@ -1422,6 +1422,24 @@ static int do_handle_cap(cv4l_fd &fd, cv4l_queue &q, FILE *fout, int *index,
> > > > >   		 * has the size that fits the old resolution and might not
> > > > >   		 * fit to the new one.
> > > > >   		 */
> > > > > +		if (q.g_memory() == V4L2_MEMORY_USERPTR) {
> > > > > +			printf("\nidx: %d", buf.g_index());
> > > > > +			for (unsigned p = 0; p < q.g_num_planes(); p++) {
> > > > > +				unsigned *pb = (unsigned *)buf.g_userptr(p);
> > > > > +				printf(" old buf[%d]: %p first pixel: 0x%x", p, buf.g_userptr(p), *pb);
> > > > > +				fflush(stdout);
> > > > > +				free(buf.g_userptr(p));
> > > > > +				void *m = calloc(1, q.g_length(p));
> > > > > +
> > > > > +				if (m == NULL)
> > > > > +					return QUEUE_ERROR;
> > > > > +				q.s_userptr(buf.g_index(), p, m);
> > > > > +				if (m == buf.g_userptr(p))
> > > > > +					printf(" identical new buf");
> > > > > +				buf.s_userptr(m, p);
> > > > > +			}
> > > > > +			printf("\n");
> > > > > +		}
> > > > >   		if (fd.qbuf(buf) && errno != EINVAL) {
> > > > >   			fprintf(stderr, "%s: qbuf error\n", __func__);
> > > > >   			return QUEUE_ERROR;
> > > > > 
> > > > > 
> > > > > Load vivid, setup a pure white test pattern:
> > > > > 
> > > > > v4l2-ctl -c test_pattern=6
> > > > > 
> > > > > Now run v4l2-ctl --stream-user and you'll see:
> > > > > 
> > > > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x80ea80ea identical new buf
> > > > > <
> > > > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x80ea80ea identical new buf
> > > > > <
> > > > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x80ea80ea identical new buf
> > > > > <
> > > > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x80ea80ea identical new buf
> > > > > <
> > > > > idx: 0 old buf[0]: 0x7f91551cb010 first pixel: 0x0 identical new buf
> > > > > <
> > > > > idx: 1 old buf[0]: 0x7f915515a010 first pixel: 0x0 identical new buf
> > > > > < 5.00 fps
> > > > > 
> > > > > idx: 2 old buf[0]: 0x7f91550e9010 first pixel: 0x0 identical new buf
> > > > > <
> > > > > idx: 3 old buf[0]: 0x7f9155078010 first pixel: 0x0 identical new buf
> > > > > 
> > > > > The first four dequeued buffers are filled with data, after that the
> > > > > returned buffer is empty because vivid is actually writing to different
> > > > > memory pages.
> > > > > 
> > > > > With this patch the first pixel is always non-zero.
> > > > 
> > > > Good catch. The question is weather we treat that as undefined behavior 
> > > > and keep the optimization for 'good applications' or assume that every 
> > > > broken userspace code has to be properly handled.
> > > 
> > > Given how long we've been saying that USERPTR should be replaced by
> > > DMABUF, I would consider that any userspace code using USERPTR is broken
> > > :-) One could however question whether we were effective at getting that
> > > message across...
> > 
> > Just a reminder that DMABuf is not a replacement for USERPTR. It only
> > cover a subset in absence of an allocater for it. There is no clean way
> > to allocate a DMAbuf. Notably, memfds (which could have filled the gap)
> > are not DMABuf, even though they are they are similar to the buffers
> > allocated by vivid or uvcvideo.
> 
> You always have the option to use MMAP to allocate buffers on the V4L2
> device. What prevents you from doing so and forces usage of USERPTR ?

If you use MMAP on one v4l2 device, how do you import that into another
v4l2 device ? Now, let's say your source is not a v4l2 device, and uses
virtual memory, how does DMABuf replaces such a use case if you want to
avoid copies and you know your HW can support fast usage of these
randomly allocated buffers ?

> 
> > > > The good thing is that 
> > > > there is still imho no security issue. The physical pages gathered by 
> > > > vb2 in worst case belongs to noone else (vb2 is their last user, they 
> > > > are not yet returned to free pages pool).
> > > > 
> > > > > I wonder if it isn't possible to just check the physical address of
> > > > > the received user pointer with the physical address of the previous
> > > > > user pointer. Or something like that. I'll dig around a bit more.
> > > > 
> > > > Such check won't be so simple. Pages contiguous in the virtual memory 
> > > > won't map to pages contiguous in the physical memory, so you would need 
> > > > to check every single memory page. Make no sense. It is better to 
> > > > reacquire buffer on every queue operation. This indeed show how broken 
> > > > the USERPTR related part of v4l2 API is.

