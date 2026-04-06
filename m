Return-Path: <linux-media+bounces-58080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Wb6rNTs002n5fgcAu9opvQ
	(envelope-from <linux-media+bounces-58080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 06:19:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0433A1652
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 06:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E27DC3007CAB
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 04:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2412030EF86;
	Mon,  6 Apr 2026 04:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="o1O2JabZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C2846A
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 04:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775449140; cv=none; b=XxXSwzUEJSMVlYULz21RGoeLiVc453eLx5vKgCWSYFLvPDr7r1CzQkcJlulT88w4lGVIKR0/7YdZE+ChltM7hwrtfnfJwenC7F4wCSg/sczOcdeCUMzYTLglz63lG3mI2UHn/XCcS53Mb3nQqRYhNi6mWRpCogD4WMtK72RNaEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775449140; c=relaxed/simple;
	bh=3s8bk9KnaLuV+7kJExYmap+Ucqm9bhquPkBexladMyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUVnuF5CbJ6V/RkG+COdB707ctdDKShe5zChXOjef82l766f40KE8+HqaP+ZhykXhhsqABueouefuRRhQZyrlsNZvn8l98ESkxq9dcwgs+mOzinqokbe5vfu+MiXPb/yZFcRReKPSCmlBGvK74GQuDBCopedUDnJ0KIErz9PVXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=o1O2JabZ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 024D93F204
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 04:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1775448639;
	bh=Klc+u+ZDu0JSB7dLL6k8RFjVHhX/6N8ZJzeamF8FEy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=o1O2JabZBu74y5mJghAT3svrd1p5mZBdtshUXevovlwyRcNqMW7+6TnPhlUUFJoKM
	 IdZkMa/UpD44SrlWAvVltreAmtFU4xxJK8IAHmicfw2aFW/LtpRLnqH/yPACPPJz90
	 CRoSqYws3G/8y+L1fgweeyWxMZy7nTrR+b6u9S30AsTd+S/zJSjOl6zRXRmMksLDIq
	 VLW7wIAkBQqmt0Jyz8Qmg+EBHP3x5RXf8z5JRYb2x0tv8+SQXhE7wnsntYQlh7Fp7v
	 zYCHXfMNsTYm87wlKes8v1RHI/fmwJOjccW1Qq8G0uD6PasfAKA3Z5nUzRnhNafSIB
	 P/+Va3JDot+fhuEELhG+BGHiAhDMURigIEUgvyWmHgDIzTxqVtkpGIkA3PDU7ZaBpJ
	 S2QR4povVeZrAavoGN9IENnbAGiLdaOabM6CrJBBTj5kLpgvEftCMPKRD5/Yvd2v0D
	 /c49+Ad8laAAA7TlqjRnLR6aKd2qFB+7gQ1Ix0X2wd1Jg5hI5SCFfPk14nADdgL52d
	 Y0XnSbiPDOupTE/wgANJt+t1M1+PxYAa4jyZJa6dEKtB3y7773jM/tADOqKOPlApO8
	 c0fiqoXhqWrUnxQg7ZmM8ch7Cbn6xNWJXIeUkheYEpkmlqKnlsfU9Z4+gT6znaYha3
	 Vs2YmjxfPhgnTBpRGLdFFAwM=
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d6061bd722so284743285a.3
        for <linux-media@vger.kernel.org>; Sun, 05 Apr 2026 21:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775448638; x=1776053438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Klc+u+ZDu0JSB7dLL6k8RFjVHhX/6N8ZJzeamF8FEy0=;
        b=crkRXoN2GAYxos1GWAHAY4hw7Kv1Oq0amcWgW/3AQeMkdn63UQGwmMbbhyFMt/fiJL
         TeFH9ro7xOxGVRMUCL6mtv9w7OHojpX/mZ3klgNsxLLiIYdiMOhraTkNQysqyeF10auH
         9MNfk26nfUIBCXjpvaH3x9E7za5RsfWRJnFv2eW4af4I/Z6Y/Q8+mfqBwEz74ADb2C0T
         DvTvyOfNL5coovt8Ne4eztSOcYUIsoZgNWLu8fTqj+B7joyo79A9VCVlT07Fxg7whZuh
         qnKPWMIvTWpB5BkmEn5hMeN8964eF38LSQgbjxC3qp/TgFHEVG0h7v5kr7+ebGMn35q4
         gTnQ==
X-Gm-Message-State: AOJu0Yx7OTBFPLmnp0vlSaDca3I0eQAP16r05GFbPne99Y9SDOMlOsN/
	VFOlp8a8XrB4/SI3hGFLTHxy1x/85JZqHzptP3IbgBopjVTLctyDXaBs+Ck1BXr70cybLF/Axbe
	mRg4FLutVo7VPNVK+5tQYd0dVIkxfjO9teAPLoCImdEAOq+WPsrONVK9dQabwP/0PbdjWTC0ald
	XH8HqckqQE70eu
X-Gm-Gg: AeBDiesVNWxoHh1jE89Uyo9g8xomxeed/7Z+2sdP3OHfZzuiI+ty+l9PO1i0fysgxT0
	9FWPo+7zE3ViIQLr1k5v/rPVkt4sXvfg/98qy/yVtOb+T2qNQskn7l2KATvO9wpksVzheRZ0xod
	JKtOP74EBH4xhWEOF2HSP8mG6b1rGKwFrmM5ao5R25xYICKZhv/rdunao1nsRbVotELz9xrR5Ni
	NGI7MgFCnTkWvC3YssS3olDn2mHYPbplc77FcOZDCjidttc3yb9yJLi7SPL+HdvpuQ+DrydaZGv
	3dKx9xH3z/5eZR0dRTaXWYrfS2OFtT3Mn451agVB6CjrkSVj+kg92PD9i2Ude6BkjgpQnmA79UF
	uWQzy06Waixq7SZ7dfvPQZ06EmCQhjUMphg/UfJoANFiHRYGysr6HpCJhm/p2Vq9REwY5reoL+q
	cATMm8
X-Received: by 2002:a05:620a:6ccc:b0:8cf:e1c9:b286 with SMTP id af79cd13be357-8d41bbd7470mr1694688085a.2.1775448637726;
        Sun, 05 Apr 2026 21:10:37 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccc:b0:8cf:e1c9:b286 with SMTP id af79cd13be357-8d41bbd7470mr1694685585a.2.1775448637243;
        Sun, 05 Apr 2026 21:10:37 -0700 (PDT)
Received: from localhost.localdomain (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d40495cd32sm755296685a.22.2026.04.05.21.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 21:10:36 -0700 (PDT)
From: Changwei Zou <changwei.zou@canonical.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	changwei.zou@canonical.com
Subject: [PATCH] media: i2c: ov5645: Correct Y_OFFSET value at 2592x1944 resolution
Date: Mon,  6 Apr 2026 14:10:04 +1000
Message-ID: <20260406041004.1398874-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58080-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changwei.zou@canonical.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[canonical.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2F0433A1652
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Y_OFFSET register at (0x3812, 0x3813) was set to 6,
which caused the image height to be slightly incorrect at 2592x1944 resolution.

This patch changes the value from 6 to 4, ensuring the correct image height.

height = (Y_ADDR_END - Y_OFFSET * 2 - Y_ADDR_START) + 1
       = (val(0x3806, 0x3807) - val(0x3812, 0x3813) * 2 - val(0x3802, 0x3803)) + 1
       = (0x079F - 4 * 2 - 0) + 1
       = (1951 - 8 - 0) + 1
       = 1943 + 1
       = 1944

Signed-off-by: Changwei Zou <changwei.zou@canonical.com>
---
 drivers/media/i2c/ov5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index b10d408034a1..0af1b12c0989 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -479,7 +479,7 @@ static const struct reg_value ov5645_setting_full[] = {
 	{ 0x380d, 0x1c },
 	{ 0x380e, 0x07 },
 	{ 0x380f, 0xb0 },
-	{ 0x3813, 0x06 },
+	{ 0x3813, 0x04 },
 	{ 0x3814, 0x11 },
 	{ 0x3815, 0x11 },
 	{ 0x3820, 0x47 },
-- 
2.43.0


