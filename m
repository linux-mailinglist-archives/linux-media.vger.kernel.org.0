Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCEE18957C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 07:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgCRGA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 02:00:28 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39066 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgCRGA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 02:00:28 -0400
Received: by mail-qk1-f196.google.com with SMTP id t17so15127625qkm.6
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IbpntlACNTf2KZls1XosmvOl6RuPNFt+vg13rIbAn3w=;
        b=Lh6hv01fFXCZeXv4NhyciK9t2jnmHpwB3h5O0giQegHmO/xpTSpRXnnNlzEX+vj4rm
         qdiBPDmU/6taO042gMWZoxgjVhumGhqk2ffjgTRlkwtxzE8OYdcjtfYpY2iMbUQEwJGZ
         6eYoTwcwxvK2zWWdthdHOomAvUBV6S8b4Xik8rzgbEKxlvciJ2NCdh5pGUaDF0uDzWQf
         SW3278LLPWI/JJV4CVbBND0iiN5//5hTXPUhQOUJb4X+sAf+TgZwI+86njcmMDxmCYap
         v/aOR71ExSq4rFzYPnU7sg/m7QjaDelikp/u4vNevI+NwV2pJ/bIMITGO6tULjxArgvb
         bcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IbpntlACNTf2KZls1XosmvOl6RuPNFt+vg13rIbAn3w=;
        b=YmCCDIdi1xDUyhfSEjhCKZBcHxRrymKwCMwt2gVQLCwfQO72ZqvABfCK8mdqeEvflr
         vHCTP2VwiqBju0vc/CUaivk3L67TdyRxCbLqQfYb8AKLnFOpdBu5fJUR+25V3WOziAzi
         y4vJjAWcKjiYqc1fcz9C61+4ECnzf4wcGmzYAUOMYgPYsoJcKmj3gKG5ixhd5Azqir19
         KqFhBVXLJ/TGlZ0HfyK+/fLcESQUMplxRwj4GwHejRk3C/goEWqE9JSqW+l1Hg4DgYcg
         pMwDarJJdQRphrSr7sLRdHIwBSpojoA0emXR664G3zm0Ciw2LYmZ8jm9DuqAi0a9Wjpg
         NqLw==
X-Gm-Message-State: ANhLgQ0JVpqmMBJoQ9WE3BFqCNGIrfbI3Rpd5yD7+7+LKA0WlX/cOUvC
        DyziaFbHF1EU3YwHf4dCPYI=
X-Google-Smtp-Source: ADFU+vuacI1bxztRsBFwK4FgIjABBnD+nKVi3YfuMJGwcur6EeO5bpZzZIThhoith0Sf2A0ERd2haA==
X-Received: by 2002:a37:8781:: with SMTP id j123mr2442881qkd.308.1584511226889;
        Tue, 17 Mar 2020 23:00:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id c10sm223303qtp.13.2020.03.17.23.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 23:00:26 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RFC 0/3] Implement a virtual DVB driver
Date:   Wed, 18 Mar 2020 03:00:15 -0300
Message-Id: <20200318060018.3437750-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.1
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

I am aware that the first patch generates plenty of warnings due to floating
point to integer implicit conversions. I still have to rework that.

The last patch in the series is also WIP, it still misses a set_frontend()
implementation among other things. This will be sorted soon.

A few bits of code were taken from libdvbv5, mostly the structs for the
PSI tables.

I appreciate any comments to improve this.

Thank you.

Daniel W. S. Almeida (3):
  media: dvb_dummy_tuner: implement driver skeleton
  media: dvb_dummy_fe.c: lose TS lock on bad snr
  media: dvb_dummy_fe.c: write PSI information into DMX buffer

 drivers/media/dvb-frontends/dvb_dummy_fe.c | 1538 +++++++++++++++++++-
 drivers/media/tuners/Kconfig               |    9 +
 drivers/media/tuners/Makefile              |    1 +
 drivers/media/tuners/dvb_dummy_tuner.c     |  421 ++++++
 4 files changed, 1963 insertions(+), 6 deletions(-)
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c

-- 
2.25.1

