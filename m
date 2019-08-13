Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A38038AF1F
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 08:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfHMGDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 02:03:49 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34596 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfHMGDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 02:03:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id x18so3985857ljh.1;
        Mon, 12 Aug 2019 23:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X3LohBWQzz+nkO6uwATrJjK4vhEv+WlLNCt19eK99Ys=;
        b=ON9+R1JDcozIC63qKrYvYO9xu1lfb1cjxt2ugMxfw5dGUjeB/lkNsF5oVAKSjQzCpj
         piq5Ly8DoTCnFOExyQUzgXIRIw2qctfAhVW0+msv0mgctWotGHXqkVmBUtGDfST0vVPm
         oTz3c0PS1JnMtPRgQVW5lLSnJ6ler3rOU4TmFVdpiGAy1Her6d7PCmjl+oK8zl3aSmCE
         SU8VW4RtqBwzA/RCoLgdkmQhapEWBClHgyD/nLbQBFrUl4EWE+IlF4WY6Xn1jWk7vDHx
         h4mdqfpxFJ3bRdU2J2qPTN9ptBKhm4vmsjxKqLcyWVmnbG1cshDzVOhw/VPFXTMhvPqT
         AJ4g==
X-Gm-Message-State: APjAAAVRBNQ9pVyV3wXYBsal0QJ9v+XWua9hbeHEQBVApc1rX7O3zeZs
        Pwsf03NHurOnCOOjEVB90HZWBOaGmb4=
X-Google-Smtp-Source: APXvYqx1MGRDP//FpYzmpvAUo8ccJ4FAI5jER2wa/AKGimn4yWKfNQsXByQAYv1UJPfiVGEvzotMcw==
X-Received: by 2002:a2e:9784:: with SMTP id y4mr9053049lji.209.1565676227100;
        Mon, 12 Aug 2019 23:03:47 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.googlemail.com with ESMTPSA id c14sm1220784lfm.42.2019.08.12.23.03.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 23:03:46 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     linux-kernel@vger.kernel.org
Cc:     Denis Efremov <efremov@linux.com>, joe@perches.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Subject: [PATCH] MAINTAINERS: hantro: Fix typo in a filepath
Date:   Tue, 13 Aug 2019 09:03:34 +0300
Message-Id: <20190813060334.12313-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo (s/platform//) in the directory path.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Fixes: a29add8c9bb2 ("media: rockchip/vpu: rename from rockchip to hantro")
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f31b852acdf3..2764e0872ebd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13755,7 +13755,7 @@ HANTRO VPU CODEC DRIVER
 M:	Ezequiel Garcia <ezequiel@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	drivers/staging/media/platform/hantro/
+F:	drivers/staging/media/hantro/
 F:	Documentation/devicetree/bindings/media/rockchip-vpu.txt
 
 ROCKER DRIVER
-- 
2.21.0

