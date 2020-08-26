Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33BD725284F
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 09:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgHZHS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 03:18:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:33068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726700AbgHZHSu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 03:18:50 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DDE4D20825;
        Wed, 26 Aug 2020 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598426328;
        bh=FMzXVMoId/Kvxlbl2TmaHLiw3F9awa6K+3ThnX269Yk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xjO6fiqXSHAwZ8vrgT94VPaJJRzxmZOHMBARKfl503qKVbfR4zufLyvWbsyPmlZx+
         FEn7Rug9hkzfQGHfiLEbSbBd4h4TayJ28oPXjk8I0XKhUs2TLbt8q15QENaY3pjVOK
         B32YagfdHA8Zl3tPqXOcMWnH8p+y/rVUk5R9j19g=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAphm-001Raj-19; Wed, 26 Aug 2020 09:18:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     linux-media@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 4/4] media: docs: use SPDX GPL-2.0 OR GFDL-1.1 instead of text on *.svg files
Date:   Wed, 26 Aug 2020 09:18:39 +0200
Message-Id: <8785b1e6721bd54ce85837bf2e3d9787cd8e9796.1598426302.git.mchehab+huawei@kernel.org>
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
 .../userspace-api/media/dvb/dvbstb.svg        | 28 +------------------
 .../userspace-api/media/v4l/bayer.svg         | 28 +------------------
 .../userspace-api/media/v4l/constraints.svg   | 28 +------------------
 .../userspace-api/media/v4l/nv12mt.svg        | 28 +------------------
 .../media/v4l/nv12mt_example.svg              | 28 +------------------
 .../userspace-api/media/v4l/selection.svg     | 28 +------------------
 6 files changed, 6 insertions(+), 162 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/dvbstb.svg b/Documentation/userspace-api/media/dvb/dvbstb.svg
index b333d0ff944f..87e68baa056b 100644
--- a/Documentation/userspace-api/media/dvb/dvbstb.svg
+++ b/Documentation/userspace-api/media/dvb/dvbstb.svg
@@ -1,31 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<!--
-    This file is dual-licensed: you can use it either under the terms
-    of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-    dual licensing only applies to this file, and not this project as a
-    whole.
-
-    a) This file is free software; you can redistribute it and/or
-       modify it under the terms of the GNU General Public License as
-       published by the Free Software Foundation version 2 of
-       the License.
-
-       This file is distributed in the hope that it will be useful,
-       but WITHOUT ANY WARRANTY; without even the implied warranty of
-       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-       GNU General Public License for more details.
-
-    Or, alternatively,
-
-    b) Permission is granted to copy, distribute and/or modify this
-       document under the terms of the GNU Free Documentation License,
-       Version 1.1 or any later version published by the Free Software
-       Foundation, with no Invariant Sections, no Front-Cover Texts
-       and no Back-Cover Texts. A copy of the license is included at
-       Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later -->
 <svg id="svg2" width="15.847cm" height="8.4187cm" fill-rule="evenodd" stroke-linejoin="round" stroke-width="28.222" preserveAspectRatio="xMidYMid" version="1.2" viewBox="0 0 23770.123 12628.122" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><defs id="defs142"><marker id="Arrow1Lend" overflow="visible" orient="auto"><path id="path954" transform="matrix(-.8 0 0 -.8 -10 0)" d="m0 0 5-5-17.5 5 17.5 5z" fill-rule="evenodd" stroke="#000" stroke-width="1pt"/></marker><marker id="marker1243" overflow="visible" orient="auto"><path id="path1241" transform="matrix(-.8 0 0 -.8 -10 0)" d="m0 0 5-5-17.5 5 17.5 5z" fill-rule="evenodd" stroke="#000" stroke-width="1pt"/></marker></defs><metadata id="metadata519"><rdf:RDF><cc:Work
 rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata><rect id="rect197" class="BoundingBox" x="5355.1" y="13.122" width="18403" height="9603" fill="none"/><path id="path199" d="m14556 9614.1h-9200v-9600h18400v9600z" fill="#fff"/><path id="path201" d="m14556 9614.1h-9200v-9600h18400v9600z" fill="none" stroke="#000"/><rect id="rect206" class="BoundingBox" x="13.122" y="4013.1" width="4544" height="2403" fill="none"/><path id="path208" d="m2285.1 6414.1h-2271v-2400h4541v2400z" fill="#fff"/><path id="path210" d="m2285.1 6414.1h-2271v-2400h4541v2400z" fill="none" stroke="#000"/><text id="text212" class="TextShape" x="-2443.8779" y="-4585.8779"><tspan id="tspan214" class="TextParagraph" font-family="sans-serif" font-size="635px" font-weight="400"><tspan id="tspan216" class="TextPosition"
 x="1281.1219" y="5435.1221"><tspan id="tspan218" fill="#000000">Antena</tspan></tspan></tspan></text>
