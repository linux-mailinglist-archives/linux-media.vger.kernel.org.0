Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 109804A697
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbfFRQRA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:17:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34258 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729496AbfFRQQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:16:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id p17so176367ljg.1;
        Tue, 18 Jun 2019 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fiDbgWSuMaVMjc324RSS41lxTRe5uMme7Lnt8EdVzLs=;
        b=OqbFvTiP3qFRvTdrI+qWbkQB4HGZushXrOtI04RqNu3nkaUX/ziogPybWa/uaQ6jnx
         hzGLSK4FI809qkO3bu+Kl48b5Cupwda0ypWaGgmsBoSitfD0pKKe435TiaXsj5zxg14Y
         vAikyUoeop3BStqr4gB5HJ2MpYWZ3gYZuPF/66I3Fs1nsdR3EBqGxMmpqcDuXcRfjO+1
         b6TfFHqrmwBY5cnBh7xajMzhZ6/lsQ7vb8BiB4IbqsQAIF5yhabKLr6v/nPLfMZML80e
         hOI2nXeidbP+PiB+gZVk47PtuAEzSOMz4sk3to3btLHN+CEpbIlOzGMkctS7Umm79am0
         6DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fiDbgWSuMaVMjc324RSS41lxTRe5uMme7Lnt8EdVzLs=;
        b=X9XEnNIQrOC/VAB7Lcvaty8s/1DEAusUdN5fW/swzXtkmzJJccRNDud22x3buk3HXo
         nhgyRgv70HO/95RY541hzth8eGZXIBToufbEw4DeL4tR6jbsY+yVpugBfwmfFz/VIf1a
         3CXgT6wzDaKMe0uhdcKBlXQJX3riTGDzkc/32IsXRdm7kUR+J4KU/f1Z49Ec8sGgekAo
         F+yNHrE5E3lqRpjbnQBH2To/1NBtnAfVGzkYcINNk6/YFZKt38cETfkkosoDkefAyyCm
         CqZoW1l/I2RpRM10FpeqxF0Pczcnknj6C1KcCPHNY23TT/UWkS/1SUPUyXwg45refhfV
         gRUg==
X-Gm-Message-State: APjAAAUCGukJ3W9UZ4YikzA0ZEp1W6mfgAYMThtUX3QZ9DtdNsLYn5Ob
        XYMa5c7vDsPz88gGvqCwEWg=
X-Google-Smtp-Source: APXvYqz1g5qDjpXCaRuXHc43SAtsUCYLwQipqckqG2izu5e3CqXn9H0HQ88Sl5Ka3eu0crkgsNXsAA==
X-Received: by 2002:a2e:9b48:: with SMTP id o8mr16355885ljj.122.1560874592102;
        Tue, 18 Jun 2019 09:16:32 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id v15sm2273295lfd.53.2019.06.18.09.16.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:16:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: dt: bindings: tegra-vde: Document new optional IOMMU property
Date:   Tue, 18 Jun 2019 19:14:54 +0300
Message-Id: <20190618161458.20499-4-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618161458.20499-1-digetx@gmail.com>
References: <20190618161458.20499-1-digetx@gmail.com>
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

