Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E80A8AFD47
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 15:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbfIKNAY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 09:00:24 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45728 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbfIKNAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 09:00:23 -0400
Received: by mail-ot1-f67.google.com with SMTP id 41so18634098oti.12
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8brxFfl4BpoDju+E19a/vHF901SznfARp/E5qUmDy4Y=;
        b=ZZmlwpQXt4XF9raDogjdpT7jrRHk7qGSU3ORTE3Az73anX5q51jNFkqN8NxhjkbHH+
         +BzYKp+yHE3zWXBG49n1tgHZbO3C4k3KZz702kIzSNFDAXEBQJOfEA2tHhbS3TnCEdXS
         AS7hJ55olGJ8yvWhMoTkRvRExJVr++O8peftsv3DDBBJ9AwEN6/zUhZoNfF8QrC0QeWU
         T0mI9OcJ2l1zuDvTQDh7QnAjs8nF6AZ/WuP7uGtKL4uuV7mGjP8gmiV+RCdGYB+VP8TQ
         upCqW1BZwe61ZIovbjvyswMFAYHaVMj6tvynEUc5kEMW2MLpwmXQGN55RmgR6TAMYB+i
         2Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8brxFfl4BpoDju+E19a/vHF901SznfARp/E5qUmDy4Y=;
        b=o8jCuWT/XLV4t/HBX/Z7awQp5oHF8/9RT82Fgmk2msHO1Dtj8CWSj9ChSQYL3EIJ4m
         jAbdIi3VrMl6NFqzP6VAR56aelS8BZ2CsK8W+3VZ7om0fG4tTkzgFMABWmqsokr398QT
         JrD7U8xAjGfoFfGDobB56eSvAnwzGYiZYw5c5BfQrNBWeOrpHchfT4XhX9nuP/SWNVQa
         RmlLdv2NmkP2PPyI+ZvnivY7/lXmiJ3hZdQxtXrZv4rTYY62eoMOBA+qfeTh7toeZlfU
         UZZXNzR1Cgokhxc+VypjWlF5j/oKn/QSasQtyqogO1IJOCsATYVOpDNjrnZa5YGbqsce
         2eTw==
X-Gm-Message-State: APjAAAWzrdcu+NcpyJ5UGWDtevuIklIPe/UJdw/Iqq1ThhUjLwpb1nDR
        D9vkyEsOu9Wx/bNNIiLJgQqNzFEn
X-Google-Smtp-Source: APXvYqwM2N6SU/Qs/+pXrWBBbpiEoP0UWhsfgptcvMeGPyAbtyj0cF5iVipntx8LfLa7ZgJlILjEsA==
X-Received: by 2002:a9d:876:: with SMTP id 109mr29472751oty.319.1568206821132;
        Wed, 11 Sep 2019 06:00:21 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id r11sm1529650oti.8.2019.09.11.06.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 06:00:20 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v3] cec-compliance: system audio control
Date:   Wed, 11 Sep 2019 08:00:20 -0500
Message-Id: <20190911130020.5547-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190910193458.53210-2-c0d1n61at3@gmail.com>
References: <20190910193458.53210-2-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add comment block documenting tests not included from section 13.15 of
the CEC 1.4b specification.  This section outlines the System Audio
Control feature.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 2bc24daf..55315439 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -309,6 +309,44 @@ const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
 
 /* System Audio Control */
 
+/*
+ * The following scenarios are defined in section 13.15 of the CEC 1.4
+ * specification.
+ *
+ * These are not tested as they need three CEC devices.  An amplifier
+ * provides the audio for a source that is being displayed on a TV.
+ *
+ * 1.  Amplifier initiated <System Audio Mode Request> and active source
+ *     discovery with a <Request Active Source> broadcast plus the
+ *     <Active Source> response.
+ * 2.  Post discovery, subsequent amplifier <Set System Audio Mode> [On]
+ *     and System Audio Control feature confirmation with TV.
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
+ *
+ * These are not tested as they are hard-to-test corner cases.
+ *
+ * 1.  Optional features in subsection 13.15.4 of version 1.4.
+ *
+ * These are not tested as they deal with 1.3a or older versions and is not
+ * worth spending time on.
+ *
+ * 1.  <Request Audio Descriptor> message is from version 1.4 so older versions
+ *     report <Feature Abort>.
+ * 2.  <Report Audio Descriptor> message is from version 1.4 so older versions
+ *     report <Feature Abort>.
+ * 3.  System Audio Control is from version 1.3a so older versions report
+ *     <Feature Abort>.
+ */
+
 static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
-- 
2.23.0

