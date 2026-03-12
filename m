Return-Path: <linux-media+bounces-55540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLI+CrAxs2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:35:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C4927A11D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14821301E71E
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF8D3E6DCC;
	Thu, 12 Mar 2026 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="mCbe3CQB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D136BCE8
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351338; cv=none; b=oOPqs5Cc4vYfcb+BFFSe2KkjzRvHJf/cQDxSCNQlSJojlYfKOFwLttBRSPNGQWZe5Jy2Rt0ns6f0bk53+vcVvANjxnAaoXbw38ZAjBWULMtouNXkkRcMwJO80z5/8bwvLAT8IKYfFa/L17fe7H44xO9VD7SBmaiJVK2PLG0TIZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351338; c=relaxed/simple;
	bh=8UrO4nZ9KXx9CG65JUvYnTDes0cCkBgWIt3wbM3GCsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nLhEgjMJ9pxTIQpKPvJaZQiboPIdpp2lNDysl9ha0cBVZEiy/pmL0to77cnExoQpFlg1qFWrnwOPkExwdXU6rhdp98sXcARfaf2D5JpypPrY/JX8gqN2ZaQJfqQSqt0DoxlLte9H3zAu5K11VeRMsAePnA/qlI28QmClgd+KlSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=mCbe3CQB; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-46704fbf62dso1024636b6e.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351336; x=1773956136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4ZzvfUlF8WeeVyMFLDXkeYROWkCMU0zk44uLK+xv1Y=;
        b=mCbe3CQBdrwYZ+txBNxKWAHDoT94gLlfhwiCVvo2pKk3iL5DptOGGrFSIx8LhpSvA5
         28O8vA1VzUPAFJowwaZbU4zEQ9rKcWujWwsFE6hwL/bGCGVvv3EShRCQxBoLm6S9dzqQ
         pUfhtRN4UEoHQiKLGmTJgpc8gTjGePd8oYWg0R+qpQqI5wLwWBhsQvhY6agTYj9o0TiV
         8HucYvWGzOqQljP7CobJVYkBJYlLOSxWhlSjRkFvntMJN8kQW4M1bOy6VQRTqWdhj17q
         wvpP1obKqF8rV3Ag2cIPgmmHkAlBSfhgU7GSSawYl4pj9LLsyjg4ZuPiPKEEYkVbtA9C
         Iw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773351336; x=1773956136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4ZzvfUlF8WeeVyMFLDXkeYROWkCMU0zk44uLK+xv1Y=;
        b=nCdyEWdx46ZzJBDeeEMOkbEr59KNyI0Z/PebwRed7VGXek/jLhdePyhZjjuBU12/HR
         3lrftIOTWcSH/FZMEqk4ulOqk63jAI7fbJvvtE8Etepi5h0HowMGj11uH8zyNW2gEbBv
         Y3WoRuLWqFx0CsB6zHQ98N3/7SEody6EjAWnWEn4Qc2XaTbSU1huVTTc+O9ONDP8MsuT
         MfgCSKAM8vytmkGeH/kF2RxU1zvKMCTeK6iTF6dVpHVNLbvZpbMda632fl8IwAbiDSb9
         qvlRNC2sUNm2QQPtc3X/riQCWXfU4ZuIv9YPOngagUhyRH9Qt9JMZK/jZq633eyLI+TF
         B2YA==
X-Gm-Message-State: AOJu0YybsVCKhH0yQhUWTYUCGSp26bZdST2IEEovk/nzlQ8i2Y/4HFAJ
	Gg5EQ3ADhRzS8u9baWVahSGi8PRQ5cb0dbh8tRW0uO62FybL6i0IafrXthJn+rV+/ZhIVLEoxbF
	L+tntlps=
