Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D68F68F4E4
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 21:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733019AbfHOTmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 15:42:17 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43643 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729900AbfHOTmQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 15:42:16 -0400
Received: by mail-io1-f66.google.com with SMTP id 18so1528209ioe.10
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 12:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fdeUDnIIJr/lvtRblubrloL6VFzDFPRgR9hA+XA26mE=;
        b=SQMxZ8teg004ySCkI/0Zr6jFx3rY72qjetgxGNV/bEZoELYa5/+30wpuXr77cfhCEl
         JcLIX9IUXhmVcvH6M9RjroqNsJ/EM5nzGzxtVrTqujcRhqhEL9/nhUB9OUvWkMXyhkzk
         gQ1itkV8dIOKepCpqo5v8m/sQa/U+wJoQ/qyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fdeUDnIIJr/lvtRblubrloL6VFzDFPRgR9hA+XA26mE=;
        b=Xz1tNHWjMSu5eWoSo0EFwplibuTd28aLIu3TLN9WEm7OPL/9/lHF0EoHYzbR9dRy6/
         FKaBevfXQtz5zQHSNAuo2ny2jE0UeTHQqDmOA4sdV2jMYpY3BXXcvUZaSTlofpKcjnIu
         KuoP2t9uXlo6wEHKWSZmDFh7vZsNrj/p/mdRe43i4mmDH3DdUwfctwDbFYLXQnVx4H8u
         nL+6akU1v8VbDQ73VIa2W6a7V0XxE0ymp/hq75PBDNI1znkxXUMhxlmTV1okIBWBNBWs
         mqGTLCndAwaJIRw0DAoE0Lb1AaZnND3CV8g8u7seNg51+vq2wB5FLBslImYeDfR5P2l6
         e9vQ==
X-Gm-Message-State: APjAAAW/25Zg21QVSaTZqKxeuiOTaQ/wREebVt2jDj1yLMGAcbZqvazD
        h0cijRL5coJk9bn24TTPrRDy9Q==
X-Google-Smtp-Source: APXvYqzzg/kSWN+TWqTtlTte5KSl8bMafVmCGFeLnx9iyc4QBoyt7wQxlDMSXTaxIqVmv3AG12cPHg==
X-Received: by 2002:a5d:860e:: with SMTP id f14mr7212001iol.242.1565898135816;
        Thu, 15 Aug 2019 12:42:15 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j16sm3624268iok.34.2019.08.15.12.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2019 12:42:15 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, andrealmeid@collabora.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] Collapse vimc into single monolithic driver
Date:   Thu, 15 Aug 2019 13:42:11 -0600
Message-Id: <cover.1565740213.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vimc uses Component API to split the driver into functional components.
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

Major design elements in this change are:
    - Use existing struct vimc_ent_config and struct vimc_pipeline_config
      to drive the initialization of the functional components.
    - Make vimc_device and vimc_ent_config global by moving them to
      vimc-common.h
    - Add two new hooks add and rm to initialize and register, unregister
      and free subdevs.
    - All component API is now gone and bind and unbind hooks are modified
      to do "add" and "rm" with minimal changes to just add and rm subdevs.
    - vimc-core's bind and unbind are now register and unregister.
    - vimc-core invokes "add" hooks from its vimc_register_devices().
      The "add" hooks remain the same and register subdevs. They don't
      create platform devices of their own and use vimc's pdev.dev as
      their reference device. The "add" hooks save their vimc_ent_device(s)
      in the corresponding vimc_ent_config.
    - vimc-core invokes "rm" hooks from its unregister to unregister
      subdevs and cleanup.
    - vimc-core invokes "add" and "rm" hooks with pointer to struct
      vimc_device and the corresponding struct vimc_ent_config pointer.

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
        n0000000b [label="Raw Capture 0\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
        n0000000f [label="Raw Capture 1\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
        n00000013 [label="{{} | RGB/YUV Input\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
        n00000013:port0 -> n00000015:port0 [style=dashed]
        n00000015 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
        n00000015:port1 -> n00000018 [style=bold]
        n00000018 [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]

Shuah Khan (2):
  media: vimc: Collapse component structure into a single monolithic
    driver
  media: vimc: Fix gpf in rmmod path when stream is active

 drivers/media/platform/vimc/Makefile       |   7 +-
 drivers/media/platform/vimc/vimc-capture.c |  75 ++-------
 drivers/media/platform/vimc/vimc-common.c  |   3 +-
 drivers/media/platform/vimc/vimc-common.h  |  54 ++++++
 drivers/media/platform/vimc/vimc-core.c    | 182 +++++++--------------
 drivers/media/platform/vimc/vimc-debayer.c |  69 ++------
 drivers/media/platform/vimc/vimc-scaler.c  |  69 ++------
 drivers/media/platform/vimc/vimc-sensor.c  |  70 ++------
 8 files changed, 161 insertions(+), 368 deletions(-)

-- 
2.17.1

