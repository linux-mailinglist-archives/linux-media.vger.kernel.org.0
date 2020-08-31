Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610172571FC
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 05:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgHaDEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 23:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgHaDEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 23:04:24 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D729C061573
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2020 20:04:23 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 32901292A45
Message-ID: <16e60d66b036bce7019023a48aa278c9044d87c5.camel@collabora.com>
Subject: DMA-BUF Heaps BoF notes (Re: [RFC] Experimental DMA-BUF Device
 Heaps)
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        "nd@arm.com" <nd@arm.com>, Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Liam Mark <lmark@codeaurora.org>,
        "Andrew F . Davis" <afd@ti.com>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Laura Abbott <labbott@kernel.org>,
        Daniel Stone <daniels@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Reitan <John.Reitan@arm.com>
Date:   Mon, 31 Aug 2020 00:04:10 -0300
In-Reply-To: <RYac-UwqFncGmZCWk713lK86adAOfMQbeT6CF15dhr1H3o-P-_tXJcwNYxM5LYqddtYe7Y7VEmbSrDe5ixtIqtHmxMkH1FfulkO4VppXGKA=@emersion.fr>
References: <20200816172246.69146-1-ezequiel@collabora.com>
         <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
         <c2450755-91fd-da72-bf1e-c015ad9d6b25@nvidia.com>
         <746a0bb75bd8388a30b53a5ddc56fb24aea308a8.camel@collabora.com>
         <RYac-UwqFncGmZCWk713lK86adAOfMQbeT6CF15dhr1H3o-P-_tXJcwNYxM5LYqddtYe7Y7VEmbSrDe5ixtIqtHmxMkH1FfulkO4VppXGKA=@emersion.fr>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear all,

Here are the notes we took during the BoF.

I believe the meeting was super interesting.

Although it felt a bit short for the topic,
we left with a few interesting ideas.

Thanks everyone!
Ezequiel

---
LPC 2020 BoF: Negotiating DMA-BUF Heaps

Attendees:
* Brian Starkey
* Daniel Stone
* Ezequiel Garcia
* James Jones
* John Reitan
* Laura Abbott
* Laurent Pinchart
* Sumit Semwal
* Robert Beckett

# Replacing subsystem memory allocators with dma-buf heaps

* Laurent: we should not have subsystem implement their own allocator.
  Using heaps could be a good idea.

* Laura: Wary to add too much support to heaps,
  from the ION experience.

* Laurent: V4L2: most drivers use videobuf2,
  which is a fairly complex piece of code.
  Three constraints, sg, contig, and vmalloc:
  these are fairly generic and not video-specific, why can't these just use heaps?

* Brian: In-kernel API will most likely just care of dma-buf
  not necessarily FDs. This was discussed recently, see "Role of DMA Heaps
  vs GEM in allocation",https://www.spinics.net/lists/dri-devel/msg268103.html

* Do we expect to get a non-file descriptor identifier for a dma-buf? No.

* Laurent proposes a two steps API (similar to existing GEM API),
  where we have one interface to allocate a buffer, with an identifier
  local to a process, and then another interface to wrap the buffer
  on a dma-buf (fd).

* If devices are not meant to be shared, then we might want to avoid
  the DMA-BUF design entirely. As Sumit mentioned, the fundamental
  idea behind DMA-BUF is that they are expected to be shared.
  OTOH, it was mentioned that sometimes we don't know if a buffer
  will be shared or not, so that's why the ability to wrap a buffer
over dma-buf is useful.

* New subsytems would possibly want to avoid implementing
  its own allocator interface. But unfortunately, we don't want
  to produce a fd per buffer, so that will mean a new subsystem
  will eventually require its own API (GEM-like).
  If a subsystem doesn't need many buffers, and the FD semantic is fine,
  then it would be acceptable to avoid a subsystem-specific API.

* It would be interesting to experiment replacing videobuf2-dma-contig
  with just dma-buf heap usage, and see what kind of code save we'd save.

* John Stultz has ideas around providing in-kernel accessors
  for the heaps - the idea is for drivers to not have to implement
  full exporter functionality for an already existing dma-buf heap type.

* Drawback to this idea of reusing dma-buf heaps to allocate buffers,
  is that it means marking every buffer that gets exported as shareable.

* The benefits in having a centralized implementation would be in unifying
  the semantics, reusable concepts that can be used to build future APIs around,
  rather than trying to created unified APIs around disparate kernel allocation
  APIs at only the userspace level.

* Robert: Is there an in-kernel user for the in-kernel dma-buf request?
  A possible answer would be for scratch buffers. The idea would be
  to avoid getting details wrong. However, doing this would allow every
  buffer to be exportable. Also, it sounds like this means
  re-implementing DMA-API?

* DMA-BUF are designed to be shared, not necessarily an allocator.

* Want something to expose device-local memory to rest of kernel.
Could be a dma-buf heap?

