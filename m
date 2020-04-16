Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A680A1ABB45
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 10:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502291AbgDPIbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 04:31:34 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:38703 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2501938AbgDPIbM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 04:31:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OzqRjxi4SlKa1OzqUjQwP0; Thu, 16 Apr 2020 10:26:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587025562; bh=uNmkHU/Mhu6pUjRivQzmSxzCMVkiQvpslszsqKkx2KM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j2iXT4uD8fKKTk9TatONG829aQUexKojy2lO0FwMXU5QzD+atlV3d71gkKE6/e4WS
         hf9PrHUujLVfe7gmYiILOHvCvFtx6/Xn6PiL2Yf/LXnz09pgZr87pjkD0pEoR6v/M2
         dMzC5YDVIp7gBivjBSSYtOqAkCpuR1lnW1ONvKzlAqaSzJI7dKbGtHdMH49uyKuLIe
         utTiTRtGJ80qqX4/yPPjsKZAd9Ez0NcGJBI6lzlBEGWminNnbxiR0qx5d6OT/L44Xp
         y0UOTrHAA4Bl/tB9j4h9PBj+QEn4P6p2njWTMqcoNiin0YTYRUgAmUdpzFz85M8Rcx
         7GK5twRPBUP3Q==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2] media/test_drivers: rename to test-drivers
Message-ID: <7140388c-60d2-9532-0f58-1c96a12e8a8f@xs4all.nl>
Date:   Thu, 16 Apr 2020 10:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPAwS4545wxBx0GCwz8a7cn5EYMlFMwndgFuYu3+WqxJrpRLSIuAiJO5wvb8ERqr/J0nn4o5ONlEG0XSs6KoItrpfwIQjYw2kJ42cxpU6Ycqt0sjbAfU
 h5wVumjhFZ0hFXdq/5jmd9OrFhGYHRSWO0jMNtQm8RXgtB7pBgAyx1lsB/UIPxvvWiKMd5JP4SNm5g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We never use _ in directory names in the media subsystem, so
rename to test-drivers instead for consistency.

