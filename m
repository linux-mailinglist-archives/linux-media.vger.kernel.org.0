Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE3F21A630
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 19:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbgGIRrF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 13:47:05 -0400
Received: from iodev.co.uk ([193.29.56.124]:42380 "EHLO iodev.co.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728625AbgGIRq7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jul 2020 13:46:59 -0400
From:   Ismael Luceno <ismael@iodev.co.uk>
To:     linux-media@vger.kernel.org
Cc:     Ismael Luceno <ismael@iodev.co.uk>
Subject: [PATCH] keytable: Fix missing inclusion of argp.h
Date:   Thu,  9 Jul 2020 19:48:31 +0200
Message-Id: <20200709174831.14134-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

error_t is only defined by argp.h on non-glibc systems.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 utils/keytable/bpf_load.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/keytable/bpf_load.c b/utils/keytable/bpf_load.c
index 9f64cf4e91e8..7ae9af4a57be 100644
--- a/utils/keytable/bpf_load.c
+++ b/utils/keytable/bpf_load.c
@@ -13,6 +13,7 @@
 #include <stdlib.h>
 #include <linux/bpf.h>
 #include <assert.h>
+#include <argp.h>
 #include "keymap.h"
 #include "bpf.h"
 #include "bpf_load.h"
-- 
2.27.0

