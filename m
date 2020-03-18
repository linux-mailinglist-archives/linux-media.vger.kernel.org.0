Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D05C918A707
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 22:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgCRVbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 17:31:06 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:46221 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726733AbgCRVbG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 17:31:06 -0400
X-Halon-ID: aad7aa7e-695f-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id aad7aa7e-695f-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 22:30:30 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC 0/5] media-device: Report if graph is complete or not
Date:   Wed, 18 Mar 2020 22:30:46 +0100
Message-Id: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
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

1. Defending on which subdevice is unbound parts of the video pipeline 
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
itself to (optionally) report if the media graph is complete or not.

Patch 1/5, 2/5 and 3/5 adds the plumbing inside the core to carry such 
information from a driver to user-space. Patch 4/5 and 5/5 implements 
the new media device callback to report graph status and stops 
registering the video devices in case an v4l2-async unbind happens.

A complementary series to v4l2-utils is posted as [1] which demonstrates 
the usage of this series from user-space.

1. [PATCH 0/2] v4l-utils: media-ctl: Print media graph completes if 
   available

Niklas Söderlund (5):
  uapi/linux/media.h: add flag field to struct media_device_info
  media-device: Add a graph_complete callback to struct media_device_ops
  mc-device.c: If graph completes status is available report it to
    user-space
  rcar-vin: Report the completeness of the media graph
  rcar-vin: Do not unregister video device when a subdevice is unbound

 drivers/media/mc/mc-device.c                |  4 ++++
 drivers/media/platform/rcar-vin/rcar-core.c | 18 +++++++++++++-----
 drivers/media/platform/rcar-vin/rcar-vin.h  |  4 ++++
 include/media/media-device.h                |  3 +++
 include/uapi/linux/media.h                  |  9 ++++++++-
 5 files changed, 32 insertions(+), 6 deletions(-)

-- 
2.25.1

