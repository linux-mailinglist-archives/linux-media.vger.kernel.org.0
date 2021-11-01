Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF95F441ABF
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 12:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbhKALjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 07:39:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:45766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231485AbhKALjH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 07:39:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F105360EE3;
        Mon,  1 Nov 2021 11:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635766594;
        bh=S9pF3Xcq9MSHHIIsfNkWMO1CdjzipyJnUXtbyyJR/ik=;
        h=From:To:Cc:Subject:Date:From;
        b=HVqkh3v8yO3gAaiOh7qYYURZR3ZvJ4YHMxV8W1+FMhOM51Du0WmUunUAq7G4tZV9O
         nHl0evnOW0DEF0yjEYt35FUEsMGQv1ycrboM4xSD7obGPHdxv4jYVR6jf2MZV3+69q
         02zz8HNXszQvXVW8mgm1ZrCeLSD39GlmmP0E3SjPwVJm7ec3hW3kobiFTwsPB76gY+
         nbnEfcDCJy6PeS6hHhtnMNm/aR/uyROuLv3qzROxDQZOkkzT7p8fSUG3lxcLNZaMdm
         ULRvApts6XRbV1bicyfvTFaCEpPZDTfChVQyG2X7IcENwb+kz9VwJO9Pa2879Io19D
         itWkaamfS2sgg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mhVc1-0049M0-Vg; Mon, 01 Nov 2021 11:36:25 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: TODO: make it updated to the current issues
Date:   Mon,  1 Nov 2021 11:36:25 +0000
Message-Id: <ef3b9fc519638a88a6e75e79d11e92e875abfd8d.1635766583.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that this driver starting to show signals of real progress,
let's update its TODO list.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/TODO | 191 +++++++++++++++++++----------
 1 file changed, 126 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index 2d1ef9eb262a..43b842043f29 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -1,92 +1,161 @@
+For both Cherrytrail (CHT) and Baytrail (BHT) the driver
+requires the "candrpv_0415_20150521_0458" firmware version.
+It should be noticed that the firmware file is different,
+depending on the ISP model, so they're stored with different
+names:
+
+- for BHT: /lib/firmware/shisp_2400b0_v21.bin
+
+  Warning: The driver was not tested yet for BHT.
+
+- for CHT: /lib/firmware/shisp_2401a0_v21.bin
+
+  https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin
+
 NOTE:
 =====
 
