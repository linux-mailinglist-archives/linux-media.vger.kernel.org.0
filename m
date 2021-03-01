Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701A2327D7E
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 12:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbhCALq7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 06:46:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:32934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231898AbhCALq5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 06:46:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D22D564DBD;
        Mon,  1 Mar 2021 11:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614599174;
        bh=FNVBTGa+0GOpPYZnr5TQrRgEW6C5P83NVpSzoJCFB7k=;
        h=From:To:Cc:Subject:Date:From;
        b=swXiRXLlgH8eTuYsfGMlRWBS/cHXcd4EbLmJfGuz132Y8DdvT98Nf4H9bHrYugXUf
         +zH5L7sKp/q+9MBZomPmPeCXV1V0J6eBg4GzQgHifBfXfeqkdcUnJ135uKSc1SGeJg
         uklRH6H0iQGvw9eYfaPZza+C2ig7z9EdZtcQdafDFtctlaTOYpPeWTXoqXDFBmW/71
         qzITmg0HBhbkdOTXC54cVfmOg6j3yYOdH3zsdc9SceblXVH5hw46iofuph1QnAWRmq
         Wlq6yBB1rgTJvIo8TQKm6/QezHB391PjXlMIaplVZDG0kgrBhR9DeyfYH2GWq3Fv8A
         GWVBziEBDOFzg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lGh07-0007FM-E7; Mon, 01 Mar 2021 12:46:11 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: add a subsystem profile documentation
Date:   Mon,  1 Mar 2021 12:46:10 +0100
Message-Id: <7ac41052a64ae3cfceaa9d08a82afc9dcf2392c5.1614599129.git.mchehab+huawei@kernel.org>
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

v4: address issues pointed by Laurent and Sakari
v3: address a few nitpicks from Randy and Lukas
v2: fix the Documentation/*/media directories

 Documentation/driver-api/media/index.rst      |   2 +
 .../media/maintainer-entry-profile.rst        | 201 ++++++++++++++++++
 .../maintainer/maintainer-entry-profile.rst   |   1 +
 3 files changed, 204 insertions(+)
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
index 000000000000..a460e2278ffc
--- /dev/null
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -0,0 +1,201 @@
+Media Subsystem Profile
+=======================
+
+Overview
+--------
+
+The media subsystem covers support for a variety of devices: stream
+capture, analog and digital TV streams, cameras, remote controllers, HDMI CEC
+and media pipeline control.
+
+It covers, mainly, the contents of those directories:
+
+  - drivers/media
+  - drivers/staging/media
+  - Documentation/admin-guide/media
+  - Documentation/driver-api/media
+  - Documentation/userspace-api/media
+  - Documentation/devicetree/bindings/media/\ [1]_
+  - include/media
+
+.. [1] Device tree bindings are maintained by the
+       OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS maintainers
+       (see the MAINTAINERS file). So, changes there should be reviewed
+       by them before being merged via the media subsystem's development
+       tree.
+
+Both media userspace and Kernel APIs are documented and the documentation
+should be kept in sync with the API changes. It means that all patches that
+add new features to the subsystem should also bring changes to the
+corresponding API files.
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
+is submitted, the e-mail will first be accepted by the mailing list
+server, and, after a while, it should appear at:
+
+   - https://patchwork.linuxtv.org/project/linux-media/list/
+
+If it doesn't automatically appear there after a few minutes, then
+probably something got wrong on your submission. Please check if the
+email is in plain text\ [2]_ only and if your emailer is not mangling with
+whitespaces before complaining or submitting them again.
+
+You can check if the mailing list server accepted your patch, by looking at:
+
+   - https://lore.kernel.org/linux-media/
+
+.. [2] If your email contains HTML, the mailing list server will simply
+       drop it, without any further notice.
+
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
+Cc:ed when those are submitted.
+
+There is a set of compliance tools at https://git.linuxtv.org/v4l-utils.git/
+that should be used in order to check if the drivers are properly
+implementing the media APIs:
+
+==================	=======================================================
+Type			Tool
+==================	=======================================================
+V4L2 drivers\ [3]_	`v4l2-compliance`, `contrib/test/test-media/`
+CEC drivers		`cec-compliance`
+==================	=======================================================
+
+.. [3] The `v4l2-compliance` also covers the media controller usage inside
+       V4L2 drivers.
+
+Other compilance tools are under development to check other parts of the
+subsystem.
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
+Style cleanups are welcome when they come together with other changes
+at the files where the style changes will affect.
+
+We may accept pure standalone style cleanups, but they should ideally
+be one patch for the whole subsystem (if the cleanup is low volume),
+or at least be grouped per directory. So, for example, if you're doing a
+big cleanup change set at drivers under drivers/media, please send a single
+patch for all drivers under drivers/media/pci, another one for
+drivers/media/usb and so on.
+
+Coding Style Addendum
++++++++++++++++++++++
+
+Media development uses checkpatch on strict mode to verify the code style,
+e.g.::
+
+	$ ./scripts/checkpatch.pl --strict --max-line-length=80
+
+In principle, patches should follow the coding style rules, but exceptions
+are allowed if there are good reasons. On such case, maintainers and reviewers
+may question about the rationale for not addressing the `checkpatch.pl`.
+
+Please notice that the goal here is to improve code readability. On
+a few cases, `checkpatch.pl` may actually point to something that would
+look worse. So, you should use good sense.
+
+Note that addressing one `checkpatch.pl` issue (of any kind) alone may lead
+to having longer lines than 80 characters per line. While this is not
+strictly prohibited, efforts should be made towards staying within 80
+characters per line. This could include using refactoring code that leads
+to less indentation, shorter variable or function names and last but not
+least, simply wrapping the lines.
+
+In particular, we accept lines with more than 80 columns:
+
+    - on strings, as they shouldn't be broken due to line length limits;
+    - when a function or variable name need to have a big identifier name,
+      which keeps hard to honor the 80 columns limit;
+    - on arithmetic expressions, when breaking lines makes them harder to
+      read;
+    - when they avoid a line to end with an open parenthesis or an open
+      bracket.
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


