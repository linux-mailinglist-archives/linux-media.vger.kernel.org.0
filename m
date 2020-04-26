Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206891B8D9B
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 09:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgDZHpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 03:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726110AbgDZHpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 03:45:30 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E402AC061A0C
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2020 00:45:30 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id fu13so5373829pjb.5
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2020 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dsgjAqhAPg7Jun734VcusWeZkndwJj6yq3rPyfzmgvM=;
        b=DArJC044aj+khMRYg6AB/4+X3RyrCJ/IP7p/ORobdGnCEOYYY3Cw6pkOprjcaBhKOS
         jKfk9CMio0SjutSVykOf8O4dCfHWroFFtUFfSmXc8puZ2k+0QRuoQNWm+ez2r0B4ed/d
         QvjCOXWsWdXoNupdT2FwzFd8AObvgv9DSRDuXXwmolNcZQJ/S2t+wbG49PFh65RMRuAf
         pAXEvjT0Jrc7kfHAgJAD+JReq07+Z4OSgDhjcPXBFeyGI4q1GdNMiwnL7kaWVjIyjHME
         /bjrVs3RZgxCMhclDb0ecLrQwx8t60B3gDiW+I6x8tRt37dhXotWuIShmpCxE4L34KJs
         93LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dsgjAqhAPg7Jun734VcusWeZkndwJj6yq3rPyfzmgvM=;
        b=hYPcGrCoGp1CAIfVcA3gdZ3gdzlrl9puhuDqbHvfRRCpOsvEXW9gnrCUpKyiAXoszl
         F4mGuYURQQy/3/L75qjZ01G68jXrKGu7+BuW62PYZDNDYSZj004CNwCMAbBE5Iyvte+/
         RHoDDYMhtRfQwfj8SLX2NULZ9Q0f/eKfxBnI2Bj6dnWYVFpcAjPz0PFAGq3+A7Z3zXjZ
         cv3de8ugKY+eMMcOBF52NdMrqcFhfo0khWMWSWyTGfz9aWb1/gg85fbwmrzL4ILg3fOF
         JM/rF3ioFYy+DIXf+iV2IEnEgW4Tl0yKgq/71spnSBkSkf0qyOtjx9D+Yp6Ifb+MDYwk
         y9Cg==
X-Gm-Message-State: AGi0PuaVh/2xzSBMB3pjpmzNNGRx+qXsw3RJ4TOejneylbMx4AFEvi5d
        FjX8YiFMaH+tgdRqMq3GNYufIeN8F4c=
X-Google-Smtp-Source: APiQypKx/2CTgCYSVP2uhPLLWpm33z5TX9iDFRgvvcRR95WINvsL2hg5vMZ+wy1Y0Xam1Dm9eiLmdw==
X-Received: by 2002:a17:902:d210:: with SMTP id t16mr17912302ply.103.1587887130287;
        Sun, 26 Apr 2020 00:45:30 -0700 (PDT)
Received: from mangix-trapnet.lan (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id f21sm9571958pfn.71.2020.04.26.00.45.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 00:45:29 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] cec-compliance: add missing header for clang
Date:   Sun, 26 Apr 2020 00:45:26 -0700
Message-Id: <20200426074526.3664-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Otherwise clock_getting doesn't get defined properly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index c601427e..36b83d26 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -8,6 +8,7 @@
 #ifndef _CEC_COMPLIANCE_H_
 #define _CEC_COMPLIANCE_H_
 
+#include <ctime>
 #include <string>
 
 #include <linux/cec-funcs.h>
-- 
2.25.3

