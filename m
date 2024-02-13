Return-Path: <linux-media+bounces-5106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E5853C1E
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 21:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4F21C265B8
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 20:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1929760B94;
	Tue, 13 Feb 2024 20:20:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB2F60B88
	for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 20:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707855639; cv=none; b=g7D73qDvKXHBgNMMOAui2sbumv0R9UyyeDIZlkWvrEo4DdodiFDDFyixT1fZ9opfx8UZfIRo/bMFrCyXYJI565Pe13mYt4YmI6HBeLkuqLYz/EAtFrirCQZulcOmCHBObUv+wd0++lHjaDTgh22yBe6+dBa3wcORyl7uiePSWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707855639; c=relaxed/simple;
	bh=k7PCs4njyAm3u7H1OoFmI3SA21hsGiEjhGFjjS8Hdc8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bSOcgA4UsPwRSA/+vhX/GEAXu8Ff+lhqmagMBrXbBWTdksI+frQsX0zxlZXyBPKhDzSNNWDTlj4OPoPOeQrj1Cq/eVDnD+Mh3HhYjl/ECcHhiCtXoLj1fRnmtMdTs6AE1YrVT2F0GIfMJXsycVfaeDChuICzCjDTxtASGWLdoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=varadiistvan.hu; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=varadiistvan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so6354920a12.1
        for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 12:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707855635; x=1708460435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNJs+7XMlehHKLr9j6eJEs3dpfNf+UVw0bm3jAF6MVU=;
        b=c8c36rvsasUkHSk3gjxMWwuqItqN/po38wlSo7nSRo7/45Ongkb5daUp0Ieo0/WvHK
         6v0Htwt9cIsGO33EFjKvVvxA6SCL363zPD5ulgcNRzSIL603KvPk4dbUxYOctws/iAbJ
         YVtjrhH2eUKA/NHgvoLx4JvyVK7j5ra+PWsn2tvA+PNrX/326TcB/DRjB67Ocl63uhAY
         CW9LNgZg5RkFauzczST4MiH666Mdi0pm8QUo+wvmyr/QsidXrHeHNSBcHUA0S6zUc0oU
         P+zWt+R80cG/pmWTR3jb1/8sKZ0gZajpg/cGGxvGIEGN4etiaEpYt8EDI3LccOHytvr5
         on0Q==
X-Gm-Message-State: AOJu0YyfFCgb9MDrn1/u2MqytpLCATOLyYvXkCmV3hg1BG2SNqBNd4Ew
	8x0dG0PXr4U5yFSHQC0Q0gJmOWAlS2TIRlt9qRcgFiMWusMtGTzwhtIs2pfR7Ms=
X-Google-Smtp-Source: AGHT+IHfRiRO1wZ+RG7mwIAzZuBfpTbQqZpFqWgZcWG8ZTHbNb0fQvPohtOkjOp00LApWP8+DP4gxQ==
X-Received: by 2002:aa7:d4cd:0:b0:561:fec0:cd44 with SMTP id t13-20020aa7d4cd000000b00561fec0cd44mr627503edr.27.1707855635305;
        Tue, 13 Feb 2024 12:20:35 -0800 (PST)
Received: from vi.. (2a01-036d-0114-02e5-8309-9aef-4999-55aa.pool6.digikabel.hu. [2a01:36d:114:2e5:8309:9aef:4999:55aa])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640205d000b005616db210c1sm3743885edx.67.2024.02.13.12.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 12:20:34 -0800 (PST)
From: =?UTF-8?q?Istv=C3=A1n=20V=C3=A1radi?= <ivaradi@varadiistvan.hu>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Istv=C3=A1n=20V=C3=A1radi?= <ivaradi@varadiistvan.hu>
Subject: [PATCH] media: anysee: accept read buffers of length 1 in anysee_master_xfer
Date: Tue, 13 Feb 2024 21:20:32 +0100
Message-Id: <20240213202032.405578-1-ivaradi@varadiistvan.hu>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

anysee_master_xfer currently accepts read messages of length 2 only.
However, sevaral frontends, e.g. tda10023 send buffers of length 1,
containing an 8-bit register number (see tda10023_readreg).
These buffers are rejected currently, making many Anysee variants
to not work. In these cases the "Unsupported Anysee version"
message is logged.

This patch alters the function to accept buffers of a length of 1 too.

Signed-off-by: István Váradi <ivaradi@varadiistvan.hu>
---
 drivers/media/usb/dvb-usb-v2/anysee.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/anysee.c b/drivers/media/usb/dvb-usb-v2/anysee.c
index a1235d0cce92..eb1c6f6cf414 100644
--- a/drivers/media/usb/dvb-usb-v2/anysee.c
+++ b/drivers/media/usb/dvb-usb-v2/anysee.c
@@ -202,14 +202,14 @@ static int anysee_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msg,
 
 	while (i < num) {
 		if (num > i + 1 && (msg[i+1].flags & I2C_M_RD)) {
-			if (msg[i].len != 2 || msg[i + 1].len > 60) {
+			if (msg[i].len<1 || msg[i].len > 2 || msg[i + 1].len > 60) {
 				ret = -EOPNOTSUPP;
 				break;
 			}
 			buf[0] = CMD_I2C_READ;
 			buf[1] = (msg[i].addr << 1) | 0x01;
 			buf[2] = msg[i].buf[0];
-			buf[3] = msg[i].buf[1];
+			buf[3] = (msg[i].len<2) ? 0 : msg[i].buf[1];
 			buf[4] = msg[i].len-1;
 			buf[5] = msg[i+1].len;
 			ret = anysee_ctrl_msg(d, buf, 6, msg[i+1].buf,
-- 
2.40.1


