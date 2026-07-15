Return-Path: <linux-media+bounces-67618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Yg+LvUZV2q2FQEAu9opvQ
	(envelope-from <linux-media+bounces-67618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:26:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E1375AAA4
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:26:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qj3rcuYH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67618-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67618-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CDBD302445E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894F63B47F4;
	Wed, 15 Jul 2026 05:26:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D97D3B3BF3
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 05:26:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093171; cv=none; b=MDN7gD/yJASiEdTf4Ryb1GAJcVFb+FgT9ahsMAYoDUJdleFcLcvLRmmzvfux4Btx8qgLRrIzvaCFobpw4Wkn5f5kazw/3nAIX3Nr54EIBDYUnHNHsox1WQFfk0aqsg+1Oqsseb3gwuxAwGa9iG9kt5B4Se6w2NSUGpQG93bepM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093171; c=relaxed/simple;
	bh=e50auPVBSYp+zh5QQtBYOWikwJBXIX/ory+C1siRYls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzQ5/mQeLodSa4Npfppky0uKotdb9xMx5sFJ78iEexNkZ9olvojMptmq/wWbBptqygvP5/Jy9SYMlM9xAlrCm8tUZspk5JFP6smPkOBH8gHJFS09aW9lSzKVIDduJOtl0++WTwD2syL7FUM7b/mIwYw9NKgPKROnFe0WwM2ivuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qj3rcuYH; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c564ed4dso3664855e9.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 22:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784093168; x=1784697968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/g7VD1QoXW2WdCPMiJ8z9UXoHJaiBqtkLX+/3dRHoc=;
        b=qj3rcuYHxSEa/FgHXGrxs/F9kOWxWniK4GHJSqXlEhkLOtYAuCYslOB+mfhhFuqK6k
         pR0u7K2rb96hJhapIAH2kJ7TdR931UGkmvVjX8VnbPe60eKTwSUw8XsdHxreq2Tny+O1
         usOO3IzZoI/O3aOOoBjFwM7ZxKF2UUB/kqI01CBtqfaDVGTzi/Hy621XaZz6G73LqfpR
         oPASV0YmNuHEb/3lJlj9CKVvdrvqBShYaVLFqVzcso9LKi06fzRqNMA44TKbBk1cprWp
         Pt19PjQZSSg2yGkymujelxbOwOD2TI7Ev+zCnDIaAhi7dYj+094E/fJPy0AZy0IQSByN
         GyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093168; x=1784697968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/g7VD1QoXW2WdCPMiJ8z9UXoHJaiBqtkLX+/3dRHoc=;
        b=P/5CtLCGGAa7Ca18VpH7BHe7c0o0Eu5+cZ1eF6ed11TFE8Ejdx6FWX6A0iLnj4Vfra
         O3o26It/9NWTuuBWitW0CfT5PaKESAG4SXnI3Khv2+LmVHANPm7kD//8SW5HNtycYcYR
         DJuYgdk53gvK+3SaG0iF36WiCgVZ50z3sk6cIWKRD29Zb4NGMvxLw6ItYpiRbBUP70aM
         irtjYh5Dta8iqVKdHX8V4CY9UoJigi14EjziyRKxrstQwrVUqEGydJsizROXyIhjt47N
         EqkGgx2+RH6NN9pt6NIhvCMp5objkJpoXkZdYchrd80u795fPzXSgnDn8UKLJBKrh+oO
         3q4g==
X-Forwarded-Encrypted: i=1; AHgh+RqyC90lnHUYfZ/nIU1/aZaO1tTPOdyB2TUx/5h3Mi9PqXvA7TXw8VzTcFuGBs6BCsmujDuwYaS+F7g7BA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm8T2mWXu0r75HSRq3z5MhhOJ0eUnnDoAg8paO8jMlz0BipW6e
	MBdBKwCnay7Q1bQ+gfMnuBTNyQO3Qpe6oueR/2aWfKQ7Dm78f2BlpWoB
X-Gm-Gg: AfdE7cngutk5UwLx8114Y26ZtMx+9ZbJOjyf65I4gIgGwL5zwow3W02h1Z81+paJIfB
	X8fip2P7+jIMod/zU2vS8z0181tbazlXMrDbzkxDALAudYe1BQnEaGc2+VJ1W0xtWBOXte1gH3f
	K78hI7XBwbdPQlJxEX/tVHTcZ24aqA79EuB1aHcoaSQXC5RnBAh7k/lGe4M2fhPmXfSjRF6f1bo
	ofIrRmmF/5Sn/dJ7SuF/1Xb0H3+u++uoPy13AQL1Uv2WpLG3vCy4cIyJgVYHmRpQ4XpzCrDV7cj
	suROUNUxtN4VSSk3MzlU1hPWwTRWArw9oWUivzd8mhunT+0n3pJWRh4DdNtfU2ge67BS4lmUbSa
	V1hkIeZfrNlN2oMBSZBCwfxC24tKjfxZdqRWEzAJ3JZ1AGTED6LTufwSPEfdefyLsRC6qLqWpk3
	jkPYyemItA/DOfeomNkf1PRglDVaDKQQtUz/1gusjcmfFkHv2p3Sfa4w4yvlFTiiaebV+sdHEfN
	hKYegzr60oVHZzAvtpPTv+T7efx0is7
X-Received: by 2002:adf:e19a:0:b0:475:1f75:b7f9 with SMTP id ffacd0b85a97d-47f2da6f920mr11304178f8f.0.1784093167657;
        Tue, 14 Jul 2026 22:26:07 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B883700A9E699EB87FB5BDB.dsl.pool.telekom.hu. [2001:4c4e:1b88:3700:a9e6:99eb:87fb:5bdb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm13003669f8f.27.2026.07.14.22.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:26:06 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [RFC PATCH 0/2] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed, 15 Jul 2026 07:19:37 +0200
Message-ID: <20260715051939.64652-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,collabora.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67618-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.osipenko@collabora.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:kernel@collabora.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:royalnet026@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[royalnet026@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[royalnet026@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27E1375AAA4

This series adds audio capture support to the Synopsys DesignWare HDMI
RX driver, which currently handles video only. The controller already
extracts the audio stream embedded in the incoming HDMI signal and can
feed it to an on-SoC I2S interface.

Patch 1 documents #sound-dai-cells in the binding. Patch 2 registers
the generic hdmi-codec as a child device of the controller so that a
simple-audio-card in the device tree can bind the HDMI RX audio DAI.
The audio sample rate is recovered from the ACR N/CTS values together
with the measured TMDS character rate, and a periodic worker keeps the
local audio reference clock locked to the source by nudging it in small
ppm steps to hold the audio FIFO fill level near its target, avoiding
FIFO under/overflow and dropped samples.

Tested on an Orange Pi 5 Plus (RK3588, i2s7_8ch as the capture DAI)
with several HDMI sources: stable capture at 44.1 kHz and 48 kHz,
sample rate switching, long recordings with no drift-related drops, and
live A/V monitoring alongside the existing video capture.

Sent as RFC to ask whether this is the preferred shape for the RX
driver: the hdmi-codec child + DT sound card plumbing follows the
pattern used on the TX side by dw-hdmi. The board-side DT changes
(enabling the I2S interface and adding the sound card) are not part of
this series and would go through the SoC tree separately.

Igor Paunovic (2):
  dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
  media: synopsys: hdmirx: add HDMI audio capture support

 .../bindings/media/snps,dw-hdmi-rx.yaml       |   7 +
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 244 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 3 files changed, 259 insertions(+)

--
2.53.0


