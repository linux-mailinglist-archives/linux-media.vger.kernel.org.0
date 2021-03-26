Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C94D34A9D9
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 15:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhCZOfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 10:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhCZOfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:05 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28059C0613B5
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:35:04 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so5040687wml.2
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X3l551s5G/pAF2wkYmEGgkPl5576caUaplD4n6kxekE=;
        b=MTRryAA06req0yLkcmh0+vjQXJlDARQPhUrLZiiD0V629oE/6wzOWZ4olgS2tVfZKf
         GhzFt96jl+vOy4dKSROxDJg+OomuFS/6kPkB3gqlJTX8kgMhkWvvN4x7+adh72SDEc/i
         IosIat3qSscvWHtAqM73Ekp8IVStGN4NAGzEz7KDN1334y2kC2zYNpgaPgVkDUn5Z4zS
         6EXicNQ7KUdBgCnq4Gp/0HoxagX+ru0hgRtEBWGPJkv6Nznmd+N3/tbTSDfW5sLA6z3l
         OPe14PbUR8UxjVTR6cRUeQgETo+jq7AQD1kdVih5tXqhS2khRSfAQQcwId4Z1SJWolSD
         il7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X3l551s5G/pAF2wkYmEGgkPl5576caUaplD4n6kxekE=;
        b=Cpin1hWPJTcnrtQWA7YFUsc6oa7G1QQtJOB5aRx1/ORxtLjtzUeKsqdn6Ukl8V+dB7
         jvhviuFhYwAXJ1+KP9/X6/gnw9uwKxPd73x3CVxfQVWtq3ZvJpwSfOiEOFxTo4FPsRIm
         VOFYOZPvVVhIHUNRdcBNKlMN3lt98Dr+0UaznfWXuES3dKgxj/Tiart04oHRNXpkedxh
         BDlM7dLPc4vakXlHIKyrvuZOyUDNdK7K8SG7CGdXpsLUtAYU11pensDzQnou5pU1fDTw
         PzZJ5UUj89WHJy1SoMjaQhGdKm5owpcouFmgn6GR1MDsui4vX69py/+gyILFL1hbNjAi
         BlCw==
X-Gm-Message-State: AOAM531YHBrsH6Hc79i1GCUdyXJpAiVxyEskOrlGdKEH4xyWgu2wB++l
        B3l/mfq0MVkYNu3dZjQD7bfagw==
X-Google-Smtp-Source: ABdhPJys2BqxpGOTGUAOVltyeRUwXqaB5Ir7KGDurKi6UIWqunYXDHtl6cDvVh06p/RXnXTrderF7w==
X-Received: by 2002:a1c:6543:: with SMTP id z64mr13457846wmb.50.1616769302815;
        Fri, 26 Mar 2021 07:35:02 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:02 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Anssi Hannula <anssi.hannula@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Drubin <daniel.drubin@intel.com>,
        Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Henrik Rydberg <rydberg@bitmath.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-usb@vger.kernel.org, Lopez Casado <nlopezcasad@logitech.com>,
        "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>,
        Masaki Ota <masaki.ota@jp.alps.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        message to <vojtech@ucw.cz>,
        Michael Haboustak <mike-@cinci.rr.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Vojtech Pavlik <vojtech@suse.cz>,
        Zhang Lixu <lixu.zhang@intel.com>
Subject: [RESEND 00/25] Rid W=1 warnings from HID
Date:   Fri, 26 Mar 2021 14:34:33 +0000
Message-Id: <20210326143458.508959-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

[RESEND] contains no functional changes.  Only 18 of 25 patches
actually made it to the list during the first attempt.

