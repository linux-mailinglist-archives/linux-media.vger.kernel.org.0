Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A591ECF1F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 13:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgFCL4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 07:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgFCL4P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jun 2020 07:56:15 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D105DC08C5C0;
        Wed,  3 Jun 2020 04:56:15 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d10so1616557pgn.4;
        Wed, 03 Jun 2020 04:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=noFQP+2LnGK3IhtCkedH6bBR+YgMi5pCjHRKaBjzpFk=;
        b=l+EfDIR/9Qpt16sdjwSnvpFdSdgH2a3eQ2S2ZNjbsZ7+m6E8SB5kg4Sg53ItZoGemx
         +L8o0V2Pi9GA9bANc5pAza3oR3tO9SuhNcicVexstvug7UAeiqdjbklUkzMnyJgv/Iev
         aTLwS7fdVBnvuRkUW9wPu9yKz/En+6EH/ypqggEbQ5o6y1d5d+hHCgKQg/ReYxlp+ePF
         rRykg4I0z/F2YBLO/cvxiR9VA1RI+ijlrZLtx/2UI+5a5v/S0FYgUcC712uWlO3jCHys
         W+ftR9NumjQ/yDuSAAUWxzyELvR3Zt4HFBu55d5olC97ni4G9L8B0QW85DCwQ6IW3hLc
         Abzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=noFQP+2LnGK3IhtCkedH6bBR+YgMi5pCjHRKaBjzpFk=;
        b=CPATnw6BoKI1HWqPwY3wRIvrkcZyTgfk5JZU0G9jYOp94F/1ZoPZWKC1mA3oYa4dDz
         fS++49zp4JcV/DxP6JtxlIgeaJqxqZhyZALRJQFHd6cAbbXWOZ9ps42N0s3TAOAf9IrQ
         ZBIRLFqkw67LxoaG04yz9FEMojpIJsSDjzxaT0H9lv/QnggD41n7HB3HSe2+hP+FsTcx
         KOBEKhtg5JCB1NGrbNlSNJHWriWxaCtMDyJREU1v/ZcQ+cPK+3jf99NvQmw2ylxONTwf
         Ga3X814H9MVyOju4lA7Fb5SmHKuyBuOingrRu9icL+ioSlRDxJV6U0MGkYWjjdXldmVi
         Qd8g==
X-Gm-Message-State: AOAM533azMVxP5g9J2bpAFiY78UFZBpxqxFLklZP77BUDNjjDpOfUX7O
        6duVpIR1tp81ZhD/tkQkSSwJDIAjfvE=
X-Google-Smtp-Source: ABdhPJx3M9BEZNL4YskwZ54W06JbNrBgXGdVv0tDTxEYATiwyrAqLmZ6KK+qOGVdaCMDdK8Ukuw7eQ==
X-Received: by 2002:a65:5206:: with SMTP id o6mr27238376pgp.16.1591185375393;
        Wed, 03 Jun 2020 04:56:15 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id w12sm2675542pjb.11.2020.06.03.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 04:56:14 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: marvell-ccic: Add missed v4l2_async_notifier_cleanup()
Date:   Wed,  3 Jun 2020 19:56:05 +0800
Message-Id: <20200603115605.1428636-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mccic_register() forgets to cleanup the notifier in its error handler.
Add the missed call to fix it.

Fixes: 3eefe36cc00c ("media: marvell-ccic: use async notifier to get the sensor")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/platform/marvell-ccic/mcam-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 09775b6624c6..cf2a0119e679 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1940,6 +1940,7 @@ int mccic_register(struct mcam_camera *cam)
 out:
 	v4l2_async_notifier_unregister(&cam->notifier);
 	v4l2_device_unregister(&cam->v4l2_dev);
+	v4l2_async_notifier_cleanup(&cam->notifier);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mccic_register);
-- 
2.26.2

