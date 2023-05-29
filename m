Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF687147F4
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjE2Kiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjE2Kin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF8DC4
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vGdSVeI3rEFcmjqvpJrzKI5cS1+ReOB57eRV3js0lvc=;
        b=LUPb5LS15XZlyCyq3X+EtbSDL+GwaB1qM/6JqzsGmVTuW29zOvf7ttBEtgvyZlE/JyxopA
        NGJGXltqXuIF1m6cf/lw1wkOgqMQC30tZ7EXXGxrgN8rPABr1Jj7tKaRBnvNzcmN04z6QU
        9r6vjSpcE/LHjPZKDz59+AnjJc2PuZY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-i2RcnggWNpuALZMCAGToXQ-1; Mon, 29 May 2023 06:37:54 -0400
X-MC-Unique: i2RcnggWNpuALZMCAGToXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9F0B101A531;
        Mon, 29 May 2023 10:37:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 07DFB2166B2B;
        Mon, 29 May 2023 10:37:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 01/21] media: atomisp: Update TODO
Date:   Mon, 29 May 2023 12:37:21 +0200
Message-Id: <20230529103741.11904-2-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A lot of work has been done on the atomisp driver lately.

Rewrite the TODO file to drop all the already fixed items:

* Moved to videobuf2 + fixed mmap support
* Whole bunch of v4l2 API fixes making more apps work
* v4l2-async sensor probing support
* pm-runtime support (for some sensor drivers at least)
* buffer MM code was cleaned up / replaced when moving the videobuf2

And add a new TODO list (retaining some of the old items) split
into items which absolutely must be fixed before the driver can
be moved out of staging:

1. Conflicting hw-ids with regular sensor drivers
2. Private userspace API stuff

As well as a list of items which also definitely needs to be fixed
but which could also be fixed after moving the driver out of staging.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/TODO | 236 +++++++----------------------
 1 file changed, 51 insertions(+), 185 deletions(-)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index 43b842043f29..5e7bb6eb351a 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -1,213 +1,79 @@
-For both Cherrytrail (CHT) and Baytrail (BHT) the driver
-requires the "candrpv_0415_20150521_0458" firmware version.
-It should be noticed that the firmware file is different,
-depending on the ISP model, so they're stored with different
-names:
+Required firmware
+=================
 
-- for BHT: /lib/firmware/shisp_2400b0_v21.bin
+The atomisp driver requires the following firmware:
 
-  Warning: The driver was not tested yet for BHT.
+- for BYT: /lib/firmware/shisp_2400b0_v21.bin
+
+  With a version of "irci_stable_candrpv_0415_20150423_1753" to check
+  the version run: "strings shisp_2400b0_v21.bin | head -n1" .
+
+  The shisp_2400b0_v21.bin file with this version can be found on
+  the Android factory images of various X86 Android tablets such as
+  e.g. the Chuwi Hi8 Pro.
 
 - for CHT: /lib/firmware/shisp_2401a0_v21.bin
 
+  With a version of "irci_stable_candrpv_0415_20150521_0458"
+
+  This can be found here:
   https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin
 
-NOTE:
-=====
-
-This driver currently doesn't work with most V4L2 applications,
-as there are still some issues with regards to implementing
-certain APIs at the standard way.
-
-Also, currently only USERPTR streaming mode is working.
-
-In order to test, it is needed to know what's the sensor's
-resolution. This can be checked with:
-
-$ v4l2-ctl --get-fmt-video
-  Format Video Capture:
-	Width/Height      : 1600/1200
-	...
-
-It is known to work with:
-
-- v4l2grab at contrib/test directory at https://git.linuxtv.org/v4l-utils.git/
-
-  The resolution should not be bigger than the max resolution
-  supported by the sensor, or it will fail. So, if the sensor
-  reports:
-
-  The driver can be tested with:
-
-  v4l2grab -f YUYV -x 1600 -y 1200 -d /dev/video2 -u
-
-- NVT at https://github.com/intel/nvt
-
-  $ ./v4l2n -o testimage_@.raw \
-		 --device /dev/video2 \
-		 --input 0 \
-		 --exposure=30000,30000,30000,30000 \
-		 --parm type=1,capturemode=CI_MODE_PREVIEW \
-		 --fmt type=1,width=1600,height=1200,pixelformat=YUYV \
-		 --reqbufs count=2,memory=USERPTR \
-		 --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
-		 --capture=20
-
-  As the output is in raw format, images need to be converted with:
-
-  $ for i in $(seq 0 19); do
-	name="testimage_$(printf "%03i" $i)"
-	./raw2pnm -x$WIDTH -y$HEIGHT -f$FORMAT $name.raw $name.pnm
-	rm $name.raw
-    done
 
 TODO
 ====
 
