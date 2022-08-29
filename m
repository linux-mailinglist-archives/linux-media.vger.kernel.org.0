Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C495A40A9
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiH2Bds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiH2Bdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:33:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3043E2E6AE
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:33:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AA79BB0;
        Mon, 29 Aug 2022 03:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736823;
        bh=BKQrnvSaIm22fqbH6BoDmzXa97TNtA/zhcXMdWC1ZtE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SdA6g0r7WoEQDiQPE06xRV8IDwpgnEm+S5jYq1XSG7FSE9AHXnbhfbwojccY2DZjc
         M6WpOv/jnpkVTQIGLmuLnH3e5wlT5YDpZE0aQkef6Be6nRR6+7vowcqB3memKUnH3N
         m1gZdtxKG217HZgtU1khc506YRAjlqoG9qJk7v5Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
Subject: [PATCH v6 05/13] [FIXUP] meson: Use external_program object directly without calling path()
Date:   Mon, 29 Aug 2022 04:33:19 +0300
Message-Id: <20220829013327.5791-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220829013327.5791-1-laurent.pinchart@ideasonboard.com>
References: <20220829013327.5791-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to call path() on an external_program object, it can be
passed directly to functions instead. Do so.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/keytable/bpf_protocols/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/keytable/bpf_protocols/meson.build b/utils/keytable/bpf_protocols/meson.build
index b079df8e961f..2562d30d2366 100644
--- a/utils/keytable/bpf_protocols/meson.build
+++ b/utils/keytable/bpf_protocols/meson.build
@@ -21,7 +21,7 @@ foreach file : bpf_protocols_files
                   output : output,
                   input : input,
                   command : [
-                      prog_clang.full_path(),
+                      prog_clang,
                       clang_sys_includes.stdout().split(),
                       '-D__linux__', '-target', 'bpf', '-O2',
                       '-c', '@INPUT@', '-o', '@OUTPUT@',
-- 
Regards,

Laurent Pinchart

