Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BE52EAB96
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729924AbhAENKr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:10:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727650AbhAENKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:10:46 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670BDC061796;
        Tue,  5 Jan 2021 05:10:21 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id v126so26254266qkd.11;
        Tue, 05 Jan 2021 05:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7V116JlniXowvoRil+y9QTOIRjNYDEUqk7cGXQm9XJU=;
        b=fOwI65AuUdFjysiIf7D37W8dRQ+AtUhRQO2LHgbSqZZtqyReJn42INs+AguEFda0ho
         IgeDn1d3GAhCw10aZZlEPCoXzQMEHQAutZFipWBFfX8B9IIuR5XON9bJuBk7bRFtuXNj
         6m0PdNNzNeiM6VSBjdrrkbhKVeN84cMXbHqDeEaIBz8/e49DG6qU6xAT9xSvxb58C1FK
         wn//yZ78LSDxqlPckXPeb3uf3VyQfWEPUascENb/vxS0jzNQ736wqb7V3xtCm2tnMy9t
         I2ww/sYbsn+rnAni4Oirf2AZ8xDw23wd0tqrnQ/inxhVPyzcEIppHFsPT8gaj1bxvUmf
         I74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7V116JlniXowvoRil+y9QTOIRjNYDEUqk7cGXQm9XJU=;
        b=dttugTo8KV9bf2ckj87NEn1G0qS3YxQVVrL7N4jkzVi7QYFp1Ml2DTM8iZVbOhFk34
         dqroDOkAnPYU2Te0+0zWveV2cf6ylyqu+AK30ygL7IqSqAWp47IpgP7qFDbeax/Z77eX
         pe7qQrgjlsSsW9xomPhJ5kgSQ3AzoEibn0I0Onba/pjpYCmH7ExzeS8lt8QnmrNZbNm4
         DK6zxkEsQvhsGWoyJPOyI9x2kFH07gPdtH7y8yy0CiYxUsGpui7PHUvAhFpAyOhav8u1
         VFeiXFYZx4mji8C5HDZLy9qRV3RR9NkVe9jqhm8n94YD+Lbnq6yF77Sxt6Kq5k6inzNt
         fCQQ==
X-Gm-Message-State: AOAM530fUKyLpSSAYzKettP39WU/JkroNa0/WC5GiwMePnVogD2DhAEa
        ZV4WRsaZB1N53dqAGtgTGcI=
X-Google-Smtp-Source: ABdhPJwp+HawSXDqndcEGHoRfjp3wzEfNziRoGK+VeWD6R2ADQ1R4zhQA1bWDmPAknZVZSeMvwrJ4Q==
X-Received: by 2002:a37:4d8e:: with SMTP id a136mr14823262qkb.317.1609852220678;
        Tue, 05 Jan 2021 05:10:20 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 05:10:20 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: vidtv: reinstate sysfs bind attrs
Date:   Tue,  5 Jan 2021 10:09:54 -0300
Message-Id: <20210105130956.1133222-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Reinstate sysfs bind attrs so that vidtv can be bound and unbound
via sysfs. This is useful for automated regression testing in
userspace.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 4424f9585f86..4ccaa0f00639 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -569,7 +569,6 @@ static struct platform_device vidtv_bridge_dev = {
 static struct platform_driver vidtv_bridge_driver = {
 	.driver = {
 		.name                = "vidtv_bridge",
-		.suppress_bind_attrs = true,
 	},
 	.probe    = vidtv_bridge_probe,
 	.remove   = vidtv_bridge_remove,
-- 
2.30.0

