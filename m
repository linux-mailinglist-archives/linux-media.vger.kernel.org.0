Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD5B4FD26
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2019 19:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfFWRIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jun 2019 13:08:12 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37746 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfFWRIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jun 2019 13:08:11 -0400
Received: by mail-qt1-f194.google.com with SMTP id y57so12145070qtk.4;
        Sun, 23 Jun 2019 10:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u8j+gY+lvxiLMiVq2zvKmW4bjPZpe9aVk5fhjHnMcdE=;
        b=vNSunVmJn0bvRABXMHgvwOlj8bAqmZQM0F7Jm0Tq6D1JvC8mlrP06Lq/P+9cnvWdaE
         dJhov6W48LaSQYqyF4WLwj3ChkZSNdqleqvv+K04Ju+1ykxPRouCiGvZNQpOziUMqOd9
         N6xp8ZOHnPWZuAlTvAr3UHG5iuaLLXd1aR2dAfSv2c2WEb/G8Rgzw9ZAV65PxH39ZTQ4
         vAZIsWFANgeZLjersfbF7IvaTJJ3cU/CUXdgbyPNArhYuA8TdQbGIdjXAFXZK/7GsPyw
         TceJSLAFbHclv/QoB2HsECf34ckk1iCvbAJ0jt4dcDWUkNQA4fVgcAA3BydYzabO5yWk
         d17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u8j+gY+lvxiLMiVq2zvKmW4bjPZpe9aVk5fhjHnMcdE=;
        b=p3wEKmVflBxzjfkCBf16SCfhd1FIgBhPbj3+KoscB3JahsnniHGmeVpQI9chxmrT8F
         falBqz6oBnC53t6t0OVFtKJUaNbtsAqkoHvYtom+Lv/uIa0nYdaXiJKWUM0yqeWz1Wu6
         Qj/Afs1JQYwav7BAJJpOSqPOcySqPim+WCF0IjMsh1nTjDgdwc9fzjc6pUrQdDb9x9Z+
         O1XSTPXUizIHnKKbdz2xyCfmpK4Fsqs55Ls+KCk57o826yA6cHP/HBsCGf8QeEUty5gJ
         fH2kpv18R2mn9c+pUu1H5AqpqZzinP+L4nOvxE9BFQYRcMQTyxUde7cePKdCcIK93DFx
         b1hg==
X-Gm-Message-State: APjAAAX5C9+OXJadoQ6XPd+KeJtPFuAtDL5NDeDcmv3rLAX1Qc/kJ68S
        4oyAhav18j+al3ozrzLHwZQ=
X-Google-Smtp-Source: APXvYqwJYuTMadc7GyOVUeKxkfcM3kGUaIfoi0ekGeaCpPinhnaaKqcWzBt/h373X5kQlj5kah6+6g==
X-Received: by 2002:ac8:2646:: with SMTP id v6mr105329680qtv.205.1561309690693;
        Sun, 23 Jun 2019 10:08:10 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id o54sm5790756qtb.63.2019.06.23.10.08.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 10:08:10 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: dt: bindings: tegra-vde: Document new optional IOMMU property
Date:   Sun, 23 Jun 2019 20:07:26 +0300
Message-Id: <20190623170730.5095-4-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190623170730.5095-1-digetx@gmail.com>
References: <20190623170730.5095-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All NVIDIA Tegra SoC generations provide IOMMU support for the video
decoder engine. Document new optional device-tree property that connects
VDE with the IOMMU provider.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

No changes since v1.

 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
index 7302e949e662..602169b8aa19 100644
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
@@ -35,6 +35,7 @@ Optional properties:
 - resets : Must contain an entry for each entry in reset-names.
 - reset-names : Must include the following entries:
   - mc
+- iommus: Must contain phandle to the IOMMU device node.
 
 Example:
 
@@ -59,4 +60,5 @@ video-codec@6001a000 {
 	clocks = <&tegra_car TEGRA20_CLK_VDE>;
 	reset-names = "vde", "mc";
 	resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
+	iommus = <&mc TEGRA_SWGROUP_VDE>;
 };
-- 
2.22.0

