Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086A57DC72D
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 08:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343628AbjJaHXK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 03:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343618AbjJaHXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 03:23:10 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2980D8F;
        Tue, 31 Oct 2023 00:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=6VOEl
        ouc2GMG6bSXp2UcAdff2CtTi6AX9Q0p7itVxKA=; b=YUV1ANsczlmQDj/76ZA/F
        DxZ5wllI9YoGk7uy2OyCh3HhSLS1EPXApEobV6F25x9IaIfApQi8VjbHvOd617Kn
        5gcsTup1Tl2Aw56cKWnnOloOPsYuHdUjzD8z3XQCKtqOtFJAv0p++IDe91sp5llo
        /MZQS072Fv79ssouXRSXIQ=
Received: from leanderwang-LC4.localdomain (unknown [111.206.145.21])
        by zwqz-smtp-mta-g5-3 (Coremail) with SMTP id _____wC3X7c_q0BlUkngBw--.14054S2;
        Tue, 31 Oct 2023 15:22:39 +0800 (CST)
From:   Zheng Wang <zyytlz.wz@163.com>
To:     dmitry.osipenko@collabora.com
Cc:     Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com,
        security@kernel.org, hackerzheng666@gmail.com,
        1395428693sheep@gmail.com, alex000young@gmail.com,
        amergnat@baylibre.com, wenst@chromium.org,
        Zheng Wang <zyytlz.wz@163.com>
Subject: [PATCH v2 0/3] Fix use-after-free bug in mtk_jpeg_dec_device_run and fix schedule error in mtk_jpegdec_worker
Date:   Tue, 31 Oct 2023 15:22:33 +0800
Message-Id: <20231031072236.21077-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3X7c_q0BlUkngBw--.14054S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4xJry8Zw1DWryDtw4DCFg_yoWkArX_WF
        9Y9wn7uw18G3srJF4ayFy5ZrW8GFy7KF45GFZ8KFs5JFy5XFZIqF1vyrZ3uan3Wa12vF43
        Gr4FqF4UXw1j9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUxsqJUUUUU==
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbBzgAaU2I0bIoWkgAAsz
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This v2 series fixes the use-after-free bug in mtk_jpeg_dec_device_run.
It inclues reverting the incomplete fix before and make the right fix.
Also,it fixes the error of timeout-worker-schedule in multiple-core
devices.

1. Remove cancel worker in mtk_jpeg_remove for the worker is only
registered in single-core device but we try to cacnel it in both
single-core and multiple-core devices.

2. Fix use-after-free bug by delay the schedule_delayed_work only if
mtk_jpeg_set_dec_dst runs successfully.

3. Delay the schedule_delayed_work in mtk_jpegdec_worker as it has same
code logic in mtk_jpeg_dec_device_run.

version 2 changes

-put the patches into on series suggested by Dmitry

Zheng Wang (3):
  media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to avoid the
    crash of multi-core JPEG devices
  media: mtk-jpeg: Fix use after free bug due to error path handling
    in mtk_jpeg_dec_device_run
  media: mtk-jpeg: Fix timeout schedule error in mtk_jpegdec_worker.

 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c    | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
2.25.1

