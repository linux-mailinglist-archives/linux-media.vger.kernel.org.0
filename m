Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D9D1CE477
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 21:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731501AbgEKT3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 15:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731353AbgEKT27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 15:28:59 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FC5C061A0C;
        Mon, 11 May 2020 12:28:59 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k1so12462812wrx.4;
        Mon, 11 May 2020 12:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZAtH0faIljYlKbUs4LOqwPvsHvq1UMeElD7Sjj/OCPg=;
        b=eSLzEC3SAsl3cXTDCPbtCGyX8b2dFryfRulWYzicOAsqusDu34FRZwOuHH8HUh0qBI
         XuQumhjFb9KdzljstM2R5RpVmMwrhlQj2RVC6Ada+RHuVbMZ0IPfH+d4DZh+X9V/Ppnq
         YisCkeowg2JpZIpfvSzft5Sb0pHA8TuG6pQyRvkbDMaBRv4hvL36txLFMflZ8J+XAPqL
         FylG7Ts6DqwWevPNj80HwojO2onvzq3dWqgtWiBTmVrxmunF66B0/62AoV4+dzl5r7cv
         Ab8B2Sxi5nsVHLq9W4zBpFtrdW4NyVjRt5JJcvc1rO6RsHZmEUzSgGtSk9tVTY/T4LG+
         9oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZAtH0faIljYlKbUs4LOqwPvsHvq1UMeElD7Sjj/OCPg=;
        b=QG2qnpcfbV5lHkvqOtBE4E+Ria0WZd1y8HxGNnDgLQ7YihHRnjkCGGq7C7zmcfts9e
         B/px4bZZIqJSiOjX4FAvH9QebmZHiuQ+T9h05EKu2LxfiGDxVEwDaPNbqe0UBq6yooy6
         xgK8W+gfmAHaNpUB12Fcdd471SgW0/eCW4RjTokNrZE+A1kvlQFjRfLqPSbMjLecZDbI
         STEgj6TQs4n9iRhrdcLl/49+x/eumSZRjmXaPxGXnuNccphEwooyV3qCpRTGnMGouSSz
         P+GEa1cgrRf9GOtvLemKPr6HUPBNwvn0pOujeN+BuKJ8jztkIp5S14WJW1LWORWlNHTE
         w25g==
X-Gm-Message-State: AGi0Pub3/oAGfHUuWFArlxk/BrJ70iVbSMI37FNT9cSmKFECCP2X4KGr
        GqeLwNvERcyp6ENHIBy+/0c=
X-Google-Smtp-Source: APiQypL550SiDakiWSzBnEQgDEpmGUtS2Kxf+BKvqRsSGWbsDn8qXbb87i4v281xXMYsGjt4jNmqOA==
X-Received: by 2002:a5d:4008:: with SMTP id n8mr7444252wrp.82.1589225338114;
        Mon, 11 May 2020 12:28:58 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dce:7200:7930:ad7c:21cb:6736])
        by smtp.gmail.com with ESMTPSA id u9sm7218846wmb.19.2020.05.11.12.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 12:28:57 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: correct path in TEGRA VIDEO DRIVER
Date:   Mon, 11 May 2020 21:28:44 +0200
Message-Id: <20200511192844.11044-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver") added
the driver to drivers/staging/media/tegra-video/, but commit 2c6b617f2cca
("MAINTAINERS: Add Tegra Video driver section") added a file entry
referring to drivers/staging/media/tegra/.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:  drivers/staging/media/tegra/

Adjust the file entry in TEGRA VIDEO DRIVER to the correct path.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Sowjanya, please ack this minor patch.

applies cleanly on next-20200511

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0abba1aff1ae..dd310f1c3bb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16679,7 +16679,7 @@ L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
-F:	drivers/staging/media/tegra/
+F:	drivers/staging/media/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo@nvidia.com>
-- 
2.17.1

