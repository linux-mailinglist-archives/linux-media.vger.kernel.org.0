Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5153EF9A27
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 21:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfKLUCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 15:02:11 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:32813 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLUCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 15:02:11 -0500
Received: by mail-qv1-f67.google.com with SMTP id x14so6934713qvu.0;
        Tue, 12 Nov 2019 12:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qzHKv7EJKhKKsRubq57MkGnr2W/gW3bcPkxKycveIzc=;
        b=B+UUHEHsiqJdprAmur9aX7FDIex3I/IotLgOO8Lb/dqHA20avIw5cQAbPbXyIx8CbJ
         87ynMj4c9wsq1G+QIgbx9qGTFY/iiZWfGOeOJS6g9nqaGVaxWGXqlJS6oq0BnHRiU3oD
         qEUbK4JvW4I17ErKuHqAIjxFxfKwXsIdBt3PffhzE3X8ONbJC1uv8tqWhBs1hGPGYjLk
         6HuM+3j1qbCmSMJ6egqrFtpHkTs9nupXdEuVXwsBxxIh9Np6XaMffdjLOOAPpiWvh0no
         IRIn4Lyk3l/vbNnOZKzyZUCJtFk1lWaNAABx+JbiUsUDOZzlUfK+99+tMJAVRXFL/UrZ
         mf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qzHKv7EJKhKKsRubq57MkGnr2W/gW3bcPkxKycveIzc=;
        b=cfwgVx6By0sT0yOCEt+XF3plI8SgtHee6B3wIwATwESDPRQZv33FQMmhCpYTHy+Ubm
         m5RjvPLQM62tsDcbzFBwW4K0uS1RAy6Y6Y3AvpOfdpC9I83Bwtlq3fMexVUOT77RuG5u
         ifOiM2RhWJJ9jNpiMttyfDpHfQb4TgMQm5bpeGTpWyNjOO1O12IUSED2EFvr90j9hSqC
         0XROfrB1s69suHCIyUgzhnn3PuJPkjERJ+7+T7ImeP3Ud6Qicis8lbn+eCh+tiXOrXMZ
         jbC+fQe9ZOo/D9qMBLuc4xz0lBYYszoCq17tT6XcnJjoGHH+4/3rlCKOst2KlctX57yn
         aPlw==
X-Gm-Message-State: APjAAAXQyMGj0P/9p22nu//hLNVE6HoX9X2VCfc4RTFBI1KdD6rHISoH
        R02YL/jDrwIYV23Z0RjLi94=
X-Google-Smtp-Source: APXvYqw1d6VGo53vPkZIcxw/4poQLsxAcqWa51smX2+LKXfJow5F/ySOMVr+mfCIh7zD0m8plDAr8A==
X-Received: by 2002:a0c:fa50:: with SMTP id k16mr29483751qvo.172.1573588930212;
        Tue, 12 Nov 2019 12:02:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id w23sm13017071qtw.87.2019.11.12.12.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 12:02:09 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de, allison@lohutok.net
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: au8522_decoder.c: fix checkpatch.pl error
Date:   Tue, 12 Nov 2019 16:54:45 -0300
Message-Id: <20191112195445.36761-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This patch fixes the following scripts/checkpatch.pl errors:

ERROR: space required before the open parenthesis '('
+	switch(input) {

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/au8522_decoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/dvb-frontends/au8522_decoder.c
index c1717dde874b..8cdca051e51b 100644
--- a/drivers/media/dvb-frontends/au8522_decoder.c
+++ b/drivers/media/dvb-frontends/au8522_decoder.c
@@ -562,7 +562,7 @@ static int au8522_s_video_routing(struct v4l2_subdev *sd,
 {
 	struct au8522_state *state = to_state(sd);
 
-	switch(input) {
+	switch (input) {
 	case AU8522_COMPOSITE_CH1:
 	case AU8522_SVIDEO_CH13:
 	case AU8522_COMPOSITE_CH4_SIF:
-- 
2.24.0

