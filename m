Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB193B6546
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 15:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730425AbfIRN7x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 09:59:53 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58378 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729337AbfIRN7x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 09:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HtqdMUqyUOFCY2ScQf4Lzm9l0uKQkeen1PDA5Nh7oFI=; b=QgpCwUsTdfcZqeu+jArIJiq9yr
        eiCwQ+kJ9ye0e20RX5Kje2SEgsFtLan+waxnebFGPOxogYKEv9nAN8ZkCHyUZAvdtcgvaqfVs+WVU
        AIcn/HvntM58Gk7dhuxVD1U4Qw8+lVbsbAeszr5695VvQRN0KtEQdTv6Lozpap3vmBwedVsk9K3dM
        qKX8XoDtRGIasj0VN5IKZCfSYfBZ4vxJZWgJP5bmRLGc5rxoZmp3T3xUB/SHMeGKmQfP53POdJtZi
        HGFYEGJXo1LFt51yssilxy1gzGIC2brZXSUYw69teIZCaSPNwSYjnpwYSYUEJPy4MXEsrUQiUnnOF
        fAF9kNEw==;
Received: from 177.96.192.152.dynamic.adsl.gvt.net.br ([177.96.192.152] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iAaUq-0004tf-M0; Wed, 18 Sep 2019 13:59:52 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.2)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iAaUo-0005Fw-2L; Wed, 18 Sep 2019 10:59:50 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v2] media: add a subsystem profile documentation
Date:   Wed, 18 Sep 2019 10:59:44 -0300
Message-Id: <9cdbab30b9e0a435b97113b90645e647e8165225.1568815176.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918123620.GA6306@pendragon.ideasonboard.com>
References: <20190918123620.GA6306@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the basic policies of the media subsystem profile.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/media/index.rst                 |   1 +
 .../media/maintainer-entry-profile.rst        | 157 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 159 insertions(+)
 create mode 100644 Documentation/media/maintainer-entry-profile.rst

diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
index 0301c25ff887..ac94685b822a 100644
--- a/Documentation/media/index.rst
+++ b/Documentation/media/index.rst
@@ -12,6 +12,7 @@ Linux Media Subsystem Documentation
 .. toctree::
    :maxdepth: 2
 
+   maintainer-entry-profile
    media_uapi
    media_kapi
    dvb-drivers/index
diff --git a/Documentation/media/maintainer-entry-profile.rst b/Documentation/media/maintainer-entry-profile.rst
new file mode 100644
index 000000000000..68d642abe2c1
--- /dev/null
+++ b/Documentation/media/maintainer-entry-profile.rst
@@ -0,0 +1,157 @@
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
+  - Documentation/media
+  - include/media
+
+Both media userspace and Kernel APIs are documented and should be kept in
+sync with the API changes. It means that all patches that add new
+features to the subsystem should also bring changes to the corresponding
+API files.
+
+Also, patches that changes the Open Firmware/Device Tree bindings should
+also be reviewed by the Device Tree maintainers.
+
+Due to the size and wide scope of the media subsystem, media's
+maintainership model is to have sub-maintainers that have a broad
+knowledge of an specific aspect of the subsystem. It is a
+sub-maintainer's task to review the patches, providing feedback to users
+if the patches are following the subsystem rules and are properly using
+the media internal and external APIs.
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
+whitespaces before complaining or submit it again.
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
+Key Cycle Dates
+---------------
+
+New submissions can be sent at any time, but if they intend to hit the
+next merge window they should be sent before -rc5, and ideally stabilized
+in the linux-media branch by -rc6.
+
+Coding Style Addendum
+---------------------
+
+Media development uses checkpatch on strict mode to verify the code style, e. g.::
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
+simplifying the code - if too idented - or to use shorter names for
+variables.
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
+
+Style Cleanup Patches
+---------------------
+
+Style-cleanups are welcome when they come together with other changes
+at the files where the style changes will affect.
+
+We may accept pure standalone style-cleanups, but they should ideally
+be one patch for the hole subsystem (if the cleanup is low volume),
+or at least be grouped per directory. So, for example, if you're doing
+big cleanup changes at drivers under drivers/media, please send a single
+patch for all drivers under drivers/media/pci, another one for
+drivers/media/usb and so on.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7c62b45201d7..e7f44ec05a42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10077,6 +10077,7 @@ W:	https://linuxtv.org
 Q:	http://patchwork.kernel.org/project/linux-media/list/
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
+P:	Documentation/media/maintainer-entry-profile.rst
 F:	Documentation/devicetree/bindings/media/
 F:	Documentation/media/
 F:	drivers/media/
-- 
2.21.0