diff --git a/Documentation/userspace-api/media/v4l/bayer.svg b/Documentation/userspace-api/media/v4l/bayer.svg
index 82e805c68c1f..c500a28f0817 100644
--- a/Documentation/userspace-api/media/v4l/bayer.svg
+++ b/Documentation/userspace-api/media/v4l/bayer.svg
@@ -1,31 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<!--
-    This file is dual-licensed: you can use it either under the terms
-    of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-    dual licensing only applies to this file, and not this project as a
-    whole.
-
-    a) This file is free software; you can redistribute it and/or
-       modify it under the terms of the GNU General Public License as
-       published by the Free Software Foundation version 2 of
-       the License.
-
-       This file is distributed in the hope that it will be useful,
-       but WITHOUT ANY WARRANTY; without even the implied warranty of
-       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-       GNU General Public License for more details.
-
-    Or, alternatively,
-
-    b) Permission is granted to copy, distribute and/or modify this
-       document under the terms of the GNU Free Documentation License,
-       Version 1.1 or any later version published by the Free Software
-       Foundation, with no Invariant Sections, no Front-Cover Texts
-       and no Back-Cover Texts. A copy of the license is included at
-       Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later -->
 <svg id="svg2" width="164.15mm" height="46.771mm" fill-rule="evenodd" stroke-linejoin="round" stroke-width="28.222" preserveAspectRatio="xMidYMid" version="1.2" viewBox="0 0 16415.333 4677.1107" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata id="metadata652"><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata><g id="g186" class="com.sun.star.drawing.CustomShape" transform="translate(-3285.9 -3185.9)"><g id="id6"><rect id="rect189" class="BoundingBox" x="3299" y="3199" width="1303" height="1203" fill="none"/><path id="path191" d="m3950 4400h-650v-1200h1300v1200h-650z" fill="#00f"/><path id="path193" d="m3950
 4400h-650v-1200h1300v1200h-650z" fill="none" stroke="#3465a4"/><text id="text195" class="TextShape"><tspan id="tspan197" class="TextParagraph" font-family="sans-serif" font-size="635px" font-weight="400"><tspan id="tspan199" class="TextPosition" x="3739" y="4021"><tspan id="tspan201" fill="#ffffff">B</tspan></tspan></tspan></text>
 </g></g><g id="g203" class="com.sun.star.drawing.CustomShape" transform="translate(-3285.9 -3185.9)"><g id="id7"><rect id="rect206" class="BoundingBox" x="4599" y="3199" width="1303" height="1203" fill="none"/><path id="path208" d="m5250 4400h-650v-1200h1300v1200h-650z" fill="#0c0"/><path id="path210" d="m5250 4400h-650v-1200h1300v1200h-650z" fill="none" stroke="#3465a4"/><text id="text212" class="TextShape"><tspan id="tspan214" class="TextParagraph" font-family="sans-serif" font-size="635px" font-weight="400"><tspan id="tspan216" class="TextPosition" x="5003" y="4021"><tspan id="tspan218" fill="#ffffff">G</tspan></tspan></tspan></text>
