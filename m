Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E6F288C37
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389199AbgJIPH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:07:59 -0400
Received: from retiisi.eu ([95.216.213.190]:51570 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388736AbgJIPH6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 11:07:58 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 2EE2F634C87;
        Fri,  9 Oct 2020 18:07:05 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tsuchiya Yuto <kitakar@gmail.com>, bingbu.cao@intel.com,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/5] ipu3-cio2 format fixes
Date:   Fri,  9 Oct 2020 18:07:51 +0300
Message-Id: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
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

since v1:

- Validate try format, too

- Set field in subdev format to V4L2_FIELD_NONE

- Add a comment explaining the lock

- Make values that should be unsigned, unsigned

Sakari Ailus (5):
  ipu3-cio2: Return actual subdev format
  ipu3-cio2: Serialise access to pad format
  ipu3-cio2: Use unsigned values where appropriate
  ipu3-cio2: Validate mbus format in setting subdev format
  ipu3-cio2: Make the field on subdev format V4L2_FIELD_NONE

 drivers/media/pci/intel/ipu3/ipu3-cio2.c |  60 +++++----
 drivers/media/pci/intel/ipu3/ipu3-cio2.h | 157 ++++++++++++-----------
 2 files changed, 111 insertions(+), 106 deletions(-)

-- 
2.27.0

