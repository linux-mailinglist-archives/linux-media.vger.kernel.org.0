Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7BEF731B93
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241558AbjFOOkL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345123AbjFOOkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:40:07 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 236211707;
        Thu, 15 Jun 2023 07:40:03 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:38118.1572836322
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id A4EC7100295;
        Thu, 15 Jun 2023 22:36:20 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-75648544bd-7vx9t with ESMTP id f757833a38c0491a9b3e100f3191d20a for maarten.lankhorst@linux.intel.com;
        Thu, 15 Jun 2023 22:36:21 CST
X-Transaction-ID: f757833a38c0491a9b3e100f3191d20a
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
From:   Sui Jingfeng <15330273260@189.cn>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Christian Koenig <christian.koenig@amd.com>
Cc:     inux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: [PATCH v15 2/2] MAINTAINERS: add maintainers for DRM LOONGSON driver
Date:   Thu, 15 Jun 2023 22:36:13 +0800
Message-Id: <20230615143613.1236245-3-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615143613.1236245-1-15330273260@189.cn>
References: <20230615143613.1236245-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sui Jingfeng <suijingfeng@loongson.cn>

This patch add Sui Jingfeng as maintainer to drm/loongson driver.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 225e20582a96..70262eb6e614 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6956,6 +6956,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/lima/
 F:	include/uapi/drm/lima_drm.h
 
+DRM DRIVERS FOR LOONGSON
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

