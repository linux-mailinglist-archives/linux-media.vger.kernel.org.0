Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C260722112
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 03:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbfERBHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 21:07:54 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:16478 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726200AbfERBHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 21:07:54 -0400
X-Halon-ID: 57b809c4-7909-11e9-8d05-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 57b809c4-7909-11e9-8d05-005056917f90;
        Sat, 18 May 2019 03:07:50 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     libcamera-devel@lists.libcamera.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] vimc: Allow multiple capture devices to use the same sensor
Date:   Sat, 18 May 2019 03:07:41 +0200
Message-Id: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds support for two (or more) capture devices to be 
connected to the same senors and run simultaneously. Each capture device 
can be started and stopped independent of each other.

Patch 1/3 and 2/3 deals with solving the issues that arises once two 
capture devices can be part of the same pipeline. While 3/3 allows for 
two capture devices to be part of the same pipeline and thus allows for 
simultaneously use.

The series is based on the latest media-tree and it functionality can be 
demonstrated with the following test.

>>> begin test <<<
mdev=/dev/media0

media-ctl -d $mdev -l "'Debayer A':1 -> 'Scaler':0 [1]"
media-ctl -d $mdev -l "'Debayer B':1 -> 'Scaler':0 [0]"

media-ctl -d $mdev -V "'Debayer A':0 [fmt:RGB888_1X24/640x480 field:none]"
media-ctl -d /dev/media0 -V "'Sensor A':0 [fmt:SRGGB8_1X8/640x480 field:none]"

yavta -f RGB24 -s 1920x1440 --field none /dev/video2
yavta -f SRGGB8 -s 640x480 --field none /dev/video0

yavta -f RGB24 -s 1920x1440 --field none /dev/video2 --capture=100 &
yavta -f SRGGB8 -s 640x480 --field none /dev/video0 --capture=100
wait
>>> end test <<<

In addition to testing with this test the series is tested with multiple 
qv4l2 instances controlling different capture devices connected to the 
same sensor.

Niklas Söderlund (3):
  vimc: Add usage count to subdevices
  vimc: Serialize vimc_streamer_s_stream()
  vimc: Join pipeline if one already exists

 drivers/media/platform/vimc/vimc-capture.c  | 35 ++++++++++++++++++++-
 drivers/media/platform/vimc/vimc-debayer.c  |  8 +++++
 drivers/media/platform/vimc/vimc-scaler.c   |  8 +++++
 drivers/media/platform/vimc/vimc-sensor.c   |  7 +++++
 drivers/media/platform/vimc/vimc-streamer.c | 23 +++++++++-----
 5 files changed, 73 insertions(+), 8 deletions(-)

-- 
2.21.0

