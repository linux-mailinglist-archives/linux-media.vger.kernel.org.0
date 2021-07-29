Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3C53DA46D
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 15:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237559AbhG2Ngi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 09:36:38 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:50367 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237585AbhG2Ngf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 09:36:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 96D5mV4p4XTlc96D6mWuNK; Thu, 29 Jul 2021 15:36:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627565788; bh=OwMw1SnB0FvNy7NkyLwMP52QS8Hi/dGXZSI4slqI8cI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=qiG0/Z4ed8xeqHfDtb0ZMAiAsuSv1lPm8kjEMkgzS0BjRrodE7Dn5XkssTmZ0edmt
         Xht4lCojt+yAgvzr5LQuIVM9OMdMDfmcNXJyM1z333R9FSepZmRnvLOb2ur3s/yI2J
         j0Ua517eg3fZjmzkh9Ne8H86EnKrLBLAI6en1VNN+hM88PENwu5TA0hAyFtzJqpYnu
         ZN/yv1TzICCqjuVSZXxRJzV8xpVbm28XJp+IIajvDSLYas1cFkkJU0DTb6DMbfrTlE
         BNPMWj66cR+61TlcD6njsjz131SW1jYbwkAJsKrOTKA62YitCFmSedQ+oxv4bXnt3F
         fLqfjYr7x66fQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] vivid: add module option to set request support mode
Date:   Thu, 29 Jul 2021 15:36:26 +0200
Message-Id: <20210729133627.1592672-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210729133627.1592672-1-hverkuil-cisco@xs4all.nl>
References: <20210729133627.1592672-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGO50jq3zq15EklNILRdBPqiw3bRBKS+KTHcK5dj5eI2gxDuY+hjCkw5SSO5mN490Q939bLx8p8FD5SUNfS8NVrDTi2JiqDDJMYKH1QZ+VTOXGbILlq8
 RG4j1C/sA6iK2rsLmCsjMWxHRRLpMtyE00+TFKsoDpregSTXXCdpw+aGQJHDIapUHDo/x2XM1cNrKiFwv3UbgCzWFdWln3Yj5m0I2CRraxCzk6e4pmxu0+Fl
 SYlATkBNTsgwAFX2OH7HdqMtDDwEIjE/skEGUig8ICNou5lf7E9xr7/JmyMiQIVV4xHs3aqISGTkLISX8xDD5w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently vivid supports the Request API, but it also sets
min_buffers_needed in the vb2 queue. But the combination of
support_requests and min_buffers_needed is not allowed due to
the fact that vb2_core_qbuf() isn't supposed to fail when called
from the request framework. And if min_buffers_needed > 0, then
is can call start_streaming() which definitely can fail.

With the new module option you can control if requests are not
allowed (min_buffers_needed is 2 in that case), optionally allowed
or are required. In the latter two cases min_buffers_needed is set
to 0.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index d2bd2653cf54..87f27c7524ec 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -177,6 +177,15 @@ MODULE_PARM_DESC(cache_hints, " user-space cache hints, default is 0.\n"
 			     "\t\t    0 == forbid\n"
 			     "\t\t    1 == allow");
 
+static unsigned int supports_requests[VIVID_MAX_DEVS] = {
+	[0 ... (VIVID_MAX_DEVS - 1)] = 1
+};
+module_param_array(supports_requests, uint, NULL, 0444);
+MODULE_PARM_DESC(supports_requests, " support for requests, default is 1.\n"
+			     "\t\t    0 == no support\n"
+			     "\t\t    1 == supports requests\n"
+			     "\t\t    2 == requires requests");
+
 static struct vivid_dev *vivid_devs[VIVID_MAX_DEVS];
 
 const struct v4l2_rect vivid_min_rect = {
@@ -883,10 +892,11 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->mem_ops = allocators[dev->inst] == 1 ? &vb2_dma_contig_memops :
 						  &vb2_vmalloc_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = min_buffers_needed;
+	q->min_buffers_needed = supports_requests[dev->inst] ? 0 : min_buffers_needed;
 	q->lock = &dev->mutex;
 	q->dev = dev->v4l2_dev.dev;
-	q->supports_requests = true;
+	q->supports_requests = supports_requests[dev->inst];
+	q->requires_requests = supports_requests[dev->inst] >= 2;
 	q->allow_cache_hints = (cache_hints[dev->inst] == 1);
 
 	return vb2_queue_init(q);
-- 
2.30.2

