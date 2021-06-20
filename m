Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9A63AE016
	for <lists+linux-media@lfdr.de>; Sun, 20 Jun 2021 21:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhFTTrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 15:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhFTTrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 15:47:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21387C061574;
        Sun, 20 Jun 2021 12:44:59 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a11so13398732lfg.11;
        Sun, 20 Jun 2021 12:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7p5HEGqVeMErSYe7rEIAAwOp1ZmyshLqSPpzV13r4lI=;
        b=C/0EPLb+pY6Fnyoz17LGQrhKk8Ipq/PIUAZ3z3XPf4UKwuxTAsb+dOLIes9ax6Sl4/
         KDq07cjwsTMkfw9Qh6X19svGo2m4XP9cTfksmSniAtV2wfLpLR0McJ0dfcJBSa8Efi3U
         TUzzHkwWvOFwQAx/oW+1hKsVKe04ugRSctc1RLtOWn2FiqY2kFmrac+0+JHM7wX/rojM
         W2zwhEBLLX6MPjB5p/nMy7q3u/BiRwBRhUvVEepkdvp9ITnHRE/33OSD4iV7TTidfAO0
         IhxgBmt9oaxmu+8YvDPGneX4sOcGhIqeHWGN6palFh0+e2HI4Em/VrmhbMLIktM4sWZ3
         VkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7p5HEGqVeMErSYe7rEIAAwOp1ZmyshLqSPpzV13r4lI=;
        b=AJS4/IeVEg5sIIVYOV+etQ+2erH56BkD58S09QUJAqxzVvY6aLbOy0wxPP4azlXz3A
         tikD5zO3md6UuY8UNKZdO+P+HsZOZ8kxDrpaCnKm599dwjkP+iduzL6d5xaLY1N4AE4c
         pJn3B4VTlp7dbj+GQYD6hL6UD8eEhhidTjmOeGWKY6iTmUUi71Jd1es+diCCatTTNaYD
         2SmRpCJ+27c/8x4fATOmsGQUeeRvJz+VSSC6kzXQCIxCm3AYPZ5r2uUmsadocABTHmM9
         lnlTOSUBjBv2WQX0Ow9fjNnigkgDHVYlmim+NrRgV2jtdqnmhp4vavDhKVtWVOSdJYcO
         gLRg==
X-Gm-Message-State: AOAM5330xadTynprkpR4Yv5fYhXDaja588y5kigAZz3A8UKtg1WxRW2K
        DSaIeXJQLsH7OWi+Bh3aV6Q=
X-Google-Smtp-Source: ABdhPJzg4aw3Q5wWLo8BCL/I3aIxrBqjsNilTKEzaHAcKxlO04p5AWoaCfyrUgcC7Bs0QPQ1IFNuyw==
X-Received: by 2002:a19:ed14:: with SMTP id y20mr11583264lfy.479.1624218297302;
        Sun, 20 Jun 2021 12:44:57 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
        by smtp.gmail.com with ESMTPSA id d23sm1620195lfe.183.2021.06.20.12.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 12:44:56 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org, oneukum@suse.com,
        gregkh@suse.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 0/2] media: go7007: code improvment and bug fixes
Date:   Sun, 20 Jun 2021 22:44:33 +0300
Message-Id: <cover.1624217907.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In this patch series, I fixed memory leak reported by my
local syzkaller instance and increased go7007_alloc() execution
speed by removing reduntant zeroing members in kzalloc allocated
structure.


Pavel Skripkin (2):
  media: go7007: fix memory leak in go7007_usb_probe
  media: go7007: remove redundant initialization

 drivers/media/usb/go7007/go7007-driver.c | 26 ------------------------
 drivers/media/usb/go7007/go7007-usb.c    |  2 +-
 2 files changed, 1 insertion(+), 27 deletions(-)

-- 
2.32.0

