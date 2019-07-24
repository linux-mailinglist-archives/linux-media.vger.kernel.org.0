Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48E1B73277
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 17:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387550AbfGXPKt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 11:10:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37347 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387546AbfGXPKt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 11:10:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so22325969wrr.4
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1FgHhk+aX2idPhLloe6FEbpHfMCEX0I3YO0I/iVTXD8=;
        b=jUzADZoz6HJojG9s94wa18TJbWbZDZzOdMR61D6gHbvbsoXahe5pm/nWqt7hRnVRRn
         Jlf8b/o29aPQQlGizGJukQ8+dCBBc/zsXVXeX/XgPgh5mYk7UbWQZmnu+W3RoXv2+cBR
         PYq2j7v4SCwk8sCG5xO1JM/HcIipvguCFs5iRArGEoBGo7hSLW+bOt+SC8hlUmQkaD0S
         0gT6eFNdoDDSKMYxSWkl0+9d9yz8rums9xaGtH/CwtyNg3T07F591PuSBsc6MNARY+B5
         7/qgc4aCnAiRgVp17TssmQHiwaaLKdF/j1YvQgrbxXxFRV/DmkS21aIiQ+ArbKiA4hI4
         OMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1FgHhk+aX2idPhLloe6FEbpHfMCEX0I3YO0I/iVTXD8=;
        b=uO+F+HBxvYuw6JQF3sdohO6PyB/tGD/8nygk5ui+shZ/XLY3xYw23LvvxrOhfgwNhG
         Z6loonx9qVhr7+gf8huXD9Q3zTNJB454ER1UuHOK1BW68oKIaOZyvVOTk5g6Cb9rE4Ry
         HhYCQ/1gLZLsK8SjpB73djaWJgHkh5ANKN//LSCeUyiJ19rL2FWdXak/ga4CyHnUeLa1
         ovyz+gD1/sSOFbeHHHc59BEkei8YzkSYxUdEqA03WN3hj2CLRu8VjjHfO36Ze4KlApQ2
         9R8sEhJhdwm/y13ae72ff6hQIdT8thTW2VPCKVk0IaHEd0R7ldZPaMM+1RE5urX+ZkJg
         CQfA==
X-Gm-Message-State: APjAAAVENtwmk423xUxociFKl3eYN174tN5cOlDtgfKb7WmoSIZZtiHI
        EdH6lCIV1JxtpD44NQzamMS4d2Vx
X-Google-Smtp-Source: APXvYqwCFc4hoqe/JG/RM9wz+RyIe7Pe/doiOZ6GTGwSQDgMaqp/9NlJEhLPgjN5vR7Y/saeHiaIYw==
X-Received: by 2002:a5d:50c2:: with SMTP id f2mr58597086wrt.106.1563981046904;
        Wed, 24 Jul 2019 08:10:46 -0700 (PDT)
Received: from speedcore.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id w67sm58341394wma.24.2019.07.24.08.10.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 08:10:45 -0700 (PDT)
From:   rawoul@gmail.com
To:     linux-media@vger.kernel.org
Subject: [PATCH v2] edid-decode: parse additional flags in the DD+ Short Audio Descriptor
Date:   Wed, 24 Jul 2019 17:10:37 +0200
Message-Id: <20190724151037.36095-1-rawoul@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnaud Vrac <avrac@freebox.fr>

In the Dolby Digital Plus Short Audio Descriptor, byte 3 is used to
signal Joint Object Coding support, which can be useful to determine if
the sink supports Dolby Atmos.

Parse these flags as described in the Dolby Audio and Dolby Atmos over
HDMI specification v1.0. Other bits in byte 3 are marked as reserved and
should be zero.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 edid-decode.c | 5 +++++
 1 file changed, 5 insertions(+)

Changes since v1: mention the document describing the dd+ flags

diff --git a/edid-decode.c b/edid-decode.c
index 940bcb5..197b78d 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -1165,6 +1165,11 @@ static void cta_audio_block(const unsigned char *x, unsigned int length)
 			       (x[i+2] & 0x01) ? " 16" : "");
 		} else if (format <= 8) {
 			printf("      Maximum bit rate: %d kb/s\n", x[i+2] * 8);
+		} else if (format == 10) {
+			if(x[i+2] & 1)
+				printf("      Supports JOC\n");
+			if(x[i+2] & 2)
+				printf("      Supports JOC with ACMOD28\n");
 		} else if (format == 14) {
 			printf("      Profile: %d\n", x[i+2] & 7);
 		} else if (ext_format == 11 && (x[i+2] & 1)) {
-- 
2.20.1