Also update MAINTAINERS with the new path.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v1: updated vimc-devel.rst as well.
---
 Documentation/driver-api/media/drivers/vimc-devel.rst       | 4 ++--
 MAINTAINERS                                                 | 6 +++---
 drivers/media/Kconfig                                       | 2 +-
 drivers/media/Makefile                                      | 2 +-
 drivers/media/{test_drivers => test-drivers}/Kconfig        | 6 +++---
 drivers/media/{test_drivers => test-drivers}/Makefile       | 0
 .../media/{test_drivers => test-drivers}/vicodec/Kconfig    | 0
 .../media/{test_drivers => test-drivers}/vicodec/Makefile   | 0
 .../{test_drivers => test-drivers}/vicodec/codec-fwht.c     | 0
 .../{test_drivers => test-drivers}/vicodec/codec-fwht.h     | 0
 .../vicodec/codec-v4l2-fwht.c                               | 0
 .../vicodec/codec-v4l2-fwht.h                               | 0
 .../{test_drivers => test-drivers}/vicodec/vicodec-core.c   | 0
 drivers/media/{test_drivers => test-drivers}/vim2m.c        | 0
 drivers/media/{test_drivers => test-drivers}/vimc/Kconfig   | 0
 drivers/media/{test_drivers => test-drivers}/vimc/Makefile  | 0
 .../{test_drivers => test-drivers}/vimc/vimc-capture.c      | 0
 .../media/{test_drivers => test-drivers}/vimc/vimc-common.c | 0
 .../media/{test_drivers => test-drivers}/vimc/vimc-common.h | 0
 .../media/{test_drivers => test-drivers}/vimc/vimc-core.c   | 0
 .../{test_drivers => test-drivers}/vimc/vimc-debayer.c      | 0
 .../media/{test_drivers => test-drivers}/vimc/vimc-scaler.c | 0
 .../media/{test_drivers => test-drivers}/vimc/vimc-sensor.c | 0
 .../{test_drivers => test-drivers}/vimc/vimc-streamer.c     | 0
 .../{test_drivers => test-drivers}/vimc/vimc-streamer.h     | 0
 drivers/media/{test_drivers => test-drivers}/vivid/Kconfig  | 0
 drivers/media/{test_drivers => test-drivers}/vivid/Makefile | 0
 .../media/{test_drivers => test-drivers}/vivid/vivid-cec.c  | 0
 .../media/{test_drivers => test-drivers}/vivid/vivid-cec.h  | 0
 .../media/{test_drivers => test-drivers}/vivid/vivid-core.c | 0
 .../media/{test_drivers => test-drivers}/vivid/vivid-core.h | 0
 .../{test_drivers => test-drivers}/vivid/vivid-ctrls.c      | 0
 .../{test_drivers => test-drivers}/vivid/vivid-ctrls.h      | 0
 .../vivid/vivid-kthread-cap.c                               | 0
 .../vivid/vivid-kthread-cap.h                               | 0
 .../vivid/vivid-kthread-out.c                               | 0
 .../vivid/vivid-kthread-out.h                               | 0
 .../vivid/vivid-kthread-touch.c                             | 0
 .../vivid/vivid-kthread-touch.h                             | 0
 .../{test_drivers => test-drivers}/vivid/vivid-meta-cap.c   | 0
 .../{test_drivers => test-drivers}/vivid/vivid-meta-cap.h   | 0
 .../{test_drivers => test-drivers}/vivid/vivid-meta-out.c   | 0
 .../{test_drivers => test-drivers}/vivid/vivid-meta-out.h   | 0
 .../media/{test_drivers => test-drivers}/vivid/vivid-osd.c  | 0
 .../media/{test_drivers => test-drivers}/vivid/vivid-osd.h  | 0
 .../vivid/vivid-radio-common.c                              | 0
 .../vivid/vivid-radio-common.h                              | 0
 .../{test_drivers => test-drivers}/vivid/vivid-radio-rx.c   | 0
 .../{test_drivers => test-drivers}/vivid/vivid-radio-rx.h   | 0
 .../{test_drivers => test-drivers}/vivid/vivid-radio-tx.c   | 0
 .../{test_drivers => test-drivers}/vivid/vivid-radio-tx.h   | 0
 .../{test_drivers => test-drivers}/vivid/vivid-rds-gen.c    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-rds-gen.h    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-sdr-cap.c    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-sdr-cap.h    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-touch-cap.c  | 0
 .../{test_drivers => test-drivers}/vivid/vivid-touch-cap.h  | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vbi-cap.c    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vbi-cap.h    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vbi-gen.c    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vbi-gen.h    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vbi-out.c    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vbi-out.h    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vid-cap.c    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vid-cap.h    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vid-common.c | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vid-common.h | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vid-out.c    | 0
 .../{test_drivers => test-drivers}/vivid/vivid-vid-out.h    | 0
 69 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/media/{test_drivers => test-drivers}/Kconfig (72%)
 rename drivers/media/{test_drivers => test-drivers}/Makefile (100%)
 rename drivers/media/{test_drivers => test-drivers}/vicodec/Kconfig (100%)
 rename drivers/media/{test_drivers => test-drivers}/vicodec/Makefile (100%)
 rename drivers/media/{test_drivers => test-drivers}/vicodec/codec-fwht.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vicodec/codec-fwht.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vicodec/codec-v4l2-fwht.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vicodec/codec-v4l2-fwht.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vicodec/vicodec-core.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vim2m.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/Kconfig (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/Makefile (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/vimc-capture.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/vimc-common.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/vimc-common.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/vimc-core.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/vimc-debayer.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/vimc-scaler.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/vimc-sensor.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/vimc-streamer.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vimc/vimc-streamer.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/Kconfig (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/Makefile (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-cec.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-cec.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-core.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-core.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-ctrls.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-ctrls.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-kthread-cap.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-kthread-cap.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-kthread-out.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-kthread-out.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-kthread-touch.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-kthread-touch.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-meta-cap.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-meta-cap.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-meta-out.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-meta-out.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-osd.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-osd.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-radio-common.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-radio-common.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-radio-rx.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-radio-rx.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-radio-tx.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-radio-tx.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-rds-gen.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-rds-gen.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-sdr-cap.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-sdr-cap.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-touch-cap.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-touch-cap.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vbi-cap.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vbi-cap.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vbi-gen.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vbi-gen.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vbi-out.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vbi-out.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vid-cap.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vid-cap.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vid-common.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vid-common.h (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vid-out.c (100%)
 rename drivers/media/{test_drivers => test-drivers}/vivid/vivid-vid-out.h (100%)

diff --git a/Documentation/driver-api/media/drivers/vimc-devel.rst b/Documentation/driver-api/media/drivers/vimc-devel.rst
index 1584abba6ee0..9e984f914b13 100644
--- a/Documentation/driver-api/media/drivers/vimc-devel.rst
+++ b/Documentation/driver-api/media/drivers/vimc-devel.rst
@@ -9,7 +9,7 @@ Source code documentation
 vimc-streamer
 ~~~~~~~~~~~~~

-.. kernel-doc:: drivers/media/test_drivers/vimc/vimc-streamer.h
+.. kernel-doc:: drivers/media/test-drivers/vimc/vimc-streamer.h
    :internal:

-.. kernel-doc:: drivers/media/test_drivers/vimc/vimc-streamer.c
+.. kernel-doc:: drivers/media/test-drivers/vimc/vimc-streamer.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 3cb1b45a5624..297197b05562 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17803,7 +17803,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
-F:	drivers/media/platform/vicodec/*
+F:	drivers/media/test-drivers/vicodec/*

 VIDEO I2C POLLING DRIVER
 M:	Matt Ranostay <matt.ranostay@konsulko.com>
@@ -17834,7 +17834,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
-F:	drivers/media/test_drivers/vimc/*
+F:	drivers/media/test-drivers/vimc/*

 VIRT LIB
 M:	Alex Williamson <alex.williamson@redhat.com>
@@ -18001,7 +18001,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
-F:	drivers/media/platform/vivid/*
+F:	drivers/media/test-drivers/vivid/*

 VLYNQ BUS
 M:	Florian Fainelli <f.fainelli@gmail.com>
diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index ba24db7eb4d6..47638c620f24 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -230,7 +230,7 @@ source "drivers/media/mmc/Kconfig"
 endif

 if MEDIA_TEST_SUPPORT
-source "drivers/media/test_drivers/Kconfig"
+source "drivers/media/test-drivers/Kconfig"
 endif

 source "drivers/media/firewire/Kconfig"
diff --git a/drivers/media/Makefile b/drivers/media/Makefile
index 693b3f0bf03e..d18357bf1346 100644
--- a/drivers/media/Makefile
+++ b/drivers/media/Makefile
@@ -29,6 +29,6 @@ obj-$(CONFIG_CEC_CORE) += cec/
 # Finally, merge the drivers that require the core
 #

-obj-y += common/ platform/ pci/ usb/ mmc/ firewire/ spi/ test_drivers/
+obj-y += common/ platform/ pci/ usb/ mmc/ firewire/ spi/ test-drivers/
 obj-$(CONFIG_VIDEO_DEV) += radio/

diff --git a/drivers/media/test_drivers/Kconfig b/drivers/media/test-drivers/Kconfig
similarity index 72%
rename from drivers/media/test_drivers/Kconfig
rename to drivers/media/test-drivers/Kconfig
index e62abec030c3..c6fd235c575f 100644
--- a/drivers/media/test_drivers/Kconfig
+++ b/drivers/media/test-drivers/Kconfig
@@ -6,9 +6,9 @@ menuconfig V4L_TEST_DRIVERS

 if V4L_TEST_DRIVERS

-source "drivers/media/test_drivers/vimc/Kconfig"
+source "drivers/media/test-drivers/vimc/Kconfig"

-source "drivers/media/test_drivers/vivid/Kconfig"
+source "drivers/media/test-drivers/vivid/Kconfig"

 config VIDEO_VIM2M
 	tristate "Virtual Memory-to-Memory Driver"
@@ -19,6 +19,6 @@ config VIDEO_VIM2M
 	  This is a virtual test device for the memory-to-memory driver
 	  framework.

-source "drivers/media/test_drivers/vicodec/Kconfig"
+source "drivers/media/test-drivers/vicodec/Kconfig"

 endif #V4L_TEST_DRIVERS
diff --git a/drivers/media/test_drivers/Makefile b/drivers/media/test-drivers/Makefile
similarity index 100%
rename from drivers/media/test_drivers/Makefile
rename to drivers/media/test-drivers/Makefile
diff --git a/drivers/media/test_drivers/vicodec/Kconfig b/drivers/media/test-drivers/vicodec/Kconfig
similarity index 100%
rename from drivers/media/test_drivers/vicodec/Kconfig
rename to drivers/media/test-drivers/vicodec/Kconfig
diff --git a/drivers/media/test_drivers/vicodec/Makefile b/drivers/media/test-drivers/vicodec/Makefile
similarity index 100%
rename from drivers/media/test_drivers/vicodec/Makefile
rename to drivers/media/test-drivers/vicodec/Makefile
diff --git a/drivers/media/test_drivers/vicodec/codec-fwht.c b/drivers/media/test-drivers/vicodec/codec-fwht.c
similarity index 100%
rename from drivers/media/test_drivers/vicodec/codec-fwht.c
rename to drivers/media/test-drivers/vicodec/codec-fwht.c
diff --git a/drivers/media/test_drivers/vicodec/codec-fwht.h b/drivers/media/test-drivers/vicodec/codec-fwht.h
similarity index 100%
rename from drivers/media/test_drivers/vicodec/codec-fwht.h
rename to drivers/media/test-drivers/vicodec/codec-fwht.h
diff --git a/drivers/media/test_drivers/vicodec/codec-v4l2-fwht.c b/drivers/media/test-drivers/vicodec/codec-v4l2-fwht.c
similarity index 100%
rename from drivers/media/test_drivers/vicodec/codec-v4l2-fwht.c
rename to drivers/media/test-drivers/vicodec/codec-v4l2-fwht.c
diff --git a/drivers/media/test_drivers/vicodec/codec-v4l2-fwht.h b/drivers/media/test-drivers/vicodec/codec-v4l2-fwht.h
similarity index 100%
rename from drivers/media/test_drivers/vicodec/codec-v4l2-fwht.h
rename to drivers/media/test-drivers/vicodec/codec-v4l2-fwht.h
diff --git a/drivers/media/test_drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
similarity index 100%
rename from drivers/media/test_drivers/vicodec/vicodec-core.c
rename to drivers/media/test-drivers/vicodec/vicodec-core.c
diff --git a/drivers/media/test_drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
similarity index 100%
rename from drivers/media/test_drivers/vim2m.c
rename to drivers/media/test-drivers/vim2m.c
diff --git a/drivers/media/test_drivers/vimc/Kconfig b/drivers/media/test-drivers/vimc/Kconfig
similarity index 100%
rename from drivers/media/test_drivers/vimc/Kconfig
rename to drivers/media/test-drivers/vimc/Kconfig
diff --git a/drivers/media/test_drivers/vimc/Makefile b/drivers/media/test-drivers/vimc/Makefile
similarity index 100%
rename from drivers/media/test_drivers/vimc/Makefile
rename to drivers/media/test-drivers/vimc/Makefile
diff --git a/drivers/media/test_drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
similarity index 100%
rename from drivers/media/test_drivers/vimc/vimc-capture.c
rename to drivers/media/test-drivers/vimc/vimc-capture.c
diff --git a/drivers/media/test_drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
similarity index 100%
rename from drivers/media/test_drivers/vimc/vimc-common.c
rename to drivers/media/test-drivers/vimc/vimc-common.c
diff --git a/drivers/media/test_drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
similarity index 100%
rename from drivers/media/test_drivers/vimc/vimc-common.h
rename to drivers/media/test-drivers/vimc/vimc-common.h
diff --git a/drivers/media/test_drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
similarity index 100%
rename from drivers/media/test_drivers/vimc/vimc-core.c
rename to drivers/media/test-drivers/vimc/vimc-core.c
diff --git a/drivers/media/test_drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
similarity index 100%
rename from drivers/media/test_drivers/vimc/vimc-debayer.c
rename to drivers/media/test-drivers/vimc/vimc-debayer.c
diff --git a/drivers/media/test_drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
similarity index 100%
rename from drivers/media/test_drivers/vimc/vimc-scaler.c
rename to drivers/media/test-drivers/vimc/vimc-scaler.c
diff --git a/drivers/media/test_drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
similarity index 100%
rename from drivers/media/test_drivers/vimc/vimc-sensor.c
rename to drivers/media/test-drivers/vimc/vimc-sensor.c
diff --git a/drivers/media/test_drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
similarity index 100%
rename from drivers/media/test_drivers/vimc/vimc-streamer.c
rename to drivers/media/test-drivers/vimc/vimc-streamer.c
diff --git a/drivers/media/test_drivers/vimc/vimc-streamer.h b/drivers/media/test-drivers/vimc/vimc-streamer.h
similarity index 100%
rename from drivers/media/test_drivers/vimc/vimc-streamer.h
rename to drivers/media/test-drivers/vimc/vimc-streamer.h
diff --git a/drivers/media/test_drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
similarity index 100%
rename from drivers/media/test_drivers/vivid/Kconfig
rename to drivers/media/test-drivers/vivid/Kconfig
diff --git a/drivers/media/test_drivers/vivid/Makefile b/drivers/media/test-drivers/vivid/Makefile
similarity index 100%
rename from drivers/media/test_drivers/vivid/Makefile
rename to drivers/media/test-drivers/vivid/Makefile
diff --git a/drivers/media/test_drivers/vivid/vivid-cec.c b/drivers/media/test-drivers/vivid/vivid-cec.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-cec.c
rename to drivers/media/test-drivers/vivid/vivid-cec.c
diff --git a/drivers/media/test_drivers/vivid/vivid-cec.h b/drivers/media/test-drivers/vivid/vivid-cec.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-cec.h
rename to drivers/media/test-drivers/vivid/vivid-cec.h
diff --git a/drivers/media/test_drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-core.c
rename to drivers/media/test-drivers/vivid/vivid-core.c
diff --git a/drivers/media/test_drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-core.h
rename to drivers/media/test-drivers/vivid/vivid-core.h
diff --git a/drivers/media/test_drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-ctrls.c
rename to drivers/media/test-drivers/vivid/vivid-ctrls.c
diff --git a/drivers/media/test_drivers/vivid/vivid-ctrls.h b/drivers/media/test-drivers/vivid/vivid-ctrls.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-ctrls.h
rename to drivers/media/test-drivers/vivid/vivid-ctrls.h
diff --git a/drivers/media/test_drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-kthread-cap.c
rename to drivers/media/test-drivers/vivid/vivid-kthread-cap.c
diff --git a/drivers/media/test_drivers/vivid/vivid-kthread-cap.h b/drivers/media/test-drivers/vivid/vivid-kthread-cap.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-kthread-cap.h
rename to drivers/media/test-drivers/vivid/vivid-kthread-cap.h
diff --git a/drivers/media/test_drivers/vivid/vivid-kthread-out.c b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-kthread-out.c
rename to drivers/media/test-drivers/vivid/vivid-kthread-out.c
diff --git a/drivers/media/test_drivers/vivid/vivid-kthread-out.h b/drivers/media/test-drivers/vivid/vivid-kthread-out.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-kthread-out.h
rename to drivers/media/test-drivers/vivid/vivid-kthread-out.h
diff --git a/drivers/media/test_drivers/vivid/vivid-kthread-touch.c b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-kthread-touch.c
rename to drivers/media/test-drivers/vivid/vivid-kthread-touch.c
diff --git a/drivers/media/test_drivers/vivid/vivid-kthread-touch.h b/drivers/media/test-drivers/vivid/vivid-kthread-touch.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-kthread-touch.h
rename to drivers/media/test-drivers/vivid/vivid-kthread-touch.h
diff --git a/drivers/media/test_drivers/vivid/vivid-meta-cap.c b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-meta-cap.c
rename to drivers/media/test-drivers/vivid/vivid-meta-cap.c
diff --git a/drivers/media/test_drivers/vivid/vivid-meta-cap.h b/drivers/media/test-drivers/vivid/vivid-meta-cap.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-meta-cap.h
rename to drivers/media/test-drivers/vivid/vivid-meta-cap.h
diff --git a/drivers/media/test_drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-meta-out.c
rename to drivers/media/test-drivers/vivid/vivid-meta-out.c
diff --git a/drivers/media/test_drivers/vivid/vivid-meta-out.h b/drivers/media/test-drivers/vivid/vivid-meta-out.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-meta-out.h
rename to drivers/media/test-drivers/vivid/vivid-meta-out.h
diff --git a/drivers/media/test_drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-osd.c
rename to drivers/media/test-drivers/vivid/vivid-osd.c
diff --git a/drivers/media/test_drivers/vivid/vivid-osd.h b/drivers/media/test-drivers/vivid/vivid-osd.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-osd.h
rename to drivers/media/test-drivers/vivid/vivid-osd.h
diff --git a/drivers/media/test_drivers/vivid/vivid-radio-common.c b/drivers/media/test-drivers/vivid/vivid-radio-common.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-radio-common.c
rename to drivers/media/test-drivers/vivid/vivid-radio-common.c
diff --git a/drivers/media/test_drivers/vivid/vivid-radio-common.h b/drivers/media/test-drivers/vivid/vivid-radio-common.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-radio-common.h
rename to drivers/media/test-drivers/vivid/vivid-radio-common.h
diff --git a/drivers/media/test_drivers/vivid/vivid-radio-rx.c b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-radio-rx.c
rename to drivers/media/test-drivers/vivid/vivid-radio-rx.c
diff --git a/drivers/media/test_drivers/vivid/vivid-radio-rx.h b/drivers/media/test-drivers/vivid/vivid-radio-rx.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-radio-rx.h
rename to drivers/media/test-drivers/vivid/vivid-radio-rx.h
diff --git a/drivers/media/test_drivers/vivid/vivid-radio-tx.c b/drivers/media/test-drivers/vivid/vivid-radio-tx.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-radio-tx.c
rename to drivers/media/test-drivers/vivid/vivid-radio-tx.c
diff --git a/drivers/media/test_drivers/vivid/vivid-radio-tx.h b/drivers/media/test-drivers/vivid/vivid-radio-tx.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-radio-tx.h
rename to drivers/media/test-drivers/vivid/vivid-radio-tx.h
diff --git a/drivers/media/test_drivers/vivid/vivid-rds-gen.c b/drivers/media/test-drivers/vivid/vivid-rds-gen.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-rds-gen.c
rename to drivers/media/test-drivers/vivid/vivid-rds-gen.c
diff --git a/drivers/media/test_drivers/vivid/vivid-rds-gen.h b/drivers/media/test-drivers/vivid/vivid-rds-gen.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-rds-gen.h
rename to drivers/media/test-drivers/vivid/vivid-rds-gen.h
diff --git a/drivers/media/test_drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-sdr-cap.c
rename to drivers/media/test-drivers/vivid/vivid-sdr-cap.c
diff --git a/drivers/media/test_drivers/vivid/vivid-sdr-cap.h b/drivers/media/test-drivers/vivid/vivid-sdr-cap.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-sdr-cap.h
rename to drivers/media/test-drivers/vivid/vivid-sdr-cap.h
diff --git a/drivers/media/test_drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-touch-cap.c
rename to drivers/media/test-drivers/vivid/vivid-touch-cap.c
diff --git a/drivers/media/test_drivers/vivid/vivid-touch-cap.h b/drivers/media/test-drivers/vivid/vivid-touch-cap.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-touch-cap.h
rename to drivers/media/test-drivers/vivid/vivid-touch-cap.h
diff --git a/drivers/media/test_drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vbi-cap.c
rename to drivers/media/test-drivers/vivid/vivid-vbi-cap.c
diff --git a/drivers/media/test_drivers/vivid/vivid-vbi-cap.h b/drivers/media/test-drivers/vivid/vivid-vbi-cap.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vbi-cap.h
rename to drivers/media/test-drivers/vivid/vivid-vbi-cap.h
diff --git a/drivers/media/test_drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vbi-gen.c
rename to drivers/media/test-drivers/vivid/vivid-vbi-gen.c
diff --git a/drivers/media/test_drivers/vivid/vivid-vbi-gen.h b/drivers/media/test-drivers/vivid/vivid-vbi-gen.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vbi-gen.h
rename to drivers/media/test-drivers/vivid/vivid-vbi-gen.h
diff --git a/drivers/media/test_drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vbi-out.c
rename to drivers/media/test-drivers/vivid/vivid-vbi-out.c
diff --git a/drivers/media/test_drivers/vivid/vivid-vbi-out.h b/drivers/media/test-drivers/vivid/vivid-vbi-out.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vbi-out.h
rename to drivers/media/test-drivers/vivid/vivid-vbi-out.h
diff --git a/drivers/media/test_drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vid-cap.c
rename to drivers/media/test-drivers/vivid/vivid-vid-cap.c
diff --git a/drivers/media/test_drivers/vivid/vivid-vid-cap.h b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vid-cap.h
rename to drivers/media/test-drivers/vivid/vivid-vid-cap.h
diff --git a/drivers/media/test_drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vid-common.c
rename to drivers/media/test-drivers/vivid/vivid-vid-common.c
diff --git a/drivers/media/test_drivers/vivid/vivid-vid-common.h b/drivers/media/test-drivers/vivid/vivid-vid-common.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vid-common.h
rename to drivers/media/test-drivers/vivid/vivid-vid-common.h
diff --git a/drivers/media/test_drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vid-out.c
rename to drivers/media/test-drivers/vivid/vivid-vid-out.c
diff --git a/drivers/media/test_drivers/vivid/vivid-vid-out.h b/drivers/media/test-drivers/vivid/vivid-vid-out.h
similarity index 100%
rename from drivers/media/test_drivers/vivid/vivid-vid-out.h
rename to drivers/media/test-drivers/vivid/vivid-vid-out.h
-- 
2.25.1

