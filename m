Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A27E4562BF
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 19:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233609AbhKRSrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 13:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhKRSrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 13:47:00 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F040AC061574
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 10:43:59 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id v19so6026660plo.7
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 10:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jQ7Q3jdQqye6b63JEwuz0UrVtVAQHNs/hH6Rmr9vUg0=;
        b=I1sIuz6yICjv30SpY++42NwDbq6Mp+Itq0b1L5QbT/QZ6KhUTpVUeR1e/S9LIfilBu
         jDcHScfysDs8Lf6SQ2lBmCRcRaCtjtaz0HH6QMMueAl9e4l/dn7BpZH6Mg+QkIWQBaYU
         T8USZP6ZHqdnKdZxIbMTMrPxXuucBrsNldIlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jQ7Q3jdQqye6b63JEwuz0UrVtVAQHNs/hH6Rmr9vUg0=;
        b=I06PZT0K6lPNadlsP5FyPkoBIwo2jnuVCFkgddj8fHoByiROSX//eHIWNfCgXFXm9P
         wYTZAwe+OH2+glb5BTNjuPiUppZouAZkj2IAug/zrxBL4Q4pF4AIe2BbNwRsbCuzmrwi
         tl9OeXWl1VX/z/ERvfKyW6PdHH5zpR5wm8vv1QRjZcBXNvdi1yGKpOCQzpyro1xXOodf
         xcuvTWFAVlajBB2rV/30LVlA3CvZeuk/ZDzAhK4ycQBDa9GfZCFk6FEOuitZL1aHWzYt
         wq67bpOaNc8tWvosLcfGSexV13MRcGSXO8aB2BbMdRFHo0UR1l+ScIubpWgthWCw3REI
         vKgg==
X-Gm-Message-State: AOAM532xhZlv+er6KO5nS+X15c2K2VK+0vWiCdij2K4ZOyICiHp7Mnwd
        rdANTzPmqe4ZqOB86kNwINuo9Q==
X-Google-Smtp-Source: ABdhPJyuwtnp7HiOnoa5XciTrb7GBk22YzrDwRh1QfSzDx+VksGMYG4VQZ850rDIHTSuSpHwB6hVvg==
X-Received: by 2002:a17:90b:4a43:: with SMTP id lb3mr13139803pjb.222.1637261039481;
        Thu, 18 Nov 2021 10:43:59 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e18sm274374pgl.50.2021.11.18.10.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:43:59 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH] media: omap3isp: Use struct_group() for memcpy() region
Date:   Thu, 18 Nov 2021 10:43:52 -0800
Message-Id: <20211118184352.1284792-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4161; h=from:subject; bh=6HM1xQAwdUhYlxd827odkUtGQFwknJXIWVVzXi/7nLw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhlp7fIy4m5wHWpoRTBmOzDmU3UD7/uFHIYWL3ROtF R72c0SGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYZae3wAKCRCJcvTf3G3AJieeEA Cz4NE52KfM3bLL/HppQJ+cM/f/j0SaJd9BmzANcOaX30GEFNG/i8N32N2ISlm/HcAPUFsJEiE1Zei5 xKHA57glXiE0xSX/9m7zvXcBc1/ScmhQMCqBQ5LOYgaY1PR+Lw2VY6oVoRtk7pJZPz9OSgBYgi973G pGYV59QNeNrdumxWv46xdlY8IAxhmmbY18cHA04PpAWNwJa8i7WSmS/ayOURCXbFN6hEX+vF5FpI16 KIwdJ2/L8K7vlkqpfLxivB6tHZ+t2p2ITDqlitYsrK6PsIGqH/2YkW0txU+f0fQqyAyogz7TJRJiA0 uyvt45KhgT2EiDQfcG700urMI3eEeht3r8xEf7DY9z4vTuxWzyQX+AGap5PvoY8c1NvrjPOzsFmTRy OobbQIDA57RvlfaePshSsNvJ8Bc3rxz3+GKJSowUiiQUT3G0LquG+vFF6ow+0i1nc4+MqRmcyFvVah /FDNSoAFRNfHZ66cPhOsEtxCA1cwHbyo3F/JOuYnBJWipy/TxPQlFXR0M7QBWeKsK4Mhsq0hptavFt NEl2pcCMtUbqYT5e13J5WB5MGvQ2+MmaBlNP47XKSUlyBJmVCTzWgHUrN87t8Y/jw2sn0WASeFsk9B vOV3VtAaNS+av255HKWgOFg7nuyZNyOkiDJcQ2gXDdYt6WVd09cOOKjgNKbw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields. Wrap the target region
in struct_group(). This additionally fixes a theoretical misalignment
of the copy (since the size of "buf" changes between 64-bit and 32-bit,
but this is likely never built for 64-bit).

