Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D615A40A8
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiH2Bdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiH2Bdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:33:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3FC2F01E
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:33:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF703AF4;
        Mon, 29 Aug 2022 03:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736822;
        bh=Ge/5l5b7nTUYmH6o+Bz6/9CVby345YN7cl0EaXQP+xs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m2LeeNXSh8PUMjgWxOBjh9YThSm3maCZVoY7HXtMKD7FBA77XP0MbmoGwUHzW0S6T
         YNmp9OUwH3/sWptNZ+JxbbGmBMKw/5KZTKWZklFWf/R9YcILizyLPU1m8i6QUljUeU
         PMK7rVzW8NvpFqA4WjAvZ8dMkHJn0gGRW+7DsABo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
Subject: [PATCH v6 04/13] [FIXUP] meson: Avoid double-quoting strings
Date:   Mon, 29 Aug 2022 04:33:18 +0300
Message-Id: <20220829013327.5791-5-laurent.pinchart@ideasonboard.com>
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

The GIT_SHA, GIT_COMMIT_CNT and GIT_COMMIT_DATE macros from the
generated config.h file are wrapped with STRING() in source code. Don't
use set_quoted() in meson.build in order to avoid double-quoting them.

After switching to meson, set_quoted() would be better, with the
STRING() macro removed from the sources.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index bad3ce0015f9..aec69a9bc3f6 100644
--- a/meson.build
+++ b/meson.build
@@ -298,14 +298,14 @@ add_project_link_arguments(cpp_arguments, language : 'cpp')
 
 git_sha = run_command(prog_git, '-C', meson.project_source_root(), 'rev-parse', '--short=12', 'HEAD',
                       check : true).stdout().strip()
-conf.set_quoted('GIT_SHA', git_sha)
+conf.set('GIT_SHA', git_sha)
 git_commit_cnt = run_command(prog_git, '-C', meson.project_source_root(), 'rev-list', '--count', 'HEAD',
                              check : true).stdout().strip()
-conf.set_quoted('GIT_COMMIT_CNT', '-' + git_commit_cnt)
+conf.set('GIT_COMMIT_CNT', '-' + git_commit_cnt)
 git_commit_date = run_command(prog_git, '-C', meson.project_source_root(), 'show', '--quiet',
                               '--date=format-local:%F %T', '--format=%cd',
                               env : ['TZ=UTC'], check : true).stdout().strip()
-conf.set_quoted('GIT_COMMIT_DATE', git_commit_date)
+conf.set('GIT_COMMIT_DATE', git_commit_date)
 
 man_pages = []
 
-- 
Regards,

Laurent Pinchart

