Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A9032C74C
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376554AbhCDAb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241794AbhCCPLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 10:11:44 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC70EC0613D9
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 06:46:37 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d15so8733587wrv.5
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 06:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vgZzJohxsprD4BaWMPuNpYTkYmfOwejns2goI8L6I7c=;
        b=xoyhMHXP+GTSZC+ZmmYHK4udVM/YdemuxF7JXHJw0h7HhZmCx++G66y6f/23+adGT5
         ZK4HakQpKgpefEpK4SzmQihjq7dNkPoF2aZAMuA4NdbR+/71+ElFKeNvH2NNc4JGMXYA
         lGgOiGeeNmA3Widzy95DTS3o0lQFSuf8DegdMOd3rB0ypXcsTKMIHKTGByCnW5IIF21d
         Z0YX/qKkwtn8Q+7nonr2uEVS6BLaBI8IOgAMFxyQZ5nFf6FvfffLqtTTkwveVvLYsTak
         navsLaIYgWWLmg0dTyVoVzfa5+lxnkD7UJijuj0RdHl9HfO6FmTBvRP1XAg4eoXyiBf+
         /gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vgZzJohxsprD4BaWMPuNpYTkYmfOwejns2goI8L6I7c=;
        b=HjJ6XmDDBj0dDYXpmEZqDSDDX6WMFpdmPvpJbJFeXBI4raEe4J/8xvCs3IzQjJPDco
         sW182S3fS2C+NnK5fc9lENexm6WS/v46RdalQmI1d0VlbiG133xZrjks9EZ8vU65cy4m
         5UuY+u28H/Ygt8BT14XsUDB0m9HOacl2KPk+T2/x0Yv5nwZzaoJ5t4woMbRtRcygqG/3
         +LyUUc6viOvmpnsebmKF4tyVYWH8CgBoSW+GtWWxnAN98yyQUk04OD+mn51XD8yU+qMy
         COwzRs2roSgFvkNylev/DYUCnPoulQGbqvVrBBUcy80eAy1FjaJ2H1pQF3hekguHCflb
         ELsw==
X-Gm-Message-State: AOAM531aFRXRFaQryQb1OEPD/DkXnTELNP9pGBufZTLHTzw9ELLd6/yC
        hAegwLpKoAVAkLqlntNflXQe7w==
X-Google-Smtp-Source: ABdhPJypVRS7p7oKYfqIWhANcI3yGuUYpOvj7a9dj/U4ReTs3vnCBgqTreqIVdQBwbPs6NJylJHAHg==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr12417917wrp.303.1614782796387;
        Wed, 03 Mar 2021 06:46:36 -0800 (PST)
Received: from dell.default ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id a14sm36567233wrg.84.2021.03.03.06.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:46:35 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
        Atul Mukker <Atul.Mukker@lsi.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Chaw <david_chaw@adaptec.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        dri-devel@lists.freedesktop.org,
        GR-QLogic-Storage-Upstream@marvell.com,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hannes Reinecke <hare@suse.de>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        James Smart <james.smart@broadcom.com>,
        Jason Yan <yanaijie@huawei.com>,
        Javed Hasan <jhasan@marvell.com>,
        John Garry <john.garry@huawei.com>,
        Kashyap Desai <kashyap.desai@broadcom.com>,
        Kumar Santhanam <AnandKumar.Santhanam@pmcs.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Luben Tuikov <luben_tuikov@adaptec.com>,
        Manish Rangankar <mrangankar@marvell.com>,
        Manoj Jose <Manoj.Jose@lsi.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        megaraidlinux@lsi.com, megaraidlinux.pdl@broadcom.com,
        MPT-FusionLinux.pdl@avagotech.com,
        MPT-FusionLinux.pdl@broadcom.com,
        Nikith Ganigarakoppal <Nikith.Ganigarakoppal@pmcs.com>,
        Nilesh Javali <njavali@marvell.com>,
        "PMC-Sierra, Inc" <aacraid@pmc-sierra.com>,
        Prakash Gollapudi <bprakash@broadcom.com>,
        Sangeetha Gnanasekaran <Sangeetha.Gnanasekaran@pmcs.com>,
        Sathya Prakash <sathya.prakash@broadcom.com>,
        Saurav Kashyap <skashyap@marvell.com>,
        Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
        Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
        Sreenivas Bagalkote <Sreenivas.Bagalkote@lsi.com>,
        Suganath Prabu Subramani 
        <suganath-prabu.subramani@broadcom.com>,
        Sumit Saxena <sumit.saxena@broadcom.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 00/30] [Set 1] Rid W=1 warnings in SCSI
