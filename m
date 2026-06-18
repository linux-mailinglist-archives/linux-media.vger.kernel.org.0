Return-Path: <linux-media+bounces-65188-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K0JdNCXgM2pVHgYAu9opvQ
	(envelope-from <linux-media+bounces-65188-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:10:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C8A69FEFC
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:10:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B5a3hfJW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65188-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65188-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26C8D302D1BB
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2123F44FF;
	Thu, 18 Jun 2026 12:09:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB633E6DDB
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 12:09:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784598; cv=none; b=TcCbv0rTq+W6TZ4GrAMERedWUL4Ko+PXeSQYTlCVyRIvk8wqyK+7IFn49Oo8vCs4SSxMJFx3p0WHdUo6znIr/D8tsTd4DdaftTndtWcaNagOyxkMvPx8v9ZiZe0S4xYqoIRPtHTGEoBlIsjrq5id8XNasT9Yug3WCSaeGtf5gmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784598; c=relaxed/simple;
	bh=SfbOzbA3MKHsGeTbafSXSu5EYcsHWSO9YIZOKREiu/s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PXtzk8EGlwrDEvLNXoyq2EuxppXISO/53WX+iIIpEjUF/w7QhCsRA38O9bandsODyhhwthvLuobSKHFlMfRk6qnHcsdZYTzYMe4lDWzfs8Ltf94h/SrpiiBApyQQbDI72zln3so8PiTaWAHXS3SejtWYnXeo72a+Sga6y4INHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5a3hfJW; arc=none smtp.client-ip=209.85.167.43
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ad49c55ce1so755008e87.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781784595; x=1782389395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T++eRh22ZRqvDFRoIZdWaDjQ3HSUiMobAguihqXNESA=;
        b=B5a3hfJWKJDFJ2p6j1ehiBdmTPQRxwGGaUu27s9xK0vsuQ7AaJuzGzmEO9XIfB+9T5
         saF4wJC+2qw+P8LxmUNnOaayuGe1nXsD11vlcZ09/97Ngh43ityPUtM6rL7fFBBvp4jA
         Mfa5SYnQCPoU+AaJ5H2uE+VxhU03PfflNqN7EWUXZSb1dj6Rr9NV7/0IgLSJZv7ZAKSz
         0wCHZzvBCajG3BCsuXSe1ViphaL53LaR/4RbHaOrVZKnvYWImKu8lS8mX4dFVePQWm86
         FL7+MDV+3v5dsiU4R/C/zpxXlLSRmmlFUVI2iJg1OQXdihwbjEsZ2fNCQhRFLgXu2uV/
         jtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784595; x=1782389395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T++eRh22ZRqvDFRoIZdWaDjQ3HSUiMobAguihqXNESA=;
        b=XI5Rjc7c/FNt8EkxIROYze10RyaKaa2mIxnY1M3wyMRHOCYPEdCWkwa6YkQPID6CCE
         cFDlDlgeV74UtoLfK1JMmAuHjrnETMOwNhdjMR5PsLpCq8Q09FX3K4ZJnxyCnjpliqbn
         URfDP07NcY/6+Z/T43Jx603/N7Ko+rcl7eqPLqmEdIZHZj4Ucf6xgC9umqD9YDlPwvlP
         QDsvxtirkHWE2XMCShiIAqVZveu9qxAcLvbqLcCAR1FcCUL3joS+p2hfu5vTzUAKHh7p
         +m5x9cVLVqdbosD8b3Sw4kmTzQV7Q+6NgNnyohUJfu5DU1YAAa9JqK4KAd2emnH69yiO
         fa7g==
X-Forwarded-Encrypted: i=1; AFNElJ/BM82iPGFPi3Wk+Ye1nYJ9oPpR+h93hQ8LBpIr56We3OJLTwq1nQAxf1dIMUvBHfHKvKgm8RYNl5Tcbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyIzntWFZg9b6nb8gSiXwltZxuEFyB+hZF0jHhEZiSTzRfTlYK
	nlr3N9jlHHYCQ2QzSNbwww2wtchqyYDtGX5vYPtoaXVP5I5dpDJHxTc6
X-Gm-Gg: AfdE7cnA4CWqowTKXqQval/vZ5TVCzBuNm2B8Jh92mT6IjAqTZB2nSsONPTKZynPD5W
	2bWAlV4Nl5zETH7/ii+rS9FyvrMi219DeJ3kFRtPNPC1x7CAkSU/GZjk6XY6uPQn50dLFSvpYAQ
	jmsdbgeSNcCZetxK+V+0Kjvhgi/bgBomYbcN/KvQiU1UeBiSY0CH19KDJpHy06XGM2ndmI2Ikca
	/A/4dgeTlVy7i9qxn+j0bXMOkgFBXbjikIEZMfVQfsNW7H+MKx3dFUSIvr9SeO0EN0/KOWJ67Us
	Au5MB0ItYFPN76xMplm1WpcEUSp3ScLv5au5L6ohtSvdUObXP/Owd4qbYFRYDhxWi4X3NDD3/Vj
	sJ7b+VdBhYeuoyaAGw1sFsYNk/UqIvxM78tmViBfjvJ7VexcCkcZ37vJcK8q1EuuuIktqCiCgo4
	bYhhbvWsKZSSQ1BZY1DXsuy6JUp3PZm9PwMcY/xtw5
X-Received: by 2002:a05:6512:3993:b0:5aa:6b70:325b with SMTP id 2adb3069b0e04-5ad46fcbe46mr2559870e87.7.1781784594852;
        Thu, 18 Jun 2026 05:09:54 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-399731bc028sm10485911fa.5.2026.06.18.05.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:09:54 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] staging: media: atomisp: prefer __aligned over __attribute__((aligned))
Date: Thu, 18 Jun 2026 15:09:51 +0300
Message-Id: <20260618120951.42956-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65188-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:igorpetindev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66C8A69FEFC

Replace the GCC-specific __attribute__((aligned(a))) with the standard
__aligned(a) macro to match the kernel coding style.

The checkpatch.pl error about complex macro values is a false positive
here, as enclosing the macro expansion in parentheses breaks declaration
syntax.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_include/platform_support.h   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
index 473d8d4fb9ba..9aa445c45e9f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
@@ -20,6 +20,6 @@
 #define UINT32_MAX UINT_MAX
 #define UCHAR_MAX  (255)
 
-#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
+#define CSS_ALIGN(d, a) d __aligned(a)
 
 #endif /* __PLATFORM_SUPPORT_H_INCLUDED__ */
-- 
2.34.1


