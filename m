Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03B43250A7
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 14:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhBYNlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 08:41:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:38582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229886AbhBYNlu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 08:41:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FB3664F0A;
        Thu, 25 Feb 2021 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614260468;
        bh=OLHurtP6Ne0yttuQ0+7xltIMjNV/3CiRbGnm+oDMM9o=;
        h=From:To:Cc:Subject:Date:From;
        b=Kt4oZf4s3swfF060dMUlGHlN/CS2bKG8oM2hzTw4UcDj5HykyBTOD3pxH6LAIyDRG
         IUntebLUZlZ7BO5ceMU/+POfBsKlQ1DXA00XBdQf7rV1FAVE3rUjTN5zngZVHWJCf/
         CyQ20MJbutJ25fZkA63FpIUV/Ojw7jBHu67HdNySUscDVIYm4Tj8UNpFmxC7rEOS4r
         vGj+AwEqZztJxYQi90lrKJ9dLzC6HqRgsLB0vTgxP6QgyOSQQmL8/3F2xL+b4c1TJ4
         nzdxzEdsvJ/HwTAEYK0WxKj2izej3Gm/1HpVn31A/3Aeswf6s0VdewpJKowy8pTa3h
         CEu7sD0rKKPSw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lFGt7-001hTl-OH; Thu, 25 Feb 2021 14:41:05 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: add a subsystem profile documentation
Date:   Thu, 25 Feb 2021 14:41:04 +0100
Message-Id: <67c1aa1e5f29ef0cb4127e6303a5ffa1a391afc2.1614260439.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the basic policies of the media subsystem profile.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