diff --git a/Documentation/userspace-api/media/v4l/constraints.svg b/Documentation/userspace-api/media/v4l/constraints.svg
index 1dfe51a9839d..ac5f82bc6d1a 100644
--- a/Documentation/userspace-api/media/v4l/constraints.svg
+++ b/Documentation/userspace-api/media/v4l/constraints.svg
@@ -1,31 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<!--
-    This file is dual-licensed: you can use it either under the terms
-    of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-    dual licensing only applies to this file, and not this project as a
-    whole.
-
-    a) This file is free software; you can redistribute it and/or
-       modify it under the terms of the GNU General Public License as
-       published by the Free Software Foundation version 2 of
-       the License.
-
-       This file is distributed in the hope that it will be useful,
-       but WITHOUT ANY WARRANTY; without even the implied warranty of
-       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-       GNU General Public License for more details.
-
-    Or, alternatively,
-
-    b) Permission is granted to copy, distribute and/or modify this
-       document under the terms of the GNU Free Documentation License,
-       Version 1.1 or any later version published by the Free Software
-       Foundation, with no Invariant Sections, no Front-Cover Texts
-       and no Back-Cover Texts. A copy of the license is included at
-       Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later -->
 <svg id="svg2" width="249.01mm" height="143.01mm" fill-rule="evenodd" stroke-linejoin="round" stroke-width="28.222" preserveAspectRatio="xMidYMid" version="1.2" viewBox="0 0 24900.998 14300.999" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata id="metadata325"><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata><defs id="defs4" class="ClipPathGroup"><marker id="marker6261" overflow="visible" orient="auto"><path id="path6263" transform="matrix(-.4 0 0 -.4 -4 0)" d="m0 0 5-5-17.5 5 17.5 5-5-5z" fill="#f00" fill-rule="evenodd" stroke="#f00" stroke-width="1pt"/></marker><marker id="marker6125" overflow="visible"
 orient="auto"><path id="path6127" transform="matrix(-.4 0 0 -.4 -4 0)" d="m0 0 5-5-17.5 5 17.5 5-5-5z" fill="#f00" fill-rule="evenodd" stroke="#f00" stroke-width="1pt"/></marker><marker id="marker6001" overflow="visible" orient="auto"><path id="path6003" transform="matrix(-.4 0 0 -.4 -4 0)" d="m0 0 5-5-17.5 5 17.5 5-5-5z" fill="#f00" fill-rule="evenodd" stroke="#f00" stroke-width="1pt"/></marker><marker id="marker5693" overflow="visible" orient="auto"><path id="path5695" transform="matrix(-.4 0 0 -.4 -4 0)" d="m0 0 5-5-17.5 5 17.5 5-5-5z" fill="#f00" fill-rule="evenodd" stroke="#f00" stroke-width="1pt"/></marker><marker id="marker5575" overflow="visible" orient="auto"><path id="path5577" transform="matrix(-.4 0 0 -.4 -4 0)" d="m0 0 5-5-17.5 5 17.5 5-5-5z" fill="#000080" fill-rule="evenodd" stroke="#000080" stroke-width="1pt"/></marker><marker id="marker5469" overflow="visible"
 orient="auto"><path id="path5471" transform="matrix(-.4 0 0 -.4 -4 0)" d="m0 0 5-5-17.5 5 17.5 5-5-5z" fill="#000080" fill-rule="evenodd" stroke="#000080" stroke-width="1pt"/></marker><marker id="marker5259" overflow="visible" orient="auto"><path id="path5261" transform="matrix(-.4 0 0 -.4 -4 0)" d="m0 0 5-5-17.5 5 17.5 5-5-5z" fill="#000080" fill-rule="evenodd" stroke="#000080" stroke-width="1pt"/></marker><marker id="Arrow2Mend" overflow="visible" orient="auto"><path id="path4241" transform="scale(-.6)" d="m8.7186 4.0337-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" fill="#000080" fill-rule="evenodd" stroke="#000080" stroke-linejoin="round" stroke-width=".625"/></marker></defs><g id="g204" class="com.sun.star.drawing.CustomShape" transform="translate(-1350,-3250)"><g id="id6"><rect id="rect207" class="BoundingBox" x="1350" y="3250" width="24901" height="14301"
