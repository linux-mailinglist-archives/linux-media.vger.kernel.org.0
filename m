Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A382D3C7D
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 08:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgLIHr5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 02:47:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbgLIHrz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 02:47:55 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9AAC0613CF;
        Tue,  8 Dec 2020 23:47:14 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id b73so467363edf.13;
        Tue, 08 Dec 2020 23:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vUdxfkrGNNo1FQF9h31XnihJ3y4Ce36/DE99SxLOEN4=;
        b=bGrV5DiIZKcVT0Gqqw7i2bRWbLWwLyR6mnhe+fZmJTZ8Y51HGfViIKPBFFw9tSAWao
         L1U+AxUyCuqECRICZCdgrhQRLagai+A/HFjKWITuhjeTOHRDW6dY+yh8h0oYpDYFuN9R
         VBCkUMm8w6zj9TA2WYPhzssQ78984Y/AshzOl4n6fj/Poq08iKKzCl3q+xRYtbmOk8y6
         gAHj4R2I0ZO5b3oR40rap/7WLxnccrLAP6eGEjAxQWhcjayaqVFi9Q8WLCjh2C8zN6OZ
         HHAWmsyhyXz1ht5VeMymEP78/7NBuMRWwHB+Z2Q/ZKyK0CTbswU67a0eGqOYapsMWlsw
         1QlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vUdxfkrGNNo1FQF9h31XnihJ3y4Ce36/DE99SxLOEN4=;
        b=Qw9LN4rMsbLikqBc+D+F+sifIw9ZtlhP1ugb/PVy+83LkFfumYcoD67JtDCRNdDtXx
         LeHC+er8dOXvCFHTjNi4IwrSJw7WkuRUnZReaWAE5zsUQZGB8NoCMGascHdzfDdyC1jt
         YiC157hLsXxGrqDf1foTj2pqWiFcpG28x0o8tATIJ73MKba0D3Sp8TvdKj31AyxmCN/t
         92OBB91VtnjF/eqcU3x7ENzRcrjPodmHmydkbaSw1lFlQIZ9mBFG0jFXnU3IRJAvR54h
         JGxhc3Q8chE5cyTyhBGogxyLWqP9EsPlrcaSrWNJdMAhOJewWYw3CwBj2c43m3RK8zqy
         nTrA==
X-Gm-Message-State: AOAM5301lLXYnJM7g7rHFkJMlxLa6NgaOKtPm8V6ib3TX3BYBIuZ/V07
        8M8cKnLw1n5K2nX8Uk++uhE=
X-Google-Smtp-Source: ABdhPJzRUVwqvvYMGn7Q5wEQjFknCl0J9KFE+fWL45OvQrRbCU6SJw0LKaabiA09tJ4CdpmT2J/TQQ==
X-Received: by 2002:a05:6402:1d15:: with SMTP id dg21mr828807edb.280.1607500033479;
        Tue, 08 Dec 2020 23:47:13 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2db8:be00:8188:da9:1e3d:a30d])
        by smtp.gmail.com with ESMTPSA id eb14sm723692edb.20.2020.12.08.23.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 23:47:12 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] media: MAINTAINERS: correct entry in Amlogic GE2D driver section
Date:   Wed,  9 Dec 2020 08:46:58 +0100
Message-Id: <20201209074658.11557-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit aa821b2b9269 ("media: MAINTAINERS: Add myself as maintainer of the
Amlogic GE2D driver") introduced a new MAINTAINERS section, but the file
entry points to the wrong location.

Hence, ./scripts/get_maintainer.pl --self-test=patterns warns:

  warning: no file matches    F:    drivers/media/meson/ge2d/

Adjust the entry to the actual location of the driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies on next-20201208, not on current master

Neil, please ack.
Hans, Mauro, please pick this minor non-urgent fix-up for your -next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b20babb9f7b..d66bf50fc640 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11520,7 +11520,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
-F:	drivers/media/meson/ge2d/
+F:	drivers/media/platform/meson/ge2d/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
-- 
2.17.1

