Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED26E3677E9
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 05:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234620AbhDVD26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 23:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbhDVD25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 23:28:57 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E86C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 20:28:22 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p12so31859328pgj.10
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 20:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=UTltkIimK3rx9SI7dDmF2IdR+OwPGve3LKPwiyKohx8=;
        b=Py3dDtklgWdUWgyJZXfnjWqcFyJu7/N6TgJUyIXtjZbc5oORlBT1SgwgTQVOWarI4T
         ybpUSYMSyMimkG42VwKH+7RP8rUg/6+89FENqw8jfoubSJxINSo+AUyspr4URB/Fsa9B
         GqNN6rjAIhyUuxltSwIc/9waAtbJAGpNBmPAWzyLR8AiwfFuBhK5bSDwHwOKouksWtnO
         sIuLLVSZs/w2UfpdF/sISP1vf1a6piECPjNZ9XMRP5G07Ps+9qdxo673CgpdOzSLG6W5
         zMeRAp8j5RIiZkdpan5+PF0V5LNmER3qzBbVL2UZDosvQ6H/J1xGu2JukT7vLtlG1YE2
         0eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=UTltkIimK3rx9SI7dDmF2IdR+OwPGve3LKPwiyKohx8=;
        b=UkUN70oLBUd+zv8jW1YFasyB7092tVcIvGTIRq7M3kzHYHFxH2MGIzuAjoDPAAV4Dr
         aommm9OQDGDk63mNW0QcecZKO9wo2+uwBb5AO1ggm3iVWczngNNDxnIwjXRvlotclMW9
         u2qu11Seu71gpKebiDUtXKUi07LXyhJqNXJhqp0kAUStwK0vmQddpkUBVzhDgElPNrQW
         bUTPjKyLrMNwiCmU28H11AZEq8b5egexp4v37mn5OHdFxu2OMVjLJX7hYDhVmp8Msd0j
         xnTndmA2Zcv8uzIyvgixTtSnFg/Hi1fpal0OYhn9jRPSD7A8hcv6K5PzD4mVzK/8CEZ2
         Widw==
X-Gm-Message-State: AOAM530WWLthSBt8QcnweIpXlYNl1xEQOcsUucmx2boMYEbZUTnP90w8
        UUR2pdN0oZLGiqmHFNr/j39d4TDiO/sPoQ==
X-Google-Smtp-Source: ABdhPJzAk8Blh5JSOFZK3Cy8pm/i1r3eSU1EPc8Vxx8X9VACPvlusZsCW7G9F7dHMZtqLkOTZGM+pw==
X-Received: by 2002:a63:2211:: with SMTP id i17mr1368846pgi.431.1619062101995;
        Wed, 21 Apr 2021 20:28:21 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id f3sm6266999pjo.3.2021.04.21.20.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 20:28:21 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 1/3] cec-compliance: add Audio System mask to Set Audio Rate
Date:   Wed, 21 Apr 2021 20:27:52 -0700
Message-Id: <9c79d1e012029f8b2307e2b6e3cf39cd23b7353b.1619060430.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
References: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
References: <cover.1619060430.git.deborahbrouwer3563@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

An Audio System can support Audio Rate Control, so add the
Audio System as a possible source in the Set Audio Rate test.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 2a541d55..4674295b 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -878,7 +878,8 @@ static int audio_rate_ctl_set_audio_rate(struct node *node, unsigned me, unsigne
 const vec_remote_subtests audio_rate_ctl_subtests{
 	{
 		"Set Audio Rate",
-		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_TUNER,
+		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD |
+		CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
 		audio_rate_ctl_set_audio_rate,
 	},
 };
-- 
2.17.1

