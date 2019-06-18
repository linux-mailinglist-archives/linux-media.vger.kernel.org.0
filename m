Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79C274A691
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbfFRQQy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:16:54 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38074 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729944AbfFRQQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:16:35 -0400
Received: by mail-lf1-f66.google.com with SMTP id b11so9762479lfa.5;
        Tue, 18 Jun 2019 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DEscWWmNyD0k1ManLTEItc70FqDRXwSTSIeyQ9TNq+o=;
        b=sP0ZpqgE7TSMhmWql3yXbKjkL086dnp1c502sLka4psezPG0DAXYrXs4NB1KeP/ows
         /1N1nri6UKNxjvJu+19Kk4jMgo+rORREEiT6yrLucnskgRS4AjgBwJrkqKnmnehlHbWe
         jhj2y38S+avV/HWBDD4sAUX1DwSa4Txp4dZK5clmVUHMTZRfUSrCw5PgUmjrjlOYOQcC
         47JPgLIhLx7cxWPx7EJpxa2AHnd+8Nu/lrIQ0GbI/SGyff3sv+SWMgCpibZlibT8XRPe
         hQ9cRvx9ZPJJdvhN1rEBFZb9OsrD7Nr33EF1WVO5wM5NNsmG9QzvJUcDv1XeTrEj8Rur
         2X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DEscWWmNyD0k1ManLTEItc70FqDRXwSTSIeyQ9TNq+o=;
        b=OAw1TyNkI8pDuYqlrx+Ut05vwlBeAkiy3PH4h1/K7GgXCDCDm1cTcu+SeXzSMLekXs
         l5W41Z9mQ7+TAAw9jzth0TUXjL56KHWDrxI3jwKW+W26AeD9xdtZ3JVPCPvZ94ochjJJ
         ik26angOhYXHwLkea6TMvh6oHyA3w97K2Guaj8S0ObGNwdEy/hM6z5gRrbkNtqz7QEdq
         abhv8zE/tCycBPsZTe9Z/+1h1pTTTdYZ/UUPXipKiPWLzGD8D52FMmHa4zxYAhHnrHf0
         kdPUR9ojFL1VkfKLXwv5evX5czu1vVxyRADVYaid8LcuAH3uJmlNUUNYLaiDQeJqaUQA
         8x9A==
X-Gm-Message-State: APjAAAXPV/X36q3hNhX8rRuFArEi9B1oO2HmiVXCu20mHtJdGlk8+bA2
        +AKA3ReJD1cmpI4A+oKkUSQ=
X-Google-Smtp-Source: APXvYqyGhZlg1tcRhT4vaOFsvvBcBXgVwTTd2e98SqkQxN43+IjhfrTR1Twx7sKmqWxKEdJFoG40NQ==
X-Received: by 2002:a19:4bc5:: with SMTP id y188mr59327041lfa.113.1560874593085;
        Tue, 18 Jun 2019 09:16:33 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id v15sm2273295lfd.53.2019.06.18.09.16.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:16:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] staging: media: tegra-vde: Remove BIT() macro from UAPI header
Date:   Tue, 18 Jun 2019 19:14:55 +0300
Message-Id: <20190618161458.20499-5-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618161458.20499-1-digetx@gmail.com>
References: <20190618161458.20499-1-digetx@gmail.com>
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
2.22.0

