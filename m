Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0871D24BD28
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 15:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729995AbgHTNAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 09:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730097AbgHTM6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 08:58:35 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2982AC061387
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 05:58:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 3so1515853wmi.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Iq37qxt4ApCtNPIQEjJk0Rbx9WzjB2AgIUR9gKuVHQ=;
        b=KDovPjyI1i8eioVe3eJKSfg+aKPguLqoB0+DUyh6iB+vJjv0JVJlMrRxBv4tmlxebL
         m9S/zM3cy/mnIZ4FzSrs1vzamHLVW7FPeFl4PVADYD1xusO4RHh+/5mvg3/l2p3ZiSqW
         nCUuz2f0Y3fDQvcR1sLD/ykVUridBCF2Z1qlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Iq37qxt4ApCtNPIQEjJk0Rbx9WzjB2AgIUR9gKuVHQ=;
        b=li7pF6iobAGj13fRTrFoNwnrZg284rkRNDNRxNb8CtO6njtuuy0nzr6ySC4KAz4PPb
         0gi/sxjKwVbs0TmGfnCdXBUHeuW9+Ak+HXwUaGddYE6EPw0fAEu2ySlr0xwwUIEL/xFN
         FSgb5W4juD5q9BGE4FmBR1BEtHNESWqC/QIyA5ZJnUTvwpRWHgggMiJ/eQxbHEjebJMj
         uguKYBachAEWoJ+AgEl8oF+a1WfVRo28m+DwU76V3+MOo3sMx91FfMb3egHl0Z0Uqboc
         wMKfLF8JtnX72I3kKR4njILZ4JdqOh39hNAfHPUQrK3z8vLevbdqoFclxjFhPA3pzano
         wkUw==
X-Gm-Message-State: AOAM533RGnE/ABc410sUtUfbHHiW+y1UtbyxpQQTYkvPb/gpi8YxGzXc
        4m+beGERkZVL6J0bwQejVHzFsp5KVeMEaYJX
X-Google-Smtp-Source: ABdhPJxseh6U+kNgHzIrowaWyWZqFtWENlrz7ury1P/hngomKwWsWutckSMM8O0q1+QqbpHhh+2FGg==
X-Received: by 2002:a7b:c4ce:: with SMTP id g14mr3574056wmk.51.1597928310544;
        Thu, 20 Aug 2020 05:58:30 -0700 (PDT)
Received: from tfiga.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o66sm4517760wmb.27.2020.08.20.05.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 05:58:30 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho hehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?q?Pawe=C5=82=20O=C5=9Bciak?= <posciak@chromium.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH 1/3] MAINTAINERS: Make Tomasz the main maintainer of videobuf2
Date:   Thu, 20 Aug 2020 12:58:23 +0000
Message-Id: <20200820125825.224788-2-tfiga@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
In-Reply-To: <20200820125825.224788-1-tfiga@chromium.org>
References: <20200820125825.224788-1-tfiga@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomasz is the most active member from the people listed currently in the
MAINTAINERS file, but is currently listed as a reviewer. Change the
entry into a maintainer and move to the top of the list.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..8623365ad0d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18297,10 +18297,10 @@ S:	Maintained
 F:	drivers/media/platform/video-mux.c
 
 VIDEOBUF2 FRAMEWORK
+M:	Tomasz Figa <tfiga@chromium.org>
 M:	Pawel Osciak <pawel@osciak.com>
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 M:	Kyungmin Park <kyungmin.park@samsung.com>
-R:	Tomasz Figa <tfiga@chromium.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/common/videobuf2/*
-- 
2.28.0.220.ged08abb693-goog

