Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 936F070681E
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 14:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbjEQM3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 08:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjEQM3t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 08:29:49 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8AB45256
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 05:29:45 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QLsqp37bDzyVk;
        Wed, 17 May 2023 15:29:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1684326582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=bdemlHwCK93xQnovEQDrKgK2Ownn54BUHi83ql6TcX0=;
        b=ajicNLoZEi5xfPDLkslGS/MWBFDupx2qC82CiBL9KKlVEcnsa32D/x0sE0hE+zTWxb+ZTu
        nuqaZYwsUA5vp7mYFFBKlf83UbgmmFOrjZoU8y8BlvyqhD8dAtiRJwyeAoBpNiZh1MGW4p
        RAGuigXfb1TZUziek4ruJ3XM28ePFwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1684326582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=bdemlHwCK93xQnovEQDrKgK2Ownn54BUHi83ql6TcX0=;
        b=llo45GoF9LsrUrOIFx3R4lTHCWPDoD1ebdY1QkI12zFApJX/JUI2aY2BDLg+bWHWu5GhHa
        VVI/aO/44dL7SGfAKoHJvZ1jQF1yg0AVlTvBFE9nbyVv+BgtTp/8B6XlS6dEjoAhS9WD8H
        RlthRuEHTyX3tctQ69frmj2mqJ4CcUw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684326582; a=rsa-sha256; cv=none;
        b=y5fUUMwbGLFzyupr7BYe0fFUL22Qpt1I6qzUUm3A4kbRttuGsT3W6zd9nOBU17WXXD6zdw
        ZCw13lWuoy6VwsgvsbeLW/K4Q0XKNZ0nN+U7xBCiLE3QtWJQ1XxafvlCQhxMvG1n6qcquu
        JB0gBIjgAgAVTqeFLmDx4d6kUkzjbnw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7AEE3634C94;
        Wed, 17 May 2023 15:29:41 +0300 (EEST)
Date:   Wed, 17 May 2023 15:29:41 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Media Submaintainers <media-submaintainers@linuxtv.org>
Subject: [GIT FIXES FOR 6.4] V4L2 fixes for 6.4
Message-ID: <ZGTItbiccvPAbhkl@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This set includes fixes for 6.4, including compile fixes.

Please pull.


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.4-2-signed

for you to fetch changes up to b82b6df4937ee625ba99ee231a3ab6ba98356ca6:

  staging: media: imx: initialize hs_settle to avoid warning (2023-05-16 16:41:05 +0300)

----------------------------------------------------------------
V4L2 fixees for 6.4

----------------------------------------------------------------
Hans Verkuil (1):
      staging: media: imx: initialize hs_settle to avoid warning

Palmer Dabbelt (2):
      media: nxp: imx8-isi: Fix unusued function warnings
      media: nxp: imx8-isi: Fix undefined config warnings

Tomi Valkeinen (1):
      media: v4l2-subdev: Fix missing kerneldoc for client_caps

Vaishnav Achath (1):
      media: v4l2-mc: Drop subdev check in v4l2_create_fwnode_links_to_pad()

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 4 ++--
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 6 +++---
 drivers/media/v4l2-core/v4l2-mc.c                   | 3 +--
 drivers/staging/media/imx/imx8mq-mipi-csi2.c        | 2 +-
 include/media/v4l2-subdev.h                         | 1 +
 5 files changed, 8 insertions(+), 8 deletions(-)

-- 
Kind regards,

Sakari Ailus
