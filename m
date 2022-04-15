Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0FC250209A
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 04:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243878AbiDOCl3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 22:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbiDOCl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 22:41:28 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C97753708
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 19:39:02 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2ec06f77db8so57665057b3.8
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 19:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=6fdjqf8F5BhvTupavp1xSP/tIbpgIHLf+RVo/pzOERc=;
        b=X+Rs239GVOIzsuCzPQrf5lldGTv2MpX3bQCJc8/xpWsaXof0t4jej66mFAXP9Sj60F
         DozPALs1gS9tfruz3UhOChPd4kepECNU0tJmJhCZvFHgjeUP8oJCFJKxbhkxJNYBlNe8
         Isu2+HnAGClZT0EnAHI6miffTtefSiNAz0X1P20EiZfwNGxmXQ//6TYnS3FuHi/ejqrB
         j2iKfFV1SgYhyNQP8E/QNCyiM3aBBotGIy+cU/Xy23zhuInXEBTS6PCygFUSjlwjRONp
         1KsEVQVe3tYSTXaYrrPQMBSHKaKB15CQevf1chmB/6aHzdnEyePD/wJ9srgcUr3U/iBv
         FaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=6fdjqf8F5BhvTupavp1xSP/tIbpgIHLf+RVo/pzOERc=;
        b=aIg0MTAsiJNgD9ibJ24X5j+lJYwZX8UqoFlxrIARueQxjToXy2TdtUekAxWWmhKGeX
         md5ik14i4iI2KCOwrKK17lVuZKlMA1BbtavIhGvMlzE+bt9qE0Toc2Nm2Cfx795yvNlE
         DbxogxVVYOsYVA51DekErSLFTRClIWu/X7qrBsyg97WV/4+AvkELC/m3iYOID0HW4yMC
         tkBE6m7J+wDBo01XA2/A/uovWWNzQ4CMNjv8Ko84GINHl+js/0u7i4c+/mGI7auo9d0a
         50AI/Ad5/7kg6zkz4/NEZ4wWsOcbadrk5e150K0jtQ2t8L2oDTIPnCaaw9kd636HkUlg
         vkuQ==
X-Gm-Message-State: AOAM533h7WUtx41dCLYqnkbf9kSrPaworHUS708YJsLUzOrWmd9L1fOO
        4Ibyz1Ffj2wk+GSvntz54q0PY/kBnbc=
X-Google-Smtp-Source: ABdhPJwKEyz+3M3PzjmMLC04FixoF7h9n1QwI8Ao/X2Z6PstBayAnrpPZFPCuL3sEmVFGjflx+vX+bVb7kM=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:755d:d23c:8c6c:9154])
 (user=yunkec job=sendgmr) by 2002:a81:688:0:b0:2ec:239:d1e with SMTP id
 130-20020a810688000000b002ec02390d1emr4326753ywg.211.1649990341236; Thu, 14
 Apr 2022 19:39:01 -0700 (PDT)
Date:   Fri, 15 Apr 2022 11:38:53 +0900
Message-Id: <20220415023855.2568366-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH v1 0/2] media: vimc: add ancillary lens
From:   Yunke Cao <yunkec@google.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
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

*** BLURB HERE ***

Yunke Cao (2):
  media: vimc: add ancillary lens
  media: vimc: documentation for lens

 Documentation/admin-guide/media/vimc.dot      |   4 +
 Documentation/admin-guide/media/vimc.rst      |   3 +
 drivers/media/test-drivers/vimc/Makefile      |   2 +-
 drivers/media/test-drivers/vimc/vimc-common.h |   1 +
 drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
 drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
 6 files changed, 177 insertions(+), 21 deletions(-)
 create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c

-- 
2.36.0.rc0.470.gd361397f0d-goog

