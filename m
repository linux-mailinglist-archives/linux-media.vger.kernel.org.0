Return-Path: <linux-media+bounces-60120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xjAYEwh59GmLBgIAu9opvQ
	(envelope-from <linux-media+bounces-60120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 11:57:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DA14AB6F4
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 11:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F50F30146B6
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 09:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAC7383C96;
	Fri,  1 May 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMqGUJlu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01696347514
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629440; cv=none; b=HebNX323gpj+TXt34fZp9XVwdX/2ZT6KGINL1+Ibd+WrmljkqGHDJaGZ2AZVaFb4ZeLwFmqQ8ZgRCCGnsfZAQx8JBW5i9xV8RhHOVyrdXV+gBZ32G325C/MxlWVnX0dzUzYWNnPikKIl12+xfP8EGxUH6/YAqdsIbFKz/yURMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629440; c=relaxed/simple;
	bh=XL4uV6GkgD4RcOl+wpvrwdX7d246PTROEpd1HxkSjpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d1ByluZEFiGxg7wY4vtyrCWvQOWennim/8wU4zSQL4gRF4dVmIxj9sNt18am65HGwKpG3M4tPVNweiKltMpRKFZHCYkfTDReUocpX+fyNt8G+Jd9P34gI/uWG1sbdj1uFawPlnLYxjWPhairaLEoeO5ileFjnelwNNd4lvqmrkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMqGUJlu; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so689138a12.0
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 02:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629437; x=1778234237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJvh/XpegIBYrHOJk7E96WpmL8EapMHXqu052w960x0=;
        b=pMqGUJlu25T4TEHj0avnhGmcW8vNRkmGZL1ndvRnDk/PNnWBUWCp+Mklf0G3Qa636m
         TBUdiVywJ/VJnQDd7KeX0HCHT3MwNjPATvwH2dzcxllcKjqyZIwpPNFkSgT0B565Q6D/
         GL83D1bh3ZL6/ESrcMPE7+EpiVVdow4KwLwytPwqEKwvOxu12ahZNeptR53zMI32VoQo
         pJf1/H0RHBC16MmHiF25JpghprMHTTvjCO9Kf7fWYhxDfQRowKjKdUl0MdaTks5MDazw
         wadSOViqfHPgHnXbyfvkrIYC5Z6CqFGvs5lP338MaFtN38ATlR3J3L6/nLPnJL15Ob1P
         43Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629437; x=1778234237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJvh/XpegIBYrHOJk7E96WpmL8EapMHXqu052w960x0=;
        b=FEOrmIcpzwAoA++MXIZR6XPf+cbF/wGEduAVQwuMkafnQN2Tvoeb6pBjY7TMMjfflU
         hfULV8RlWT82i60/IqEu1UQ3dqOACeXFw/GFni/enuEgfyWF0lvQYxljKVWgdaaXEZg+
         YGjNZdUc7+oNKiXoKfjhlkPyA5UuEUkC85dXTu2KAdyHCF46ef+T7f7MwXIqLSRVEOGK
         fjIFTqxf/QQT676J/aDyPr9RP1cIX/cv5uDMh7PVdlJGVtcsKJGCvwmEClKjE1mFaIY+
         iIKayZ5dgZoX7xLLOoII0oSg3ky27rfrT/Yl429qzVremqHYy0E/ptiQKnDFLJOCZhfl
         RqIw==
X-Forwarded-Encrypted: i=1; AFNElJ+VyiGutqTgEc++jl1xS8R7E9qYUocX9O2lYXVu9d1TVFfA/IW1xyASs7VLBfbbftZQh4ADQdlBBk8QuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwoOkmyb9tBsFebyx49mJP4A4eAcGpFlNs9iiDJ+J1FOFnYXel
	DOlkmICJbp7cKUwEODFBTUetexVflVsERvLEldeI+/IL7ewFkq//yI+p
X-Gm-Gg: AeBDieuR7BP9i4gW9B7on5soD5NSnQ8pCVf6S/ntvdBy4yDg6tgusHAnIwRGNNYgIko
	aCEnsuXeQC0f8rpi8IubbMytufpBfGLtzTAZ9k/5840ZVLijcQWmqYWrNX32rMrjUajR2gB73k9
	8DF8W/K5j5Ti0mzUE0tjzjk++XnedN0SOgcCvPWsOXHMgL1chMCN/IGZQlV+GmPL+YlgbsSXhML
	03mZNgVzfjZqOBdsQZvtetHZUz3zxXC1unf9d39l3BU8THxm5w3jIDWLLsZbUgJLCQgrkE7yEnE
	tnir2bPWfO3eM+inv7H+KdIhq6CfWjlgYBZ3nwROKU5/+KbD+a842uIA48I6HFegSC+miPRlX2w
	MU4wuG0pKewfc8ew2S0u8T2ji/d+iANKm6APIr0DY/ARpr2qLbTnwON5usfKabUwulTNIrTltsk
	BBP8dP+rE8GqYgWA==
X-Received: by 2002:a05:6a20:6a0b:b0:3a2:c683:fa84 with SMTP id adf61e73a8af0-3a3cf77ba41mr7322916637.27.1777629436989;
        Fri, 01 May 2026 02:57:16 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:16 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/4] fix and improve for Hi846
Date: Fri,  1 May 2026 17:54:29 +0800
Message-ID: <20260501095433.1609309-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D1DA14AB6F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60120-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

This series fixes a error blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (4):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 226 +++++++++++++++---
 2 files changed, 190 insertions(+), 38 deletions(-)

-- 
2.54.0


