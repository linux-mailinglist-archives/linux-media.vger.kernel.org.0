Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8728DAB160
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 05:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389145AbfIFDvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 23:51:32 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33610 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733221AbfIFDvc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 23:51:32 -0400
Received: by mail-ot1-f65.google.com with SMTP id g25so3222123otl.0
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 20:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0VaC65y4pOGtw4SvcHIBMg6Bm9p/QZxaEQPcmU2XHSw=;
        b=qQRu27u/p2s2m6T8zb7tjtG1R5CCQ/Di6xZFfdYCyQMd2VkB6/ymIMyzhnB3cj4cbb
         s841cEABo1ONqqvdUXFpkrJ75JLWfKFs1Dc2OFXJZkHeH/7eKeD9KyV/MsdI6u5foyIf
         umHmGmxmP5nJa4Tm44+7QjHwnDkc0CF74sxlXbcZkDA0iCI6kp+XzuzI67DwfKuJoqQ4
         MFc8xdQA55KZsNIS6H9nACgFReY69RXuLXZBXy4fwt0neYlpv3YtbzUz9MwBeL1hjuRH
         9qm1YlhYjeklQj5BFcerlzFVZkZMxtzFmnDJ6uD/MMEj2A6oRR2qismuT3jyfPdPjPBE
         l7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0VaC65y4pOGtw4SvcHIBMg6Bm9p/QZxaEQPcmU2XHSw=;
        b=HWeFjXi4BA3nKhd/EBRXa617LWpO69e7ocgyCIt2kE6oMPDR27qSb8xkvKeYbn9EHn
         G/HIxDOqJUwDAkg+O8TaM0oNSIPG7YIAtZmeBptNYhLPI9enqyy0sZesxI/zopWxa9gB
         SiMVbGzZuCdJVdcsRQMrxbWEYbhsanfM6cbsldgHYp0q/bqtpcgHAaxmDRjO588AlNTf
         7RCfpSOizJHAjITkmkl6K2dTaj1A6dDUj6N7rFOBGyOCyGhLVb/g89EtIjhThDGY3ndI
         isfryfKmfVNpHfKJzO473ANkG25+eNHEhmc4UA2UhYtyyJdtKeM47MspRktC4Z4n9YRr
         X/1g==
X-Gm-Message-State: APjAAAW9vtDC+YLPcyk6ig3YU84B3uikGinY1AxVQ/0q6GppSTO0tKzm
        7FoNM9HRYO7ba9Tx4J72g5Zfu86v
X-Google-Smtp-Source: APXvYqy1berDyRuiH3/V2MqiNVSFWnzwzUQuQA379cA/AjSoozqKnT17uWDxf6AfVInqsOaCKj+yzw==
X-Received: by 2002:a05:6830:1442:: with SMTP id w2mr5939540otp.206.1567741890807;
        Thu, 05 Sep 2019 20:51:30 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id c93sm991732otb.22.2019.09.05.20.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 20:51:30 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-compliance: audio return channel tests
Date:   Thu,  5 Sep 2019 22:51:28 -0500
Message-Id: <20190906035129.18447-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For devices on a HDMI ARC link, sinks can only support transmitter
devices and sources and only support receiver devices.

This patch checks to see if the DUT is an transmitter or receiver and
has the ARC flag set properly from the device.

This should apply to devices that support the HDMI CEC 1.4 spec going
forward when ARC was introduced.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-compliance/cec-test-audio.cpp | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
index 872bb9ad..da2ed1d1 100644
--- a/utils/cec-compliance/cec-test-audio.cpp
+++ b/utils/cec-compliance/cec-test-audio.cpp
@@ -297,11 +297,35 @@ static int arc_terminate_rx(struct node *node, unsigned me, unsigned la, bool in
 	return 0;
 }
 
+static int arc_sink_tx(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	/* Check if we are upstream from the device. If we are, then the device is
+	   an HDMI source, which means that it is an ARC receiver, not a transmitter. */
+	if (pa_is_upstream_from(node->phys_addr, node->remote[la].phys_addr))
+		return NOTAPPLICABLE;
+	fail_on_test(!node->remote[la].has_arc_tx);
+
+	return 0;
+}
+
+static int arc_source_rx(struct node *node, unsigned me, unsigned la, bool interactive)
+{
+	/* Check if the DUT is upstream from us. If it is, then it is an
+	   HDMI sink, which means that it is an ARC transmitter, not receiver. */
+	if (pa_is_upstream_from(node->remote[la].phys_addr, node->phys_addr))
+		return NOTAPPLICABLE;
+	fail_on_test(!node->remote[la].has_arc_rx);
+
+	return 0;
+}
+
 struct remote_subtest arc_subtests[] = {
 	{ "Initiate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_rx },
 	{ "Terminate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_rx },
 	{ "Initiate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_tx },
 	{ "Terminate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_tx },
+	{ "Sink ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_sink_tx },
+	{ "Source ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_source_rx },
 };
 
 const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
-- 
2.23.0

