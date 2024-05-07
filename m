Return-Path: <linux-media+bounces-10941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 486F08BD892
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73A3EB21EAD
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C9533C8;
	Tue,  7 May 2024 00:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="lJa3tcU0"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C104679D0
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041533; cv=none; b=A+Drl7Xcd8buwAWVALCpbqLt79F/FoiLX47cQVPgBhn4uX8l6Ui5jZLEHsamfTc4+cvO80KnKRAnPdrfWg/DD6hHIl7cHQ7fHounn8I7t/nCF68uCU727dmzMyVS/rc3AEIx0WqxGJN8xJx35YUf3ZfaHvx/i9erAVCI6cl2W4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041533; c=relaxed/simple;
	bh=71Ipe14Xb2K2xCzmMlr+5xKMDUW0z/7R72994PKYCAI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rHs7qSTnvFU4KQf+xTbZ8I19p+XxHXbhuxnqR/w2BiB0hqF0QUuofBdvunugUy06FIvna2Lf/ZdShNKcdxaCMxuafzpF/4wBkkI+xA48MiIZv3Yv7r8gE7ILD+Fs1RR17iQ/vGf9CxRTZ6ENcm/fmOQiyerNXuKQEQN5QjEfiuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=lJa3tcU0; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041525; x=1715646325; i=herdler@nurfuerspam.de;
	bh=4Mpf2TPp7vZL8NyrXrDFvhaQHC3KOMHx0cMtc6iYyew=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lJa3tcU0yXX6dLTB7+wDZ+mT+X0mcQuT6wZRMUIJM5x5JYhYNrxzfy4k29Uyvoyx
	 UKGjYmoTjCmnJ9Ruvkuy/LWR3gpBYGY22UYrNtrmwAcJvOh3P7ffZ4dCCxGpOIX4v
	 sRXwG8lpLZOYzIAtH1YqJxxFO5zAK4CYiUas7KMCqOtRrX8DsWlflhfwhBku9Zc2m
	 lkrPAT99WZJByMUZMW8DC8t5sJeIoR/9tmlGQq3ohXqi9DezrSKcaHAOAY0z+BmM/
	 t0LTsJrTHjHNoSj9Bb27CKI1iK5oyuEMf8YDHf5SUpyuyDhzfCwOOlpBHr/XhBu10
	 fOzczzxH82BYgDj5oA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlXK-1sWHqs46JK-00jqrp; Tue, 07
 May 2024 02:25:25 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 00/21] media: av7110: make chackpatch happier
Date: Tue,  7 May 2024 02:24:39 +0200
Message-Id: <20240507002500.81867-1-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nVbF0uCDJJzMLfT65kpbxjYWQVibZx2jGK2n4VQLRN2d5lWNeW3
 4tXqubdAv/pgXQN0FxAoaaFh2rtx5AV6uhfbMUGdqRs38VTOmJEvDv3kxNszzJ9QrCmMavz
 ptdM9z1roFNbVDF8qf3gL2AcANfN0yxDFbon8gRjx2LnqO37DQrAhsLDFObkNHFKLq9nih6
 8PKe1fIsGrzM2DGnsQ4YQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OnYNuHxOmu4=;U6Wkm09PlYSKuiJlpevmce+g/yE
 ncO8dJJ7RCVfPAYBhTVS8ruoKlyPBh8zAWSpTX4a5xcuzuphUHIcrDvm4DOcNzKiIYWPJqi7D
 kkh8iwl+tf1+e+0Zkqa4SeefrK9htwHj/HJEt8ZHXTjObERtwaqG0ClDHcFF9UKUeS5lz0lvV
 rILK7FJG6McswWWuNF7EHnK2+l1Ih2X8DbBLFsWpKzrDQfzY42leqJ+MAWnGRqC2mgTmmH9XL
 65H0aJ3TwoMJedgCqJt12Y+5jKp/hAoxQVgnSvdNwuGU0L8/0nFhtHWDtW/8UiX58elz1MVGQ
 3XE7wG1GZqwJ4/Bv4QbNPin2U7OeDoebLYway3x+mFfTU0vRYRg02gZXm6Qf9WcvU1/8tdp9H
 S6o2KXCzFRAbvy64MK8wJz8+Tsq3/F1OKa9NhnhkxBSkydsH5j0EHy139xN7wOoRmu3gRPDX7
 qbaIDYw6UpuwphK7fo2oIqh8ofulxA/NslqRni33+umwVKWKfJc9a31XG9irs314KUvUhoE9M
 Ze7Sy3zXZqIkhusYyEe4HI5SdSQlwL0xhIw4G0K21Airf6N+R1M3+fTmNtxxYb2SOtGY2k/7y
 T3l7ER5qXwuRHc1FrG/OCLDY7quNpobP81+ecuKfQp94eEwadmp2WAiBdCCzisOicS9KYLS3i
 GEegUzjJBZBlt8H2WDtiL7nOWm6RZhV/9A3Yyxy1pUra+/bAQsgjkYgXKPGMd6+PJGDbeZ4Mu
 Jkvv3wGW1+IKmIitoLHRYjjQTELsHJmhfTj4DG6oHhCvoc55IZ4R+K1nG4Ie7IDFLJ4A+X/D2
 hlHmzxtgSn/WVCxgXb0RW9mcx7GVoA4BD7lg4nLV5wWtY=

