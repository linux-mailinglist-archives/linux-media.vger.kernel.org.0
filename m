Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22AA0165A3B
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 10:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgBTJec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 04:34:32 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:36453 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726637AbgBTJec (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 04:34:32 -0500
Received: from [IPv6:2001:420:44c1:2577:1c10:d9c8:263c:14df]
 ([IPv6:2001:420:44c1:2577:1c10:d9c8:263c:14df])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4iDyjA2s2yIme4iE2jiw7J; Thu, 20 Feb 2020 10:34:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582191270; bh=FOPVd78y2bVZFbgkcpTho87nrj1kK5k7QBZqOZLA5nM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Osn+zzUegs0d/Ax8UTyB1rSmXcAtXnghMPNXVu/WtLsTdmnmv3iwaze16UtnioyVE
         jxYCuY6qPnZsJoVO0MbMe9Hb1GIbfpCpGHJI+z6PaLvI3gjKltiBHJeA9KEHy7T+4d
         UePdkfEkDcPK/3pVKK+e3Dhuxg1bxFGeFChO68gm0WI38oS7ik1OHpQvSSDXQ861fc
         vskO+A2jW7porhhShz+f0sZKpCswAjzCl7v2aizgXbYB1SOrUoKXHhMi7cuh/SkDNN
         iL1MmhryIWaCa417g306AdDecJf0Murw+N+mVj8HhcnrF1AF9d4z35wspmB5dIYENR
         uLyE0s/WYsKAA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] videobuf2-core.h: improve buf_struct_size documentation
Message-ID: <80c089d1-0902-c780-e941-2fca9915cd07@xs4all.nl>
Date:   Thu, 20 Feb 2020 10:34:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL+T8vtHWdZyZBR4WoCw2AuS0KUClxSuWhb6LeknwQSg7GJOnenTwvXwQzpXFiQgrr7cNPM8bqqQJRTGTYqKSu8vwlEBYQq8nmpa2mN77GwPJhI33pQ+
 bWjIwnGrHX0w7tOOSUBERkdZeTpTfRDdqEyCyzyHOs8RqHM7VeVzg5xx5HLyMXyNsUMvxyRivg8thuvAMiCQySFK7//4Ieth4e6KA0IyHBiTiZ2GiSep2eiH
 1vvAzo957mBlzfFFwh5akxW6/Qs+gwsSQ+UPJNE5raY3C+b7ajZOfiLZAwU8vfJU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Explicitly document that the driver-specific buffer structure
must start with the subsystem-specific struct (vb2_v4l2_buffer
in the case of V4L2).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index a2b2208b02da..f11b96514cf7 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -509,8 +509,11 @@ struct vb2_buf_ops {
  *		by the vb2 core.
  * @buf_struct_size: size of the driver-specific buffer structure;
  *		"0" indicates the driver doesn't want to use a custom buffer
- *		structure type. for example, ``sizeof(struct vb2_v4l2_buffer)``
- *		will be used for v4l2.
+ *		structure type. In that case a subsystem-specific struct
+ *		will be used (in the case of V4L2 that is
+ *		``sizeof(struct vb2_v4l2_buffer)``). The first field of the
+ *		driver-specific buffer structure must be the subsystem-specific
+ *		struct (vb2_v4l2_buffer in the case of V4L2).
  * @timestamp_flags: Timestamp flags; ``V4L2_BUF_FLAG_TIMESTAMP_*`` and
  *		``V4L2_BUF_FLAG_TSTAMP_SRC_*``
  * @gfp_flags:	additional gfp flags used when allocating the buffers.
