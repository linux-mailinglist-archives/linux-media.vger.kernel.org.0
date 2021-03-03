Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D016732C73A
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376701AbhCDAbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359602AbhCCOty (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 09:49:54 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A833C0613B6
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 06:47:25 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id w7so5392087wmb.5
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 06:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2UGn20PQxJqEKTFAC3EFVHnHz1ZJw2m1WZDwhJNb+Iw=;
        b=PfGdnhVOxPMdNIWrE0A3QNUF8gAe+nELjZltascoIWbJ5sLFj4YgG9ZrV3TBY3Csfp
         fAxw0eBD/FkOX0adMzibZvBALKRq75aACSdkAdPizipYGqwQwCYvSXcQJVGDzaeHau1/
         FptWixcWGpEV0obeZLxGaxXNWdwuiQbetD/cSPh0ZmNaOAGJJklXYnQkAyr84gh3bv9X
         +pFwknfvv7+MonHIwCfnBlDiwPRVnjtNvcBECoCew1YPVEwwqt1B50V5ZAnqsnUjMn36
         5jC6hZgwryg6sNFNYKLtEvf61M7YsFvDEzx7UD/qKwd73xQGEroM3du02S/x46WwP5Ty
         /1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2UGn20PQxJqEKTFAC3EFVHnHz1ZJw2m1WZDwhJNb+Iw=;
        b=LoCabjwSK4QEzrjkm7oQ1wtmcCyDSHdnE+TasdeLLvgC22RIUfgpjgehKrF9Hj2MHH
         io8+nca3Rryr+G06kJrjd7s3Cu4N8sLkmyhC8CdWdVo0zbh/sFCNhVc5xfFihWPVSNCM
         40S+hPq46Bd/c+9OFSF4rE5lEj+lSNiYzs/KQtw+C9J3y3CA8FTCklcJYwTDPzxOpMCA
         tcRmG3TV4gsTjtxWgExIS20thZ5V83xUPJGXPKT6Ywc6Ku0eL1kTBwwGYY1Pv3zewnoT
         aMd2tdtEjUrdQ9/WcUT0T3H/xoNxiud+K9/zAY/BTVm2Tx6SIE52tut1/uuGrvQjVlvB
         edog==
X-Gm-Message-State: AOAM532UoXUq2MD/6FysVXDBHESbyNbCynPkEh2swWLO+z1GQbUJ3Xh9
        rcrTVfSgeXjbZ4qIZnOWuA5S4w==
X-Google-Smtp-Source: ABdhPJz+i6eb5nwXlp7WpWuXa9PrjDmdQa0kNy+e8ZT5cHAX5Gkl7tpL7+1lbOkBOjeMEV57c9Q4gQ==
X-Received: by 2002:a1c:2017:: with SMTP id g23mr9338841wmg.126.1614782843814;
        Wed, 03 Mar 2021 06:47:23 -0800 (PST)
Received: from dell.default ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id a14sm36567233wrg.84.2021.03.03.06.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:47:23 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        James Smart <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-scsi@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 17/30] scsi: lpfc: lpfc_sli: Fix a bunch of kernel-doc issues
Date:   Wed,  3 Mar 2021 14:46:18 +0000
Message-Id: <20210303144631.3175331-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303144631.3175331-1-lee.jones@linaro.org>
References: <20210303144631.3175331-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/scsi/lpfc/lpfc_sli.c:9654: warning: expecting prototype for lpfc_sli_iocb2wqe(). Prototype was for lpfc_sli4_iocb2wqe() instead
 drivers/scsi/lpfc/lpfc_sli.c:10439: warning: Function parameter or member 'phba' not described in 'lpfc_sli_issue_fcp_io'
 drivers/scsi/lpfc/lpfc_sli.c:10439: warning: Function parameter or member 'ring_number' not described in 'lpfc_sli_issue_fcp_io'
 drivers/scsi/lpfc/lpfc_sli.c:10439: warning: Function parameter or member 'piocb' not described in 'lpfc_sli_issue_fcp_io'
 drivers/scsi/lpfc/lpfc_sli.c:10439: warning: Function parameter or member 'flag' not described in 'lpfc_sli_issue_fcp_io'
 drivers/scsi/lpfc/lpfc_sli.c:14189: warning: expecting prototype for lpfc_sli4_sp_process_cq(). Prototype was for __lpfc_sli4_sp_process_cq() instead
 drivers/scsi/lpfc/lpfc_sli.c:14754: warning: expecting prototype for lpfc_sli4_hba_process_cq(). Prototype was for lpfc_sli4_dly_hba_process_cq() instead
 drivers/scsi/lpfc/lpfc_sli.c:17230: warning: expecting prototype for lpfc_sli4_free_xri(). Prototype was for __lpfc_sli4_free_xri() instead
 drivers/scsi/lpfc/lpfc_sli.c:18950: warning: expecting prototype for lpfc_sli4_free_rpi(). Prototype was for __lpfc_sli4_free_rpi() instead

