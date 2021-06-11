Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94DCD3A41D5
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 14:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhFKMSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 08:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhFKMSK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 08:18:10 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E78C061574
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 05:16:12 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id t3so36868772edc.7
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 05:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hviSTLngad9mLUVeG10yk+UTd9gBgWfA6RzLDDl4+W0=;
        b=bneBr+x3fhzlgAaSHkG6UdGBj1OIJz5hVZ7Yypz4kjAx5Ytse2x+11AYyd7OwacCLS
         FyJ+eJ1vO5nEfmTAlU2PDIyc4h+ro+bXpufejpxYDy5I1+lEFtfQTBiJBmlSsWQSTgkI
         kBYRpD7A//prUruZsnq+WBs7TbkmagPAfQ63qDnqpra6yDRP1+dUBojRKrm20T3B4Ovi
         DtFW5S0opbK2MPzWS0jr5Jg30sA3CLUyBjlhJi7ELoS+gM3KLFH+v+FQASMsR7v9gpg6
         YM4LOwEnkC5PpR1C7d/88e0ZD6ET/YtFPq7TsI6SeYcVCp0FBggG+0lfMSe1+WGx+tUg
         xHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hviSTLngad9mLUVeG10yk+UTd9gBgWfA6RzLDDl4+W0=;
        b=UkwFPZW9FOFp3HfnBjqp2xr4yGc2RvbugnTFFMZLt6a9KaoHcol0KovaAK7ShVp9E/
         DkouB9FC6HBDkMigmnQns/rCmmmCJwYZeCRYsCiMwXJVySzgCD46SQshI2J3cljNWFNn
         z9BVBWD8GDy3HE7OwJGidQYvlLHfE4bHF7vSr/WG/FPonmdhyndNsbUhoiqkp5op89wm
         Rz7KSsf5S0bV33EJqFpZ79Ar7MnGewviu8uPNG/NZWsyDK+PIdBpO8JcfZdubL4KXN9B
         kbLhpiW08cH3dAvIGOquPXLKD+MkVdqyDEVKKzpa31XU0Bz/sC8vd53fnuaFqccmbETw
         kZzw==
X-Gm-Message-State: AOAM531qVbDkoxCgQnPo1tqLuJPHR7i14fh2476OOkZqcGUigXHX7zWa
        1WKcIT7eMYrhvg5pStuDGKuCbRyswMEGrBSo
X-Google-Smtp-Source: ABdhPJwBMcxy9vbUXHE+XhLKj8SGnP7QosSBQHBNIax29aRfzsVutbsOrF+LhwA00PQRlmWqXTs6Tg==
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr3376956edw.322.1623413770835;
        Fri, 11 Jun 2021 05:16:10 -0700 (PDT)
Received: from localhost.localdomain (hst-221-69.medicom.bg. [84.238.221.69])
        by smtp.gmail.com with ESMTPSA id v23sm2581237eds.25.2021.06.11.05.16.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 05:16:10 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.14] Venus updates part2
Date:   Fri, 11 Jun 2021 15:16:01 +0300
Message-Id: <20210611121601.330645-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here are two more fixes related to ongoing efforts to enable -Warray-bounds.

Please pull.

regards,
Stan

The following changes since commit 5b448065febe1c6bb6693735844f2fb2b7b654dc:

  media: pci: tw5864: avoid usage of some characters (2021-06-04 08:11:12 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.14-part2

for you to fetch changes up to 0d6281c5e9323d854340b8a456dadd86622ca911:

  media: venus: hfi_msgs.h: Replace one-element arrays with flexible-array members (2021-06-11 15:07:25 +0300)

----------------------------------------------------------------
Venus updates for v5.14 part2

----------------------------------------------------------------
Gustavo A. R. Silva (2):
      media: venus: hfi_cmds: Fix packet size calculation
      media: venus: hfi_msgs.h: Replace one-element arrays with flexible-array members

 drivers/media/platform/qcom/venus/hfi_cmds.c |  9 +++++----
 drivers/media/platform/qcom/venus/hfi_msgs.c | 16 ++++++++--------
 drivers/media/platform/qcom/venus/hfi_msgs.h |  6 ++++--
 3 files changed, 17 insertions(+), 14 deletions(-)
