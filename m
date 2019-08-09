Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4073B88534
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 23:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbfHIVpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 17:45:49 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36322 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfHIVpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 17:45:49 -0400
Received: by mail-ot1-f67.google.com with SMTP id k18so6015193otr.3
        for <linux-media@vger.kernel.org>; Fri, 09 Aug 2019 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M48eQrSmRcufMA53HgUQyS8dq2Nu8Xs4NQ22iVBuJgE=;
        b=RJ1wSfwvc+G7FQwYPtQ09oWeC48v1QJ6MwpZY8Y5Xdtg3XWtiaNUxhZQ34qAhP/u5W
         evnj3ivbylX4tazZlwf2m7k0SsPfCjLz/luZIcsT8odryVWRQ3z5noUBpJ83630sYa4H
         1u9gi1ML8MDwEGZPWT5EqEOxNpcnOpBIjU32w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M48eQrSmRcufMA53HgUQyS8dq2Nu8Xs4NQ22iVBuJgE=;
        b=Obe6MP8GZsA5zcVl/LtVu0VH5JHgGYEngjKD+NKksKbJopOMIxPfS7FyxgOmwK/PKz
         i8hv1nGx2OF7JtXbV8JBYitVS/DaLWIsdfAXoQPh1pBYfu+WknwR5EudMYiZAQRIdYbo
         5vqb+9J9VOI6EJotrf1lzt7bu+4sTlwNqi6vaeEb2WmK0E6L5f2CdHEBzNqvDNX/ofsR
         y/9z7LGXMx1edP1xuPw9z4zRe24CNQnClalkLuisYwDWNBza9KwFhVcYPIs7/OxkfGgo
         XBDzj/IOrY4xEKaKCfBLsoYJ5m5C6GIZZJMuVkPB9Fm1NwFiktjnZJfd2wP5YUtaZUAc
         WdHg==
X-Gm-Message-State: APjAAAXlMBahDC941KuLPudRqPHX7IlGbRBNTXjvhzHKgWD4Uj7jVI5g
        VhzazFd6hNZRE4CXgBdgyiw7Rg==
X-Google-Smtp-Source: APXvYqyRnC3TiLZlqVN1zOSnhWepLiUuxi5v7tzyFkAiBqA0RlH9p7Iqmhcp2E2KL0u9SY5oFEfgcg==
X-Received: by 2002:a02:54c1:: with SMTP id t184mr25328927jaa.10.1565387147992;
        Fri, 09 Aug 2019 14:45:47 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id n17sm75861623iog.63.2019.08.09.14.45.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 14:45:47 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/3] Collapse vimc into single monolithic driver
Date:   Fri,  9 Aug 2019 15:45:40 -0600
Message-Id: <cover.1565386363.git.skhan@linuxfoundation.org>
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

This patch series emoves the component API and makes minimal changes to
the code base preserving the functional division of the code structure.
Preserving the functional structure allows us to split the sensor off
as a separate module in the future.

Major design elements in this change are:
    - Use existing struct vimc_ent_config and struct vimc_pipeline_config
      to drive the initialization of the functional components.
    - Make vimc_ent_config global by moving it to vimc.h
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
    - vimc-core invokes "rm" hooks from its unregister to unregister subdevs
      and cleanup.
    - vimc-core invokes "add" and "rm" hooks with pointer to struct vimc_device
      and the corresponding struct vimc_ent_config pointer.
    
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

The third patch in the series fixes a general protection fault found
when rmmod is done while stream is active.

vimc_print_dot (--print-dot) topology after this change:
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
}

Shuah Khan (3):
  media: vimc: move private defines to a common header
  media: vimc: Collapse component structure into a single monolithic
    driver
  media: vimc: Fix gpf in rmmod path when stream is active

 drivers/media/platform/vimc/Makefile       |   7 +-
 drivers/media/platform/vimc/vimc-capture.c |  96 ++----------
 drivers/media/platform/vimc/vimc-common.c  |   2 +-
 drivers/media/platform/vimc/vimc-core.c    | 174 +++++++--------------
 drivers/media/platform/vimc/vimc-debayer.c |  84 ++--------
 drivers/media/platform/vimc/vimc-scaler.c  |  83 ++--------
 drivers/media/platform/vimc/vimc-sensor.c  |  82 ++--------
 drivers/media/platform/vimc/vimc.h         | 121 ++++++++++++++
 8 files changed, 230 insertions(+), 419 deletions(-)
 create mode 100644 drivers/media/platform/vimc/vimc.h

-- 
2.17.1

