Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCBF358FBD
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 00:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhDHWTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 18:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbhDHWTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 18:19:54 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A1EC061760;
        Thu,  8 Apr 2021 15:19:42 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id y16so2875079pfc.5;
        Thu, 08 Apr 2021 15:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=LGRX6ULXaym2QnaLDDeOc3iQ2mdXQmSNVaooLdjGPVM=;
        b=tH2IxDmBOhLU/kTmr7oFMXuhAZkMQkEVcuC3YB0XMuOIJ8iHkPwBS2FL2XFHazwwha
         2Hpn9u5JppW9li+KRfcGviHcat0Y/gcgl2nieQNrrDJQFZFHbQjbz0CULc3xnAt5Z8wc
         kj8IYGrohufRONIPulOK/8LMfEV5VrNNX45l7R+F2R7WERXmYipl4dyUl/IqtpqO8si9
         yisuU/ubykbl9JanCMEAlYPy73PKf2Rx5KZ8i77gf8AjFJOmidnAOemiay+xU+b63PUn
         /+1xU3hc7OfuEgYe4glzo1JuUsotL+gSJoxFogWfzMPgLCuEAQ/oY8S7y1qRqRi0ftdo
         bvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=LGRX6ULXaym2QnaLDDeOc3iQ2mdXQmSNVaooLdjGPVM=;
        b=fT7Qao6F8AdbjgU5QGD5Y+yqEA0e8KI3eWI3YH1iZbUiwG98QqHKiVIlp+QIpznYIC
         SxkP1bCkWxKiKUB/zhG4K4wJCNBfUGpWQo8P0iS2luqz+q4yqe8GFoz8t5VvYPXYmyaE
         wUywiTjv87wqRTGd25XLU5Hb30Yk/TC/hqQYCiPdg7iYEze2waJI8B42sJDrkKa+675v
         nrJuatnxfgO3g5vz3Z4TKTNxmK3nLjfuIDyV1K2GYg908ONokcTFeB6/dlSO49J+6PX5
         7uUM27DCGNUr+7g3doKxI7Z6DMthWn7ND1ec6t5Q4su4wEbEgjQJxd/cUxDxiSWVoRs8
         +p+Q==
X-Gm-Message-State: AOAM532abONYwGs1kqAj1o+TFIyd8HouDcBuVQ2eK6NUx1zIlHhisysJ
        xDJEunEZ+ua6GPQRP5mp+N4=
X-Google-Smtp-Source: ABdhPJxt23GS2GdDmzrrWB7E7KVTxxcmtikT7y6/YJa/OMyrw8mrw4n/DoxlNqLKb5idus8d/xGr/A==
X-Received: by 2002:a63:cc:: with SMTP id 195mr9911498pga.282.1617920381578;
        Thu, 08 Apr 2021 15:19:41 -0700 (PDT)
Received: from kali ([152.57.243.224])
        by smtp.gmail.com with ESMTPSA id w127sm387203pfc.51.2021.04.08.15.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 15:19:41 -0700 (PDT)
Date:   Fri, 9 Apr 2021 03:49:30 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: media: meson: vdec: matched alignment with
 parenthesis
Message-ID: <YG+Bcqxetfj98l6V@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Matched alignment with open parenthesis to meet linux kernel coding
style.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 48869cc3d973..21e93a13356c 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -81,7 +81,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 	}
 
 	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
-					(u32[]){ 8, 0 });
+				  (u32[]){ 8, 0 });
 	if (ret)
 		goto free_workspace;
 
-- 
2.30.2

