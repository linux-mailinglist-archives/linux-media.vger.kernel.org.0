Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898AF287D68
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 22:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730686AbgJHUrw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 16:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730675AbgJHUrw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 16:47:52 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8E5C0613D2
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 13:47:52 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B7931634C87;
        Thu,  8 Oct 2020 23:46:59 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tsuchiya Yuto <kitakar@gmail.com>, bingbu.cao@intel.com,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 0/3] ipu3-cio2 format fixes
Date:   Thu,  8 Oct 2020 23:47:44 +0300
Message-Id: <20201008204747.26320-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all,

This set addresses most notable subdev format related issues, namely the
sub-device sink format being unaccessible. The result of accessing it
varied from oopses to crashes.

Sakari Ailus (3):
  ipu3-cio2: Return actual subdev format
  ipu3-cio2: Serialise access to pad format
  ipu3-cio2: Only allow setting valid mbus codes

 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 42 ++++++++++++------------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h |  1 +
 2 files changed, 22 insertions(+), 21 deletions(-)

-- 
2.27.0

