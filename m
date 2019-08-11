Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F45D892E5
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2019 19:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfHKRg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Aug 2019 13:36:29 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39405 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfHKRg3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Aug 2019 13:36:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id f17so44596035pfn.6;
        Sun, 11 Aug 2019 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=x7Dw46zWLl+eoDZ/eEPovBwW+lbl5NQPMvw6CLb6yg0=;
        b=sFDxlNF7ppdNxSzm62m+8U3PDslIJreRkZzC3qkugzRe+OhrFp+V7DfRuvtJlT6Wd/
         QkCUV3MqOShsCbY3TyAtHYGVmGi1nFswvQEVSDQd+qoFXRtoGSjx3OTX2lKopjNc5nz+
         wrJ9whyMS4L/v2fMXoG3hykmkc5efUIgM5uvSwYF1ILWkVs6TabD0tPpavirK9+kS9bH
         c6DIUt/jTlW+ZznDyEfdeKVRwIKHRky9NqroDS+/L5e6Ji9CCPwPJmlBJNhw2Oo8DEoJ
         2s3d6Gy6oGvcp6GzDgPj/LnAd75XDT1+sLrG/VWkW6YLA/6U2iOsExydwuRSDvvswQ23
         6PtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=x7Dw46zWLl+eoDZ/eEPovBwW+lbl5NQPMvw6CLb6yg0=;
        b=qWWcQFlT7IpCNfxd3jOwlwEZCl+DP91VhUDvKoC8fy+MtXQc6Uyp6q5ITr9J3tYJHf
         +sR1fLIrPLNn+M2C63JujO1pcP/zRiEz+mZ0NfIcbi2c5L7EykENW1EC8Kv+ThbWrFQU
         S/B8q0U8gNTRnCM+S69KjfJC4k2zQv6Rw+w1PF2yMdblP1rYXFe5CtRLmTeRieIvpAIb
         iBaSgQ82W79CRuel5ykNt8CEgjoFRmu6+AlzhTASA7c3mxA3sn6696D8SpdnKuu+H2gO
         N4UXRDlO6OjKjmrWbkU8Af61KJFf02+5v6QA7d0bhKPzogj0PF9jgor7I0bsItXVaqo0
         VflA==
X-Gm-Message-State: APjAAAWIaMbQqXH2d16PP5wBBqjoxVJeeYxs5gALlFYBfODjj/7SXfhK
        W+xKlciRNagYkSyVPr9jAwFEv3q4
X-Google-Smtp-Source: APXvYqwEZAfi1eB+HQg3sPLyTnYSLhGzyPyS+uMNi8vhskM0Jl9DXYHWnmvnWrXvrzrwhvdlTHVjZw==
X-Received: by 2002:a17:90a:a46:: with SMTP id o64mr1954968pjo.90.1565544988573;
        Sun, 11 Aug 2019 10:36:28 -0700 (PDT)
Received: from mappy.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id u23sm24074089pgj.58.2019.08.11.10.36.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 10:36:27 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: docs-rst: Clarify duration of LP-11 mode
Date:   Sun, 11 Aug 2019 10:36:20 -0700
Message-Id: <20190811173621.20454-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a sentence that makes it more clear when the CSI-2 transmitter
must, if possible, exit LP-11 mode. That is, maintain LP-11 mode
until stream on, at which point the transmitter activates the clock
lane and transition to HS mode.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 Documentation/media/kapi/csi2.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/media/kapi/csi2.rst b/Documentation/media/kapi/csi2.rst
index a7e75e2eba85..6cd1d4b0df17 100644
--- a/Documentation/media/kapi/csi2.rst
+++ b/Documentation/media/kapi/csi2.rst
@@ -49,9 +49,13 @@ where
 
 The transmitter drivers must, if possible, configure the CSI-2
 transmitter to *LP-11 mode* whenever the transmitter is powered on but
-not active. Some transmitters do this automatically but some have to
-be explicitly programmed to do so, and some are unable to do so
-altogether due to hardware constraints.
+not active, and maintain *LP-11 mode* until stream on. Only until
+stream on should the transmitter activate the clock on the clock lane
+and transition to *HS mode*.
+
+Some transmitters do this automatically but some have to be explicitly
+programmed to do so, and some are unable to do so altogether due to
+hardware constraints.
 
 Stopping the transmitter
 ^^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.17.1

