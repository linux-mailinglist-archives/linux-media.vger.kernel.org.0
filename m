Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E26254EEFF
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 03:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378905AbiFQB57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 21:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbiFQB56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 21:57:58 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D6E4ECCB
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 18:57:58 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id a186-20020a6390c3000000b0040c40874e3bso907160pge.19
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 18:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=IY8XlewZB1NLdRZGQRfNs+mFjC6Dc5FSInLn2aQroiE=;
        b=iTPj0LLxb73s03Me/ye6UjzBO4ICwgwSriNC5Xv/MoGbnVd7a9/jwqR/6ASI2JObC5
         V0H0a+ZoskBEyv5HMq9xzUTfJtyNn1Ju3jjS/VjTTz3EJ/u4xKt2ousLNBiaLmCz91fd
         COtnZzflCEg00adVySMZf/bv9aCfvAs0qboNbv0F6XLJWFKUo3OkCGvaRIbhB121oUPR
         JAYfYit86N79YTPjBs47F7UifR522lToJ3l4GOTkb9S2XFXtv9r/Nb6qngnHrxjsFR2H
         EgwmGQMwLH1xYMRY7pftKdNStwmP9BsumE/plLINnQsicbhIhlNjkrPgDSL+2FFBteTr
         csYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=IY8XlewZB1NLdRZGQRfNs+mFjC6Dc5FSInLn2aQroiE=;
        b=6wJSqQALYX3UqTxrZlto9RFO4CmwUBPdMtLmDTs3HRoIYNqTi8Cd1r0KAiQCtMn1hI
         M2IaQA825UEFLJP2sNPqCcHiVU3gM626VhlNU3Cbm6a/J6eyeQotmRKHjf3l1itbsZBX
         YBUsn7c1c2wsF7oC/NHjuTauA08/Z6RrRXR6oLxZJJi+eoA8O3RrI/+2IxHpQ7us4qA4
         Hf4kLKZo/l8AZoqkBsMZtiTrZvx0RSqTjVh3oJscKOFgwHcakbbWyff3/VEStWIXi/cm
         lFNxNjRlNzhIeq4DM8KqvhpPfws9spyUHeqVejt8eMS4P4EYgl3IPEM+6+xrcozb8k8f
         OP0g==
X-Gm-Message-State: AJIora9t9Ia9UCQy8fckirxl6U6ddS+SzNC/n4lVFc5KafFnMXOiRuZ+
        AiPWpsqQXh5AMPrkQrDU4WNFuYz3aSY=
X-Google-Smtp-Source: AGRyM1vLPQaIp2XipvY2OmaivSlwYzYx9mzP225Rj/YfLgEiOIc+S3oSsPwZeYkID/b7OCRxjhdpf0DYQyQ=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:3ebf:f2c5:a2ea:6521])
 (user=yunkec job=sendgmr) by 2002:a63:6a85:0:b0:3fa:722a:fbdc with SMTP id
 f127-20020a636a85000000b003fa722afbdcmr7022731pgc.174.1655431077420; Thu, 16
 Jun 2022 18:57:57 -0700 (PDT)
Date:   Fri, 17 Jun 2022 10:57:43 +0900
Message-Id: <20220617015745.3950197-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH v2 0/2] media: vimc: add ancillary lens
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

Changelog from v1:
-Better commit log.
-A bit more detailed documentation in 2/2.

Yunke Cao (2):
  media: vimc: add ancillary lens
  media: vimc: documentation for lens

 Documentation/admin-guide/media/vimc.dot      |   4 +
 Documentation/admin-guide/media/vimc.rst      |   4 +
 drivers/media/test-drivers/vimc/Makefile      |   2 +-
 drivers/media/test-drivers/vimc/vimc-common.h |   1 +
 drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
 drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
 6 files changed, 178 insertions(+), 21 deletions(-)
 create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c

-- 
2.37.0.rc0.104.g0611611a94-goog

