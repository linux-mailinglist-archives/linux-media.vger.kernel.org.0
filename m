Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E987E1A0190
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 01:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgDFXVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 19:21:10 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:44116 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgDFXVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 19:21:09 -0400
Received: by mail-qv1-f65.google.com with SMTP id ef12so933724qvb.11;
        Mon, 06 Apr 2020 16:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EI3fvdQqo6rWLTVe2rmui3f2Khg7EPctCx3cXAlE7J0=;
        b=J6QX0CubGX5SPxKtgX9CF/xkUrvX8lYSkpj12JTpMIi/HnVgM6KBJcV5Groh7Y3kG9
         sXV4eEwc8yiykvAbn5wkZuwBp0QSa2X3U9dlrY1hDHOoc7W0ev3IBlLXH3RLucolBTvm
         hvweeAb90juSY5rcx+ExyIKa9wXyqXPdgP1Vy2tIuj2u4LOF2nvrhRwm+MsdI1lQBi/A
         7krV8bTjq759psp4TI683/dvROhBQCtUKfD+ypQLzSx+RTJuCs1qvGL8BxrSHR6ogO6X
         Mvrd4V4sU0fgXlg24fWIG1KI/SRiYXnMcb2lop9iKEbhxSE2jKqYDMebn9q1Z2/fqOJb
         QIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EI3fvdQqo6rWLTVe2rmui3f2Khg7EPctCx3cXAlE7J0=;
        b=N0oyyxyq2OJ6CW8KSUDPAyHTVoEItrB7ussUSndVbaXJcb/BUb3yiz25jnqp2I1Lwj
         MsNOAzsYMnqtkq+wWCSlnVWqh8tC8GpHd7hnJNyVN4hPOGOKX3EDjVw/aK0DdiRukZjV
         9fTQzRphLhstS0aLwPeJ0IbsnAR7O+JtopTQyltR25+s/DB3bqdtq9YbR7N8m6Lec+Dz
         Wl/gDXJdcs08Mm1NxpI2jpBpGkLZvVWEj/L6+z3rKyD7A949M+U0yZCgXd9PfdAnmLI9
         jhfqwccXn33CfffeTNgb+lDv/t5sa6m4DODsDot0QqHYOn8TnD7QNKzjeeCYj9WW2g8z
         ybEQ==
X-Gm-Message-State: AGi0PuZq1jIMOWdAfM1LppHTtpcHhmpNCmQpULku4abtIDUpdXW4ppTo
        kd+041W6fceK3kYAwjuY6mE=
X-Google-Smtp-Source: APiQypJMewMvKoVtBgRnRk/+pX8EOOTVw2UhVe+4wO5clgqS5WzO63yET9RcNc2blnDiu8lJQWS+Sw==
X-Received: by 2002:a0c:a284:: with SMTP id g4mr2180127qva.131.1586215267533;
        Mon, 06 Apr 2020 16:21:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id u26sm1490978qku.54.2020.04.06.16.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 16:21:06 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v3 0/6] media: vidtv: implement a virtual DVB driver
Date:   Mon,  6 Apr 2020 20:20:49 -0300
Message-Id: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.0
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

This applies on top of this branch
https://git.linuxtv.org/mchehab/experimental.git/log/?h=media-kconfig
for now, as these changes have not been applied to the media tree yet.
The changes in this branch have reorganized where test drivers go in
the subsystem. The dummy driver written by Emard was left untouched.

As for vidtv, we currently have a tuner driver, a demodulator driver, a
bridge driver and some MPEG PSI code. This should be, therefore, a
minimum viable example for what this driver intends to become in the
future.

I appreciate any feedback given. Thank you.


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

Daniel W. S. Almeida (6):
  media: vidtv: add Kconfig entry
  media: vidtv: implement a tuner driver
  media: vidtv: implement a demodulator driver
  media: vidtv: implement a PSI generator
  media: vidtv: move config structs into a common header
  media: vidtv: add a bridge driver

 drivers/media/test_drivers/Kconfig            |  10 +
 drivers/media/test_drivers/Makefile           |   1 +
 drivers/media/test_drivers/vidtv/Kconfig      |  11 +
 drivers/media/test_drivers/vidtv/Makefile     |   6 +
 .../media/test_drivers/vidtv/vidtv_bridge.c   | 736 ++++++++++++++
 .../media/test_drivers/vidtv/vidtv_bridge.h   |  51 +
 .../media/test_drivers/vidtv/vidtv_common.c   |  44 +
 .../media/test_drivers/vidtv/vidtv_common.h   | 105 ++
 .../media/test_drivers/vidtv/vidtv_demod.c    | 493 +++++++++
 .../media/test_drivers/vidtv/vidtv_demod.h    |  34 +
 drivers/media/test_drivers/vidtv/vidtv_psi.c  | 960 ++++++++++++++++++
 drivers/media/test_drivers/vidtv/vidtv_psi.h  | 294 ++++++
 .../media/test_drivers/vidtv/vidtv_tuner.c    | 403 ++++++++
 13 files changed, 3148 insertions(+)
 create mode 100644 drivers/media/test_drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test_drivers/vidtv/Makefile
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_bridge.h
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_common.h
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_demod.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_demod.h
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_psi.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_psi.h
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_tuner.c

-- 
2.26.0

