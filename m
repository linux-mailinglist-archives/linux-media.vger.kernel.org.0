Return-Path: <linux-media+bounces-56902-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NIdNXHXwmllmgQAu9opvQ
	(envelope-from <linux-media+bounces-56902-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:26:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 180ED31ACC3
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C51C030107ED
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D3039656C;
	Tue, 24 Mar 2026 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="jb+oSsCR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09317399036
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376611; cv=none; b=f6yDb9vWj1Sic8YRQgn9l3dc0D20aEZUTGl/9hWQ1oDbVEQxPSEuY4hcKJs5vOB4pbgk276zDEiqnVzPh+SkzBx+7XMqjlncsqST5oxz8d9y50thV2nEKL4WtvF6OSBGon8wsaHdut7jGSCq5+NSZC5QiDkPxkJTLsIDTYiHAEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376611; c=relaxed/simple;
	bh=AEVjva8P/Xdwmg6zJOX7/T+MU5ZwYaMSOJurUPJg95c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pjy39/Ys8fMbQlXvqM/uOK514nUC+re8c/GQPLnvJWSUHiUIZ5K/VgODbsGmc/JEnAJlclrgrQH/eeAn7oBw/SsiCgxyUrwcvzLgx9nhHazTD89uHHNYI9N0MSuSwnKxmZHFpN+g6kMExheSZZ2if80STBxUQA8pNmI/RvLPy4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=jb+oSsCR; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79885f4a8ffso49174247b3.3
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 11:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1774376609; x=1774981409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a650OWPXOzRLT6tqPHlRDvapR23NLdEb0yDg12zExfI=;
        b=jb+oSsCRhy9RPt8ArPfF3vLQlQ/hvsW9kSYJJH0k0Ond/dYXF9WWZMbaUd/3Ay00aS
         oVJTbM7MnC6lpLjmRRmnjNwyRCDmtyWHJxBut/sGfIdKSjscAAnxtPqnsKzKqELBB11k
         MvyVirmQLozyjmIaOPptDZ2NzuO+fAmbIJuo3NR66niIM2/NCxbyLPqd6QhMk/Med8px
         pR/UQP+x8QgNWJkypIHSWhNAXrSDXGFojWX/ZuQxwxd25l2EmWLF0WakCBfRu72ly29P
         5yK4ZgIA+SX0Vh8bEVAFYkAzoyqLVPe1cnvZdWQ/vJTl3bud/zj8OZou6a3xRg94EpEa
         u9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376609; x=1774981409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a650OWPXOzRLT6tqPHlRDvapR23NLdEb0yDg12zExfI=;
        b=jUhkovBnc/dZhMI8N0sJY6ugufR4ILJUmyz2VI76d2xDYgbLrjkDxZD5xqfQ5Np/r0
         p0SlX72B+ZGumadSXe+v2R4UjiRVPXX9/R0DHtjNN3co/LE8a80gfxswc/aGyv9zw4U3
         ZXi6iH5hW7Sn/EnvuTOj4EUdRG1YXAoBcvJMH1VUrDQXgUj+e7wcKoyMibyqUx9txkZZ
         kSK9QkGm+9CA3Hu8Iv/4yldXSR9p7jaJfTO5wAtJ9uUnOG9wGQiw1z8rmwxTyviHMWnc
         khBTXL8sCWR8J7HPFlrK56MDFXSS2DRntbeHAAmXStFqVAuyCL1QtijK3KUR9leHbpj8
         RS5w==
X-Gm-Message-State: AOJu0YwrFnuHDBZ8EkQnA9AB0gTlOoXum4tVKJ1TLJ/AbCed8mOwHsJ8
	ZEWxhY6E90BFPHnQzdeaDuRZIeDvuND9ReWd/7xXh8otf2uF8P24Q/9AaniGsDnu9b7X1gbdaxC
	UP7YvXzE=
X-Gm-Gg: ATEYQzxpAwChAqychOl6PRAlO8PW8ZdHFTeclZ/9cbEwYu9SBuoZ/VFb8h1QmKSRzJl
	5WeXRpTye+HFAe45JkWWh/bBSJzvLHK/9vbC84Y5YudLa96MzU4fxa0ZzWa5dgE9tgEqbYHtwFE
	z+Vc4coeKiiau/C6yqAOiSFCzUeNJpo/wNn5kQ+gXxuZKcR76a1LSC2mLzTMLdirkATC0pbwlXY
	8TnWIGkiE+ewzDq08oPGnoxy4EL6pp6qxkoMo7NBY9tC7RT4ieVhPGuSiL3DWwPvi0pKeN7+vkL
	nHQgwSgwSbJEYYoNd98FxuCIVfzaGNgZ/hyFb7hKPOtabde5HrgtCLgjSnHcWNnpPl/7O+deQ/b
	uMWgaY7L2MR4HH+gfMDmbpdYTceqT4K7VUpL+21cybEBIZVOo7M9q5bRrnRXWRtV5wVQgyhqRIo
	L73EolgSV1hFr1MgdgfDMZJ8BhcYAnGWbDebIpVrUF5pw1ef4buvO2h8y5fBuQ1j5LFK2BaKMXD
	z5Tw29qzJpsMnN5AknJkAnGqRmr9w==
X-Received: by 2002:a05:690c:ec3:b0:79a:c659:6740 with SMTP id 00721157ae682-79acf3766femr8438157b3.26.1774376608807;
        Tue, 24 Mar 2026 11:23:28 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9054da57sm75637787b3.26.2026.03.24.11.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:23:27 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH v2 0/3] si2177 tuner support and new Hauppauge 9x5 devices
