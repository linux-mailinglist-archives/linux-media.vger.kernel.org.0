Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BFE412BB2
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 04:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242110AbhIUCZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 22:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236890AbhIUBvi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 21:51:38 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B542C0DBAA1
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 15:54:43 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t7so660420wrw.13
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 15:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iNG3yTWA/sE617LtOOUgQRULN4NE0uZ9YKDdQW79KI=;
        b=a+lDuTJQBlTj1dMD63ZbL6TUyyIhuPD2bf7NmEZ6+4uBtlY7XGBXuClp77s28b/VxB
         ljBCFtHNrZEL8nklN5fhIDs7GB9RqExYYHEEA2wYJtc5Eo5ZPKHr2qG1ubPCkt+F4mcI
         xf3g4d/wyI+srKQIg0H5U+C3L9VTGCEtFfsWELajYwsYkb6uQjiBuosgg0KDM+UBNwm0
         QHrOsqRKLLg8viY/F0cQXvZKy0yqKbZJijkCxiulo+riERdbDQOzcAj5qZkw66uoDmJS
         qpu5Xz4K2GWzpw6NGa3KgzZp+ySG2drrEfpYzN29Oyw7Bi4kIrcOMIlfccNmcopJrw+m
         Iakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iNG3yTWA/sE617LtOOUgQRULN4NE0uZ9YKDdQW79KI=;
        b=dfdgHD2dKVr53ZhOEIgA+Xx6m/PFdBuWsBZ62vOmFnknpb22LqvZ1+89FB+dUqnxFk
         wKJT0rYUNaEwoRL+7jXixZGpXqoZWG9jKdSCLhVblR6+0sudIny67ilX8pqt53CSb8zd
         AFEAws30PeyRcmkNLGnVu2w4+/7k7+1j/06l7zgnHoEQZecb4psRNI/mDIPIA/EUxpsp
         ytdI4Ii0uq9vb54EfggeoM3MvGWfx9TqGziU3tZo/fFO640AWn7dH8z0CPLpat6beZus
         PfX1syS4l3TS0gOh5KfGqh00e9XiJLVxdVXD9uepUEd8MSgglfxsYIBTlB0NFHKjGGTa
         EkjQ==
X-Gm-Message-State: AOAM5300sTDDNlZmLKBIquy/M3r4Pom1sgzN7WmE8tFPkaKzNefsnBYw
        f89fkewqxmTXbO3TGu8ksqjDgxniRKQ=
X-Google-Smtp-Source: ABdhPJzgvx4PJuEM4OjwratnZF7w1QgIMp11jk1JjuYYdZ5kGRJGAP0bEEfr+9UMEHvBCuCy22M4TA==
X-Received: by 2002:a05:6000:2cf:: with SMTP id o15mr31288820wry.364.1632178481613;
        Mon, 20 Sep 2021 15:54:41 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s10sm17234976wrg.42.2021.09.20.15.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 15:54:41 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com
Subject: [PATCH v3 0/2] Add support for OV5693 Sensor
Date:   Mon, 20 Sep 2021 23:54:20 +0100
Message-Id: <20210920225422.42618-1-djrscally@gmail.com>
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

This has been quite a while since the v2 - sorry about that, changes are
actually very minimal since then; a couple of updated register values.

As we're targeting libcamera, all mandatory, recommended and optional controls
for that library (at least, at time of writing) are supported.

Daniel Scally (2):
  media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
  media: i2c: Add support for ov5693 sensor

 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov5693.c                    | 1558 +++++++++++++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   15 +-
 5 files changed, 1591 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/i2c/ov5693.c

-- 
2.25.1

