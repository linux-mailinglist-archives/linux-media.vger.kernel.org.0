Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB1723E924
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgHGIg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727911AbgHGIgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:52 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F295C061574;
        Fri,  7 Aug 2020 01:36:52 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id x12so744672qtp.1;
        Fri, 07 Aug 2020 01:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DUE252qTwG6pYCLxjiyv/ngOQ0xR7QYJFaL87GF2sMY=;
        b=uzMEy6rNW2UaFlJZyVl+dFCikep4y4iCyWPwSLeedw5+0Zudh7C8AIV5VdwlPZ0844
         O7OEZjk1utvDHFmE4g+cNycNmzcjeRhZbzw1vO5QxVzYyX26IeVWU6zeD5R7XTl1EIb1
         Pbt4nDYd5zhUfj1QNKHVu9Xg/izSwD6D94lIcMkYIdMAxT0GpRpS2W/+6YfPcBCyWCi7
         lQYsOWTiq9T91YfUy6kKE/alB+Ipwf/n5OWkOcQWhTLGA7jetmICv4r/aeTSlbxr0k0X
         +1nwO90NkKlBJbyYAV9EePOXmZPzijcRmgr8n8zNadRfJXE55gN+Icm94LiaoX88kumQ
         mrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DUE252qTwG6pYCLxjiyv/ngOQ0xR7QYJFaL87GF2sMY=;
        b=Yij9PKhhXaC1hoPqMM+zOBDw/Y8+hCAAjkMdWZjBxU8En2jW2OGbGDXEAZmPjM5Y4g
         ThzJoMY/nwPuK+Kne+le3YHocQG/unaCqQ1G92uZacM+JUEWiTL+w6bTbH10ZhU+BYIp
         V/UDXqxBL+mNWnfFlnjpfettMRlj73xbAol6DKlbbbWaFRdjmDohKtU8kV42xIuNSezq
         n4Izw6r2+ilDynVKI2MN6bwiDiBYrP5SOe3co2mZr48BL774MFP5RijNY8mGD8spSnY2
         xE14uKKE3KG2aCKUmFQbJEUJ7xL5dzpWAgnNp+uywF5UzjIQbFK1oYZlG/Opg5wIErvJ
         o+1Q==
X-Gm-Message-State: AOAM532SAhGqqgAmbyTB0gQqJHVwwilPfBuuBtfDrEYrvNtolzVlaxob
        ocTRp0XrevUDqliY8c+/pD1xEkHdI8s=
X-Google-Smtp-Source: ABdhPJwVt3BU8XXqA5PKNiPH9oOQgti5GL6+F3B0ymJfTvmoLaDFuU4c06USRyBWcKq7kD29+q895A==
X-Received: by 2002:ac8:42ca:: with SMTP id g10mr13471874qtm.219.1596789411530;
        Fri, 07 Aug 2020 01:36:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:51 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 13/20] media: dvb-frontends: mb86a16.c: remove useless if/else
Date:   Fri,  7 Aug 2020 05:35:40 -0300
Message-Id: <20200807083548.204360-13-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle report:

drivers/media/dvb-frontends/mb86a16.c:1455:6-8:
WARNING: possible condition with no effect (if == else)

Both branches are the same, so remove the if/else altogether.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/mb86a16.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-frontends/mb86a16.c
index 3843181bba16..2505f1e5794e 100644
--- a/drivers/media/dvb-frontends/mb86a16.c
+++ b/drivers/media/dvb-frontends/mb86a16.c
@@ -1452,11 +1452,8 @@ static int mb86a16_set_fe(struct mb86a16_state *state)
 							wait_t = (786432 + state->srate / 2) / state->srate;
 						else
 							wait_t = (1572864 + state->srate / 2) / state->srate;
-						if (state->srate < 5000)
-							/* FIXME ! , should be a long wait ! */
-							msleep_interruptible(wait_t);
-						else
-							msleep_interruptible(wait_t);
+
+						msleep_interruptible(wait_t);
 
 						if (sync_chk(state, &junk) == 0) {
 							iq_vt_set(state, 1);
-- 
2.28.0

