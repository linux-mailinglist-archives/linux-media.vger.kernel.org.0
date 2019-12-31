Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE6112DB11
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 20:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfLaTLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 14:11:32 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41046 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfLaTLc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 14:11:32 -0500
Received: by mail-pf1-f196.google.com with SMTP id w62so20042778pfw.8;
        Tue, 31 Dec 2019 11:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cEKkPPh58+NWwC8pljRVd1pm7ncl2tPP6DaJoDLZVBY=;
        b=du8GUImaVYJNTgyEs5bmzYxXzachMqtydAfEWcAtME/FclGylO83pVbjVPaCzF+zIq
         +Ro50CZwi+fIiopjLvIEuGisF5J6EEknTwrtV6TagiQ18ntH6opNO9Y594Z+TtCEAtXh
         /cMqjIIqKASuI7P0XKPaeng8JHKYzX+n/BIwfMuE1sl8MhVJVpDYIHCiOmW8s8KhapTh
         sU/FUQ9miMUnjFmAik/jLEX9uYXYUgjrF3S3n40aRBx54XFYZoA2qtEpT1g6F/RUMey5
         bgi38x890QjbxLxCaqbfyw/RipP+9IbNfxP0EWo7Lf4qZ9vw2HhClGXd2Lvp/VfXpzel
         qXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cEKkPPh58+NWwC8pljRVd1pm7ncl2tPP6DaJoDLZVBY=;
        b=Dfd9xW2oSDvL7GWWvnYraPMs1KcLkiZlSZ+QNKAVCgJgoHwdA3fMjbpOWKk1q5p9GQ
         klxCdzD6pfrTg35Z/kJdZ3/o7MYVCkfsnkro+tFG5C35rmFozfb8TfQMvTA2ir6Te0AQ
         lFRQYLJBSS2PG6TfeutYW9lIzv/TRa8nKpzfuN4kUjNNen3hPaYUJtWwK3pqWI57nvxU
         iG1lwSLdTCRaB9GONgXlYOmriWrHUfo8EDy0x2WYhl4UyOchhczOVVWO228rYAlZykGv
         PEHHvlVJFC12uIks+VWNzBBhbq4f+LmlonVSsakkIgtVrSuF/r65pcBImQVvckqTzISK
         Bgtg==
X-Gm-Message-State: APjAAAUIoF/5IWEeR3HfAMIWk5tT06J4zkVUsmtNonvwnK8u7HCT/hgr
        Wikf9peRyyAOlHmdcTm1xG0=
X-Google-Smtp-Source: APXvYqyP5hBLa46d2pD7phTH+yVLXDiSITlA22KEXwFyfw5tDX50IUxuo812AZFCCw573ZVgyhvkUg==
X-Received: by 2002:a63:d306:: with SMTP id b6mr77626681pgg.195.1577819491955;
        Tue, 31 Dec 2019 11:11:31 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id s24sm4366134pjp.17.2019.12.31.11.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 11:11:31 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] media: dvb_dummy_fe: Tidy up the dummy frontend
Date:   Tue, 31 Dec 2019 16:11:19 -0300
Message-Id: <cover.1577819245.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This patch series irons out checkpatch.pl errors in dvb_dummy_fe.c
and dvb_dummy_fe.h.

These patches were sent previously in a separate fashion, but they
are now compiled into this series

Changes in v3:
As suggested by Sean:
Dropped media: dvb_dummy_fe: Add error messages in case of attach failure

Squashed dvb_dummy_fe: Fix long lines and 
dvb_dummy_frontend: remove 'extern' keyword from declaration with
media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION

Added a new commit: media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION

Daniel W. S. Almeida (4):
  media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
  media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION, AVOID_EXTERN and
    long lines
  media: dvb_dummy_fe: Add blank line after declaration
  media: dvb_dummy_fe: change printk to pr_warn

 drivers/media/dvb-frontends/dvb_dummy_fe.c | 91 ++++++++++++++--------
 drivers/media/dvb-frontends/dvb_dummy_fe.h | 12 +--
 2 files changed, 65 insertions(+), 38 deletions(-)

-- 
2.24.1

