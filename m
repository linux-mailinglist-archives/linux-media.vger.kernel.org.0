Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B33F0114484
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 17:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729901AbfLEQLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 11:11:47 -0500
Received: from plasma6.jpberlin.de ([80.241.56.68]:51361 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729406AbfLEQLr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 11:11:47 -0500
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
        by plasma.jpberlin.de (Postfix) with ESMTP id F3C6BBA10A;
        Thu,  5 Dec 2019 17:11:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id Fb2yUIUPxfdf; Thu,  5 Dec 2019 17:11:39 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 778D3A06C4;
        Thu,  5 Dec 2019 17:11:38 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 5 Dec 2019
 17:11:38 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     <linux-media@vger.kernel.org>
CC:     <virtio-dev@lists.oasis-open.org>, <kraxel@redhat.com>,
        <tfiga@chromium.org>, <keiichiw@chromium.org>,
        <acourbot@chromium.org>, <hverkuil@xs4all.nl>,
        <posciak@chromium.org>, <marcheu@chromium.org>,
        <stevensd@chromium.org>, <dgreid@chromium.org>, <daniel@ffwll.ch>,
        <egranata@google.com>
Subject: [RFC] virtio video driver
Date:   Thu, 5 Dec 2019 17:11:37 +0100
Message-ID: <4595464.3jghpSLKuc@os-lin-dmo>
Organization: OpenSynergy
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

My apologies for the long delay. The driver code is now available and provided 
as a follow-up to the discussion from this thread [1].

The reference Linux kernel 5.4 driver implementation is located here:
https://github.com/OpenSynergy/linux/tree/virtio-video-draft-v1

The driver is implemented using the V4L2 API. It allocates a v4l2 device for 
each probed virtio device and then creates a video device for each function 
within the respective virtio device. The driver implements the stateful 
decoder interface [2] and the stateful encoder interface (WIP) [3].

The DMA SG memory allocator tries to map buffers right away. As it is not 
always suitable, and some implementations might need just a physical address, 
we had to introduce a set of simple dma ops directly in the driver.

The driver is in the RFC state and currently a bit ahead of the spec that was 
proposed in the discussion mentioned above. On the other hand, the driver 
unfortunately does not yet include changes proposed in the recent comments 
[4]. The driver currently supports encoder and decoder functions. Also, it 
does not fully pass the v4l2-compliance yet, it has been a bit out of the 
focus so far.

Any feedback and contribution would be greatly appreciated.

[1] https://markmail.org/message/gc6h25acct22niut
[2] https://www.kernel.org/doc/html/v5.4/media/uapi/v4l/dev-decoder.html
[3] https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-encoder.html
[4] https://markmail.org/message/yy67elx2adbivdsp

Best regards,
Dmitry.



