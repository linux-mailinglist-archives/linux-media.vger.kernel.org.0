Return-Path: <linux-media+bounces-59039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DGOIbdh4mnI5QAAu9opvQ
	(envelope-from <linux-media+bounces-59039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:37:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 236EF41D310
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D208D3112845
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815F837107F;
	Fri, 17 Apr 2026 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDh9BjCn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A98353EE0
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443591; cv=none; b=J+V71rE61cW5SQJd8IIf+4RiDz4CNt+WsTO1r7VPFkLc48JbnTfjdZ1FeHdA5g1nyFHKSXjXlt9TWL0K6TDHOGvc2tMTwFv9gbKZczIX6zYaHwu5sL3CFokNYzO4SrBWqUonil+Lk/2cM2QZUTMEsdQEbPPw8mez7E/fMGQeo+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443591; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UE43K6z9ChnM26Q9MlizhzgbdRt+wmb2FYzw3JTsrlz7N+mH/hUGTcMJF/6jzr3IASTiVM5bn3BSpOl0r2Gb+s4C3hf8MqJTPItB2EM7saEkzCaCLQA9/cGROfw5BpfHBEk3q+NkXwfq67dsk402mTsN3KWbXOYrAENxKk3MdL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDh9BjCn; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c555f886dso1141719c88.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443588; x=1777048388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=mDh9BjCnf/w8BO1+JMrGkCDkZ783BuUbJzd8HDRs/jzlYQUsJZyesnoVJBgXU1hp+O
         j+LFV9+ajZspvucMIXFpz171eqU1Ugn1kDTE+7JyPceUttSAvwa3vh59eq5y54Vjx/2C
         6O+bL1vPGg4bBWNK8Bwtmpzsi1EssJJMadn9O58UNuIegM3m7mJrf3qOR0vgMM7nI6Uy
         7vxOjrYOMO+dOPyJv11FFdcmldNvIjEMoGlbrNgeVTX+vW3V552nLOyRddlLYmYKnjHo
         mzPYUu5LV4l8JAdLVgqvlQ6Wocc0uRyovHPo5VwcUGghBuvlF+QUeg3Ky8vkRka5oOlx
         CODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443588; x=1777048388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=OMtUZxFwfR8AdDmZbZf0cmhJD7E5Cy2EYrW7ubgruuhJNaKtnAT2fVV+0furpEgPuH
         gKjS4g+2SqoxdZgbXv/BwkxkwvsHA+ASM16KgxiT5d2TAhAUp1c1ovxdd16aIqF8T4Au
         renHLH+oaPii3zTnpSYLjvFbA1x5hRfR77VV+h8XqNKAgE5hsxdaaFYWBMad9npmKP9O
         ccfxav3FVKNGF94aCEKxP9Ru9Tej0BlPX8aDujH3Sf1kgCL2IxA0DuomaKYLyID/kKR7
         rrsPoKcgPQberl7Z+RNk17gvNiT2ixN6KzdokmOclm1d2BSPlhll4l41hLh9y8UMJqM5
         72xw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZKglvZRnZiUWKPwgLjIqwDJYtaszZbMVaBIdXtQgLcRYBO9gybzuif/0bysBovbYvwtfPU9UbQlZZ3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9AsvM1zsrFnXsB6oK1u8g97kPGg1K0PUgRSJRO58XKWBld/UI
	ixlIyNssAcn8PSDnMvcUL9a9VG+D1/saG3oTzHWTsK9MNUo/elvntOZu
X-Gm-Gg: AeBDievM8b6A8iqj2R+EAZIMPRSd3j+LQ6KvhAN0ySMQMxbHIyjAeNYBECLWAcw7mb0
	3lk+qT2O2ASZAIpN17/rrRPPQMLXjikmelPrrWsxT9z0+ulGT/IHHq4uV57BjlI3ZD65EeL+gTO
	9WHo05SsbGh8HAUzbzWNVZ8+iLYPG3VaGaW5qyLmumhmR5enTlxsd8MmuKwYT5gr5Qk/67BczfJ
	1Kv4+Arg2Szc1l19zAL1mTMYGP5wF8dG4EpDVI5Jvl+4MIo73LE8iG6IGB4M9S49r4+ndgShr41
	NMLFMVmHzRe3NJwO6fwOEhgtD7/dWALiKezX3CvLN64UyKTJRFbN6365Jup3O6huZVaB4WFCfFh
	otpCXmbEiYLZSicXOWXf3Tcwj/zFVnnQqmLZvhwco3T/Je5iNAvS+wp7EABiin6xrCFMkt3P5zv
	ud4zk2OYeWXoFrcraxqMQAdc0tS00HZpkBZAdVLnW3VwKUADra8agJkMFE7YlD23M+ijYpnQ==
X-Received: by 2002:a05:7022:eac8:b0:12c:2f8b:4c4d with SMTP id a92af1059eb24-12c73f7cbabmr2017351c88.15.1776443588111;
        Fri, 17 Apr 2026 09:33:08 -0700 (PDT)
Received: from TC-LAPTOP (23-93-157-142.fiber.dynamic.sonic.net. [23.93.157.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749dc86bsm3603777c88.8.2026.04.17.09.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:33:07 -0700 (PDT)
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
Subject: [PATCH v3 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Fri, 17 Apr 2026 09:32:51 -0700
Message-ID: <20260417163252.15603-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417163252.15603-1-tchatard@gmail.com>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59039-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 236EF41D310
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


