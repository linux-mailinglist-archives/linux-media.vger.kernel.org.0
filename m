Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4410D1B1512
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 20:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgDTSq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 14:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgDTSq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 14:46:56 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1551C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:56 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id w11so5500266pga.12
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=g68zxpe+2p1NhAysww2SRNsJk2ocGU1FZ0mv5f1WMCw=;
        b=JpEf1otNdl4cQ2Pt/XJibMzCWmcxMgt27j75VnGmysvSuoQwds15nqMtc6UBs4iq/2
         cEgS48p/ZGRT0c0TCsOM8ZU2+9FLr96ocGO9ghYx+1k8gUD+qY/a0b61thjy2Ib2+Pp1
         1Je/l1WH6k0/u5SbJTiIGULEVuDGeHpqJCju9lvbKX6A7WW5HtIUcfz4ZMJF+sHUydrK
         mWxmH3jzkwSLtDOD8pR1vucjPOOg58KCEiS2mjo5ZCGdohLD96aNOaCo+Itl8B75UmHN
         o3p5fivoo/KEdZBZ2XKnPPUlmn7uo71uNMBT+jUv/VJtDAb9vc30rc6iNr+5kjEd4Ezz
         R2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g68zxpe+2p1NhAysww2SRNsJk2ocGU1FZ0mv5f1WMCw=;
        b=fCOhu1tC1p7OZoJlaRRhVBOdXsAPkQghTnB8yfciBs+N+cTHhTkvXpzLUhOIyvT0q0
         Aq2kVuDNJQ86HwQBcXQI9yWDMARdyEMgHQIHoSG/UObeAs2ZLcUr5tJPIcPqMLTdiJZg
         iRdwmoEGKm0L1WvjUycDeA4dKLq+0yMnVpUAL5TNT/j1ywB2HMySukSE+nkOuQlQ5I5G
         oMjbsTCqxFbtk38rJIjEKJrJA02onQY4rDXJHqomZExBbhmWgcpndJrngW7ybwvUxyWs
         /4Sb4on9zcCexDGV+ODUmuTAPeAdzIVgPl4CMAv+x0A9GKxhvY881ook46WrgZSZPukp
         JuJA==
X-Gm-Message-State: AGi0Pua4oXuDZfGGiSj8HwCL3O48Roplt8RiHaR+7IYMsM0LnNAnwQbO
        v20SC/qfz3iI1+X3Vt1efKfxCWhP
X-Google-Smtp-Source: APiQypKglNl/Nv97ICUb6Zee1CnoZoEhs4ebLDlnrDTzOo0yHA0PKOpj1vb1quBImGavTeec8uzUyg==
X-Received: by 2002:a62:62c3:: with SMTP id w186mr17641447pfb.105.1587408415991;
        Mon, 20 Apr 2020 11:46:55 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id n8sm182443pfq.213.2020.04.20.11.46.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:46:55 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 5/7] media-info: fix NULL check
Date:   Mon, 20 Apr 2020 11:46:47 -0700
Message-Id: <20200420184649.4202-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200420184649.4202-1-rosenp@gmail.com>
References: <20200420184649.4202-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with clang-tidy's bugprone-bool-pointer-implicit-conversion

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/common/media-info.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index b0f0bc41..cb48d0df 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -357,7 +357,7 @@ std::string mi_entfunction2s(__u32 function, bool *is_invalid)
 			return fail ? entity_functions_def[i].str + 6 : entity_functions_def[i].str;
 		}
 	}
-	if (is_invalid)
+	if (is_invalid != NULL)
 		return "WARNING: Unknown Function (" + num2s(function) + "), is v4l2-compliance out-of-date?";
 	return "Unknown Function (" + num2s(function) + ")";
 }
-- 
2.25.2

