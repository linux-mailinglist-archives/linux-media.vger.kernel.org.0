Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851D4354902
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 00:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhDEW5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 18:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhDEW5R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 18:57:17 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA85CC06174A;
        Mon,  5 Apr 2021 15:57:08 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so8293526wml.2;
        Mon, 05 Apr 2021 15:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahEu8z0vUMVkxOegfIt5zu5B+kqlAEalk9M2770ihhE=;
        b=GgFpge24iqCrsuwb+69+A8uCNhg0moPbGEIgk9A5pxtveR2JKuqrGaopILlmET3Pkg
         gJ3wTgxiDqnjQdrCzaSFpkbh8hpO/7OyiJHN4Q5sjd3ddNqemvz9D7h94E1tQ0H9Cyg2
         g+ldes38snqKPlqIvVCIRzo+fDKYQTmuDBiM20yNG9ZRGH88BTOBQH6fKWzxJDUxKdhB
         FusP+FYZz96Ex3zA/kXne6T6gagZzxvIeSxoI+pfn0vlaza9pbRTqcfWvvft2tvGd3HI
         n9OlJlX0JPKu5UHrKQudrXEuflWFHM1RzxtyFkAtoCi1gCcFm8EU2/P4DvF4uIcowBeY
         FpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahEu8z0vUMVkxOegfIt5zu5B+kqlAEalk9M2770ihhE=;
        b=Y/1GYGoqZcabWaJLT+b4/Fs1sQyKVO8nuoKBahk2TlAfKsIArDt14ZCRGMkmzZoqSq
         F0oa20M3FqIlvrxBFsjLW8foxXOjfWFY7ljPPjkdAt2ojmsRzmvYZPNJwHQ8pNi3MWOe
         UyavpskQ67kfDh3JQT+8yH49SsNc12PQ+5vhm2yBnCj/nqV5uWLzzMPICMT6in5h9MFD
         sHw2yuNtIpy4P4pILxC8xyzRmauL5GoHLpKk64lji8rxXfwjx5HZD5env+sZp43MAIcw
         grFF1ZKEtPWWOXhR2ajqEVl48/kbzbmlJH76CHxuyVsPNWJVk1t6XnIWmTAD/T+biCgU
         i4uQ==
X-Gm-Message-State: AOAM533+wAPvhozfJAJIh6nW8TxDNzyaHcBijGz3jA/e4VO2Ir6GcEik
        WZHKCbOF5ItPa8rukN+xFZ4E+XmpbUceWA==
X-Google-Smtp-Source: ABdhPJyG4NRvBC0GEXD+hEK08aMsut5LnPbZNkMZO8XPuBeZhSIMzyWcsbj4nhMJHv6Y5h+jS4zLOQ==
X-Received: by 2002:a05:600c:4e92:: with SMTP id f18mr1225546wmq.115.1617663427505;
        Mon, 05 Apr 2021 15:57:07 -0700 (PDT)
Received: from valhalla.home ([2.29.208.21])
        by smtp.gmail.com with ESMTPSA id s10sm20173361wrt.90.2021.04.05.15.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:57:06 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com
Cc:     tian.shu.qiu@intel.com, kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, jacopo+renesas@jmondi.org,
        dongchun.zhu@mediatek.com, niklas.soderlund+renesas@ragnatech.se,
        me@fabwu.ch, luzmaximilian@gmail.com,
        jeanmichel.hautbois@ideasonboard.com, kitakar@gmail.com
Subject: [PATCH v2 0/2] Add support for OV5693 Sensor
Date:   Mon,  5 Apr 2021 23:56:52 +0100
Message-Id: <20210405225654.126916-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

Previous version here:
https://lore.kernel.org/linux-media/20210312103239.279523-1-djrscally@gmail.com/

Patch #1 updates the CIO2 driver to call s_stream() for the current sensor
when runtime .suspend() and .resume() ops fire, which should mean the sensor
drivers can pause and restart streaming without having those ops implemented
themselves.

Patch #2 adds support for the OV5693 sensor found as the front camera in
many Microsoft Surface devices, along with a number of similar style laptops.
It is a heavily adapted derivative of the atomisp-ov5693 driver in staging,
which retains most of the global register settings and some of the other
functions from that driver, but otherwise uses the "normal" v4l2
infrastructure.

Daniel Scally (2):
  media: ipu3-cio2: Toggle sensor streaming in pm runtime ops
  media: i2c: Add support for ov5693 sensor

 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov5693.c                    | 1557 +++++++++++++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   15 +-
 5 files changed, 1590 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/i2c/ov5693.c

-- 
2.25.1

