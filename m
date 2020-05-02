Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDB31C2859
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 23:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgEBVSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 17:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbgEBVSY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 17:18:24 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF96C061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 14:18:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x17so16220269wrt.5
        for <linux-media@vger.kernel.org>; Sat, 02 May 2020 14:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xvKZtWvLDJUSszhCk/0TCojtn2IjRUDkSqUjk0vs1Ro=;
        b=PkgSlBFw0N/AcwS/vnS68bSrokGvdYWpRCHt7b6C+AgPcvY2Ay+A+rKjVursWngKQO
         A3PacAN4KSzA/CRg/JpB+t/GB3KL1hsZtKFQ9jcC6B11Ncb6Fho55+Lvk1TySjpZ4tN9
         SN4TyFtbPea8y9rVe/fH4nk6uVVd9QSvmCvDJN57hlFrksoKy33qw8RWx4Cz7elo1MC+
         66GDmPpgj/8v0SZL1BE4wJ7IKk9zBdvq/ajqeed+NvrLBz2tkk1QJYNZPDAZXzf0YXAi
         i8GLYvxZCIGYeudUubKEFUvl829g0/QcrOv3lDyz8KurgkUsewdOpJLM4OqIBSMVm5Ov
         PM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xvKZtWvLDJUSszhCk/0TCojtn2IjRUDkSqUjk0vs1Ro=;
        b=uOd8l56rfoA4DbRFG7B3pbJOzGi/2NEQVkrmNBXkBEgQCY+u961RWB1G8lHLISn/Hj
         PGOWFz6oAhy4X0M+04zhQHtufsQs9KrVFRVk2ELZclWXwfYnKEsDt3gXjvpHjKlnqx5T
         1EFR6MsNN/RJFHZagJYFIMXoiaHJF3uhFu1zoXYuq2Dz1/NKvjcl2AhN5smGa1kKrwxs
         41IH2R433ZHsTZDjmR3F6c9XWG+z1qyGlq80TVzueywX+oAE1swdN4byUUr5ZGkWx14l
         eTMhyPxBKOeYULNK+B24sZNoSSYEiDEUCtyz/bhYokFJZFSU4T5LAgRfIZA90oAjoJG6
         nMcg==
X-Gm-Message-State: AGi0Pua9UeJDwvwgP5P+BLKZsCgs8G9bWh1THUciZmAnpcb6Q8zMXTIN
        2uLp6lkTgLBDYTdVKgMwDxg=
X-Google-Smtp-Source: APiQypIGEiQ1PEZsKx7UBHy/dtgl+sj7/TkxXJiCW0/kNU4UuS+NqQHRfzAPqwYAA2RQDS1KI5/Hyw==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr10771539wrv.222.1588454302952;
        Sat, 02 May 2020 14:18:22 -0700 (PDT)
Received: from localhost.localdomain (dhcp-089-098-198-217.chello.nl. [89.98.198.217])
        by smtp.gmail.com with ESMTPSA id e13sm9544197wrw.88.2020.05.02.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 14:18:22 -0700 (PDT)
From:   Daniel Gielen <gielendaniel@gmail.com>
To:     mchehab@kernel.org
Cc:     Daniel Gielen <gielendaniel@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH] DVBSKY S952v1 (M88TS2020 tuner, M88DS3103 demod): Set clk_out_div to 1 for M88TS2020, 0 locks up demod M88DS3103
Date:   Sat,  2 May 2020 23:18:09 +0200
Message-Id: <20200502211809.3906-1-gielendaniel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Daniel Gielen <gielendaniel@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-dvb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/cx23885/cx23885-dvb.c
index 45c2f4afc..7123e1487 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -2139,6 +2139,7 @@ static int dvb_register(struct cx23885_tsport *port)
 		memset(&ts2020_config, 0, sizeof(ts2020_config));
 		ts2020_config.fe = fe0->dvb.frontend;
 		ts2020_config.get_agc_pwm = m88ds3103_get_agc_pwm;
+		ts2020_config.clk_out_div = 1;
 		memset(&info, 0, sizeof(struct i2c_board_info));
 		strscpy(info.type, "ts2020", I2C_NAME_SIZE);
 		info.addr = 0x60;
-- 
2.25.1

