Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6A9336FBE
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbhCKKUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:48 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51799 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232265AbhCKKU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQelKo51; Thu, 11 Mar 2021 11:20:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458028; bh=DJwZaOIF1TgpehnUmO7XVnOQgY9TkLXvh5QFPg0aevg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type:From:
         Subject;
        b=eC46BIkumm+UdL0Y1/c73NOoqtXJePmoVD4NWh1gc+tkzQws3YFK65swfZ347v2aT
         OQQGY8zGzR8oqV+RTTOUWE3K6dH3mDY4o4yjAHYr0+8p0yGbm3VNrsoWpWmOmijZe0
         xmH1twr/NsZL0u127JR94Upw5VGVjSYu+2p4UZPU44rmMt82KjeCZ8SYgWNbCGGN40
         1ZfyTdlIfiWZ5xOLI4GvQwy3AnoCM2UPFeWWTyANgLIDwjupGP9YNjgUsUNtJ2xcRM
         7a0Ln+Au0JYrTeAnS8sMK85ROVURqbcAoopJA7PfFbmWrqcNyg0tSfFFUpXNqYaom4
         OM2irwylDnKGQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 04/13] rcar-vin/rcar-vin.h: fix kernel-doc formatting
Date:   Thu, 11 Mar 2021 11:20:13 +0100
Message-Id: <20210311102022.96954-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI2xPb/zUiB1u72ER64GdeqlP5VATSz1rK0PzXa8A/OqDFQ+9I+MEpAR3WYnAs21EYlBUZ6IxwHRH6xiF5pUwmHqHeW73aKBo1Cd+mE10150Hj0IjQg7
 ecQCpfUlobofQ4V2L0ZWzyWiBBpQFk0AB9QJ8+ZMYGJf2IQyv28zB5+HYc8rqQ7O6rPCkoVzKowBnfff9HGYHvNFMbYHTFG1bmOmEx4uhP5PpPhf+laIheco
 WoTjO3S6H5VpiYB0zQc5JsbAUh19xsebNFILelb0IGWLFiArbjY3owOOnc7gBr3E
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix formatting of two enums and one struct.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-vin.h | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 0ee9d402f5ac..b263ead4db2b 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -49,11 +49,12 @@ enum rvin_csi_id {
 };
 
 /**
- * STOPPED   - No operation in progress
- * STARTING  - Capture starting up
- * RUNNING   - Operation in progress have buffers
- * STOPPING  - Stopping operation
- * SUSPENDED - Capture is suspended
+ * enum rvin_dma_state - DMA states
+ * @STOPPED:   No operation in progress
+ * @STARTING:  Capture starting up
+ * @RUNNING:   Operation in progress have buffers
+ * @STOPPING:  Stopping operation
+ * @SUSPENDED: Capture is suspended
  */
 enum rvin_dma_state {
 	STOPPED = 0,
@@ -70,9 +71,9 @@ enum rvin_dma_state {
  * to capture SEQ_TB/BT it's needed to capture to the same vb2
  * buffer twice so the type of buffer needs to be kept.
  *
- * FULL - One capture fills the whole vb2 buffer
- * HALF_TOP - One capture fills the top half of the vb2 buffer
- * HALF_BOTTOM - One capture fills the bottom half of the vb2 buffer
+ * @FULL: One capture fills the whole vb2 buffer
+ * @HALF_TOP: One capture fills the top half of the vb2 buffer
+ * @HALF_BOTTOM: One capture fills the bottom half of the vb2 buffer
  */
 enum rvin_buffer_type {
 	FULL,
@@ -191,7 +192,7 @@ struct rvin_info {
  * @state:		keeps track of operation state
  *
  * @is_csi:		flag to mark the VIN as using a CSI-2 subdevice
- * @chsel		Cached value of the current CSI-2 channel selection
+ * @chsel:		Cached value of the current CSI-2 channel selection
  *
  * @mbus_code:		media bus format code
  * @format:		active V4L2 pixel format
-- 
2.30.1

