Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED617AF1EA
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 21:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfIJTfA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 15:35:00 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33190 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbfIJTfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 15:35:00 -0400
Received: by mail-ot1-f67.google.com with SMTP id g25so18913653otl.0
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2019 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lJrm4x5Dy6FP1bizV4GFp9vYzTvNh4ZsZBAutgWgPTM=;
        b=hlgspVuxfFuxd7WKEd4yvoBqopk+KWvcyCFor7pXOCXEuC86PiMPX3VXVKo4c5SKbF
         wFJcuvHy/ZbR+Pgrub1/RXgxHvJCWL/n7FFodVGVZKmLq/kCh0sfN5STVqxlfXOgB98B
         QZdKJXdmibBlefJGq/siQlKjidYrAYfkpWb5T+4t2dBcH/OqKbKoQM9MgxxOBXOtsoLq
         PYnQQoqrOpy5A6kIIAdoa2OvNwO72H6genN02W7dlOstBnR8ejrfmbuC+x3qDLZeTAsm
         i6DphlMXn7NC+B4ZEoCc8vEQZRhnvH1FNm0RZ4NxZ61d4K5LofcTKzLIdomCwGK7Ufzr
         SA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lJrm4x5Dy6FP1bizV4GFp9vYzTvNh4ZsZBAutgWgPTM=;
        b=j5LjaNl9HVSpDQQ75ZgOwyy1ZepeyxgZcFheq7EzDO2i4cDAVkmUmbupBGX3cwgQH3
         3O5L4YwlJNXXjVmz4/KzJfzDLk044G1pkh+1bo9XU7DzvsbXcTFpTKx18iOnzLtzOZGF
         IWEipgdAMXQEBNwi9i33AjteWhtHOIVqQOQIixOFBItX/Ntpp2rvSNxwRv39HuEIBee5
         7e7JtZygHbgjnUMmd5JABvp8qyHiiC+zuq39Koh+NiVDy27tBMZY8fVFhkQwHEjDRXBp
         XYCm5DW8+9L0b6Pp2AY4dpeulBLRT0ZcD59+1gCa5FGqWNs+QQtBFmhLOKnbo++XdtI1
         leQg==
X-Gm-Message-State: APjAAAXkrltyhd8Xw4IYlWYFmNWvZIg8XZqaeSatMSsmgGmO2+B9hGva
        DA2yDqyGO3WU8Ais+fgQUumDTlL0
X-Google-Smtp-Source: APXvYqz/Rx8/llj2tmC3uCalETDXtFbBB+EscYvIZ/T3RV42XTAYVmfwrucNPvI0uz8AoAxsjbVd0w==
X-Received: by 2002:a9d:4102:: with SMTP id o2mr28717807ote.187.1568144099736;
        Tue, 10 Sep 2019 12:34:59 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id u12sm403671oiv.29.2019.09.10.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 12:34:58 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-compliance: system audio control
Date:   Tue, 10 Sep 2019 14:34:57 -0500
Message-Id: <20190910193458.53210-1-c0d1n61at3@gmail.com>
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

