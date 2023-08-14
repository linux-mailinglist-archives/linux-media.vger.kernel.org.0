Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 799ED77C0DC
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 21:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbjHNTfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 15:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232216AbjHNTeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 15:34:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78454ED
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 12:34:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 089926BE;
        Mon, 14 Aug 2023 21:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692041597;
        bh=d7Pek5AOajtJn9xdd5ViRbYPqq0U+b4iVwOOSX9mP+4=;
        h=From:To:Cc:Subject:Date:From;
        b=kZL6mp43hGvez2Ier//Y5RSYGeeqwEpij15MA7yT26XdP8U9vod/jgAar/5FYdon4
         QbA1xHJUwJNu9ik0zzy/KrL6wACcLSWC0utApfig2vvOcsUprBQHo/Piwn0T2di9Lf
         evM0ob35G8diqB9mvtkoD52i06ztZpzRlaVPNVJY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v1 0/2] media: i2c: imx219: Miscellaneous fixes
Date:   Mon, 14 Aug 2023 22:34:33 +0300
Message-ID: <20230814193435.24158-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small series fixes two issues introduced by the "[PATCH v2 0/7]
media: i2c: imx219: Use subdev active state" series, merged in the stage
tree and scheduled for upstream merge in v6.6. Please see individual
patches for details.

Laurent Pinchart (2):
  media: i2c: imx219: Fix a typo referring to a wrong variable
  media: i2c: imx219: Fix crop rectangle setting when changing format

 drivers/media/i2c/imx219.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)


base-commit: a5f4ec0a9e69c1d2cafd55dd9810c69d9d269b8e
-- 
Regards,

Laurent Pinchart