-While the driver probes the hardware and reports itself as a
-V4L2 driver, there are still some issues preventing it to
-stream (at least it doesn't with the standard V4L2 applications.
-Didn't test yet with some custom-made app for this driver).
-Solving the related bugs and issues preventing it to work is
-needed (items 6 and 7 from the list below).
+This driver currently doesn't work with most V4L2 applications,
+as there are still some issues with regards to implementing
+certain APIs at the standard way.
+
+Also, currently only USERPTR streaming mode is working.
+
+In order to test, it is needed to know what's the sensor's
+resolution. This can be checked with:
+
+$ v4l2-ctl --get-fmt-video
+  Format Video Capture:
+	Width/Height      : 1600/1200
+	...
+
+It is known to work with:
+
+- v4l2grab at contrib/test directory at https://git.linuxtv.org/v4l-utils.git/
+
+  The resolution should not be bigger than the max resolution
+  supported by the sensor, or it will fail. So, if the sensor
+  reports:
+
+  The driver can be tested with:
+
+  v4l2grab -f YUYV -x 1600 -y 1200 -d /dev/video2 -u
+
+- NVT at https://github.com/intel/nvt
+
+  $ ./v4l2n -o testimage_@.raw \
+		 --device /dev/video2 \
+		 --input 0 \
+		 --exposure=30000,30000,30000,30000 \
+		 --parm type=1,capturemode=CI_MODE_PREVIEW \
+		 --fmt type=1,width=1600,height=1200,pixelformat=YUYV \
+		 --reqbufs count=2,memory=USERPTR \
+		 --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
+		 --capture=20
+
+  As the output is in raw format, images need to be converted with:
+
+  $ for i in $(seq 0 19); do
+	name="testimage_$(printf "%03i" $i)"
+	./raw2pnm -x$WIDTH -y$HEIGHT -f$FORMAT $name.raw $name.pnm
+	rm $name.raw
+    done
 
 TODO
 ====
 
-1. The atomisp doesn't rely at the usual i2c stuff to discover the
-   sensors. Instead, it calls a function from atomisp_gmin_platform.c.
-   There are some hacks added there for it to wait for sensors to be
-   probed (with a timeout of 2 seconds or so).
-   This should be converted to the usual way, using V4L2 async subdev
-   framework to wait for cameras to be probed;
+1.  Fix support for MMAP streaming mode. This is required for most
+    V4L2 applications;
 
-2. Use ACPI _DSM table - DONE!
+2.  Implement and/or fix V4L2 ioctls in order to allow a normal app to
+    use it;
 
-3. Switch the driver to use pm_runtime stuff. Right now, it probes the
-   existing PMIC code and sensors call it directly.
+3.  Ensure that the driver will pass v4l2-compliance tests;
 
-4. There's a problem at the sensor drivers: when trying to set a video
-   format, the atomisp main driver calls the sensor drivers with the
-   sensor turned off. This causes them to fail.
+4.  Get manufacturer's authorization to redistribute the binaries for
+    the firmware files;
 
-   The only exception is the atomisp-ov2880, which has a hack inside it
-   to turn it on when VIDIOC_S_FMT is called.
+5.  remove VIDEO_ATOMISP_ISP2401, making the driver to auto-detect the
+    register address differences between ISP2400 and ISP2401;
 
-   The right fix seems to power on the sensor when a video device is
-   opened (or at the first VIDIOC_ ioctl - except for VIDIOC_QUERYCAP),
-   powering it down at close() syscall.
+6.  Cleanup the driver code, removing the abstraction layers inside it;
 
-   Such kind of control would need to be done inside the atomisp driver,
-   not at the sensors code.
+7.  The atomisp doesn't rely at the usual i2c stuff to discover the
+    sensors. Instead, it calls a function from atomisp_gmin_platform.c.
+    There are some hacks added there for it to wait for sensors to be
+    probed (with a timeout of 2 seconds or so). This should be converted
+    to the usual way, using V4L2 async subdev framework to wait for
+    cameras to be probed;
 
-5. There are several issues related to memory management, causing
-   crashes. The atomisp splits the memory management on three separate
-   regions:
+8.  Switch to standard V4L2 sub-device API for sensor and lens. In
+    particular, the user space API needs to support V4L2 controls as
+    defined in the V4L2 spec and references to atomisp must be removed from
+    these drivers.
+
+9.  Use LED flash API for flash LED drivers such as LM3554 (which already
+    has a LED class driver).
+
+10. Migrate the sensor drivers out of staging or re-using existing
+    drivers;
+
+11. Switch the driver to use pm_runtime stuff. Right now, it probes the
+    existing PMIC code and sensors call it directly.
+
+12. There's a problem on sensor drivers: when trying to set a video
+    format, the atomisp main driver calls the sensor drivers with the
+    sensor turned off. This causes them to fail.
+
+    This was fixed at atomisp-ov2880, which has a hack inside it
+    to turn it on when VIDIOC_S_FMT is called, but this has to be
+    cheked on other drivers as well.
+
+    The right fix seems to power on the sensor when a video device is
+    opened (or at the first VIDIOC_ ioctl - except for VIDIOC_QUERYCAP),
+    powering it down at close() syscall.
+
+    Such kind of control would need to be done inside the atomisp driver,
+    not at the sensors code.
+
+13. There are several issues related to memory management, that can
+    cause crashes and/or memory leaks. The atomisp splits the memory
+    management on three separate regions:
 
 	- dynamic pool;
 	- reserved pool;
 	- generic pool
 
-   The code implementing it is at:
+    The code implementing it is at:
 
 	drivers/staging/media/atomisp/pci/hmm/
 
-   It also has a separate code for managing DMA buffers at:
+    It also has a separate code for managing DMA buffers at:
 
 	drivers/staging/media/atomisp/pci/mmu/
 
-   The code there is really dirty, ugly and probably wrong. I fixed
-   one bug there already, but the best would be to just trash it and use
-   something else. Maybe the code from the newer intel driver could
-   serve as a model:
+    The code there is really dirty, ugly and probably wrong. I fixed
+    one bug there already, but the best would be to just trash it and use
+    something else. Maybe the code from the newer intel driver could
+    serve as a model:
 
 	drivers/staging/media/ipu3/ipu3-mmu.c
 
-   But converting it to use something like that is painful and may
-   cause some breakages.
+    But converting it to use something like that is painful and may
+    cause some breakages.
 
-6. There is some issues at the frame receive logic, causing the
-   DQBUF ioctls to fail.
+14. The file structure needs to get tidied up to resemble a normal Linux
+    driver.
 
-7. A single AtomISP driver needs to be implemented to support both
-   Baytrail (BYT) and Cherrytail (CHT) platforms at the same time.
-   The current driver is a mechanical and hand combined merge of the
-   two using several runtime macros, plus some ifdef ISP2401 to select the
-   CHT version. Yet, there are some ISP-specific headers that change the
-   driver's behavior during compile time.
+15. Lots of the midlayer glue. Unused code and abstraction needs removing.
 
-8. The file structure needs to get tidied up to resemble a normal Linux
-   driver.
-
-9. Lots of the midlayer glue. unused code and abstraction needs removing.
-
-10. The AtomISP driver includes some special IOCTLS (ATOMISP_IOC_XXXX_XXXX)
+16. The AtomISP driver includes some special IOCTLS (ATOMISP_IOC_XXXX_XXXX)
     and controls that require some cleanup. Some of those code may have
     been removed during the cleanups. They could be needed in order to
-    properly support 3A algorithms
+    properly support 3A algorithms.
 
     Such IOCTL interface needs more documentation. The better would
     be to use something close to the interface used by the IPU3 IMGU driver.
 
-11. The ISP code has some dependencies of the exact FW version.
+17. The ISP code has some dependencies of the exact FW version.
     The version defined in pci/sh_css_firmware.c:
 
     BYT (isp2400): "irci_stable_candrpv_0415_20150521_0458"
@@ -106,24 +175,16 @@ TODO
     there are any specific things that can be done to fold in support for
     multiple firmware versions.
 
-12. Switch to standard V4L2 sub-device API for sensor and lens. In
-    particular, the user space API needs to support V4L2 controls as
-    defined in the V4L2 spec and references to atomisp must be removed from
-    these drivers.
 
-13. Use LED flash API for flash LED drivers such as LM3554 (which already
-    has a LED class driver).
+18. Switch from videobuf1 to videobuf2. Videobuf1 is being removed!
 
-14. Switch from videobuf1 to videobuf2. Videobuf1 is being removed!
-
-15. Correct Coding Style. Please refrain sending coding style patches
+19. Correct Coding Style. Please refrain sending coding style patches
     for this driver until the other work is done, as there will be a lot
     of code churn until this driver becomes functional again.
 
-16. Fix private ioctls to not need a compat_ioctl handler for running
-    32-bit tasks. The compat code has been removed because of bugs,
-    and should not be needed for modern drivers. Fixing this properly
-    unfortunately means an incompatible ABI change.
+20. Remove the logic which sets up pipelines inside it, moving it to
+    libcamera and implement MC support.
+
 
 Limitations
 ===========
-- 
2.31.1

