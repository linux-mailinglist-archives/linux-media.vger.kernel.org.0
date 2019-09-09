Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 604ADADFE5
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 22:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406003AbfIIUUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 16:20:35 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45984 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731185AbfIIUUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 16:20:34 -0400
Received: by mail-ot1-f65.google.com with SMTP id 41so10628957oti.12
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 13:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lJrm4x5Dy6FP1bizV4GFp9vYzTvNh4ZsZBAutgWgPTM=;
        b=CehRXNVFboLR8k9WnCt/kFVfG6RPEoIWuR+c1mxJ6i0sYXSOwYNKwNs2u9uU4aG6sW
         Z6IOOY1n7gcnsyrTtkvdmTlPxhbvKWNG/2giIp3HM4SlDVtwyLWX7S3A9pA5AqOZa5VN
         Mkyiw9BVEpNaKA70zfezXb86srG8LlKtO1hOmecH3/BU9dJnksp6nDDKJSw2IUqEWc+4
         6lMhelOyP2hsQAAvS0/SwwlstBjVMbxc2Ra4o6nJXRNvpaJqdk6eWKsw4wf8fKJtfZQ3
         ExehJDV3WodW/1vTUZKgusHpflVkwbn2bXWJhUQG6RX1LIOgFjcLX2N/dgc88VdiJ5Th
         Ck4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lJrm4x5Dy6FP1bizV4GFp9vYzTvNh4ZsZBAutgWgPTM=;
        b=XLNhx96J1kz5r073KRWletKhmXvj4e+AjwE7JmHrL664yFI9ib7/jlJW4jqbqnbkiK
         ftXfD1749jfj10EUzYTBgKDkl9G7lduxpR/T2hP3hsYeexNQ+3R3PB72rVERFaME1DZH
         CXp8qQ9OwCCqmlcVHsqAq+GCi0cSKL7ivooP3I7ngixpplAGX8xFzYItyFraM+zhsxRP
         zJ8bpn7IDHTILfw5+RCdhOR/+424HZT4wPzvD2g/2wPK9tsC7sUdr36e4LvDSq7IxGpj
         e4V1iJ33PhZHl8wZZ27PxlyO+OV1nHJrZr/QGpwmG0yyUjvhdMzd+mPJrnHc3ad3YMJg
         jplQ==
X-Gm-Message-State: APjAAAUG1aB1q/zqA4F1hA60nhGxN3vvDcF26xsknOPou7im8Lm+jHoG
        soD0BuoEZ+fddQ+fcKnXuZPXVgwG
X-Google-Smtp-Source: APXvYqzj/xByf6k5YXa4jzvI44Fa1AiBkrGZf6yALlkkDRUo64qidJYOBFwjxBasWt+1lOrgF39agw==
X-Received: by 2002:a9d:331:: with SMTP id 46mr22000229otv.8.1568060433770;
        Mon, 09 Sep 2019 13:20:33 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id q7sm5713614otl.67.2019.09.09.13.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 13:20:32 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-compliance: system audio control
Date:   Mon,  9 Sep 2019 15:20:30 -0500
Message-Id: <20190909202030.82287-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add comment block documenting tests not included from section 13.15 of
the HDMI CEC 1.4b specification.  This section outlines the System Audio
Control feature.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 2bc24daf..e0cdb9dc 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -309,6 +309,36 @@ const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
 
 /* System Audio Control */
 
+/**
+ * The following scenarios defined in section 13.15 of the HDMI CEC 1.4b
+ * specification are not currently tested:
+ *
+ * 1.  Amplifier initiated <System Audio Mode Request> and active source
+ *     discovery with a <Request Active Source> broadcast plus the
+ *     <Active Source> response.
+ * 2.  Post discovery, amplifier subsequent <Set System Audio Mode> [On]
+ *     and System Audio Control feature support confirmation with TV if
+ *     present.
+ * 3.  Amplifier broadcasts <Set System Audio Mode> [On] to mute the TV and
+ *     unmute amplifier.
+ * 4.  Amplifier broadcasts <Set System Audio Mode> [Off] to unmute the TV
+ *     and mute the amplifier.
+ * 5.  When System Audio Mode is On, muting and unmuting an amplifier sends
+ *     a <Report Audio Status> message to the TV.
+ * 6.  When System Audio Mode is On, the amplifier sends a <Set System Audio
+ *     Mode> [Off] to unmute the TV before going into standby.
+ * 7.  When System Audio Mode is On, only the amplifier can control system
+ *     volume.
+ * 8.  Optional features defined in subsection 13.15.4 of the HDMI CEC 1.4b
+ *     specifictation.
+ * 9.  <Request Audio Descriptor> message is new since HDMI CEC 1.4 so 1.3a
+ *     or earlier devices report <Feature Abort> for this feature.
+ * 10. <Report Audio Descriptor> message is new since HDMI CEC 1.4 so 1.3a
+ *     or earlier devices report <Feature Abort> for this feature.
+ * 11. System Audio Control is new since HDMI CEC 1.3a so 1.3 and earlier
+ *     devices report <Feature Abort> for this feature.
+ */
+
 static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
-- 
2.23.0