Date:   Wed,  3 Mar 2021 14:46:01 +0000
Message-Id: <20210303144631.3175331-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (30):
  scsi: megaraid: megaraid_mm: Fix incorrect function name in header
  scsi: megaraid: megaraid_sas_base: Fix a bunch of misnamed functions
    in their headers
  scsi: fcoe: Fix function name fcoe_set_vport_symbolic_name() in
    description
  scsi: megaraid: megaraid_mbox: Fix function name
    megaraid_queue_command_lck() in description
  scsi: fcoe: fcoe_ctlr: Fix a couple of incorrectly named functions
  scsi: aic94xx: aic94xx_hwi: Fix a couple of misnamed function names
  scsi: aacraid: aachba: Fix a few incorrectly named functions
  scsi: pm8001: pm8001_init: Provide function name and fix a misspelling
  scsi: aacraid: commctrl: Fix incorrect spelling of aac_send_raw_srb()
  scsi: bnx2fc: bnx2fc_hwi: Fix typo in bnx2fc_indicate_kcqe()
  scsi: pm8001: pm8001_sas: Provide function name
    'pm8001_I_T_nexus_reset()' in header
  scsi: qla4xxx: ql4_os: Fix formatting issues - missing '-' and '_'
  scsi: pm8001: pm8001_ctl: Fix incorrectly named functions in headers
  scsi: aic94xx: aic94xx_sds: Fix asd_erase_nv_sector()'s header
  scsi: qla2xxx: qla_iocb: Replace __qla2x00_marker()'s missing
    underscores
  scsi: aacraid: commsup: Repair formatting issue in
    aac_handle_sa_aif()'s header
  scsi: lpfc: lpfc_sli: Fix a bunch of kernel-doc issues
  scsi: pm8001: pm8001_hwi: Fix some misnamed function descriptions
  scsi: qla4xxx: ql4_mbx: Fix kernel-doc formatting and misnaming issue
  scsi: bnx2fc: bnx2fc_tgt: Fix misnaming of bnx2fc_free_session_resc()
  scsi: aic94xx: aic94xx_dump: Remove code that has been unused for at
    least 13 years
  scsi: pm8001: pm80xx_hwi: Fix a bunch of doc-rotted function headers
  scsi: qla2xxx: qla_gs: Fix some incorrect formatting/spelling issues
  scsi: aacraid: rx: Fix misspelling of _aac_rx_init()
  scsi: lpfc: lpfc_ct: Fix formatting and misspelling issues
  scsi: libfc: fc_lport: Fix some possible copy/paste issues
  scsi: lpfc: lpfc_hbadisc: Fix incorrect naming of
    __lpfc_update_fcf_record()
  scsi: mpt3sas: mpt3sas_base: Fix misspelling of
    _base_put_smid_default_atomic()
  scsi: lpfc: lpfc_nportdisc: Fix misspelling of lpfc_defer_acc_rsp()
  scsi: mpt3sas: mpt3sas_scs: Move a little data from the stack onto the
    heap

 drivers/scsi/aacraid/aachba.c             |   8 +-
 drivers/scsi/aacraid/commctrl.c           |   2 +-
 drivers/scsi/aacraid/commsup.c            |   4 +-
 drivers/scsi/aacraid/rx.c                 |   2 +-
 drivers/scsi/aic94xx/aic94xx_dump.c       | 184 ----------------------
 drivers/scsi/aic94xx/aic94xx_hwi.c        |   4 +-
 drivers/scsi/aic94xx/aic94xx_sds.c        |   2 +-
 drivers/scsi/bnx2fc/bnx2fc_hwi.c          |   2 +-
 drivers/scsi/bnx2fc/bnx2fc_tgt.c          |   2 +-
 drivers/scsi/fcoe/fcoe.c                  |   2 +-
 drivers/scsi/fcoe/fcoe_ctlr.c             |   4 +-
 drivers/scsi/libfc/fc_lport.c             |  12 +-
 drivers/scsi/lpfc/lpfc_ct.c               |  12 +-
 drivers/scsi/lpfc/lpfc_hbadisc.c          |   2 +-
 drivers/scsi/lpfc/lpfc_nportdisc.c        |   2 +-
 drivers/scsi/lpfc/lpfc_sli.c              |  12 +-
 drivers/scsi/megaraid/megaraid_mbox.c     |   2 +-
 drivers/scsi/megaraid/megaraid_mm.c       |   2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c |  11 +-
 drivers/scsi/mpt3sas/mpt3sas_base.c       |   2 +-
 drivers/scsi/mpt3sas/mpt3sas_scsih.c      |  38 +++--
 drivers/scsi/pm8001/pm8001_ctl.c          |   4 +-
 drivers/scsi/pm8001/pm8001_hwi.c          |   8 +-
 drivers/scsi/pm8001/pm8001_init.c         |   4 +-
 drivers/scsi/pm8001/pm8001_sas.c          |   1 +
 drivers/scsi/pm8001/pm80xx_hwi.c          |  18 +--
 drivers/scsi/qla2xxx/qla_gs.c             |  10 +-
 drivers/scsi/qla2xxx/qla_iocb.c           |   2 +-
 drivers/scsi/qla4xxx/ql4_mbx.c            |   4 +-
 drivers/scsi/qla4xxx/ql4_os.c             |   4 +-
 30 files changed, 99 insertions(+), 267 deletions(-)

