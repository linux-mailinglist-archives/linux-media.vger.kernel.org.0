Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24C0228640
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 18:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730899AbgGUQn5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 12:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728797AbgGUQmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 12:42:33 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEC4C0619DA
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 09:42:32 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y3so4500634wrl.4
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 09:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q3wFPoWTh9+RB/gbImnnIawEJfTeqJ8DHdCjdnVUl1s=;
        b=hnGBaoRYhz2u0HBDizOOFGoZAqT3Rt6rtlREfXKkv9DiykxtedZujY6X9Ary0p6Gf5
         fGkFwHpi722lQdYtGDRINquIq9QUcK/z5lVZggKy+0lcwNumsNyv7KSktiG2pEFEgqgj
         tgXbKdgntLJd2Yex58Kc1qmR+UEweVqfnARORv3NteLujnG1BX1gqtKHYebUwcF29I+5
         47D4ZdClvU+9MO1qZvBHKVxkY87obCYQzEyRn4IYt4Jk+YAHqeejus01GYmb784VdbXz
         27Yd4r6DBKwdB5PCPqUIzlqrdjWpxEv30OaeWL53+Gnk6L1LTIQVOZnfAsF4aFthhZuq
         kQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q3wFPoWTh9+RB/gbImnnIawEJfTeqJ8DHdCjdnVUl1s=;
        b=orXOga/PKg0Dlgr7Qmk/N0OiOjJchXarj1diikqN9DLToM3umQAt8L8lbvKk/FfDH+
         t03IZrREAXhPlqKJMfs9qF6ntcLFxQ9q+G5x4OYFpWxvyH6iFXYGu6MXjofnhTSNMnPv
         dw6eSzoPIIiEqg/fgCs/VQZZZtlZeIr7NTjlpnJkiVsxz0cX/XYLI9C8iFnDQNcQsC6y
         KtfBioT1iT6aD4EnA6cPU5wZumpCk/XsTxCHSQQW7p+NwrnjvS+3hyakyX8B/RpLH2i9
         D11eUW8FBwb3CwwhF9Y1lHoDaJR4EJjo5htv3Yt5PKXiJSdVFQvCALWHOr7CNaJJEdYR
         6TOQ==
X-Gm-Message-State: AOAM533LSopaaOt9xiu0YynJWJK33uo45A+5HOOrprZqPp89euqkr+V7
        ZkY1FWXobRFxo8eQGzI2w36aJg==
X-Google-Smtp-Source: ABdhPJxfZWhitmEWPruqZgqqg96OR1vRK73w+w2FkABa0XPZMPpROUiGAfOM6BU7fG1MD1WdjW83sw==
X-Received: by 2002:adf:80c7:: with SMTP id 65mr28074183wrl.246.1595349750505;
        Tue, 21 Jul 2020 09:42:30 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id m4sm3933524wmi.48.2020.07.21.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 09:42:29 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     jejb@linux.ibm.com, martin.petersen@oracle.com
