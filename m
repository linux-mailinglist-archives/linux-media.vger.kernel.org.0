Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17FF2BB00E
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 10:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731941AbfIWI4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 04:56:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49574 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731860AbfIWI4j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 04:56:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A2498883C2;
        Mon, 23 Sep 2019 08:56:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com [10.36.116.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5E21E5D9CA;
        Mon, 23 Sep 2019 08:56:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 91AFA9D69; Mon, 23 Sep 2019 10:56:37 +0200 (CEST)
Date:   Mon, 23 Sep 2019 10:56:37 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     virtio-dev@lists.oasis-open.org, acourbot@chromium.org,
        alexlau@chromium.org, dgreid@chromium.org, marcheu@chromium.org,
        posciak@chromium.org, stevensd@chromium.org, tfiga@chromium.org,
        hverkuil@xs4all.nl, linux-media@vger.kernel.org
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
Message-ID: <20190923085637.bsaevedklweijgya@sirius.home.kraxel.org>
References: <20190919093404.182015-1-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919093404.182015-1-keiichiw@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 23 Sep 2019 08:56:38 +0000 (UTC)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> Our prototype implementation uses [4], which allows the virtio-vdec
> device to use buffers allocated by virtio-gpu device.

> [4] https://lkml.org/lkml/2019/9/12/157

Well.  I think before even discussing the protocol details we need a
reasonable plan for buffer handling.  I think using virtio-gpu buffers
should be an optional optimization and not a requirement.  Also the
motivation for that should be clear (Let the host decoder write directly
to virtio-gpu resources, to display video without copying around the
decoded framebuffers from one device to another).

Referencing virtio-gpu buffers needs a better plan than just re-using
virtio-gpu resource handles.  The handles are device-specific.  What if
there are multiple virtio-gpu devices present in the guest?

I think we need a framework for cross-device buffer sharing.  One
possible option would be to have some kind of buffer registry, where
buffers can be registered for cross-device sharing and get a unique
id (a uuid maybe?).  Drivers would typically register buffers on
dma-buf export.

Another option would be to pass around both buffer handle and buffer
owner, i.e. instead of "u32 handle" have something like this:

struct buffer_reference {
	enum device_type; /* pci, virtio-mmio, ... */
	union device_address {
		struct pci_address pci_addr;
		u64 virtio_mmio_addr;
		[ ... ]
	};
	u64 device_buffer_handle; /* device-specific, virtio-gpu could use resource ids here */
};

cheers,
  Gerd

