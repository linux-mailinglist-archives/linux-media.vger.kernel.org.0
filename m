Return-Path: <linux-media+bounces-39450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A847B2125C
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 18:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75CDD4607AF
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23026296BD7;
	Mon, 11 Aug 2025 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxMrelKl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CFE247299
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930089; cv=none; b=LSIz3CvvgMnke/tmhKZY26FWKQARTdzv7mmyRwGeCAYNNfhGhKdAqSVyTsnXad4t9qUVR849Z7/6BgcOzKqk+nglurSEE9ZYseY1ZvXuUbhFnANW6nJW6BeLRCob+ZNZqxcuGbzu16FelOBVCX3kYkxzdW20fpjwUzhAudwI44c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930089; c=relaxed/simple;
	bh=0TW/iTEwPdnAVHtOiCUebtFZpsyRyYd7Te5yvGx5Bwo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UJOcCe7tk4TQbNvrpBKeg8jCF18GPyW7Ns3QHkjo1bKZgwZHUobxhM49NvobeS2NpLZmwaUH19GsKUsrhHCwlqXuXEgzh5ROBWEDnLV1q8zblN+9BdqfWnyfJya3dHHB0i3lF3saN/QV17H+jCLDns11sW7VCpi3US0G9D0tcP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxMrelKl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af9618282a5so882628766b.2
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754930086; x=1755534886; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QsKKDnzUV9z7gBc4kIIWofTeM6k23guPCyYyp21OsWM=;
        b=AxMrelKl9v+blzYDi5WP7iOTczbemEOHqV37cGoD9EIAkKT5wFXEkpLDMRcnoeeg46
         NLA8HOul1uY1bd2/pVUlopRYtKPJ0FfMFN+u0K9sLQFAkwP6OOvqr+RlQZSfD0XNKtst
         DSLx9tikX0kt8jZFmlP0o1IJpHNWid81nrtJbK5Hm/4jji4xzqt67SbGCBTeqlC2eJHc
         8W/kOZ4BLcFqRCkFindmUKO+TW/mWV3H54EgmVS3DEuTHwWnC4BUo09n16OdpXJO1IeA
         F3EOAYR+1zzPZcqEgrTvuYvGA7B0z5pvmwscAezp/jNLhbVLZhalxUiJUfMiPYxxYy3Z
         T0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754930086; x=1755534886;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QsKKDnzUV9z7gBc4kIIWofTeM6k23guPCyYyp21OsWM=;
        b=paIJtNTYlOxdjYm9wS5QulVtJ5XFZB1Dvb0bt9nP1K+FdDBOyfIyisrXqt5C6OZhqG
         oNeUvo2yfbf5aN6/rhFrpxlRZt54O6L06yP0PM0JZUePLQBcG4wHBUXlln78Kk2duIFL
         nTvekmd0PY01n7P74/w6NKEwZbJwzZV2fWwzyyHmARFY1QL4wc/SrzUkEx88vv8ul+7Q
         PO+K6ZzVQl7IWBttdjuAhfY0dH/Pkg+EVC+0Io6c34eNwMuP098zFyU5tUQCbXGyxzah
         TNdEeF8DaHWMFPqbKm+VVGDVjzNC/+ptHDcfaqHeRmqI9OKIAwImqiYgYgQ60/PX7siH
         pPKQ==
X-Gm-Message-State: AOJu0YwY05wKQqkBeP+0rqxPqbqIGRqOvxf8zewPO0ZCEqlU7NWubtcM
	quOXTEULTH0h08lVj+ogPOMDekr27dmPPgMRjZmeh04WkwDs096tL3Hu0K7kSiNIu3HoF1uHUds
	hmI+odrbEhSxW0JUCUj7gkZLuEqbLbAxmeiDB
X-Gm-Gg: ASbGncvrsmYoM6zRsobws/FClW9ydJNVE9CF30vjOlRGibBnbtmGGf9rhQ3F2SIr3h9
	gMJyx0ie9NzGCiN/yTvjyFaDLenzp8Vz5jOsxwcDWFOe5qYeHzg47pKL7QaBYVm+ZVwh2hXX7W6
	qLnJSVtq3iYWa1Q3OAl3YawHRaEPcphPiY6azix1xRtPWdOyfDT/uSKGk7fKgNTich1WHS3M3XF
	IDDAq7Z
X-Google-Smtp-Source: AGHT+IHoB2vd3UMgCZRJJ2mozGnM9buICdy5eDQtC52HRLZeinSLXso7GgR/DVBDoYdtu/FFGgrQvoSgb6wgd8n5zIc=
X-Received: by 2002:a17:907:971f:b0:ae0:d08b:e85 with SMTP id
 a640c23a62f3a-afa1e1901d4mr7153166b.61.1754930085895; Mon, 11 Aug 2025
 09:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Francisco Herrera <francisco278herrera@gmail.com>
Date: Mon, 11 Aug 2025 11:34:35 -0500
X-Gm-Features: Ac12FXzn8KuxWCBMTJy2EtTAYavYGEaGB2kJMW_zWtn4UAYRKUW2U-h0i--Rd9Y
Message-ID: <CANsMvVvkbWDA5nb+jjGXb+qPRhLw_hN+mB+6AX34ZzfrwoOA5Q@mail.gmail.com>
Subject: [PATCH V2] Add scan table for Panama-All
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From ce24d80f16855b9b318e3eeed4d714b35a6d2697 Mon Sep 17 00:00:00 2001
From: Francisco Herrera <francisco278herrera@gmail.com>
Date: Mon, 11 Aug 2025 09:20:59 -0500
Subject: [PATCH] Add scan table for Panama-All
Signed-off-by: Francisco Herrera <francisco278herrera@gmail.com>

This is actually the same as a previous patch, resending because the
message body was cut off and it isn't appearing on patchwork.

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

