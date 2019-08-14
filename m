Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA8B08D596
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 16:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbfHNOHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 10:07:11 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:38447 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727110AbfHNOHL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 10:07:11 -0400
Received: from [IPv6:2001:420:44c1:2579:6c2e:a3d:2bd:ee96] ([IPv6:2001:420:44c1:2579:6c2e:a3d:2bd:ee96])
        by smtp-cloud7.xs4all.net with ESMTPA
        id xtvehhgOrur8TxtvhhoWhi; Wed, 14 Aug 2019 16:07:09 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] vidioc-queryctrl.rst: fix broken c:type references
Message-ID: <1e475aa3-cd9d-579d-14c8-28e7ee816175@xs4all.nl>
Date:   Wed, 14 Aug 2019 16:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGPxev/JN+7oeMov94rrvqSuUdE3gDqTiFGsgK8eVNnUtOhVM8DGy+yK3N4kZKcwAGEYAnbu50UMyyqy0jCVk/nPmaYxSIuPBih5hTc+syqfqfKSje7B
 RoJDNxaCiQjMoQ6AlNQtdMMYbFaxc302BK5OYy/7MqZk0MICMg77vB8r65kcYi8Km9EoGu9LWbhJHkyY6RWAt6EpBjvKbXfsAZ6fk66MOwOj9SVsyUZUy52g
 Aq80U0z1opnNAtsI6lrkDJfA8aL2aD3mMS0ieO1cSUa74WJQrKgoQDPBCi5JFUwQ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One typo in the function name, one missing : after :c:type.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
index dc500632095d..a3d56ffbf4cc 100644
--- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
+++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
@@ -39,8 +39,8 @@ Arguments
     File descriptor returned by :ref:`open() <func-open>`.

 ``argp``
-    Pointer to struct :c:type:`v4l2_queryctl`, :c:type:`v4l2_query_ext_ctrl`
-    or :c:type`v4l2_querymenu` (depending on the ioctl).
+    Pointer to struct :c:type:`v4l2_queryctrl`, :c:type:`v4l2_query_ext_ctrl`
+    or :c:type:`v4l2_querymenu` (depending on the ioctl).


 Description
