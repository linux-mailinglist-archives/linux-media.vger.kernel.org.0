Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D413B10E9C2
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 12:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfLBLqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 06:46:22 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41131 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727362AbfLBLqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Dec 2019 06:46:22 -0500
Received: from [192.168.2.10] ([31.45.23.139])
        by smtp-cloud7.xs4all.net with ESMTPA
        id bk9hix9onjpCObk9kiQdhe; Mon, 02 Dec 2019 12:46:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575287180; bh=H3CG2FP93xlvL+/Ei77xD/jbFAuAWmZdb1Fr124d1Qg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aHgp0fGhQvedDOXVrUxObRWiTb1ofW4bug//sNXFzIZWmh6QxVdjt6qjouzWeD0qn
         FexDhKTkMyAQBuriWvdx1RpqtROGFWr/Qew39SdKTQcScQ90cTHtcRaj6TKiHO9FdP
         Sh76zWKEHoy/9/W4qmfXw0drzZpgTEpo+ZvjH2+wU05Cgl5YQDijhcIbdVvAkSZMIe
         lOmEum+RYaBdj7OIiZbqbfFnnEPEWcVKoAz4H1uST7/5+kgTKpbHH0WM7GUsKkOeZ3
         2dTYnwyjoLVaDVDEy6WVKAbE880wv9v2tovWFlzf0F1p4KWpSDmSi+CCKyLUSvr0jW
         6EFse+kVNNkUw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vidioc-g-dv-timings.rst: fix wrong porch
Message-ID: <2b1cbc95-5007-f210-756d-ee0218293388@xs4all.nl>
Date:   Mon, 2 Dec 2019 12:46:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLD2acRah1PavdnImkIoArCXwCsro/VAiYQ8YLk6xeg1SuMlANSJ3PRZSSqX0FyO0JsRV7yI1aiG6szyFPqsvvwIHxLJDyU5Qf2YivjaGz4bGAWCmQ8x
 U2acJLYdpxZCPC6rF4ibn1KqyAGeqwsFDgJJRMIJov3fnIQTEXCjv/k7ClQJnBqqJYSsmYAFDKFp5g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is the vfrontporch of field 1 that is one half-line longer,
not the backporch.

The order of the vertical signals in an interlaced system is:

Field 1:

vsync
vbackporch
active video of field 1
vfrontporch + 0.5

Field 2:

il_vsync
il_vbackporch - 0.5
active video of field 2
il_vfrontporch

Interlaced systems that use HALF_LINE set the il_ fields as follows:

il_vfrontporch = vfrontporch
il_vsync = vsync
il_vbackporch = vbackporch + 1

So the total vertical blanking for field 1 is:

	vsync + vbackporch + vfrontporch + 0.5

and for field 2:

	vsync + vbackporch + 1 + vfrontporch - 0.5 ==
	vsync + vbackporch + vfrontporch + 0.5

So each field has the same number of half-lines.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst b/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
index 5712bd48e687..5c675cbac4cf 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
+++ b/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
@@ -279,7 +279,7 @@ EBUSY
 	then it will set this flag to signal this to the application.
     * - ``V4L2_DV_FL_HALF_LINE``
       - Specific to interlaced formats: if set, then the vertical
-	backporch of field 1 (aka the odd field) is really one half-line
+	frontporch of field 1 (aka the odd field) is really one half-line
 	longer and the vertical backporch of field 2 (aka the even field)
 	is really one half-line shorter, so each field has exactly the
 	same number of half-lines. Whether half-lines can be detected or