Lee Jones (25):
  HID: intel-ish-hid: Remove unused variable 'err'
  HID: ishtp-hid-client: Move variable to where it's actually used
  HID: intel-ish-hid: pci-ish: Remove unused variable 'ret'
  HID: intel-ish: Supply some missing param descriptions
  HID: intel-ish: Fix a naming disparity and a formatting error
  HID: usbhid: Repair a formatting issue in a struct description
  HID: intel-ish-hid: Fix a little doc-rot
  HID: usbhid: hid-pidff: Demote a couple kernel-doc abuses
  HID: hid-alps: Correct struct misnaming
  HID: intel-ish-hid: Fix potential copy/paste error
  HID: hid-core: Fix incorrect function name in header
  HID: intel-ish-hid: ipc: Correct fw_reset_work_fn() function name in
    header
  HID: ishtp-hid-client: Fix incorrect function name report_bad_packet()
  HID: hid-kye: Fix incorrect function name for kye_tablet_enable()
  HID: hid-picolcd_core: Remove unused variable 'ret'
  HID: hid-logitech-hidpp: Fix conformant kernel-doc header and demote
    abuses
  HID: hid-uclogic-rdesc: Kernel-doc is for functions and structs
  HID: hid-thrustmaster: Demote a bunch of kernel-doc abuses
  HID: hid-uclogic-params: Ensure function names are present and correct
    in kernel-doc headers
  HID: hid-sensor-custom: Remove unused variable 'ret'
  HID: wacom_sys: Demote kernel-doc abuse
  HID: hid-sensor-hub: Remove unused struct member 'quirks'
  HID: hid-sensor-hub: Move 'hsdev' description to correct struct
    definition
  HID: intel-ish-hid: ishtp-fw-loader: Fix a bunch of formatting issues
  HID: ishtp-hid-client: Fix 'suggest-attribute=format' compiler warning

 drivers/hid/hid-alps.c                       |  2 +-
 drivers/hid/hid-core.c                       |  2 +-
 drivers/hid/hid-kye.c                        |  2 +-
 drivers/hid/hid-logitech-hidpp.c             |  7 +--
 drivers/hid/hid-picolcd_core.c               |  5 +--
 drivers/hid/hid-sensor-custom.c              |  5 +--
 drivers/hid/hid-sensor-hub.c                 |  4 +-
 drivers/hid/hid-thrustmaster.c               | 24 +++++------
 drivers/hid/hid-uclogic-params.c             |  8 ++--
 drivers/hid/hid-uclogic-rdesc.c              |  2 +-
 drivers/hid/intel-ish-hid/ipc/ipc.c          |  2 +-
 drivers/hid/intel-ish-hid/ipc/pci-ish.c      |  3 +-
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c  | 45 ++++++++++----------
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 11 +++--
 drivers/hid/intel-ish-hid/ishtp-hid.c        |  2 +-
 drivers/hid/intel-ish-hid/ishtp-hid.h        |  9 +---
 drivers/hid/intel-ish-hid/ishtp/bus.c        |  9 +++-
 drivers/hid/intel-ish-hid/ishtp/client.c     |  5 +--
 drivers/hid/intel-ish-hid/ishtp/hbm.c        |  4 +-
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h  |  4 +-
 drivers/hid/usbhid/hid-pidff.c               |  4 +-
 drivers/hid/usbhid/usbkbd.c                  |  2 +-
 drivers/hid/wacom_sys.c                      |  2 +-
 include/linux/intel-ish-client-if.h          |  8 +++-
 24 files changed, 90 insertions(+), 81 deletions(-)

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Anssi Hannula <anssi.hannula@gmail.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Drubin <daniel.drubin@intel.com>
Cc: Dario Pagani <dario.pagani.146+linuxk@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Kim Kuparinen <kimi.h.kuparinen@gmail.com>
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-iio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
Cc: Lopez Casado <nlopezcasad@logitech.com>
Cc: "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>
Cc: Masaki Ota <masaki.ota@jp.alps.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: message to <vojtech@ucw.cz>
Cc: Michael Haboustak <mike-@cinci.rr.com>
Cc: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Uwe Kleine-König" <uwe@kleine-koenig.org>
Cc: Vojtech Pavlik <vojtech@suse.cz>
Cc: Zhang Lixu <lixu.zhang@intel.com>
-- 
2.27.0

