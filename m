Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6A1AA390
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 14:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389474AbfIEMyr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 08:54:47 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6685 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389065AbfIEMyr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 08:54:47 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 682E3CF7E511B6EE1AA3;
        Thu,  5 Sep 2019 20:54:43 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Sep 2019 20:54:34 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <davem@davemloft.net>, <mareklindner@neomailbox.ch>,
        <mchehab@kernel.org>, <leon@kernel.org>
CC:     <dledford@redhat.com>, <sakari.ailus@linux.intel.com>,
        <a@unstable.cc>, <sw@simonwunderlich.de>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <zhongjiang@huawei.com>
Subject: [PATCH 0/3] replace code with FIELD_SIZEOF
Date:   Thu, 5 Sep 2019 20:51:33 +0800
Message-ID: <1567687896-19996-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

FIELD_SIZEOF() has implemented sizeof().  Hence use FIELD_SIZEOF
directly.

zhong jiang (3):
  batman-adv: Use FIELD_SIZEOF directly
  media: v4l2: Use FIELD_SIZEOF directly
  IB/mlx5: Use FIELD_SIZEOF directly

 drivers/infiniband/hw/mlx5/mlx5_ib.h   | 2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c   | 2 +-
 net/batman-adv/distributed-arp-table.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.12.4

