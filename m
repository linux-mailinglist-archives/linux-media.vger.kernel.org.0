Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81AD2C23AA
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732606AbgKXLGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:33794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732509AbgKXLGg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:36 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B2222223C;
        Tue, 24 Nov 2020 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=SSmmz+Xv/F8F5bLjxjkNpqvU2LAL2wcRypsC4tIZuDE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JH6eT+V23GaGrPli0+hmLc1RlXUfVZ5rdsKgUVotOQWbL62j0YlIVBfDhoub4DQGQ
         3PXdG8mwQAXlA8ouQNkEH04zFw/zcCZJX81LxsYgb47Gr16kfwLTiKn9OBmIKRGx1D
         XZL6tGBtbPHYl9P1wwopdVDkD4AY/qDzQJX68fWM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9V-000Faf-Cl; Tue, 24 Nov 2020 12:06:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 29/31] media: vidtv.rst: update vidtv documentation
Date:   Tue, 24 Nov 2020 12:06:25 +0100
Message-Id: <9fa911fbdf90343f49fc1f284ea47fe0407a2b81.1606215584.git.mchehab+huawei@kernel.org>
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

Update the vidtv documentation with the relevant changes
after the last patches.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../driver-api/media/drivers/vidtv.rst        | 85 ++++++++++++++++---
 1 file changed, 72 insertions(+), 13 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/vidtv.rst b/Documentation/driver-api/media/drivers/vidtv.rst
index edaceef2808c..52c201798d78 100644
--- a/Documentation/driver-api/media/drivers/vidtv.rst
+++ b/Documentation/driver-api/media/drivers/vidtv.rst
@@ -258,6 +258,42 @@ Using dvb-fe-tool
 The first step to check whether the demod loaded successfully is to run::
 
 	$ dvb-fe-tool
+	Device Dummy demod for DVB-T/T2/C/S/S2 (/dev/dvb/adapter0/frontend0) capabilities:
+	    CAN_FEC_1_2
+	    CAN_FEC_2_3
+	    CAN_FEC_3_4
+	    CAN_FEC_4_5
+	    CAN_FEC_5_6
+	    CAN_FEC_6_7
+	    CAN_FEC_7_8
+	    CAN_FEC_8_9
+	    CAN_FEC_AUTO
+	    CAN_GUARD_INTERVAL_AUTO
+	    CAN_HIERARCHY_AUTO
+	    CAN_INVERSION_AUTO
+	    CAN_QAM_16
+	    CAN_QAM_32
+	    CAN_QAM_64
+	    CAN_QAM_128
+	    CAN_QAM_256
+	    CAN_QAM_AUTO
+	    CAN_QPSK
+	    CAN_TRANSMISSION_MODE_AUTO
+	DVB API Version 5.11, Current v5 delivery system: DVBC/ANNEX_A
+	Supported delivery systems:
+	    DVBT
+	    DVBT2
+	    [DVBC/ANNEX_A]
+	    DVBS
+	    DVBS2
+	Frequency range for the current standard:
+	From:            51.0 MHz
+	To:              2.15 GHz
+	Step:            62.5 kHz
+	Tolerance:       29.5 MHz
+	Symbol rate ranges for the current standard:
+	From:            1.00 MBauds
+	To:              45.0 MBauds
 
 This should return what is currently set up at the demod struct, i.e.::
 
@@ -316,7 +352,7 @@ For this, one should provide a configuration file known as a 'scan file',
 here's an example::
 
 	[Channel]
-	FREQUENCY = 330000000
+	FREQUENCY = 474000000
 	MODULATION = QAM/AUTO
 	SYMBOL_RATE = 6940000
 	INNER_FEC = AUTO
@@ -337,6 +373,14 @@ You can browse scan tables online here: `dvb-scan-tables
 Assuming this channel is named 'channel.conf', you can then run::
 
 	$ dvbv5-scan channel.conf
+	dvbv5-scan ~/vidtv.conf
+	ERROR    command BANDWIDTH_HZ (5) not found during retrieve
+	Cannot calc frequency shift. Either bandwidth/symbol-rate is unavailable (yet).
+	Scanning frequency #1 330000000
+	    (0x00) Signal= -68.00dBm
+	Scanning frequency #2 474000000
+	Lock   (0x1f) Signal= -34.45dBm C/N= 33.74dB UCB= 0
+	Service Beethoven, provider LinuxTV.org: digital television
 
 For more information on dvb-scan, check its documentation online here:
 `dvb-scan Documentation <https://www.linuxtv.org/wiki/index.php/Dvbscan>`_.
@@ -346,23 +390,38 @@ Using dvb-zap
 
 dvbv5-zap is a command line tool that can be used to record MPEG-TS to disk. The
 typical use is to tune into a channel and put it into record mode. The example
-below - which is taken from the documentation - illustrates that::
+below - which is taken from the documentation - illustrates that\ [1]_::
 
-	$ dvbv5-zap -c dvb_channel.conf "trilhas sonoras" -r
-	using demux '/dev/dvb/adapter0/demux0'
+	$ dvbv5-zap -c dvb_channel.conf "beethoven" -o music.ts -P -t 10
+	using demux 'dvb0.demux0'
 	reading channels from file 'dvb_channel.conf'
-	service has pid type 05:  204
-	tuning to 573000000 Hz
-	audio pid 104
-	  dvb_set_pesfilter 104
-	Lock   (0x1f) Quality= Good Signal= 100.00% C/N= -13.80dB UCB= 70 postBER= 3.14x10^-3 PER= 0
-	DVR interface '/dev/dvb/adapter0/dvr0' can now be opened
+	tuning to 474000000 Hz
+	pass all PID's to TS
+	dvb_set_pesfilter 8192
+	dvb_dev_set_bufsize: buffer set to 6160384
+	Lock   (0x1f) Quality= Good Signal= -34.66dBm C/N= 33.41dB UCB= 0 postBER= 0 preBER= 1.05x10^-3 PER= 0
+	Lock   (0x1f) Quality= Good Signal= -34.57dBm C/N= 33.46dB UCB= 0 postBER= 0 preBER= 1.05x10^-3 PER= 0
+	Record to file 'music.ts' started
+	received 24587768 bytes (2401 Kbytes/sec)
+	Lock   (0x1f) Quality= Good Signal= -34.42dBm C/N= 33.89dB UCB= 0 postBER= 0 preBER= 2.44x10^-3 PER= 0
 
-The channel can be watched by playing the contents of the DVR interface, with
-some player that recognizes the MPEG-TS format, such as *mplayer* or *vlc*.
+.. [1] In this example, it records 10 seconds with all program ID's stored
+       at the music.ts file.
+
+
+The channel can be watched by playing the contents of the stream with some
+player that  recognizes the MPEG-TS format, such as ``mplayer`` or ``vlc``.
 
 By playing the contents of the stream one can visually inspect the workings of
-vidtv, e.g.::
+vidtv, e.g., to play a recorded TS file with::
+
+	$ mplayer music.ts
+
+or, alternatively, running this command on one terminal::
+
+	$ dvbv5-zap -c dvb_channel.conf "beethoven" -P -r &
+
+And, on a second terminal, playing the contents from DVR interface with::
 
 	$ mplayer /dev/dvb/adapter0/dvr0
 
-- 
2.28.0