-1.  Fix support for MMAP streaming mode. This is required for most
-    V4L2 applications;
+1. items which MUST be fixed before the driver can be moved out of staging:
 
-2.  Implement and/or fix V4L2 ioctls in order to allow a normal app to
-    use it;
+* The atomisp ov2680 and ov5693 sensor drivers bind to the same hw-ids as
+  the standard ov2680 and ov5693 drivers under drivers/media/i2c, which
+  conflicts. Drop the atomisp private ov2680 and ov5693 drivers:
+  * Make atomisp code use v4l2 selections to deal with the extra padding
+    it wants to receive from sensors instead of relying on the ov2680 code
+    sending e.g. 1616x1216 for a 1600x1200 mode
+  * Port various ov2680 improvements from atomisp_ov2680.c to regular ov2680.c
+    and switch to regular ov2680 driver
+  * Make atomisp work with the regular ov5693 driver and drop atomisp_ov5693
 
-3.  Ensure that the driver will pass v4l2-compliance tests;
+* Fix atomisp causing the whole machine to hang in its probe() error-exit
+  path taken in the firmware missing case
 
-4.  Get manufacturer's authorization to redistribute the binaries for
-    the firmware files;
+* Remove/disable private ioctls
 
-5.  remove VIDEO_ATOMISP_ISP2401, making the driver to auto-detect the
-    register address differences between ISP2400 and ISP2401;
+* Remove/disable custom v4l2-ctrls
 
-6.  Cleanup the driver code, removing the abstraction layers inside it;
+* Remove custom sysfs files created by atomisp_drvfs.c
 
-7.  The atomisp doesn't rely at the usual i2c stuff to discover the
-    sensors. Instead, it calls a function from atomisp_gmin_platform.c.
-    There are some hacks added there for it to wait for sensors to be
-    probed (with a timeout of 2 seconds or so). This should be converted
-    to the usual way, using V4L2 async subdev framework to wait for
-    cameras to be probed;
+* Remove abuse of priv field in various v4l2 userspace API structs
 
-8.  Switch to standard V4L2 sub-device API for sensor and lens. In
-    particular, the user space API needs to support V4L2 controls as
-    defined in the V4L2 spec and references to atomisp must be removed from
-    these drivers.
+* Without a 3A library the capture behaviour is not very good. To take a good
+  picture, the exposure/gain needs to be tuned using v4l2-ctl on the sensor
+  subdev. To fix this support for the atomisp needs to be added to libcamera.
 
