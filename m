Return-Path: <linux-media+bounces-4595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5186846AB1
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 09:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 867B5B281A8
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 08:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A48C17C76;
	Fri,  2 Feb 2024 08:25:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D741862B
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706862347; cv=none; b=Ne5VtUKP8fWzLvtg1sWNBfA4K6ab/gBH5UcGrpaHQ2XG0mz1CdHvpH6xdCGXOZWTWhmxm++pREVKPv0uEa9qknpEGH36NKUBP5K7+1ZwQOOlhOrqxa26Yi+rF9yHasHl8fEN9k4CIAg8oNgM3xmj87BscZ/7AYABMzMQWoVZeRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706862347; c=relaxed/simple;
	bh=S4LfRuVAQ86LzrtGQSczpZF7XgYPhSNhyPKBw2UF4DQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qNbmldtSCEkRiRB0/C8inxgv1JVzm123e94nMatTGbzze1ylko7JfzkCcAUeHfwJyrIHQ9ms7LInA7wk+hk9ad+7/aAa1RgEWnIvwlK7xd48Xqr//rDDAG8CjvvJX4gOALud0PzX7Yhi3YdTtVuRtUOnuj/REmEaFucmPjWEKOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDB3C433F1;
	Fri,  2 Feb 2024 08:25:46 +0000 (UTC)
Message-ID: <d38e25c0-a508-46d9-97cd-a50d31483c82@xs4all.nl>
Date: Fri, 2 Feb 2024 09:25:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2-common.h: kerneldoc: correctly format return
 values
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Building the kerneldoc resulted in two errors:

Documentation/media/driver-api/v4l2-common:6: ./include/media/v4l2-common.h:566: ERROR: Unexpected indentation.
Documentation/media/driver-api/v4l2-common:6: ./include/media/v4l2-common.h:567: WARNING: Block quote ends without a blank line; unexpected unindent.

Format v4l2_link_freq_to_bitmap according to the kerneldoc standard.
The v4l2_fill_pixfmt_mp function also had incorrect return value formatting,
although that didn't report an error/warning, but it looked ugly in the
generated documentation. So fix that one as well.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: a68e88e2cf9e ("media: v4l: Add a helper for setting up link-frequencies control")
---
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index cd2163f24f8a..ffed604bc29a 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -536,9 +536,10 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
  * V4L2_CID_LINK_FREQ control implemented by the transmitter, or value
  * calculated based on the V4L2_CID_PIXEL_RATE implemented by the transmitter.
  *
- * Returns link frequency on success, otherwise a negative error code:
- *	-ENOENT: Link frequency or pixel rate control not found
- *	-EINVAL: Invalid link frequency value
+ * Return:
+ * * >0: Link frequency
+ * * %-ENOENT: Link frequency or pixel rate control not found
+ * * %-EINVAL: Invalid link frequency value
  */
 s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 		       unsigned int div);
@@ -560,11 +561,11 @@ u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator);
  * system firmware and sets the corresponding bits in @bitmap (after first
  * zeroing it).
  *
- * Return values:
- *	0: Success
- *	-ENOENT: No match found between driver-supported link frequencies and
- *		 those available in firmware.
- *	-ENODATA: No link frequencies were specified in firmware.
+ * Return:
+ * * %0: Success
+ * * %-ENOENT: No match found between driver-supported link frequencies and
+ *   those available in firmware.
+ * * %-ENODATA: No link frequencies were specified in firmware.
  */
 int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 			     unsigned int num_of_fw_link_freqs,

