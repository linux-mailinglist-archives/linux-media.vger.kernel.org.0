Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B463ABFA1
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 01:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhFQXnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 19:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhFQXnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 19:43:32 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6E1C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 16:41:22 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id g24so4687485pji.4
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iPjYojrMhXySRPMMa4F0IeHMy7s1XoQqloVH/rGZcFY=;
        b=fMb+jWNQmis7X2pYYdxUBAzKXl1VeOKWYdsEnnBEOhLfGLyXM5cG8kfb0R3wSRK0iN
         UbJadeOA7W4dVOOFTP4doJwpEy1IemPS1KuNalaWmBqnY9BgMt/wJluwdf8CWiYhyNlf
         SpyCQPA3ePUTZj9X8zWFN+lvzdrSYu46npMLkrY2o1kfi5bdJQqc8N3n0WK3v47lv8DC
         QaXQUZKgyHh/5Nsmb7Y8tfQCcJRM/TySBaxA7Ybx/ZKSGjK34lspo/uubvmOYWqlx4Cn
         c1QSpoDrLKsCx1H95tvkKgwlQOLevLRo0rr5D5/DzVL/q8GAYA29RlPR17RTc4m6h3rI
         Nrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iPjYojrMhXySRPMMa4F0IeHMy7s1XoQqloVH/rGZcFY=;
        b=D6i5LgltrdmFzTyhAUQqfcb5u6KQtPvpvpTQnSuNqDYf4pzzSTx/MxZLssrzQMLw5L
         U2NEtGvDDIx+bSDNHZEQw6exujJc0Pe+OsMRWfVYFQTHOtav0fm9EntYoSH9AzmaYWMJ
         uQ4UIFZ07Tb9ZfSTi8m2gv+wgJeyF37bPGzLe8Z4t3BuLKvx5A2nNiqJlJv9iUmGUYJN
         1B6o1jNO20SFE4Rp1dQnF/vGMkyg3zPvM2yx7WIQ9J82eh/FZkMh+Xdu/FwMp7foLjXC
         JjNkJOPOPjpaTTIVs4a9ky+ppojwWFmZZ1Ar/WVKXXoi/QIqaSKVXEPBHrntgUobeCo/
         zglg==
X-Gm-Message-State: AOAM533G1DNu4vnduDi5oIscXZaPyniYwq7LEoPaYE30j/4Goxkqw810
        sBf2t0vhASmTPH5BBblNV/ZIM7xEctvuRQ==
X-Google-Smtp-Source: ABdhPJz84xUnFdSZwM29P0iAOFEhQHnhLmrrGLZp/eRk+ZBc9o9JLNSEQ22A5bLcHsWe1ES9gZSMfg==
X-Received: by 2002:a17:902:dac3:b029:105:66fc:8ed7 with SMTP id q3-20020a170902dac3b029010566fc8ed7mr2075154plx.6.1623973282334;
        Thu, 17 Jun 2021 16:41:22 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id j19sm6452966pgm.44.2021.06.17.16.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 16:41:21 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2 0/2] cec: One Touch Record tests
Date:   Thu, 17 Jun 2021 16:41:10 -0700
Message-Id: <cover.1623972511.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is part of an Outreachy project to expand the testing of
One Touch Record messages as handled by CEC adapters.

Changes since v1:
	Patch 1/2 cec: expand One Touch Record TV Screen test
	- add space after 'switch'
	- add "return" before fail
	- check analog broadcast type and broadcast system operand
	- add a comment when follower ignores message
	
	Patch 2/2 cec: expand One Touch Record On test
	- new patch

Deborah Brouwer (2):
  cec: expand One Touch Record TV Screen test
  cec: expand One Touch Record On test

 utils/cec-compliance/cec-test.cpp | 160 +++++++++++++++++++++++++++---
 utils/cec-follower/cec-tuner.cpp  |  37 ++++++-
 2 files changed, 176 insertions(+), 21 deletions(-)

-- 
2.25.1

