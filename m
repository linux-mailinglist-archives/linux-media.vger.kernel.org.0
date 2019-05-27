Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E64A2B6CA
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 15:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfE0NqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 09:46:00 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53569 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfE0NqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 09:46:00 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1hVFws-0006IY-P3; Mon, 27 May 2019 15:45:58 +0200
Date:   Mon, 27 May 2019 15:45:57 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com
Subject: Re: [PATCH v6 0/5] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
Message-ID: <20190527154557.62278063@litschi.hi.pengutronix.de>
In-Reply-To: <20190522154945.54ac67d7@litschi.hi.pengutronix.de>
References: <20190513172131.15048-1-m.tretter@pengutronix.de>
        <23de1fe8-f868-d13d-4217-05bc007fab13@xs4all.nl>
        <20190522154945.54ac67d7@litschi.hi.pengutronix.de>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 22 May 2019 15:49:45 +0200, Michael Tretter wrote:
> On Wed, 22 May 2019 14:04:23 +0200, Hans Verkuil wrote:
> > On 5/13/19 7:21 PM, Michael Tretter wrote:  
> > > This is v6 of the Allegro DVT H.264 encoder driver found in the EV
> > > family of the Xilinx ZynqMP platform.
> > > 
> > > Only minor changes this time. I dropped the implementation of the
> > > selection api, removed all references mentioning the decoder, and fixed
> > > a few issues reported by sparse and smatch.
> > > 
> > > The v4l2-compliance result using the current vicodec branch is
> > > 
> > > v4l2-compliance SHA: c2ad13e4b7aef9ae160303189c67a91e1775f025, 64 bits
> > > 
> > > Compliance test for allegro device /dev/video4:  
> [...]
> > > I observed that the "MMAP (select)" test occasionally fails, because the
> > > test did not receive an V4L2_EVENT_EOS when dequeuing a buffer with
> > > V4L2_BUF_FLAG_LAST being set. The driver always queues the event before
> > > returning the last buffer and the "MMAP (epoll)" does not fail. Thus, I
> > > decided to send the series anyway.    
> > 
> > Where exactly does v4l2-compliance fail? This is weird, and I believe
> > this warrants a bit more debugging. I recommend adding a debug
> > statement in allegro_channel_buf_done() to see when a buffer is marked
> > LAST.  
> 
> v4l2-compliance fails in line 1074
> 
> 	fail: v4l2-test-buffers.cpp(1074): !got_eos && !got_source_change
> 
> The corresponding code in v4l2-compliance is
> 
> 	if (buf.g_flags() & V4L2_BUF_FLAG_LAST) {
> 		fail_on_test(buf.dqbuf(node) != EPIPE);
> >		fail_on_test(!got_eos && !got_source_change);  
> 		if (!count)
> 			break;
> 		fail_on_test(node->streamoff(m2m_q.g_type()));
> 		m2m_q.munmap_bufs(node);
> 
> When the test fails, the select/epoll_wait returns with readable data,
> but without readable events on the last buffer. If the test is
> successful, data and events are available. This looks like a race
> between the event and the LAST buffer and if the LAST buffer comes
> first, the test fails.
> 
> As said, the driver always queues the EOS event before calling
> v4l2_m2m_buf_done() on the LAST buffer. Right now, I don't understand
> how this can happen, but I will continue debugging.

There is a race between v4l2_m2m_poll() and allegro_channel_finish_frame().

v4l2_m2m_poll() first calls v4l2_event_pending() to check if events are
available and afterwards checks if there are buffers on src_q and
dst_q. If allegro_channel_finish_frame() queues the V4L2_EVENT_EOS
after v4l2_event_pending() but before the checks on the queues,
v4l2_m2m_poll() sets EPOLLIN | EPOLLRDNORM for the LAST buffer, but does
not set EPOLLPRI, because it missed V4L2_EVENT_EOS.

As a fix, the driver must hold the m2m_ctx->q_lock mutex while calling
v4l2_event_queue_fh() for V4L2_EVENT_EOS to ensure that the event is
not queued during v4l2_m2m_poll() after the v4l2_event_pending() check.

I'm not completely sure, but it seems to me that other v4l2 mem2mem
drivers have the same issue.

Michael

> 
> > 
> > These tests really should not fail, and it is a strong indication of a
> > bug somewhere.
> > 
> > I don't want to merge a driver that has a FAIL in v4l2-compliance without
> > at the very least understanding why that happens. Ignoring it defeats the
> > purpose of v4l2-compliance.  
> 
> Totally agreed.
> 
> Michael
> 
> > 
> > Regards,
> > 
> > 	Hans
> >   
> 
