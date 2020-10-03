Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D768128228A
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 10:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbgJCImC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 04:42:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgJCImC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 04:42:02 -0400
Received: from mail.kernel.org (ip5f5ad5cf.dynamic.kabel-deutschland.de [95.90.213.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4ED75208E4;
        Sat,  3 Oct 2020 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601714521;
        bh=ZkUZaj2h5aSEOf3wk4MolxK+rJecG11kGs6Y+bMRXaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OCSiaep40cp1I6SpZIBqgrEnherSX2ylcdEQxquzBNc4+mlu2Zo4e/DsVrKi5AkZY
         +oaoyfqnudS/1KB0DqEKFuAh7JPbqXwDsKwqwjv+hSg6fnJVQFrk1mBAcFfMH7ctHZ
         KI8d/suUwxpsnUq7X/8fkxDXW4PqMu1TzC5tKtUE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kOd78-0002Ix-0Z; Sat, 03 Oct 2020 10:41:58 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: admin-guide: update cardlists
Date:   Sat,  3 Oct 2020 10:41:56 +0200
Message-Id: <ba9fe6443db587e17b7fb66093a52194b79191dc.1601714147.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <6b90346919d42ffc7c3ad283bfca2825b238147a.1601714147.git.mchehab+huawei@kernel.org>
References: <6b90346919d42ffc7c3ad283bfca2825b238147a.1601714147.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update them according with the current support on drivers.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../admin-guide/media/dvb-usb-dvbsky-cardlist.rst         | 8 ++++----
 .../admin-guide/media/dvb-usb-dw2102-cardlist.rst         | 4 ++++
 Documentation/admin-guide/media/em28xx-cardlist.rst       | 4 ++++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/media/dvb-usb-dvbsky-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dvbsky-cardlist.rst
index 4fb4ce56df7c..9f7b619f35f7 100644
--- a/Documentation/admin-guide/media/dvb-usb-dvbsky-cardlist.rst
+++ b/Documentation/admin-guide/media/dvb-usb-dvbsky-cardlist.rst
@@ -20,13 +20,13 @@ dvb-usb-dvbsky cards list
      - 0572:0320
    * - DVBSky T680CI
      - 0572:680c
-   * - MyGica Mini DVB-T2 USB Stick T230
+   * - MyGica Mini DVB-(T/T2/C) USB Stick T230
      - 0572:c688
-   * - MyGica Mini DVB-T2 USB Stick T230C
+   * - MyGica Mini DVB-(T/T2/C) USB Stick T230C
      - 0572:c689
-   * - MyGica Mini DVB-T2 USB Stick T230C Lite
+   * - MyGica Mini DVB-(T/T2/C) USB Stick T230C Lite
      - 0572:c699
-   * - MyGica Mini DVB-T2 USB Stick T230C v2
+   * - MyGica Mini DVB-(T/T2/C) USB Stick T230C v2
      - 0572:c68a
    * - TechnoTrend TT-connect CT2-4650 CI
      - 0b48:3012
diff --git a/Documentation/admin-guide/media/dvb-usb-dw2102-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dw2102-cardlist.rst
index f01f9df1e249..e39bc8e4bffe 100644
--- a/Documentation/admin-guide/media/dvb-usb-dw2102-cardlist.rst
+++ b/Documentation/admin-guide/media/dvb-usb-dw2102-cardlist.rst
@@ -40,6 +40,10 @@ dvb-usb-dw2102 cards list
      - 0b48:3011
    * - TerraTec Cinergy S USB
      - 0ccd:0064
+   * - Terratec Cinergy S2 PCIe Dual Port 1
+     - 153b:1181
+   * - Terratec Cinergy S2 PCIe Dual Port 2
+     - 153b:1182
    * - Terratec Cinergy S2 USB BOX
      - 0ccd:0x0105
    * - Terratec Cinergy S2 USB HD
diff --git a/Documentation/admin-guide/media/em28xx-cardlist.rst b/Documentation/admin-guide/media/em28xx-cardlist.rst
index a5f0e6d22a1a..ace65718ea22 100644
--- a/Documentation/admin-guide/media/em28xx-cardlist.rst
+++ b/Documentation/admin-guide/media/em28xx-cardlist.rst
@@ -434,3 +434,7 @@ EM28xx cards list
      - PCTV DVB-S2 Stick (461e v2)
      - em28178
      - 2013:0461, 2013:0259
+   * - 105
+     - MyGica iGrabber
+     - em2860
+     - 1f4d:1abe
-- 
2.26.2

