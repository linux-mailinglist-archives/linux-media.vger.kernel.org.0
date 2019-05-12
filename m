Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E361ABF0
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2019 13:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfELLgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 May 2019 07:36:13 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:53147 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfELLgM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 May 2019 07:36:12 -0400
X-Originating-IP: 93.29.109.196
Received: from collins (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 73671C0004;
        Sun, 12 May 2019 11:36:08 +0000 (UTC)
Message-ID: <19804f842e80f1f8bd85b8eb49e75e149abf0062.camel@bootlin.com>
Subject: Hardware-accelerated video decoders used through a firmware instead
 of hardware registers
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Date:   Sun, 12 May 2019 13:35:55 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

With the work done on the media request API and the cedrus driver for
Allwinner ARM SoCs, we now have a kernel interface for exposing fixed-
hardware video decoding pipelines (currently MPEG-2 and H.264, with
H.265 on the way). Some work remains on the per-format interface and we
are looking to improve latency-related aspects, but we are all set to
have a nice interface here, that plays well with e.g. ffmpeg.

A specific situation came to my interest, which is apparently quite
common: some platforms have general-purpose microcontrollers embedded,
which can help with video decoding. They are however rarely to never
used to do the decoding itself (since they are general-purpose, not
DSPs) and just coordinate the decoding with the fixed-pipeline decoding
hardware block. The advantage is that the interface is just a simple
mailbox and the raw video bitstream from the file can be passed
directly without the need for userspace to do any parsing that the
codec requires.

One side-effect from this setup is that the actual hardware register
layout of the decoder is hidden away in a non-free piece of
microcontroller firmware, that's usually loaded at run-time.

With the recent developments on the media interface, we could interface
with these hardware decoders directly, which offers various advantages:
- we no longer need a 3rd party external non-free firmware, which just
  makes distribution easier for everyone and allows support in fully-
  free setups;
- all the usual advantages of having free code that can be fixed and
  updated instead of an obscure binary that many not always be doing
  the right thing;
- parsing of the slices is probably best done in userspace, and I
  heard that ffmpeg does this threaded, so there could be a latency
  advantage there as well, not to mention that it avoids the drag of
  a mailbox interface altogether;
- the general-purpose micro-controller can then be reused for something
  useful where it could actually make a performance difference.

As far as I understand, it seems that the video decoder for MT8173
fails in that category, where a MD32 general-purpose micro-controller
is used to only do the parsing. We even have device-tree nodes about
the decoder and encoder, but no register layout.

So I was wondering if the linux-media community should set some
boundaries here and push towards native implementations instead of
firmware-based ones. My opininon is that it definitely should.

It seems that other platforms (e.g. Tegra K1 and onwards) are in the
same situation, and I think the ChromiumOS downstream kernel uses an
obscure firmware on a general-purpose auxiliary ARM core (that's also
used at boot time IIRC).

What do you think?

Cheers,

Paul

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

