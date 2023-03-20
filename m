Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D905A6C21EB
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 20:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjCTTvC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 15:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjCTTvB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 15:51:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0672FDBEA
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 12:50:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFCC92CF;
        Mon, 20 Mar 2023 20:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679341851;
        bh=TDFJZ87xVvTuXdFdGuiu0+hNFegIxwBg95oeL38phA4=;
        h=From:To:Cc:Subject:Date:From;
        b=WCSde1OdV7Q1rsRQSvQP8LJOfbmj3aKicNQ9vebWDflHgcv2gLft/Js8lj17uZmf9
         h5cmQkoPCWFTcmeiihJBNUdRpcjgq7wJKTYwGrM6wa72fIoRSG0dcr+ppcVwW/avLl
         VQ+mwTas45oMIenadiaa0De5wQ90BF6fR8002Ugk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gregor Jasny <gjasny@googlemail.com>
Subject: [PATCH] meson: Fix install location of doxygen's man pages
Date:   Mon, 20 Mar 2023 21:50:57 +0200
Message-Id: <20230320195057.16195-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The doxygen man pages are incorrectly being installed alongside the HTML
documentation. Install them in the right location, in the $mandir
directory, by specifying a separate install location for each doxygen
target.

As a drive-by cleanup, replace the join_path() function with the meson's
'/' path concatenation operator.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 doc/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/doc/meson.build b/doc/meson.build
index fef3e83fa432..02a30dc5688a 100644
--- a/doc/meson.build
+++ b/doc/meson.build
@@ -15,15 +15,16 @@ doxyfile = configure_file(input : 'Doxyfile.in',
                           output : 'Doxyfile',
                           configuration : cdata)
 
-doxygen_install_dir = join_paths(get_option('datadir'), 'doc',
-                                 '@0@'.format(meson.project_name()))
+doxygen_install_dirs = []
 
 doxygen_output = []
 if get_option('doxygen-html')
     doxygen_output += 'html'
+    doxygen_install_dirs += get_option('datadir') / 'doc' / '@0@'.format(meson.project_name())
 endif
 if get_option('doxygen-man')
     doxygen_output += 'man'
+    doxygen_install_dirs += get_option('mandir') / '..'
 endif
 
 custom_target('doxygen',
@@ -31,4 +32,4 @@ custom_target('doxygen',
               output : doxygen_output,
               command : [prog_doxygen, doxyfile],
               install : true,
-              install_dir : doxygen_install_dir)
+              install_dir : doxygen_install_dirs)

base-commit: cdb3d1a7309d2daed5626c8c4ddbe9e5498e938b
-- 
Regards,

Laurent Pinchart

