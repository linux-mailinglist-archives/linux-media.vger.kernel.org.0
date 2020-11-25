Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B372C3D8E
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 11:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgKYKTM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 05:19:12 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46325 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728007AbgKYKTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 05:19:11 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id hrtCkIkWNN7XghrtFkVjkx; Wed, 25 Nov 2020 11:19:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606299550; bh=WGZcU2w4tIaS7uuajhktID/k6+kCgrl62QJhKPZWlOM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hFvy0r1HcuxpyGvxWj5SWo0WlzM+eMbF9yHVuM7qFLrfA+c5Omc9pPC/dbt1+fu8m
         PO9S+U3u6OjAo4w7o1dc3k4ogsiqYSp/Xeo4k4E0MHyY4QOyBBJWh24Kq+4Y/YXiKK
         SVn3FBMC8oY6sn4CGkBDWz2pMHVnh5EAuNnwWUVjgqbZrejKOTsz/RNWhz3b/hQudi
         izrRchc5xaDS4MnvkHgkgZ+OKE0c25+gHDX+ZgFM8RO4+oiuN/rX7WfUp0iva7CHd8
         FOIE0A9L6sB50m5fpwqnpLuOct78RoQTOT8jatf2F7i+34/OH9xbVRoezkkudPIely
         mD//uL7A2UN7Q==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: ext-ctrls-image-source.rst: document v4l2_area
Message-ID: <7e300fef-6cbe-7f29-545e-8597381de1e0@xs4all.nl>
Date:   Wed, 25 Nov 2020 11:19:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOzqWTG+fvSvTfM+XJJg4RmqMcBaU7x+Xh0e3JAJ/r8uJC6312V0Jc2QdVstv87HXHO1NTfFEFSkYqadwN1FS0ryzw90nVma+5F5HBGlo6Dh/8UFj27G
 DobT/S8KYhSknYt2hi5wyexROYhL3463VgBPh9unmFWYnCN9YBA3klMsxaAqc5giCquwyTT5L6G7uUp8ESUaIyJKBW5s0YUSwIs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_area struct was not documented in the media documentation,
which meant that references to that struct elsewhere in the documentation
never linked to anything.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 9457dc340c31..5b50f6e9a48f 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -58,3 +58,19 @@ Image Source Control IDs
     The unit cell consists of the whole area of the pixel, sensitive and
     non-sensitive.
     This control is required for automatic calibration of sensors/cameras.
+
+.. c:type:: v4l2_area
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_area
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``width``
+      - Width of the area.
+    * - __u32
+      - ``height``
+      - Height of the area.
