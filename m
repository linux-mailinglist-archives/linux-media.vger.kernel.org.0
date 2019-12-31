Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 377D112DB18
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 20:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfLaTLq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 14:11:46 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50990 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfLaTLq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 14:11:46 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so1471606pjb.0;
        Tue, 31 Dec 2019 11:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P9GfKOO98mLmW+DdmACwpqWQT43A7np+giNx/HT6uWc=;
        b=Til1MmZuV4E/d9iQUF/gCA4zz07qu0do0t5QqeE3JvrbTHGq+IrD6X4sGlBcMwFRjn
         QcBQSlZxPmALTMvuC7Z4M7NuLFAozJF9e5ojvkb7SHq84pBg2oDrEGGXqyMSK1glJAKs
         xpgK+NavZtU/MrRW8KFUR7wNZNKECNydQz4v+RCH8dlyKcOx/0isAM0CSKFzjYs/RCP+
         4rs/NxjVKJEvzytuRoiS+hWs2kn4ZIgTbIf2Ae0CjIhGBXe3yv+NxLc9TXTWPB+J99yf
         MUOr85iERJupJnCo1VC4a//75XfcoQ18uxwM/5w+UgyOCH5dvpd9bFdE6EXYGMyDDshN
         FIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P9GfKOO98mLmW+DdmACwpqWQT43A7np+giNx/HT6uWc=;
        b=qLY54t+/TAXERDB+dV4048JC8g1f0dmojjcUXArdFILVE1yhrV7tYQO4HTJ/iS6uGd
         Bl0+TZSpBZuVPLmb3V/vumYW1zlZ2vptLL/iC6xIWwdcoxlg1Yd3Iv7fjgEgZK/ubUJS
         ZVvC376i4u1y+BAT862k1BogZuSJSblOddATSJc5GwZ2DXfju/CwhRfi41rLAwEQcbX9
         MM5ywGAUTlqdOP7CsIPDlWZqqule7Oz5TD/6r6i6aBLs8ODb3zwgme2W2TDW1egdavus
         /vT1ZKZ8L6GIDjXyAZtbv6NgGTjkN4CWeenTI7wNHAi71XxJgstE4k0SCSfmzeEXfKdL
         YQbA==
X-Gm-Message-State: APjAAAWpLy4R8fpdqiKVgaSHAWPxjtWquxRPm8Him+uPuJgET2qfIIJX
        BSNegWIxARapXs0ZOpF32zoZl8ApW4M=
X-Google-Smtp-Source: APXvYqxAHyyWgIAmnBTE3YfTzv4hLEsBVEpht/EycOHxjO0ky6GRYg1fdc+j9W4Ozz+YAO8uOrzE/w==
X-Received: by 2002:a17:90a:d787:: with SMTP id z7mr8267446pju.10.1577819505442;
        Tue, 31 Dec 2019 11:11:45 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id s24sm4366134pjp.17.2019.12.31.11.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 11:11:45 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] media: dvb_dummy_fe: Add blank line after declaration
Date:   Tue, 31 Dec 2019 16:11:22 -0300
Message-Id: <9b56605120ee19438df872e209703ad300a781c9.1577819245.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577819245.git.dwlsalmeida@gmail.com>
References: <cover.1577819245.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix checkpatch.pl error by adding a blank line

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index e7f51d581d63..9ff1ebaa5e04 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -103,6 +103,7 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
 static void dvb_dummy_fe_release(struct dvb_frontend *fe)
 {
 	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
 	kfree(state);
 }
 
-- 
2.24.1