-9.  Use LED flash API for flash LED drivers such as LM3554 (which already
-    has a LED class driver).
-
-10. Migrate the sensor drivers out of staging or re-using existing
-    drivers;
-
-11. Switch the driver to use pm_runtime stuff. Right now, it probes the
-    existing PMIC code and sensors call it directly.
-
-12. There's a problem on sensor drivers: when trying to set a video
-    format, the atomisp main driver calls the sensor drivers with the
-    sensor turned off. This causes them to fail.
-
-    This was fixed at atomisp-ov2880, which has a hack inside it
-    to turn it on when VIDIOC_S_FMT is called, but this has to be
-    cheked on other drivers as well.
-
-    The right fix seems to power on the sensor when a video device is
-    opened (or at the first VIDIOC_ ioctl - except for VIDIOC_QUERYCAP),
-    powering it down at close() syscall.
-
-    Such kind of control would need to be done inside the atomisp driver,
-    not at the sensors code.
-
-13. There are several issues related to memory management, that can
-    cause crashes and/or memory leaks. The atomisp splits the memory
-    management on three separate regions:
-
-	- dynamic pool;
-	- reserved pool;
-	- generic pool
-
-    The code implementing it is at:
-
-	drivers/staging/media/atomisp/pci/hmm/
-
-    It also has a separate code for managing DMA buffers at:
-
-	drivers/staging/media/atomisp/pci/mmu/
-
-    The code there is really dirty, ugly and probably wrong. I fixed
-    one bug there already, but the best would be to just trash it and use
-    something else. Maybe the code from the newer intel driver could
-    serve as a model:
-
-	drivers/staging/media/ipu3/ipu3-mmu.c
-
-    But converting it to use something like that is painful and may
-    cause some breakages.
-
-14. The file structure needs to get tidied up to resemble a normal Linux
-    driver.
-
-15. Lots of the midlayer glue. Unused code and abstraction needs removing.
-
-16. The AtomISP driver includes some special IOCTLS (ATOMISP_IOC_XXXX_XXXX)
-    and controls that require some cleanup. Some of those code may have
-    been removed during the cleanups. They could be needed in order to
-    properly support 3A algorithms.
-
-    Such IOCTL interface needs more documentation. The better would
-    be to use something close to the interface used by the IPU3 IMGU driver.
-
-17. The ISP code has some dependencies of the exact FW version.
-    The version defined in pci/sh_css_firmware.c:
-
-    BYT (isp2400): "irci_stable_candrpv_0415_20150521_0458"
-
-    CHT (isp2401): "irci_ecr - master_20150911_0724"
-
-    Those versions don't seem to be available anymore. On the tests we've
-    done so far, this version also seems to work for CHT:
-
-		"irci_stable_candrpv_0415_20150521_0458"
-
-    Which can be obtainable from Yocto Atom ISP respository.
-
-    but this was not thoroughly tested.
-
-    At some point we may need to round up a few driver versions and see if
-    there are any specific things that can be done to fold in support for
-    multiple firmware versions.
+  This MUST be done before moving the driver out of staging so that we can
+  still make changes to e.g. the mediactl topology if necessary for
+  libcamera integration. Since this would be a userspace API break this
+  means that at least proof-of-concept libcamera integration needs to be
+  ready before moving the driver out of staging.
 
 
-18. Switch from videobuf1 to videobuf2. Videobuf1 is being removed!
+2. items which SHOULD also be fixed eventually:
 
-19. Correct Coding Style. Please refrain sending coding style patches
-    for this driver until the other work is done, as there will be a lot
-    of code churn until this driver becomes functional again.
+* Remove VIDEO_ATOMISP_ISP2401, making the driver to auto-detect the
+  register address differences between ISP2400 and ISP2401
 
-20. Remove the logic which sets up pipelines inside it, moving it to
-    libcamera and implement MC support.
+* The driver is intended to drive the PCI exposed versions of the device.
+  It will not detect those devices enumerated via ACPI as a field of the
+  i915 GPU driver (only a problem on BYT).
 
+  There are some patches adding i915 GPU support floating at the Yocto's
+  Aero repository (so far, untested upstream).
 
-Limitations
-===========
+* Ensure that the driver will pass v4l2-compliance tests
 
-1. To test the patches, you also need the ISP firmware
+* Fix not all v4l2 apps working, e.g. cheese does not work
 
-   for BYT: /lib/firmware/shisp_2400b0_v21.bin
-   for CHT: /lib/firmware/shisp_2401a0_v21.bin
+* Get manufacturer's authorization to redistribute the binaries for
+  the firmware files
 
-   The firmware files will usually be found in /etc/firmware on an Android
-   device but can also be extracted from the upgrade kit if you've managed
-   to lose them somehow.
-
-2. Without a 3A library the capture behaviour is not very good. To take a good
-   picture, you need tune ISP parameters by IOCTL functions or use a 3A library
-   such as libxcam.
-
-3. The driver is intended to drive the PCI exposed versions of the device.
-   It will not detect those devices enumerated via ACPI as a field of the
-   i915 GPU driver.
-
-   There are some patches adding i915 GPU support floating at the Yocto's
-   Aero repository (so far, untested upstream).
-
-4. The driver supports only v2 of the IPU/Camera. It will not work with the
-   versions of the hardware in other SoCs.
+* The atomisp code still has a lot of cruft which needs cleaning up
-- 
2.40.1

