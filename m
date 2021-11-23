Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E35E4598C0
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhKWADi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232653AbhKWADe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:34 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFAAC06174A
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:25 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d5so35748665wrc.1
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+G7K+/x8Ee9T4dkAqN65fUVLPz05VL4EgyaUucj7DU=;
        b=YTLZoSC6il0mzFaiFBV+OJBNwNRlqApvtDieLBEgEVScHXeblfaAewCogtsHOWRRrO
         bDziOaKOGL7tUPAIyYJwali5MGP2wAJGWUoOLSOGIZLi+7p8dCk5X8FQ3w8hhJfzXrhC
         nef7hkN2GHZJD5cwuO5GCyVthoBRsVGt7A4DB/NCWBJyN6LkDjVFCyv2gJ2yjX/FkFsA
         OU+pgA1Wa8ghqy69ywAmfOTpiTpt4AZFINUyAx42Dl5G6fZDL3u1Oaefd9f+hRTSXAsS
         2JgfMerAkaDvUeKe1pp+lTPo6Jcds4Lz78IUK6maYGVMxXb8E6hEC6z0zhEoISl+4jA/
         MagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+G7K+/x8Ee9T4dkAqN65fUVLPz05VL4EgyaUucj7DU=;
        b=NFZdkKqJVMF6OANbh5ZLu/JyRLsi/VNeh1H2EpjqbuSlL9R9fA2L79RmMndWJazgZ9
         2yWSAcaGjUbNRz2Z9DMgw5b5TlAKvZw7YKqlWMVcejLMRF6G85IcnXC6GTps5Ksf9lZb
         xnNtrhqNEa+4ThQhOcz80gr7Y0naHWpVKkjhcCRU43hTTzU9+/V4ylHQBXizPIb4KKbE
         74m4daEOLHpeYRhLEDU9nrfhCimP81zery5abPI0nEZn/ywTGP5s+raM/4DcS6vNkW/w
         GjwT2hGdWGD5m2R5UZ3VCxnoDTh0yAXLW067t8bDIMzHNz+/7t7f4mBTaMM+nuh4jUWU
         gn7w==
X-Gm-Message-State: AOAM532jD7TZbofKBJBkzseAKXocpaLm4dO1XgHrGLMl5QdbG/+k2FUg
        ONLX7l8GQmT1bt95iRM0f8kjJ88R5QA=
X-Google-Smtp-Source: ABdhPJyEZOoXMHVQOaaaAiVZtwVCt1UnYg0wyULIIXVGdOMFGFBx+LQr4VtrvGuNDwOSWKutAxB/jQ==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr1740437wru.380.1637625624542;
        Mon, 22 Nov 2021 16:00:24 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:24 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 00/17] Extensions to ov8865 driver
Date:   Tue, 23 Nov 2021 00:00:00 +0000
Message-Id: <20211123000017.43187-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

This series extends the ov8865 driver with:

* Support for binding to ACPI enumerated devices.
* Support for a 19.2MHz clock in addition to existing 24MHz clock support
* Another v4l2_subdev_pad_ops callback
* 4 more V4L2 controls
* makes the driver supported by the cio2-bridge

There's also a little bit of tidying that I did along the way.

The series is tested on an MS Surface Go 2.

Thanks
Dan

Series level changes since v4:

	- Moved the two patches fixing issues to the head of the series and
	added Fixes tags
	- Added a new patch fixing the maximum gain value

Daniel Scally (16):
  media: i2c: Re-order runtime pm initialisation
  media: i2c: Add ACPI support to ov8865
  media: i2c: Fix incorrect value in comment
  media: i2c: Defer probe if not endpoint found
  media: i2c: Support 19.2MHz input clock in ov8865
  media: i2c: Add .get_selection() support to ov8865
  media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
  media: i2c: Add vblank control to ov8865
  media: i2c: Add hblank control to ov8865
  media: i2c: Update HTS values in ov8865
  media: i2c: cap exposure at height + vblank in ov8865
  media: i2c: Add controls from fwnode to ov8865
  media: i2c: Switch exposure control unit to lines
  media: i2c: Use dev_err_probe() in ov8865
  media: i2c: Fix max gain in ov8865
  media: ipu3-cio2: Add INT347A to cio2-bridge

Hans de Goede (1):
  media: i2c: ov8865: Fix lockdep error

 drivers/media/i2c/ov8865.c                 | 466 +++++++++++++++------
 drivers/media/pci/intel/ipu3/cio2-bridge.c |   2 +
 2 files changed, 334 insertions(+), 134 deletions(-)

-- 
2.25.1

