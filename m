Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79FD6332004
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 08:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhCIHoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 02:44:09 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40511 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229515AbhCIHnj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 02:43:39 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JX1il6F8WqY4WJX1mldZjT; Tue, 09 Mar 2021 08:43:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615275818; bh=G73HC8fwe6/ETpyVOhq3wrmNDWdicCRalO0iSqsehE4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=shCr+7ZdAsB+i8Dvy1KLI1QjW9hhq96JE9LaHKcNCu5M3sB4aVNnOIMdp0zY1NzJh
         2dUHjf3gksZIiMsPIYG3/cWH/iwsAZnzvav6V1eYfDZRSPxXqDXD3C5Sc8WUXaKvwb
         sgCxzR6g+8XdcbD9Y4FgQ8u0K6K1nXTi1a9872/LqlRRmhCdRCyPE7JGgAdbDYwibZ
         T+xOjALA3no4ax6WlbVpX/GxDWoLf1O9lRJ+GSw30BNE4dzl51PMLSergFaap0W6rw
         j7Z/tEhzCr4GqqKASwQ+e2x6Wk0EQbKkfaA+CZOv/jYsT5rOE6CxJV+3ViwkBcNgqu
         yRb2Bb+Es+tOQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] ext-ctrls-codec.rst: clarify V4L2_CID_MPEG_VIDEO_BITRATE
Message-ID: <aae201d4-9ee4-d73a-bda7-4e75a2d85f6e@xs4all.nl>
Date:   Tue, 9 Mar 2021 08:43:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFdpyorGlwU+sqpFB1BbaWG4rlIy2N3JZOveXcnzjDC5EUFwsqLSYj5KRW1CcBtpGoey/ppL28IuGumNd6pyl38tdk+Lp9rRKLsEEUMYpsPTa2jS95j5
 iffD1DUg091qZwgR0yGZRZ//TnlTVyHU8R3dcuy2DLg1HUp7hIUK8CSEGVw/ygn6+PPD6qVr5aM7dxhF3F+JZI1knczWNbjpl28=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The documentation for V4L2_CID_MPEG_VIDEO_BITRATE was missing the word
'Average': this is the average video bitrate.

The V4L2_CID_MPEG_VIDEO_BITRATE_PEAK documentation *does* refer to
V4L2_CID_MPEG_VIDEO_BITRATE as the average video bitrate.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 7ee8ae073b91..87ba17aaf36e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -580,7 +580,7 @@ enum v4l2_mpeg_video_bitrate_mode -


 ``V4L2_CID_MPEG_VIDEO_BITRATE (integer)``
-    Video bitrate in bits per second.
+    Average video bitrate in bits per second.

 ``V4L2_CID_MPEG_VIDEO_BITRATE_PEAK (integer)``
     Peak video bitrate in bits per second. Must be larger or equal to
