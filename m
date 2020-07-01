Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25153210A44
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 13:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730321AbgGAL0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 07:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730159AbgGAL0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 07:26:03 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851A0C061755;
        Wed,  1 Jul 2020 04:26:02 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id n26so10233723ejx.0;
        Wed, 01 Jul 2020 04:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZj26CwH+3KxgC+hP0OazVEBLvLFOKJxYzi5I45O0dE=;
        b=le6GV5f/dGAjJq8wQz68W89CxKq+Q499yJDPo1FZ34phrSQRPK38GppEy7phsx2bGc
         rHa3s3sNxHuIqvMyxEIn7rBiHjCYnqMEElkXl5Q435p8Qu8jFWEh4clqHHstOyw/4T4u
         fX9xBpxMuTRIp9wGoV5hmtQ7feG3BLYChxDkr2YrIpZb7FvYVNejZEQDXJXXtO+InpL9
         ve63FzYwHFg5b6FvyVflElf/sD5c0WrUC1p88FjvtE4gCW50lupvFVoCDBzUfMOaZnEK
         k/U766DpT4UBHFsNfVIMA6yixTqqxdz+/CsyAw0rHkf1RvNIWj+VlBY3KALoMtnpxZAg
         1WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lZj26CwH+3KxgC+hP0OazVEBLvLFOKJxYzi5I45O0dE=;
        b=SOW9Vb7M4Ue7H8FB7JxXCHVEzlRSwcMdipkGTMpRUtoE+hOrIewNEPGeN0IADChNka
         orpxdEkRCUHhR/GnEafLPzeZ//fTL6DurRfM3g+WojhELvtYhyvnQj3f8QkAV3fXZh3A
         TVpY7cueluc+iOk+bs07sw0S1gccJ1EAXd3e9LWMZLZA7wN/RTyiQFHRLxN1A3TTE7qK
         NMkmwO6tz+r8CQFbMm0ns2LCSpxVvxa+g91aKQKV+aTGivTaiR6Jf/zNHHl+M1ToQ97A
         dAQfPywKM122oy+Zkc9Ke9pvtj4IYjHfHLPjN7mTyo7zoW0WVtY3rQh3t2Pcv4E/3ikN
         4vMw==
X-Gm-Message-State: AOAM533N1jW6mQ7krswqWN9n36RvgBbEBSH+ggq7+y3s1K5nrFjjeGZd
        0fGUmsjanfuqutqkbDvPyhQ=
X-Google-Smtp-Source: ABdhPJzyUDA2eZqbagHduFxDpj4PTq6ecxrv60hEWjOpDLWCm4e25kYYhpQDiE4dzu7g49qScmSbEw==
X-Received: by 2002:a17:906:774d:: with SMTP id o13mr17128257ejn.373.1593602761308;
        Wed, 01 Jul 2020 04:26:01 -0700 (PDT)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id e3sm6290442edm.14.2020.07.01.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 04:26:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add myself as DMA-buf maintainer
Date:   Wed,  1 Jul 2020 13:25:59 +0200
Message-Id: <20200701112559.22669-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As discussed on the list.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 40474982a21d..5d7130f8d342 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5089,6 +5089,7 @@ F:	fs/dlm/
 
 DMA BUFFER SHARING FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
+M:	Christian König <christian.koenig@amd.com>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
-- 
2.20.1

