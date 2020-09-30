Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854CD27DF07
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 05:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgI3Dgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 23:36:47 -0400
Received: from mail-41104.protonmail.ch ([185.70.41.104]:12890 "EHLO
        mail-41104.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3Dgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 23:36:47 -0400
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com [91.134.188.129])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41104.protonmail.ch (Postfix) with ESMTPS id 449472002ED1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 03:36:45 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="xvEc0xCd"
Date:   Wed, 30 Sep 2020 03:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1601437001;
        bh=pj69XHhWKsTp9SDJRyBelLvh+xgLtNcsNyXAZRyx7ug=;
        h=Date:To:From:Reply-To:Subject:From;
        b=xvEc0xCdxN7nXo/RYpClrtaJdDNrE/YPXxqUKcxCreQ4CXIJCIBBKXPvx2mExUNe8
         xb4hyk83amfylT4zh5NsfWAA37MdklsOhyEfQuHaczlyG/4+EYTIzqiUDZZO/OD7uk
         yCbCdcuT9xtSjq5vRhOXpQZbb7vsnb+KguckOudQ=
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   DLK <daniel.lee.kruse@protonmail.com>
Reply-To: DLK <daniel.lee.kruse@protonmail.com>
Subject: [RFC] media: cx23885: reset DMA on AMD Family 15h (Models 30h-3fh) I/O Memory Management Unit due to RiSC engine stall
Message-ID: <fBomE4kLpPNPTyJ7Zfg070Y5yx8DO2XdgZ978_HAdl7OhkJwJO5XNAIJybrQmrZ5Ixt4bS3ssarr409JKF_z2ip6faA_dhGp6_fuYn1KOV0=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MythTV and w-scan won't scan channels on the AMD Kaveri APU with the Hauppa=
uge
QuadHD TV tuner card.

For the solution I added the Input/Output Memory Management Unit's PCI Iden=
tity
of 0x1423 to the broken_dev_id[] array.

This patch is with the Linux 5.4.0-48-generic version of the kernel.

Signed-off-by: Daniel Lee Kruse <daniel.lee.kruse@protonmail.com>

---
diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/c=
x23885/cx23885-core.c
index 4b0c53f61fb7..4e8132d4b2df 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2074,6 +2074,10 @@ static struct {
         * 0x1451 is PCI ID for the IOMMU found on Ryzen
         */
        { PCI_VENDOR_ID_AMD, 0x1451 },
+       /* According to sudo lspci -nn,
+        * 0x1423 is the PCI ID for the IOMMU found on Kaveri
+        */
+       { PCI_VENDOR_ID_AMD, 0x1423 },
 };

 static bool cx23885_does_need_dma_reset(void)
