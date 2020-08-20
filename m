Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB20824BD27
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 15:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbgHTNAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 09:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728446AbgHTM6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 08:58:51 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB82DC061344
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 05:58:33 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l2so1928164wrc.7
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aj+Z+6c4sWqPXmn2a4X9LlmI23g2u9QMeu5vKcHB0Ok=;
        b=DlSwiqzaShKyoM8UDHW0fhg8XI7Qw+tqpK4BDPdNz7kKdyS0J3yfcZVI5TkL2zAFyO
         7783fIdFAEqZpgKnqFIeur2FUW4TrchVNKhQFnOOc3acXAMsSIaHHu1QRYaZoZL3rNMR
         oJG27t7P3L1B3EDStVvyMPLuZ1qUlTRuZJ4hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aj+Z+6c4sWqPXmn2a4X9LlmI23g2u9QMeu5vKcHB0Ok=;
        b=fth/s7MDHAIKEhNCFkiLf82TOClLvJYJESmifvXtmJCcX/BZEeQDU176ZoKGnD8nd7
         xiV2NN5Vnx3AZiamywcjq19QOHdcEZC1C7/jxUwpgpH9Bl+5SvQebDbHnsZv804uGj3w
         YEL22ghVZjHcaw9Z4e/BunLhKrLs/dmySW5xfafCVuvAAf+ZpXGKr2F52kgo82SdVB9k
         hOhJ0gcKro0wu8i9xma8VahGCypKGeOK293/Amv4jbhzg8cbnBW1R0b9BPKiuRzRPB+G
         +lJ0e/tAiW6FbnG+icpJZfKmX8Yxi0Goz8rr6szUA9pWLzJmc5G8noNYLqKJfYB8jJ6L
         wqYg==
X-Gm-Message-State: AOAM533H8mabpY0tXxUzT2GZIjEhP1OW4xB+2TKFWhGSGa6Abr1+v9DL
        eISUYlBsCWWGTSyCi2Yu067P25gD1R5jFeRi
X-Google-Smtp-Source: ABdhPJwox16oICSW5A0Z8fwVtNtStZjeE7k3tZ3259yxS6Xbgub2PQ0l7680bWlfJkPOnlE5LHbTJg==
X-Received: by 2002:adf:ab05:: with SMTP id q5mr2991176wrc.46.1597928312235;
        Thu, 20 Aug 2020 05:58:32 -0700 (PDT)
Received: from tfiga.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o66sm4517760wmb.27.2020.08.20.05.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 05:58:31 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho hehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?q?Pawe=C5=82=20O=C5=9Bciak?= <posciak@chromium.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH 3/3] MAINTAINERS: Remove Pawel from the maintainers list of videobuf2
Date:   Thu, 20 Aug 2020 12:58:25 +0000
Message-Id: <20200820125825.224788-4-tfiga@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
In-Reply-To: <20200820125825.224788-1-tfiga@chromium.org>
References: <20200820125825.224788-1-tfiga@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to [1], there has been no email related to videobuf2 posted
from him to the linux-media mailing list since Apr 2015.

Note: The linked archive seems to lack messages newer than the middle of
2019, but it is the only archive that offers search by name. A manual
look through the messages after that time confirms the observation.

[1] https://www.mail-archive.com/search?a=1&l=linux-media%40vger.kernel.org&haswords=&x=0&y=0&from=Pawel+Osciak&subject=&datewithin=1d&date=&notwords=&o=newest

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e756cd4751ce..2464a1132a13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18298,7 +18298,6 @@ F:	drivers/media/platform/video-mux.c
 
 VIDEOBUF2 FRAMEWORK
 M:	Tomasz Figa <tfiga@chromium.org>
-M:	Pawel Osciak <pawel@osciak.com>
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-- 
2.28.0.220.ged08abb693-goog

