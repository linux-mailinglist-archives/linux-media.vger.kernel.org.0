Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2C0E1AC9A
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2019 16:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfELOR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 May 2019 10:17:27 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46315 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfELOR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 May 2019 10:17:27 -0400
Received: by mail-qk1-f194.google.com with SMTP id a132so6437971qkb.13
        for <linux-media@vger.kernel.org>; Sun, 12 May 2019 07:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BmrvqU197F+Dlf6m942J19XSdvQ9nvAihmI1KdPxKsg=;
        b=tj7YinBTPF4khoDVVYxxMKX/mXAEnJas+CrnGYwRqpa6rYr+aoK7WlgM7Sr0tSkVJB
         s35dIh0RwekkqGgHgYLilpWGPUXK4rZwkDgPtiREhVNnJGHCF94wRPnatm0HXUrWg0K/
         Xx2ZHlAw/8ixtnpewGLg3tvbNbAfezm4SPl7ntbVlU3FFjf+I+utuDM8e5CS1NFL+rod
         pFfF1pa7Ix2krtl/mNUocjqTXa4iGf43pNhgowTKOhKyJrN1trvnKTe9LscZnOw/3Nun
         a0VHfmzGOyao8u/8Rwia4vtsWNKx5mwVxXX+k8zVyOelRv5gX+pV0xYSvdpVWLqdMsI1
         2ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BmrvqU197F+Dlf6m942J19XSdvQ9nvAihmI1KdPxKsg=;
        b=Rb8HiBPp5AMKTKsJl5OkI5N4EuT+rrDsEqWMImfKTOXhzNyfWgiBmWqsgiS7DGzXmP
         8TNHcBqzbC3hZi441J7p//f13EbVtVOMUedO9qYq0SqiFA+yPyIBx1s1bga/gvZ3UIQc
         +alED5cXedH7VcGX6RdFCf1IzhCFSqfk0Sml6X12mjduLYi3PxAKoWyj4w0oD64McLb1
         KjCUv4kiMAb8HPrC4qO+mDWwJMUJyIA07YWfQlj/Je6Gw3AdfywfR11lgdnK+TDOnr7Q
         K2m8Ro5Asv/9QApEzkit665VS3Pti3f/qzHvy4CB4w0NwFvoYEiE+hQE48szjeO3P3vK
         F51Q==
X-Gm-Message-State: APjAAAWn96AS9hO5+pyF22ad+34lWh2C/PSTqJEE0yWvY9iSelbLOx/z
        ggTL3Gs5v9TK9Ebem/d7W5Q6zQ==
X-Google-Smtp-Source: APXvYqzY4n9aq+01MzU4lvnB4gNRd7bnnM119waLVcN7+WT6qHon0IXKdZf2ZbkxseK8oWlxYDBbLw==
X-Received: by 2002:a37:e40f:: with SMTP id y15mr17786756qkf.61.1557670645847;
        Sun, 12 May 2019 07:17:25 -0700 (PDT)
Received: from skullcanyon ([2002:c0de:c115:0:481e:e17e:2f68:43f8])
        by smtp.gmail.com with ESMTPSA id r47sm6278308qte.70.2019.05.12.07.17.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 12 May 2019 07:17:24 -0700 (PDT)
