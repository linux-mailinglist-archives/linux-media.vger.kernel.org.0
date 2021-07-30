Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6410E3DC057
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 23:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbhG3VjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 17:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232322AbhG3Vil (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 17:38:41 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4334C0613C1;
        Fri, 30 Jul 2021 14:38:34 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id p38so5649695lfa.0;
        Fri, 30 Jul 2021 14:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yLXPblcRDB2e05zOf4kHv3HzeYLhfWQaVsNCdJRIDlU=;
        b=GFPiExi40QXxFrlgXj+pDS+2S1/BbNETpI5U4PkFtdqyhr+cljTUknLzB5d2gIM3yK
         YhOvW7sgBVU0QgRkdFoJs7D+dw88vCCuSgzyY6n4eS6dCiGp1KpGlJEnUmcPoy/EGPvC
         6wyxZTN2dlmOeTl/pJl+NQ0oIoDqvKV6xkJ3cf8RC7C7gkm97hjp0AmQBWD8QZtCKf9K
         JuDukEnBXryYeKOmq+TqLEeZ7oyEvJYWKwwftEQW0uaaikqkUc/wcBrTT804MSqjTNXg
         IEh9rUD0a4YVcosjKxIKYT06DoAv2Mst6idfS+vxbpAvqPs67y8SkwIflcrwwbDGvSUi
         PPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yLXPblcRDB2e05zOf4kHv3HzeYLhfWQaVsNCdJRIDlU=;
        b=fN++q37/J7U39EqrAUV78Q3MpgMX08tNQXJmooTDldj23s5ohGSpCgW9iQFLJs98SV
         bwMnn+VO/H9FOMXxkgxFrajQ8Tt6lhZeIWsQdZJHonIbAdS1RrW7qdKzLFmzaItfAA4+
         Z+zZDGUbqKwGTX7p7lYgGzvXILNSiZU65O58bvSMRMkXxvuoNmMrISbZcqum58Sz36OA
         l5xbdcWLrgJabq3685HzUnAz9B1kFIflFg8L8UhcN5E/YnK+OMy8ey9FhfE6o/TQxRUR
         g8NFd2EEqd17DdVpHF5CSlt345dmapZnNDewCN9rKjBbNM12CYy2ddi/Pbf3khZaoxHg
         1UTQ==
X-Gm-Message-State: AOAM533KMtgrnndE8kXlt0MyVe5+pOTDFjMADzlbc8LBdm2w9vnFkkjJ
        1fqAHMBeCjyoJ6VLTr+66NU=
X-Google-Smtp-Source: ABdhPJzoWsLXZWbdU4xjzqJyPcdIeoDTQ0FIGpaqB+EYeYNTmh1szh/H15kin37XS6oc8jXHEeOToA==
X-Received: by 2002:a05:6512:230b:: with SMTP id o11mr3593469lfu.292.1627681113067;
        Fri, 30 Jul 2021 14:38:33 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.213])
        by smtp.gmail.com with ESMTPSA id t17sm177373ljk.102.2021.07.30.14.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 14:38:32 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
Subject: [PATCH] media: mxl111sf: change mutex_init() location
Date:   Sat, 31 Jul 2021 00:38:29 +0300
Message-Id: <20210730213829.2909-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
mutex. The problem was in wrong mutex_init() location.

Previous mutex_init(&state->msg_lock) call was in ->init() function, but
dvb_usbv2_init() has this order of calls:

	dvb_usbv2_init()
	  dvb_usbv2_adapter_init()
	    dvb_usbv2_adapter_frontend_init()
	      props->frontend_attach()

	  props->init()

Since mxl111sf_frontend_attach_atsc_mh() calls mxl111sf_ctrl_msg()
internally we need to initialize state->msg_lock in it to make lockdep
happy.

Reported-and-tested-by: syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
Fixes: 8572211842af ("[media] mxl111sf: convert to new DVB USB")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 7865fa0a8295..2e5663ffa7ce 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -931,8 +931,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
 		  .len = sizeof(eeprom), .buf = eeprom },
 	};
 
-	mutex_init(&state->msg_lock);
-
 	ret = get_chip_info(state);
 	if (mxl_fail(ret))
 		pr_err("failed to get chip info during probe");
@@ -979,8 +977,12 @@ static int mxl111sf_frontend_attach_mh(struct dvb_usb_adapter *adap)
 static int mxl111sf_frontend_attach_atsc_mh(struct dvb_usb_adapter *adap)
 {
 	int ret;
+	struct mxl111sf_state *state = d_to_priv(adap_to_d(adap));
+
 	pr_debug("%s\n", __func__);
 
+	mutex_init(&state->msg_lock);
+
 	ret = mxl111sf_lgdt3305_frontend_attach(adap, 0);
 	if (ret < 0)
 		return ret;
-- 
2.32.0

