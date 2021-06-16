Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA203AA3A8
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 20:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhFPTBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 15:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbhFPTBs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 15:01:48 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727C3C06175F
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 11:59:42 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id s17-20020a17090a8811b029016e89654f93so4578029pjn.1
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 11:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Os+MCmeoTC6JTgDL5U7Se6Y1Owhx1D5nB8TA3sfO0A=;
        b=PMHKY+racXbZwjt8VBIGr7U8kMdBVXLY6G4EFPdDJKwIidRT9b6yETnFVjeDb7E5O/
         TtUhPZ1an4c2E0bGKAGNBtgapJu6+++WrtL6J1KzCAD4Br/4UaKort4/w5MNMp8QQ0YG
         GFUAQ2i768btCuvIyKny70Q0KHIKoxeeuOdcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Os+MCmeoTC6JTgDL5U7Se6Y1Owhx1D5nB8TA3sfO0A=;
        b=jqQVO0fwOx5Eu1ML8wArZ4OnHnUs3oW4h4hZi5zThlnfdh+YhuC5eycMRZQd/DhYkQ
         3E79u44dMNcOux1faBEg1UVfMwlBA6hQC5xGLgVd+xHbNFuAMo3XaN/IsYhVhUG8cgzQ
         YFczmmAGiKqFxdKKoE5UccGhwTWX/oPQ637MCkEC3zPbR2O3UjUviyT3Ck+aVbjNUJL0
         WUtwWAWaSV0rfTE3noRcWPgKSoAf4a2DtgldODYIdcLdoPtUHkntCEPLaI08K6vfi8Uw
         iYOgIQeCGavPBD7OwfQkIQH0Q6n1aX1piayttyExPglp+fBU995SvH3QKMsNFD5GZWMp
         bXkw==
X-Gm-Message-State: AOAM532l8lCGm/no/gQGo8DnxldMucROwhBpmVJpei35mgfdXNFTvbUC
        e50yz7m4p+4+DAwnEtyJEazyZQ==
X-Google-Smtp-Source: ABdhPJwmECO30Z/38e9jlyzsxxZVC0/UVuE8SucOrFpRiR5yQtebrZNUfxc0IJy+483gdlwwb8F7lQ==
X-Received: by 2002:a17:90a:df13:: with SMTP id gp19mr1288730pjb.11.1623869981776;
        Wed, 16 Jun 2021 11:59:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b18sm2831829pfb.131.2021.06.16.11.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 11:59:41 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: omap3isp: Extract struct group for memcpy() region
Date:   Wed, 16 Jun 2021 11:59:38 -0700
Message-Id: <20210616185938.1225218-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=910ed8959b76f13dd879af35818c96acb0e3b882; i=ZZImBpmvoNoFnzG2oXXjjeAWeziu9KmJxVF7qJ1oTSM=; m=d9AzytSqyDqMH7aQlTbCNKT7yao+v2IBcpVUdy3sz2A=; p=RkrWXBiNXbxKMFNfgHmuMepip9a6kkWMRqHj0Y8cJkY=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDKShkACgkQiXL039xtwCbw2A//VK3 l4G1F97xEfJuIb581uFJle571JO82dkVJPpzb+cKPJakYr8mHCdim3lXI9ehrb7LzRz7bnDvo1GfX 2xcNltTikKk7MeqDk9CQOSCNhCJ32qUorsyasdHXm03wewlltm6k8KQEi/crZepC1MDzsCOXRyUvh szWiCXigNOwf4c9cBACLMk9efLWZTYnmx8+rIfDWlsunCVxfBM8/VJ0bi8gCKB6TW8miR/aoEjv+H SFAeSwjKMpeaoKrkpI9sLgJgcqrn5F3uYcLpRCFOK4JG4mote5x104Mu7cOp99lfKDzsPnCkbxvXJ XJb5+doaIxlZ00qPsPYPFgVZwpilobdSyVait/8n6BV3x1umYkEq6BwVv9LoouCDu2QVbZfcO8udq md/XGPEIbfXbGGYCAVEBEAD6YQPaUeSDjr+ToaKoFoiYRMnP845WGx99vk3a9IEHFVI2YJRDpigaQ h29lRUIedpT/A1VdktoMLWYHGWfxYvGeC8+pXCYmhNtMm5FK0Y9FZMWOWlbq1YLub2kB3h7xOOJMS niYLcm5QA1iSjKnbzRkrps3aNP1X+ilOFjTHI7kRUjmvcnsVuQZpO5tBfKpCXeQwEWvEThLEGKbUv e9luzWFxN6fF1A7XEBOJNQiqf6xyk9CaQr3Ad9g3vu4PfnTMvr3bRz02IMOovOEQ=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid writing past the end of a structure member by wrapping the target
region in a common named structure. This additionally fixes a
misalignment of the copy (since the size of "buf" changes between 64-bit
and 32-bit).

