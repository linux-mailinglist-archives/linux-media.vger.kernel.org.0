Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EDC10E28A
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 17:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfLAQYB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 11:24:01 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38902 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbfLAQX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 11:23:59 -0500
Received: by mail-qk1-f195.google.com with SMTP id b8so15251150qkk.5;
        Sun, 01 Dec 2019 08:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mYvQzVXRv9+Uc4Zmeuqye/QS6nGRg0d+ezZ6BJ01oyw=;
        b=Gpk5+Tq+SPuoDpcPqE/kvmmF7lhvVLVkzBsagf/Qm8FiToGpph3VDzjUwKiyKN1Bko
         jryxApPJjtX6cAwYGGASRqzkljZw1VUu0G2UkOKflN7PgI7jMSGpCWqS/x29jVuwYMPO
         FMHcexZLKP1738fPaMNAR7657bPvzDN7aI2HMmyPQpZ66gypvQgxIECGNEk46WByBzcV
         fu7eCmpQYnnGF+tV3zqQXJI8JW03MD44TNTqYzkd6jZtKnpRkMspOTxc7nM86H+cllm2
         BxpRpaLNPJ05qLfiZEg1T/t8pP3bXcXLNc79vUZ3M+PVoodbKCzdPVE98LZEf1/G+Abu
         gfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mYvQzVXRv9+Uc4Zmeuqye/QS6nGRg0d+ezZ6BJ01oyw=;
        b=FtAzu3+jYaB7eMjcGc3Uyn5fYjT3xOq3PVEkLy8SbZCou1BDJIGHWIYityTpfQoLMw
         CCt4l8uk16cUOHQbnUREinviOWr2r+Vz9qCcoXKI0ph5Ety73yq3NJ50Yv+cferG1WAy
         XgpXy0+7kr6I4sszb34fylGgvPN7K0H26QpxCx3ugetGHz7VIzbYONmLCLhYdvzJ2s9Y
         vd8LKHiiKt8UIoPcGtPcJCiu9ja3+3Nqi/HRChPXlfKDpD4Z9bI6R1Q8qm9rsNVniLZU
         bgsuxHHSip983XoKAQAMswyBYs5ouipwTxFkB7TI8joBXb9f7m8ljcLFOHwKY+mOA+Fd
         6OtA==
X-Gm-Message-State: APjAAAW4YmEdzJQA5PqV5bifMTdRt8ddDImhjTwFxSw5er47Z56zpwcg
        MZPmGoX1eCZVuP4YryBUj6E=
X-Google-Smtp-Source: APXvYqyqtSbvjBX73lEmf1hI6QV5qWsWw3Ht4lZzpDkOJm5ZrO/EciK59EDvwaj5RZYN84LRFqt/WQ==
X-Received: by 2002:ae9:efc7:: with SMTP id d190mr28632482qkg.350.1575217438759;
        Sun, 01 Dec 2019 08:23:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 08:23:58 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] media: dvb_dummy_fe: Add blank line after declaration
Date:   Sun,  1 Dec 2019 13:15:41 -0300
Message-Id: <20191201161542.69535-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201161542.69535-1-dwlsalmeida@gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
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
index 67a6ed307c1f..2bf847cef665 100644
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
2.24.0

