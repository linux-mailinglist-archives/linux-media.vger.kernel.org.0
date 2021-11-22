Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FB44598AF
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 00:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhKVX7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 18:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhKVX7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 18:59:37 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8F2C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 15:56:30 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so1115267wme.4
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 15:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=031Z+I6t6fEgS0jDr+9ciKZZyUzh+MFvha3S2RCp7mc=;
        b=dgb7AZuW5q1v6ww1Xkc56qRMI4r3p7ZQqliO4UPa42auNHRfaDLq+v6sG5eCqJBp3c
         8s96e4il1kHr/nC99PYT37LnceNBwneRdrDUzWaS4KXLiMdp8fhTSpQFqEdXPGyTylKG
         4ut8fvrI40ZXeY4VEM01Ecm9qsr4KQXv63QAYGF+lyoT1BPZMJ+Cjyo2YS+BTWkuqMQC
         hCHmlBYKyju2vA49YHcVFij+CWEkv3D7XTAd8t3P71WR5UlGVEoriPc42ivY43VvlvGv
         uFTFKP733TqKlXT7uoXxwGlONdNAP3PU9jkMrnsQ4BPvfMqFApBnPChvZO5O+Q2OrRgt
         w2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=031Z+I6t6fEgS0jDr+9ciKZZyUzh+MFvha3S2RCp7mc=;
        b=6y6EwShoenudCyo0gigH9iLOV0JEMwfO8aZ2HegbrNnlwSKKgGoHqtiodHifJeROnR
         Y3z9kSBZMtOviYe2hanNSL0B2F7F0LhPZSuCMbGr+IrVcRw6Eh903aHoGDhun/K15MrQ
         a9LyjY9kxs/GK3rpVq6/Qx6/JEYVwR7ctyFwOterU5kVz3/f6xI8IRWlgGSmc6oro9ak
         xFEt9ZURUvd1D8x0Pl8nL/nyb/yeSK0/8ornl4amZ7zOtjnLWOQIITtf76DUiKHkPM7H
         OEWq4gbT4h7tcBUqipnDGc78GZFqdAhl9A+7eNQUkiUZnVx+ssVlMNLPg6lYwGlQ2VCO
         rfAQ==
X-Gm-Message-State: AOAM531tYs1hDzCjyWZu5GN1VNvSpZkumNlpEKhuSVq669NozAo5pMMc
        /SVFfVrdHWCqx+ftAxtCVGvQb0c4fJA=
X-Google-Smtp-Source: ABdhPJxFusUJMHQM0YB44eft03L7XrE7RVne9K/JUTbVzXwvfguUEJ6d6cGFcGEhGperjcYfbTRZbg==
X-Received: by 2002:a05:600c:3b83:: with SMTP id n3mr1426245wms.116.1637625388762;
        Mon, 22 Nov 2021 15:56:28 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id b188sm10442067wmd.45.2021.11.22.15.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 15:56:28 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v6 0/3] Add support for OV5693 sensor
Date:   Mon, 22 Nov 2021 23:56:10 +0000
Message-Id: <20211122235613.41682-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

This series adds support for the OV5693 sensor found as the front camera in
many Microsoft Surface devices, along with a number of similar style laptops.
It is a heavily adapted derivative of the atomisp-ov5693 driver in staging,
which retains most of the global register settings and some of the other
functions from that driver, but otherwise uses the "normal" v4l2
infrastructure.

Series level changes since V5:

	- Squashed the patches from Hans, and this time didn't screw up their
	application.

Daniel Scally (3):
  media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
  media: i2c: Add support for ov5693 sensor
  media: ipu3-cio2: Add link freq for INT33BE entry

 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov5693.c                    | 1537 +++++++++++++++++
 drivers/media/pci/intel/ipu3/cio2-bridge.c    |    2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   17 +-
 6 files changed, 1573 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/i2c/ov5693.c

-- 
2.25.1

