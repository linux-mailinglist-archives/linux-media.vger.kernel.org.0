Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984EF2ECE1E
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbhAGKsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 05:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAGKsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 05:48:15 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0131BC0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 02:47:35 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c124so4745746wma.5
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 02:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bS+vhAr9OyNDy63R+BmmS5C+XOX+43iUswKsMjwBylg=;
        b=ti18d5XkLr6r5zd1gC5uzLgTDfUwFPHpHalX6H+JL92xleDu0Fg1/OFzUa7fovjW+h
         eDO52hStBgUMXR/5yYR4CokBSeI6UNypd9WhOBsnBnbIdTc+rH8Utl2fKtYeYgvM7xVl
         HsXZcHJqK/ShBXELSX4pwcxv423s/tJ5mzQXjsMfDbLxuIrinst+Fm3whkhbKuEHIzIv
         KkVZ6iVVPjs/j5LE7YUX61MXbRTuB8MVWGxYt+XflxjQh4Ut6mqTQH15I+Nm+Iq4XgdP
         LVqC5QEq0PMPjqqRqH6mjTNzb68nJCu74/Fe30w9IfGC3iHtsME0vu8Ejy/Ea+++Vtjn
         0bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bS+vhAr9OyNDy63R+BmmS5C+XOX+43iUswKsMjwBylg=;
        b=mJCsRo3e2kz4fpT1lYuZXMyC3el0fYAG2B+avJ4rlv4d1fw7fZxDRxoZ4uwbfJ+ITh
         YalAQ1smF4T0jWipOoFJ7MiiBed6KQpUsAa8EH84M2Pw4IXC08ttfE1mvg2TWJ3DA68r
         2GBoi4vyVdCFLCu0DLj//+p903lmgGGG/h7CEVKbGNUBbA/MElkE5N3yi+RML05UYFS8
         Mr12jtD8v3J/FwhrCco37Nptxx2tPX8ch6OecXPRR6u4kPfOAqFhWdse9WGkmYceSc1j
         +k6B9KUnt//j3wYCPr/Gji7Y9snCyZxSd4j9JGk/oXA98laLwanVx9nnd9p8aPWqJlYT
         Iwag==
X-Gm-Message-State: AOAM5330GfOoUZ2hKxRKpBoQEXiTbWuJ+/n9nK6iopO1Nu2Rjhr9Le7/
        McBgahEVyljDrlpBv3Jzy17Hzg==
X-Google-Smtp-Source: ABdhPJyJZb+k2r1YITMPGd3KN7G/BAtSMF3WAwiTvWvYz6i73fIB/NY7/K339ZvFcMZp+j6V+bjAHQ==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr7169355wmj.171.1610016453190;
        Thu, 07 Jan 2021 02:47:33 -0800 (PST)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id o74sm7841449wme.36.2021.01.07.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 02:47:32 -0800 (PST)
From:   Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: Rui Miguel Silva <rmfrfs@gmail.com>
To:     sakari.ailus@linux.intel.com, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 0/2] media: im7: csi: fix csi for i.MX6UL/i.MX6ULL
Date:   Thu,  7 Jan 2021 10:47:24 +0000
Message-Id: <20210107104726.1294538-1-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fabio during the testing of i.MX6UL using a sensor detected a regression in the
imx7 CSI driver which have the same IP but do not have a CSI MUX like the
others platforms that share the same block.

The commit:
86e02d07871c ("media: imx5/6/7: csi: Mark a bound video mux as a CSI mux")

made the assumption that this would not happen. This series make it work again
for the i.MX6UL/i.MX6ULL platforms.

Cheers,
   Rui


Fabio Estevam (1):
  media: imx7: csi: Fix regression for parallel cameras on i.MX6UL

Rui Miguel Silva (1):
  media: imx7: csi: Fix pad link validation

 drivers/staging/media/imx/imx7-media-csi.c | 27 +++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

-- 
2.30.0