Hi Hans,

this is next patch set of the SAA7146 chackpatch series.
A pretty big one, I'm sorry, but there was a lot to fix.

I have tried to keep the patch set as small as possible. Every line
is modified only once (except very few exceptions).
White space fixes are incorporated in the later patches if necessary.

Patches 01 and 02 are "general cleanup".
(Further details are in the description in the patch mails.)
Both patches are independent from each other and from the rest.

Patches 03 - 06 are for the sp8870 driver.
They are independent from the other patches.
The sp8870 driver is separated, because I can't test the patches.
I don't have the hardware.

Patches 07 - 21 are for the AV7110 (dvb-ttpci) driver.
They are again independent from the other patches.


There are a few LONG_LINE warnings in some of the patches.
I was a little generous at the pr*() and dprintk() lines, if it was
possible to avoid line wrapping. The strings shouldn't be wrapped anyway
and a dangling "__func__" in the next line is somehow odd.
And well, almost all lines chackpach complains about, are already shorter
then before the patch :-).


Remaining checkpatch warnings after completely applying this patch set:

      1 CHECK:AVOID_BUG: Do not crash the kernel unless ...
    118 CHECK:CAMELCASE: Avoid CamelCase: ...
      3 CHECK:LONG_LINE_COMMENT: line length of ... exceeds 100 columns
     47 CHECK:LONG_LINE: line length of ... exceeds 100 columns
      1 CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fe_func' ...
      3 CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without commen=
t
      4 CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comm=
ent
     13 CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around ...
      1 CHECK:USLEEP_RANGE: usleep_range is preferred over udelay ...
      2 WARNING:DEEP_INDENTATION: Too many leading tabs ...
      2 WARNING:IF_0: Consider removing the code enclosed ...
     11 WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms ...
      3 WARNING:VOLATILE: Use of volatile is usually wrong ...
  =3D=3D=3D=3D=3D=3D=3D
  Total:     0 ERROR;     18 WARNING;    191 CHECK
(Before:   459 ERROR;    343 WARNING;    621 CHECK)

The UNNECESSARY_PARENTHESES haven't been changed by intention.
They often appear in pretty long statements and seem to be sensible
placed. IMHO they increase human readability.

The most and worst LONG_LINE warnings are in the frontend_init() function,
exactly like in the budget drivers too. It makes probably sense to take a
look at all of them at once, I think.

And then the CAMELCASEs, I'm still not sure if it is worth to deal with
them. The fix will probably pretty easy script able. But the resulting
patch set for 118 different variables, with multiple occurrences, would be
huge, no matter what I do.
Well, maybe I just try to script it an see what happens ...

That's what I can do for now. The remaining rest will need more time,
either for investigation, or testing. (And this patch set is long enough
anyway. ;-))
I hope it is sufficient to bring the driver back mainline.

This patch set has been tested on a rev. 1.3 DVB-S card with full-ts mod.

Regards
Stefan


