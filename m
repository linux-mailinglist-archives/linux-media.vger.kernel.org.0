Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B279DF2F4B
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 14:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbfKGN2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 08:28:22 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:43386 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfKGN2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 08:28:21 -0500
Received: by mail-lj1-f174.google.com with SMTP id y23so2254126ljh.10
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=GGoQwP2MTOZeTZsIVhhpDwzsnBc3ZqiYGfAy7/jV6+4=;
        b=qiVspviSW4UPwPwYuvB3con71tVNXb1gRDrcTxBm8MM/RmUC+IzR6lM2jRJAVwqFYX
         uzQ07fr7dD00pEGi4zkHFRi/ToOkmHIUrR8JaGVexgMpA9YK4RbiehAZjuLHfPhM+OeG
         SM0/1Me1VrBRjTi190k7Ele4gQvSz0B33y4ZgZ9Gx+eZRHLlA59i+DNLF6o//McckM9z
         bt6Oe3psT9RrwY7KCGewV0QZjMVteTmSTqTDnszMki24ElIZigY4W/jxHuQTUMlDe6BV
         +/LCGuDqPfFo9zfeZo2to3tzhxPRoRz//kgtDySKJHvNQ0uR36Tr5F1HtcZeyJKhuQwd
         38RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=GGoQwP2MTOZeTZsIVhhpDwzsnBc3ZqiYGfAy7/jV6+4=;
        b=lUrBLRN/SW3Ih78APZ2r1fRehru38xHHH57DQqfABbNfduyxK1ICuIoW36jwMgvPCU
         fHSDqIcNk/lhwkBOJvcTkop6YAE5dnU5yWOLc3dzvZ4WdzOxOIJVB6XXRcrnvi3VjAl4
         f8LFl0Agyt3iRE0oAE8SBYqBdrFbyDnSIBiPYIPcOjn4pOA9tdrM6dHFFlkUI2Io34Gx
         Y5SU136Ws6wk8WzJicpooTNnI2BO9BdJEC0dIYiUyDnC/e5rZijkZqjMM0SHqyddsvx0
         Xa78st/v/iKvHAQitdQdIRO+pK6ydR9vvoEYRYE60QncBQ7Mds5gKHy5KmljEVMhuJa6
         lC9A==
X-Gm-Message-State: APjAAAWZvWBVS0rsIKcLYuigkxDPEv9DHJN3UR9irnPefLARuxovot34
        xWpc1g2PwnMQjLjDeMSD+0EXmsZXmEXG+A==
X-Google-Smtp-Source: APXvYqygBKMo/EyyKtDILFqIyPGsEzpeFUzcZ3GwXQFIKu/zCu+wj6CzT7YUYduhJBX6ndwQbHzH0A==
X-Received: by 2002:a2e:5415:: with SMTP id i21mr2548620ljb.190.1573133298794;
        Thu, 07 Nov 2019 05:28:18 -0800 (PST)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id p8sm1205912ljn.0.2019.11.07.05.28.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:28:18 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.5] Venus fixes
Date:   Thu,  7 Nov 2019 15:27:59 +0200
Message-Id: <20191107132759.17456-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is one fix from Arnd about incorrect compat_ioctl32 handler usage.

If not too late, please pull.

regards,
Stan

The following changes since commit d065070e009b0c0b2ab4ee09972a41b072f6ed54:

  media: hi556: Add support for Hi-556 sensor (2019-11-05 09:12:49 -0300)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.5-fixes

for you to fetch changes up to 5359b308ee46c27f3fffb66c054b442d94e047d5:

  media: venus: remove invalid compat_ioctl32 handler (2019-11-07 15:13:39 +0200)

----------------------------------------------------------------
Venus fix for v5.5

----------------------------------------------------------------
Arnd Bergmann (1):
      media: venus: remove invalid compat_ioctl32 handler

 drivers/media/platform/qcom/venus/vdec.c | 3 ---
 drivers/media/platform/qcom/venus/venc.c | 3 ---
 2 files changed, 6 deletions(-)
