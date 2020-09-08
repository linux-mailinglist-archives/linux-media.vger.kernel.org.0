Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5C3260E21
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 10:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgIHIyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 04:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728948AbgIHIyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 04:54:53 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C6DC061573
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 01:54:51 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 83378634C8C;
        Tue,  8 Sep 2020 11:54:38 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, jacopo@jmondi.org
Subject: [PATCH 0/3] Improve V4L2 fwnode framework usability and documentation
Date:   Tue,  8 Sep 2020 11:51:18 +0300
Message-Id: <20200908085121.864-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This set makes it possible to set defaults for multiple bus types on a
single call by using a little bit more memory. The documentation is also
improved to allow getting the bus type from DT when bindings allow that.

Sakari Ailus (3):
  v4l2-fwnode: Make number of data lanes a character
  v4l2-fwnode: Make bus configuration a struct
  v4l2-fwnode: Document changes usage patterns of
    v4l2_fwnode_endpoint_parse

 include/media/v4l2-fwnode.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

-- 
2.27.0

