Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C9F1A8BD7
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 22:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505387AbgDNUCd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 16:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505367AbgDNUCS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 16:02:18 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2539FC061A10
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 13:02:18 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id l14so1197574ljj.5
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 13:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iy1YXWO5laLm10GzQHnsg5e4RQXfAXSg1PWIeEl3QAU=;
        b=ajAbHjJbMiUyLCO+fE3RKVK/bVQj2yNamrMl1h60NVGyciFbu341rumSDLdDC9rQ26
         LHAjI04ozufudiPj3qciitPlc4KYnF81vt6qaxSIALxaBe0N/m88Pov0/1AW3/NhtMC3
         0YMyh8YvX9QjFsoVLjgx2eHqBxdGwgLdrW6qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iy1YXWO5laLm10GzQHnsg5e4RQXfAXSg1PWIeEl3QAU=;
        b=jKy0NP0rXVrF/IB6wZadURUe+7RuzytzEO2TjXyiv4bTG4cFYGSqa9WGCjdcyDjmZ9
         LNGjOFvNZgZ82bsUZYu04tYbyteU+AdWXldsmhfWjIhAbqkwDQ4w96Ly/tS2q2q2kz0n
         NuMNZgs1WTKL8WakUUw5g590Fwea3cIDQfnrXXOA1D4DAUfY2dpekES9suErjaQzhHMZ
         ujR79cd7TnOtqIXXYRIiPNAfG1HCtrMFo4ovN87ba0Gr1q2eoFNfzXZFuurgCyAkY5fa
         ZLc8jOJn+Tjm81xfh9LFwZx9ay8LU2mU6auIe4gXmJcEgdVXh3UcWClJbO6N2R3CZtdk
         9b1A==
X-Gm-Message-State: AGi0PuauIHUucn9GRKTjflOIc9MXXYJ4lYyjCVXx6G44H/dOJdA3gcCx
        FaSI+NIxFh0g9+yfR4sQfOQnHmiQegQ=
X-Google-Smtp-Source: APiQypIWc7hSnSIjw52g80XaetpCRsCdbkcCRnrMGWL5hZRB0mukjm2kA26/FVi1HnDGpty8xHJ69A==
X-Received: by 2002:a2e:968d:: with SMTP id q13mr1136690lji.62.1586894536533;
        Tue, 14 Apr 2020 13:02:16 -0700 (PDT)
Received: from localhost.localdomain (62-243-86-95-cable.dk.customer.tdc.net. [62.243.86.95])
        by smtp.gmail.com with ESMTPSA id v4sm3525254ljj.104.2020.04.14.13.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:02:15 -0700 (PDT)
From:   Daniel Gomez <daniel@qtec.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Daniel Gomez <daniel@qtec.com>
Subject: [RFC PATCH 0/3] v4l2 api changes for imx378 driver
Date:   Tue, 14 Apr 2020 22:01:48 +0200
Message-Id: <20200414200151.80089-1-daniel@qtec.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I would like to discuss with you guys the next two following topics:

* VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL:

I'm working on a driver for the imx378 sensor but the current v4l2-subdev API 
(VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL) doesn't allow you to set up a range of frame
intervals. However, this is supported in the v4l2 device API level. My idea is
to follow the same approach as the VIDIOC_SUBDEV_ENUM_FRAME_SIZE by setting a
min and max intervals in the VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL to solve this
missing support.

This is the current output of VIDIOC_ENUM_FRAMEINTERVALS in continous mode:

v4l2-ctl --list-frameintervals width=1920,height=1080,pixelformat=pRAA \
-d /dev/video0
ioctl: VIDIOC_ENUM_FRAMEINTERVALS
Interval: Continuous 0.029s - 0.607s (1.648-34.797 fps)

This is the current output of VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL:

v4l2-ctl --list-subdev-frameintervals code=0x300f,width=1920,height=1080 \
-d /dev/v4l-subdev19
ioctl: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL (pad=0)
Interval: 0.029s (34.797 fps)

So, the idea would be to return the interval range from the v4l2-subdev level
to the device level. Besides that, it would also be necessary to adapt the
v4l-utils tools (compliance and ctl).

What do you think guys?
Please, follow the RFC patch series to see my suggestion.

* V4L2_CID_TEMPERATURE:

In addition to this, the driver is able to report as a v4l2 control the
temperature of the sensor. Since is quite 'general' control I also included the
v4l2 temperature control as part of the common v4l2 control list.

Would it be also possible?

In the RFC patch series you will find the the modified code for the
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL and V4L2_CID_TEMPERATURE topics as well as
the imx378 driver using the above.

Daniel Gomez (3):
  media: v4l2-subdev.h: Add min and max enum
  media: v4l2: Add v4l2 control IDs for temperature
  media: imx378: Add imx378 camera sensor driver

 drivers/media/i2c/Kconfig            |   11 +
 drivers/media/i2c/Makefile           |    1 +
 drivers/media/i2c/imx378.c           | 1829 ++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c |    5 +
 include/uapi/linux/v4l2-controls.h   |    4 +-
 include/uapi/linux/v4l2-subdev.h     |    6 +-
 6 files changed, 1854 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/i2c/imx378.c

--
2.25.1

