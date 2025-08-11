Return-Path: <linux-media+bounces-39448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC0B21139
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 18:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EDA550433C
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C868A1A9FBC;
	Mon, 11 Aug 2025 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7G1ZVmt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927AE1A9F81
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927625; cv=none; b=uTVFe+mhfvk+ZQe0lSwHEzWhKTmYMIA8jun1gBThXCtkkYknM5fA7TMMbOdnAbvdq/WZv3PfSoenxYzmvCe8puz7rm+pDm9gOEMDMcsA70ureQniL3C/R22k62pgLNPiymb6IMw9QLJGExVS9GowiJ5n3Vfty7PYFUSCz0pxWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927625; c=relaxed/simple;
	bh=0KkJYxEo8RT5eg1TfrV/CmprHdprr0KUyzc90h4lWsI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Q0sJMu04Lm66BkW9kyeFD4A08v2kj0TxQL8fuQ2uAarjOYML+jhr1skwNCfFUEeV7qEzu+Ry7NLYAMHtniVdVSkqlKKVqc7zwGrGSdYgJwZUQh7S4EBYrYUET/e1FVjOgesvvWiZSIA9metqJB85JYkti3gv8wWGAuZ4puzgQT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7G1ZVmt; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b428dd79d46so2936405a12.0
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927622; x=1755532422; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qtdeC82Qxcq7Tg/YIcfqo1tHgonaTOn7/QmloNtuLQM=;
        b=E7G1ZVmtWbVO14Kq+XTc+vN2whcWz9+4AGV4JBxJxDiH/wYNLZrLjbhZbwq+eKaxD8
         OWj8vSywBddAjpXu+afWjwC0ppn+AYo0wLKkeqYXmUcD6zoeymp7XHE8iYewJcjep6Yd
         T2U2KCD86+1C8m17zGsBA9pgnp2bycpRkQhcJYe86ia4VKHieotCAj8en4d4BHDkghwK
         deV+HCZ7WuyJVCKbOoUBWCyKTYPTSXk1lkL/G5zjLvroCH8bvpeTVtCzgWJFr6cOmi5n
         CPp3he0wfTWKViKUbYj2y20sP8dd3NQNj2CZzvken+OlfHy47qS3NNj+pIkQr684fcaS
         Ohcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927622; x=1755532422;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qtdeC82Qxcq7Tg/YIcfqo1tHgonaTOn7/QmloNtuLQM=;
        b=Xc6l8ODCvLMApXFlbX8l6L4ONsySourU1yJhxNPTEGPQg4OhjDz22eYR2gw1fUYOs8
         sNlV7vjEfUWXqq1Fs8/e5+QAuZWvIPWufLWozoSUOh/wWP3bMAluo2it37qHmyK6u5XI
         6S8vR2+krAZkzFMDT9Mxn51eyPnjI8RvkBKRwJUyW3ysW+qvGP2NAz3KVDhr71JMG/P8
         aKcKRVDvf0CoSSHK8T2nHL+c8wVoqBy+X1ob+kVi0ofPTOQbZ0YpJlF5GWZu3kAtFitU
         AoECUDnHz3PxHJXy/bgv5f5PtHDs8tM5WIm+3SA2ebSQ63Pk4OlQgt7zkPlWacT643eV
         /0/g==
X-Gm-Message-State: AOJu0YwhBqBOoWUJPPxs6tMzNmA0BUR4yV4nw+B+CLHFuymmkyDgeCPh
	iWL+S6kUxnLJ4GGDoSSzPJzI9vH+/eMasIBEEfnkVivD4+kOUNmitI9R5ZsDqPHK4lzF+7MF/nV
	wmGox7gRwi2TWvNIxe2rH5DazarMfQ7Jfe5rB
X-Gm-Gg: ASbGncuNWpWucdTCrVMgedQZg1bvBiKh8AiMIIipXAKaEfIzA5RzQRFr39dRZ8kmaFp
	/UaBo2QVw6Q1lijRUWH36Gpux1FCh247t4avKULzdSCIRb6xfrgWpm6kwMgkn3h/iqKpkCEENoN
	iIUK2FBTrYZ0kp2wltAwX5Ja6i0R0xwt07ulanCZeNTd7n5BYB8oY0C2wHDm2dwibiqrENV0YgY
	7llQsjrmIuwmzCJd1c=
X-Google-Smtp-Source: AGHT+IGIxdVqVaLDLbkyBe+4+1E4sI5E/rRqBsSn7gtCgkvtKFHDeOcO1+OEuDbVPfZG+qFUJk+h7zAKBZNsegFXysg=
X-Received: by 2002:a17:903:40cc:b0:240:3f0d:f470 with SMTP id
 d9443c01a7336-242c20440bemr172730525ad.20.1754927622483; Mon, 11 Aug 2025
 08:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: amnessaibor comment <amnessaibor@gmail.com>
Date: Mon, 11 Aug 2025 10:53:31 -0500
X-Gm-Features: Ac12FXyftISSUD7h4JHDZkFs3OhWRVt_ExRNbcnzEX2cAX_GVDJ87IHysG3hprk
Message-ID: <CAB890Ovm7jkzuyKREsn=cTyhp10Y6FRUgg27TAAYba8oMdq3CA@mail.gmail.com>
Subject: [PATCH] add scan table for Panama-All
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Francisco Herrera <francisco278herrera@gmail.com>

---
 dvb-t/pa-All | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 dvb-t/pa-All

diff --git a/dvb-t/pa-All b/dvb-t/pa-All
new file mode 100644
index 00000000..906a296b
--- /dev/null
+++ b/dvb-t/pa-All
@@ -0,0 +1,163 @@
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 545142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 557142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 569142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 575142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 593142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 605142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 629142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 635142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 641142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 635142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 647142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 653142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 659142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 665142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 671142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 683142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/16
+ TRANSMISSION_MODE = 8k
+ GUARD_INTERVAL = 1/4
+ HIERARCHY = NONE
+
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 689142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
+
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 695142857
+ BANDWIDTH_HZ = 6000000
+ MODULATION = QAM/AUTO
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = AUTO
-- 
2.43.0

