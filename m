Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63402C50F7
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389196AbgKZJTh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:19:37 -0500
Received: from gofer.mess.org ([88.97.38.141]:40685 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgKZJTh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:19:37 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BEC6B11A001; Thu, 26 Nov 2020 09:19:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606382375; bh=T7lwrIcQ27tZrMWzBqf8+JRx0iS1rD3a5Q1tvGGa7gk=;
        h=From:To:Cc:Subject:Date:From;
        b=Z/Q7F3TJPP3+n3/zfq8tiMDhlDJsm5ZXk3HqrE66RZKAVbxPEG0p+aeMmyuLzqVrs
         eOmICVzcKq4DjILG+NXrXGBLAu0Srme6AetlErh1apEoqd/2KzEXIC9rtP1vj2hrdD
         c8JKssH2/2T6OGeE+GQo0lF/3uf6r6o74+yRJ+f2nI0ZqFWh12ZjiE++nhtkqjAV+G
         hhcNMIdoVG8zw79WYaRpQRKrOadQehWc2f9104RusAAiAIruT315CQwZu8U7TZly1h
         Aulg68Fv7BfUZkg0Ptyb3h/leMT2vprNEkOfanyUB7ASIsvC77uhYIGMJeeQdCs8Ts
         Eq3ObM+SJCUaA==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] media: lirc: fix lirc.h documentation generation
Date:   Thu, 26 Nov 2020 09:19:35 +0000
Message-Id: <20201126091935.16857-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rc_proto enum values should be ignored for now, otherwise we get
warnings like:

Documentation/output/lirc.h.rst:6: WARNING: undefined label: rc-proto-max (if the link has no caption the label must precede a section header)

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 72e637fec558 ("media: rc: validate that "rc_proto" is reasonable")
Fixes: cea357bc2571 ("media: lirc: ensure RC_PROTO_MAX has documentation")
Signed-off-by: Sean Young <sean@mess.org>
---
 Documentation/userspace-api/media/lirc.h.rst.exceptions | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/media/lirc.h.rst.exceptions b/Documentation/userspace-api/media/lirc.h.rst.exceptions
index ac768d769113..e74b73cd0e9e 100644
--- a/Documentation/userspace-api/media/lirc.h.rst.exceptions
+++ b/Documentation/userspace-api/media/lirc.h.rst.exceptions
@@ -64,6 +64,7 @@ ignore symbol RC_PROTO_RCMM12
 ignore symbol RC_PROTO_RCMM24
 ignore symbol RC_PROTO_RCMM32
 ignore symbol RC_PROTO_XBOX_DVD
+ignore symbol RC_PROTO_MAX
 
 # Undocumented macros
 
-- 
2.28.0

