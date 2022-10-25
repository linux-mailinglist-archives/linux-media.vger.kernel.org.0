Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5C460D0BE
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 17:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbiJYPgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 11:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbiJYPgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 11:36:11 -0400
X-Greylist: delayed 410 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 25 Oct 2022 08:36:03 PDT
Received: from mail.terefe.re (mail.terefe.re [5.255.96.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC917F9708
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 08:36:02 -0700 (PDT)
Received: from localhost.localdomain (unknown [212.106.161.89])
        by mail.terefe.re (Postfix) with ESMTPSA id 44E0120AE4;
        Tue, 25 Oct 2022 17:29:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=terefe.re; s=default;
        t=1666711751; bh=XcxAOdkETChosayCH05m3XXi4Y1joWYPGbXjc9OWTJU=;
        h=From:To:Cc:Subject:Date:From;
        b=HqhJyPiS1V9cUBBNalTXwJbQXGNJ4hjnQjxDRRRxwWsDLKg7moxwfnd8SiBLqKPC2
         0d3jS+P4vYKlQhcflZo/JKKlGLJh3trKHMJYKujDqiFpuXkHlBWriVaDWRSeJ/DSMB
         iN4WUEmnIqsk5syQCGhMCvL2om1ITu+L2AI6iEp/EY2/+Xp4KtnZqL/0wTiB8eBwz7
         ePx2tK/fvxoixIid3CkEUSiBJBGGsZZa2z9GaLgHl102t5UfQ/S/vhceYwA8KbQOti
         zRACYeHcqCHk8/7oyJBVRqlHFG/XmIaXXs4jkpAG/31x3dlSUe6pl/Mw2EKGXXFjGN
         B6Ntc7KPaI1zQ==
From:   Tomasz Maciej Nowak <tmn505@terefe.re>
To:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Maciej Nowak <tmn505@gmail.com>
Subject: [PATCH] media-build: fix menuconfig usage for kernel >= 5.13.0
Date:   Tue, 25 Oct 2022 17:29:02 +0200
Message-Id: <20221025152902.14298-1-tmn505@terefe.re>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tomasz Maciej Nowak <tmn505@gmail.com>

Because of 6dd85ff178cd ("kconfig: change "modules" from sub-option to
first-level attribute") in Linux kernel the "option" key-word is not
recognised anymore. That causes an abort when menuconfig is invoked.
Fix it by adding proper attribute depending on kernel version the
media_build is used against.

Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
 v4l/scripts/make_kconfig.pl | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/v4l/scripts/make_kconfig.pl b/v4l/scripts/make_kconfig.pl
index 69f0c67a37b1..76fbf8a168bc 100755
--- a/v4l/scripts/make_kconfig.pl
+++ b/v4l/scripts/make_kconfig.pl
@@ -651,7 +651,11 @@ while (my ($key, $deps) = each %depend) {
 	print OUT "# Needed by ", join(', ', keys %$deps), "\n";
 	print OUT "config $key\n\ttristate\n";
 	print OUT "\tdefault ", qw(n m y)[$kernopts{$key}], "\n\n";
-	print OUT "\toption modules\n" if ($key eq "MODULES");
+	if (cmp_ver($kernver, '5.13.0') < 0) {
+		print OUT "\toption modules\n" if ($key eq "MODULES");
+	} else {
+		print OUT "\tmodules\n" if ($key eq "MODULES");
+	}
 }
 close OUT;
 
-- 
2.38.1

