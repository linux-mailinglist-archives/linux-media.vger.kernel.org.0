Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 886A67068CA
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 14:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbjEQM7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 08:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbjEQM7p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 08:59:45 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9BA5595
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 05:59:40 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QLtVM0VyQzyWs;
        Wed, 17 May 2023 15:59:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1684328379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=4BVXROiqDxwJB+ROp37yBdlBPBulgaDbE2Syx6FvEA0=;
        b=FJf5RD0hJ1eNV2/iuIrGs4lqophP6TFJf2UUMN7x4BUAtalvRZlY3fr/vaWJUqW4XcJyg6
        dy7HTXAa78XPmLBYzx/ZXsDxS+dvO+OmQPLOGsPC2zIWFDKlnicLhotHpbCFU2I92VqqAq
        KccUyIjyeCGYdzrZSEadGs9jAI8ZI8o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1684328379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=4BVXROiqDxwJB+ROp37yBdlBPBulgaDbE2Syx6FvEA0=;
        b=CvG2dW5ln9adMDijapWKlY4YioMJP8QBNc1JVRbip8grNcW1l7+f5JpkYm2WUrCEJMW1hR
        cl0WuhJpxc1bA+zatYTCDxiHG+DR7UpBPItx1QKz3Uxw7DQqKLBBU1A1x9lW7dgqA7Kgdb
        V0E4xcY/1ZSkMflu7Bieft5uQVUyibY=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684328379; a=rsa-sha256; cv=none;
        b=FJHOVoKiV3RZoOfrYtYmgs2rXm61rN08ZEb9uZ20rqbz8+jQuU4NzjQvXf/+xU2hGg8b41
        umi2ROH9yGPH/1vboV5YHCbum68359RwX1Ug4NvW3nQhgaBRV/Ka+P7p6UfomdhrqWCWYd
        pkvYDVwEovlKhpbiQniGd691Bmt2al4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AB170634C94;
        Wed, 17 May 2023 15:59:38 +0300 (EEST)
Date:   Wed, 17 May 2023 15:59:38 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Media Submaintainers <media-submaintainers@linuxtv.org>
Subject: [GIT FIXES FOR 6.4 v2] V4L2 fixes for 6.4
Message-ID: <ZGTPurnmJ4KQfjrr@valkosipuli.retiisi.eu>
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

This set includes fixes for 6.4.

Please pull.


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.4-2.1-signed

for you to fetch changes up to a9b5a8a05f0143a48c7bf1d06e9f62bf5e0fdde0:

  staging: media: imx: initialize hs_settle to avoid warning (2023-05-17 15:57:07 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.4

----------------------------------------------------------------
Hans Verkuil (1):
      staging: media: imx: initialize hs_settle to avoid warning

Tomi Valkeinen (1):
      media: v4l2-subdev: Fix missing kerneldoc for client_caps

Vaishnav Achath (1):
      media: v4l2-mc: Drop subdev check in v4l2_create_fwnode_links_to_pad()

 drivers/media/v4l2-core/v4l2-mc.c            | 3 +--
 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 2 +-
 include/media/v4l2-subdev.h                  | 1 +
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
Kind regards,

Sakari Ailus
