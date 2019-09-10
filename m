Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E64FEAF1EB
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 21:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfIJTfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 15:35:03 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45066 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbfIJTfD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 15:35:03 -0400
Received: by mail-oi1-f195.google.com with SMTP id o205so2935922oib.12
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2019 12:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Rvs3KIW/G0uS+h4BfbM/GaeD2EpzKi6/w1u8dOCKe4=;
        b=dLJlh46/jPVHfG57SvhK/DDRaljC7QKTA+SE0hpVakcraBDxiy2fOHrn17DrEcddbU
         lhzlfz0OaQ6UckYNc37mk8Ie3JrSaQWbAozcvwbWMFFLFNHEud5ZrWCyCSIeK9BLenxL
         SemWTXvpm6WSx4jU3dbgJLqaSNbEsY+es5WPUX4oov7Fj+0woN40oOrZ1sqRUtm6FAh1
         Ijt+AbDIWUgigDHqWF5Ocq50/+Fv2E8MQCG5ycO0xyTvT6mlZH89gNfqTCFJro8t6EKC
         yPcAfK3TPKSyGyG8VAbWTx54ltWcqBuuIntTiHsqyxvOIM0AAQcQfSbKuj42MiuSoI2h
         HPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Rvs3KIW/G0uS+h4BfbM/GaeD2EpzKi6/w1u8dOCKe4=;
        b=bSxryMyPjxc/DtiNXZtgB7XW/gLY2zU0IoOgnaQOvWr6Oix9Sr4X6iHC+FL3Z5ow3d
         1kEh1vR0helxxHS7UbqR0qB3fJxICDvdfrmJQ2G11SGRDAMWccVGyeD8WM+JSQLf0kEt
         MBJroEpGc3jjg2UQEDaMRuqCVi6Bv+n5iL3qrE6byE46EVPoEXxaoFVvtXBFF9Iitiap
         A68aceVeIyRxcFH5mdPpv6VRgzAKUhoqedeP3nJjpi3l84Ya1T+KnFdByg9aUx6O/aPA
         l3d+cF2gpjsOE2WaphOiYycd1gFqRYALKFfk+8WebTKD44mAZdqnP1rLWXVUWGhFhK7K
         aOfg==
X-Gm-Message-State: APjAAAVP0LTtzv8Wk9ycjDMJGXhopAKgmbi78U5E1Ecy+EFvo6+CuiFv
        4SAkXDZ1aFdyPcEAt+50NEVXLY3b
X-Google-Smtp-Source: APXvYqwL0naxev4aowLbUtbO0nYWiJyBXJKVk15fmCq4bjGAG0RYKyotggPNV1d7/X2Fo+rUM9UXdw==
X-Received: by 2002:a05:6808:2c3:: with SMTP id a3mr1059513oid.121.1568144100448;
        Tue, 10 Sep 2019 12:35:00 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id u12sm403671oiv.29.2019.09.10.12.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 12:34:59 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v2] cec-compliance: system audio control
Date:   Tue, 10 Sep 2019 14:34:58 -0500
Message-Id: <20190910193458.53210-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190909202030.82287-1-c0d1n61at3@gmail.com>
References: <20190909202030.82287-1-c0d1n61at3@gmail.com>
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
 utils/cec-compliance/cec-test-audio.cpp | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 2bc24daf..14f1d122 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -309,6 +309,35 @@ const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
 
 /* System Audio Control */
 
+/*
+ * The following scenarios are defined in section 13.15 of the CEC 1.4b
+ * specification where the amplifier provides the audio for a source that
+ * is being displayed on a TV.
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
+ * 8.  Optional features in subsection 13.15.4 of version 1.4b.
+ * 9.  <Request Audio Descriptor> message is from version 1.4 so older versions
+ *     report <Feature Abort>.
+ * 10. <Report Audio Descriptor> message is from version 1.4 so older versions
+ *     report <Feature Abort>.
+ * 11. System Audio Control is from version 1.3a so older versions report
+ *     <Feature Abort>.
+ */
+
 static int sac_request_sad_probe(struct node *node, unsigned me, unsigned la, bool interactive)
 {
 	struct cec_msg msg = {};
-- 
2.23.0