X-Gm-Gg: ATEYQzxsfhz86XDGUEaYXKYxa+1yaXqEBz3hwBE/qAMxYfIvmeXflj61fCUJeAr0UTv
	QkcVqxpFPH+GVRokOwUA/RUC7j+PjfDHMvcifKKFa7U8TrXpNzE9bQyVnCl3jj2dzGZH8MWJrIK
	dae9JVPqe01HXNKDfzTwZchqdJvED9xQ+j/3aY2gFyAY5OIYEVkYq3WT5bhgr+V178765GadMN5
	xhUkIYXPOXBBgeIMbqJH/IcxCpFfoK8qIdCkOfyjgA/aBhA5WwOkXYhQ3fYpOsuCEeg8pUePBiu
	xzySqZbaNtxSa3E+1mmo8ZyajCbR5rn3IZJJeBUXqAknow8hYPY51Ix+fdnV2DgAHbtWe5t/CFT
	OA6sjMpJaTKDUqGdFSPzK/6cRuvXEzhhPBpZvhajazvzcYeDU+PAh1WKSTF7kBOwSM6eR9/scmQ
	EGGGx3CF0vW5e8t4+EfALTmPU+rTcxMi7Ge60jAlOgrZO4ZlgoHL9sZ60Sv6Z63y3zZ+EDfxmZc
	Mn6lqpB9yRS5j+Sxzg=
X-Received: by 2002:a05:6808:e85:b0:44d:a3e3:40a9 with SMTP id 5614622812f47-467570a0c71mr457506b6e.8.1773351335877;
        Thu, 12 Mar 2026 14:35:35 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:35 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 00/11] Assorted DVB and TV patches
Date: Thu, 12 Mar 2026 16:35:21 -0500
Message-Id: <20260312213532.2907276-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55540-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 02C4927A11D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

Attached here is a series of accumlated fixes from integrations
and deployments.

The first five patches are related to fixing issues with a
variety of analog video formats.

The si2168 i2c timeout patch is something that has been found
to be critical on a variety of ARM platforms and Nvidia SOC.
Something in these platforms has USB i2c not consistently responding
within the embedded deadline in the driver.

There are two firmware fixes. With Hauppauge hardware fw 4.0-11 si2168
devices definitely lose warm state and cannot function after sleep.
The saa7164 REV2 firmware had an incorrect filename and has been fixed.

Last up is adding some new Hauppauge USB id's and removing an invalid
analog input from the Hauppauge DVB DualHD.

Addressing checkpatch warnings:
- 0001 palN is not misspelled
- 0003 adding dprintk like driver already does



Regards,

Bradford



Bradford Love (11):
  si2157: Analog format fixes
  cx25840: Fix NTSC-J, PAL-N, and SECAM standards
  xc5000: Add rf strength function
  cx231xx: Fix AGC levels for NTSC-M
  au0828: Fix green screen in analog
  si2168: Fix i2c command timeout on embedded platforms
  si2168: fw 4.0-11 loses warm state during sleep
  saa7164: Fix REV2 firmware filename
  au0828: Add new Hauppauge HVR1265 and ImpactVCB-e
  em28xx: Add a variety of DualHD usb id
  em28xx: remove tuner type from Hauppauge DVB DualHD

 drivers/media/dvb-frontends/au8522_decoder.c |  1 +
 drivers/media/dvb-frontends/si2168.c         |  8 ++--
 drivers/media/i2c/cx25840/cx25840-core.c     | 29 +++++++++++-
 drivers/media/pci/saa7164/saa7164-fw.c       |  4 +-
 drivers/media/tuners/si2157.c                | 15 ++++--
 drivers/media/tuners/xc5000.c                | 13 ++++-
 drivers/media/usb/au0828/au0828-cards.c      | 50 ++++++++++++++++++++
 drivers/media/usb/au0828/au0828-cards.h      |  2 +
 drivers/media/usb/au0828/au0828-dvb.c        |  1 +
 drivers/media/usb/au0828/au0828-input.c      |  1 +
 drivers/media/usb/au0828/au0828-video.c      | 30 +++++++++++-
 drivers/media/usb/cx231xx/cx231xx-avcore.c   |  7 ++-
 drivers/media/usb/em28xx/em28xx-cards.c      | 19 +++++---
 13 files changed, 156 insertions(+), 24 deletions(-)

-- 
2.35.1


