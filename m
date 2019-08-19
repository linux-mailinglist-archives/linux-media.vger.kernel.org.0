Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1002F91DFE
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 09:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfHSHhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 03:37:07 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42809 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfHSHhH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 03:37:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id i30so666235pfk.9
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2019 00:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sTwE1kzHyYHA7dDNOOwRZ75yFPMR6k8B+jW2U9IUMDs=;
        b=YcJEQpLCHlJ982b97AImvdfJejn6HFVi2Bvmkx/eiSTbdBDpsQpjxVlAdksZwzm9gg
         HLSRcRtdJdM3tFYHlKCeMzg+yGZJXoOR5Q8bxje13nYoheJ96IASGMCQazzuFHL0Hc7M
         PnG3X6tu64LmPEJd3wyZDCX8VSWvNgPAB01z4nGw/ptIwPee+LBXpRlY3KqH++c+KoWa
         H4tRXQUaifehN20lUDcnOXqYuto4lWJqMkc02/Pl2msXxeVIYJFiTNuRziggF51ZjcZn
         9HnZ0AyEXGMY9zEoSg3dSp0ArptL5DmTbfDbO9d4mBjel9FH0/c6n/SJsqiOA9rKcli9
         QjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sTwE1kzHyYHA7dDNOOwRZ75yFPMR6k8B+jW2U9IUMDs=;
        b=BHVhFi6wkZbVAYv34yNKIq4DbhIAFjMeVHxhzJRnZc0eXbf3rgbRlsRbb4i+37ihXV
         f9PrOLNPGAoTXnhDrfpA4NZIGyX+koPPzv2pgh63iAoTvWm2HnXIMaZi3ZU52dlYeyM9
         F6w8mE9TQvLSAskQzxBhnVRoVj1a20r54UaCrGzoudGxLK5Q5ZvU/fPt8ArCfpAAfXfi
         4wQuiAti5RUiUeXOcFTyv5ksxPCKXos+L2zPWzMA1C5h3Zg+zy5SacAIZKazb03dxFV8
         YrLygN5lIPF99u+6nfuQD0nvHujntQmpfwyuhrFDUyfjP3GBjuWhJPh6XD7owNt1wmcI
         1jkw==
X-Gm-Message-State: APjAAAVhF0W4FcCgHDhEEZJo6kgV89rxD0dvYCkRsNRybprYecdBrf2n
        YN2gEmsB5PnYFwZu/UooDe0=
X-Google-Smtp-Source: APXvYqw2128VcNLK/TgFWk76G501Bmb6L9kYargy3ZOkLc2lzuxwNnGpUey2LwnVEWII+bbw5FUXvA==
X-Received: by 2002:a17:90a:5207:: with SMTP id v7mr18588168pjh.127.1566200226131;
        Mon, 19 Aug 2019 00:37:06 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id x128sm20095680pfd.52.2019.08.19.00.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:37:05 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        stefanr@s5r6.in-berlin.de, linux1394-devel@lists.sourceforge.net
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] media: firewire: Make structure fdtv_ca constant
Date:   Mon, 19 Aug 2019 13:06:54 +0530
Message-Id: <20190819073654.32128-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Static structure fdtv_ca, of type dvb_device, is only used when it is
passed as the third argument to function dvb_register_device(). However,
in the definition of dvb_register_device, the third parameter is
declared as constant. Hence make fdtv_ca const as well.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/media/firewire/firedtv-ci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/firewire/firedtv-ci.c b/drivers/media/firewire/firedtv-ci.c
index a960a0ce9deb..9363d005e2b6 100644
--- a/drivers/media/firewire/firedtv-ci.c
+++ b/drivers/media/firewire/firedtv-ci.c
@@ -217,7 +217,7 @@ static const struct file_operations fdtv_ca_fops = {
 	.llseek		= noop_llseek,
 };
 
-static struct dvb_device fdtv_ca = {
+static const struct dvb_device fdtv_ca = {
 	.users		= 1,
 	.readers	= 1,
 	.writers	= 1,
-- 
2.19.1

