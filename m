Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA5A76FA89
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 08:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbjHDG4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 02:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjHDG4I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 02:56:08 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51844E7
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 23:56:07 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RHGcT2BmyztRrw;
        Fri,  4 Aug 2023 14:52:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 14:56:04 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <j.neuschaefer@gmx.net>, <u.kleine-koenig@pengutronix.de>,
        <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 1/3] media: dvb-frontends: drx39xyj: Remove unnecessary ternary operators
Date:   Fri, 4 Aug 2023 14:55:21 +0800
Message-ID: <20230804065523.2986884-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804065523.2986884-1-ruanjinjie@huawei.com>
References: <20230804065523.2986884-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a few ternary operators, the true or false judgement of which
is unnecessary in C language semantics.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
v2:
- Remove the unnecessary "? false : true"  ternary operators.
- Update the commit title and message.
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 68f4e8b5a0ab..903eaa6b2dc3 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -4779,8 +4779,8 @@ set_frequency(struct drx_demod_instance *demod,
 	bool image_to_select;
 	s32 fm_frequency_shift = 0;
 
-	rf_mirror = (ext_attr->mirror == DRX_MIRROR_YES) ? true : false;
-	tuner_mirror = demod->my_common_attr->mirror_freq_spect ? false : true;
+	rf_mirror = ext_attr->mirror == DRX_MIRROR_YES;
+	tuner_mirror = !demod->my_common_attr->mirror_freq_spect;
 	/*
 	   Program frequency shifter
 	   No need to account for mirroring on RF
@@ -8765,7 +8765,7 @@ static int qam_flip_spec(struct drx_demod_instance *demod, struct drx_channel *c
 		goto rw_error;
 	}
 	ext_attr->iqm_fs_rate_ofs = iqm_fs_rate_ofs;
-	ext_attr->pos_image = (ext_attr->pos_image) ? false : true;
+	ext_attr->pos_image = !ext_attr->pos_image;
 
 	/* freeze dq/fq updating */
 	rc = drxj_dap_read_reg16(dev_addr, QAM_DQ_MODE__A, &data, 0);
-- 
2.34.1

