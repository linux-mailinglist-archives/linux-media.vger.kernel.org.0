Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA401F5E85
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 01:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgFJXGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 19:06:00 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:56440 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgFJXF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 19:05:59 -0400
X-Halon-ID: eb52bccd-ab6e-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id eb52bccd-ab6e-11ea-933e-005056917a89;
        Thu, 11 Jun 2020 01:05:51 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/5] media-device: Report if graph is complete
Date:   Thu, 11 Jun 2020 01:05:36 +0200
Message-Id: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series is an attempt to scratch an old itch, it's problematic to
support unbind and then a second call to complete in v4l2-async. When
the second complete call happens a lot of things can go wrong.

When v4l2-async complete callback is called multiple video devices are
registered with video_register_device(). Then if a v4l2-async unbind
happens they are unregistered with video_unregister_device().

Their are multiple problems with this, specially for R-Car VIN.

1. Depending on which subdevice is unbound parts of the video pipeline
   can still function. There are for example two CSI-2 receivers
   connected to two different CSI-2 buses in the pipeline. If one of the
   receivers are unbound the other can still function perfectly well.
   But with the current setup everything goes away, this is bad for
   operational safety.

2. The struct video_device contains a static struct device, which in
   turn contains a static struct kref. When the kref is release by
   calling video_unregister_device() and then later trying to
   re-register the video device video_register_device() the kref life
   time management kicks in and produces warnings in later kernels or
   OOPS in older ones.

It has been discussed in the past at various conferences that it could
be OK to not video_unregister_device() if a v4l2-async unbind happens.
The argument against it was that user-space needed a way to check if a
pipeline was completely probed or not. And this used to be that the
video devices where only present if everything was available.

It was agreed in principle that if an alternate way for media controller
centric devices could be found to inform user-space of this fact could
be found it would be OK to not unregister video devices in case of an
unbind or even allow registering the video devices at probe time instead
of at v4l2-async complete time.

This series aims to provide such a mechanism using the media device
itself to report if the media graph is complete or not.

Niklas Söderlund (5):
  uapi/linux/media.h: add flags field to struct media_v2_topology
  media-device: Add a complete flag to struct media_device
  v4l2-async: Flag when media graph is complete
  mc-device.c: Report graph complete to user-space
  rcar-vin: Do not unregister video device when a subdevice is unbound

 drivers/media/mc/mc-device.c                | 2 +-
 drivers/media/platform/rcar-vin/rcar-core.c | 5 -----
 drivers/media/v4l2-core/v4l2-async.c        | 5 +++++
 include/media/media-device.h                | 2 ++
 include/uapi/linux/media.h                  | 4 +++-
 5 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.27.0

