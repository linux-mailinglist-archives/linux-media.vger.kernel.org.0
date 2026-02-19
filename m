Return-Path: <linux-media+bounces-53093-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLalDQQOl2mTuAIAu9opvQ
	(envelope-from <linux-media+bounces-53093-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 14:20:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C9415EFD0
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 14:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B95B430055D8
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 13:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5A133DED1;
	Thu, 19 Feb 2026 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMwGukCS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F5433AD9A
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507194; cv=none; b=BMAG+kCASrTYMAeEf9x86WUgDcmrcTbVf2Yc7nuCITQQKCoICGbvCLQ1Bq5Oj45mYG/VE8XDbXy8w0Yrj/OfrMUoisB5UaXCjFRzIHMIYuFgpCz2mlGKfIOHqMJgyexHwVgxl06Tp+KsRxhVdeIWJRthM8MBnUGsmzUFtMHssgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507194; c=relaxed/simple;
	bh=1n7QnNREEWqtxmy2UuIy1kT1CYLpT9wN34gbv/UC4TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mnSBntW2B9bCLP5KRzpkO0vMGj5X9gOXNYOYpnA0AjZYhi/5pqzuU6+5dPyyASX03KbsTWZbrFHR5uF6lItu7Ls+2M7zckaonNbqgjj7Y9kfIy+Qob/sslsUwiPolSxj4DBC6YV03J4cxBHsMSbAxSMdJJr7iebKOs+nRPNE61M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMwGukCS; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8230c839409so851757b3a.3
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 05:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771507193; x=1772111993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w4gtcZRae443fCA96F0dM9Mnpc0OUWxhQU5X35Gc+78=;
        b=eMwGukCSEngKnEWtaf7/PIN0k4X0d+th0uXXAJTD1MZDzB3yAhAPATc6gpukA7JNuG
         6r4r+Z1V8D6eR6UtZTg52HeqLbll1nZgYOvTvxP7MVwO9xfmzMStgYLaQZiLaZAi8+lz
         E+23eF/LYbfzzg1IQbDKTHJKNCFMHiArkpMaB/hmPUKfZ2bl87zvzB7WVbsM6ehyFUsv
         NELYTRUmBaSByG52g89MoDVlJPkLryPCyT0GQUBe4yzUbErjMaiSKLQPKf2/1Xt0zNDd
         9+dH74Zjx2B8pZclSbXEZkwY6aGx7gKKsEgORg6klK4QmLfNQBsczYBrk7pi96JttTCi
         16JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771507193; x=1772111993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4gtcZRae443fCA96F0dM9Mnpc0OUWxhQU5X35Gc+78=;
        b=BcRt9YGNspk/nahrZUQGyQMqGfTTm4XBC1RD5lrXHlJzIZcZdtvTldBHwzc/eOv7wW
         GzEfovoc6khozpQ00hTLj4mmeA/vmxj/Ne49lM3OC1DdpFCVVhtIAoj/N1cnLeKwFDAb
         YXHAo6fGPCqR30X8167NyCwdSIQluT1P0syxdkivUhi5CYca6YZW92AY3pCr6+M/fjdt
         HmUike+84VP3KAXqN9ZbMnSsvfNmigPEKqGpOGoM3oD6VKGASNm9lhFU81YNtCaGpXO9
         lxxvb8OepaDid2NcsWEeqeonuFmmrOi2fC4IBMLW7FlIWGOrrjD3murqckUl81vNt9Rv
         qTUw==
X-Forwarded-Encrypted: i=1; AJvYcCWB2S+bCMoTYCaBESFqgYshqnGHzkN1RSCjQZcFOaMhm8036XSZ5rYg/pV/Xa8GfnY4dbMuOu1G+l1aug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWwdn1UO/2A1UYwYYkCP7eAuole+FjWsTq24JdmkrAI2d9JHl7
	F7pzUFc3rZKhiOXQKOzLCfBYuEmI1t9JsYSD9VSYjex5OsATL+ORVVA9
X-Gm-Gg: AZuq6aKTGIuEnkUscAQKD4sqiuyVWHsqxP3FzJKZkLCQxwvJrC/udYi80BFLuox3yxf
	b1l59ROpFb/v4TVHLySpc42sL/CYXo8zs/a1Ku7Gy5M62+e2a24bia2j5Etopq2N6srZuaHU0yb
	ROgYyU/ZgmlClWRgUCb4Ch6yRCuxQpIWj5641v++QYvH8Sd+GoxhGibnXQEs+gDYAjl5dEEzcFQ
	IexW2+u9SEIzjL+Oyua5paHfeOnhyOAYoAe4qLxxkCweW2b0h0PVdC6Zqf50cEkNn6exiHAyuUA
	xGbEMBK0GHoYnpcrqisTum5KZr0IPDLvTLzp1SXt/KkEUd5JxWso5ERF5Z7ihgSF933aPcNV2YW
	sgWDj96cUZLv8hdH3wG1kL5TRToORHfyJa/+h64rFfKS+wH827icduvKbENbjlKA/1Zc1p8Nyj+
	jNvs0LWiHRUEEF4dsjlDaAbXb5d/ILLWgLRTZJPbZVv4097Kln9W63l5pmp/jeNaL6FBGF16YBO
	pklBOkytFPLy7EY9lQQ
X-Received: by 2002:a05:6a00:369a:b0:824:a4c4:3b3a with SMTP id d2e1a72fcca58-82527488f85mr5874189b3a.7.1771507192807;
        Thu, 19 Feb 2026 05:19:52 -0800 (PST)
Received: from Nitro.iitbhu.local ([103.151.209.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a42688sm19464276b3a.21.2026.02.19.05.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 05:19:52 -0800 (PST)
From: Jayesh Puri <jayeshkpuri@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: Jayesh Puri <jayeshkpuri@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Modified uvc_driver
Date: Thu, 19 Feb 2026 18:48:11 +0530
Message-ID: <20260219131816.1930881-1-jayeshkpuri@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-53093-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jayeshkpuri@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60C9415EFD0
X-Rspamd-Action: no action

---
 Kconfig                            | 0
 drivers/media/usb/uvc/uvc_driver.c | 2 ++
 2 files changed, 2 insertions(+)
 mode change 100644 => 100755 Kconfig

diff --git a/Kconfig b/Kconfig
old mode 100644
new mode 100755
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index aa3e8d295e0f..cec117328ab2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2191,6 +2191,8 @@ static int uvc_probe(struct usb_interface *intf,
 		(const struct uvc_device_info *)id->driver_info;
 	int function;
 	int ret;
+	
+	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
 
 	/* Allocate memory for the device and initialize it. */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-- 
2.53.0


