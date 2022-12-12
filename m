Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D1864A078
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 14:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbiLLNZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 08:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbiLLNZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 08:25:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70AC813E3D
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 05:25:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 463896CF;
        Mon, 12 Dec 2022 14:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670851508;
        bh=LoIlIkcFC6SsobDgsJn6mbdv6c40c0Gs+NQdx8sI8w8=;
        h=From:To:Cc:Subject:Date:From;
        b=qrQPJeUUvmiXdxET2Ozz7tHsoOc+3+6yKcqrDHtq8I/OD32HKhkl2RG7t/A6MmoV4
         kc86yxGRru8+M+27WhVwRwseyUDj7Kcq4e+5AsNG594PeDsaQWI9/06qeUAJ8rhxsR
         /cTcHKAzmwsrbsOicwDwdyV+UhrVZyVCBFKN14GU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 0/2] media: Minor fixes for media pipeline start rework
Date:   Mon, 12 Dec 2022 15:25:03 +0200
Message-Id: <20221212132505.9251-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
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

Hello,

The media pipeline start rework changes merged in v6.1 have introduced a
few minor issues in comments, documentation and code. These two patches
fix them.

Laurent Pinchart (2):
  media: mc: Get media_device directly from pad
  media: mc: entity: Fix minor issues in comments and documentation

 Documentation/driver-api/media/mc-core.rst | 10 ++++------
 drivers/media/mc/mc-entity.c               | 14 +++++++-------
 2 files changed, 11 insertions(+), 13 deletions(-)


base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
-- 
Regards,

Laurent Pinchart