I actually think this code is completely unused in the real world:
I don't think it could have ever worked, as it would either always
fail (with an uninitialized data->buf_size) or would cause corruption
in userspace due to the copy_to_user() in the call path against an
uninitialized data->buf value:

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
 drivers/media/platform/omap3isp/ispstat.c |  5 +--
 include/uapi/linux/omap3isp.h             | 44 +++++++++++++++++------
 2 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
index 5b9b57f4d9bf..ea8222fed38e 100644
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
+	memcpy(&data->frame, &data64.buf, sizeof(data->frame));
 
 	return 0;
 }
diff --git a/include/uapi/linux/omap3isp.h b/include/uapi/linux/omap3isp.h
index 87b55755f4ff..0a16af91621f 100644
--- a/include/uapi/linux/omap3isp.h
+++ b/include/uapi/linux/omap3isp.h
@@ -159,13 +159,25 @@ struct omap3isp_h3a_aewb_config {
 };
 
 /**
- * struct omap3isp_stat_data - Statistic data sent to or received from user
- * @ts: Timestamp of returned framestats.
- * @buf: Pointer to pass to user.
+ * struct omap3isp_stat_frame - Statistic data without timestamp nor pointer.
+ * @buf_size: Size of buffer.
  * @frame_number: Frame number of requested stats.
  * @cur_frame: Current frame number being processed.
  * @config_counter: Number of the configuration associated with the data.
  */
+struct omap3isp_stat_frame {
+	__u32 buf_size;
+	__u16 frame_number;
+	__u16 cur_frame;
+	__u16 config_counter;
+};
+
+/**
+ * struct omap3isp_stat_data - Statistic data sent to or received from user
+ * @ts: Timestamp of returned framestats.
+ * @buf: Pointer to pass to user.
+ * @frame: Statistic data for frame.
+ */
 struct omap3isp_stat_data {
 #ifdef __KERNEL__
 	struct {
@@ -176,10 +188,15 @@ struct omap3isp_stat_data {
 	struct timeval ts;
 #endif
 	void __user *buf;
-	__u32 buf_size;
-	__u16 frame_number;
-	__u16 cur_frame;
-	__u16 config_counter;
+	union {
+		struct {
+			__u32 buf_size;
+			__u16 frame_number;
+			__u16 cur_frame;
+			__u16 config_counter;
+		};
+		struct omap3isp_stat_frame frame;
+	};
 };
 
 #ifdef __KERNEL__
@@ -189,10 +206,15 @@ struct omap3isp_stat_data_time32 {
 		__s32	tv_usec;
 	} ts;
 	__u32 buf;
-	__u32 buf_size;
-	__u16 frame_number;
-	__u16 cur_frame;
-	__u16 config_counter;
+	union {
+		struct {
+			__u32 buf_size;
+			__u16 frame_number;
+			__u16 cur_frame;
+			__u16 config_counter;
+		};
+		struct omap3isp_stat_frame frame;
+	};
 };
 #endif
 
-- 
2.25.1

