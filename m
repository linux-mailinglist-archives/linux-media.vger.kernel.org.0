Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 548132E27DD
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 16:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbgLXPFL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 10:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgLXPE5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 10:04:57 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264E6C061574;
        Thu, 24 Dec 2020 07:04:32 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id n142so2264453qkn.2;
        Thu, 24 Dec 2020 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vvMA8bX63vd3Ymb+LaUwA4e5HkoEGBYe8nKfJwpf4Tk=;
        b=D0joYuMYLhfIQ/U4LE6/7xhuIjZFq+Q+W1sihuNqG1fKLw8Io3zCMeWN5HbNFS6nH1
         eygpZ4lmiukmpei341SUv2uMs+ieJoJg/Y5jjOWlQVxVE7YE1FqVW1Xqqf9rN2O7LkU/
         6eoSzImDWwdH5W+oRGBSmD5Qqdw6LLxuhFJoQfdbd7tT2BwwnNF+XmzD4sDpQjFLkBeN
         1iOMwVUWIdkKr8HDQrga8+FDsA09ON919ruyEeQVQft2ltlzMZe6iCi81MZ53sZx/m+H
         2ePAY1FyhkEVTDhN2zS+PCCel4ukc5hnlIn+xgju7vj/WLCsYrkZa9ifW496uZtmCOAw
         9E8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vvMA8bX63vd3Ymb+LaUwA4e5HkoEGBYe8nKfJwpf4Tk=;
        b=PJEGa7/q/JZv7hxT1Mz4wZiPyCZP6rM7GPnLVe76Uh3QvL4NLbWL6BA3A/oc+50rkX
         W5fKoGlLmZZ+QwRv2UUoQsmYv+ZtnjxcTInPxr2KymPusY6RV9vYqJqoh9UZqXkgVcok
         yjOqx0ed4734584wPf2TqYg3qiI3GzwKsQBPFY8TVrPTMLYI0by9C3sXWQ4/lRYIzFhZ
         TCYyUJr/YMylFYK0rb2JdQOcCdY9T7GyBxwBv5aveDhey4AtJMU1j067NaMfsGIVkXSE
         LzelhBfFJBI2lbepeCWkQMMhd1Spxack7R6J54OVa3maPeF9FFUZnohz/zBDrffVdksF
         AUiQ==
X-Gm-Message-State: AOAM530iEc6SuxsXrv3suyeg5hlMWwoBp3rGMxGJb0j96WrwcA5PV94d
        l0SdgkijHiRbs4jvlEJ/J2JNnejxiKg=
X-Google-Smtp-Source: ABdhPJygKPdyNW3PkvudVTH57eTPs0iXS23Es2WWxWeKNkJL+0qAr2rKgNMim5RlAt6p7mC6MKyXnQ==
X-Received: by 2002:a05:620a:140c:: with SMTP id d12mr31889804qkj.340.1608822271431;
        Thu, 24 Dec 2020 07:04:31 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:74c8:8f67:61c5:55b9])
        by smtp.gmail.com with ESMTPSA id e38sm10322215qtb.30.2020.12.24.07.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 07:04:30 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.o,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: vidtv: remove unused field from 'struct vidtv_mpeg_ts'
Date:   Thu, 24 Dec 2020 12:04:01 -0300
Message-Id: <20201224150402.1945788-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Commit 3d1387b3b8f6 ("media: vidtv: fix some warnings") replaced
the unused flexible array member at the end of struct vidtv_mpeg_ts
with a pointer. This broke the 188-byte alignment since the struct
no longer was 4 bytes in size.

Fix this by removing this field entirely.

Fixes: 3d1387b3b8f6 ("media: vidtv: fix some warnings")
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_ts.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
index f5e8e1f37f05..09b4ffd02829 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_ts.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -44,7 +44,6 @@ struct vidtv_mpeg_ts {
 		u8 adaptation_field:1;
 		u8 scrambling:2;
 	} __packed;
-	struct vidtv_mpeg_ts_adaption *adaption;
 } __packed;
 
 /**
-- 
2.29.2