Cc:     linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        James Smart <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 23/40] scsi: lpfc: lpfc_sli: Fix-up around 120 documentation issues
Date:   Tue, 21 Jul 2020 17:41:31 +0100
Message-Id: <20200721164148.2617584-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200721164148.2617584-1-lee.jones@linaro.org>
References: <20200721164148.2617584-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/scsi/lpfc/lpfc_sli.c:257: warning: Function parameter or member 'mqe' not described in 'lpfc_sli4_mq_put'
 drivers/scsi/lpfc/lpfc_sli.c:257: warning: Excess function parameter 'wqe' description in 'lpfc_sli4_mq_put'
 drivers/scsi/lpfc/lpfc_sli.c:675: warning: Function parameter or member 'hq' not described in 'lpfc_sli4_rq_put'
 drivers/scsi/lpfc/lpfc_sli.c:675: warning: Function parameter or member 'dq' not described in 'lpfc_sli4_rq_put'
 drivers/scsi/lpfc/lpfc_sli.c:675: warning: Function parameter or member 'hrqe' not described in 'lpfc_sli4_rq_put'
 drivers/scsi/lpfc/lpfc_sli.c:675: warning: Function parameter or member 'drqe' not described in 'lpfc_sli4_rq_put'
 drivers/scsi/lpfc/lpfc_sli.c:675: warning: Excess function parameter 'q' description in 'lpfc_sli4_rq_put'
 drivers/scsi/lpfc/lpfc_sli.c:675: warning: Excess function parameter 'wqe' description in 'lpfc_sli4_rq_put'
 drivers/scsi/lpfc/lpfc_sli.c:738: warning: Function parameter or member 'hq' not described in 'lpfc_sli4_rq_release'
 drivers/scsi/lpfc/lpfc_sli.c:738: warning: Function parameter or member 'dq' not described in 'lpfc_sli4_rq_release'
 drivers/scsi/lpfc/lpfc_sli.c:738: warning: Excess function parameter 'q' description in 'lpfc_sli4_rq_release'
 drivers/scsi/lpfc/lpfc_sli.c:1021: warning: Function parameter or member 'xritag' not described in 'lpfc_test_rrq_active'
 drivers/scsi/lpfc/lpfc_sli.c:1132: warning: Function parameter or member 'piocbq' not described in '__lpfc_sli_get_els_sglq'
 drivers/scsi/lpfc/lpfc_sli.c:1132: warning: Excess function parameter 'piocb' description in '__lpfc_sli_get_els_sglq'
 drivers/scsi/lpfc/lpfc_sli.c:1207: warning: Function parameter or member 'piocbq' not described in '__lpfc_sli_get_nvmet_sglq'
 drivers/scsi/lpfc/lpfc_sli.c:1207: warning: Excess function parameter 'piocb' description in '__lpfc_sli_get_nvmet_sglq'
 drivers/scsi/lpfc/lpfc_sli.c:2243: warning: Function parameter or member 'rb_list' not described in 'lpfc_sli_hbqbuf_get'
 drivers/scsi/lpfc/lpfc_sli.c:2243: warning: Excess function parameter 'phba' description in 'lpfc_sli_hbqbuf_get'
 drivers/scsi/lpfc/lpfc_sli.c:2243: warning: Excess function parameter 'hbqno' description in 'lpfc_sli_hbqbuf_get'
 drivers/scsi/lpfc/lpfc_sli.c:2262: warning: Function parameter or member 'hrq' not described in 'lpfc_sli_rqbuf_get'
 drivers/scsi/lpfc/lpfc_sli.c:2262: warning: Excess function parameter 'hbqno' description in 'lpfc_sli_rqbuf_get'
 drivers/scsi/lpfc/lpfc_sli.c:3429: warning: Function parameter or member 't' not described in 'lpfc_poll_eratt'
 drivers/scsi/lpfc/lpfc_sli.c:3429: warning: Excess function parameter 'ptr' description in 'lpfc_poll_eratt'
 drivers/scsi/lpfc/lpfc_sli.c:4115: warning: Excess function parameter 'pring' description in 'lpfc_sli_abort_fcp_rings'
 drivers/scsi/lpfc/lpfc_sli.c:5331: warning: Excess function parameter 'mboxq' description in 'lpfc_sli4_read_fcoe_params'
 drivers/scsi/lpfc/lpfc_sli.c:5879: warning: Function parameter or member 'extnt_cnt' not described in 'lpfc_sli4_cfg_post_extnts'
 drivers/scsi/lpfc/lpfc_sli.c:5879: warning: Function parameter or member 'type' not described in 'lpfc_sli4_cfg_post_extnts'
 drivers/scsi/lpfc/lpfc_sli.c:5879: warning: Function parameter or member 'emb' not described in 'lpfc_sli4_cfg_post_extnts'
 drivers/scsi/lpfc/lpfc_sli.c:5879: warning: Function parameter or member 'mbox' not described in 'lpfc_sli4_cfg_post_extnts'
 drivers/scsi/lpfc/lpfc_sli.c:6459: warning: Function parameter or member 'pmb' not described in 'lpfc_sli4_ras_mbox_cmpl'
 drivers/scsi/lpfc/lpfc_sli.c:6459: warning: Excess function parameter 'pmboxq' description in 'lpfc_sli4_ras_mbox_cmpl'
 drivers/scsi/lpfc/lpfc_sli.c:6912: warning: Function parameter or member 'extnt_cnt' not described in 'lpfc_sli4_get_allocated_extnts'
 drivers/scsi/lpfc/lpfc_sli.c:6912: warning: Excess function parameter 'extnt_count' description in 'lpfc_sli4_get_allocated_extnts'
 drivers/scsi/lpfc/lpfc_sli.c:7064: warning: Excess function parameter 'pring' description in 'lpfc_sli4_repost_sgl_list'
 drivers/scsi/lpfc/lpfc_sli.c:7312: warning: Function parameter or member 'phba' not described in 'lpfc_init_idle_stat_hb'
 drivers/scsi/lpfc/lpfc_sli.c:8022: warning: Function parameter or member 't' not described in 'lpfc_mbox_timeout'
 drivers/scsi/lpfc/lpfc_sli.c:8022: warning: Excess function parameter 'ptr' description in 'lpfc_mbox_timeout'
 drivers/scsi/lpfc/lpfc_sli.c:8902: warning: Function parameter or member 'mboxq' not described in 'lpfc_sli_issue_mbox_s4'
 drivers/scsi/lpfc/lpfc_sli.c:8902: warning: Excess function parameter 'pmbox' description in 'lpfc_sli_issue_mbox_s4'
 drivers/scsi/lpfc/lpfc_sli.c:9413: warning: Function parameter or member 'piocbq' not described in 'lpfc_sli4_bpl2sgl'
 drivers/scsi/lpfc/lpfc_sli.c:9413: warning: Excess function parameter 'piocb' description in 'lpfc_sli4_bpl2sgl'
 drivers/scsi/lpfc/lpfc_sli.c:9518: warning: Function parameter or member 'iocbq' not described in 'lpfc_sli4_iocb2wqe'
 drivers/scsi/lpfc/lpfc_sli.c:9518: warning: Excess function parameter 'piocb' description in 'lpfc_sli4_iocb2wqe'
 drivers/scsi/lpfc/lpfc_sli.c:10212: warning: Function parameter or member 'phba' not described in '__lpfc_sli_issue_iocb'
 drivers/scsi/lpfc/lpfc_sli.c:10212: warning: Function parameter or member 'ring_number' not described in '__lpfc_sli_issue_iocb'
 drivers/scsi/lpfc/lpfc_sli.c:10212: warning: Function parameter or member 'piocb' not described in '__lpfc_sli_issue_iocb'
 drivers/scsi/lpfc/lpfc_sli.c:10212: warning: Function parameter or member 'flag' not described in '__lpfc_sli_issue_iocb'
 drivers/scsi/lpfc/lpfc_sli.c:10300: warning: Function parameter or member 'ring_number' not described in 'lpfc_sli_issue_iocb'
 drivers/scsi/lpfc/lpfc_sli.c:10300: warning: Excess function parameter 'pring' description in 'lpfc_sli_issue_iocb'
 drivers/scsi/lpfc/lpfc_sli.c:11807: warning: Function parameter or member 'cmd' not described in 'lpfc_sli_abort_taskmgmt'
 drivers/scsi/lpfc/lpfc_sli.c:11807: warning: Excess function parameter 'taskmgmt_cmd' description in 'lpfc_sli_abort_taskmgmt'
 drivers/scsi/lpfc/lpfc_sli.c:12067: warning: Function parameter or member 'ring_number' not described in 'lpfc_sli_issue_iocb_wait'
 drivers/scsi/lpfc/lpfc_sli.c:12067: warning: Excess function parameter 'pring' description in 'lpfc_sli_issue_iocb_wait'
 drivers/scsi/lpfc/lpfc_sli.c:12262: warning: Function parameter or member 'mbx_action' not described in 'lpfc_sli_mbox_sys_shutdown'
 drivers/scsi/lpfc/lpfc_sli.c:13219: warning: Function parameter or member 'irspiocbq' not described in 'lpfc_sli4_els_wcqe_to_rspiocbq'
 drivers/scsi/lpfc/lpfc_sli.c:13219: warning: Excess function parameter 'wcqe' description in 'lpfc_sli4_els_wcqe_to_rspiocbq'
 drivers/scsi/lpfc/lpfc_sli.c:13285: warning: Function parameter or member 'mcqe' not described in 'lpfc_sli4_sp_handle_async_event'
 drivers/scsi/lpfc/lpfc_sli.c:13285: warning: Excess function parameter 'cqe' description in 'lpfc_sli4_sp_handle_async_event'
 drivers/scsi/lpfc/lpfc_sli.c:13318: warning: Function parameter or member 'mcqe' not described in 'lpfc_sli4_sp_handle_mbox_event'
 drivers/scsi/lpfc/lpfc_sli.c:13318: warning: Excess function parameter 'cqe' description in 'lpfc_sli4_sp_handle_mbox_event'
 drivers/scsi/lpfc/lpfc_sli.c:13441: warning: Function parameter or member 'cq' not described in 'lpfc_sli4_sp_handle_mcqe'
 drivers/scsi/lpfc/lpfc_sli.c:13768: warning: Function parameter or member 'speq' not described in 'lpfc_sli4_sp_handle_eqe'
 drivers/scsi/lpfc/lpfc_sli.c:14126: warning: Function parameter or member 'cq' not described in 'lpfc_sli4_nvmet_handle_rcqe'
 drivers/scsi/lpfc/lpfc_sli.c:14235: warning: Function parameter or member 'cqe' not described in 'lpfc_sli4_fp_handle_cqe'
 drivers/scsi/lpfc/lpfc_sli.c:14235: warning: Excess function parameter 'eqe' description in 'lpfc_sli4_fp_handle_cqe'
 drivers/scsi/lpfc/lpfc_sli.c:14336: warning: Function parameter or member 'eq' not described in 'lpfc_sli4_hba_handle_eqe'
 drivers/scsi/lpfc/lpfc_sli.c:14808: warning: Function parameter or member 'entry_count' not described in 'lpfc_sli4_queue_alloc'
 drivers/scsi/lpfc/lpfc_sli.c:15185: warning: Function parameter or member 'type' not described in 'lpfc_cq_create'
 drivers/scsi/lpfc/lpfc_sli.c:15185: warning: Function parameter or member 'subtype' not described in 'lpfc_cq_create'
 drivers/scsi/lpfc/lpfc_sli.c:15333: warning: Function parameter or member 'type' not described in 'lpfc_cq_create_set'
 drivers/scsi/lpfc/lpfc_sli.c:15333: warning: Function parameter or member 'subtype' not described in 'lpfc_cq_create_set'
 drivers/scsi/lpfc/lpfc_sli.c:16063: warning: Function parameter or member 'subtype' not described in 'lpfc_rq_create'
 drivers/scsi/lpfc/lpfc_sli.c:16353: warning: Function parameter or member 'subtype' not described in 'lpfc_mrq_create'
 drivers/scsi/lpfc/lpfc_sli.c:16533: warning: Function parameter or member 'phba' not described in 'lpfc_eq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16590: warning: Function parameter or member 'phba' not described in 'lpfc_cq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16644: warning: Function parameter or member 'phba' not described in 'lpfc_mq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16644: warning: Function parameter or member 'mq' not described in 'lpfc_mq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16644: warning: Excess function parameter 'qm' description in 'lpfc_mq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16698: warning: Function parameter or member 'phba' not described in 'lpfc_wq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16754: warning: Function parameter or member 'phba' not described in 'lpfc_rq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16754: warning: Function parameter or member 'hrq' not described in 'lpfc_rq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16754: warning: Function parameter or member 'drq' not described in 'lpfc_rq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16754: warning: Excess function parameter 'rq' description in 'lpfc_rq_destroy'
 drivers/scsi/lpfc/lpfc_sli.c:16940: warning: Function parameter or member 'xri' not described in '__lpfc_sli4_free_xri'
 drivers/scsi/lpfc/lpfc_sli.c:16955: warning: Function parameter or member 'xri' not described in 'lpfc_sli4_free_xri'
 drivers/scsi/lpfc/lpfc_sli.c:17002: warning: Function parameter or member 'post_cnt' not described in 'lpfc_sli4_post_sgl_list'
 drivers/scsi/lpfc/lpfc_sli.c:17002: warning: Excess function parameter 'count' description in 'lpfc_sli4_post_sgl_list'
 drivers/scsi/lpfc/lpfc_sli.c:17221: warning: Function parameter or member 'sb_count' not described in 'lpfc_sli4_post_io_sgl_list'
 drivers/scsi/lpfc/lpfc_sli.c:17451: warning: Function parameter or member 'did' not described in 'lpfc_fc_frame_to_vport'
 drivers/scsi/lpfc/lpfc_sli.c:17590: warning: Function parameter or member 'vport' not described in 'lpfc_fc_frame_add'
 drivers/scsi/lpfc/lpfc_sli.c:17817: warning: Function parameter or member 'vport' not described in 'lpfc_sli4_seq_abort_rsp'
 drivers/scsi/lpfc/lpfc_sli.c:17817: warning: Function parameter or member 'aborted' not described in 'lpfc_sli4_seq_abort_rsp'
 drivers/scsi/lpfc/lpfc_sli.c:17817: warning: Excess function parameter 'phba' description in 'lpfc_sli4_seq_abort_rsp'
 drivers/scsi/lpfc/lpfc_sli.c:18060: warning: Function parameter or member 'seq_dmabuf' not described in 'lpfc_prep_seq'
 drivers/scsi/lpfc/lpfc_sli.c:18060: warning: Excess function parameter 'dmabuf' description in 'lpfc_prep_seq'
 drivers/scsi/lpfc/lpfc_sli.c:18332: warning: Function parameter or member 'dmabuf' not described in 'lpfc_sli4_handle_received_buffer'
 drivers/scsi/lpfc/lpfc_sli.c:18655: warning: Function parameter or member 'rpi' not described in '__lpfc_sli4_free_rpi'
 drivers/scsi/lpfc/lpfc_sli.c:18683: warning: Function parameter or member 'rpi' not described in 'lpfc_sli4_free_rpi'
 drivers/scsi/lpfc/lpfc_sli.c:18714: warning: Function parameter or member 'ndlp' not described in 'lpfc_sli4_resume_rpi'
 drivers/scsi/lpfc/lpfc_sli.c:18714: warning: Function parameter or member 'cmpl' not described in 'lpfc_sli4_resume_rpi'
 drivers/scsi/lpfc/lpfc_sli.c:18714: warning: Function parameter or member 'arg' not described in 'lpfc_sli4_resume_rpi'
 drivers/scsi/lpfc/lpfc_sli.c:18714: warning: Excess function parameter 'phba' description in 'lpfc_sli4_resume_rpi'
 drivers/scsi/lpfc/lpfc_sli.c:19103: warning: Function parameter or member 'phba' not described in 'lpfc_check_next_fcf_pri_level'
 drivers/scsi/lpfc/lpfc_sli.c:19266: warning: Function parameter or member 'fcf_index' not described in 'lpfc_sli4_fcf_rr_index_set'
 drivers/scsi/lpfc/lpfc_sli.c:19295: warning: Function parameter or member 'fcf_index' not described in 'lpfc_sli4_fcf_rr_index_clear'
 drivers/scsi/lpfc/lpfc_sli.c:19331: warning: Function parameter or member 'mbox' not described in 'lpfc_mbx_cmpl_redisc_fcf_table'
 drivers/scsi/lpfc/lpfc_sli.c:20027: warning: Function parameter or member 'pwqeq' not described in 'lpfc_wqe_bpl2sgl'
 drivers/scsi/lpfc/lpfc_sli.c:20027: warning: Excess function parameter 'pwqe' description in 'lpfc_wqe_bpl2sgl'
 drivers/scsi/lpfc/lpfc_sli.c:20141: warning: Function parameter or member 'qp' not described in 'lpfc_sli4_issue_wqe'
 drivers/scsi/lpfc/lpfc_sli.c:20141: warning: Excess function parameter 'ring_number' description in 'lpfc_sli4_issue_wqe'
 drivers/scsi/lpfc/lpfc_sli.c:20434: warning: Function parameter or member 'qp' not described in '_lpfc_move_xri_pbl_to_pvt'
 drivers/scsi/lpfc/lpfc_sli.c:20552: warning: Function parameter or member 'hwqid' not described in 'lpfc_keep_pvt_pool_above_lowwm'
 drivers/scsi/lpfc/lpfc_sli.c:20552: warning: Excess function parameter 'qp' description in 'lpfc_keep_pvt_pool_above_lowwm'
 drivers/scsi/lpfc/lpfc_sli.c:20682: warning: Function parameter or member 'qp' not described in 'lpfc_get_io_buf_from_private_pool'