Date: Tue, 24 Mar 2026 13:23:09 -0500
Message-Id: <20260324182309.3396870-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260317205042.3365469-1-brad@nextdimension.cc>
References: <20260317205042.3365469-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56902-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nextdimension.cc:dkim,nextdimension.cc:mid]
X-Rspamd-Queue-Id: 180ED31ACC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hauppauge 9x5 devices, such as HVR-935, HVR-955Q, and HVR-975
have moved from cx231xx usb bridge to Empia em2828x bridge.

This series depends on my previous series:

media: em28xx: Add support for Empia em2828X bridge


The following USB device id's are new:

2040:0360 - HVR-935 ISOC transport
2040:8360 - HVR-935 Bulk transport

2040:0366 - HVR-955 ISOC transport
2040:8366 - HVR-955 Bulk transport

2040:036a - HVR-975 ISOC transport
2040:836a - HVR-975 Bulk transport

The new devices have all capabilities as previous generation.
- 935 - DVB-T/T2/C, analog tv, composite, s-video, stereo audio
- 955 - QAM/ATSC, analog tv, composite, s-video, stereo audio
- 975 - DVB-T/T2/C + QAM/ATSC, analog tv, composite, s-video, stereo audio

DVB demod: si2168
ATSC demod: lgdt3306a
tuner: si2177

The em28xx driver needed to be expanded slightly to accommodate
a second i2c client frontend, it already was setup for "old"
style multi frontend use already.

The si2177 tuner chip puts out decoded CVBS video, and therefore
requires additional configuration when setting up analog tuning parameters.

---
Changes since v1:
- Renamed some variables
- Fixed some comments
- Explicitly added USB id's affected


Regards,

Bradford



Bradford Love (3):
  em28xx: driver supports two frontends, but not i2c clients
  si2157: Include support for si2177 chip
  em28xx: Add Hauppauge em2828X based 9x5 revisions

 drivers/media/tuners/si2157.c           | 208 +++++++++++++----
 drivers/media/tuners/si2157_priv.h      |   3 +-
 drivers/media/usb/em28xx/em28xx-cards.c | 157 +++++++++++++
 drivers/media/usb/em28xx/em28xx-dvb.c   | 284 ++++++++++++++++++++----
 drivers/media/usb/em28xx/em28xx-video.c |  22 +-
 drivers/media/usb/em28xx/em28xx.h       |   3 +
 6 files changed, 588 insertions(+), 89 deletions(-)

-- 
2.35.1


