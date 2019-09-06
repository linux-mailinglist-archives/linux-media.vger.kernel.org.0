Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0FBABDF0
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 18:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390380AbfIFQoq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 12:44:46 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44360 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732628AbfIFQop (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 12:44:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id 21so6281392otj.11
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sH/nf7b0xT/zcBUDh24Ti75jyT9uA7hNFoqylHBp74w=;
        b=ndKpvonN1EwLH0jfXqhFQsui4S8I4c6wDxf33xidW4w+m85g0OQ/0/4KB8kj+k3Q9u
         pcxufPirbGcjtHL7vg3ZcbdD4hMH6uX+XaiQ6yOOZYepc7/NMH6EtSwghphhZ+gynetd
         oW69DzJ7Lh6BzkDrTCy0OVtBlw7/rLi3KL1HZ81ptXYV1/5nIuGEUya9ZNKsJ8Tw4ygs
         BffMMl5Ui92VQhaDvKKgM47jhVKawU3WCoetBRixdl85KqufHzJuu8MitSfsVcZC5G97
         82jUG00xOcU/kgNsB4QSVQSaCC3BMp94dE/mNafngvH/361t5UokyeOuKs8a7NH4vg8d
         GOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sH/nf7b0xT/zcBUDh24Ti75jyT9uA7hNFoqylHBp74w=;
        b=nFLEKdKC10zJ9CcqTNKns6HL6VFqT1ujMUS2HLGEWv/BPZFwpmPfnd3hTMFtVj9O2G
         PV8el8n6wujQqONnUhgymhgGIhJDVvqO27tEiqiz5ud9cPCQVSh65mXY1bwnAAy6UeCN
         gEZtAr2zsRAUykdH4RGiUNQpOv3IgBhyRt33k3AJHndoM+GorOQGctLjNVn/+84nCUTZ
         VP8ussMObAnsUbPCw81nVnHgFaTaUxhqUlywk4gRrHoVVWbphRGw1f9UkFIDypaWwFuh
         iRBbo7VC7ggwHuQ76z3Z1eR1avCqCXdYKkHrJvm38mGRomZ6NQ2lDGd4xdFBsk4XW7C1
         qm9g==
X-Gm-Message-State: APjAAAVC4cwQ+Y8/C2PwxavISyuOHgraad5orD118Sp8bAqpTAnfpDXZ
        nrHCGrHcQJDMrfZtAF1T4tSqrJHq
X-Google-Smtp-Source: APXvYqxh5YsEhFdqCBH4hwM+uv8RithWc+hwMarPNLWlIfVBEETBdDdKamOxJOyuirMPEY2u0xsNLw==
X-Received: by 2002:a05:6830:44b:: with SMTP id d11mr7932989otc.109.1567788284606;
        Fri, 06 Sep 2019 09:44:44 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id c24sm2210165otd.57.2019.09.06.09.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 09:44:43 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-compliance: system information give features
Date:   Fri,  6 Sep 2019 11:44:43 -0500
Message-Id: <20190906164443.1748-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For devices on a HDMI ARC link, sinks can only support transmitter
devices and sources can only support receiver devices.

Add two checks:
 - Playback devices can only have has_arc_rx
 - TVs can only have has_arc_tx

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index bbd13989..839c0fb9 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -172,6 +172,10 @@ int system_info_give_features(struct node *node, unsigned me, unsigned la, bool
 		return fail("Only Playback and Recording devices shall set the Supports Deck Control bit\n");
 	if (!cec_has_tv(1 << la) && node->remote[la].has_rec_tv)
 		return fail("Only TVs shall set the Record TV Screen bit\n");
+	if (!cec_has_playback(1 << la) && node->remote[la].has_arc_rx)
+		return fail("Only Playback devices shall set the Source Supports ARC Rx bit\n");
+	if (!cec_has_tv(1 << la) && node->remote[la].has_arc_tx)
+		return fail("Only TVs shall set the Sink Supports ARC Tx bit\n");
 
 	fail_on_test(node->remote[la].rc_profile != *rc_profile);
 	fail_on_test(node->remote[la].dev_features != *dev_features);
-- 
2.23.0

