Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BBE467FBB
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 23:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383357AbhLCWQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 17:16:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241447AbhLCWQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 17:16:30 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3193C061751
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 14:13:05 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q3so8555680wru.5
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 14:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FnOjh+R3LDCKmq9LdV+beNCa5B9FLxsZAN7PKBqg39U=;
        b=QiyzpJ2f+ejT/OelwmGCJjQa5u2rIp9taAFqerPBdoojEJGB4xOvBk3gvt1HQOdWEc
         8wGZ5Cae6IyHYG5+QsL3wI2baDDq/1fPYZo9OVMjREFKfjQOuJBYOm2P/Fq8t5Gu2hCh
         wuDl2m4qZLIExC24Qe7hH+Q5tDA73t90OzhCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FnOjh+R3LDCKmq9LdV+beNCa5B9FLxsZAN7PKBqg39U=;
        b=ulveyfhQ/brH1PafTVEYkdWpjtNvLrXDJY8hBGXWMpjHSJo3h57EgmctS+d9RT+y1K
         eouhzpqc/+wZ1niwGsqRYUWRLXcfwa2GnxriqBTkvFAEo9qTCMsbH5p3vrj0ji8j5kED
         Np4iULHgCeEJ0NGn40a65hGARm4/ls75a+1Nriko2j46EyZ3OWLn6p7h9ZSRcBqSkf+R
         mKSXXzjvN6lxoLLZjnm9D4HTOt7PYgDgmMeSimoEon/GlqakJ2LLQVFmwlbeWBonk9Ug
         0QrnHcdRehSBb1A5Ts2XU+ZeFZmK60uqboWr5hxdYC7rnzDmU0AGdx+f1QBwitjLVMvv
         vUZQ==
X-Gm-Message-State: AOAM530ulql1M2Cje1Q9XwCfYnIHamRVqB5oRCKWkTtaAlWZaLy6COGm
        8GSr59kX5HcA9C9c8toR7mvRHYQPcCSJgQ==
X-Google-Smtp-Source: ABdhPJzKuAxWAR3BPYRSlYReozl2HRPe4K1OUcitCUUM+lhrQuohnFqDxEwbVfztfvV7bTik5kX/HA==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr24185463wrl.181.1638569584460;
        Fri, 03 Dec 2021 14:13:04 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id f7sm7849710wmg.6.2021.12.03.14.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 14:13:04 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [RFC PATCH 4/5] adds drivers/staging/media/i2c/Kconfig entry
Date:   Sat,  4 Dec 2021 00:12:46 +0200
Message-Id: <20211203221247.46324-5-petko.manolov@konsulko.com>
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
 drivers/staging/media/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index e3aaae920847..c034004bda60 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -24,6 +24,8 @@ source "drivers/staging/media/atomisp/Kconfig"
 
 source "drivers/staging/media/hantro/Kconfig"
 
+source "drivers/staging/media/i2c/Kconfig"
+
 source "drivers/staging/media/imx/Kconfig"
 
 source "drivers/staging/media/meson/vdec/Kconfig"
-- 
2.30.2

