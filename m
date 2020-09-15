Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C3A269F8C
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 09:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgIOHWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 03:22:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:43464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbgIOHWO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 03:22:14 -0400
Received: from mail.kernel.org (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36FCB20EDD;
        Tue, 15 Sep 2020 07:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600154533;
        bh=oCvrzKbAPo2pXN2csnzS1LlIhxmlfQMu70M/hn3lOlU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rx/7CG+wFpfz07GPulc7XxJjd5Y6SpvEf1cOulP6ag8Od7h9Z3aZbVl7MESbZ7nLB
         LQ3/Q+xk0gLRxZxDRzT+i8XDZC4gM2R9b5WeaAsHBvX4v++4nCk+ajMTblMiGh6JJ6
         X5OOR2RKGAmhphiEbjw8DkwmjaNSg2rGDjoqCw+4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kI5I2-004XJj-Q1; Tue, 15 Sep 2020 09:22:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: vidtv.rst: update it to better describe the frequencies
Date:   Tue, 15 Sep 2020 09:22:09 +0200
Message-Id: <be96344fb96ab821576ee9b6de05b6432b02163f.1600154449.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600154449.git.mchehab+huawei@kernel.org>
References: <cover.1600154449.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The virtual driver has now a minimal set of frequencies for a
single transponder to be found by each DVB standard.

Document it, and update related information about the
simulated LNBf.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/drivers/vidtv.rst | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/vidtv.rst b/Documentation/driver-api/media/drivers/vidtv.rst
index c9f62fcfdd9b..65115448c52d 100644
--- a/Documentation/driver-api/media/drivers/vidtv.rst
+++ b/Documentation/driver-api/media/drivers/vidtv.rst
@@ -62,6 +62,14 @@ When compiled as a module, run::
 That's it! The bridge driver will initialize the tuner and demod drivers as
 part of its own initialization.
 
+By default, it will accept the following frequencies:
+
+	- 474 MHz for DVB-T/T2/C;
+	- 11,362 GHz for DVB-S/S2.
+
+For satellite systems, the driver simulates an universal extended
+LNBf, with frequencies at Ku-Band, ranging from 10.7 GHz to 12.75 GHz.
+
 You can optionally define some command-line arguments to vidtv.
 
 Command-line arguments to vidtv
@@ -86,13 +94,13 @@ mock_tune_delay_msec
 	Simulate a tune delay.  Default 0.
 
 vidtv_valid_dvb_t_freqs
-	Valid DVB-T frequencies to simulate.
+	Valid DVB-T frequencies to simulate, in Hz.
 
 vidtv_valid_dvb_c_freqs
-	Valid DVB-C frequencies to simulate.
+	Valid DVB-C frequencies to simulate, in Hz.
 
 vidtv_valid_dvb_s_freqs
-	Valid DVB-C frequencies to simulate.
+	Valid DVB-S/S2 frequencies to simulate at Ku-Band, in kHz.
 
 max_frequency_shift_hz,
 	Maximum shift in HZ allowed when tuning in a channel.
-- 
2.26.2

