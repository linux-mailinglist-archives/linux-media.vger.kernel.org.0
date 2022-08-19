Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0105993D7
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 06:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345840AbiHSD7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 23:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345788AbiHSD72 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 23:59:28 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A35B71BDE
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 20:59:26 -0700 (PDT)
Date:   Fri, 19 Aug 2022 03:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1660881561; x=1661140761;
        bh=z8TRG7QrbVbda8C8nKyYXZo+z6zBHklEkXfbMVjn5gM=;
        h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=eQB7BdUZL3jVhqR3+NCaQXvFzKaoRAGmgou7EwEPw9HcCoUBz0a4eAST/RWB1xHUF
         /GzdYtpQXi5T2aWVmWu7STVsmXKHmkf1+CKonCN1QNRQfyGh7umD0iEWRH7llluK+U
         57rNnQCeVJcO4N4HH4ZJwiAGivWJOKEPwDCN2a7QdFfAPsSk64IDGV/8sVRqFypeA8
         mcSl5sMaEAAEkHndFM81XQfDenaOiOlqfVZkIjclmaKr+/LVlQNrql420eBJuiWSgC
         48eYrCyDc9DnO3l27PSjC1Boav+zGNTsYvg7fhNQmoBrc1NtMjYRj+pboBv6Pz7xMd
         Y++piXtvRRCEg==
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Daniel Kruse <daniel.lee.kruse@proton.me>
Reply-To: Daniel Kruse <daniel.lee.kruse@proton.me>
Subject: [PATCH] media: cx23885: reset DMA on AMD Renior/Cezanne IOMMU due to RiSC engine stall
Message-ID: <0-5YZkVe3JRt88zsfDeQI1Bb44YvZwiWCsj1bgLL0bx-ItVzDmHcWnnSqNWazsCSa3mNBB2ra_SHMHWnpoLOnp68LG46q7JMQZt8rseG8Uc=@proton.me>
Feedback-ID: 45782596:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everybody,

MythTv is unable to scan channels with APUs with the Renior IOMMU that is a=
lso contained in the Cezanne line of APUs.  This issue was discovered on th=
e 5.15 version the kernel.  This patch adds the IOMMU PCI ID to the broken_=
dev_id array.  This patch was developed with 5.19 of the media_tree repo.

Checkpatch results:
./scripts/checkpatch.pl -f cx23885-core.patch=20
total: 0 errors, 0 warnings, 14 lines checked

cx23885-core.patch has no obvious style problems and is ready for submissio=
n.

Signed-off-by: Daniel Lee Kruse <daniel.lee.kruse@proton.me>

---

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/c=
x23885/cx23885-core.c
index a07b18f2034e..9232a966bcab 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2086,6 +2086,9 @@ static struct {
        /* 0x1419 is the PCI ID for the IOMMU found on 15h (Models 10h-1fh)=
 family
         */
        { PCI_VENDOR_ID_AMD, 0x1419 },
+       /* 0x1631 is the PCI ID for the IOMMU found on Renoir/Cezanne
+        */
+       { PCI_VENDOR_ID_AMD, 0x1631 },
        /* 0x5a23 is the PCI ID for the IOMMU found on RD890S/RD990
         */
        { PCI_VENDOR_ID_ATI, 0x5a23 },

