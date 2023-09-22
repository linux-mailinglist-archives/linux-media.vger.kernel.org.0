Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B8B7AAFF1
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 12:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbjIVKus (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 06:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233500AbjIVKuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 06:50:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41230102
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 03:50:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F657C433C8;
        Fri, 22 Sep 2023 10:50:38 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH 0/7] media: string truncate warnings: fix low-hanging fruit
Date:   Fri, 22 Sep 2023 12:50:29 +0200
Message-Id: <20230922105036.3148784-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While going through the string truncate warnings I found several that
were easy to fix.

The remainder of the warnings (about 33) are all of this type:

	char name1[32];
	char name2[32];

	snprintf(name2, sizeof(name2), "foo:%s", name1);

Since the [32] part of the character arrays is related to uAPI structures,
this is not so easy to fix.

One option might be to create a helper function to do the concatenation
and that warns (once) if actual truncation takes place. Since in most
case the strings are short enough.

Even if we increase the size to e.g. 64 in the uAPI to avoid some of the
current truncates, that will still cause the same warning, so a helper
function that is smarter would probably still be needed.

Comments/ideas are welcome.

Regards,

	Hans

Hans Verkuil (7):
  media: allegro-dvt: increase buffer size in msg_type_name()
  media: cadence: increase buffer size in csi2tx_get_resources()
  media: atomisp: ia_ccs_debug.c: increase enable_info buffer
  media: vivid: avoid integer overflow
  media: ipu-bridge: increase sensor_name size
  media: cx18: increase in_workq_name size
  media: rc: ati_remote: increase mouse_name buffer size

 drivers/media/pci/cx18/cx18-driver.h                            | 2 +-
 drivers/media/platform/allegro-dvt/allegro-mail.c               | 2 +-
 drivers/media/platform/cadence/cdns-csi2tx.c                    | 2 +-
 drivers/media/rc/ati_remote.c                                   | 2 +-
 drivers/media/test-drivers/vivid/vivid-rds-gen.c                | 2 +-
 .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 +-
 include/media/ipu-bridge.h                                      | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.40.1

