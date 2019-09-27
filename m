Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB2CC0BE1
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 21:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfI0TBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 15:01:34 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46225 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfI0TBe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 15:01:34 -0400
Received: by mail-pg1-f196.google.com with SMTP id a3so3931833pgm.13
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2019 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=/lgDO+Y1jJdPj/deaXJ4mCd50LAHh/sOjupewGydhNw=;
        b=BSeKoZyHeWszSz8d9GJQoetlEEWxtSX/DQxjtZQZCPutp/ASYKdo7QX9W+5hcdtT5u
         IsTCAtqpPzF6rRuFlskgXXlIYQWBymh+IBTPOK6gobPQPjRYfssClKQOrKm84kVgADAp
         JPkZzxLd7pD3AA8kyzXzcWeZEWP91BG7soJrSVJXYam0FCDGs1XIY8+rzhoDv8ZZOBt4
         n6yNZF2KHIVivIjmJ86q/Cl6B9Sg+sBW5ordNF31aQQlmOSF1AwME2Q9uLEr6sQLeX/o
         sTS0aWDLV2VJUeeTH/bOx0heAvsmuY3bqMbblui59ea8Y+3BpAerRkbCFqeK2ExunAyK
         /kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/lgDO+Y1jJdPj/deaXJ4mCd50LAHh/sOjupewGydhNw=;
        b=pkPiatzh56yiT4J7Ocb5qGUeSQEeJ3KJmg91eSLW3wlXjDX/vgJ2j9v2Bws59QupWw
         Ra0qVpKixIW8yUBxtkU6UDCDTg56VV1qZDsktgnBG1Xs5eQGDXQ8vcA1gRxJs5QDnwRC
         CfDzolMK+KsKEQ0VoIRU5iRlhrwltmffnjRcjTyMLj3zJY1WClV1apWHKF44T46FaStU
         3Fa//i56rIaXllLuRETgb6/VHsEXNyvYxO7u7bCVQKGnD+RI0/C2lyJewHvqd3Yg20fF
         5EeSK1OVi+Lqx1Q+eGaEmcI791BKPQBbsONCdshdnz4q7soD6AmnwsbJigZFOobSf/tU
         jVBg==
X-Gm-Message-State: APjAAAXSsa0TlR/nUxPyfnZ4JzMnl4nh6hojk4FRMLklnk+KULSWVwck
        y9nXZLwxWSvSiCsGWLHBT8Q=
X-Google-Smtp-Source: APXvYqzalhKaI5HAmahul3baUn6K536kQt7skR5fAFOvjP4/Aj2xBHMhTLrFfeolrKV3mNn4oNTmZw==
X-Received: by 2002:a63:f14c:: with SMTP id o12mr3657459pgk.386.1569610893249;
        Fri, 27 Sep 2019 12:01:33 -0700 (PDT)
Received: from madhuparna-HP-Notebook ([2402:3a80:501:4d94:7181:5c70:92e1:7c7a])
        by smtp.gmail.com with ESMTPSA id v9sm3262403pfe.1.2019.09.27.12.01.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 12:01:32 -0700 (PDT)
Date:   Sat, 28 Sep 2019 00:31:27 +0530
From:   Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org
Subject: [PATCH] Staging: media: ipu3: Changed unsigned long int to unsigned
 long
Message-ID: <20190927190123.GA9230@madhuparna-HP-Notebook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the following warning:
WARNING: Prefer 'unsigned long' over 'unsigned long int' as the int is unnecessary

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index 3d969b0522ab..5f3ff964f3e7 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -130,7 +130,7 @@ static u32 *imgu_mmu_alloc_page_table(u32 pteval)
 	for (pte = 0; pte < IPU3_PT_PTES; pte++)
 		pt[pte] = pteval;

-	set_memory_uc((unsigned long int)pt, IPU3_PT_ORDER);
+	set_memory_uc((unsigned long)pt, IPU3_PT_ORDER);

 	return pt;
 }
@@ -141,7 +141,7 @@ static u32 *imgu_mmu_alloc_page_table(u32 pteval)
  */
 static void imgu_mmu_free_page_table(u32 *pt)
 {
-	set_memory_wb((unsigned long int)pt, IPU3_PT_ORDER);
+	set_memory_wb((unsigned long)pt, IPU3_PT_ORDER);
 	free_page((unsigned long)pt);
 }

--
2.17.1

