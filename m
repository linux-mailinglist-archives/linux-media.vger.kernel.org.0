Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D892776EB8
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 05:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjHJDrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 23:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjHJDrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 23:47:23 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761102103
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 20:47:21 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RLt7m3wV5ztS2G;
        Thu, 10 Aug 2023 11:43:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 11:47:18 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <mirela.rabulea@nxp.com>, <linux-imx@nxp.com>,
        <mchehab@kernel.org>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <laurent.pinchart@ideasonboard.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 0/2] media: nxp: Remove redundant dev_err() for platform_get_irq() 
Date:   Thu, 10 Aug 2023 11:46:39 +0800
Message-ID: <20230810034641.1384352-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 2043727c2882 ("driver core: platform: Make use of the helper
function dev_err_probe()"), there is no need to call the dev_err() function
directly to print a custom message when handling an error from
platform_get_irq() function as it is going to display an appropriate
error message in case of a failure.

Changes in v2:
- Split into 2 patches.
- Update the commit title and the subject prefix.

Ruan Jinjie (2):
  media: imx-jpeg: Remove a redundant dev_err() for platform_get_irq()
  media: nxp: Remove a redundant dev_err() for platform_get_irq()

 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c      | 1 -
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 1 -
 2 files changed, 2 deletions(-)

-- 
2.34.1

