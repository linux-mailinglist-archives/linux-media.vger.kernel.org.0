Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85EF1B3404
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgDVAht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgDVAhr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:47 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41ACBC0610D5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:46 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x15so190535pfa.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HjkNxBUCJzhuspL3b+E82EInDzSfGD1DDbs06ExUmdA=;
        b=ZMum0XlNk4nU/6Cn9OHAvmf/EKvLMDzzKvXqupmRy/pkP2KuE+c4biFkC9+QNAjzVW
         YeJNkBX2QPAU2JoslTrCHOcrIiAbmZTftgTMlX+Bewn/ULInmwI8fK2dEBNNJ2d47MTS
         0QoIhqk/YXiPJ1GPzSLBXypD7bxBP16fSh/JymkFtIjYQ1QcuOb1GoAYR8puF5ei02zC
         X9y+yJpTblMOx8quHGKFwlKwxtUjsV81WE9WmhOTGj6yS5ZaldSBjhTe6pchRXbXhbXd
         0vigYXv86yH8DItKW0Bf6ctwd7psi20nMcfG2DghLEQdQj0kYk8aZqK9prqCzJ73PjBr
         gfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HjkNxBUCJzhuspL3b+E82EInDzSfGD1DDbs06ExUmdA=;
        b=lZrkEOE8ze6zK+kfptfI+0yEyOQ+Lv+In5NBgwlu8/WcBybqCXU6eV4J3aFOrmvCcd
         PhZy6/SSl8prd/pLGh+EhdbVQnx7uUy+CBfJeTKkaRG3w271LqRSqx140qp7oSzTCBUV
         Plc7LiLsWVwTqAVPodgeYRPt6F0Vk6oOMBG2A6JkGyHswomf1F2UsgpBMNjtDtA3p/Vy
         YAD90jA0FLluSS57TtclOkNsiuVQmDPzXCPUY4IZX+rQWKpusyIrRkMrWWpPjOpDNErO
         5rA1HjoVBBIOIJLxxbwn859wmHrcFSWjFuDzM2IUfZkrTEro15mWxMoNBUVody3dCJkJ
         3NDA==
X-Gm-Message-State: AGi0Puak9hIqOxIx+e43W3P/aUX35vDfD0mnBztrqfMnTDTkyw/u9QqX
        ZcFITYgJT5Gtrw+WfRMQsgwO+49o
X-Google-Smtp-Source: APiQypJ0pZW6p/ektGyxhfwywTHefm0b+a2Ixu+dqhrTxpGIY4dotfwP4s509WuweXNGH6sXcmVtiA==
X-Received: by 2002:a63:257:: with SMTP id 84mr17207773pgc.284.1587515865610;
        Tue, 21 Apr 2020 17:37:45 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:45 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 08/12] utils: initialize variable
Date:   Tue, 21 Apr 2020 17:37:31 -0700
Message-Id: <20200422003735.3891-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

clang is too stupid to figure out that this depends on the bool.

Fixes -Wconditional-uninitialized

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-ctl/cec-ctl.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 3acfe0b2..f4133494 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -2091,7 +2091,7 @@ int main(int argc, char **argv)
 			};
 			char *value, *endptr, *subs = optarg;
 			bool have_cmd = false;
-			__u8 cmd;
+			__u8 cmd = 0;
 			__u8 size = 0;
 			__u8 bytes[14];
 
-- 
2.25.2

