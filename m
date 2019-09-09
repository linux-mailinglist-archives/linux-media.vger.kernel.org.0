Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A649BADBC1
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 17:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfIIPHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 11:07:09 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37199 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfIIPHI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 11:07:08 -0400
Received: by mail-oi1-f196.google.com with SMTP id v7so10810131oib.4
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BS+8Ba/a6JLciG6MVUiSMtwdZorSPw8lGzEFJQ9QvmY=;
        b=iLLq2ZimxRnjgjI/03eCmOjGMQV0w5WCbg4/FGzqGJXBOXgQQSR6loDHqeeUAdg3fY
         LU/6OTNIM2JalnqG16tcu7lP3s8r/WG6IPt8Qj4jOCI/i5JCiUWS/zuIhdw6gsnYLvjC
         QY7LEpDjqD9WU1qB6lx7QuPIN8rH/o4eTC7rqxjBVFjhziG7xwFNxl/Bbp4p0rBtpouO
         bDNYlD9l8cvo9F+SWYOSzUQeAW2UYhdod03TYEtjpCh9E82cxvoE7xIUxDYPibZwHX6M
         PQ2aKphfjbFsA/j91hvkw4YaPbHwxeq95lvfaqCbe2eBD5UlEdq0PyC9ACkNjDlAmch/
         6cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BS+8Ba/a6JLciG6MVUiSMtwdZorSPw8lGzEFJQ9QvmY=;
        b=DhP1v+bhl8XWJh1YztZh4O4MvNsn4c7PGz+QyI1UJfLH64tl9rW9sfj+T4SgbnAnFu
         q7//YqP+jAOmz6faCgZKDBVojZG/Xf/peKmExYfSCkyVyMtaIBEHjNkRzzDCWTDoGjnY
         QKc/hkRoX/JQs2Zd+SfYHg9tNzufiRebXUS8jFd7KE1beZ2w9kPBLbyqcBOSwgt31Vtg
         QIH+ZMDYUBgqkbIXcKOs+BnuzgC2QlWDa5cgHK6yl1HUMHF2dgatOjU1GHJA5/JOmyUm
         /Ui/5epsZUkGXGUgaqDXrErF8u59TdBQP/Ov3o1rEUo3HkNm+LwzwcQrUE+VuFWRanFA
         ebUQ==
X-Gm-Message-State: APjAAAVgucOyNLyfmQyA4nsVQwhrXz2fBlviTcgcmRivDmPPCfUvwkq5
        GQWpkxTV5LfoaJZ5PtviFTAM9Vi0
X-Google-Smtp-Source: APXvYqwxI1RU6pCKS45GvYZzAmQG1l4BZyxhz224BCQm1BD8OAtFbY33gEicC8AGeFmE6mmbMIjtKg==
X-Received: by 2002:aca:c58f:: with SMTP id v137mr16241859oif.144.1568041626408;
        Mon, 09 Sep 2019 08:07:06 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id j3sm4831572oih.52.2019.09.09.08.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 08:07:06 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-compliance: system information give features
Date:   Mon,  9 Sep 2019 10:07:05 -0500
Message-Id: <20190909150705.38206-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For devices on a HDMI ARC link, sources can only receive ARC
and sinks can only transmit ARC.

Add two checks:
 - Playback devices can only receive ARC, i.e. source_has_arc_rx
 - TVs can only transmit ARC, i.e. sink_has_arc_tx

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index bbd13989..aece546c 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -172,6 +172,10 @@ int system_info_give_features(struct node *node, unsigned me, unsigned la, bool
 		return fail("Only Playback and Recording devices shall set the Supports Deck Control bit\n");
 	if (!cec_has_tv(1 << la) && node->remote[la].has_rec_tv)
 		return fail("Only TVs shall set the Record TV Screen bit\n");
+	if (cec_has_playback(1 << la) && node->remote[la].sink_has_arc_tx)
+		return fail("A Playback device cannot set the Sink Supports ARC Tx bit\n");
+	if (cec_has_tv(1 << la) && node->remote[la].source_has_arc_rx)
+		return fail("A TV cannot set the Source Supports ARC Rx bit\n");
 
 	fail_on_test(node->remote[la].rc_profile != *rc_profile);
 	fail_on_test(node->remote[la].dev_features != *dev_features);
-- 
2.23.0

