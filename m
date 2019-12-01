Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EABEB10E281
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 17:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfLAQXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 11:23:41 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46595 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfLAQXk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 11:23:40 -0500
Received: by mail-qk1-f196.google.com with SMTP id f5so11798816qkm.13;
        Sun, 01 Dec 2019 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h5Od0x6vUCRqcGVlDVkGHT0CIlXPckMQvdNmbEd1AGc=;
        b=ho08fRQMV0wU3zPR9doI190XmpqECF18dlDsG1J9KMuNW9MvHqMfe/u5F1c2rsw3Ee
         SUpcbE2T1Gr5LDaB2rNBNZ9MH45DxdOkpWCFbF6+qWwHnJzG+A1NR6l+YOa4877G/46r
         565kZj0DT4Icf/wLAGGlcBiqmX2K3Lds8wcugNuebd/ht+F9geDAeZ5jV+k2uMVEkevm
         upFlssgkRTBGGF6PGK7nruFrYc6B5yP+lgv8N52GYZPGMlueFEAbktlVVN3zwgtjFDzA
         MF1AcHRfmwcjrHujZqK1byNuluAiWCQBfG6jAwqj0YWsX7QFBLQCS+lSIRFOXi8kHBn3
         K6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h5Od0x6vUCRqcGVlDVkGHT0CIlXPckMQvdNmbEd1AGc=;
        b=JjQZxpZSxuDzezBbA3T6Xj/gwF52OB9yKE4VeR7BL/6oSwLWN5xjJ8YXTQcNCdpxez
         MXEqDrmJ9AG35ZFiBXMVkWWuIhUctrO6gumQhRBZr8zzlh9jL99D6fGL1N4gqcT1jMLI
         8SXJhGLCSmXpay7G5bHJoOThY26jwzWdExJ+s7Q/6E5RzdN+aOfgNfBrqAq9Q9Lfxpx3
         9Zqp9RxDyoi5ZpzXJ5IfdrKbliAJ04woGYxofoQKopJfmaMj7CtV8wP/8uYN7ZmJMfVP
         u30c4wSzq1k9GsV9ydaDjUf+MZy5ekdEskOKemBEAdI1R6IsmT3DbCZod+9m2jgCXpzI
         Jntg==
X-Gm-Message-State: APjAAAXaH3OCeXfFwB5GHBdyJ6aeZuTZILog91WzplXbYbByXXIJ7N7Y
        NVjiQ7tNgb3gESygktQWoCk=
X-Google-Smtp-Source: APXvYqzkLHa+PMKo+ch6fc/oQfVS+ED+Z0ZyPzJq2m6vvKPbtJxPJ7zUXMz5UDETdwwWU8CprQFFpw==
X-Received: by 2002:a37:490c:: with SMTP id w12mr28304114qka.101.1575217419482;
        Sun, 01 Dec 2019 08:23:39 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 08:23:39 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] dummy_dvb_fe: Tidy up the dummy frontend
Date:   Sun,  1 Dec 2019 13:15:36 -0300
Message-Id: <20191201161542.69535-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
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
are now compiled into this series. One of them would not apply, but
I fixed this as well.

Daniel W. S. Almeida (6):
  media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
  media: dvb_dummy_fe: Add error messages in case of attach failure
  media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION
  media: dvb_dummy_fe: Fix long lines
  media: dvb_dummy_fe: Add blank line after declaration
  media: dvb_dummy_frontend: remove 'extern' keyword from declaration

 drivers/media/dvb-frontends/dvb_dummy_fe.c | 109 ++++++++++++++-------
 drivers/media/dvb-frontends/dvb_dummy_fe.h |   6 +-
 2 files changed, 77 insertions(+), 38 deletions(-)

-- 
2.24.0

