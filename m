Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4CCAB531F
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 18:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730566AbfIQQfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 12:35:51 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43301 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730444AbfIQQfS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 12:35:18 -0400
Received: by mail-io1-f68.google.com with SMTP id v2so9072681iob.10
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 09:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R6WuAQYqzuDG/O4h+vMzz9oDXBPPbve7hMAWfggywJE=;
        b=F2rtRdVt78LbzH85Cc9dQbb91WInZ5QPhPHAbQmekQmlptyovSDimBiCeoXzOE+BiX
         9+n1hLxmAHmK1CuqPCHfy3bAgpSfT81PwjOGLlmkfbmB/QVsBxMMYInknMAUeLSeRdQr
         s6wR64EvLap4uXkf0tOd82wsLk8rCnE3Hf5i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R6WuAQYqzuDG/O4h+vMzz9oDXBPPbve7hMAWfggywJE=;
        b=bF2nXr2Oj4RnKU3GRVH8z9O7FE70git7LWr9TWKQGU+aNbNTUOfmntnV/BmPBt9BKG
         Yy9Ibiitt3hUqvoeEFyDLcOCwXtFYWdXiiftModFYBYOFr3jPh5mvWlfK2DFQhW18MNn
         b0235npF3r7Dk1x7oOks/tOmfEdsiug3AyDq2ykhFdszNjFUTw7UQJAw484gpr5+hHNT
         z2Oky5JNogWEdHXtuJqa0IxFvKg9wK39T7lcgy8FabvF17XZ60FbAFQHy1jZ6NTIWImh
         aeguW/Ah90Q01r060AA4aeEm9Al+kQSgRHfSheEtvZto9DIR5fnTQRv66KeMzKDGQjHt
         zZ8w==
X-Gm-Message-State: APjAAAXtev81SgK4OPpu5A9I5tBO2kmgJjEdSjb41CVM/oLy86nnZcsv
        dhIirNu9T436eNrh/GV3kHtd8w==
X-Google-Smtp-Source: APXvYqz2Dplu1nesxQbr44EF/OQRHMvqhOVpR7flUVdI5T7hgMr8LUcEqRAx25bntrc2Ys4zivJVvA==
X-Received: by 2002:a5d:9a0a:: with SMTP id s10mr1500281iol.288.1568738117180;
        Tue, 17 Sep 2019 09:35:17 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v3sm2593781ioh.51.2019.09.17.09.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 09:35:16 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com,
        skhan@linuxfoundation.org, andrealmeid@collabora.com,
        dafna.hirschfeld@collabora.com, hverkuil-cisco@xs4all.nl,
        davem@davemloft.net, gregkh@linuxfoundation.org,
        nicolas.ferre@microchip.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] Collapse vimc into single monolithic driver
Date:   Tue, 17 Sep 2019 10:35:07 -0600
Message-Id: <cover.1568689325.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

imc uses Component API to split the driver into functional components.
The real hardware resembles a monolith structure than component and
component structure added a level of complexity making it hard to
maintain without adding any real benefit.

The sensor is one vimc component that would makes sense to be a separate
module to closely align with the real hardware. It would be easier to
collapse vimc into single monolithic driver first and then split the
sensor off as a separate module.

This patch series removes the component API and makes minimal changes to
the code base preserving the functional division of the code structure.
Preserving the functional structure allows us to split the sensor off
as a separate module in the future.

The following configure and stream test works on all devices.

    media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
    media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
    media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
    media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'

    v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
    v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
    v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81

    v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video1
    v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
    v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video3

The second patch in the series fixes a general protection fault found
when rmmod is done while stream is active.

- rmmod while streaming returns vimc is in use
- rmmod without active stream works correctly

Changes since v4:
- Comments from Helen on Patch 1/5. Removed includes that are no longer
  needed. Added linux/moduleparam.h to vimc-debayer.c and vimc-scaler.c
  for module_param().
- Returm value and spelling errors fixed.

