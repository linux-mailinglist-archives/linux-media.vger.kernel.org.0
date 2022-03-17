Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E95974DC8D7
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 15:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbiCQOij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 10:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbiCQOij (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 10:38:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC3C1D66CD
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 07:37:22 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D699EE;
        Thu, 17 Mar 2022 15:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647527840;
        bh=6OmTs4fi7pYxB9o7HmYzTlXz4JwylV3dQCo/5RwxATk=;
        h=From:To:Cc:Subject:Date:From;
        b=gw6kE71mJURTpMv7nS2acsOUyyCU+5C/SrBOocJeXOUpebHiKH4lEeVgje0dLm2jE
         S5e6ed067X/a6rkJMPoGkRZh6GSvtzl8JF6VIJVIliWJUcOLDpbz/yadL8H5V4fY4l
         zzsrZNV2CdwdOcrI8j7AIDAMUZP3f3jRReJ+RGtY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 0/2] 
Date:   Thu, 17 Mar 2022 16:36:58 +0200
Message-Id: <20220317143700.12769-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series simplifies colorspace handling for drivers by
sanitizing values in the V4L2 core.

Patch 1/2 improves the colorspace validity checks in existing helper
functions, to make them more future-proof. It's not a hard dependency
for the next patch, and could be dropped if desired.

Patch 2/2 then extends the v4l_sanitize_format() function to also
sanitize colorspace fields.

Laurent Pinchart (2):
  media: v4l2: Make colorspace validity checks more future-proof
  media: v4l2: Sanitize colorspace values in the framework

 drivers/media/v4l2-core/v4l2-ioctl.c | 65 +++++++++++++++++++++++-----
 include/media/v4l2-common.h          | 10 ++---
 include/uapi/linux/videodev2.h       | 29 +++++++++++++
 3 files changed, 89 insertions(+), 15 deletions(-)

-- 
Regards,

Laurent Pinchart

