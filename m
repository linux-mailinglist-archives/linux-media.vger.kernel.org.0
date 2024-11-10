Return-Path: <linux-media+bounces-21224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC719C3213
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 13:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1182B20E65
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 12:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21470156F53;
	Sun, 10 Nov 2024 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFlUgfRx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9885145323;
	Sun, 10 Nov 2024 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731243506; cv=none; b=qF5wRx3w0ke6GNZ24JRKYI4tnqKqqoUSvqIU8e+w0ZA6GENMbmgNswk/7G9l/qhIV5FnteF/kznBne7aIFBqlvkMQ8xwXCL/7/2Gjs/yB8jVCRWG2PGB8DnB+yywcOUhqr58WUNT8fRngHIK3eGRsg8pZwQ2DPo3tO3N3QlPLrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731243506; c=relaxed/simple;
	bh=V8kc5F2Kjhi2UfihVL54oZ8rcLO2/+1BFW/M1E8TBuU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gKPCtouTdGDQTjEv+ZUaRX3P5swtC3E2aLQJhThQGqF0VOjKCV5dkna/7mYKj1JjZ5SujrgXSW+AnMsdD3a6DBf3smB2Ax1iNmXlmd0QhEpGU1sEaYSejqm4WSWMuFBNqIMYVkuT29Ha9kAWAhLNd1Uh1sSnc4JDvp5WvIx/yAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFlUgfRx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a628b68a7so659470866b.2;
        Sun, 10 Nov 2024 04:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731243503; x=1731848303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8Xkum7xc7VMXVl2k/SXjUke76FdBWCX5aQNeK5s+6w=;
        b=fFlUgfRxGzi+mKW8kx4gxqHmGPe8H6+lfs1Xh7mDzQhcCMfkwBXwAQqlR0oV3WMECH
         FlufnGdf5IrdcJ8UOacX1W8dNQ0g9M+DpEFM3KDm7gzCvAtLHGCCVYgvOOG32i7KBH1l
         YWtUAB03RgO2Y8AMqNnqGXYcOh3uy1MMoVdp8qk1QIAURAbFvDI5LPBbqDsVAiqi/wjj
         /pZzlczhNWsquLjzKchqOa+cIJydQD9xniaqN9Cx9rc1zgbHqO9NgadcLo8Q+h4AXFKa
         56KGPa2Dy/XMHqMF8k20Fv+lRGjlts3aAKCy5E8oAugY5/49YpX9Ga1IHW8E83PRdAv4
         Idnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731243503; x=1731848303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8Xkum7xc7VMXVl2k/SXjUke76FdBWCX5aQNeK5s+6w=;
        b=aJee/QNE3AzDl4C4gs0WbhxGgQO0+1i5IY/po1lvCVX8/ko8zNoIjIRMYYwAPh1EQf
         cSVKBm5CwGxjS23AmNW3ERSPFt8qbnmZ8bvhdSe8RYemHpUwf4jGVk34waaKqpWnFS/K
         huukdCafl10XKtOv8rCqNZcWz7Wd62bLJggw7UOSUkSwvjp/o8enN34bVi2k8WTrX6d/
         ZpqeP0AdUh30mv5SefYif1yBq9stGqnnmKPAyDBCYhe63Au9o4e33BhqQOQGZn+IU6V7
         MC8EWZID95PZQeMOPxcvYpu7bPaMHC+r8uRbbkYXvNeJago/uYwbFT5nsqtUV7g+Qm/S
         Majg==
X-Forwarded-Encrypted: i=1; AJvYcCUUPGBDgVpUIejTAt3bxPiZst+q1kH9fV2dt9ibnjBWVK4S8pT3q1wmY9OIvCys705JtdvY3rb4+2VlwpA=@vger.kernel.org, AJvYcCUwTkNWdTdJSd/k2UbSCohjMEGHEpCmkIsq8Ap9jniLhJYzokxpd3rgSKqUmGhksQRqZmmjW2kmBotf//4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxunV4PhaYFP13pIe3+iWDWntnKtC6Mu6DDocYxbgyFk9gLY07+
	cdOWmFo9s+u99tj5+ThrTGhWlk9YQdmQaqUXSp2f6FIUk8Qgcx4D
X-Google-Smtp-Source: AGHT+IGbsus2b6UYUkvaGG1aDXCmv7ldx7gBtR1guLY+eEBHUBruYzKPA4z+e3+0bDlFOVFHr3XLpA==
X-Received: by 2002:a17:907:6d05:b0:a9e:c440:2c0f with SMTP id a640c23a62f3a-a9eeffeff9emr866160166b.39.1731243503016;
        Sun, 10 Nov 2024 04:58:23 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a1769asm477210866b.1.2024.11.10.04.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 04:58:22 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: Karol Przybylski <karprzy7@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] media: cec: extron-da-hd-4k-plus: add return check for wait_for_completion*()
Date: Sun, 10 Nov 2024 13:58:13 +0100
Message-Id: <20241110125814.1899076-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to scheduler/completion.rst, return status of wait_for_completion*()
function variants should be checked or be accompanied by explanation.

I examined code in extron-da-hd-4k-plus.c and it does look like the return value
should be checked, but perhaps there is a reason for ignoring it.
I drafted a patch for this, but I'm not entirely sure how to approach error handling in this case.

Discovered in coverity, CID1599679

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e6..83a790117411 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -559,9 +559,12 @@ static void extron_read_edid(struct extron_port *port)
 
 	extron->edid_reading = true;
 
-	if (!extron_send_and_wait(extron, port, cmd, reply))
-		wait_for_completion_killable_timeout(&extron->edid_completion,
+	if (!extron_send_and_wait(extron, port, cmd, reply)) {
+		ret = wait_for_completion_killable_timeout(&extron->edid_completion,
 						     msecs_to_jiffies(1000));
+		if (ret < 0)
+			goto unlock;
+	}
 	if (port->edid_blocks) {
 		extron_parse_edid(port);
 		port->read_edid = true;
-- 
2.34.1


