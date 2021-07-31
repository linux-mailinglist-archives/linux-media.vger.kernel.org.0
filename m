Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6B63DC49E
	for <lists+linux-media@lfdr.de>; Sat, 31 Jul 2021 09:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbhGaHwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Jul 2021 03:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhGaHwL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Jul 2021 03:52:11 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227FBC06175F;
        Sat, 31 Jul 2021 00:52:05 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso24160852pjq.2;
        Sat, 31 Jul 2021 00:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LNinOfUJINPcfdOxhYvsgsalnU1GKLpLDBpG0mAohAc=;
        b=TL/nDTwV7Ph7kC1oZk66wjgapAmGIuuvxKdZnyb2id6PMHXk3i4RURbvV6vN+GabZ0
         5nKC4XMdjCnAQdmdM1bcAxlR9PIybYesEm8AYOmglzQijYZkBb2VyLlLvLH9yYsbTsxK
         0yYvZVJMCN63zzu8VGgeKdHRVKCL470JVoFALEkpn7OJZaMW/ahykXkU4zwNGT5k8Tv0
         6/S0ja07q4MoAw3FheqVo8DTllRy/nT4EoMa9q6VINztElQPFRVb29cccLjZbzjSJsZR
         eRQmfcJ/n+nCYCVe9b+BWYBJ1LgV2iHr85HIMojw7mv+BhnuuR98JOlFkfqah5ZiBbA8
         idkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LNinOfUJINPcfdOxhYvsgsalnU1GKLpLDBpG0mAohAc=;
        b=DO3PR7I0liFhdchpb7twB/licO+qahIidaAmig572sSAIwNxXtaYKdQk6oa+jSvbyN
         SlUVNDtCujah2ibhGaheLTuP0h8C7UFebRomM2caxjk/ufCvqJU+1sxBskkHGJ6sHhDf
         qgQ4gMeZpbuLvSDc3kH9tHGnx5sx1lCxqd1p3xcC456sPzZ1Tx2R6WvPTAusHyiltktR
         ignqv/RcahOVVle0WG0bs26tXughDdoz+zq3FsTyH2a8XD0Qc6njE1iu1XaBnh6ug9Ms
         GWyXSY/DXoAmJcGDRCwkv8MfGkSbfaDYzH/Iyj8hmX34PcMj9J2csU+D7zZILr0KwHp1
         qMAQ==
X-Gm-Message-State: AOAM533PR/8ItQGvUVE9palewqmtiI1FJkbx5Rok27HNzBkv9mIiVj05
        Pw+o4riv4mfffLS7BdDAuBM=
X-Google-Smtp-Source: ABdhPJxEmyd/fVeOUjyk7iQ/WLxWnrDrhtacIwVjgE+LHn4GCwVnNtolqtkZfzUNk0y77xteCo9kSQ==
X-Received: by 2002:a63:e405:: with SMTP id a5mr5864785pgi.150.1627717924655;
        Sat, 31 Jul 2021 00:52:04 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.29])
        by smtp.gmail.com with ESMTPSA id y15sm5470504pga.34.2021.07.31.00.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 00:52:04 -0700 (PDT)
From:   Tuo Li <islituo@gmail.com>
To:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        colin.king@canonical.com, jiapeng.chong@linux.alibaba.com
Cc:     linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, baijiaju1990@gmail.com,
        Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] scsi: csiostor: fix possible null-pointer dereference in csio_eh_lun_reset_handler()
Date:   Sat, 31 Jul 2021 00:51:48 -0700
Message-Id: <20210731075148.72494-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The variable rn is checked in:
  if (!rn)

If rn is NULL, the program goes to the label fail:
  fail:
    CSIO_INC_STATS(rn, n_lun_rst_fail);

However, rn is dereferenced in this macro:
  #define CSIO_INC_STATS(elem, val) ((elem)->stats.val++)

To fix this possible null-pointer dereference, the function returns
FAILED directly if rn is NULL.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/scsi/csiostor/csio_scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/csiostor/csio_scsi.c b/drivers/scsi/csiostor/csio_scsi.c
index 56b9ad0a1ca0..df0bf8348860 100644
--- a/drivers/scsi/csiostor/csio_scsi.c
+++ b/drivers/scsi/csiostor/csio_scsi.c
@@ -2070,7 +2070,7 @@ csio_eh_lun_reset_handler(struct scsi_cmnd *cmnd)
 	struct csio_scsi_level_data sld;
 
 	if (!rn)
-		goto fail;
+		return FAILED;
 
 	csio_dbg(hw, "Request to reset LUN:%llu (ssni:0x%x tgtid:%d)\n",
 		      cmnd->device->lun, rn->flowid, rn->scsi_id);
-- 
2.25.1

