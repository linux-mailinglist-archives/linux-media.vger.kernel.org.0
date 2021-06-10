Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0666D3A2A68
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbhFJLi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:26 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:51789 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230458AbhFJLiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:22 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIz2lXjU2; Thu, 10 Jun 2021 13:36:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324984; bh=s45d0M31g/3dKjbi6k0G16oD+b69JqE3R/X2+CQyswY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=NaoKJYhzZlYek+t7O8G2mfhviyw+sZvPF2+ywgabcBiG+OUtGLGZy3lL5aY9Jyqvq
         YOL1pGieEtwBCmJmEzDvfOTk3AQXWSaD+93Gfxl5L5gRbw66CyE1idJ6PIpNQQqbFh
         wd7hnrAm0Z60YCW26KBLiDnK/vd404QETHlZGj8ixl+FX6havDhNQoOi+7/qjO6foA
         nJsLrcgxIZ+k9XRBECZJBXovDfydrPPdVfYWZPFiNxPJXRYeAAz6ND/Y+EcYVP5RT2
         cFDNFHhDIbVlfYG9MuVm86I/hWiNfo8qVa3Umksapmgs8nJfcDdxpYs5F5d7jRiDaq
         s+bgVu46NZqRg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 09/11] vivid: add ro_requests module option
Date:   Thu, 10 Jun 2021 13:36:13 +0200
Message-Id: <20210610113615.785359-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPnmug6ZXHlb/ZvmC4vbNHpxD73xFb4M0tsprMr6EdAuDd6oNWZt2PXVubXtTOyCb/7VEbxIceoKE0V2AfbWJPh9otbmfksO3D/oXia8aoOXFDH8ic97
 4tbXpucSAudlbehnxYyTSy42Jbr5n3ywcjq+0WLAAeSno+XW7IpFee8wqdTQlWwc7MfSSF0CCrEuuqzrYU1c18DJ5iixB4V78OH/jewuA/vpb53SvEU2JypW
 YQD07JXW85ijiW9dWVf7G/7LSIS2vO5pf+SsJXchHjqhjv70U+Q7crbvrkKE5JR9aJMFO1vsWkykfvKPIXZq4MD+B8JpH0Pel2U1/LS9tSkjtdWXcUGIJ2vc
 tMlf7ZqBUjOquByjzzQpkua+L+BIwfTQSLRBVtMZ+Q+vLN2c7bKwiFvxDnCxyt9mICqMxYBI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the ro_requests module option to test Read-Only Requests with vivid.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/admin-guide/media/vivid.rst     | 10 ++++++++++
 drivers/media/test-drivers/vivid/vivid-core.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 6d7175f96f74..423a61797a1d 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -302,6 +302,16 @@ all configurable using the following module options:
 		- 0: forbid hints
 		- 1: allow hints
 
+- ro_requests:
+
+	specifies if the capture device supports the standard Request API (i.e.
+	userspace can set controls in a request before queueing it), or
+	the Read-Only Request API (userspace can only read back controls after
+	the request was completed). Default is 0.
+
+		- 0: regular requests
+		- 1: read-only requests
+
 Taken together, all these module options allow you to precisely customize
 the driver behavior and test your application with all sorts of permutations.
 It is also very suitable to emulate hardware that is not yet available, e.g.
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index ca0ebf6ad9cc..641d8c75e8c9 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -177,6 +177,14 @@ MODULE_PARM_DESC(cache_hints, " user-space cache hints, default is 0.\n"
 			     "\t\t    0 == forbid\n"
 			     "\t\t    1 == allow");
 
+static unsigned int ro_requests[VIVID_MAX_DEVS] = {
+	[0 ... (VIVID_MAX_DEVS - 1)] = 0
+};
+module_param_array(ro_requests, uint, NULL, 0444);
+MODULE_PARM_DESC(ro_requests, " use read-only requests for video capture instead of regular requests, default is 0.\n"
+			     "\t\t    0 == regular requests\n"
+			     "\t\t    1 == read-only requests");
+
 static struct vivid_dev *vivid_devs[VIVID_MAX_DEVS];
 
 const struct v4l2_rect vivid_min_rect = {
@@ -847,6 +855,8 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->lock = &dev->mutex;
 	q->dev = dev->v4l2_dev.dev;
 	q->supports_requests = true;
+	if (V4L2_TYPE_IS_CAPTURE(buf_type))
+		q->supports_ro_requests = (ro_requests[dev->inst] == 1);
 	q->allow_cache_hints = (cache_hints[dev->inst] == 1);
 
 	return vb2_queue_init(q);
-- 
2.30.2

