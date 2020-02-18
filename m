Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32FA0163320
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 21:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgBRUd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 15:33:27 -0500
Received: from plasma4.jpberlin.de ([80.241.57.33]:47871 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgBRUd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 15:33:27 -0500
X-Greylist: delayed 310 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Feb 2020 15:33:25 EST
Received: from spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122])
        by plasma.jpberlin.de (Postfix) with ESMTP id 189D8C2DDA;
        Tue, 18 Feb 2020 21:28:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id 0SmNjoT8MvK2; Tue, 18 Feb 2020 21:28:07 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id BCAA9C2DDC;
        Tue, 18 Feb 2020 21:28:06 +0100 (CET)
Received: from os-lin-dmo.localdomain (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 18 Feb
 2020 21:28:06 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     <linux-media@vger.kernel.org>
CC:     <virtio-dev@lists.oasis-open.org>, <acourbot@chromium.org>,
        <alexlau@chromium.org>, <daniel@ffwll.ch>, <dgreid@chromium.org>,
        <dstaessens@chromium.org>, <egranata@google.com>,
        <fziglio@redhat.com>, <hverkuil@xs4all.nl>,
        <keiichiw@chromium.org>, <kraxel@redhat.com>,
        <marcheu@chromium.org>, <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>, <stevensd@chromium.org>,
        <tfiga@chromium.org>, <uril@redhat.com>,
        <samiullah.khawaja@opensynergy.com>, <kiran.pawar@opensynergy.com>
Subject: [PATCH v2 0/1] Virtio Video V4L2 driver 
Date:   Tue, 18 Feb 2020 21:27:52 +0100
Message-ID: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This is a v4l2 virtio video driver for the virtio-video device
specification v3 [1].

The first version of the driver was introduced here [2].

Changes v1 -> v2:
* support the v3 spec (mostly)
* add a module parameter to ask for pages from ZONE_DMA

What is not implemented:
* Plane layout flags should be used to propagate number of planes to
  user-space
* There is no real use of stream creation with bitstream format in the
  parameter list. The driver just uses the first bitstream format from
  the list.
* Setting bitrate is done in a different way compared to the spec. This
  is because it has been already agreed on that the way the spec
  currently describes it requires changes.

Potential improvements:
* Do not send stream_create from open. Use corresponding state machine
  condition to do this.
* Do not send stream_destroy from close. Do it in reqbufs(0).
* Cache format and control settings. Reduce calls to the device.

Best regards,
Dmitry.

[1] https://markmail.org/message/dmw3pr4fuajvarth
[2] https://markmail.org/message/wnnv6r6myvgb5at6


