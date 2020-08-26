Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DE825284B
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 09:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgHZHSu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 03:18:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:33056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726698AbgHZHSt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 03:18:49 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C79E420767;
        Wed, 26 Aug 2020 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598426328;
        bh=o8vpPhoXeGvbUPsSYe6fqDmzqCLBl92caG8qMQQizSc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pQnhp/Xal90t5h9eI0uh813UWlcbbJrMDFTvuvs5UeWDY3k6FMXZby7/s3Y5ICnff
         2N468qoQqpnDynStf9EuF4lQLMvAKOBx6Gde7ftcIvjTF+RFPSscCJqYCp3hDQxP3U
         l89xGTDtCGUvefdImCTRnBRHz3TAjyaYHqHu6Ugo=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAphl-001Rah-WE; Wed, 26 Aug 2020 09:18:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     linux-media@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/4] media: docs: use SPDX GPL-2.0 OR GFDL-1.1 instead of text on *.rst files
Date:   Wed, 26 Aug 2020 09:18:38 +0200
Message-Id: <304c6bc23194c6264f9b94f58f387e879382c00c.1598426302.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <929df929283e38b388f601c2ba521257e38cc566.1598426302.git.mchehab+huawei@kernel.org>
References: <929df929283e38b388f601c2ba521257e38cc566.1598426302.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some files that are dual licensed GPL and GFDL.

As SPDX v3.10 gained support for GFDL-1.1 with no invariant sections:

	https://spdx.org/licenses/GFDL-1.1-no-invariants-or-later.html

Let's remove the dual license text, replacing them by:

	SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../mediactl/media-ioc-request-alloc.rst      | 26 +------------------
 .../mediactl/media-request-ioc-queue.rst      | 26 +------------------
 .../mediactl/media-request-ioc-reinit.rst     | 26 +------------------
 .../media/mediactl/request-api.rst            | 26 +------------------
 .../media/mediactl/request-func-close.rst     | 26 +------------------
 .../media/mediactl/request-func-ioctl.rst     | 26 +------------------
 .../media/mediactl/request-func-poll.rst      | 26 +------------------
 .../userspace-api/media/v4l/dev-encoder.rst   | 26 +------------------
 .../media/v4l/pixfmt-meta-intel-ipu3.rst      | 25 +-----------------
 .../media/v4l/pixfmt-meta-vivid.rst           | 26 +------------------
 10 files changed, 10 insertions(+), 249 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst b/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst
index 82f86466c7f2..ea05ff0c5382 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst
@@ -1,28 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License as
-..    published by the Free Software Foundation version 2 of
-..    the License.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _media_ioc_request_alloc:
 
diff --git a/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst b/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
index ad55b6b32616..ca1b33196242 100644
--- a/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
+++ b/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
@@ -1,28 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License as
-..    published by the Free Software Foundation version 2 of
-..    the License.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _media_request_ioc_queue:
 
diff --git a/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst b/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst
index 4c43fa05c8f6..cfd503bdef70 100644
--- a/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst
+++ b/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst
@@ -1,28 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License as
-..    published by the Free Software Foundation version 2 of
-..    the License.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _media_request_ioc_reinit:
 
diff --git a/Documentation/userspace-api/media/mediactl/request-api.rst b/Documentation/userspace-api/media/mediactl/request-api.rst
index 37d9442a541e..c0fa4dbb2b28 100644
--- a/Documentation/userspace-api/media/mediactl/request-api.rst
+++ b/Documentation/userspace-api/media/mediactl/request-api.rst
@@ -1,28 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License as
-..    published by the Free Software Foundation version 2 of
-..    the License.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _media-request-api:
 
diff --git a/Documentation/userspace-api/media/mediactl/request-func-close.rst b/Documentation/userspace-api/media/mediactl/request-func-close.rst
index 9618b5139764..04e00bb9defd 100644
--- a/Documentation/userspace-api/media/mediactl/request-func-close.rst
+++ b/Documentation/userspace-api/media/mediactl/request-func-close.rst
@@ -1,28 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License as
-..    published by the Free Software Foundation version 2 of
-..    the License.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _request-func-close:
 
diff --git a/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst b/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst
index 4bf985205bcc..1e1c5edb860c 100644
--- a/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst
+++ b/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst
@@ -1,28 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License as
-..    published by the Free Software Foundation version 2 of
-..    the License.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _request-func-ioctl:
 
diff --git a/Documentation/userspace-api/media/mediactl/request-func-poll.rst b/Documentation/userspace-api/media/mediactl/request-func-poll.rst
index 85a3427e5913..92947213d3d5 100644
--- a/Documentation/userspace-api/media/mediactl/request-func-poll.rst
+++ b/Documentation/userspace-api/media/mediactl/request-func-poll.rst
@@ -1,28 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License as
-..    published by the Free Software Foundation version 2 of
-..    the License.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _request-func-poll:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
index fb44f20924de..aa338b9624b0 100644
--- a/Documentation/userspace-api/media/v4l/dev-encoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
@@ -1,28 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License as
-..    published by the Free Software Foundation version 2 of
-..    the License.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _encoder:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
index 97a9a2925671..5f33d35532ef 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
@@ -1,27 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License version
-..    2.0 as published by the Free Software Foundation.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License version 2.0 for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _v4l2-meta-fmt-params:
 .. _v4l2-meta-fmt-stat-3a:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst
index 34a2382ef91c..7173e2c3e245 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst
@@ -1,28 +1,4 @@
-.. This file is dual-licensed: you can use it either under the terms
-.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-.. dual licensing only applies to this file, and not this project as a
-.. whole.
-..
-.. a) This file is free software; you can redistribute it and/or
-..    modify it under the terms of the GNU General Public License as
-..    published by the Free Software Foundation version 2 of
-..    the License.
-..
-..    This file is distributed in the hope that it will be useful,
-..    but WITHOUT ANY WARRANTY; without even the implied warranty of
-..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-..    GNU General Public License for more details.
-..
-.. Or, alternatively,
-..
-.. b) Permission is granted to copy, distribute and/or modify this
-..    document under the terms of the GNU Free Documentation License,
-..    Version 1.1 or any later version published by the Free Software
-..    Foundation, with no Invariant Sections, no Front-Cover Texts
-..    and no Back-Cover Texts. A copy of the license is included at
-..    Documentation/userspace-api/media/fdl-appendix.rst.
-..
-.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _v4l2-meta-fmt-vivid:
 
-- 
2.26.2

