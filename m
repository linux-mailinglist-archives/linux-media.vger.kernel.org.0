Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39299547AF1
	for <lists+linux-media@lfdr.de>; Sun, 12 Jun 2022 18:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbiFLQGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jun 2022 12:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiFLQGN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jun 2022 12:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6712C167E9
        for <linux-media@vger.kernel.org>; Sun, 12 Jun 2022 09:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655049968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=FBYA8hVkQyuBoMm3Tz4AxwVSoZ3ykHguumtSI5oDfIc=;
        b=CBL0K0igADccE0h+8mRf4ANLiSLApeTQht3mBPUu/TkKRknmxXLEy60Y9W24PEGf4cPn2q
        loG7vCMkcpbILThnT1rlGOjSqWpPFmzB/WZ11nJg/CQskAaB0Wonv2cTe5KJeuvatnkpLz
        RU3S7GdiylSE4qcl1Pz267PtJUwXLbc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-WChyli2vNpmUe64ESY6yww-1; Sun, 12 Jun 2022 12:06:07 -0400
X-MC-Unique: WChyli2vNpmUe64ESY6yww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7587E3C01C0B;
        Sun, 12 Jun 2022 16:06:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ED7042166B26;
        Sun, 12 Jun 2022 16:06:04 +0000 (UTC)
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
Subject: [PATCH 0/3] media: atomisp: fix "don't pass a pointer to a local variable"
Date:   Sun, 12 Jun 2022 18:05:53 +0200
Message-Id: <20220612160556.108264-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi All,

While working on other atomisp stuff I noticed that the recently
added: "media: atomisp: don't pass a pointer to a local variable"
compiler warning fix broke things.

Here is a small series reverting the troublesome fix and adding
an alternative compiler warning fix which does work in my testing.

Regards,

Hans

p.s.

A while ago I mentioned that I was working on also making the code
work on Bay Trail devices (vs Cherry Trail) and that I had things
working with an older kernel based on Alan Cox' first merge of
the driver into drivers/staging. After a lot of work to keep the
code working rebasing on newer and newer (less old really) kernels
I had gathered some fixes and decided to just try the latest kernel.

And it turns out that the latest kernel already has all those
fixes and it just works. I don't know why my previous testing failed.
I might just have been unlucky with the hw which I used in my previous
testing.

So good news, the code works on Bay Trail too, which is also good
from a pov of being able to test on both platforms while doing further
refactoring.

Mauro, you also asked me to try mmap on the original code as merged
by Alan Cox, unfortunately mmap does not work their either, it seems
this has simply always been broken. More about this in another
patch-set.


Hans de Goede (3):
  media: atomisp: revert "don't pass a pointer to a local variable"
  media: atomisp: fix uninitialized stack mem usage in
    ia_css_rmgr_acq_vbuf()
  media: atomisp: fix -Wdangling-pointer warning

 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

-- 
2.36.0

