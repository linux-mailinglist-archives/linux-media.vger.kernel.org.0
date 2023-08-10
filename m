Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84AF4776D39
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 02:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjHJAyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 20:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjHJAyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 20:54:01 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7948F5
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 17:54:00 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-79095499a17so13103739f.3
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 17:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691628840; x=1692233640;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Wdkzj6p3rOK19FTNdQYtbs5FYuyIuVaMEM34fKjnrw=;
        b=cIzA+RQ5GYT9m8eHdPBnG5Xb1kdLF7gc0cro+p9hEUnwS9VoYa+qwJrGruNF28IOGl
         NqXwp/hHXXJlvU2vvqnHXqkzemmmUG1ixzGuYmoTxG1hu930+XK6bo8AuJe7EysOAgcY
         BpK4mHTcKCjg5gXTLPAY1EsMTF1ebzmlUnT2PQlQcErNuwgChn3iBc0yJa4ZL4fFtwUx
         e7tpQNGZLOFgsmecmyhWQsb7fOgczdl9vKFCHrFOGk21tUyZgSFAYQDmToRXlTyEoaFV
         6Tp0/vCIj9rrw83yqZ8j+KsMZaUTrOqWSUdxhcUIiCTtbNg0PH5DCk6DVNxTW/RtFIGe
         I6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691628840; x=1692233640;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wdkzj6p3rOK19FTNdQYtbs5FYuyIuVaMEM34fKjnrw=;
        b=VQbLE2Tz9YcPW22Z/8LsAmQ6xZxnhlpND1EFIzA0OmiZ8sAwKsAmjhWnc/e1QP6ZFU
         djR/UsOKjbW/IiQfaLmD/PSB3AEg6Emh2m7Qcyn1EQZd4zHusKuEntV5dMJttZF7oLcx
         reP+OZYcDZg01WFWQz/jQNjwdIb71MUCSquFuO24xpFt0VIwHUDQIMQK+fKWVMyssIEi
         gMup7WIC8qoWV33bxenZWOZCHRMTPswQgWr8/Qf3eLW5gX6kH0Yxh5sW+QnBmphmD5Ma
         76DpGaRnnm/bRg3RiAw1YyJUU4XVgI8JKcu9z7FQ8t1/HGNUDcdF9lGZLFzhzbW9uuYp
         r0rg==
X-Gm-Message-State: AOJu0YzVLOYQcCvs9GOz0ezImsG0UMdD7E3QZJcZrzBlPE/24zarhflN
        Ww3dxN/xmEv0JgN9kMMH8rukfgPKw2h6Z3wZ
X-Google-Smtp-Source: AGHT+IHxMC3OGJc3+b4jFSQSwvOvIxZ6B3nqToTMwFj447QAXRRd1IxIRqngUfD9WMEYcrNu0jXfJg==
X-Received: by 2002:a5e:8907:0:b0:786:7100:72de with SMTP id k7-20020a5e8907000000b00786710072demr1395441ioj.16.1691628839859;
        Wed, 09 Aug 2023 17:53:59 -0700 (PDT)
Received: from smtpclient.apple ([195.252.220.43])
        by smtp.gmail.com with ESMTPSA id y8-20020a6be508000000b007836e9ff198sm115417ioc.55.2023.08.09.17.53.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Aug 2023 17:53:59 -0700 (PDT)
From:   Sishuai Gong <sishuai.system@gmail.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: [PATCH] media: vivid: fix the racy dev->radio_tx_rds_owner
Message-Id: <CC482542-3C3F-4755-ABB2-DB96735CFA74@gmail.com>
Date:   Wed, 9 Aug 2023 20:53:48 -0400
Cc:     linux-media@vger.kernel.org
To:     hverkuil@xs4all.nl, mchehab@kernel.org
X-Mailer: Apple Mail (2.3731.700.6)
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a race over dev->radio_tx_rds_owner between the two functions
mentioned below:

Thread-1                Thread-2
vivid_fop_release()     vivid_radio_rx_read()
mutex_unlock(&dev->mutex)
                        mutex_lock_interruptible(&dev->mutex)
                        ...
                        dev->radio_rx_rds_owner =3D file->private_data;
...
if (file->private_data =3D=3D dev->radio_rx_rds_owner) {
        dev->radio_tx_rds_last_block =3D 0;
        dev->radio_tx_rds_owner =3D NULL;
}

This race can be fixed by only releasing the lock after =
vivid_fop_release()
finishes the checks.

Signed-off-by: Sishuai Gong <sishuai.system@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c =
b/drivers/media/test-drivers/vivid/vivid-core.c
index c2167ccfd222..e95bdccfc18e 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -628,7 +628,6 @@ static int vivid_fop_release(struct file *file)
 		v4l2_info(&dev->v4l2_dev, "reconnect\n");
 		vivid_reconnect(dev);
 	}
-	mutex_unlock(&dev->mutex);
 	if (file->private_data =3D=3D dev->radio_rx_rds_owner) {
 		dev->radio_rx_rds_last_block =3D 0;
 		dev->radio_rx_rds_owner =3D NULL;
@@ -637,6 +636,7 @@ static int vivid_fop_release(struct file *file)
 		dev->radio_tx_rds_last_block =3D 0;
 		dev->radio_tx_rds_owner =3D NULL;
 	}
+	mutex_unlock(&dev->mutex);
 	if (vdev->queue)
 		return vb2_fop_release(file);
 	return v4l2_fh_release(file);
--=20
2.39.2 (Apple Git-143)

