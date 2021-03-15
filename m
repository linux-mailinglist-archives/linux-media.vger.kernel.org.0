Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA9733C102
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbhCOQCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233558AbhCOQCi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:02:38 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90007C061762
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:02:37 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id mj10so67144953ejb.5
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sy2bZus16dofEKB/QtcILEdhFBYpFlUOJR+nGtFHbaM=;
        b=aDF/My9OnyBl4iF+Q22ShwiJJFXeDL18tEPKwSO90KdkocSKfR9RgeWKJxaF188oJu
         WTGrwMlu+JYoJT6P0UP99csCbcRSikeXHSOQY7dA0vzdzn/WV7sE7AVzf8x7zAtDiAr7
         T0c419UG/HdTHd+SboDqHpU/YqWJ6wwjyGKkFKstx3kb7Siw//c1gtg3/P9J4NTsrWsv
         yhtAlCE6Ib9BxuI5HqsfQJuzkHaizEtNmLISm9dBkHWu5gBnkjBG+IBjOG+G+YAqEqGr
         N1fVFRupS2jNgK6Jd6ywAi0fkHWvcEkdFHmBLHsljjuh5/NmtropVSrTA1rTruIInQrn
         tAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sy2bZus16dofEKB/QtcILEdhFBYpFlUOJR+nGtFHbaM=;
        b=pPe2k8F4cBpU8xI6IHXkO8fBrYrvQyftvIBO76NtXtOcgKP6O8raXrtNNjRRh+4ZVs
         bim6+iqxq8zmquinjHemOdNLyhxd0+aCWv0eA6Ao6wPSLKcfO/bzy0T+luMvoF4fQbBQ
         u4r+Fy2bB1tiL/SZBkg4qz2nULdlcoXDLgqzxqEjUuwLVIVYvvsb+cJUmQBJ39bpOR+5
         nxdl52baIkWwG0yw6XG8v/5bbvZz/KEevIoq0fKIPrx5OytVJPakNlx5IJrofVZSBjJG
         W/B1IV8YroIkX2CsFBjRsfGlygmb6v0LQUUlBkTOcckls846tVxS6GBXlTVdSLQ8degN
         DHkw==
X-Gm-Message-State: AOAM533j4eyuyeKyYrFKSgyc0gQFriYbqK4AD1+dJgn4s+mpz1+m0Ixj
        GwaU3iAMoxBz4USuEKqxzPSpLw==
X-Google-Smtp-Source: ABdhPJy1AGl86LPFSdKTJH+giQaM/euwwKmbRrY+jpti2QIE7Fle7Xv40g7taDDCjsbOjxuvdQcg6g==
X-Received: by 2002:a17:906:90d8:: with SMTP id v24mr24026571ejw.547.1615824156227;
        Mon, 15 Mar 2021 09:02:36 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:02:35 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 18/22] MAINTAINERS: Change CAMSS documentation to use dtschema bindings
Date:   Mon, 15 Mar 2021 16:59:43 +0100
Message-Id: <20210315155942.640889-19-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Due to the complexity of describing multiple hardware generations
in one document, switch to using separate dt-bindings.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---


Changes since v4:
 - Rob: Added r-b


 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..7da3e0c74fab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14787,7 +14787,7 @@ M:	Todor Tomov <todor.too@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-F:	Documentation/devicetree/bindings/media/qcom,camss.txt
+F:	Documentation/devicetree/bindings/media/*camss*
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
-- 
2.27.0

