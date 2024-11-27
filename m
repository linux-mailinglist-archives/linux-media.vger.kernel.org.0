Return-Path: <linux-media+bounces-22160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 065DA9DA6A6
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF675282006
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFA71EF0B6;
	Wed, 27 Nov 2024 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="glYm+6+a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f98.google.com (mail-ed1-f98.google.com [209.85.208.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6D21272A6
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706122; cv=none; b=usam8Z76Mg5D/2FzD1VIUaLmY8cWGly67We/g9DGAaBzD7OVesfg7LpJ7V0J3L3Dq32kg8KPmuQiWqray3VtteX9QGngqBCR7sq8VUgM7DrObl/ZcjzS2X4oPeTKKM44Fg6SKb6Zg3DbCHdeEn8J2kU1G+wd8Kl5R+zAr8akN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706122; c=relaxed/simple;
	bh=MK1i4+Rf6RLAmZEH5QQ/XiZ2f2QgQPBtmRAR7/9o92M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bi/U2ltqIm4GvJsAJfVvwrfNEv8Smfe+qnvrkcePd4J1ve+lecxhtyTOhFa4BQWYJn+ITVpUyP2accQLrrR3926B+XWUtuciW6emIgJ05PsamQjsbvahVHfZ0melJ1HpXWXHanPNoXOEUrm4klR9eE44Pdil26osukeMbEDdTZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=glYm+6+a; arc=none smtp.client-ip=209.85.208.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ed1-f98.google.com with SMTP id 4fb4d7f45d1cf-5cfddb70965so8118277a12.0
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 03:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706118; x=1733310918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbwwjTObIrPMKMbgQEUxwz8EAlGUJCffQHwTQcAAqH0=;
        b=glYm+6+aYgPFbz+I+YacK7gEUFBkoxvp6Q0RHZJie9bMAWE7XI+Y2LI7WimYnahIA2
         JWzosLTBum6vQfJnpJrp2/g1p6cdHGRyP5o0sn66FR6Hv1KNmh9/K10RFYnIFMygJsUE
         38uSqm71GrmkIBkoIKPhY4lQYdpM8m7kYZZVzBOD45HMqmFPOQraEgOU5Y1ea8rhaSDH
         s0wNj1eU3FQtZmESi6xQ4wiFjkC0HpqJ9LA4pTa0nzDlJCHOP9q8FmJpnFKAlWvIv9MA
         kgpB/gKyMpzukgG44Xsc7vKaugS32WoX9IVQgWaEPOQ7Py5sddiGudZuKFxei9/AUvsV
         gCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706118; x=1733310918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbwwjTObIrPMKMbgQEUxwz8EAlGUJCffQHwTQcAAqH0=;
        b=qLA47ehtz1/N/osviCVl7H8Bwxc4WP4CN+WF5CtGE/OvQ+fZRA1LqOe2ROehhN90je
         SZ1QF2Dzfh5ifEd8ozyif+kjyJ9QWHy/DfJBbEI8ZW/G898wiZJxNIzfMHu1XEvdJsfk
         Y7BdYyOJo2QM1GUhi21oVn/xVLSfxE1a5CQlQhm455+vptrDhFfDTjek0altHFLsQ8qL
         nJbnFCkTNL6mlu8v5QZet2VljuucMGtsGjAxFxg32pl6raCFFK3CR9rXErY7DhgXGXZT
         cMCgDlaGlDI2hUeTi8egmFq1XiBHj/R2t8ML6ghtBvMzCQ1uw5v0k1Pr8yAWi0mUDiYR
         Umtw==
X-Gm-Message-State: AOJu0YyAlUZsZA0UpU+9mVgZ0btYO4oRovhZ8n4oy0257LETwGJ0ziSC
	iVl5qBUXxn3mUU295VQ26krzLu/M3W263AjFTwQtgsl4kCOQx1TR1pKT+GX3lWs5tkuxpmxH35Q
	CpCF3EpmpcAi60BGqeFM8VRQord0T5KoH
X-Gm-Gg: ASbGncsug8BpwBA/1fWOYYxHmE750d3Ve50fGmeWMbkHIOrctxoOxvhfcGbgZ+KMgLL
	F+1KInNnW+NOnZFIMB2A5MqqiWiKytvpxW9yHNLtD1sDbygVktO56eBAblH+8xQc9QanWpR20h/
	x6/+ETOF/uEAWeOCzSRLdOzS6PISs3l1lDkXYDKympvO9c2XsMk+BKbtYdWvCMOOBxZH8DOn0aE
	/hjWLN+i9sKuelw81EPriwf0aJLK/K7dM3cdZQflRZ6hogUzxH33LDUzSZ/h6NBCQ==
X-Google-Smtp-Source: AGHT+IEhzkon84gktCOU4wQ0YLegpwevnMbIo0lpL/f5tH0yFj51P93r/ssXmdD+9J/oH2WktVzDT4+2hBjv
X-Received: by 2002:a17:906:cc4e:b0:aa5:3982:660f with SMTP id a640c23a62f3a-aa580f57de7mr188391466b.27.1732706117686;
        Wed, 27 Nov 2024 03:15:17 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id a640c23a62f3a-aa53a1ae8a6sm42110966b.163.2024.11.27.03.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:17 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v2 0/4] media: bcm2835-unicam: Upstreaming various improvements
Date: Wed, 27 Nov 2024 11:15:11 +0000
Message-Id: <20241127111515.565992-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Version 2 of this series has no changes, except patch 5/5 from v1 has been
removed while I rework the logic donwstream first.

Thanks,
Naush

Naushir Patuck (4):
  drivers: media: bcm2835-unicam: Improve frame sequence count handling
  drivers: media: bcm2835-unicam: Allow setting of unpacked formats
  drivers: media: bcm2835-unicam: Disable trigger mode operation
  drivers: media: bcm2835-unicam: Fix for possible dummy buffer overrun

 .../media/platform/broadcom/bcm2835-unicam.c  | 42 ++++++++++++++-----
 1 file changed, 31 insertions(+), 11 deletions(-)

-- 
2.34.1


