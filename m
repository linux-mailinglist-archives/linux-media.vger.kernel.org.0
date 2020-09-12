Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D566F267BD2
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 20:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgILSvj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 14:51:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgILSv1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 14:51:27 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D211B21D6C;
        Sat, 12 Sep 2020 18:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599936687;
        bh=0PU/DNFt4f6Rzyiw/4kbN0uHCEIwJDLqO3MyGp9lp6U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eDKtdCZFwP9vx/7iaks3o/vp6B4r8eFedvgfkyl6G2mti4Bq9FwDdifE/K+Ebni2w
         WGWHi3OYMIvr2tTFrYax1vGnXU36pL1OVQ0kPWNXDz0VPcSPM91EkaVTzKqPvppy9J
         wpPmte8tIpmNDaN3+l0RfZp3QPUxeZIjCH1YP110=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHAcM-001ilB-Ja; Sat, 12 Sep 2020 20:51:22 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: vidtv: add an initial channel frequency
Date:   Sat, 12 Sep 2020 20:51:21 +0200
Message-Id: <af3190acd273a5f2dd621f2d74a4b1c34dbd89e2.1599936678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <34e866e222b9827ecae40ea89a1e6958873fa2db.1599936678.git.mchehab+huawei@kernel.org>
References: <34e866e222b9827ecae40ea89a1e6958873fa2db.1599936678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use 474 MHz frequency for DVB-T/DVB-C, as this is the first
channel that it is valid on most places for DVB-T.

In the case of DVB-S, let's add Astra 19.2E initial
frequency at the scan files as the default, e. g. 12.5515 GHz.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 270c183b1d67..cb32f82f88f9 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -47,17 +47,25 @@ static unsigned int mock_tune_delay_msec;
 module_param(mock_tune_delay_msec, uint, 0);
 MODULE_PARM_DESC(mock_tune_delay_msec, "Simulate a tune delay");
 
-static unsigned int vidtv_valid_dvb_t_freqs[NUM_VALID_TUNER_FREQS];
+static unsigned int vidtv_valid_dvb_t_freqs[NUM_VALID_TUNER_FREQS] = {
+	474000000
+};
+
 module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0);
 MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
 		 "Valid DVB-T frequencies to simulate");
 
-static unsigned int vidtv_valid_dvb_c_freqs[NUM_VALID_TUNER_FREQS];
+static unsigned int vidtv_valid_dvb_c_freqs[NUM_VALID_TUNER_FREQS] = {
+	474000000
+};
+
 module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0);
 MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
 		 "Valid DVB-C frequencies to simulate");
 
-static unsigned int vidtv_valid_dvb_s_freqs[NUM_VALID_TUNER_FREQS];
+static unsigned int vidtv_valid_dvb_s_freqs[NUM_VALID_TUNER_FREQS] = {
+	12551500
+};
 module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0);
 MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
 		 "Valid DVB-C frequencies to simulate");
-- 
2.26.2

