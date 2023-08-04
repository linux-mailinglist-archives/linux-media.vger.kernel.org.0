Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528F876FA88
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 08:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbjHDG4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 02:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjHDG4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 02:56:06 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC84B1
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 23:56:05 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RHGdB5VLSzJrP6;
        Fri,  4 Aug 2023 14:53:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 14:56:02 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <j.neuschaefer@gmx.net>, <u.kleine-koenig@pengutronix.de>,
        <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 0/3] media: Remove unnecessary ternary operators
Date:   Fri, 4 Aug 2023 14:55:20 +0800
Message-ID: <20230804065523.2986884-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a little ternary operators, the true or false judgement
of which is unnecessary in C language semantics.

v1 -> v2:
- Remove unnecessary "? false : true" for drx39xyj
- Fix the spelling error, Ther -> There

Ruan Jinjie (3):
  media: dvb-frontends: drx39xyj: Remove unnecessary ternary operators
  media: radio-wl1273: Remove an unnecessary ternary operator
  media: dvb-usb: gp8psk: Remove an unnecessary ternary operator

 drivers/media/dvb-frontends/drx39xyj/drxj.c | 6 +++---
 drivers/media/radio/radio-wl1273.c          | 2 +-
 drivers/media/usb/dvb-usb/gp8psk.c          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1

