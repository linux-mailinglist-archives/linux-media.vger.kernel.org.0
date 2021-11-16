Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B060F4530BD
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235378AbhKPLdC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:33:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:35186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234997AbhKPLcZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 905D061B64;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=3ihkMj4VM+MYVYnPn/P4IMFMw1DhL0cYHWdvWlG+yDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=scqufeID1VDjXIpeQ0fhTPVHIK2lfzevjWNigySf/q4nBoL9RZUIEC5KNv3R67PLL
         06YgzJkvyxpdZwqh9SE9TjBnZwLh/yyROHpPOPL8EJoGSfCxzfslsP1KAZ91W6tL7W
         gugE/Q3WudgZbMDUklGN+WFZMxLdSzblFP8nZzxqqMSspEOeIWMx95u8X1w4xHmVnH
         7jF4aBA9Wm0UjLBtiEg26Mz57W/xYiN0CNWcPZCKYush/bUIIJWPhJiaDsJOT8nAC9
         nvkgP1DwiEeY+f2QR1Tv7ghG2WUMf1FfGfGsu7khTTTT7lXN90HHJdfz9yah1OvUfB
         6YyPie+p45g7A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qfp-Jx; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 15/23] media: atomisp: get rid of ia_css_stream_load()
Date:   Tue, 16 Nov 2021 11:28:56 +0000
Message-Id: <795397c297d392dc54b8ef9e1a7d2c4eaf145d02.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function is marked as obsolete and nobody calls it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/ia_css_stream_public.h  |  9 ----
 drivers/staging/media/atomisp/pci/sh_css.c    | 52 -------------------
 2 files changed, 61 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
index 83846e417ae5..649f22b03de8 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
@@ -202,15 +202,6 @@ int
 ia_css_stream_get_info(const struct ia_css_stream *stream,
 		       struct ia_css_stream_info *stream_info);
 
-/* @brief load (rebuild) a stream that was unloaded.
- * @param[in]	stream The stream
- * @return		0 or the error code
- *
- * Rebuild a stream, including allocating structs, setting configuration and
- * building the required pipes.
- */
-int
-ia_css_stream_load(struct ia_css_stream *stream);
 
 /* @brief Starts the stream.
  * @param[in]	stream The stream.
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6f1dca0788b4..c73ef67959c9 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -9546,58 +9546,6 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
 	return 0;
 }
 
-/*
- * Rebuild a stream, including allocating structs, setting configuration and
- * building the required pipes.
- * The data is taken from the css_save struct updated upon stream creation.
- * The stream handle is used to identify the correct entry in the css_save struct
- */
-int
-ia_css_stream_load(struct ia_css_stream *stream)
-{
-	int i, j, err;
-
-	if (IS_ISP2401) {
-		/* TODO remove function - DEPRECATED */
-		(void)stream;
-		return -ENOTSUPP;
-	}
-
-	assert(stream);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() enter,\n");
-	for (i = 0; i < MAX_ACTIVE_STREAMS; i++) {
-		if (my_css_save.stream_seeds[i].stream != stream)
-			continue;
-
-		for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++) {
-			int k;
-
-			err = ia_css_pipe_create(&my_css_save.stream_seeds[i].pipe_config[j],
-						 &my_css_save.stream_seeds[i].pipes[j]);
-			if (!err)
-				continue;
-
-			for (k = 0; k < j; k++)
-				ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[k]);
-			return err;
-		}
-		err = ia_css_stream_create(&my_css_save.stream_seeds[i].stream_config,
-					   my_css_save.stream_seeds[i].num_pipes,
-					   my_css_save.stream_seeds[i].pipes,
-					   &my_css_save.stream_seeds[i].stream);
-		if (!err)
-			break;
-
-		ia_css_stream_destroy(stream);
-		for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)
-			ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);
-		return err;
-	}
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
-	return 0;
-}
-
 int
 ia_css_stream_start(struct ia_css_stream *stream)
 {
-- 
2.33.1

