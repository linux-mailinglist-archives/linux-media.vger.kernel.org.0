Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC0935E417
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 18:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345847AbhDMQgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 12:36:54 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:38758 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345812AbhDMQgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 12:36:54 -0400
Received: by mail-pf1-f174.google.com with SMTP id y16so11783804pfc.5;
        Tue, 13 Apr 2021 09:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dd20NqXtrojKGrBJQbQ2lRtgUmGNTiUlPe1joyxcopU=;
        b=IHFs8FlI+E2aYsqYZDA/xjPPjwlgQOduLuWNDf2cgPNWnj3Oy9WLA9fUOhEbATI+PE
         Z4s5GySRJjI8+3wsFsACFI+AcdnjHoxdHuJGFguBUBNb4S/0cVWD4oEVq2WkxB8bNalr
         CxQVY/XPBRxFMXyGtcY0lxV0PiKL62F0c/OCpLIsCbrjA+p55wRTDcwGCOMaebnjSuBr
         tz9qcRrCtQT/Fbau2ZEWyqeyBgfSOSs0B+C3L6Qr3TXfkOhkZ/XGh6CAE7y7k86sj8ah
         Dk8Bv4iuEtHja1ussXG+SeSQSxdHCI2SQcq3izqWyGjp8CU3bwRdheVeHOWT0dEfsnzm
         csbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dd20NqXtrojKGrBJQbQ2lRtgUmGNTiUlPe1joyxcopU=;
        b=YppbHkDC0KEiF4OJaIeubyqwHq/jG1hjVm7Y33g2cg+7vbzwRXBL869Dx8TZC64TF1
         Y0VZKiFcZz8vdEVGrwx/ajU3OVSPvHQhP6HRmiK8wK/hc3cBGpVkSLoGg5uicCTqQ1S0
         tldZGc4zxUGvw4Z4JY/F0cgjW5Ov7H5jQN0fZE7IHwkNC76t/4DkZtaZCDe2yA20hdAU
         UXPvMbaIZRssJDHuGJ/jxl3eRQW6ccZWLBczs0mRMYThqt1XebrQwK5z6AbOquRFUmLi
         DoeEO2A1m3pAWXWv3izOlYEkdnTFlhJAWsKuoteu4GPM2guZFeDSjLDy5sKvqBhfYvPN
         8agA==
X-Gm-Message-State: AOAM530/GSLnhhtVXJxLOfYvkKEjeQVYB3hgUJDXAb76+sL8tl+5xiJk
        KiG1l6vDSDlEPGmm5FKL33Y=
X-Google-Smtp-Source: ABdhPJzQfoOV1tSHdZTGBisqi78C3nrKplsv/ZKnmC8yl6nptENeS276rzZ7sxyorD4DPW2QPa20+g==
X-Received: by 2002:a62:824c:0:b029:21b:66f5:c813 with SMTP id w73-20020a62824c0000b029021b66f5c813mr29926041pfd.32.1618331734483;
        Tue, 13 Apr 2021 09:35:34 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id v11sm14904582pgg.68.2021.04.13.09.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:35:34 -0700 (PDT)
Date:   Tue, 13 Apr 2021 22:05:26 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v3] staging: media: zoran: reduce length of a line
Message-ID: <YHXITpUbYOb2lO/u@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduced length of a line which exceed the 100 columns limit by splitting
the line into two statements and commenting it with '*' to meet linux
kernel coding style for long(multi-line) comments.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v2:- Rebased this patch and made changes against mainline
code.
Changes from v1:- Made style changes according to linux kernel coding style
for long comments.

 drivers/staging/media/zoran/zr36060.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 4f9eb9ff2c42..27eec3446592 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -249,7 +249,11 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
 static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
-/* SOF (start of frame) segment depends on width, height and sampling ratio of each color component */
+/*
+ * SOF (start of frame) segment depends on width,
+ * height and sampling ratio of each color component
+ */
+
 static int zr36060_set_sof(struct zr36060 *ptr)
 {
 	char sof_data[34];	// max. size of register set
-- 
2.30.2

