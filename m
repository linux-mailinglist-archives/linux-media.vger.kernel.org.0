Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C820E1AB685
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 06:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgDPEJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 00:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgDPEJf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 00:09:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CED4C061A0C
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 21:09:33 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d24so886718pll.8
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 21:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aug5D5hNXJ8g1qJIedi5oiaPSVnI2yZuJpJF60Innsk=;
        b=rVC/NVtx9/N1yYAuZT59Z3x0ko1MU4V/1kSE6VCSvu+0KYiXtNdb5VBWcCUExkzFLG
         ZV8mFnYc3OYYWIn3PHyFpwctijAu9xqOF5pqI//IE0UTo3Xmv3w2wgeIDVDy3FBffQvR
         woE4uA4Lqh+sI27Of9pjz8LjQic7bhsw1OIoc5tRKN2FIX2+xVymp28Kp7uDvHZMUKO6
         WzvAxlUroXVMZRadIb7d48QMeK77FU3VdkrNW+DDpux1nqVGmbhDPAZuWp55OBgB+T65
         g2V7xEY7M8+Ga4s1uho4rqqvXRUquVoUWUB5e/GNdO9nnLI3XR1BXPujoCnfdDE0O6E8
         /M3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aug5D5hNXJ8g1qJIedi5oiaPSVnI2yZuJpJF60Innsk=;
        b=m9ezHYlCMh+zmrrOWEVa2S/ReYYqF9ydLTCpYe9dcel3ikOdHD+JnH0XwMGsqixd24
         ecLDueT1JzwsP8qirFASpmcoTSvVFOD2t+fqWEyJjXO1agPTWlhJYT9ku6Lahb4h6yBf
         bTii34+pDlHTX31/V/hY+cLDmZ+c/rLS2eMLEDq7TaA0i2ES0S4zLGw9NI+gllv3MSzw
         gBYs3JE+7eyuxxgXbKRDkIH5zTgZybRiVKfOffukQJadbd/IZRN/ypSsANLhFO7gZXxl
         qq47aYhkrnF29Ex1TkW4XblLDPN9APuX0yzFMHlenLh7uAF1+aPGyhCv8ULhsdAZJmg4
         sbMg==
X-Gm-Message-State: AGi0PuZCMMEFPmbfBeUB/VIbaA/c38ZBKSqZ4M0INLEVg2nnxS9Ro2Js
        eqemx6gJCnsX6JUwWU+CNH4zdIJY
X-Google-Smtp-Source: APiQypLsdU+PgVR0k4aDpJadh2qtDeecnF/Bb+rRBMrt8/R7V/N0kFHiZiHR+qSPaBMxUBhW+T9IZQ==
X-Received: by 2002:a17:90b:3849:: with SMTP id nl9mr2683341pjb.86.1587010172559;
        Wed, 15 Apr 2020 21:09:32 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id np4sm1104017pjb.48.2020.04.15.21.09.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 21:09:32 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] dvb-sat: remove pointless abs call
Date:   Wed, 15 Apr 2020 21:09:30 -0700
Message-Id: <20200416040930.388895-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

unsigned values cannot be negative.

Found with clang-diagnostic-absolute-value

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libdvbv5/dvb-sat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libdvbv5/dvb-sat.c b/lib/libdvbv5/dvb-sat.c
index 18e2359c..9c060161 100644
--- a/lib/libdvbv5/dvb-sat.c
+++ b/lib/libdvbv5/dvb-sat.c
@@ -715,7 +715,7 @@ int dvb_sat_set_parms(struct dvb_v5_fe_parms *p)
 
 	rc = dvbsat_diseqc_set_input(parms, t);
 
-	freq = abs(freq - parms->freq_offset);
+	freq = freq - parms->freq_offset;
 
 	if (parms->p.verbose)
 		dvb_log("L-Band frequency: %.2f MHz (offset = %.2f MHz)", freq / 1000., parms->freq_offset/1000.);
-- 
2.25.2