diff --git a/Documentation/userspace-api/media/v4l/nv12mt.svg b/Documentation/userspace-api/media/v4l/nv12mt.svg
index d4bb4eb83f6a..30a15b5470be 100644
--- a/Documentation/userspace-api/media/v4l/nv12mt.svg
+++ b/Documentation/userspace-api/media/v4l/nv12mt.svg
@@ -1,31 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    This file is dual-licensed: you can use it either under the terms
-    of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-    dual licensing only applies to this file, and not this project as a
-    whole.
-
-    a) This file is free software; you can redistribute it and/or
-       modify it under the terms of the GNU General Public License as
-       published by the Free Software Foundation version 2 of
-       the License.
-
-       This file is distributed in the hope that it will be useful,
-       but WITHOUT ANY WARRANTY; without even the implied warranty of
-       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-       GNU General Public License for more details.
-
-    Or, alternatively,
-
-    b) Permission is granted to copy, distribute and/or modify this
-       document under the terms of the GNU Free Documentation License,
-       Version 1.1 or any later version published by the Free Software
-       Foundation, with no Invariant Sections, no Front-Cover Texts
-       and no Back-Cover Texts. A copy of the license is included at
-       Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/nv12mt_example.svg b/Documentation/userspace-api/media/v4l/nv12mt_example.svg
index e5075af9f45a..d1e2023f4973 100644
--- a/Documentation/userspace-api/media/v4l/nv12mt_example.svg
+++ b/Documentation/userspace-api/media/v4l/nv12mt_example.svg
@@ -1,31 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    This file is dual-licensed: you can use it either under the terms
-    of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-    dual licensing only applies to this file, and not this project as a
-    whole.
-
-    a) This file is free software; you can redistribute it and/or
-       modify it under the terms of the GNU General Public License as
-       published by the Free Software Foundation version 2 of
-       the License.
-
-       This file is distributed in the hope that it will be useful,
-       but WITHOUT ANY WARRANTY; without even the implied warranty of
-       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-       GNU General Public License for more details.
-
-    Or, alternatively,
-
-    b) Permission is granted to copy, distribute and/or modify this
-       document under the terms of the GNU Free Documentation License,
-       Version 1.1 or any later version published by the Free Software
-       Foundation, with no Invariant Sections, no Front-Cover Texts
-       and no Back-Cover Texts. A copy of the license is included at
-       Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/selection.svg b/Documentation/userspace-api/media/v4l/selection.svg
index c0e00ab2ae6b..6305b53b8e54 100644
--- a/Documentation/userspace-api/media/v4l/selection.svg
+++ b/Documentation/userspace-api/media/v4l/selection.svg
@@ -1,31 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<!--
-    This file is dual-licensed: you can use it either under the terms
-    of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
-    dual licensing only applies to this file, and not this project as a
-    whole.
-
-    a) This file is free software; you can redistribute it and/or
-       modify it under the terms of the GNU General Public License as
-       published by the Free Software Foundation version 2 of
-       the License.
-
-       This file is distributed in the hope that it will be useful,
-       but WITHOUT ANY WARRANTY; without even the implied warranty of
-       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-       GNU General Public License for more details.
-
-    Or, alternatively,
-
-    b) Permission is granted to copy, distribute and/or modify this
-       document under the terms of the GNU Free Documentation License,
-       Version 1.1 or any later version published by the Free Software
-       Foundation, with no Invariant Sections, no Front-Cover Texts
-       and no Back-Cover Texts. A copy of the license is included at
-       Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later -->
 <svg enable-background="new" version="1" viewBox="0 0 4226.3 1686.8" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
   <pattern id="ig" xlink:href="#ka" patternTransform="matrix(5.4432 0 0 10.1 1722.4 161.06)"/>
-- 
2.26.2

