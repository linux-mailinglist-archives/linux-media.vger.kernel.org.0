Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD70B5A40AB
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiH2Bdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiH2Bdr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:33:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051552F01E
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:33:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8647EE24;
        Mon, 29 Aug 2022 03:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736824;
        bh=Ab8eh9VGwH4DIVcHG7H6E1pdd735RfmO6VPT9g69N24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rxK1BVkEaGl7cjVDy8qEQL9/EJdkBSexf0nMf7NcfVafNNjQnOpqKcP7P8aKCYNIq
         dhOupuvz47mi6JfqD9H3bnqJb2J9UgloGTN/Fke8S/giUQtB/tKxJykTQTeLKvKDMf
         FmGr5WIdeT3K+gcxuRlbw/IJWH5GE8nupBhbjtdQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
Subject: [PATCH v6 06/13] [FIXUP] meson: Specify check kwarg to run_command()
Date:   Mon, 29 Aug 2022 04:33:20 +0300
Message-Id: <20220829013327.5791-7-laurent.pinchart@ideasonboard.com>
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

The default value of the check positional argument to run_command() will
change from false to true in a future meson version. Set it to false
explicitly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index aec69a9bc3f6..50fad53c6f26 100644
--- a/meson.build
+++ b/meson.build
@@ -240,7 +240,8 @@ endif
 # override will restrict udevd to bpf syscall only and will stop the system
 # from booting. This is also true on current debian versions.
 have_udevdsyscallfilter = run_command(prog_grep, '-s', 'SystemCallFilter',
-                                      systemd_systemdir / 'systemd-udevd.service').returncode() == 0
+                                      systemd_systemdir / 'systemd-udevd.service',
+                                      check : false).returncode() == 0
 
 dep_libudev = dependency('libudev', required : get_option('libdvbv5').enabled())
 if dep_libudev.found()
-- 
Regards,

Laurent Pinchart