Changes since v3: (5 patches)
Patch 1:
- Main change is adding an array of struct vimc_ent_device(s) to save
  vimc_ent_device(s), subdevs create in their "add" hooks. These
  get used to create links and removing the subdevs. vimc-core allocates
  this array which sized to number of entries in the topology defined in
  the vimc_pipeline_config structure.
- Remove links when register fails before registering the media device.
  In this case, entity links need to be removed from error paths.
Patch 2: no change.
New patch 3:
- Cleaning up duplicated IS_SRC and IS_SINK defines and moving them to
  common header.
New patch 4:
- Documentation module parameter usage updates.
New patch 5:
- Lastly adding myself as a reviewers to MAINTAINERS file for vimc

Changes since v2:
- Rebase to media master on top of vimc reverts
- Rename "vent" variable to "vcfg" to reflect config and standout
  from "ved"
- Error handling when adding subdevs fails to remove already added
  subdevs, do other clean-up and bail out.

Changes since v1:
Patch 1 & 2: (patch 1 in this series)
- Collapsed the two patches into one
- Added common defines (vimc_device and vimc_ent_config) to vimc-common.h
  based on our discussion.
- Addressed review comments from Helen and Laurent
- Use vimc-common.h instead of creating a new file.
- Other minor comments from Helen on int vs. unsigned int and
  not needing to initialize ret in vimc_add_subdevs()
Patch 3 (patch 2 in this series):
- The second patch is the fix for gpf. Updated the patch after looking
  at the test results from Andre and Helen. This problem is in a common
  code and impacts all subdevs. The fix addresses the core problem and
  fixes it. Fix removes pads release from v4l2_device_unregister_subdev()
  and pads are now released from the sd release handler with all other
  resources.

Outstanding:
- Update documentation with the correct topology.
- There is one outstanding gpf remaining in the unbind path. I will
  fix that in a separate patch. This is an existing problem and will
  be easier to fix on top of this patch series.

vimc_print_dot (--print-dot) topology after this change: (no change
compared to media master)
digraph board {
        rankdir=TB
        n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
        n00000001:port0 -> n00000005:port0 [style=bold]
        n00000001:port0 -> n0000000b [style=bold]
        n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
        n00000003:port0 -> n00000008:port0 [style=bold]
        n00000003:port0 -> n0000000f [style=bold]
        n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
        n00000005:port1 -> n00000015:port0
        n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
        n00000008:port1 -> n00000015:port0 [style=dashed]
        n0000000b [label="Raw Capture 0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
        n0000000f [label="Raw Capture 1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
        n00000013 [label="{{} | RGB/YUV Input\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
        n00000013:port0 -> n00000015:port0 [style=dashed]
        n00000015 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
        n00000015:port1 -> n00000018 [style=bold]
        n00000018 [label="RGB/YUV Capture\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
}

Shuah Khan (5):
  media: vimc: Collapse component structure into a single monolithic
    driver
  media: vimc: Fix gpf in rmmod path when stream is active
  vimc: move duplicated IS_SRC and IS_SINK to common header
  doc: media: vimc: Update module parameter usage information
  MAINTAINERS: Add reviewer to vimc driver

 Documentation/media/v4l-drivers/vimc.rst    |  12 +-
 MAINTAINERS                                 |   1 +
 drivers/media/platform/vimc/Makefile        |   7 +-
 drivers/media/platform/vimc/vimc-capture.c  |  81 ++------
 drivers/media/platform/vimc/vimc-common.c   |   3 +-
 drivers/media/platform/vimc/vimc-common.h   |  58 ++++++
 drivers/media/platform/vimc/vimc-core.c     | 216 ++++++++------------
 drivers/media/platform/vimc/vimc-debayer.c  |  85 ++------
 drivers/media/platform/vimc/vimc-scaler.c   |  84 ++------
 drivers/media/platform/vimc/vimc-sensor.c   |  74 ++-----
 drivers/media/platform/vimc/vimc-streamer.c |   1 -
 11 files changed, 217 insertions(+), 405 deletions(-)

-- 
2.20.1

