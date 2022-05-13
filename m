Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 079E2526943
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 20:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383313AbiEMS3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 14:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiEMS3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 14:29:04 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA341FCC2
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 11:29:02 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id l9-20020a056830268900b006054381dd35so5508242otu.4
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zk0HAv/I+bsqqz4hTO9oVTOtWuggRmp4zU1PHqGajeU=;
        b=i7lYmhUV61h4hgsIX7PSnqqTT5iqhSpipst5gvK/VW8h3W0yLF7Qt1aZu+8EWiA4IH
         Z86Hk9tgt2YKQ9BMRau5jlop028b4Wej7K0zNen8l4kASQ/Amz3oI6Bp1VqWLGJ9rQYC
         c7X/OfIDFAGnOlSuFHoSrd/Oibh7NXbVLKfz4RaqvUYezJyWCJ1EJ0msu6q4PfHgvjpJ
         aJJau/05bRa+dYTbkBCgJ70nvk5cOp4dAAlB7VxOU1Ajwl48QGLkZcnHv+QAbRQqVHuM
         Xoa3heoMKmKaoVLtjbqAJa9c+NaxByJRmk3ZSZ/UO42nRUp9KrZzQvFcjGim+mdtNCL2
         8evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zk0HAv/I+bsqqz4hTO9oVTOtWuggRmp4zU1PHqGajeU=;
        b=5uionIVKpZlxDmU12wbcuiCx0Kxwh4dRqgVoXiOF7ZzYxiW+3Rnmm911+tVMrTve+O
         3xL03kuR2XQ4QIFNNuAmw1ySH28g6NiCY9aqdXwuToohioE6il24SwWKfhWHUMhF4c9C
         kk5atO3MEKuCQ9wDOHz9CSonvKtkywAh0rbe8WPcSDYMJEhx4d/qa+GWaScw8acFEQpF
         WRj/ni5Urbtrk0UnSiWIRvD/yohxD7QznV0fcbn6Hhr4egNHxVvTJrO3vt/XFopdMtKq
         SgIoJkit0oTGCp8IgOeXAKxDaKrgFYpeFyMEIM489Ad/MbP81qT1aMqn6DtN9LlZUBRK
         PSRA==
X-Gm-Message-State: AOAM532k7byl0oufVHpy/CFYXnjeCGdsfrYdw6qnXzmfJTiNHvwEQIk1
        2rqyppVJD5sx8Hb29uEZj3w=
X-Google-Smtp-Source: ABdhPJyluT97r2bZcsLuba1ZIhXoS8+vI9Eh6M+6VS7/ovnKWL6u3qw2sPKx/BdAUC/y39AUlENRiA==
X-Received: by 2002:a05:6830:2aa1:b0:606:3a07:646b with SMTP id s33-20020a0568302aa100b006063a07646bmr2320231otu.229.1652466542113;
        Fri, 13 May 2022 11:29:02 -0700 (PDT)
Received: from local.lan ([190.1.30.36])
        by smtp.gmail.com with ESMTPSA id c24-20020a9d6858000000b00606ad72bdcbsm1234719oto.38.2022.05.13.11.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 11:29:01 -0700 (PDT)
From:   Jorge Maidana <jorgem.linux@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Jorge Maidana <jorgem.linux@gmail.com>
Subject: [PATCH 0/2] media: cx88 and usbtv: PAL-Nc fixes
Date:   Fri, 13 May 2022 15:29:20 -0300
Message-Id: <20220513182922.4882-1-jorgem.linux@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series fixes PAL-Nc support on cx88 and usbtv, it has been
tested with PAL-Nc sources and an "MS1835 VGA to AV Converter" PCB label
"MS1835_VGA2AV_DEMO_REV1.1" which has different output standards.

Jorge Maidana (2):
  media: cx88: Fix PAL-Nc standard
  media: usbtv: Add PAL-Nc standard

 drivers/media/pci/cx88/cx88-core.c    | 22 +++++++++++++++++-----
 drivers/media/usb/usbtv/usbtv-video.c |  5 ++++-
 drivers/media/usb/usbtv/usbtv.h       |  3 ++-
 3 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.30.2

