Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD86C21D134
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 10:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbgGMIAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 04:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729155AbgGMIAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 04:00:16 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B60EC08C5DD
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 01:00:16 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id o2so12214324wmh.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 01:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t/zzBO2Jyh9x8BHnEJvhlwlew5qspE/Jnd9v9TqHGYM=;
        b=X1pICw/xGi8yO7WMvXC+Xt5mQV7hSF+yXH+qJ996xIUe/S29cn+Tjv5l9kkxVhflMP
         t7KU8FHmpsRKx2uXcdGW7pa7KzM0RryyE8yAVhMeQjZytVyne0//TFgo1QxFJ3AUGL6X
         go9GZhGY3GDv1qnLDTWNwlV40FgimjX3KK4lnZrmnax0J2mEVP8a/QvUOk9SZGUO4Sz8
         MyAsRjC1+5KjCPgl8IIv9HgGWO9yApydmgzsUPehcN2XjEiDOVrZBp9xVrRA+4SolzL2
         P/WDa/TjkL5pmKavbc/fh076vqsp9T/FJ7MCtw8MFKOH5nJA0+uCCTmCSjwwMbcKr6SI
         C37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/zzBO2Jyh9x8BHnEJvhlwlew5qspE/Jnd9v9TqHGYM=;
        b=CQ2wf7RD2kvzMRbiGhOhL3NMMInG6wDtlWjpyZ0LMHQEPSutGHAaZywnKVR4VccClg
         qa5XidR58mjO/Rr8ZPeT/6OQoc1oLSALHHTGtw25pmNlMTLmtVPR3zXCGQ7lkLFjWsP0
         1/0mekMsMi+jGY2I+cMl8KquibkBzrWHOH6xzbptt3ZLf0AZydzdaG+jXMljcbTUsprO
         BMQa62C63iuM14oFRPVV3L6DVCp58mCkm27Lnscs1Zxa2rIRZPSwReGLit4nLOld349+
         d8wNQ1fJZ7Fr92PGuwQKbYD5skTCMtjc4Ep3RmlHmMTOO7TOFnBskjLUuSCFqNqFalUK
         Hknw==
X-Gm-Message-State: AOAM532H2CXvLFOK7RvKxaMe4NsMFmjpu4BT3SrQZdYGgsOlBVG5nVhJ
        /PfGqo+JMy0/dqdIvt9IZLUCyg==
X-Google-Smtp-Source: ABdhPJzegXCa1VHdBx+oSqo6/QRODW5IELIXB8J15dtdzCo3nN786aUFW+yYYTJxca/VKxlsxPNp2Q==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr18464834wmb.92.1594627215371;
        Mon, 13 Jul 2020 01:00:15 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id 33sm24383549wri.16.2020.07.13.01.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 01:00:14 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     jejb@linux.ibm.com, martin.petersen@oracle.com
Cc:     linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "PMC-Sierra, Inc" <aacraid@pmc-sierra.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 07/24] scsi: aacraid: commsup: Fix a bunch of function header issues
Date:   Mon, 13 Jul 2020 08:59:44 +0100
Message-Id: <20200713080001.128044-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713080001.128044-1-lee.jones@linaro.org>
References: <20200713080001.128044-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some parameters not documented.  Others misspelled.

Also, functions must follow directly after the header that documents them.

