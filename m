Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77ED02C23D5
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732783AbgKXLIL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:08:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:33780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732103AbgKXLGe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:34 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC5FF20897;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=qYik9kN5fhkt2mY+5ReJQAGA6pDQ9UivcMsFS8hiGIE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oFhJ5r/Ji4XJtgx0PyDlUsgMp3CV8ev8ZoGXUWLJxEBuhIwC4eDem8I3PiJdSzjPi
         J0yBhWlUSIemsiO3BcFTBslmeLp0gfw7Yf900IMTF7Xs9KUK9uCG/q2DKUTvNmoKS5
         NDuF1wt0FgeVaxv3efDLjrOjdtsqlYBS9mkyAh6A=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZw-V1; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 14/31] media: vidtv: fix the network ID range
Date:   Tue, 24 Nov 2020 12:06:10 +0100
Message-Id: <05d375a7aac935dd364bac4125b84a416b7f1d19.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As defined at ETSI TS 101 162, original network IDs up to 0xfebf
are reserved for registration at dvb.org.

Let's use, instead, an original network ID at the range
0xff00-0xffff, as this is for private temporary usage.

As the same value is also used for the network ID,
the range 0xff01-0xffff also fits better, as values
lower than that depend if the network is used for
satellite, terrestrial, cable of CI.

While here, move the TS ID to the bridge code, where it
is used, and change its value, as it was identical to
the value previously used by network ID. While we could
keep the same value, let's change it, just to make easier
to check for the new code while reading it with DVB tools
like dvbinspector.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 3 ++-
 drivers/media/test-drivers/vidtv/vidtv_common.h | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 807baf59db8d..ff9333dfa772 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -29,8 +29,9 @@
 #define MUX_BUF_MAX_SZ (MUX_BUF_MIN_SZ * 10)
 #define TUNER_DEFAULT_ADDR 0x68
 #define DEMOD_DEFAULT_ADDR 0x60
-#define VIDTV_DEFAULT_NETWORK_ID 0x744
+#define VIDTV_DEFAULT_NETWORK_ID 0xff44
 #define VIDTV_DEFAULT_NETWORK_NAME "LinuxTV.org"
+#define VIDTV_DEFAULT_TS_ID 0x4081
 
 /*
  * The LNBf fake parameters here are the ranges used by an
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
index 818e7f2b9ec5..42f63fdee681 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_common.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
@@ -16,7 +16,6 @@
 #define CLOCK_UNIT_27MHZ 27000000
 #define VIDTV_SLEEP_USECS 10000
 #define VIDTV_MAX_SLEEP_USECS (2 * VIDTV_SLEEP_USECS)
-#define VIDTV_DEFAULT_TS_ID 0x744
 
 u32 vidtv_memcpy(void *to,
 		 size_t to_offset,
-- 
2.28.0

