Return-Path: <linux-media+bounces-35511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B298DAE243F
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 23:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D123A71C2
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 21:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFE023958D;
	Fri, 20 Jun 2025 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOwJDIKj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15395223DCE;
	Fri, 20 Jun 2025 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455703; cv=none; b=Eyt6Mjk/S+i2SStSvyNUIcxKOZlC6AVDuWZNn+ODK8bqRl+VTUwOEsSrxAuM9s6OizcDc7GPMjDqv8frRzS4EaqyN1l9LcRmADF/HMecjmlJXqkaqtuckCnPF5QElMAr16dzx3qNptVY5vgj+UbaZLrwZNCU6UfnR46VJDAZCu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455703; c=relaxed/simple;
	bh=4Ft72Nr3kzVywy6TOavol3W71SO2Q3KhMx60de80J9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sgdi5IQpHV5I5VMQ1kwjNS6W34O8hP0lztZxyPmCLbqHgFxrJRVEJtySEbazbhBw88dSLCdBbbtpGfXAejZ15Ho6elwfhkuUk0SjnR4St12Tk7Hufwra3+cLaF5TQlyYWjwlThrO61I2XU63Qg9tfWBWhQ7jbfNpc6nDvxNfyTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOwJDIKj; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e82596e88c4so2119593276.1;
        Fri, 20 Jun 2025 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750455701; x=1751060501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uAahrOS33o7sgUXOZ2rcoYNIsua8jD0KjR6EQqfEsE=;
        b=nOwJDIKjsw9jNAv/2FUkgrvce422QwghnOKNi7USHmr/BZLgaxGrHVOYNvNYg1GjY+
         1P8n6Cz9LmZPtBWe8onGBo7B6rTq/bjVqq9znN08xEHAZ39nhW1/Izm0iFCeTrGiOjet
         nie3LfGkLGrsZaSJDfnbvI2TX+FN/Xu4eNPFh6ujVUQiJRKi82BLauqdkSBxhogeLCTe
         MI/6nKmZnr0S72pir3jlZwsC52618Z8LUq52fa4aUG9st0ZgYynCp6DA5Yw2MnbNHqYI
         Ldfq8X6bFRRUh2YQ1f966Sv79pd4v5bPzeI1kaROtF1hdb+ONdFlwF6RZkw0Dx76NJah
         CpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455701; x=1751060501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uAahrOS33o7sgUXOZ2rcoYNIsua8jD0KjR6EQqfEsE=;
        b=FtkrkS9kw7sLT4Xq2T3mPv4hiQlDJW2t6UxammgvXEI+tdXtxoxkKliOE3Kq4ObGHp
         uQ4s5txnwcapLbpcikOgO/ddCv65Mrm3XdZlpAUSfqyo2ezOBCiWxjFvXWKcwSbkiq3K
         V8KzOeRXpujFYrfCXaswKr/2mdjQ5FWqVTY4PJVkhvUTNrJn87nfF5y4tXE63TWVdLoq
         SC9bhFLgz+vPMnw/PPyE/sgsaAJ6sW0cCqSRbKuhX7LmGntBZG90jUiagZZeybGraRrB
         FNXeqjzk5sF+Uk7eVAXNuZr3+vZdTTJ5owIiCwrv/e9cpunBmxZgyaiGLZtNWRddLK/l
         WO2A==
X-Forwarded-Encrypted: i=1; AJvYcCU0InpqP5dKbCcd8wlc6jQteozoEOSwm8MJjrCJm9eURyXo/9cxUtm3eYTfiq2uET1nZEIivMJxgJ1H0VE=@vger.kernel.org, AJvYcCVyuZTlkcWPW72zv2EyJ8gSwHbB+WBm+Fb0JLuYVgLky9xzZ7/o+O7Lediw6gGpQkYS9vYpd/2J/4EhKWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt866eFY/wOH+ws3EsP7DJ1nL8OIQ9weKpnsxtvx5kHrQor4na
	Kd2nrwKW7010mob96k5IBPUpjcFxC0P3bOXHx/r5ipMNKi9ihhJaSmiw
X-Gm-Gg: ASbGncsKyZ9DQhhOLJsAsIDilWKCB1tcXbuFJbVo383PX42xCRIdwMC3dE0LUSKG3z8
	P8KvCvEwB+8ZNtBd+USabc6HbVFr2qZyZ+l4qYm/3RcepevxyX/Su4iJy2+G7ijgX+mDjoHcAux
	lU5PmUwvAkRBY1u0gLfIrc5z3Q7RDEmujzbwCNq9amaVmndieKeDBXgegXwhQjCZ35RIiDFknHR
	rVAEORgJnBQXPi5KhgrRvujKwA6Wz0vKNDrwH2skb9VNG4LGgDLI1sE0M0Ti6azf9S9cgQYHrN7
	uXKyhyCNIXiwFsvA29bUxX75gBsBCsptvGv+ACRyTc4mzDmOi0cF3371FLDwksWVPFidANBnPy1
	v
X-Google-Smtp-Source: AGHT+IHeXdhoQ2nRO39pjKloDWk33DX/i8jd5QX1dRew5XBLdy1rsgIznRHcWftril4Hpft3Ei2lpg==
X-Received: by 2002:a05:690c:6910:b0:70e:7503:1180 with SMTP id 00721157ae682-712c63b2084mr74607287b3.1.1750455700979;
        Fri, 20 Jun 2025 14:41:40 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4bec110sm5836707b3.105.2025.06.20.14.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:41:40 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb-v2: ec168: fix null-ptr-deref in ec168_i2c_xfer
Date: Fri, 20 Jun 2025 17:41:38 -0400
Message-Id: <20250620214138.3224843-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msg is controlled by user. If accessing msg.buf without sanity
check, null pointer deref would happen. Although there are some
existing checks on msg.len, they do not cover all buffer access
points. Therefore, we add an additional check on msg.len to
prevent potential crashes.

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027:
fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/ec168.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
index 973b32356b17..a72fc009269e 100644
--- a/drivers/media/usb/dvb-usb-v2/ec168.c
+++ b/drivers/media/usb/dvb-usb-v2/ec168.c
@@ -115,7 +115,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 	while (i < num) {
 		if (num > i + 1 && (msg[i+1].flags & I2C_M_RD)) {
 			if (msg[i].addr == ec168_ec100_config.demod_address) {
-				if (msg[i].len < 1) {
+				if (msg[i].len < 1 || msg[i+1].len < 1) {
 					i = -EOPNOTSUPP;
 					break;
 				}
@@ -135,7 +135,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 			}
 		} else {
 			if (msg[i].addr == ec168_ec100_config.demod_address) {
-				if (msg[i].len < 1) {
+				if (msg[i].len < 2) {
 					i = -EOPNOTSUPP;
 					break;
 				}
@@ -147,7 +147,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 				ret = ec168_ctrl_msg(d, &req);
 				i += 1;
 			} else {
-				if (msg[i].len < 1) {
+				if (msg[i].len < 2) {
 					i = -EOPNOTSUPP;
 					break;
 				}
-- 
2.34.1