Cc: Adaptec OEM Raid Solutions <aacraid@microsemi.com>
Cc: Atul Mukker <Atul.Mukker@lsi.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Chaw <david_chaw@adaptec.com>
Cc: Dick Kennedy <dick.kennedy@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: GR-QLogic-Storage-Upstream@marvell.com
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: James Smart <james.smart@broadcom.com>
Cc: Jason Yan <yanaijie@huawei.com>
Cc: Javed Hasan <jhasan@marvell.com>
Cc: John Garry <john.garry@huawei.com>
Cc: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: Kumar Santhanam <AnandKumar.Santhanam@pmcs.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: Luben Tuikov <luben_tuikov@adaptec.com>
Cc: Manish Rangankar <mrangankar@marvell.com>
Cc: Manoj Jose <Manoj.Jose@lsi.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: megaraidlinux@lsi.com
Cc: megaraidlinux.pdl@broadcom.com
Cc: MPT-FusionLinux.pdl@avagotech.com
Cc: MPT-FusionLinux.pdl@broadcom.com
Cc: Nikith Ganigarakoppal <Nikith.Ganigarakoppal@pmcs.com>
Cc: Nilesh Javali <njavali@marvell.com>
Cc: "PMC-Sierra, Inc" <aacraid@pmc-sierra.com>
Cc: Prakash Gollapudi <bprakash@broadcom.com>
Cc: Sangeetha Gnanasekaran <Sangeetha.Gnanasekaran@pmcs.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>
Cc: Saurav Kashyap <skashyap@marvell.com>
Cc: Shivasharan S <shivasharan.srikanteshwara@broadcom.com>
Cc: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Cc: Sreenivas Bagalkote <Sreenivas.Bagalkote@lsi.com>
Cc: Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>
Cc: Sumit Saxena <sumit.saxena@broadcom.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
-- 
2.27.0

