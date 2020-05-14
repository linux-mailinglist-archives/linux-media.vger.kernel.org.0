Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBE61D3F9E
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 23:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbgENVJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 17:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726201AbgENVJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 17:09:40 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1226C061A0E;
        Thu, 14 May 2020 14:09:39 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id o14so5124383ljp.4;
        Thu, 14 May 2020 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FmoIa0AdudNDzlTpZ0uiZDtdJ4Pgj1/DLge9mABr+4w=;
        b=m2eydK5TfbDdgIiR1qoaJyWjU/1xapfTY6oGjlexVUmxSSabO9gqLc9WTMyzQJpITB
         fWA7uSBy+kRiov7VdhjnIW/G7XIqLPg8vnRdwu8Ek6AAJcy1dBZAVNUIze8IwrxyMUx/
         Z4H0/SHYEfA6t9h4V0l+x56uowOHydj3fNFi8H+ysFas5VSU0QKAx3TjU+c5NkLpz3qj
         4nuAFNKkmzLiBBFrtsi4WRfpKI0w25q5MWlbx72LOqGAM90A1UMtfkUE/jE0H6jNkhEU
         nMEEL50QIXSspUMDfIHZnaf4KySCpup3aAZXd4Sfkt+Yd34s+4IoW5dW82APBhehs77j
         6Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FmoIa0AdudNDzlTpZ0uiZDtdJ4Pgj1/DLge9mABr+4w=;
        b=q992gi1cbTH+TBpkLOVMQG3b0c1qklVOrx/ddj7z1uJSO8I4AY/fgO3b2YAr34LzFU
         0+tXeMduRSE5hJg8dtYJSKP8eLzfzAnmaFlqLcO80xSu8xgpHNXJx9vC3jbhYxtF5Bk6
         yhKu8n2CV+kHEm+MsAh6dtCnt4sfrUo8zdf9Zjf/dFzQGp5/L4GL/v+D/j4jFGGVA1mD
         2zNqDLJzFacQy0Puo6HGsurTHJePE9ktZxxZK4Pid1T0lC7LD+GJdjapk1Z4IIoNbOFq
         lAeIeIXfJxhY0zztS/87Zu17a6+X4/FEPUiE+yrH2J08FfgfaGymsxq05HdHsdrMlsgr
         y06w==
X-Gm-Message-State: AOAM532OluziO9Yy/dQbppRVkrReD2/7z8C6L7Z/35D0goFwVLbqXKfh
        VaC5+pEsJup0mQAKv9sx73E=
X-Google-Smtp-Source: ABdhPJw3+tg4ZIkP0KD8isuSzsxGILoMKI+AxadyW6yCzc0e0wn6qyD7t0c7jWNSG1OzLhiEzNd/Bg==
X-Received: by 2002:a2e:6c08:: with SMTP id h8mr134750ljc.48.1589490578217;
        Thu, 14 May 2020 14:09:38 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id g3sm45215ljk.27.2020.05.14.14.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:09:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] media: staging: tegra-vde: Balance runtime PM use-count on resume failure
Date:   Fri, 15 May 2020 00:08:44 +0300
Message-Id: <20200514210847.9269-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200514210847.9269-1-digetx@gmail.com>
References: <20200514210847.9269-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RPM's use-count is getting incremented regardless of
pm_runtime_get_sync() success or fail. It's up to a driver how to
handle the failed RPM. In the case of VDE driver, the RPM's use-count
should be restored if runtime-resume fails.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index d3e63512a765..803e5dda4bb5 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -776,8 +776,10 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 		goto release_dpb_frames;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
 		goto unlock;
+	}
 
 	/*
 	 * We rely on the VDE registers reset value, otherwise VDE
-- 
2.26.0

