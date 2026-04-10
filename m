Return-Path: <linux-media+bounces-58476-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF1rO/WW2GkgfggAu9opvQ
	(envelope-from <linux-media+bounces-58476-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:21:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367D3D2B34
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B219A3033D35
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3228635E93C;
	Fri, 10 Apr 2026 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaQwidYS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC6F1A6815
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 06:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775801999; cv=none; b=hAxXYEGKKKc7Cey0n9gGcMyJaywyYV2BMeBqVo0b0uJ9TCMNABpMv2mc+iPGml6oVkq4+t9irruhQZTYZqs2yLjmsP1OcXIPvmvPLQnk4mqhCAneLzzdz16U+iQktkUh7sMh80ZYmRUEWatCWGP7g3XiOl4tl264uY7jK0wsQJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775801999; c=relaxed/simple;
	bh=uteCngcBgomh94j/RgZqF/Iifou20mU4SNo+FilxLJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9cF6+H7FEOeYKKHYQxkAXmKa4hzNLDxn/OUh21DgFMu5XHi6fB10S91jWQR0x8I10E3yaSlwS31eCsld0qYaVTPXO6ObOSIMZwPFChpS7S5xOHprzw2SrrFUeyv8Xq3r4UzCoJG/vxwMtkmgCG1jx3QtR6cPx/SXookKhARnC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaQwidYS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso1818467e87.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 23:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801996; x=1776406796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPNCh0ovqK7z3ZGC2coAiVqatbdlDpkW4jbL0xhRjwE=;
        b=FaQwidYSfYxbGRdaNLcnDxvPdgtzuS+aUnZukNeq8sJkE17NpPac4ZpHS9mkdkSNRf
         CQThlKat/1Xnnpg1gCz0CpORD7cRSSjENPfghOPc6KQdTEkzM4rZSb31PcXHlCOOwcKG
         17Nq0B0P4qign3ufP/zyAl3uvl9bmbgBmv7nzVum+xVdKBMuPzhJ4ZENbwBCT6XeQDmU
         uzXmAAlhQQJgZIz/FdrwhBByfEr2fyNrpMU1zoyVQ5MQUmjSezgo1LWysKjOgyWi0dPo
         LIaZ2iDig8Suk2mpXfRMZmNbTBYH4H4EocOaQX+AjsdwLSLnRiewU8luBEC7rcrmAmQw
         YBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801996; x=1776406796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZPNCh0ovqK7z3ZGC2coAiVqatbdlDpkW4jbL0xhRjwE=;
        b=HJgjxipWcmFTppzqAmJwi9DM8jrl+fK9IFn2+HSZMKMs1bhfYC6iX+3pRNx5xQLM+4
         nvviEfKcra27p7pZNRciaQz6BhF7aXX6OeXPy74CobP1SnqBtzukp372la2Nl79EBZsD
         twkhlxxR9Ht+4T1eM48Dzh4ynxg8eZByd6Jl3H7Ap9vzmrd4HPM4Wgthew+TgQ3nafeh
         YHBrSV8ujq58/4INKef40TuAfcj8O2lwntapblQDHiCR+BlMvA1K83Ohc7pAlD9fktgy
         AEyIzFFrViknf96yMlHxzFR8sMjqBMgtFzvDw61kv9WxP+j68Dzi7B/FP6fdfd06rkxC
         ajgg==
X-Gm-Message-State: AOJu0YwxpA6wWDy0YalqMIoKCF8F+PJzlybp8RRgfnTf5ZTbHuR+WRqO
	rrld9s+PK9piFHu64kJKMIKEjphHJRS1YD2C9LZeVF4xES/N6X5Rkrfy1bdPf0D0OpDuIA==
X-Gm-Gg: AeBDietqSyUrRmU0B4q0qRwsoq09RCRQhhmyM/9ypt6udEHiFKuF8Yxzqu+z+ey5/Ex
	JnvAqe+Ez6i+3luF8VCQ22Q6pm6yvfhC2psqrHTRvaNYLe74pEUdNcrzpS/595f3QKbJUENZL0e
	8wtIr1f7UiV6fTzU2vk4Yd4fUeI13FMKUosxDb8XuCga8ScIIY23J09M5Dk/VpWR8YsOKKr/Gjb
	/b89SPgmo5GqG9oWVJzjAHxPsym3IhHy8hG4fm0sSD69tuTnYs2wplCXnKmg4hbk4YSJEZ9bfT4
	NJZVA/zQeujVsFa2XPuHyd/Y7Q7dPoo5bPAq2K9XE8ZJMszKFjPtdJyHijU1H9V9RicrUm4TShB
	0kip2xZ7ufiKx+lKIfJPT8ywDxflOyVs5H35lALWJVcv2WI/1C0ilWbH7BkgzmjWqnhiBNLCfKM
	I2LieProLvIL3T6XmcMUX4qDAPHoRVv4vWiPC0o/I=
X-Received: by 2002:a05:6512:3e18:b0:5a2:a753:929c with SMTP id 2adb3069b0e04-5a3efb438e4mr597071e87.8.1775801995756;
        Thu, 09 Apr 2026 23:19:55 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8673dsm490506e87.15.2026.04.09.23.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:19:55 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v2 1/5] media: i2c: imx415: Add missing ADBIT1 register for 10/12-bit output
Date: Fri, 10 Apr 2026 09:19:40 +0300
Message-ID: <20260410061944.241480-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260410061944.241480-1-eagle.alexander923@gmail.com>
References: <20260410061944.241480-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58476-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,wolfvision.net,raspberrypi.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,wolfvision.net:email]
X-Rspamd-Queue-Id: 7367D3D2B34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing ADBIT1 register definition (0x3701) and initialise it
to 0 in the init sequence.
Set both ADBIT (0x3031) and ADBIT1 to the same value to comply with
the datasheet (Operating mode table, page 48): 0 for 10-bit mode,
1 for 12-bit mode.

Fixes: 14cd15e7a1e2 ("media: i2c: add imx415 cmos image sensor driver")
Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/imx415.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 0b424c17e880..507a8c557ff1 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -77,6 +77,7 @@
 #define IMX415_INCKSEL5		  CCI_REG8(0x311e)
 #define IMX415_DIG_CLP_MODE	  CCI_REG8(0x32c8)
 #define IMX415_WRJ_OPEN		  CCI_REG8(0x3390)
+#define IMX415_ADBIT1		  CCI_REG8(0x3701)
 #define IMX415_SENSOR_INFO	  CCI_REG16_LE(0x3f12)
 #define IMX415_SENSOR_INFO_MASK	  0xfff
 #define IMX415_CHIP_ID		  0x514
@@ -581,6 +582,7 @@ static const struct cci_reg_sequence imx415_init_table[] = {
 	{ IMX415_REVERSE, 0x00 },
 	/* use RAW 10-bit mode */
 	{ IMX415_ADBIT, 0x00 },
+	{ IMX415_ADBIT1, 0x00 },
 	{ IMX415_MDBIT, 0x00 },
 	/* output VSYNC on XVS and low on XHS */
 	{ IMX415_OUTSEL, 0x22 },
-- 
2.52.0


