Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09A41C227B
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 05:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgEBDW3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 23:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgEBDW2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 23:22:28 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8422BC061A0C;
        Fri,  1 May 2020 20:22:28 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id f83so3847555qke.13;
        Fri, 01 May 2020 20:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qiwM8YuY++j6Qywzk7l2v88t8lfc2timetql0FUntf0=;
        b=AmFwTdgv/5go8FbghU+zeou6QNFBRuMQ0VWLqZLj6PtheexVMLvnAMpO6pj3VCTxmA
         b3H57HtlfMK6qOJvjhbZoy0XWIywF8uEdu+D4RtWNzNC/m74E23Wu/N9I/CUcc825ImT
         kNbS3csbDeSaTHoA6mXBVeuXTLGbVeaImzfHVA5mziTKaKWH6yHxyUJigRUHDq9/iRjx
         PpKFKYw2i3EFrF6nepjDnL3PDusqCLK7FoS87zVtrmQxa9LevqY6XOnXgculX0EBTYwL
         V3usrrd8sRJJgyisQkpPuIy5LYiqWtrVJqOFh90OZ0vDf+cusSbX7i6SqsBWUQbIR2Yw
         2P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qiwM8YuY++j6Qywzk7l2v88t8lfc2timetql0FUntf0=;
        b=F243SFbS2kYvpedsh8skS5vMQlEWbOEhvEJoVJPVaaj/FxmCuUGbV4Ocu2v2znZyON
         SvWn5KThB8JF00revdMZd3U2eMUMlR9+63F57krQdqbc7fUkxUQ037tQHA/2PtD3LSOo
         JcIFI0mobkL6jSV6HHNqznmMvMLvu8fZkWwD5ZDi6xKDoTqH4EukU6pFyNn+GADQnLD8
         PY6dn+p4M4FVJQKb275XuKdAJLpRqsOW1jYqkJX+C8vg05B9RMGj710PPfgKc3a6w+7T
         /GB7VMp3gEHpWujf+cbSKlyvKNSDxeg3iqe+f5hCg4cusSU/xvMSVBFw18O/QS98sDQT
         zIPA==
X-Gm-Message-State: AGi0PuZopQeUWe4GybcblK+zSi+TTe3uResCa7dUvPDveFJDHoSfXzKa
        80BMJPaFvTUDh+g965ogjVQ=
X-Google-Smtp-Source: APiQypL6aoL3SPLd1zGUq5eZin3g5GpQefi02P+yIjq+YghEc+iEMYrLVUCPy3jBFKyatJHZtZUd0g==
X-Received: by 2002:a05:620a:239:: with SMTP id u25mr5985234qkm.304.1588389747447;
        Fri, 01 May 2020 20:22:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602b:723a:1b2a:57a1:a611:34ed])
        by smtp.gmail.com with ESMTPSA id c41sm4410399qta.96.2020.05.01.20.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 20:22:26 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v4 00/11] media: vidtv: implement a virtual DVB driver
Date:   Sat,  2 May 2020 00:22:05 -0300
Message-Id: <20200502032216.197977-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>


This series is work in progress. It represents the current work done on a
virtual DVB driver for the Linux media subsystem. I am new to the media
subsystem and to kernel development in general.

This series currently adds:
-fake tuner, demodulator and bridge drivers
-a PSI generator
-a PES/TS packetizer
-a SMPTE 302m encoder, capable of encoding AES3 audio into MPEG TS
-a barebones TS mux abstraction

I appreciate any feedback!

Changes in v4:
	Added a PES packetizer
	Implemented a minimum version of the SMPTE 302m encoder for AES3 audio
	Fixed endianness in the PSI generator, converting fields to big endian where applicable
	Added a minimal TS mux abstraction

Changes in v3:
	Added a bridge driver
	Renamed the driver to vidtv
	Renamed/reworked commits into smaller pieces
	Moved the driver into its own directory
	Fixed the code for the signal strength in the tuner
	Removed useless enums in the tuner driver (e.g. lock_status, power_status...)
	Reworked the logic for the poll_snr thread in the demodulator driver
	Moved MPEG related code to the bridge driver, as it controls the demux logic
	Changed literals to #defines, used sizeof in place of integer literals when
	computing the size of PSI structs
	Moved the MPEG PSI tables to the heap to reduce stack space usage
	Now using usleep_range in place of msleep_interruptible in the MPEG TS thread
	Wrapped memcpy and memset to protect against buffer overflow when writing to the
	MPEG TS buffer.

Changes in v2:
	Attempted not to break assignments into multiple lines as much as possible.
	Code now passes checkpatch strict mode

	media: dvb_dummy_tuner: implement driver skeleton	
		Changed snr values to mili db
		Return value from 0-100 to indicate how far off the requested
		frequency is from a valid one

		Use the frequency shift to interpolate between 34dB and 10dB if
		we can not match against the SNR lookup table
		Remove sleep calls for suspend/resume

		Fix memcpy call for the config struct

        media: dvb_dummy_fe.c: lose TS lock on bad snr
		Randomly recover the TS lock if the signal quality improves
				
  	media: dvb_dummy_fe.c: write PSI information into DMX buffer
		Split the patch into multiple header/source files

		Hexadecimal literals are now lower case

		Prefer short function names / reduce function signatures

		Add #defines for constants when computing section lengths

		Change signature for functions that take a dummy channel as
		argument (i.e. channels* is now channels[NUM_CHANNELS])


Daniel W. S. Almeida (11):
  media: vidtv: add Kconfig entry
  media: vidtv: implement a tuner driver
  media: vidtv: implement a demodulator driver
  media: vidtv: move config structs into a separate header
  media: vidtv: add a bridge driver
  media: vidtv: add wrappers for memcpy and memset
  media: vidtv: add MPEG TS common code
  media: vidtv: implement a PSI generator
  media: vidtv: implement a PES packetizer
  media: vidtv: Implement a SMPTE 302M encoder
  media: vidtv: Add a MPEG Transport Stream Multiplexer

 drivers/media/test-drivers/Kconfig            |   10 +
 drivers/media/test-drivers/Makefile           |    1 +
 drivers/media/test-drivers/vidtv/Kconfig      |   11 +
 drivers/media/test-drivers/vidtv/Makefile     |    7 +
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  442 +++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |   39 +
 .../media/test-drivers/vidtv/vidtv_channel.c  |  326 +++++
 .../media/test-drivers/vidtv/vidtv_channel.h  |   66 +
 .../media/test-drivers/vidtv/vidtv_common.c   |   51 +
 .../media/test-drivers/vidtv/vidtv_common.h   |   35 +
 .../media/test-drivers/vidtv/vidtv_config.h   |   35 +
 .../media/test-drivers/vidtv/vidtv_demod.c    |  494 +++++++
 .../media/test-drivers/vidtv/vidtv_demod.h    |   34 +
 .../media/test-drivers/vidtv/vidtv_encoder.h  |  103 ++
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  423 ++++++
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  105 ++
 drivers/media/test-drivers/vidtv/vidtv_pes.c  |  429 ++++++
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |  185 +++
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1155 +++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |  362 ++++++
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  608 +++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.h    |   99 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.c   |  130 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  103 ++
 .../media/test-drivers/vidtv/vidtv_tuner.c    |  403 ++++++
 25 files changed, 5656 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test-drivers/vidtv/Makefile
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_config.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_encoder.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.c

-- 
2.26.2

