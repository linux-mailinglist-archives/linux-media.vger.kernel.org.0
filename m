Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D518E467FBA
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 23:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383355AbhLCWQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 17:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383349AbhLCWQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 17:16:30 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A4DC061354
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 14:13:05 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d9so8593392wrw.4
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 14:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BkllAYoHT1d4g58oaIBTjo78DyD65U3ROTueHEEQZhQ=;
        b=FjK++mnR9PvSGFJgiP0o7w967KMdAcc1KjlwuFOTQfk4XQqFelgdieP9seyMtVhby4
         d8T7Lk0/J8aq+XRuXKWzoRaDr6Tmv/apeir/xoyLW/2Wt+eZw3YfRIo1ddtY6puvIQXL
         YuWf+fpAUK/oAMzbn1Oqeg6QBTv/TvwVbTVRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BkllAYoHT1d4g58oaIBTjo78DyD65U3ROTueHEEQZhQ=;
        b=qr1U51BAjkmiDiLjyKvu97E4s9ClW0daMmDf2JxvY0PZahtN3FRdTT1cG9cPknO6qh
         lKCv/xaH+P83wualfAY+1vZhdDRBtk0JREsKrgU6KiIKzJ8NSjyH0Nvk2kZk22xCE5jR
         qK2rJigrtRe5/7tZVTrzUELdg+DwJA14ywIngIMvpmAELfNYPIvVvJo+PpX0lWRgaBc3
         H9s/F4dTr4CJQC7THkQzdwzO1tViaEk0xIIxZ1M1gMaIKL6zdw0iZ3ocptmEU9V1sOUo
         FCgwhrl1dkvt7PkmklKN/Yr9gaJPgXs2sSaoFkHBoy38FEf54OPaZrSLmFZ9p+khTtk8
         K1lw==
X-Gm-Message-State: AOAM531Zj3x/ACcYEFmEOvXbh+eD8l3nICVrAycpVxmmAafab2p6hTcI
        ZRKdqP4/pn6/SBv9LVJQCJZIBp1OHugcIA==
X-Google-Smtp-Source: ABdhPJzcKz67zXGWosjO4fnGnxRbVFm6Zf36UDClsHEmAeIwVdnpHtuidyqtKlxCWvRVPfODVUeUdw==
X-Received: by 2002:a05:6000:1869:: with SMTP id d9mr23586676wri.416.1638569583764;
        Fri, 03 Dec 2021 14:13:03 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id f7sm7849710wmg.6.2021.12.03.14.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 14:13:03 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH 3/5] adds ovm6211 entry to Makefile
Date:   Sat,  4 Dec 2021 00:12:45 +0200
Message-Id: <20211203221247.46324-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203221247.46324-1-petko.manolov@konsulko.com>
References: <20211203221247.46324-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/staging/media/i2c/Makefile | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 drivers/staging/media/i2c/Makefile

diff --git a/drivers/staging/media/i2c/Makefile b/drivers/staging/media/i2c/Makefile
new file mode 100644
index 000000000000..4d6f2956b3f1
--- /dev/null
+++ b/drivers/staging/media/i2c/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_VIDEO_OVM6211) += ovm6211.o
-- 
2.30.2

