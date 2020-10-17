Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF15291233
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 16:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438243AbgJQOKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Oct 2020 10:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438239AbgJQOKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Oct 2020 10:10:32 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97438C061755;
        Sat, 17 Oct 2020 07:10:31 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j136so8400541wmj.2;
        Sat, 17 Oct 2020 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UE3RLlL10pqYyRi2N3aJLlwbDv7Ywr80F64lqhdTvA8=;
        b=Dh2Wmho6xmOYI1wHokhWW1N/0ytjKp0InhWJX2rmXhP4dnjGTu57lqt5dHEJSIPE9+
         /F7eyz85fs0aFMHGJGXyPhhqMTVTHE63HPE7ktlLMYlTrCLYnf321ydxoNyWUX/JKUVg
         dbKi8wSTmkw085CZz+hktqRwvlSlFemVfcIdQ0zhgDFhb+oIR7afzbc0HfjxQkH65xYF
         /eECbuCJgtZqC1RjSI8K94aj6dDPfT+x+jUgx+ykLVyfKiOncmVp6PZAV0KWzrKiviGd
         aGT2kyMGRoKLz9LPXBSreCAQZPPmVoUFfOBOq0tjXweu1vZcz5ZlA3TSoTYz6WWtftS+
         q0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UE3RLlL10pqYyRi2N3aJLlwbDv7Ywr80F64lqhdTvA8=;
        b=j+u5g18DaPnziMVyh/3xZVmUYUwF3RhCHOOlRhXI8PFV00WYyxr77/nuB3fSJx0aKx
         wjUp/2PIjRUsBvOOexer1/8cA5lnic0/v6tZXt3d9NyMYh75j/yOAu3ThHa/h2yr6zKq
         Nz1xUzHC4zJ9R9RbNKpSHeiQwuV4CAMrwGMvUrEG91rL8t6pCK9VVI2FtcAeiu9FTusa
         +yiyyFpVCVM6wedLJY8p2xMKNP+OKsuKeKGTRRmtO9ypdr9yL1tvn7yDNv09y5fDzG5E
         x1/4ZW4wqi0Yx5zrl/E0fHb058uO7R3YZHMHJAPdBkYsQPvpo5un1E9iR2GT/B4Y7ft8
         Vshw==
X-Gm-Message-State: AOAM531zb4vhxuyKxhzYBgZvkwby6Qm1wlIBZ8uHb9NAtwaZva1uSzY2
        mHGrKRd3gRFbukWM3X3b5Ts=
X-Google-Smtp-Source: ABdhPJym6zkmCOL7hTCK8kj6JtKjwdSJKnKyDLmkBCtLQaBMLNGi2QRCoIRsNCQaeggxUT0Q3xuzGA==
X-Received: by 2002:a1c:3cd7:: with SMTP id j206mr8681778wma.55.1602943830292;
        Sat, 17 Oct 2020 07:10:30 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id i33sm9130623wri.79.2020.10.17.07.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 07:10:29 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
To:     mchehab@kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Fixes and cleanups for atomisp
Date:   Sat, 17 Oct 2020 15:09:42 +0100
Message-Id: <20201017140950.15989-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

I'm reposting this series [1] as, following the merge window, it now
cleanly applies to both Linus' tree and to linux-next. I've made a minor
fix to patch #1 (see patch for details) but the other two patches have
just been rebased.

Best,
Alex

[1] See https://lore.kernel.org/lkml/20200921215359.45003-1-alex.dewar90@gmail.com/