Stefan Herdler (21):
  media: av7110: remove old documentation files
  media: av7110: remove budget-patch driver
  media: sp8870: coding style fixes: whitespace
  media: sp8870: coding style fixes: newline, comments and braces
  media: sp8870: coding style fixes: miscellaneous
  media: sp8870: coding style fixes: logging
  media: av7110: coding style fixes: pointer_location
  media: av7110: coding style fixes: blank lines
  media: av7110: coding style fixes: whitespace
  media: av7110: coding style fixes: newline
  media: av7110: coding style fixes: whitespace (strict)
  media: av7110: coding style fixes: comments
  media: av7110: coding style fixes: braces
  media: av7110: coding style fixes: assignments
  media: av7110: coding style fixes: comparsations
  media: av7110: coding style fixes: sizeof
  media: av7110: coding style fixes: variable types
  media: av7110: coding style fixes: miscellaneous
  media: av7110: coding style fixes: deep_indentation
  media: av7110: coding style fixes: logging
  media: av7110: coding style fixes: avoid_externs

 drivers/staging/media/av7110/Kconfig          |  22 -
 drivers/staging/media/av7110/Makefile         |   2 -
 drivers/staging/media/av7110/TODO             |   3 -
 .../av7110/audio-bilingual-channel-select.rst |  58 --
 .../media/av7110/audio-channel-select.rst     |  57 --
 .../media/av7110/audio-clear-buffer.rst       |  48 --
 .../staging/media/av7110/audio-continue.rst   |  48 --
 drivers/staging/media/av7110/audio-fclose.rst |  51 --
 drivers/staging/media/av7110/audio-fopen.rst  | 103 ---
 drivers/staging/media/av7110/audio-fwrite.rst |  79 ---
 .../media/av7110/audio-get-capabilities.rst   |  54 --
 .../staging/media/av7110/audio-get-status.rst |  54 --
 drivers/staging/media/av7110/audio-pause.rst  |  49 --
 drivers/staging/media/av7110/audio-play.rst   |  48 --
 .../media/av7110/audio-select-source.rst      |  56 --
 .../media/av7110/audio-set-av-sync.rst        |  58 --
 .../media/av7110/audio-set-bypass-mode.rst    |  62 --
 drivers/staging/media/av7110/audio-set-id.rst |  59 --
 .../staging/media/av7110/audio-set-mixer.rst  |  53 --
 .../staging/media/av7110/audio-set-mute.rst   |  62 --
 .../media/av7110/audio-set-streamtype.rst     |  66 --
 drivers/staging/media/av7110/audio-stop.rst   |  48 --
 drivers/staging/media/av7110/audio.rst        |  27 -
 .../staging/media/av7110/audio_data_types.rst | 116 ---
 .../media/av7110/audio_function_calls.rst     |  30 -
 drivers/staging/media/av7110/av7110.c         | 496 +++++++------
 drivers/staging/media/av7110/av7110.h         |  50 +-
 drivers/staging/media/av7110/av7110_av.c      | 234 +++---
 drivers/staging/media/av7110/av7110_av.h      |  37 +-
 drivers/staging/media/av7110/av7110_ca.c      |  43 +-
 drivers/staging/media/av7110/av7110_ca.h      |  12 +-
 drivers/staging/media/av7110/av7110_hw.c      | 230 +++---
 drivers/staging/media/av7110/av7110_hw.h      |  79 +--
 drivers/staging/media/av7110/av7110_ipack.c   | 282 ++++----
 drivers/staging/media/av7110/av7110_ipack.h   |  12 +-
 drivers/staging/media/av7110/av7110_ir.c      |   3 +-
 drivers/staging/media/av7110/av7110_v4l.c     | 102 +--
 drivers/staging/media/av7110/budget-patch.c   | 665 ------------------
 drivers/staging/media/av7110/dvb_filter.c     | 116 +--
 drivers/staging/media/av7110/dvb_filter.h     |  22 +-
 drivers/staging/media/av7110/sp8870.c         | 200 +++---
 drivers/staging/media/av7110/sp8870.h         |  24 +-
 .../media/av7110/video-clear-buffer.rst       |  54 --
 .../staging/media/av7110/video-command.rst    |  96 ---
 .../staging/media/av7110/video-continue.rst   |  57 --
 .../media/av7110/video-fast-forward.rst       |  72 --
 drivers/staging/media/av7110/video-fclose.rst |  51 --
 drivers/staging/media/av7110/video-fopen.rst  | 111 ---
 drivers/staging/media/av7110/video-freeze.rst |  61 --
 drivers/staging/media/av7110/video-fwrite.rst |  79 ---
 .../media/av7110/video-get-capabilities.rst   |  61 --
 .../staging/media/av7110/video-get-event.rst  | 105 ---
 .../media/av7110/video-get-frame-count.rst    |  65 --
 .../staging/media/av7110/video-get-pts.rst    |  69 --
 .../staging/media/av7110/video-get-size.rst   |  69 --
 .../staging/media/av7110/video-get-status.rst |  72 --
 drivers/staging/media/av7110/video-play.rst   |  57 --
 .../media/av7110/video-select-source.rst      |  76 --
 .../staging/media/av7110/video-set-blank.rst  |  64 --
 .../media/av7110/video-set-display-format.rst |  60 --
 .../staging/media/av7110/video-set-format.rst |  82 ---
 .../media/av7110/video-set-streamtype.rst     |  61 --
 .../staging/media/av7110/video-slowmotion.rst |  72 --
 .../media/av7110/video-stillpicture.rst       |  61 --
 drivers/staging/media/av7110/video-stop.rst   |  74 --
 .../media/av7110/video-try-command.rst        |  66 --
 drivers/staging/media/av7110/video.rst        |  36 -
 .../media/av7110/video_function_calls.rst     |  35 -
 drivers/staging/media/av7110/video_types.rst  | 248 -------
 69 files changed, 943 insertions(+), 4991 deletions(-)
 delete mode 100644 drivers/staging/media/av7110/TODO
 delete mode 100644 drivers/staging/media/av7110/audio-bilingual-channel-s=
