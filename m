Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B42562B075
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 10:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfE0Inc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 04:43:32 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:48145 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725908AbfE0Inc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 04:43:32 -0400
Received: from [IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52] ([IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VBE9hZaDisDWyVBEAhY8kP; Mon, 27 May 2019 10:43:30 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-pci-skeleton.c: fix doc warning
Message-ID: <3392f8f8-ae66-8381-819b-2b99915190bf@xs4all.nl>
Date:   Mon, 27 May 2019 10:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCLGLxV+44C3/A9YVbKarmK/wM171TzYiG9CJ3XPID8XaBewuE/XKlnFdm1dcq6T3Aw0S1/9JUXJC4wgYUEoU948FjT2jHqShV5XxOJoeF/Tv3UWKzI+
 rEcBQlC9Ln1faqUnsqgeciQb5RPAYpvJ2vdNe4BEV1eEQ0gRQI7UE0cGNxhcT6S1UogOifTDlTSagt7Sy8d8DkUv7Y1l7P0j2flYdq2q5LH55Mjf3LKalOsN
 6MYd5gMJPp9QDvEU4xCdco5QHwWZcS+AOhkZYv/7oEo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the 'field' field to fix this warning:

samples/v4l/v4l2-pci-skeleton.c:80: warning: Function parameter or member 'field' not described in 'skeleton'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index 758ced8c3d06..f6a551bd57ef 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -58,6 +58,7 @@ MODULE_LICENSE("GPL v2");
  * @queue: vb2 video capture queue
  * @qlock: spinlock controlling access to buf_list and sequence
  * @buf_list: list of buffers queued for DMA
+ * @field: the field (TOP/BOTTOM/other) of the current buffer
  * @sequence: frame sequence counter
  */
 struct skeleton {
