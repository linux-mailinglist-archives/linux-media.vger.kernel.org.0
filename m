Return-Path: <linux-media+bounces-59254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLQUM8gA6GlJEAIAu9opvQ
	(envelope-from <linux-media+bounces-59254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:57:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C4D440594
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E004D30BFD9B
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3BF3AA514;
	Tue, 21 Apr 2026 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbUvLWtU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7B23A9618
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 22:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811964; cv=none; b=aJEAR7nbQqmw1y7m/Q/hey59EUagbkX8S9g8gPgM7yn81gDRqUvFRzT0ZBX1TgEbKwSBXsIB643rNjSZvdrPWU0oxttBLoI4fUYgJ+z1AXRleAbCf7dkTJ8klXR9dNqMqEE7XyFuCtX3hZOi58JGuA0dP1BwoWM3J/uFx1ywbt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811964; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWSzYjoUcOp+pAhuOTR4nFYBrA9vM2xXeE491/HjrF0gpzuqyhED0LWateymUIu4DfHNfdvkbEIXDeZYbH46B9mxpHKeTkUlQd8/cJP1J+TRS2tQpbYaf3XZYM4oPL8+rQmD3QBk2onX0gML0dt+w1vH3FBthyb/MI0dsz1V/Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbUvLWtU; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c8ccc7755so3737804c88.0
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 15:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811960; x=1777416760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=SbUvLWtUSO2m58+nCCX+zpd8ndtOXOWe8ks3LaMcZBaghswgkAyp0JZj7s1rtqGhfK
         Adeo43KiLaG+Z+ca1VM1my23j3YY3Sjs00BZXI4+jSKGAfgwYCCCXY5uS0kRyYVrsbAR
         U/bEi/dp3I8+ic2+SHP8imXNwdOdFQwJEC2of1QHZc/E+CpspROEYnuoNApJVeFGToEW
         H5HhrpJrXnACswTJVS4RdJjlaPzg5oy70pNzDO0vLDwTQVveNrPxN2Lz9mYqpWPo87b3
         NQtt2f/Et2qvrlTkAQ5BoveS/ENdn7l0TcdeAi75YnUFgG6LIGaDU3tyymyXd0ZzL1yT
         ePCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811960; x=1777416760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=I7y3b+qX2EoFfav2HpVFEBGBxVDnc3RhDpgDBAP6F6d8jqUsud8eIIXEOE4vTzCoBl
         8NbOQaKQbIzEPZ6goyl5eENOOjSv0nGFrWnD/fLhwutTYnk2P6UoOa/KoqhfMTnzrxCX
         nSv7Rvg3Arg7WNjr2nnazg4G1j335gzdFQEwmUOfwYK7hT+C8iJw8yWnHHKCV1oh3ET7
         sgj3mgKzqVL+c+7gA4uJYEnAmYezF8RmU0l/V+wlG2SowAWa88/J6Cyim/QxxaABzjke
         fJCgsq6Qnq3W3Dn8FA9QQuhsuOjOPzXVWTyFgXTcCxGWpdIS0wFi9vfCk+dgbrD/GbJX
         4gQA==
X-Forwarded-Encrypted: i=1; AFNElJ8XJg1cED3SjHAYk8hyyR46UrdvZIFlo/f0iAOJJE27gRNkmDKp1YGmS9z3lNDXnlf8Zd5zb6OC0Zlliw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7t51p80mFbVGcMSQDTLV7+MlGMIguN5BSnWxtqSzxFPgm7l1Q
	qu8vzP7Ws5XYznkhI+xpSLFGv0t9Cz+EMcgZX50bNOm+34r5yBDgF2XgoiqYDIprBiU=
X-Gm-Gg: AeBDiesql17jzIKVcODoUAzeBJnNuJjqqs0uYZ10AQ+HMZVZgLJGB+U1d7oNcR3x4q6
	kZhdEri+lA9u+S2mkk94wBKPIcJmacOu6BMFvNjxBKwBNEACGzjfP/0PPmB0LoigRL1Afgxgloz
	sggeWGH6xfzZ0DEA+nIolgftoVRMZHx8KOJyrIh9a4rvS1lDXUAlwsj3VsbrZfAdGUxm81WEval
	Fjt07vKrCTYM+2jgSS5kFKl4HN/W9+9khRpCLwgbnmmC0qMZ9JeypAvW70QCHfZ0YfJ37rp507F
	XHJCOIDly+o7ecalw8RjrSjBkUF+jx/ubE0iyut4kYG71dFGml+IeC4e8Hl9lVW4dKS/bTuyhS0
	VP878kprSJOYUF36SHE9iLxFSiN/h2643CNVGn75HRaU2l3/Afr/quJoTmUBlAVVOPaQJKMO61S
	b6zIBRrMaZnwLQo1rxOebuGFS8FChb1wwv
X-Received: by 2002:a05:7301:1f17:b0:2ea:b975:3db1 with SMTP id 5a478bee46e88-2eab9753fd9mr749690eec.23.1776811959862;
        Tue, 21 Apr 2026 15:52:39 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:39 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v4 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Tue, 21 Apr 2026 15:52:16 -0700
Message-ID: <20260421225217.12472-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421225217.12472-1-tchatard@gmail.com>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59254-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 84C4D440594
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..f51749d0f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.51.0


