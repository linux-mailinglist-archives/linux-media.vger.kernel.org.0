Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5529D3252A
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 23:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfFBVop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jun 2019 17:44:45 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33006 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727280AbfFBVoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jun 2019 17:44:44 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so11992299lfe.0;
        Sun, 02 Jun 2019 14:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EVmQkoTAtbSGz8C5vVTv+5eh4peJMnUA2MLQgpMIP48=;
        b=ODE6HVswqASv/8MHLNNVMTknWBFsToE5l5DuqQqD60wHIASyfXULoZfZfXz0lovBSt
         tL59iUut7CyXH7+uB7Kcs3oOLaHzuMnWKnSYa+oFyPTZKRh6OWbay3BYeQEmoIcHr07I
         U0/nbicuEP5XCZkIlaB46gLb5DJe+gTXyuQ0SKQ6HF0QEsrrGsg4PBGAx2OXLXqJjhP0
         Rbc1FOyyXUzYGmCwUe/NkNDf6+hLBh4+tr5RK6LsRga2tMeAlyjE5eh4rMErcpLWR9X5
         p2GegBXqLqB8qTg3gLp2bMGFWLjVBHypTxX9rZNNvRdwus8TA1k6ybvOT9A9iyRTfB9b
         lFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EVmQkoTAtbSGz8C5vVTv+5eh4peJMnUA2MLQgpMIP48=;
        b=dLZ48X3siaSEIMHY+rOw7O1LG6k6pWu42vKye8cv70VyazLO8fk6Ntga8S54GHAy87
         /e3apOOfhoWXu0BnvApy89VW8okWhYaKzTODiIuoHVENt/qsQONdkuBoPC9yqthd+E44
         0x7Xe7+gfaVAVdJ+SRrqMd5xPWon2AYx1FD80UiI0s2ow6xFP/EmtlUXyTao9LmBLovR
         Qxd5xmCO4UGnX5vev69AF2sKjAvz7hJvqcGHI1MLURq4EVOajGqn9Zx609/t01D2zNay
         wNccyR540WXIEpuHjLVf/ecqnT8O8Vyttxvc34eVi0LEK+Rxw1sRqWF0zNfx9JPd5f2k
         1ZYA==
X-Gm-Message-State: APjAAAUc4h2yioHxIje60uuxtPPxlcX5tYFvwjHJmNWNCslfEHXx7nu0
        tQnMAIHcD9pdQ8PJtQPqU1o=
X-Google-Smtp-Source: APXvYqx43mgUsonku8U4xCwRz+Waor0UBA5wsvncuJZFNszf6Ml5SNN2LJdbs8R8RgeJ6H0yTG7hQQ==
X-Received: by 2002:a19:5515:: with SMTP id n21mr5688898lfe.26.1559511881959;
        Sun, 02 Jun 2019 14:44:41 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
        by smtp.gmail.com with ESMTPSA id g22sm2803653lje.43.2019.06.02.14.44.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 14:44:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] staging: media: tegra-vde: Remove BIT() macro from UAPI header
Date:   Mon,  3 Jun 2019 00:37:09 +0300
Message-Id: <20190602213712.26857-5-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190602213712.26857-1-digetx@gmail.com>
References: <20190602213712.26857-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The BIT macro isn't available in userspace. Checkpatch complains about
shifts being used instead of the macro and people are starting to send
patches without realizing that it's a UAPI header file. Hence let's
replace the BIT macro with a hex values to make everyone happy.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/uapi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/uapi.h b/drivers/staging/media/tegra-vde/uapi.h
index a0dad1ed94ef..dd3e4a8c9f7e 100644
--- a/drivers/staging/media/tegra-vde/uapi.h
+++ b/drivers/staging/media/tegra-vde/uapi.h
@@ -6,8 +6,8 @@
 #include <linux/types.h>
 #include <asm/ioctl.h>
 
-#define FLAG_B_FRAME		BIT(0)
-#define FLAG_REFERENCE		BIT(1)
+#define FLAG_B_FRAME		0x1
+#define FLAG_REFERENCE		0x2
 
 struct tegra_vde_h264_frame {
 	__s32 y_fd;
-- 
2.21.0

