Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2DF42BB5C
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 11:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237139AbhJMJVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 05:21:33 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:48535 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhJMJVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 05:21:32 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4CE06240009;
        Wed, 13 Oct 2021 09:19:22 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH] media: Document coding style requirements
Date:   Wed, 13 Oct 2021 11:20:05 +0200
Message-Id: <20211013092005.14268-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a few additional coding style conventions in place in
the media subsystem. If they do not get documented, it's hard to enforce
them during review as well as it is hard for developers to follow them
without having previously contributed to the subsystem.

Add them to the subsystem profile documentation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---

All points are up for discussion ofc.

But the idea is to get to have more requirement defined, as otherwise
it's very hard to enforce them during review.

Thanks
   j

---
 .../media/maintainer-entry-profile.rst        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index eb1cdfd280ba..9c376f843e1c 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -180,6 +180,30 @@ In particular, we accept lines with more than 80 columns:
     - when they avoid a line to end with an open parenthesis or an open
       bracket.

+There are a few additional requirements which are not enforced by tooling
+but mostly during the review process:
+
+    - C++ style comments are not allowed, if not for SPDX headers;
+    - hexadecimal values should be spelled using lowercase letters;
+    - one structure/enum member declaration per line;
+    - one variable declaration per line;
+    - prefer variable declaration order in reverse-x-mas-tree over
+      initialization at variable declare time;
+
+      As an example, the following style is preferred::
+
+         struct priv_struct *priv = container_of(....)
+         struct foo_struct *foo = priv->foo;
+         int b;
+
+         b = a_very_long_operation_name(foo, s->bar)
+
+      over the following one::
+
+         struct priv_struct *priv = container_of(....)
+         struct foo_struct *foo = priv->foo;
+         int b = a_very_long_operation_name(foo, s->bar)
+
 Key Cycle Dates
 ---------------

--
2.33.0

