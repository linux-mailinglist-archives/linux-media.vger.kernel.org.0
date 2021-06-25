Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5CF3B3C68
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 07:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhFYGBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 02:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhFYGBr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 02:01:47 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBECC061574;
        Thu, 24 Jun 2021 22:59:27 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id h1so4189635plt.1;
        Thu, 24 Jun 2021 22:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCGH/FcGgZLZwVutQlRor27jtENZPQC1aKykMVpoemk=;
        b=OEzVWHvUS6gW+qon/kkUu1yvA4imVktVgaU4D96/MpUVvA6Uss8Kvf00EtQRFxRlKG
         fOBQrhJYOjmBXfV2yFT62LOs5Wqni/RSoW6FyFkGxd6EQZjFhoxJ0VilOzrwVNQRtrHB
         FuEj7GqmGvt9hJD2GWSTAWl59BjVSyskP6pNEBp+wtIRXM66UL6EG0RHqdfFIcRg4xR6
         YevCkWxrbji3ZTttLa7DatTjJvJwWaZ5s4AU/y5gIqflHGqYwKjlFMvDp5LB0XWeonnG
         IcuS6bwV1iURPl8WBOdctFdsNAjRcDtM9Rwca2JVy5xrsmh1RS2uQx9CgSAfLsUfp3dK
         Qd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCGH/FcGgZLZwVutQlRor27jtENZPQC1aKykMVpoemk=;
        b=m+ioX0OaKQnVlx921Ddr2kf0GF0K08qw16pAGpIuYWJZD2Svo+y7IayF5MJNSFTJoT
         zbL3m10PCF8EyKhXZ5zKw2TXWDaBbYGuzyC6oIunyxs2/NrRyeatwj+n7T0HqZe/NY7G
         RFx64CxwfRrdXu916fSgtsDYv9P7CeD8ididiiRgpQEs/UOZV4HSnAPJT9VkZM8uvkhH
         00j0Lj0wyosDtC0oaBj9PrQZW5iQVyUO2XuVcWr2GwB+y3xdInF42AY15uFhWbnR2KCY
         UHdw3t5tBwn9raDRgnjBY/V/CakcOwb7uJgKqSnJ/d5c2SDB1netJPUuwZ28yRAQUpzi
         lYCA==
X-Gm-Message-State: AOAM531PQf1n6iIZkCzDKKdj40Z69qB5mbaJAio8ULRxUQbvQogFFUyT
        3jf/RzHwStGaZDgtxCTVI/w=
X-Google-Smtp-Source: ABdhPJy6Nte3fkvc6dkBlMIVdqVnXq/sd4XEW0wR5kI0TM+EOekgWURVRFLMhhWvyIbVVBZeAuhBiQ==
X-Received: by 2002:a17:903:208a:b029:125:8b69:53a1 with SMTP id d10-20020a170903208ab02901258b6953a1mr7865880plc.17.1624600767361;
        Thu, 24 Jun 2021 22:59:27 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.130])
        by smtp.gmail.com with ESMTPSA id m3sm4621649pfa.70.2021.06.24.22.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 22:59:26 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb: fix uninit-value in vp702x_read_mac_addr
Date:   Fri, 25 Jun 2021 13:59:04 +0800
Message-Id: <20210625055908.467220-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If vp702x_usb_in_op fails, the mac address is not initialized.
And vp702x_read_mac_addr does not handle this failure, which leads to
the uninit-value in dvb_usb_adapter_dvb_init.

Fix this by handling the failure of vp702x_usb_in_op.

Fixes: 786baecfe78f ("[media] dvb-usb: move it to drivers/media/usb/dvb-usb")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/usb/dvb-usb/vp702x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/vp702x.c b/drivers/media/usb/dvb-usb/vp702x.c
index bf54747e2e01..4aed6f807f25 100644
--- a/drivers/media/usb/dvb-usb/vp702x.c
+++ b/drivers/media/usb/dvb-usb/vp702x.c
@@ -291,16 +291,21 @@ static int vp702x_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
 static int vp702x_read_mac_addr(struct dvb_usb_device *d,u8 mac[6])
 {
 	u8 i, *buf;
+	int ret;
 	struct vp702x_device_state *st = d->priv;
 
 	mutex_lock(&st->buf_mutex);
 	buf = st->buf;
-	for (i = 6; i < 12; i++)
-		vp702x_usb_in_op(d, READ_EEPROM_REQ, i, 1, &buf[i - 6], 1);
+	for (i = 6; i < 12; i++) {
+		ret = vp702x_usb_in_op(d, READ_EEPROM_REQ, i, 1,
+				       &buf[i - 6], 1);
+		if (ret < 0) goto err;
+	}
 
 	memcpy(mac, buf, 6);
+err:
 	mutex_unlock(&st->buf_mutex);
-	return 0;
+	return ret;
 }
 
 static int vp702x_frontend_attach(struct dvb_usb_adapter *adap)
-- 
2.25.1

