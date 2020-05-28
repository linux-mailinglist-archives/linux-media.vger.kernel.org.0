Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC341E5D7D
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 12:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388034AbgE1KzQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 06:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387926AbgE1KzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 06:55:12 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243BCC08C5C5;
        Thu, 28 May 2020 03:55:12 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D73E2C63A8; Thu, 28 May 2020 11:55:08 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v4 3/3] MAINTAINERS: rc core and lirc maintainership
Date:   Thu, 28 May 2020 11:55:08 +0100
Message-Id: <20200528105508.5183-4-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528105508.5183-1-sean@mess.org>
References: <20200528105508.5183-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This has been maintained for some time, update MAINTAINERS to reflect.

Signed-off-by: Sean Young <sean@mess.org>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 791d2a862e41..73f97fea8ba8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14190,6 +14190,19 @@ L:	linux-wireless@vger.kernel.org
 S:	Orphan
 F:	drivers/net/wireless/ray*
 
+RC CORE / LIRC FRAMEWORK
+M:	Sean Young <sean@mess.org>
+L:	linux-media@vger.kernel.org
+S:	Supported
+W:	http://linuxtv.org
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/driver-api/media/rc-core.rst
+F:	Documentation/userspace-api/media/rc/
+F:	drivers/media/rc/
+F:	include/media/rc-map.h
+F:	include/media/rc-core.h
+F:	include/uapi/linux/lirc.h
+
 RCMM REMOTE CONTROLS DECODER
 M:	Patrick Lerda <patrick9876@free.fr>
 S:	Maintained
-- 
2.26.2

