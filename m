Return-Path: <linux-media+bounces-127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B137E9039
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 14:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7F921C209CF
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 13:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803451172D;
	Sun, 12 Nov 2023 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rp+uNag7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD84510A1D
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 13:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3128C433CC;
	Sun, 12 Nov 2023 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795661;
	bh=y0TfggzpWPb/Wa1ssWhr5QrBaCm4qGZr1+mG4H75+iI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rp+uNag7p/eUBqJrjcwFyacEd8gE47bjey8O33VwbQV3r9ztB2kF+rBI+0Q6IeA42
	 JI4HmPsS/iVd+02helf2/623Z2fbM91jG1O1wq/Hb3J3aDCuD0HIj42gkigmgw+Nuo
	 85nHhAkUJJOYnjlEGBarUs7s/vgEQsqH7G1ePqUX6pKk1sRh7xGB6stBwaF1rBdi7F
	 YC4Yn7y4Iw6Gc6hNooP3rqe+xUgBtpJyI9wirMJqclrv2vre+WSqsJS/TACaHdUx+O
	 bHQpv6VgXVLoGynSs65woUwSPQ2qlnsKdKw5HEa06CAhCaBkMaAvRfUkXsKMOTKPgx
	 nkwRO8q8QpmWA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 03/11] media: ipu-bridge: increase sensor_name size
Date: Sun, 12 Nov 2023 08:27:26 -0500
Message-ID: <20231112132736.175494-3-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132736.175494-1-sashal@kernel.org>
References: <20231112132736.175494-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.1
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 83d0d4cc1423194b580356966107379490edd02e ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/media/ipu-bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index bdc654a455216..783bda6d5cc3f 100644
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
2.42.0


