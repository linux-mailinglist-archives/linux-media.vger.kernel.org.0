Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 298A9AA8A0
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 18:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732831AbfIEQTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 12:19:49 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6687 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733030AbfIEQSH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 12:18:07 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id BFCCC1B9BB529B7BE769;
        Fri,  6 Sep 2019 00:18:00 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Fri, 6 Sep 2019 00:18:36 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <mchehab@kernel.org>
CC:     <hansverk@cisco.com>, <daniel.vetter@ffwll.ch>,
        <zhongjiang@huawei.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] media: Use DIV_ROUND_CLOSEST directly
Date:   Fri, 6 Sep 2019 00:14:48 +0800
Message-ID: <1567700092-27769-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the following help of Coccinelle. I find out some place can be replaced.

-(((x) + ((__divisor) / 2)) / (__divisor))
+ DIV_ROUND_CLOSEST(x,__divisor)

zhong jiang (4):
  media: dvb-frontends: Use DIV_ROUND_CLOSEST directly to make it
    readable
  media: tuners/qm1d1c0042: Use DIV_ROUND_CLOSEST directly to make it
    readable
  media: uvcvideo: Use DIV_ROUND_CLOSEST directly to make it readable
  media: v4l2-dv-timings: Use DIV_ROUND_CLOSEST directly to make it
    readable

 drivers/media/dvb-frontends/mt312.c       | 2 +-
 drivers/media/tuners/qm1d1c0042.c         | 2 +-
 drivers/media/usb/uvc/uvc_ctrl.c          | 4 ++--
 drivers/media/v4l2-core/v4l2-dv-timings.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.12.4

