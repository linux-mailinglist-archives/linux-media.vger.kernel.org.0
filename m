Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DF32CC4FC
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387737AbgLBSYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730931AbgLBSYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 13:24:38 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB101C0613D6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 10:22:56 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B3D94634C24;
        Wed,  2 Dec 2020 20:21:44 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     martinax.krasteva@linux.intel.com
Subject: [PATCH 0/2] Subdev link validation and format documentation improvements
Date:   Wed,  2 Dec 2020 20:19:53 +0200
Message-Id: <20201202181955.18165-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I wrote these small patches to improve the documentation regarding
requirements for subdev drivers to implement format related ops as well as
the link_validate op.

Sakari Ailus (2):
  Documentation: v4l: Remove reference to video ops
  Documentation: v4l: Document that link_validate op is valid for sink
    only

 Documentation/driver-api/media/v4l2-subdev.rst | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

-- 
2.27.0

