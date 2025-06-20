Return-Path: <linux-media+bounces-35509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9BCAE240E
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 23:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AAEB7A5AC8
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 21:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC44237A3B;
	Fri, 20 Jun 2025 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIjc1rmh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678CE2AD16;
	Fri, 20 Jun 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455256; cv=none; b=Fo9hDQjHIIMEe+H4DNYzTNznoqgxP1AnXaK33qoMLW3oc0QFrkLOjBOC5MyzPv2w0vCkUTGA4HNBzEA0iQCqy1eqjRw/wzp5lxLnGBAZBPMVOP1V+SXq/vGT9NxdX4uftppk+iMrSGxZnD8FQuw1N4AyvX1YkXEGk2GVuXg2Gak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455256; c=relaxed/simple;
	bh=n+iUe7dHiShb58lXQHpIDsRsRtzGFHj0wRuOdHvmxww=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ANUwaDPNFvJxCvgone3rGmhgo2YJvCzJQJ+G0zByXs7ls81T6GlaDfHInnW7EoyI6J/RxzHzFSsYBqJJw8d7mIhdb2tYet//QSboR+HsADm1pyFMdTS2wLJgncKmY/xQ51j/LnoJ15LBi7Ua7wJdAGhpi8SvAUDR8wRD21CmeY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIjc1rmh; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7db6aaef22so1879216276.0;
        Fri, 20 Jun 2025 14:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750455254; x=1751060054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdtkGXWL1OFAOftHP1Q5gu3ytVP5JRaSbNKoYYDCkCc=;
        b=LIjc1rmhJorUpx/CD9Jo8/IIRxuJqaquzaj1GvDlAJJ6NcFiSp9p67gleTzj7Y8VUl
         kY9n7mvKSsga23uIikIclepwfIfAkthGmsBouI6IgSbktJsePAHlHdeOCXRcx/yJkv5A
         4oUrwT3TbTOFSQe0hcXd1JYwd1A/ovPGOHhNgCtYVjf+pieKfhrzoLgwS1s7YvuEb9Ex
         2512FWGwyHSZ21Skcc+NPr+DwqVOJii40627xwsBaSHGvonmB5y9WAGvQah+qdiT6uqQ
         ydfZhVtPjl58VD1lM7WILWEuUMHYPODh/jgXq5nKB8hmOZkDiDh4IjOd5tw3+TPzIU/B
         57Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455254; x=1751060054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdtkGXWL1OFAOftHP1Q5gu3ytVP5JRaSbNKoYYDCkCc=;
        b=gU0imMm68fZZVLqftbc+IxnzVLqadp5pdD9ZDzcJyrvawq10+19JH7LtRmyhA/RnS9
         vSyCESxZLKOpWRPQtt+Q5JRe6hBq8ND7A6F9ouYVsOmTZCpMXvldsSAzqd/u8bfFOUWo
         Ixw3eg1uS+GnkmdtHFpnGnDiLqA+DDZtNrxUjfN2R75B6rjzdkSUXBRLfS2UczltXDor
         V7QKC+N+RDZnBuLGfWRncf5qP+OMnDBodOFkoUuRPN1HBWrOWNVYXwxJL4VSgL3eG7gh
         1nfi5iGO0lIFe34P4gXTEAsw7vqTlSSpGCjl7cOr2OyEkp69Ex+0XbeWQAFd+DBr1kSf
         TYeA==
X-Forwarded-Encrypted: i=1; AJvYcCUqL3p38kglFz2dBU1KAtrfy8OGzyCuSQDNQdNAJX2A5lSVgEawyBvBA5VSKgIPZMwRFbtOsqtNWwyIlXQ=@vger.kernel.org, AJvYcCVDbuL2qg6/IiGuu6iOd2hno1cawFzg98Z2oJg4ZYpCN2UXgUeSyulSRNKLW8VFRIMWomBYanvDLeoWPCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaE/w872zhTbcVpPXXWoUEFbXDNuAUJDnQF6Oc2Py9zi0qEUwO
	Dnj1lj0wE9WvJEULMLwD4WQWvf0O1Lb95NY1u9D0Dzx4Q5YyiFwBt4N5
X-Gm-Gg: ASbGncvmXDMYfyktBAlBb1vQZ1tXQaRDyuXLio6i5wxE8IVfsnUtVJUzfm8XhxUmOrC
	M8lRDiWEfkfETApTeyeXidwu4pqAYAH0kejnzeNfnnYMvvpDvgmtjl2numvSMykYoAYja3SXXrc
	AOI1Cfdq2aWGZ85upfH7Rj4wcgmMxiaJxC7YcqXkNJvnCcGQhMjVT61VUl585uyvN+Fqdl5mDj1
	YsC9YGQwDVCZGZWx5sjzJD+mLP27qw95azk8mlCo/FBerVJE07Kr2C4W0peCAPcWFNwUYEcNMRA
	ns2XcaKjbCNG7Rudf6GF9/SWuJAIb6swdNTQpYuY9GxmvBZ+jbLFTonrSA3AmwBUAvg1CQtsd1U
	J
X-Google-Smtp-Source: AGHT+IFq/neEuAqDSN/50g79J0djgBUB2KTD/o/gKm28GK+r7If7uPt2nJPLNmsWPh6P46ZRaGru8g==
X-Received: by 2002:a05:690c:350f:b0:705:750e:37b7 with SMTP id 00721157ae682-712c639d784mr56557197b3.5.1750455254161;
        Fri, 20 Jun 2025 14:34:14 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4be2452sm5785437b3.89.2025.06.20.14.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:34:13 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb: dw2102: fix null-ptr-deref in dw2102_earda_i2c_transfer
Date: Fri, 20 Jun 2025 17:34:11 -0400
Message-Id: <20250620213411.3219058-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msg is controlled by user. If accessing msg.buf without sanity
check, null pointer deref would happen. We add check on
msg.len to prevent crash.

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027:
fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/usb/dvb-usb/dw2102.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index bc30dc6072e6..ec22f397f827 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -366,7 +366,11 @@ static int dw2102_earda_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg ms
 		}
 		case(DW2102_RC_QUERY): {
 			u8 ibuf[2];
-
+			
+			if (msg[0].len < 2) {
+				ret = -EOPNOTSUPP;
+				goto unlock;
+			}
 			dw210x_op_rw(d->udev, 0xb8, 0, 0,
 				     ibuf, 2, DW210X_READ_MSG);
 			memcpy(msg[0].buf, ibuf, 2);
@@ -375,6 +379,10 @@ static int dw2102_earda_i2c_transfer(struct i2c_adapter *adap, struct i2c_msg ms
 		case(DW2102_VOLTAGE_CTRL): {
 			u8 obuf[2];
 
+			if (msg[0].len < 1) {
+				ret = -EOPNOTSUPP;
+				goto unlock;
+			}
 			obuf[0] = 0x30;
 			obuf[1] = msg[0].buf[0];
 			dw210x_op_rw(d->udev, 0xb2, 0, 0,
-- 
2.34.1