FWIW, I think this code is totally broken on 64-bit (which appears to
not be a "real" build configuration): it would either always fail (with
an uninitialized data->buf_size) or would cause corruption in userspace
due to the copy_to_user() in the call path against an uninitialized
data->buf value:

omap3isp_stat_request_statistics_time32(...)
    struct omap3isp_stat_data data64;
    ...
    omap3isp_stat_request_statistics(stat, &data64);

int omap3isp_stat_request_statistics(struct ispstat *stat,
                                     struct omap3isp_stat_data *data)
    ...
    buf = isp_stat_buf_get(stat, data);

static struct ispstat_buffer *isp_stat_buf_get(struct ispstat *stat,
                                               struct omap3isp_stat_data *data)
...
    if (buf->buf_size > data->buf_size) {
            ...
            return ERR_PTR(-EINVAL);
    }
    ...
    rval = copy_to_user(data->buf,
                        buf->virt_addr,
                        buf->buf_size);

Regardless, additionally initialize data64 to be zero-filled to avoid
undefined behavior.

Fixes: 378e3f81cb56 ("media: omap3isp: support 64-bit version of omap3isp_stat_data")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/media/platform/omap3isp/ispstat.c |  5 +++--
 include/uapi/linux/omap3isp.h             | 21 +++++++++++++--------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
index 5b9b57f4d9bf..68cf68dbcace 100644
--- a/drivers/media/platform/omap3isp/ispstat.c
+++ b/drivers/media/platform/omap3isp/ispstat.c
@@ -512,7 +512,7 @@ int omap3isp_stat_request_statistics(struct ispstat *stat,
 int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
 					struct omap3isp_stat_data_time32 *data)
 {
-	struct omap3isp_stat_data data64;
+	struct omap3isp_stat_data data64 = { };
 	int ret;
 
 	ret = omap3isp_stat_request_statistics(stat, &data64);
@@ -521,7 +521,8 @@ int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
 
 	data->ts.tv_sec = data64.ts.tv_sec;
 	data->ts.tv_usec = data64.ts.tv_usec;
-	memcpy(&data->buf, &data64.buf, sizeof(*data) - sizeof(data->ts));
+	data->buf = (uintptr_t)data64.buf;
+	memcpy(&data->frame, &data64.frame, sizeof(data->frame));
 
 	return 0;
 }
diff --git a/include/uapi/linux/omap3isp.h b/include/uapi/linux/omap3isp.h
index 87b55755f4ff..9a6b3ed11455 100644
--- a/include/uapi/linux/omap3isp.h
+++ b/include/uapi/linux/omap3isp.h
@@ -162,6 +162,7 @@ struct omap3isp_h3a_aewb_config {
  * struct omap3isp_stat_data - Statistic data sent to or received from user
  * @ts: Timestamp of returned framestats.
  * @buf: Pointer to pass to user.
+ * @buf_size: Size of buffer.
  * @frame_number: Frame number of requested stats.
  * @cur_frame: Current frame number being processed.
  * @config_counter: Number of the configuration associated with the data.
@@ -176,10 +177,12 @@ struct omap3isp_stat_data {
 	struct timeval ts;
 #endif
 	void __user *buf;
-	__u32 buf_size;
-	__u16 frame_number;
-	__u16 cur_frame;
-	__u16 config_counter;
+	__struct_group(/* no type */, frame, /* no attrs */,
+		__u32 buf_size;
+		__u16 frame_number;
+		__u16 cur_frame;
+		__u16 config_counter;
+	);
 };
 
 #ifdef __KERNEL__
@@ -189,10 +192,12 @@ struct omap3isp_stat_data_time32 {
 		__s32	tv_usec;
 	} ts;
 	__u32 buf;
-	__u32 buf_size;
-	__u16 frame_number;
-	__u16 cur_frame;
-	__u16 config_counter;
+	__struct_group(/* no type */, frame, /* no attrs */,
+		__u32 buf_size;
+		__u16 frame_number;
+		__u16 cur_frame;
+		__u16 config_counter;
+	);
 };
 #endif
 
-- 
2.30.2