Cc: James Smart <james.smart@broadcom.com>
Cc: Dick Kennedy <dick.kennedy@broadcom.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/scsi/lpfc/lpfc_sli.c | 119 +++++++++++++++++++++--------------
 1 file changed, 73 insertions(+), 46 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 86e5f8c75ba4e..c44eed709d5fc 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -243,7 +243,7 @@ lpfc_sli4_wq_release(struct lpfc_queue *q, uint32_t index)
 /**
  * lpfc_sli4_mq_put - Put a Mailbox Queue Entry on an Mailbox Queue
  * @q: The Mailbox Queue to operate on.
- * @wqe: The Mailbox Queue Entry to put on the Work queue.
+ * @mqe: The Mailbox Queue Entry to put on the Work queue.
  *
  * This routine will copy the contents of @mqe to the next available entry on
  * the @q. This function will then ring the Work Queue Doorbell to signal the
@@ -657,10 +657,8 @@ lpfc_sli4_if6_write_cq_db(struct lpfc_hba *phba, struct lpfc_queue *q,
 	writel(doorbell.word0, q->phba->sli4_hba.CQDBregaddr);
 }
 
-/**
+/*
  * lpfc_sli4_rq_put - Put a Receive Buffer Queue Entry on a Receive Queue
- * @q: The Header Receive Queue to operate on.
- * @wqe: The Receive Queue Entry to put on the Receive queue.
  *
  * This routine will copy the contents of @wqe to the next available entry on
  * the @q. This function will then ring the Receive Queue Doorbell to signal the
@@ -723,9 +721,8 @@ lpfc_sli4_rq_put(struct lpfc_queue *hq, struct lpfc_queue *dq,
 	return hq_put_index;
 }
 
-/**
+/*
  * lpfc_sli4_rq_release - Updates internal hba index for RQ
- * @q: The Header Receive Queue to operate on.
  *
  * This routine will update the HBA index of a queue to reflect consumption of
  * one Receive Queue Entry by the HBA. When the HBA indicates that it has
@@ -1009,7 +1006,7 @@ lpfc_cleanup_vports_rrqs(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp)
  * lpfc_test_rrq_active - Test RRQ bit in xri_bitmap.
  * @phba: Pointer to HBA context object.
  * @ndlp: Targets nodelist pointer for this exchange.
- * @xritag the xri in the bitmap to test.
+ * @xritag: the xri in the bitmap to test.
  *
  * This function returns:
  * 0 = rrq not active for this xri
@@ -1119,7 +1116,7 @@ lpfc_set_rrq_active(struct lpfc_hba *phba, struct lpfc_nodelist *ndlp,
 /**
  * __lpfc_sli_get_els_sglq - Allocates an iocb object from sgl pool
  * @phba: Pointer to HBA context object.
- * @piocb: Pointer to the iocbq.
+ * @piocbq: Pointer to the iocbq.
  *
  * The driver calls this function with either the nvme ls ring lock
  * or the fc els ring lock held depending on the iocb usage.  This function
@@ -1195,7 +1192,7 @@ __lpfc_sli_get_els_sglq(struct lpfc_hba *phba, struct lpfc_iocbq *piocbq)
 /**
  * __lpfc_sli_get_nvmet_sglq - Allocates an iocb object from sgl pool
  * @phba: Pointer to HBA context object.
- * @piocb: Pointer to the iocbq.
+ * @piocbq: Pointer to the iocbq.
  *
  * This function is called with the sgl_list lock held. This function
  * gets a new driver sglq object from the sglq list. If the
@@ -2230,10 +2227,8 @@ lpfc_sli_hbqbuf_init_hbqs(struct lpfc_hba *phba, uint32_t qno)
 					 lpfc_hbq_defs[qno]->init_count);
 }
 
-/**
+/*
  * lpfc_sli_hbqbuf_get - Remove the first hbq off of an hbq list
- * @phba: Pointer to HBA context object.
- * @hbqno: HBQ number.
  *
  * This function removes the first hbq buffer on an hbq list and returns a
  * pointer to that buffer. If it finds no buffers on the list it returns NULL.
@@ -2252,7 +2247,7 @@ lpfc_sli_hbqbuf_get(struct list_head *rb_list)
 /**
  * lpfc_sli_rqbuf_get - Remove the first dma buffer off of an RQ list
  * @phba: Pointer to HBA context object.
- * @hbqno: HBQ number.
+ * @hrq: HBQ number.
  *
  * This function removes the first RQ buffer on an RQ buffer list and returns a
  * pointer to that buffer. If it finds no buffers on the list it returns NULL.
@@ -3417,7 +3412,7 @@ lpfc_sli_rsp_pointers_error(struct lpfc_hba *phba, struct lpfc_sli_ring *pring)
 
 /**
  * lpfc_poll_eratt - Error attention polling timer timeout handler
- * @ptr: Pointer to address of HBA context object.
+ * @t: Context to fetch pointer to address of HBA context object from.
  *
  * This function is invoked by the Error Attention polling timer when the
  * timer times out. It will check the SLI Error Attention register for
@@ -4103,7 +4098,6 @@ lpfc_sli_abort_iocb_ring(struct lpfc_hba *phba, struct lpfc_sli_ring *pring)
 /**
  * lpfc_sli_abort_fcp_rings - Abort all iocbs in all FCP rings
  * @phba: Pointer to HBA context object.
- * @pring: Pointer to driver SLI ring object.
  *
  * This function aborts all iocbs in FCP rings and frees all the iocb
  * objects in txq. This function issues an abort iocb for all the iocb commands
@@ -5321,7 +5315,7 @@ lpfc_sli_hba_setup(struct lpfc_hba *phba)
 /**
  * lpfc_sli4_read_fcoe_params - Read fcoe params from conf region
  * @phba: Pointer to HBA context object.
- * @mboxq: mailbox pointer.
+ *
  * This function issue a dump mailbox command to read config region
  * 23 and parse the records in the region and populate driver
  * data structure.
@@ -5859,10 +5853,10 @@ lpfc_sli4_chk_avail_extnt_rsrc(struct lpfc_hba *phba, uint16_t type)
 /**
  * lpfc_sli4_cfg_post_extnts -
  * @phba: Pointer to HBA context object.
- * @extnt_cnt - number of available extents.
- * @type - the extent type (rpi, xri, vfi, vpi).
- * @emb - buffer to hold either MBX_EMBED or MBX_NEMBED operation.
- * @mbox - pointer to the caller's allocated mailbox structure.
+ * @extnt_cnt: number of available extents.
+ * @type: the extent type (rpi, xri, vfi, vpi).
+ * @emb: buffer to hold either MBX_EMBED or MBX_NEMBED operation.
+ * @mbox: pointer to the caller's allocated mailbox structure.
  *
  * This function executes the extents allocation request.  It also
  * takes care of the amount of memory needed to allocate or get the
@@ -6450,7 +6444,7 @@ lpfc_sli4_ras_dma_alloc(struct lpfc_hba *phba,
 /**
  * lpfc_sli4_ras_mbox_cmpl: Completion handler for RAS MBX command
  * @phba: pointer to lpfc hba data structure.
- * @pmboxq: pointer to the driver internal queue element for mailbox command.
+ * @pmb: pointer to the driver internal queue element for mailbox command.
  *
  * Completion handler for driver's RAS MBX command to the device.
  **/