Message-ID: <69c10fdd26566049c523d4c8cfb1b8c35018b738.camel@ndufresne.ca>
Subject: Re: Hardware-accelerated video decoders used through a firmware
 instead of hardware registers
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Date:   Sun, 12 May 2019 10:17:22 -0400
In-Reply-To: <19804f842e80f1f8bd85b8eb49e75e149abf0062.camel@bootlin.com>
References: <19804f842e80f1f8bd85b8eb49e75e149abf0062.camel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le dimanche 12 mai 2019 à 13:35 +0200, Paul Kocialkowski a écrit :
> Hi,
> 
> With the work done on the media request API and the cedrus driver for
> Allwinner ARM SoCs, we now have a kernel interface for exposing fixed-
> hardware video decoding pipelines (currently MPEG-2 and H.264, with
> H.265 on the way). Some work remains on the per-format interface and we
> are looking to improve latency-related aspects, but we are all set to
> have a nice interface here, that plays well with e.g. ffmpeg.
> 
> A specific situation came to my interest, which is apparently quite
> common: some platforms have general-purpose microcontrollers embedded,
> which can help with video decoding. They are however rarely to never
> used to do the decoding itself (since they are general-purpose, not
> DSPs) and just coordinate the decoding with the fixed-pipeline decoding
> hardware block. The advantage is that the interface is just a simple
> mailbox and the raw video bitstream from the file can be passed
> directly without the need for userspace to do any parsing that the
> codec requires.
> 
> One side-effect from this setup is that the actual hardware register
> layout of the decoder is hidden away in a non-free piece of
> microcontroller firmware, that's usually loaded at run-time.
> 
> With the recent developments on the media interface, we could interface
> with these hardware decoders directly, which offers various advantages:
> - we no longer need a 3rd party external non-free firmware, which just
>   makes distribution easier for everyone and allows support in fully-
>   free setups;
> - all the usual advantages of having free code that can be fixed and
>   updated instead of an obscure binary that many not always be doing
>   the right thing;
> - parsing of the slices is probably best done in userspace, and I
>   heard that ffmpeg does this threaded, so there could be a latency
>   advantage there as well, not to mention that it avoids the drag of
>   a mailbox interface altogether;
> - the general-purpose micro-controller can then be reused for something
>   useful where it could actually make a performance difference.
> 
> As far as I understand, it seems that the video decoder for MT8173
> fails in that category, where a MD32 general-purpose micro-controller
> is used to only do the parsing. We even have device-tree nodes about
> the decoder and encoder, but no register layout.
> 
> So I was wondering if the linux-media community should set some
> boundaries here and push towards native implementations instead of
> firmware-based ones. My opininon is that it definitely should.
> 
> It seems that other platforms (e.g. Tegra K1 and onwards) are in the
> same situation, and I think the ChromiumOS downstream kernel uses an
> obscure firmware on a general-purpose auxiliary ARM core (that's also
> used at boot time IIRC).

I like the idea, but enforcing this now is likely going to prevent a
lot of mainline usage of CODECs (which are proprietary by patents to
start with). One thing to note, the CODEC accelerators may not be
accessible from CPU. So to support such idea, we'd need to develop
minimalist firmware to access these accelerators. That would require a
lot of reverse engineering as the third party codec vendors (e.g.
Chips&Media, Allegro etc.) don't document the accelerator or even the
architecture of the micro-controller. Compilation of these firmware can
also become tedious, specially if there is no Open Source compiler for
the chosen micro-controller architecture.

I can comment on ChromeOS, current generation is mostly based on
Rockchip SoC. The CODEC on Rockchip are just accelators, and this is
what ChromeOS team implemented, and that's what the stateless you have
done is based upon. The first generation was Samsung Exynos, this one
uses a unknown source design that they call MFC. This runs on
proprietary blob, I have not found any information about this blob.

The early boot stage is not obscure, it's called CoreBoot. This code is
meant to initialize your CPU when you CPU isn't started yet. Notably on
Intel, there has been a lot of security concerns with this proprietary
blob, CoreBoot effort includes reverse engineering and replacing this
bit. At least on Intel blobs, the micro-controller is still running
after your main CPU is loaded, giving attackers a place to run with
true full access to your computer, without being detectable.

On some platforms it can be even more complex. Think of the Xilinx
ZynMP. Documentation is pretty sparse, it's clear the VCU is only
accessible from the FPGA, and that's probably why we need a MicroBlaze
firmware (micro blaze being a micro-controller architecture programmed
into some part of a Xilinx FPGA) in order to use it. But then, it is
not clear if the VCU is fully capable of decoding, or if the work is a
mix of FPA and circuit. So replacing the firmware could be the same as
rewriting the CODEC HW (or at least some bits of it).

> 
> What do you think?
> 
> Cheers,
> 
> Paul
> 

