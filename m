Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C52549FDF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245754AbiFMUqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347572AbiFMUpN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:45:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2B8EA2F66E
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149975;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9q64LWP12y0X95rSsagQ9xkrf9Y3OYzzhSyXXwSq9FQ=;
        b=QAxh1T1O72lmjMbz7t4bxMTb5DLqs0ViwEaIYLraAc3AQ2k3PkVhdBd5p6U2Nr2QFd2WrY
        QWDJitVcg+dJunAT5HZpFTSpkPK66UEFxyZLPe4OecrrO192PC6+rf5duasG7ZUY5PF1Cv
        tnX/dI2azUGw5YNG9E1LkgUjwb8EIH0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-SDkwoOmWOdCp9dFzPcSgvQ-1; Mon, 13 Jun 2022 15:52:52 -0400
X-MC-Unique: SDkwoOmWOdCp9dFzPcSgvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0028880B70A;
        Mon, 13 Jun 2022 19:52:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 71FAB2166B26;
        Mon, 13 Jun 2022 19:52:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 40/40] media: atomisp: Add a notes.txt file
Date:   Mon, 13 Jun 2022 21:51:37 +0200
Message-Id: <20220613195137.8117-41-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a files documenting what I've learned about the driver while
working on various cleanups.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/notes.txt | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 drivers/staging/media/atomisp/notes.txt

diff --git a/drivers/staging/media/atomisp/notes.txt b/drivers/staging/media/atomisp/notes.txt
new file mode 100644
index 000000000000..d128b792e05f
--- /dev/null
+++ b/drivers/staging/media/atomisp/notes.txt
@@ -0,0 +1,30 @@
+Some notes about the working of the atomisp drivers (learned while working
+on cleaning it up).
+
+The atomisp seems to be a generic DSP(ISP) like processor without a fixed
+pipeline. It does not have its own memory, but instead uses main memory.
+The ISP has its own address-space and main memory needs to be mapped into
+its address space through the ISP's MMU.
+
+Memory is allocated by the hmm code. hmm_alloc() returns an ISP virtual
+address. The hmm code keeps a list of all allocations and when necessary
+the hmm code finds the backing hmm-buffer-object (hmm_bo) by looking
+up the hmm_bo based on the ISP virtual address.
+
+The actual processing pipeline is made by loading one or more programs,
+called binaries. The shisp_240??0_v21.bin firmware file contains many
+different binaries. Binaries are picked by filling a ia_css_binary_descr
+struct with various input and output parameters and then calling
+ia_css_binary_find(). Some binaries support creating multiple outputs
+(preview + video frame?) at the same time.
+
+For example for the /dev/video0 preview node load_preview_binaries()
+from atomisp/pci/sh_css.c is called and then loads a preview and
+optionally a scalar binary. Note when digital zoom is disabled
+(it is enabled by default) only the preview binary is loaded.
+So in this case a single binary handles the entire pipeline.
+
+Since getting a picture requires multiple processing steps,
+this means that unlike in fixed pipelines the soft pipelines
+on the ISP can do multiple processing steps in a single pipeline
+element (in a single binary).
-- 
2.36.0

