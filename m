Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70353A382A
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 01:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhFKABd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 20:01:33 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41895 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhFKABc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 20:01:32 -0400
Received: by mail-pl1-f196.google.com with SMTP id e1so1892168plh.8
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 16:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sbj+0jWrqnwzITA5DlB3Zj2Vdv8O3eqgINtEBO7obv8=;
        b=raZti0gSsbKKc/0uLPS5zT0EnFfgmLy349K3UVMI8faWbSHSOsB8i3gCoNXatO5yl7
         4wQU6TCFUd6TKM4WMIo6ErbMc6Bl8VMltSJIaHtDgaX3NVlapHsz7nY4wMJZJ84NI/+Q
         ga7+IdMkQDL1OdGq39Ec9PIEg47w8FPpRY+oTguEJJWg9fvhCn0HCsdMOWs8kK0H61Ri
         VJ1yvYyNCPXCMBRh80vtNRm+LYT1cLFd347V3CLeH/kh+r25IRslF6AKHgg2bfyeYbga
         bMeMm4kEc3zWleXm5Sseg0q7SBVhgBSEqISHq8AeTILAp0ogE2jldzKG8+aGQ/Ntf71J
         2TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sbj+0jWrqnwzITA5DlB3Zj2Vdv8O3eqgINtEBO7obv8=;
        b=aFogU/klAusLr8Qgc4phIym9cIGg0FVJfRTf7iiltorrhQFp9Aope0WMlq0y0mXYmE
         i1WlShO9pEoFcZN3kxSqShXw8IguygN0MFEawEIxvjpZGYmoLj9TosrFamGWZsPNHQkd
         oBlmC1tjwEPiMHkl5idPeuI6Te+1e3Ney/trGhCeH+FgSRqg1/z/4CUHbDiowhNy3Ez7
         51hwEu2httTjjj2BSUHhwimYy1YC+wNFuqTRz+URnjH6UbMhSsS1PrVawW3IOXljb83C
         nu/ZUAHgccJtsDf7feX8vQTSMBqjjsAP+osvDvJi66702fbI3RQDsBMzsdWtT68iQW2x
         uxIw==
X-Gm-Message-State: AOAM532f70RUSmZYch8w5eIAsFVl4qTR9dTGVbOCqjFe1EZJXWToGcl+
        8hgXF34xXUcgpdsW6acMtYa46A0GboBPsQ==
X-Google-Smtp-Source: ABdhPJyvhaNxUJywAfx8A+4Wrkeb87yUqL0Ra1yP7qGIcw/S//BN9nKbACQwvWOFk1EwI6tTSt1lWg==
X-Received: by 2002:a17:90a:e94c:: with SMTP id kp12mr5903353pjb.134.1623369505327;
        Thu, 10 Jun 2021 16:58:25 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id c4sm3588133pfo.189.2021.06.10.16.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 16:58:24 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v6 3/3] cec-compliance: remove Deck Status test
Date:   Thu, 10 Jun 2021 16:58:04 -0700
Message-Id: <f178858fc479d6c84f38a4c0e1f310b844fcb275.1623368303.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623368302.git.deborahbrouwer3563@gmail.com>
References: <cover.1623368302.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the Deck Status message test because invalid Deck Status messages
are already captured by cec-compliance in other tests.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index f2ec4e90..8f2188ff 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -696,23 +696,6 @@ static int deck_ctl_give_status_invalid(struct node *node, unsigned me, unsigned
 	return OK;
 }
 
-static int deck_ctl_deck_status(struct node *node, unsigned me, unsigned la, bool interactive)
-{
-	struct cec_msg msg = {};
-
-	cec_msg_init(&msg, me, la);
-	cec_msg_deck_status(&msg, CEC_OP_DECK_INFO_STOP);
-	fail_on_test(!transmit_timeout(node, &msg));
-	if (unrecognized_op(&msg))
-		return OK_NOT_SUPPORTED;
-	if (refused(&msg))
-		return OK_REFUSED;
-	if (cec_msg_status_is_abort(&msg))
-		return OK_PRESUMED;
-
-	return 0;
-}
-
 static int deck_ctl_deck_ctl(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
@@ -893,7 +876,6 @@ static const vec_remote_subtests deck_ctl_subtests{
 		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
 		deck_ctl_give_status_invalid,
 	},
-	{ "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
 	{
 		"Deck Control",
 		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
-- 
2.25.1