Cc: James Smart <james.smart@broadcom.com>
Cc: Dick Kennedy <dick.kennedy@broadcom.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-scsi@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/scsi/lpfc/lpfc_sli.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index fa1a714a78f09..9801193983ff0 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -9635,7 +9635,7 @@ lpfc_sli4_bpl2sgl(struct lpfc_hba *phba, struct lpfc_iocbq *piocbq,
 }
 
 /**
- * lpfc_sli_iocb2wqe - Convert the IOCB to a work queue entry.
+ * lpfc_sli4_iocb2wqe - Convert the IOCB to a work queue entry.
  * @phba: Pointer to HBA context object.
  * @iocbq: Pointer to command iocb.
  * @wqe: Pointer to the work queue entry.
@@ -10421,7 +10421,7 @@ __lpfc_sli_issue_iocb_s4(struct lpfc_hba *phba, uint32_t ring_number,
 	return 0;
 }
 
-/**
+/*
  * lpfc_sli_issue_fcp_io - Wrapper func for issuing fcp i/o
  *
  * This routine wraps the actual fcp i/o function for issusing WQE for sli-4
@@ -14170,7 +14170,7 @@ __lpfc_sli4_process_cq(struct lpfc_hba *phba, struct lpfc_queue *cq,
 }
 
 /**
- * lpfc_sli4_sp_process_cq - Process a slow-path event queue entry
+ * __lpfc_sli4_sp_process_cq - Process a slow-path event queue entry
  * @cq: pointer to CQ to process
  *
  * This routine calls the cq processing routine with a handler specific
@@ -14744,7 +14744,7 @@ lpfc_sli4_hba_process_cq(struct work_struct *work)
 }
 
 /**
- * lpfc_sli4_hba_process_cq - fast-path work handler when started by timer
+ * lpfc_sli4_dly_hba_process_cq - fast-path work handler when started by timer
  * @work: pointer to work element
  *
  * translates from the work handler and calls the fast-path handler.
@@ -17218,7 +17218,7 @@ lpfc_sli4_alloc_xri(struct lpfc_hba *phba)
 }
 
 /**
- * lpfc_sli4_free_xri - Release an xri for reuse.
+ * __lpfc_sli4_free_xri - Release an xri for reuse.
  * @phba: pointer to lpfc hba data structure.
  * @xri: xri to release.
  *
@@ -18938,7 +18938,7 @@ lpfc_sli4_alloc_rpi(struct lpfc_hba *phba)
 }
 
 /**
- * lpfc_sli4_free_rpi - Release an rpi for reuse.
+ * __lpfc_sli4_free_rpi - Release an rpi for reuse.
  * @phba: pointer to lpfc hba data structure.
  * @rpi: rpi to free
  *
-- 
2.27.0

