Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B52D3EB7D0
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 17:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241301AbhHMPJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 11:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241263AbhHMPJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 11:09:25 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D581DC0613A4
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 08:08:58 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id k29so13726422wrd.7
        for <linux-media@vger.kernel.org>; Fri, 13 Aug 2021 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MJmnMiqiIExJnQO7nDSEkupepLCI4iEDd+CsumVTut8=;
        b=feB6b8dEwMs54No0bdiwARiMr6PvNB+5Y/QwTiHn41Oco6vCq7kHRLBkNWJevIrM95
         B+RZpgK7M7MaSKD05lAYlCG7jKUF6Kn3VfeuToeRpRPLQR9hPpZfcbqVxF5SxuAy88bg
         uk4957fWc1/xCv3wsQaGG516Z41hS4MV2bJt4n5nZHlDxbH4RusHgermCMTtgJteaJH9
         rqNo4wgtP+R1s4L9mKO4v8/Pkb252Oam1sUAKDrdaSj0pjMEUGmSdFD8aLCueG4V9VKR
         fuC14jgG0ytSaXihK2MI4zvZ1P4L5ZZM0Tf5j1Hu5kkwm+MWUpPhCE1t4ResInRVFIHh
         x8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MJmnMiqiIExJnQO7nDSEkupepLCI4iEDd+CsumVTut8=;
        b=KwOMxNwlGIm0WHeTDsUqg/3n1PI49CcrRyQrGQTv83uebHu5oeqyO/+LVU3UhmDw1F
         RuBeY0ZrdLyN1bekZ6R5e3jsBJ5H35m6ACt5GUR3bFhNSaJtODWtlI0s6ZzPckamgf8h
         nZ8/uz1uwPqsJuZ0ctOvWFlOH0hASb6nR+ff7jSRKeJEzJkddA1EfyvwSfY2yoEVLZRw
         Sby9SiJ8MbwOCe3TvskAlk8mHUdg2+aEXOsgqRyehVzTnUwI5QPlBb7pXDOVa+OG3/Yy
         FzmCGdOab/qCCN7x/8VFZS9Zk3qf0zBgq5GYSU9vqOId5uRYsyYscEaEcYxSssdFDhuO
         FvHw==
X-Gm-Message-State: AOAM533SyZ905msbuPbqaB9bI0FOlwBfL4Xm6zM4IW22Hl+GPPQ3ltVY
        TIHGiRL03qQpCuupg+S3ikQd0w==
X-Google-Smtp-Source: ABdhPJw99y6IpfcMMbjWcPoIu6O98hDnqEM/2v5YWE6v0ZuOOSJCbKScQnaQ86cDPhD0AfIiDzg8xg==
X-Received: by 2002:a5d:4d41:: with SMTP id a1mr1558708wru.76.1628867337517;
        Fri, 13 Aug 2021 08:08:57 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h4sm1799575wrm.42.2021.08.13.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 08:08:57 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Suresh Udipi <sudipi@jp.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] rcar-csi2: Improve link frequency selection
Date:   Fri, 13 Aug 2021 17:07:53 +0200
Message-Id: <20210813150756.131826-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series improves CSI-2 link frequency selection for the R-Car CSI-2 
driver. This series have been posted before in different forms but 
appears to have been side lined due to a confusion about a table in 
datasheets.

Since then a datasheet update have been issued and clarified the 
situation and I think the series is ready to be picked up.

The series have been rebased to Mauro's media-next tree and tested on 
R-Car M3N with out any regressions found.

Suresh Udipi (3):
  media: rcar-csi2: Correct the selection of hsfreqrange
  media: rcar-csi2: Add warning for PHY speed less than minimum
  media: rcar-csi2: Optimize the selection PHTW register

 drivers/media/platform/rcar-vin/rcar-csi2.c | 22 +++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.32.0