elect.rst
 delete mode 100644 drivers/staging/media/av7110/audio-channel-select.rst
 delete mode 100644 drivers/staging/media/av7110/audio-clear-buffer.rst
 delete mode 100644 drivers/staging/media/av7110/audio-continue.rst
 delete mode 100644 drivers/staging/media/av7110/audio-fclose.rst
 delete mode 100644 drivers/staging/media/av7110/audio-fopen.rst
 delete mode 100644 drivers/staging/media/av7110/audio-fwrite.rst
 delete mode 100644 drivers/staging/media/av7110/audio-get-capabilities.rs=
t
 delete mode 100644 drivers/staging/media/av7110/audio-get-status.rst
 delete mode 100644 drivers/staging/media/av7110/audio-pause.rst
 delete mode 100644 drivers/staging/media/av7110/audio-play.rst
 delete mode 100644 drivers/staging/media/av7110/audio-select-source.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-av-sync.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-bypass-mode.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-id.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-mixer.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-mute.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-streamtype.rst
 delete mode 100644 drivers/staging/media/av7110/audio-stop.rst
 delete mode 100644 drivers/staging/media/av7110/audio.rst
 delete mode 100644 drivers/staging/media/av7110/audio_data_types.rst
 delete mode 100644 drivers/staging/media/av7110/audio_function_calls.rst
 delete mode 100644 drivers/staging/media/av7110/budget-patch.c
 delete mode 100644 drivers/staging/media/av7110/video-clear-buffer.rst
 delete mode 100644 drivers/staging/media/av7110/video-command.rst
 delete mode 100644 drivers/staging/media/av7110/video-continue.rst
 delete mode 100644 drivers/staging/media/av7110/video-fast-forward.rst
 delete mode 100644 drivers/staging/media/av7110/video-fclose.rst
 delete mode 100644 drivers/staging/media/av7110/video-fopen.rst
 delete mode 100644 drivers/staging/media/av7110/video-freeze.rst
 delete mode 100644 drivers/staging/media/av7110/video-fwrite.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-capabilities.rs=
t
 delete mode 100644 drivers/staging/media/av7110/video-get-event.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-frame-count.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-pts.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-size.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-status.rst
 delete mode 100644 drivers/staging/media/av7110/video-play.rst
 delete mode 100644 drivers/staging/media/av7110/video-select-source.rst
 delete mode 100644 drivers/staging/media/av7110/video-set-blank.rst
 delete mode 100644 drivers/staging/media/av7110/video-set-display-format.=
rst
 delete mode 100644 drivers/staging/media/av7110/video-set-format.rst
 delete mode 100644 drivers/staging/media/av7110/video-set-streamtype.rst
 delete mode 100644 drivers/staging/media/av7110/video-slowmotion.rst
 delete mode 100644 drivers/staging/media/av7110/video-stillpicture.rst
 delete mode 100644 drivers/staging/media/av7110/video-stop.rst
 delete mode 100644 drivers/staging/media/av7110/video-try-command.rst
 delete mode 100644 drivers/staging/media/av7110/video.rst
 delete mode 100644 drivers/staging/media/av7110/video_function_calls.rst
 delete mode 100644 drivers/staging/media/av7110/video_types.rst

=2D-
2.34.0


