Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E74055DDD3
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237773AbiF1AyD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 20:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237329AbiF1AyC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 20:54:02 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9141D0D6
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 17:54:01 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2dc7bdd666fso89949417b3.7
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 17:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=zBSTFP2A6NDvR/YmwvQ0gOlALdH/+xsbpwqQ8lAy5zg=;
        b=jYz9JVSTMdf84gES4ZBeNDM5y7yCEf8m0UK7kR/NPa6TyR48QCQN/RjuhT2DzCmL8Y
         +ohyemBNihGvI8j511voihA3V4RFTqPIZr+3j/ShZ2gQYlajYeHVjoYjpATEmtRUNArL
         FL05V65DmJs3Qc+8bdun22Nsu1l3P3GYIlZNnLNzSAS1LhpURYpL75LFbm8MXzt9OPWe
         gNIjeDi9B89n3GCUlU2bSMH3gSd/+wW8itQP+uGL4/M9e/Eh7G0lVfh5YKuWZ/EvKZvg
         +02vBM3DjNpjAYcTWh+oMIgjHWfMgZPI0kGAjlK8/LBpGhai6s+p8yAWjTvdzqWAs7oC
         WfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=zBSTFP2A6NDvR/YmwvQ0gOlALdH/+xsbpwqQ8lAy5zg=;
        b=f4ZPNlHQlQkq1YmKw/ikCudZtYgVUEVpfA0bMxNcaVt7zHaRE8I5z03KVwlcxxJpmT
         /mI2oC3COXsF55upHxeRWhlQHqUyjiUlGk0O40tGweGokWXo6Qpx6BuCudTeS7g2lguF
         GUoFZHR92kQy2wRWvOjO2r3X5dTScgGaewCuJgmmFtBRQ4d21SujCMbfVHdXBfm8FHI/
         WctzfFbzIQxTSEnbK1zFaEnggUwg3U8iJYZ4lqnpJ97Br8emV0+RmnEQsZkp6hycdzKv
         P4CWFu9W7vx+6RfLsr9JGEGhz9O8yrrx0YLGU8ioeLhZpbV8Zm5plW4MV+1thxMB6hvx
         tJ8w==
X-Gm-Message-State: AJIora8y55a+moU0JQx+GVcd2Kx9Kt6YddY7FbBVRsUVYa25wYjg8Oei
        PoxbmHFF+m8oXqZDleWX1+CnQ+PTL3Y=
X-Google-Smtp-Source: AGRyM1tJUy0aRdeIbYAJEQh2tH6ALhuL7X0S1taNJSlWtTBvTLlj9YABB9gXrbxRCkPeyTDPlEk3go5iPwc=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:9c62:6600:c258:f14])
 (user=yunkec job=sendgmr) by 2002:a25:2d1d:0:b0:66c:a759:e79a with SMTP id
 t29-20020a252d1d000000b0066ca759e79amr10250749ybt.515.1656377640544; Mon, 27
 Jun 2022 17:54:00 -0700 (PDT)
Date:   Tue, 28 Jun 2022 09:53:51 +0900
Message-Id: <20220628005353.1719403-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 0/2] media:vimc:add ancillary lens
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

Changelog from v2:
-Add test information into commit log and documentation

Changelog from v1:
-Better commit log.
-A bit more detailed documentation in 2/2.

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

