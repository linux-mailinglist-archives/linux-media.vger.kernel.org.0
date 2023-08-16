Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B630F77DA83
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 08:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238566AbjHPGfl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 02:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242172AbjHPGfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 02:35:33 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17D21B2
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 23:35:31 -0700 (PDT)
Received: from dggpeml500003.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQdb219dyzNmln;
        Wed, 16 Aug 2023 14:31:58 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpeml500003.china.huawei.com
 (7.185.36.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 16 Aug
 2023 14:35:29 +0800
From:   Yu Liao <liaoyu15@huawei.com>
To:     <tfiga@chromium.org>
CC:     <liaoyu15@huawei.com>, <liwei391@huawei.com>,
        <m.szyprowski@samsung.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: [PATCH v2 -next] media: use struct_size() helper
Date:   Wed, 16 Aug 2023 14:31:43 +0800
Message-ID: <20230816063143.1003676-1-liaoyu15@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prefer struct_size() over open-coded versions of idiom:

sizeof(struct-with-flex-array) + sizeof(typeof-flex-array-elements) * count

where count is the max number of items the flexible array is supposed to
contain.

Signed-off-by: Yu Liao <liaoyu15@huawei.com>
---

v1 -> v2:
- use struct_size() since vec is declared

 drivers/media/common/videobuf2/frame_vector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index 0f430ddc1f67..ff1c3ebee4b0 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -157,7 +157,7 @@ EXPORT_SYMBOL(frame_vector_to_pfns);
 struct frame_vector *frame_vector_create(unsigned int nr_frames)
 {
 	struct frame_vector *vec;
-	int size = sizeof(struct frame_vector) + sizeof(void *) * nr_frames;
+	int size = struct_size(vec, ptrs, nr_frames);
 
 	if (WARN_ON_ONCE(nr_frames == 0))
 		return NULL;
-- 
2.25.1

