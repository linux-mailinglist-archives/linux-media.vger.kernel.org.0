Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A052918F51B
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 13:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgCWM6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 08:58:25 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43607 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbgCWM6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 08:58:25 -0400
Received: by mail-qt1-f194.google.com with SMTP id a5so4267460qtw.10
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jd9kwn2zd+0ypqKpSt+uwDL2hne6ME0vFIVoatUBeDY=;
        b=YqlcvoCGQTIS5tOMfxM+oEogAN5hsAl/qK+7UKoYhf55OJJnzKtIS6zv31FrZzST8T
         VGxr3el7QpQZIeSelNHAMCOgjnsyHgclHCgw/cxFvZXKSkWrO1MJ4Qb/BZPCKPVN5OeY
         E6ycUk6JnmYRyij1z/0bw1vdjdnTuy+0GEWGR8V1Wr9u+zZ4b4XRjuu/mRXgPZxEWRKD
         0ZOxwQ2KMrtwnTV20IZP7T9/eP3Vmg6wXdMDKn4zI37mwhJ/52g/t+gaHjgRtIWYyQRu
         CJr6hBTcZeN4LyLeF14adwlYkVLJVNJ+MUkG7ubPt0QWlso/4lLMPL6P3b0pEbaDf8iU
         6CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jd9kwn2zd+0ypqKpSt+uwDL2hne6ME0vFIVoatUBeDY=;
        b=ddPan37RpFi6ByPiro7XX/4zgoZnMdBGMPQG2H4MIPiN26v2N4U994VuMuY8iP7aFe
         k6n188XZZqGD3s+lS2f1WMAR6q8xubj/KVQ3dFVJHl0OzuGfpODAiXURO0Fpjawyfya/
         Bxu+DbxTlOvuEiqiHQkKe80DXMfTfbmySExLXQRGlGUKAVAd7b+fgSBDhc0ugKMCjlEB
         aXpgZ5ombYUnCUG2UlY2sqWy6NDTYdiXnlctNxoTjNaBtjo/fH5kPNhz0sdDn9uxtzPE
         Vp/iXLUflmo+fciJruAmsagr91GO5Ni9MYPBsjx0cC0FloQ9UjVC7LD/exyucfz+7qLn
         KyYA==
X-Gm-Message-State: ANhLgQ0gVdV8iangRMFlTgOLV2ntYXqUL0K4b060FHu3KEvMGKn/rLgP
        d3zBbBngrkB5rJpvOgxA2Mw=
X-Google-Smtp-Source: ADFU+vu50oeN/AGL7WjeLRjcfIM4xuXhaIPUR7VR9Pa1oI20XsVr7SRrFX3JRnWhzcpf+T0kkdZlvA==
X-Received: by 2002:ac8:3072:: with SMTP id g47mr21195319qte.278.1584968303732;
        Mon, 23 Mar 2020 05:58:23 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id 16sm11075800qkk.79.2020.03.23.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:58:23 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de
Cc:     linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [RFC, WIP, v2 0/3] Implement a virtual DVB driver
Date:   Mon, 23 Mar 2020 09:57:29 -0300
Message-Id: <20200323125732.281976-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This series is work in progress. It represents the current work done on a
virtual DVB driver for the Linux media subsystem.

I am new to the subsystem and to DTV in general, please take that into account.

Currently I have written a simple fake tuner and I have been working on
getting PSI packets into a TS stream and then feeding the stream to the
hardware-independent demux layer. I have been basing my work on ISO 13818,
ETSI EN 300 468 and on a real MPEG Transport Stream excerpt.

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

Daniel W. S. Almeida (3):
  media: dvb_dummy_tuner: implement driver skeleton
  media: dvb_dummy_fe.c: lose TS lock on bad snr
  media: dvb_dummy_fe.c: write PSI information into DMX buffer

 drivers/media/dvb-frontends/Makefile          |   1 +
 drivers/media/dvb-frontends/dvb_dummy_fe.c    | 389 +++++++-
 drivers/media/dvb-frontends/dvb_dummy_fe.h    |  32 +
 .../media/dvb-frontends/dvb_dummy_fe_common.h |  55 ++
 .../media/dvb-frontends/dvb_dummy_fe_psi.c    | 902 ++++++++++++++++++
 .../media/dvb-frontends/dvb_dummy_fe_psi.h    | 287 ++++++
 drivers/media/tuners/Kconfig                  |   9 +
 drivers/media/tuners/Makefile                 |   1 +
 drivers/media/tuners/dvb_dummy_tuner.c        | 419 ++++++++
 9 files changed, 2088 insertions(+), 7 deletions(-)
 create mode 100644 drivers/media/dvb-frontends/dvb_dummy_fe_common.h
 create mode 100644 drivers/media/dvb-frontends/dvb_dummy_fe_psi.c
 create mode 100644 drivers/media/dvb-frontends/dvb_dummy_fe_psi.h
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c

-- 
2.25.2

