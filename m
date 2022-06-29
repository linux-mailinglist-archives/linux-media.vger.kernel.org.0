Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE3055F31D
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 04:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiF2CGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 22:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiF2CGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 22:06:46 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1609F31506
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 19:06:46 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3187c3e8751so118409507b3.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 19:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=GbPJofidsDZKn6JlOTY0uF1lIuMA2N5ZC6QBhFUOKtM=;
        b=mwAgBe0wOnFn1ybyuhmF0bOPs/tOBMEG+upGFpu8SPwsTwtMVNWM9kALpUaW9ACapo
         9/E6NaPHMAX8uJATSHMhPWW6b+92Qi3/6PBlqSPhXKaLKPoBlk0XQ4CbdW4CdAqLs5ci
         GVoh/4j8cZt9J/NW7RFUKp4VjzS7RoEYeAQTQRK0kWjbi7uDjQr7Plmu/kvy3VbBqz/r
         wVZ8ZmT5nv9zcXJsSiAsl+iVqG8wbTv2KhG0uHvgY1qmQSyFz6RWewS6mU28vB/bQMej
         joTgd6I7hqiXYWBHI/h6a8xb8BAVXT3hLNUkILEGUYQChJKQfS/TXXl4oTMkxeYyOWTf
         Z7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=GbPJofidsDZKn6JlOTY0uF1lIuMA2N5ZC6QBhFUOKtM=;
        b=qmsRm/v2vxAZBDDUUB8rcABu64+NVaxgtbq2rtLj/9rDsS+fCn6rzecHlSF/4+09mW
         m8+IZgCHQHgNJ4oYMXu43sTlil/gfGrugduTYHnEJSpwcw31IPkOIQUyhd55aL9KqBr8
         74yvwuBmLTeS12wAKbzmO2MmIA3vFNntW+rba2O3j0nytAMpYgTes36ArkfhWbZfCCwf
         H5+cqoZ/1NAaQiv7xakiZQeuM7sy4fYcUuc4Dt1Uf5yYfEGJh+8jFfSsgB6/Ez5od/SQ
         2rE9laga9bw6q7dlvZymS8KCukFq5QFNdC4jbRLavGukjbuNRXM3uXs35HZ19p5Fl8S2
         EBLw==
X-Gm-Message-State: AJIora/FlCa2WJdddEeRRy9DugL0P3ld05FQSfEz/2Z1VMYGKOKBeYfq
        ogbcI8of9sWQSykFtzGduafTcy/nAKw=
X-Google-Smtp-Source: AGRyM1vq4LRLfIGT6Js42FRwk/VKnuX+2ZuzSXd/EEpHUC1ceiRUGzCFX+yzUeStTQ1msQPlB+EDzAUcch0=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:983d:14d6:e059:135f])
 (user=yunkec job=sendgmr) by 2002:a25:8c87:0:b0:64f:cb1c:e7a9 with SMTP id
 m7-20020a258c87000000b0064fcb1ce7a9mr870010ybl.519.1656468405357; Tue, 28 Jun
 2022 19:06:45 -0700 (PDT)
Date:   Wed, 29 Jun 2022 11:06:28 +0900
Message-Id: <20220629020630.2865785-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [RESEND PATCH v3 0/2] media:vimc:add ancillary lens
From:   Yunke Cao <yunkec@google.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a basic version of vimc lens.
Link lens with sensors using ancillary links.
Update vimc documentation to reflect this change.

Resend after rebasing.

Changelog from v2:
-Add test information into commit log and documentation

Changelog from v1:
-Better commit log.
-A bit more detailed documentation in 2/2.

Yunke Cao (2):
  media: vimc: add ancillary lens
  media: vimc: documentation for lens

Yunke Cao (2):
  media: vimc: add ancillary lens
  media: vimc: documentation for lens

 Documentation/admin-guide/media/vimc.dot      |   4 +
 Documentation/admin-guide/media/vimc.rst      |  19 ++++
 drivers/media/test-drivers/vimc/Makefile      |   2 +-
 drivers/media/test-drivers/vimc/vimc-common.h |   1 +
 drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
 drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
 6 files changed, 193 insertions(+), 21 deletions(-)
 create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c

-- 
2.37.0.rc0.161.g10f37bed90-goog

