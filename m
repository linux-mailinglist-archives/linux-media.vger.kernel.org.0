Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7CE07031F6
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 17:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242141AbjEOP5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 11:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbjEOP5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 11:57:42 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB620C3;
        Mon, 15 May 2023 08:57:40 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.43])
        by gateway (Coremail) with SMTP id _____8AxV+lzVmJk_d0IAA--.15137S3;
        Mon, 15 May 2023 23:57:39 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxBMVuVmJkr6lgAA--.36828S4;
        Mon, 15 May 2023 23:57:37 +0800 (CST)
From:   Sui Jingfeng <suijingfeng@loongson.cn>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        suijingfeng <15330273260@189.cn>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        loongson-kernel@lists.loongnix.cn
Subject: [PATCH v13 2/2] MAINTAINERS: add maintainers for DRM LOONGSON driver
Date:   Mon, 15 May 2023 23:57:34 +0800
Message-Id: <20230515155734.2954149-3-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515155734.2954149-1-suijingfeng@loongson.cn>
References: <20230515155734.2954149-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxBMVuVmJkr6lgAA--.36828S4
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7XF1rAFWDWF43urW3uF4UJwb_yoWfJrb_Ga
        yUJ393Zr1UWF9FkaykZFsrGryayrW3tF4Sg3Zrtan5Aa4qyryDJrZrK347KFy5Ar1xK3Z8
        tayrGrySkFs3WjkaLaAFLSUrUUUUOb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
        X7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
        AFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
        6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
        xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AF
        wI0_Jw0_GFyle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
        Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE
        14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
        AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
        67AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
        8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7
        JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
        1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
        daVFxhVjvjDU0xZFpf9x07jP_-9UUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch add Li Yi and Sui Jingfeng as maintainer to drm/loongson driver

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 402e26d0cdbc..8cdb75f653bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6945,6 +6945,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/lima/
 F:	include/uapi/drm/lima_drm.h
 
+DRM DRIVERS FOR LOONGSON
+M:	Li Yi <liyi@loongson.cn>
+M:	Sui Jingfeng <suijingfeng@loongson.cn>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/loongson/
+
 DRM DRIVERS FOR MEDIATEK
 M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
-- 
2.25.1