@@ -6900,7 +6894,7 @@ lpfc_sli4_dealloc_resource_identifiers(struct lpfc_hba *phba)
  * lpfc_sli4_get_allocated_extnts - Get the port's allocated extents.
  * @phba: Pointer to HBA context object.
  * @type: The resource extent type.
- * @extnt_count: buffer to hold port extent count response
+ * @extnt_cnt: buffer to hold port extent count response
  * @extnt_size: buffer to hold port extent size response.
  *
  * This function calls the port to read the host allocated extents
@@ -7044,7 +7038,6 @@ lpfc_sli4_get_allocated_extnts(struct lpfc_hba *phba, uint16_t type,
 /**
  * lpfc_sli4_repost_sgl_list - Repost the buffers sgl pages as block
  * @phba: pointer to lpfc hba data structure.
- * @pring: Pointer to driver SLI ring object.
  * @sgl_list: linked link of sgl buffers to post
  * @cnt: number of linked list buffers
  *
@@ -7301,6 +7294,7 @@ lpfc_post_rq_buffer(struct lpfc_hba *phba, struct lpfc_queue *hrq,
 
 /**
  * lpfc_init_idle_stat_hb - Initialize idle_stat tracking
+ * @phba: pointer to lpfc hba data structure.
  *
  * This routine initializes the per-cq idle_stat to dynamically dictate
  * polling decisions.
@@ -8007,7 +8001,7 @@ lpfc_sli4_hba_setup(struct lpfc_hba *phba)
 
 /**
  * lpfc_mbox_timeout - Timeout call back function for mbox timer
- * @ptr: context object - pointer to hba structure.
+ * @t: Context to fetch pointer to hba structure from.
  *
  * This is the callback function for mailbox timer. The mailbox
  * timer is armed when a new mailbox command is issued and the timer
@@ -8887,7 +8881,7 @@ lpfc_sli4_post_sync_mbox(struct lpfc_hba *phba, LPFC_MBOXQ_t *mboxq)
 /**
  * lpfc_sli_issue_mbox_s4 - Issue an SLI4 mailbox command to firmware
  * @phba: Pointer to HBA context object.
- * @pmbox: Pointer to mailbox object.
+ * @mboxq: Pointer to mailbox object.
  * @flag: Flag indicating how the mailbox need to be processed.
  *
  * This function is called by discovery code and HBA management code to submit
@@ -9393,7 +9387,7 @@ __lpfc_sli_issue_iocb_s3(struct lpfc_hba *phba, uint32_t ring_number,
 /**
  * lpfc_sli4_bpl2sgl - Convert the bpl/bde to a sgl.
  * @phba: Pointer to HBA context object.
- * @piocb: Pointer to command iocb.
+ * @piocbq: Pointer to command iocb.
  * @sglq: Pointer to the scatter gather queue object.
  *
  * This routine converts the bpl or bde that is in the IOCB
@@ -9501,7 +9495,7 @@ lpfc_sli4_bpl2sgl(struct lpfc_hba *phba, struct lpfc_iocbq *piocbq,
 /**
  * lpfc_sli_iocb2wqe - Convert the IOCB to a work queue entry.
  * @phba: Pointer to HBA context object.
- * @piocb: Pointer to command iocb.
+ * @iocbq: Pointer to command iocb.
  * @wqe: Pointer to the work queue entry.
  *
  * This routine converts the iocb command to its Work Queue Entry
@@ -10195,7 +10189,7 @@ __lpfc_sli_issue_iocb_s4(struct lpfc_hba *phba, uint32_t ring_number,
 	return 0;
 }
 
-/**
+/*
  * __lpfc_sli_issue_iocb - Wrapper func of lockless version for issuing iocb
  *
  * This routine wraps the actual lockless version for issusing IOCB function
@@ -10284,7 +10278,7 @@ lpfc_sli4_calc_ring(struct lpfc_hba *phba, struct lpfc_iocbq *piocb)
 /**
  * lpfc_sli_issue_iocb - Wrapper function for __lpfc_sli_issue_iocb
  * @phba: Pointer to HBA context object.
- * @pring: Pointer to driver SLI ring object.
+ * @ring_number: Ring number
  * @piocb: Pointer to command iocb.
  * @flag: Flag indicating if this command can be put into txq.
  *
@@ -11785,7 +11779,7 @@ lpfc_sli_abort_iocb(struct lpfc_vport *vport, struct lpfc_sli_ring *pring,
  * @pring: Pointer to driver SLI ring object.
  * @tgt_id: SCSI ID of the target.
  * @lun_id: LUN ID of the scsi device.
- * @taskmgmt_cmd: LPFC_CTX_LUN/LPFC_CTX_TGT/LPFC_CTX_HOST.
+ * @cmd: LPFC_CTX_LUN/LPFC_CTX_TGT/LPFC_CTX_HOST.
  *
  * This function sends an abort command for every SCSI command
  * associated with the given virtual port pending on the ring
@@ -12025,7 +12019,7 @@ lpfc_chk_iocb_flg(struct lpfc_hba *phba,
 /**
  * lpfc_sli_issue_iocb_wait - Synchronous function to issue iocb commands
  * @phba: Pointer to HBA context object..
- * @pring: Pointer to sli ring.
+ * @ring_number: Ring number
  * @piocb: Pointer to command iocb.
  * @prspiocbq: Pointer to response iocb.
  * @timeout: Timeout in number of seconds.
@@ -12245,6 +12239,7 @@ lpfc_sli_issue_mbox_wait(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmboxq,
 /**
  * lpfc_sli_mbox_sys_shutdown - shutdown mailbox command sub-system
  * @phba: Pointer to HBA context.
+ * @mbx_action: Mailbox shutdown options.
  *
  * This function is called to shutdown the driver's mailbox sub-system.
  * It first marks the mailbox sub-system is in a block state to prevent
@@ -13205,7 +13200,7 @@ lpfc_sli4_iocb_param_transfer(struct lpfc_hba *phba,
 /**
  * lpfc_sli4_els_wcqe_to_rspiocbq - Get response iocbq from els wcqe
  * @phba: Pointer to HBA context object.
- * @wcqe: Pointer to work-queue completion queue entry.
+ * @irspiocbq: Pointer to work-queue completion queue entry.
  *
  * This routine handles an ELS work-queue completion event and construct
  * a pseudo response ELS IODBQ from the SLI4 ELS WCQE for the common
@@ -13273,7 +13268,7 @@ lpfc_cq_event_setup(struct lpfc_hba *phba, void *entry, int size)
 /**
  * lpfc_sli4_sp_handle_async_event - Handle an asynchronous event
  * @phba: Pointer to HBA context object.
- * @cqe: Pointer to mailbox completion queue entry.
+ * @mcqe: Pointer to mailbox completion queue entry.
  *
  * This routine process a mailbox completion queue entry with asynchronous
  * event.
@@ -13306,7 +13301,7 @@ lpfc_sli4_sp_handle_async_event(struct lpfc_hba *phba, struct lpfc_mcqe *mcqe)
 /**
  * lpfc_sli4_sp_handle_mbox_event - Handle a mailbox completion event
  * @phba: Pointer to HBA context object.
- * @cqe: Pointer to mailbox completion queue entry.
+ * @mcqe: Pointer to mailbox completion queue entry.
  *
  * This routine process a mailbox completion queue entry with mailbox
  * completion event.
@@ -13427,6 +13422,7 @@ lpfc_sli4_sp_handle_mbox_event(struct lpfc_hba *phba, struct lpfc_mcqe *mcqe)
 /**
  * lpfc_sli4_sp_handle_mcqe - Process a mailbox completion queue entry
  * @phba: Pointer to HBA context object.
+ * @cq: Pointer to associated CQ
  * @cqe: Pointer to mailbox completion queue entry.
  *
  * This routine process a mailbox completion queue entry, it invokes the
@@ -13753,6 +13749,7 @@ lpfc_sli4_sp_handle_cqe(struct lpfc_hba *phba, struct lpfc_queue *cq,
  * lpfc_sli4_sp_handle_eqe - Process a slow-path event queue entry
  * @phba: Pointer to HBA context object.
  * @eqe: Pointer to fast-path event queue entry.
+ * @speq: Pointer to slow-path event queue.
  *
  * This routine process a event queue entry from the slow-path event queue.
  * It will check the MajorCode and MinorCode to determine this is for a
@@ -14114,6 +14111,7 @@ lpfc_sli4_fp_handle_rel_wcqe(struct lpfc_hba *phba, struct lpfc_queue *cq,
 /**
  * lpfc_sli4_nvmet_handle_rcqe - Process a receive-queue completion queue entry
  * @phba: Pointer to HBA context object.
+ * @cq: Pointer to completion queue.
  * @rcqe: Pointer to receive-queue completion queue entry.
  *
  * This routine process a receive-queue completion queue entry.
@@ -14222,7 +14220,7 @@ lpfc_sli4_nvmet_handle_rcqe(struct lpfc_hba *phba, struct lpfc_queue *cq,
  * lpfc_sli4_fp_handle_cqe - Process fast-path work queue completion entry
  * @phba: adapter with cq
  * @cq: Pointer to the completion queue.
- * @eqe: Pointer to fast-path completion queue entry.
+ * @cqe: Pointer to fast-path completion queue entry.
  *
  * This routine process a fast-path work queue completion entry from fast-path
  * event queue for FCP command response completion.
@@ -14321,6 +14319,7 @@ static void lpfc_sli4_sched_cq_work(struct lpfc_hba *phba,
 /**
  * lpfc_sli4_hba_handle_eqe - Process a fast-path event queue entry
  * @phba: Pointer to HBA context object.
+ * @eq: Pointer to the queue structure.
  * @eqe: Pointer to fast-path event queue entry.
  *
  * This routine process a event queue entry from the fast-path event queue.
@@ -14795,7 +14794,7 @@ lpfc_sli4_queue_free(struct lpfc_queue *queue)
  * @phba: The HBA that this queue is being created on.
  * @page_size: The size of a queue page
  * @entry_size: The size of each queue entry for this queue.
- * @entry count: The number of entries that this queue will handle.
+ * @entry_count: The number of entries that this queue will handle.
  * @cpu: The cpu that will primarily utilize this queue.
  *
  * This function allocates a queue structure and the DMAable memory used for
@@ -15163,6 +15162,8 @@ static int lpfc_cq_poll_hdler(struct irq_poll *iop, int budget)
  * @phba: HBA structure that indicates port to create a queue on.
  * @cq: The queue structure to use to create the completion queue.
  * @eq: The event queue to bind this completion queue to.
+ * @type: Type of queue (EQ, GCQ, MCQ, WCQ, etc).
+ * @subtype: Functional purpose of the queue (MBOX, IO, ELS, NVMET, etc).
  *
  * This function creates a completion queue, as detailed in @wq, on a port,
  * described by @phba by sending a CQ_CREATE mailbox command to the HBA.
@@ -15309,6 +15310,8 @@ lpfc_cq_create(struct lpfc_hba *phba, struct lpfc_queue *cq,
  * @phba: HBA structure that indicates port to create a queue on.
  * @cqp: The queue structure array to use to create the completion queues.
  * @hdwq: The hardware queue array  with the EQ to bind completion queues to.
+ * @type: Type of queue (EQ, GCQ, MCQ, WCQ, etc).
+ * @subtype: Functional purpose of the queue (MBOX, IO, ELS, NVMET, etc).
  *
  * This function creates a set of  completion queue, s to support MRQ
  * as detailed in @cqp, on a port,
@@ -16040,6 +16043,7 @@ lpfc_wq_create(struct lpfc_hba *phba, struct lpfc_queue *wq,
  * @hrq: The queue structure to use to create the header receive queue.
  * @drq: The queue structure to use to create the data receive queue.
  * @cq: The completion queue to bind this work queue to.
+ * @subtype: The subtype of the work queue indicating its functionality.
  *
  * This function creates a receive buffer queue pair , as detailed in @hrq and
  * @drq, on a port, described by @phba by sending a RQ_CREATE mailbox command
@@ -16329,6 +16333,7 @@ lpfc_rq_create(struct lpfc_hba *phba, struct lpfc_queue *hrq,
  * @hrqp: The queue structure array to use to create the header receive queues.
  * @drqp: The queue structure array to use to create the data receive queues.
  * @cqp: The completion queue array to bind these receive queues to.
+ * @subtype: Functional purpose of the queue (MBOX, IO, ELS, NVMET, etc).
  *
  * This function creates a receive buffer queue pair , as detailed in @hrq and
  * @drq, on a port, described by @phba by sending a RQ_CREATE mailbox command
@@ -16518,6 +16523,7 @@ lpfc_mrq_create(struct lpfc_hba *phba, struct lpfc_queue **hrqp,
 
 /**
  * lpfc_eq_destroy - Destroy an event Queue on the HBA
+ * @phba: HBA structure that indicates port to destroy a queue on.
  * @eq: The queue structure associated with the queue to destroy.
  *
  * This function destroys a queue, as detailed in @eq by sending an mailbox
@@ -16575,6 +16581,7 @@ lpfc_eq_destroy(struct lpfc_hba *phba, struct lpfc_queue *eq)
 
 /**
  * lpfc_cq_destroy - Destroy a Completion Queue on the HBA
+ * @phba: HBA structure that indicates port to destroy a queue on.
  * @cq: The queue structure associated with the queue to destroy.
  *
  * This function destroys a queue, as detailed in @cq by sending an mailbox
@@ -16629,7 +16636,8 @@ lpfc_cq_destroy(struct lpfc_hba *phba, struct lpfc_queue *cq)
 
 /**
  * lpfc_mq_destroy - Destroy a Mailbox Queue on the HBA
- * @qm: The queue structure associated with the queue to destroy.
+ * @phba: HBA structure that indicates port to destroy a queue on.
+ * @mq: The queue structure associated with the queue to destroy.
  *
  * This function destroys a queue, as detailed in @mq by sending an mailbox
  * command, specific to the type of queue, to the HBA.
@@ -16683,6 +16691,7 @@ lpfc_mq_destroy(struct lpfc_hba *phba, struct lpfc_queue *mq)
 
 /**
  * lpfc_wq_destroy - Destroy a Work Queue on the HBA
+ * @phba: HBA structure that indicates port to destroy a queue on.
  * @wq: The queue structure associated with the queue to destroy.
  *
  * This function destroys a queue, as detailed in @wq by sending an mailbox
@@ -16738,7 +16747,9 @@ lpfc_wq_destroy(struct lpfc_hba *phba, struct lpfc_queue *wq)
 
 /**
  * lpfc_rq_destroy - Destroy a Receive Queue on the HBA
- * @rq: The queue structure associated with the queue to destroy.
+ * @phba: HBA structure that indicates port to destroy a queue on.
+ * @hrq: The queue structure associated with the queue to destroy.
+ * @drq: The queue structure associated with the queue to destroy.
  *
  * This function destroys a queue, as detailed in @rq by sending an mailbox
  * command, specific to the type of queue, to the HBA.
@@ -16931,6 +16942,7 @@ lpfc_sli4_alloc_xri(struct lpfc_hba *phba)
 /**
  * lpfc_sli4_free_xri - Release an xri for reuse.
  * @phba: pointer to lpfc hba data structure.
+ * @xri: xri to release.
  *
  * This routine is invoked to release an xri to the pool of
  * available rpis maintained by the driver.
@@ -16946,6 +16958,7 @@ __lpfc_sli4_free_xri(struct lpfc_hba *phba, int xri)
 /**
  * lpfc_sli4_free_xri - Release an xri for reuse.
  * @phba: pointer to lpfc hba data structure.
+ * @xri: xri to release.
  *
  * This routine is invoked to release an xri to the pool of
  * available rpis maintained by the driver.
@@ -16988,7 +17001,7 @@ lpfc_sli4_next_xritag(struct lpfc_hba *phba)
  * lpfc_sli4_post_sgl_list - post a block of ELS sgls to the port.
  * @phba: pointer to lpfc hba data structure.
  * @post_sgl_list: pointer to els sgl entry list.
- * @count: number of els sgl entries on the list.
+ * @post_cnt: number of els sgl entries on the list.
  *
  * This routine is invoked to post a block of driver's sgl pages to the
  * HBA using non-embedded mailbox command. No Lock is held. This routine
@@ -17205,6 +17218,7 @@ lpfc_sli4_post_io_sgl_block(struct lpfc_hba *phba, struct list_head *nblist,
  * lpfc_sli4_post_io_sgl_list - Post blocks of nvme buffer sgls from a list
  * @phba: pointer to lpfc hba data structure.
  * @post_nblist: pointer to the nvme buffer list.
+ * @sb_count: number of nvme buffers.
  *
  * This routine walks a list of nvme buffers that was passed in. It attempts
  * to construct blocks of nvme buffer sgls which contains contiguous xris and
@@ -17438,6 +17452,7 @@ lpfc_fc_hdr_get_vfi(struct fc_frame_header *fc_hdr)
  * @phba: Pointer to the HBA structure to search for the vport on
  * @fc_hdr: A pointer to the FC Header data (In Big Endian Format)
  * @fcfi: The FC Fabric ID that the frame came from
+ * @did: Destination ID to match against
  *
  * This function searches the @phba for a vport that matches the content of the
  * @fc_hdr passed in and the @fcfi. This function uses the @fc_hdr to fetch the
@@ -17575,6 +17590,7 @@ lpfc_rcv_seq_check_edtov(struct lpfc_vport *vport)
 
 /**
  * lpfc_fc_frame_add - Adds a frame to the vport's list of received sequences
+ * @vport: pointer to a vitural port
  * @dmabuf: pointer to a dmabuf that describes the hdr and data of the FC frame
  *
  * This function searches through the existing incomplete sequences that have
@@ -17805,8 +17821,9 @@ lpfc_sli4_xri_inrange(struct lpfc_hba *phba,
 
 /**
  * lpfc_sli4_seq_abort_rsp - bls rsp to sequence abort
- * @phba: Pointer to HBA context object.
+ * @vport: pointer to a vitural port.
  * @fc_hdr: pointer to a FC frame header.
+ * @aborted: was the partially assembled receive sequence successfully aborted
  *
  * This function sends a basic response to a previous unsol sequence abort
  * event after aborting the sequence handling.
@@ -18045,7 +18062,7 @@ lpfc_seq_complete(struct hbq_dmabuf *dmabuf)
 /**
  * lpfc_prep_seq - Prep sequence for ULP processing
  * @vport: Pointer to the vport on which this sequence was received
- * @dmabuf: pointer to a dmabuf that describes the FC sequence
+ * @seq_dmabuf: pointer to a dmabuf that describes the FC sequence
  *
  * This function takes a sequence, described by a list of frames, and creates
  * a list of iocbq structures to describe the sequence. This iocbq list will be
@@ -18318,6 +18335,7 @@ lpfc_sli4_handle_mds_loopback(struct lpfc_vport *vport,
 /**
  * lpfc_sli4_handle_received_buffer - Handle received buffers from firmware
  * @phba: Pointer to HBA context object.
+ * @dmabuf: Pointer to a dmabuf that describes the FC sequence.
  *
  * This function is called with no lock held. This function processes all
  * the received buffers and gives it to upper layers when a received buffer
@@ -18646,6 +18664,7 @@ lpfc_sli4_alloc_rpi(struct lpfc_hba *phba)
 /**
  * lpfc_sli4_free_rpi - Release an rpi for reuse.
  * @phba: pointer to lpfc hba data structure.
+ * @rpi: rpi to free
  *
  * This routine is invoked to release an rpi to the pool of
  * available rpis maintained by the driver.
@@ -18674,6 +18693,7 @@ __lpfc_sli4_free_rpi(struct lpfc_hba *phba, int rpi)
 /**
  * lpfc_sli4_free_rpi - Release an rpi for reuse.
  * @phba: pointer to lpfc hba data structure.
+ * @rpi: rpi to free
  *
  * This routine is invoked to release an rpi to the pool of
  * available rpis maintained by the driver.
@@ -18703,7 +18723,9 @@ lpfc_sli4_remove_rpis(struct lpfc_hba *phba)
 
 /**
  * lpfc_sli4_resume_rpi - Remove the rpi bitmask region
- * @phba: pointer to lpfc hba data structure.
+ * @ndlp: pointer to lpfc nodelist data structure.
+ * @cmpl: completion call-back.
+ * @arg: data to load as MBox 'caller buffer information'
  *
  * This routine is invoked to remove the memory region that
  * provided rpi via a bitmask.
@@ -19087,7 +19109,7 @@ lpfc_sli4_read_fcf_rec(struct lpfc_hba *phba, uint16_t fcf_index)
 
 /**
  * lpfc_check_next_fcf_pri_level
- * phba pointer to the lpfc_hba struct for this port.
+ * @phba: pointer to the lpfc_hba struct for this port.
  * This routine is called from the lpfc_sli4_fcf_rr_next_index_get
  * routine when the rr_bmask is empty. The FCF indecies are put into the
  * rr_bmask based on their priority level. Starting from the highest priority
@@ -19252,6 +19274,7 @@ lpfc_sli4_fcf_rr_next_index_get(struct lpfc_hba *phba)
 /**
  * lpfc_sli4_fcf_rr_index_set - Set bmask with eligible fcf record index
  * @phba: pointer to lpfc hba data structure.
+ * @fcf_index: index into the FCF table to 'set'
  *
  * This routine sets the FCF record index in to the eligible bmask for
  * roundrobin failover search. It checks to make sure that the index
@@ -19284,6 +19307,7 @@ lpfc_sli4_fcf_rr_index_set(struct lpfc_hba *phba, uint16_t fcf_index)
 /**
  * lpfc_sli4_fcf_rr_index_clear - Clear bmask from eligible fcf record index
  * @phba: pointer to lpfc hba data structure.
+ * @fcf_index: index into the FCF table to 'clear'
  *
  * This routine clears the FCF record index from the eligible bmask for
  * roundrobin failover search. It checks to make sure that the index
@@ -19321,6 +19345,7 @@ lpfc_sli4_fcf_rr_index_clear(struct lpfc_hba *phba, uint16_t fcf_index)
 /**
  * lpfc_mbx_cmpl_redisc_fcf_table - completion routine for rediscover FCF table
  * @phba: pointer to lpfc hba data structure.
+ * @mbox: An allocated pointer to type LPFC_MBOXQ_t
  *
  * This routine is the completion routine for the rediscover FCF table mailbox
  * command. If the mailbox command returned failure, it will try to stop the
@@ -20007,7 +20032,7 @@ lpfc_drain_txq(struct lpfc_hba *phba)
 /**
  * lpfc_wqe_bpl2sgl - Convert the bpl/bde to a sgl.
  * @phba: Pointer to HBA context object.
- * @pwqe: Pointer to command WQE.
+ * @pwqeq: Pointer to command WQE.
  * @sglq: Pointer to the scatter gather queue object.
  *
  * This routine converts the bpl or bde that is in the WQE
@@ -20132,7 +20157,7 @@ lpfc_wqe_bpl2sgl(struct lpfc_hba *phba, struct lpfc_iocbq *pwqeq,
 /**
  * lpfc_sli4_issue_wqe - Issue an SLI4 Work Queue Entry (WQE)
  * @phba: Pointer to HBA context object.
- * @ring_number: Base sli ring number
+ * @qp: Pointer to HDW queue.
  * @pwqe: Pointer to command WQE.
  **/
 int
@@ -20414,6 +20439,7 @@ void lpfc_move_xri_pvt_to_pbl(struct lpfc_hba *phba, u32 hwqid)
 /**
  * _lpfc_move_xri_pbl_to_pvt - Move some XRIs from public to private pool
  * @phba: pointer to lpfc hba data structure
+ * @qp: pointer to HDW queue
  * @pbl_pool: specified public free XRI pool
  * @pvt_pool: specified private free XRI pool
  * @count: number of XRIs to move
@@ -20543,7 +20569,7 @@ void lpfc_move_xri_pbl_to_pvt(struct lpfc_hba *phba, u32 hwqid, u32 count)
 /**
  * lpfc_keep_pvt_pool_above_lowwm - Keep pvt_pool above low watermark
  * @phba: pointer to lpfc hba data structure.
- * @qp: belong to which HWQ.
+ * @hwqid: belong to which HWQ.
  *
  * This routine get a batch of XRIs from pbl_pool if pvt_pool is less than
  * low watermark.
@@ -20665,6 +20691,7 @@ void lpfc_release_io_buf(struct lpfc_hba *phba, struct lpfc_io_buf *lpfc_ncmd,
 /**
  * lpfc_get_io_buf_from_private_pool - Get one free IO buf from private pool
  * @phba: pointer to lpfc hba data structure.
+ * @qp: pointer to HDW queue
  * @pvt_pool: pointer to private pool data structure.
  * @ndlp: pointer to lpfc nodelist data structure.
  *
-- 
2.25.1