Fixes the following W=1 kernel build warning(s):

 drivers/scsi/aacraid/commsup.c:223: warning: Function parameter or member 'scmd' not described in 'aac_fib_alloc_tag'
 drivers/scsi/aacraid/commsup.c:421: warning: Function parameter or member 'qid' not described in 'aac_queue_get'
 drivers/scsi/aacraid/commsup.c:421: warning: Function parameter or member 'hw_fib' not described in 'aac_queue_get'
 drivers/scsi/aacraid/commsup.c:421: warning: Excess function parameter 'priority' description in 'aac_queue_get'
 drivers/scsi/aacraid/commsup.c:421: warning: Excess function parameter 'fib' description in 'aac_queue_get'
 drivers/scsi/aacraid/commsup.c:943: warning: Function parameter or member 'fibptr' not described in 'aac_fib_complete'
 drivers/scsi/aacraid/commsup.c:943: warning: Excess function parameter 'fib' description in 'aac_fib_complete'
 drivers/scsi/aacraid/commsup.c:1061: warning: Excess function parameter 'dev' description in 'AIF_SNIFF_TIMEOUT'
 drivers/scsi/aacraid/commsup.c:1061: warning: Excess function parameter 'fibptr' description in 'AIF_SNIFF_TIMEOUT'
 drivers/scsi/aacraid/commsup.c:2428: warning: Function parameter or member 'data' not described in 'aac_command_thread'
 drivers/scsi/aacraid/commsup.c:2428: warning: Excess function parameter 'dev' description in 'aac_command_thread'

Cc: Adaptec OEM Raid Solutions <aacraid@microsemi.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "PMC-Sierra, Inc" <aacraid@pmc-sierra.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/scsi/aacraid/commsup.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/aacraid/commsup.c b/drivers/scsi/aacraid/commsup.c
index 8ee4e1abe568d..adbdc3b7c7a70 100644
--- a/drivers/scsi/aacraid/commsup.c
+++ b/drivers/scsi/aacraid/commsup.c
@@ -214,6 +214,7 @@ int aac_fib_setup(struct aac_dev * dev)
 /**
  *	aac_fib_alloc_tag-allocate a fib using tags
  *	@dev: Adapter to allocate the fib for
+ *	@scmd: SCSI command
  *
  *	Allocate a fib from the adapter fib pool using tags
  *	from the blk layer.
@@ -405,8 +406,8 @@ static int aac_get_entry (struct aac_dev * dev, u32 qid, struct aac_entry **entr
  *	aac_queue_get		-	get the next free QE
  *	@dev: Adapter
  *	@index: Returned index
- *	@priority: Priority of fib
- *	@fib: Fib to associate with the queue entry
+ *	@qid: Queue number
+ *	@hw_fib: Fib to associate with the queue entry
  *	@wait: Wait if queue full
  *	@fibptr: Driver fib object to go with fib
  *	@nonotify: Don't notify the adapter
@@ -934,7 +935,7 @@ int aac_fib_adapter_complete(struct fib *fibptr, unsigned short size)
 
 /**
  *	aac_fib_complete	-	fib completion handler
- *	@fib: FIB to complete
+ *	@fibptr: FIB to complete
  *
  *	Will do all necessary work to complete a FIB.
  */
@@ -1049,6 +1050,7 @@ static void aac_handle_aif_bu(struct aac_dev *dev, struct aac_aifcmd *aifcmd)
 	}
 }
 
+#define AIF_SNIFF_TIMEOUT	(500*HZ)
 /**
  *	aac_handle_aif		-	Handle a message from the firmware
  *	@dev: Which adapter this fib is from
@@ -1057,8 +1059,6 @@ static void aac_handle_aif_bu(struct aac_dev *dev, struct aac_aifcmd *aifcmd)
  *	This routine handles a driver notify fib from the adapter and
  *	dispatches it to the appropriate routine for handling.
  */
-
-#define AIF_SNIFF_TIMEOUT	(500*HZ)
 static void aac_handle_aif(struct aac_dev * dev, struct fib * fibptr)
 {
 	struct hw_fib * hw_fib = fibptr->hw_fib_va;
@@ -2416,7 +2416,7 @@ static int aac_send_hosttime(struct aac_dev *dev, struct timespec64 *now)
 
 /**
  *	aac_command_thread	-	command processing thread
- *	@dev: Adapter to monitor
+ *	@data: Adapter to monitor
  *
  *	Waits on the commandready event in it's queue. When the event gets set
  *	it will pull FIBs off it's queue. It will continue to pull FIBs off
-- 
2.25.1