v2: fix the Documentation/*/media directories


 Documentation/driver-api/media/index.rst      |   2 +
 .../media/maintainer-entry-profile.rst        | 161 ++++++++++++++++++
 .../maintainer/maintainer-entry-profile.rst   |   1 +
 3 files changed, 164 insertions(+)
 create mode 100644 Documentation/driver-api/media/maintainer-entry-profile.rst

diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
index c140692454b1..2ad71dfa8828 100644
--- a/Documentation/driver-api/media/index.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -28,6 +28,8 @@ Please see:
     :maxdepth: 5
     :numbered:
 
+    maintainer-entry-profile
+
     v4l2-core
     dtv-core
     rc-core
diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
new file mode 100644
index 000000000000..6318be833bfb
--- /dev/null
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -0,0 +1,161 @@
+Media Subsystem Profile
+=======================
+
+Overview
+--------
+
+The media subsystem covers support for a variety of devices: stream
+capture, analog and digital TV, cameras, remote controllers, HDMI CEC
+and media pipeline control.
+
+It covers, mainly, the contents of those directories:
+
+  - drivers/media
+  - drivers/staging/media
+  - Documentation/admin-guide/media
+  - Documentation/driver-api/media
+  - Documentation/userspace-api/media
+  - include/media
+
+Both media userspace and Kernel APIs are documented and should be kept in
+sync with the API changes. It means that all patches that add new
+features to the subsystem should also bring changes to the corresponding
+API files.
+
+Due to the size and wide scope of the media subsystem, media's
+maintainership model is to have sub-maintainers that have a broad
+knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
+task to review the patches, providing feedback to users if the patches are
+following the subsystem rules and are properly using the media kernel and
+userspace APIs.
+
+Patches for the media subsystem should be sent to the media mailing list
+at linux-media@vger.kernel.org as plain text only e-mail. Emails with
+HTML will be automatically rejected by the mail server. It could be wise
+to also copy the sub-maintainer(s).
+
+Media's workflow is heavily based on Patchwork, meaning that, once a patch
+is submitted, it should appear at:
+
+   - https://patchwork.linuxtv.org/project/linux-media/list/
+
+If it doesn't automatically appear there after a few minutes, then
+probably something got wrong on your submission. Please check if the
+email is in plain text only and if your emailer is not mangling with
+whitespaces before complaining or submitting them again.
+
+Sub-maintainers
++++++++++++++++
+
+At the media subsystem, we have a group of experienced developers that
+are responsible for doing the code reviews at the drivers (called
+sub-maintainers), and another senior developer responsible for the
+subsystem as a hole. For core changes, whenever possible, multiple
+media (sub-)maintainers do the review.
+
+The sub-maintainers work on specific areas of the subsystem, as
+described below:
+
+Digital TV:
+  Sean Young <sean@mess.org>
+
+HDMI CEC:
+  Hans Verkuil <hverkuil@xs4all.nl>
+
+Media controller drivers:
+  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+Remote Controllers:
+  Sean Young <sean@mess.org>
+
+Sensor drivers:
+  Sakari Ailus <sakari.ailus@linux.intel.com>
+
+V4L2 drivers:
+  Hans Verkuil <hverkuil@xs4all.nl>
+
+Submit Checklist Addendum
+-------------------------
+
+Patches that change the Open Firmware/Device Tree bindings should be
+reviewed by the Device Tree maintainers. So, DT maintainers should be
+c/c when those are submitted.
+
+There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
+that should be used in order to check if the drivers are properly
+implementing the media APIs.
+
+Those tests need to pass before the patches go upstream.
+
+Also, please notice that we build the Kernel with::
+
+	make CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y C=1 W=1 CHECK=check_script
+
+Where the check script is::
+
+	#!/bin/bash
+	/devel/smatch/smatch -p=kernel $@ >&2
+	/devel/sparse/sparse $@ >&2
+
+Be sure to not introduce new warnings on your patches without a
+very good reason.
+
+Style Cleanup Patches
++++++++++++++++++++++
+
+Style-cleanups are welcome when they come together with other changes
+at the files where the style changes will affect.
+
+We may accept pure standalone style-cleanups, but they should ideally
+be one patch for the hole subsystem (if the cleanup is low volume),
+or at least be grouped per directory. So, for example, if you're doing
+big cleanup change set at drivers under drivers/media, please send a single
+patch for all drivers under drivers/media/pci, another one for
+drivers/media/usb and so on.
+
+Coding Style Addendum
++++++++++++++++++++++
+
+Media development uses checkpatch on strict mode to verify the code style,
+e. g.::
+
+	$ ./script/checkpatch.pl --strict
+
+Please notice that the goal here is to improve code readability. On a few
+cases, checkpatch may actually point to something that would look worse.
+
+So, you should use good send sense here, being prepared to justify any
+coding style decision.
+
+Please also notice that, on some cases, when you fix one issue, you may
+receive warnings about lines longer than 80 columns. It is fine to have
+longer lines if this means that other warnings will be fixed by that.
+
+Yet, if you're having more than 80 columns on a line, please consider
+simplifying the code - if too indented - or to use shorter names for
+variables.
+
+Key Cycle Dates
+---------------
+
+New submissions can be sent at any time, but if they intend to hit the
+next merge window they should be sent before -rc5, and ideally stabilized
+in the linux-media branch by -rc6.
+
+Review Cadence
+--------------
+
+Provided that your patch is at https://patchwork.linuxtv.org, it should
+be sooner or later handled, so you don't need to re-submit a patch.
+
+Except for bug fixes, we don't usually add new patches to the development
+tree between -rc6 and the next -rc1.
+
+Please notice that the media subsystem is a high traffic one, so it
+could take a while for us to be able to review your patches. Feel free
+to ping if you don't get a feedback in a couple of weeks or to ask
+other developers to publicly add Reviewed-by and, more importantly,
+Tested-by tags.
+
+Please note that we expect a detailed description for Tested-by,
+identifying what boards were used at the test and what it was tested.
diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index b7a627d6c97d..5d5cc3acdf85 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -102,3 +102,4 @@ to do something different in the near future.
    ../doc-guide/maintainer-profile
    ../nvdimm/maintainer-entry-profile
    ../riscv/patch-acceptance
+   ../driver-api/media/maintainer-entry-profile
-- 
2.29.2


