Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC00F4C1201
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 12:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237222AbiBWL4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 06:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239999AbiBWL4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 06:56:51 -0500
X-Greylist: delayed 7630 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 23 Feb 2022 03:56:23 PST
Received: from hillosipuli.retiisi.eu (retiisi.eu [95.216.213.190])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E861899EE3
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 03:56:23 -0800 (PST)
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 189F2634C90;
        Wed, 23 Feb 2022 13:56:21 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 0/2] Cleanup scrap in v4l2_fwnode_reference_parse()
Date:   Wed, 23 Feb 2022 13:54:32 +0200
Message-Id: <20220223115434.21316-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This set removes a redundant return value check and an extra loop in
v4l2_fwnode_reference_parse().

Since v1:

- Split the patch in two, prepending the patch with another that just
  removes -ENODATA check.

- Fix return value of v4l2_fwnode_reference_parse() that was
  unintentionally changed in the process.

Sakari Ailus (2):
  v4l: fwnode: Drop redunant -ENODATA check in property reference
    parsing
  v4l: fwnode: Remove now-redundant loop from
    v4l2_fwnode_parse_reference()

 drivers/media/v4l2-core/v4l2-fwnode.c | 28 ++++++++-------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

-- 
2.30.2

