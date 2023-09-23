Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940DA7AC31F
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbjIWPVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231880AbjIWPVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C47192
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:18 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD8DC433C8;
        Sat, 23 Sep 2023 15:21:16 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCHv2 05/23] media: ipu-bridge: increase sensor_name size
Date:   Sat, 23 Sep 2023 17:20:49 +0200
Message-Id: <20230923152107.283289-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this compiler warning:

In file included from include/linux/property.h:14,
                 from include/linux/acpi.h:16,
                 from drivers/media/pci/intel/ipu-bridge.c:4:
In function 'ipu_bridge_init_swnode_names',
    inlined from 'ipu_bridge_create_connection_swnodes' at drivers/media/pci/intel/ipu-bridge.c:445:2,
    inlined from 'ipu_bridge_connect_sensor' at drivers/media/pci/intel/ipu-bridge.c:656:3:
include/linux/fwnode.h:81:49: warning: '%u' directive output may be truncated writing between 1 and 3 bytes into a region of size 2 [-Wformat-truncation=]
   81 | #define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
      |                                                 ^~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:384:18: note: in expansion of macro 'SWNODE_GRAPH_PORT_NAME_FMT'
  384 |                  SWNODE_GRAPH_PORT_NAME_FMT, sensor->link);
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/fwnode.h: In function 'ipu_bridge_connect_sensor':
include/linux/fwnode.h:81:55: note: format string is defined here
   81 | #define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
      |                                                       ^~
In function 'ipu_bridge_init_swnode_names',
    inlined from 'ipu_bridge_create_connection_swnodes' at drivers/media/pci/intel/ipu-bridge.c:445:2,
    inlined from 'ipu_bridge_connect_sensor' at drivers/media/pci/intel/ipu-bridge.c:656:3:
include/linux/fwnode.h:81:49: note: directive argument in the range [0, 255]
   81 | #define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
      |                                                 ^~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:384:18: note: in expansion of macro 'SWNODE_GRAPH_PORT_NAME_FMT'
  384 |                  SWNODE_GRAPH_PORT_NAME_FMT, sensor->link);
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:382:9: note: 'snprintf' output between 7 and 9 bytes into a destination of size 7
  382 |         snprintf(sensor->node_names.remote_port,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  383 |                  sizeof(sensor->node_names.remote_port),
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  384 |                  SWNODE_GRAPH_PORT_NAME_FMT, sensor->link);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 include/media/ipu-bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index bdc654a45521..783bda6d5cc3 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -108,7 +108,7 @@ struct ipu_node_names {
 	char ivsc_sensor_port[7];
 	char ivsc_ipu_port[7];
 	char endpoint[11];
-	char remote_port[7];
+	char remote_port[9];
 	char vcm[16];
 };
 
-- 
2.40.1

