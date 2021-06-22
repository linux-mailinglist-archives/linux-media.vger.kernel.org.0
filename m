Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01F03B0EE2
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 22:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhFVUf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 16:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhFVUf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 16:35:57 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0600C061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 13:33:39 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r7so459671edv.12
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 13:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solid-run-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q0ONrnBxot7rlHzlaE3A6/0SrVMl6lixLobriVm1Bok=;
        b=ApTmH/xYnry/TpG5Rgnbf6Lo/przzhbxpMyGftkJ3qSPrI3AoAkphfJ0M3G6GXbQOC
         g2UnqzKo2FA1m+MbyxKxB1wwXKjdifHIW9/oQIdDnurmy4MNAxToeRLck24cMGhsvIwR
         AcCiK1rReJVYgWjX0+RPODM83qQa9hAhUZQNYgyqdRvbaH1FNNPk2So98LK0Da7IkvIv
         edOCpgdGKo67XK0fhdKQ7ibYkycqbhsdpyudekO1GHYk/4TtX2q+0E6g0lFBBOQT4aS7
         0szD5QRmYTObTNT+Su/7vXSZAA1nBYImPAVx6UpBQ93SQUvV/4BTVhckTEYZcfSuzuKO
         79WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q0ONrnBxot7rlHzlaE3A6/0SrVMl6lixLobriVm1Bok=;
        b=RcafU6hilvtItd2hSEkmlNL2FUrByfiC4KMeLvgcQa+AkZUaRun+8C4qZREe3d2cq9
         v/JeOKXMgmQEKCUT9XUCYCnW+HjV7UCPVfJeFXILV/k50ndO5yK8QoDb6W01kkGulyVK
         7YPTatISnsArTzIEijCYW7a1LLbvzy1E5zIbMGUqV8mjQ7qVmDY4ikc6wqoww/gC8EEc
         SXLgPKsKMHB/PKf0qf/0uU93ciUNiVDjhcW+1iToL4KNiuQxKdLJeRM5WOc69puLbL8d
         zIP2T96dRUlrEteKHGWSCJTJaf9RrwSwa4sh/MZADw2A2bauhPdqyB+kNcVHQINpar3J
         uIMA==
X-Gm-Message-State: AOAM531lkGUf5W3hELax+ZqRIjdYr3N/sGnSSDkClwbCc8NFBm/Yjgft
        o6EWHQYf+1/L2AUKTn0FJ9d8TrfuHbjwhzhrLKs=
X-Google-Smtp-Source: ABdhPJwxQOSpY6/xKi0YARH7tkgATDEdaECyBuW3owoBe+/wAZS91JrfBj44UaYs31EUZmLArBFNZA==
X-Received: by 2002:a05:6402:5cc:: with SMTP id n12mr7715167edx.354.1624394018389;
        Tue, 22 Jun 2021 13:33:38 -0700 (PDT)
Received: from unipc.lan (p4fde2874.dip0.t-ipconnect.de. [79.222.40.116])
        by smtp.gmail.com with ESMTPSA id x19sm157627edd.64.2021.06.22.13.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 13:33:38 -0700 (PDT)
From:   Josua Mayer <josua@solid-run.com>
To:     linux-media@vger.kernel.org
Cc:     matrandg@cisco.com, mchehab@kernel.org,
        dave.stevenson@raspberrypi.com, Josua Mayer <josua@solid-run.com>
Subject: [PATCH] media: tc358743: fix missing return of error code in tc358743_probe_of
Date:   Tue, 22 Jun 2021 22:33:29 +0200
Message-Id: <20210622203329.11608-1-josua@solid-run.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <427466e4-1b6f-f7c3-3d5e-89c7a7f2ec79@jm0.eu>
References: <427466e4-1b6f-f7c3-3d5e-89c7a7f2ec79@jm0.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When device-tree configures an unsupported combinaion of number of lanes,
and link frequency, e.g. by exceeding 1Gbps per lane, 0 is returned,
wrongly indicating success. In this case, return EINVAL instead!

This fixes a divide-by-zero crash in tc358743_num_csi_lanes_needed,
where the divisor becomes zero because pll_fbd has been left at 0 by probe.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/media/i2c/tc358743.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 1b309bb743c7..f21da11caf22 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1974,6 +1974,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
 	bps_pr_lane = 2 * endpoint.link_frequencies[0];
 	if (bps_pr_lane < 62500000U || bps_pr_lane > 1000000000U) {
 		dev_err(dev, "unsupported bps per lane: %u bps\n", bps_pr_lane);
+		ret = -EINVAL;
 		goto disable_clk;
 	}
 
-- 
2.32.0

