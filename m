Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67A537719F
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 14:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhEHMW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 08:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhEHMW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 08:22:26 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565F0C061574;
        Sat,  8 May 2021 05:21:24 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c11so16564927lfi.9;
        Sat, 08 May 2021 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=04cgrkWh50flqZpRh37baQFAIaC4WlfO0T6oXLED7ks=;
        b=mExExvHoG8jNOehgnXXg0lQ2Y7jCePctD8KnPz4fksYeeg24T0xXYp1+pCQAbXbMJ6
         dbGpEJBUECwthAvx3d9YIH6KPvL3vGBUo/NWc1baxesdpdqoUNc3rwDBH455x0nMJRbH
         ngGDI+EUMZUVRO+UCj/msTEoPTXv7t6fSHC9jdRP/qaF2GJdBQWiUSG/UTrUbETJaOZS
         bxitWoIWcfIF0qhJOiZrgcS+mmjxvSGckcP68D6B6yJqNZ9HYBtU9ZobBguRHdjAEMZp
         O8Jt6kdK58fvWL0mfcDSKtnMm0gAgOkJD+JauC1TvPLDQPQS5BjydGWx2uTHIssG1DzQ
         eybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04cgrkWh50flqZpRh37baQFAIaC4WlfO0T6oXLED7ks=;
        b=W9KJidtIwwIi5dcPoorVTSF0fG5BJzgBytMrLcQq39BDLjrUm697HK1/fqTIZmJcXo
         AbFczEmrVqWDj8lrEa4/XyLQnILwZ6tMkSwlay8kMCFCjcJYpHAY9S+xQ8DioqhaFSB3
         tj1rTfPvRmCvWua0Fu4r/bPEbQJwZdlRRVa8nUEVXfnSYSnxxX6t7fGIiAi6eMfw+o5m
         bMoD+cASrWDcUHdvN+UtHtetUv40JUiR/VEo2wAXWK5c5iEIkiu2RH0xUKp3pnX+dZ8i
         goBrzlAPIhVNJnA67Y0DpTx7t/bcJAJrmKjim6JzVzm+LNPsHcKUPjkz4WDBztTgIoj3
         QHTA==
X-Gm-Message-State: AOAM530YY09yi70JE6wIMluLyzXnHr7WOmkeU8pm0E1lqXgS2PAd/wup
        aWxu9BC3/jOunuy/G7CXZe4=
X-Google-Smtp-Source: ABdhPJzPNFgLMWYqVx205XcNshsO4fb+1wFy+XgJ4uRekQG1wGH6SIr+SADaI6l/hmdiIF/ZNgCruQ==
X-Received: by 2002:ac2:5497:: with SMTP id t23mr9953657lfk.52.1620476482679;
        Sat, 08 May 2021 05:21:22 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id u5sm1627354lfk.237.2021.05.08.05.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:21:22 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 0/3] staging: media: atomisp: code clean up
Date:   Sat,  8 May 2021 15:21:16 +0300
Message-Id: <cover.1620475909.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YJZuviLa3SRLWASk@kroah.com>
References: <YJZuviLa3SRLWASk@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series includes code clean up for input_system.c.

Changes from v3:
  Removed returns at the end of void functions
  Split all changes into 3 patches

Changes from v2:
  Removed useless returns

Pavel Skripkin (3):
  staging: media: atomisp: remove useless breaks
  staging: media: atomisp: remove dublicate code
  staging: media: atomisp: remove useless returns

 .../hive_isp_css_common/host/input_system.c   | 62 -------------------
 1 file changed, 62 deletions(-)

-- 
2.31.1

