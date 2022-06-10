Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFA2545964
	for <lists+linux-media@lfdr.de>; Fri, 10 Jun 2022 03:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237794AbiFJBBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 21:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbiFJBBV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 21:01:21 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012DD2A26E
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 18:01:20 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-30026cf9af8so217007777b3.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 18:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=iANDXyzZMvhIpLWY3D/fgFsPx4ALgfBVHEDqcIv6SdY=;
        b=FvPCsLxG7L2dv24eY44expVmkI/RR/+WhgjhsFcDVm23H53FrHBTYbznWCoQJVMOe3
         ehTlcgx6sO2deGSo5/VXJuTn7SIhsbu5loRWalkoTppRWpd1hw3sx8Hz5j6/L7g94IXL
         cT5C0u8I6DmvE5j9c2zd76/keEr4lRYp+5hQtKkBaYPTxm6qRgY3kW4Pg0XorOSNjBx9
         E98ruGOWhBGAfZZ1sroDF056y2F/58l8+ckttAJWMYiQTtm9t1P6ELROBLft7GDRX5Am
         sgflZOeIjYEWm9nI8c+5fTcGcbcO+LREJ8w+ML17GkQtsUxsF+QKUpecIK4MD8/jAVDn
         PYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=iANDXyzZMvhIpLWY3D/fgFsPx4ALgfBVHEDqcIv6SdY=;
        b=xL72ZIMqXUY85hj3spFWQYp1kVOB3kIe7tMzyKFQCFHf0tkTqdcV7vaUflF9EOJ106
         +cqJweesi+uMaytZ/+uFD5D74r19Wd6rhg58zSFgd61v4g+DGC0cmVySiXRJ2yx109n5
         9G3NZlpYgOdlhIoy/AYVahXrp0sfB6D/upKFD7S5dd4mD6qydL1WnF9QSNZLYMlUSP3c
         fj6huUW2aAt1pPFsTEwe4g3lhefyFk9qxH6rZ1rSm/1yLNCgSmkJjte/hZwZaSEx79R5
         K56VWZDKAS+s86slTZsLocOF1PUBZdtdTX6zaE9DuGVvoMakalptxGB72sKlj1QsZvme
         6RhQ==
X-Gm-Message-State: AOAM530AdAEcZp8ofqWUb1poR2FE3oYLD9cDvFHqhqdW5e03LSGSGR2M
        onzYhUKl4WiWKMzT1kGl26JpwCO9k3Q=
X-Google-Smtp-Source: ABdhPJwzsxnIYlX2vVmZdp886zy27tIup34O/XXBPkQvNjQpjcQdgKJW/4wJzyo8GI0V2ZgOF+vQos4xbSo=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:5900:89c0:d4c3:d2e])
 (user=yunkec job=sendgmr) by 2002:a25:4f03:0:b0:663:dd99:b7d2 with SMTP id
 d3-20020a254f03000000b00663dd99b7d2mr15971606ybb.490.1654822879183; Thu, 09
 Jun 2022 18:01:19 -0700 (PDT)
Date:   Fri, 10 Jun 2022 10:01:09 +0900
Message-Id: <20220610010111.3418214-1-yunkec@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH v1 0/2 RESEND] media: vimc: add ancillary lens
From:   Yunke Cao <yunkec@google.com>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a basic version of vimc lens.
Link lens with sensors using ancillary links.
Update vimc documentation to reflect this change.

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
2.36.1.476.g0c4daa206d-goog

