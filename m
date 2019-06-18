Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B87454A67A
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbfFRQQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:16:34 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46727 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729349AbfFRQQc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:16:32 -0400
Received: by mail-lf1-f66.google.com with SMTP id z15so9720967lfh.13;
        Tue, 18 Jun 2019 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aTENqUuUBYWApOwcj0+zGB3BGdKRZd5T9KuuRhQDbmY=;
        b=I6YpZ7ZHtcm5hSQG8Ua8Wk6A17jxGMnINa6x35Dg3pjaH4olB+eTfdU91gEqRQ4usx
         37Rb2BLzEH0p3az3vtAy853J+c/TSaUfl33XhTazF1P472m6G5vnadBfxIEhsvQabg7C
         t3fM4ZMXkqa4wVPYII6Ov4bDwFjMfa/IZAUgXXegyOQururHVyQBa+uR38EKWozFcgx4
         w/XvcAbPHvbaDoz33K1Ay/0zVz8WE8gRIqgxsMTX5XKxn8s09arsAQrim9UQlGypDd/3
         kxWeu21912ZzDJHOO0FnRz7XoGlnLftGLTh6pKj238bknCCgGZDfsb2lMEw1RKEANVA3
         NYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTENqUuUBYWApOwcj0+zGB3BGdKRZd5T9KuuRhQDbmY=;
        b=HfkUiQV2NrlKI8b7yBHwNjKcISLo24DYfbEvqr6UsftIQJhE2f0WMswkeazHTvT6vv
         sbb8sNXX1yaTsdrajZwevE3V1fP0paY2nVlMxE5UVFnw7n9hrW1b26/W3iyxRltxZqrC
         Dj3ArvCd8Om4NMZKlAxLOPO/whiu1TkDc5hO6aeLBLW4obpvTM/ihxMFX2mrZ6HdUQVo
         lkYpIsyCBPFCwDBy0U1Lm7lW/iShQGu2N7PvzKmgIIqR9t5VafuiRORxnukE14WPEJlJ
         AGSbf5GwSAefpUDFQLv82OOLUWbsIBk010qcCEylmbvPwB5u2psjfFsoesHSxKl9UKnw
         lFXQ==
X-Gm-Message-State: APjAAAWLUQb7x0tQOJvByfcGgKTDn4UeVrlgiXdK1bPIWnC4M5qR1/ly
        LElAs444i35qw4qinbS9oK4=
X-Google-Smtp-Source: APXvYqzT3fMIiRDjxPt+eHvA9HGFNWma3wAcV+UAeLFcSuV0NFnHS8iEwi9nNF134e4XP7KGl7EHpw==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr39291949lfm.126.1560874589798;
        Tue, 18 Jun 2019 09:16:29 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id v15sm2273295lfd.53.2019.06.18.09.16.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:16:29 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: tegra30: Connect SMMU with Video Decoder Engine
Date:   Tue, 18 Jun 2019 19:14:52 +0300
Message-Id: <20190618161458.20499-2-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618161458.20499-1-digetx@gmail.com>
References: <20190618161458.20499-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable IOMMU support for the video decoder.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 934caa83c8db..ce162125e7bf 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -424,6 +424,7 @@
 		clocks = <&tegra_car TEGRA30_CLK_VDE>;
 		reset-names = "vde", "mc";
 		resets = <&tegra_car 61>, <&mc TEGRA30_MC_RESET_VDE>;
+		iommus = <&mc TEGRA_SWGROUP_VDE>;
 	};
 
 	apbmisc@70000800 {
-- 
2.22.0

