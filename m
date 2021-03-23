Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1A634590A
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 08:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhCWHr2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 03:47:28 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49203 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229592AbhCWHrT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 03:47:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ObkuluK1PUzyrObkzlOa0w; Tue, 23 Mar 2021 08:47:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616485637; bh=2k4vhuOX8l62X0dpwr/OE85yfKLo2dPyris5X4ng5v4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qLFKfO3FPYdIPAV1D/kgQAfMyaUPWDIB5NKINvZTkDFrIwJFAugcPk/kM8azrGbQn
         6DKjOd3c7GpKdVYRgEaIxCGdmbtnEQzZG71s71fc7iuz1y3gy34FCFLw501OXDgDdx
         8HVARhVfF25OpuhOyhDqH3nh3G5HuRa/sGiKZf9/y/UqQJKXMBzljwmZv+NsgNxFtZ
         KUD6h7jncTa6WXyw7PUG2gniX0paudd2Lw/bXA+G/tNgDp+Uzue0+AqtoGUSMohtzA
         tRjakXEKDViGD0FscTR/EJyTx8LK4jd+4fuYb8fvJGDHXshjoApk1Gsy1eeRP7vrKQ
         Td1G+CRwpfwWg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] ccs-data.h: fix kernel-doc typo
Message-ID: <c0674449-c8f2-fb75-60ce-f6f178092a81@xs4all.nl>
Date:   Tue, 23 Mar 2021 08:47:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAIQK6ya+cWq/rRoN3605xfkoanMyDo0eLZDXTUu/4BkQSY4vYAHslp8P0sfdrEnmnCLpgSYDkRDEOiRArLZbL1JHr30QykLHQCQjtwirpIsSp4ob5UK
 ROToj/VpJuYDeWVKh8GvXCO29bBJDekptIqwf1/hyhYjtiBoiNj5StgVmzHTmN1w9ulzUMh+FNEGMeK/Bwv6QlrT6HmT/UkZeVQb06Q+k/Yf/wNnNXkzKeE8
 3CcCUB4RTV5+MzGUOAeJnA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

block -> pixel

Fixes this warning:

drivers/media/i2c/ccs/ccs-data.h:144: warning: expecting prototype for struct ccs_pdaf_pix_loc_block_desc. Prototype was for struct
ccs_pdaf_pix_loc_pixel_desc instead

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/ccs/ccs-data.h b/drivers/media/i2c/ccs/ccs-data.h
index c75d480c8792..d26db88937ea 100644
--- a/drivers/media/i2c/ccs/ccs-data.h
+++ b/drivers/media/i2c/ccs/ccs-data.h
@@ -132,7 +132,7 @@ struct ccs_pdaf_pix_loc_block_desc_group {
 };

 /**
- * struct ccs_pdaf_pix_loc_block_desc - PDAF pixel location block descriptor
+ * struct ccs_pdaf_pix_loc_pixel_desc - PDAF pixel location pixel descriptor
  * @pixel_type: Type of the pixel; CCS_DATA_PDAF_PIXEL_TYPE_*
  * @small_offset_x: offset X coordinate
  * @small_offset_y: offset Y coordinate
