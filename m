Return-Path: <linux-media+bounces-54266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBtoHVCfpmlqRwAAu9opvQ
	(envelope-from <linux-media+bounces-54266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:44:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCFD1EAF8F
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C4963045268
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6147E38C413;
	Tue,  3 Mar 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVFnK+I4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0DC388E65
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527386; cv=none; b=Xu9Nsf6WBTJ5spwbwaKdukgQ+rZnRfD3RRwE3gOtdmqMIJxHAjDZPwkXITUzGsRVwbJVo6VI/fmgZ7bOjKtWHipCzisRETE/MMzPJ4u6YicEkpYZiwSTqR8fvoSwdzHGXKG9+t6z31sUOFygGcOH/grREA8mhJZF2/D5uTPv8J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527386; c=relaxed/simple;
	bh=BtYUDPRydbD7qJguB7Cv1gqWmul/7Eiqmo1Zcx4dX7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsCDwf5fyn0+wOg3FCZQAYvmSXgy6yyfGwUXbHr72QQaL+ZimR0tQ6T9sOP4d1JQrP5vrTj0H0+OBM1EJchPv9IClK+Ee7uxXjoJ/n1a/v/KmSngf7UW6Bo/sCSRvoA8Xqvw3qOFy0DFcSz9zFfthSGTSmGrZtU9BwvjS5NwJQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVFnK+I4; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-389e4330e32so79522581fa.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527381; x=1773132181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=AVFnK+I4XCLGf0l2UuRlPxnvyRF8uAGt92TzsOZnZQl7BquJBzBVvxEp/wAQVaHnUz
         I7V9Wn8ZmGLpc6Rznc1r/GG9XDxAKuNMNJ8UHZa9uML8+QyXD3Am19Nv3hIHzBvyoZ2t
         aWU0IA5APyOwk8nO8q5spOK8C8AU+FDny0V1RlVUT5AEhS2NHRiCC0cW3WmEHHXetgeO
         IOYH9TTEAaxY5INVIMH2WaSPIB0SAN3tXRpz2VDUPMIvKmwIBZmSthvOKjLd3K3PTbF/
         cCir1xOhVgLtXGlxyMWerTIpajf7ihb/fhdOHJYhXPDcKbzSHTjUqLA5ZS2Rqg/Dq83y
         UpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527381; x=1773132181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=ihKUlWMjQpltpdA563xmX0lV0jnktRdDMzVXGt/UOgClZRBEFMcVb8IyiK3syCqC8T
         nOTnMf5Qltlmys3WIp4EG6Txf76mJhyeylUrUHWbyZ+StR7Y0YdYn0jEemjS9myV0W6f
         hayPY9P32/YRF9Z6nLeTLjJwkYNlnxxdzrLsJ+on89THHr7xecK3nwXkHUD505LSSXUY
         IZVGbS2jg7Tp6xeVKefEaDaFGIeI653V6zUMZJmmjbBIo3HoFsdj91TeietBOWmYPKS8
         /y2Jfg8MjBhlxOijs8PmwtVo99rT+PwRKPJzDuN2RhrQvqbmxVqZ5taIKQ77mpSYKtk6
         +ftw==
X-Forwarded-Encrypted: i=1; AJvYcCUoI9tuFW8xC5MRHVXoxLgzQejFCXcBylUE2dsbvnXqFT/UiDcY30EcOWdaqEhEbWIGX96mBVwMjbwyig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56NuplYl591aeFjE5NIMneQvj2ZL5BdZwN9ABlqvQJ+CweF7h
	HR7pCYTMvoyGDaZzGZpC4YIo1YACYmHZwbAnZCJjQb+SU3wuv+/LqwGg
X-Gm-Gg: ATEYQzz0xBoEZIrWb+KcWgsGlfXCq084rFthtLNhYVcE8mYF+7FZ8ShcLX3nz6oSppv
	0pDdcjnAQ1/pI4PrYiGQnTk90IurMpQiIUABLL7mfVID4bN97yC5857xeXtqfMKTcFUsJzd/r2O
	LtWGAhng/j9T24gVDoBUeHYsQ+uG85MZPi6W+/3gNbpjl5j/9tLVT+0/kXrwcz8DBow5uR853re
	G3E6y0wasrIxOSgt2mNr/2Qu4g8bHTmCgQ6CEhRMC+p6SBkZrH+eBRPE+jhI1C/bItctFXMkUrJ
	mCWEwJYeqZH5Oq02v0NTDkiFvlvTyHj5TIHemVuewOpZROGGRH7I6KMTAVmh7+/GoAxqqtFqoBq
	y5/L3lE3iHN3iYsoPz6Yz/jFEM0x5FK3xNoigHJejnhPRP3dpy61dn+O9LzOBLTrjYOYOQRWKPq
	Z6crjNiZPzWmUd
X-Received: by 2002:a05:651c:882:b0:389:fa5e:51f9 with SMTP id 38308e7fff4ca-389ff355fc9mr105960021fa.27.1772527381047;
        Tue, 03 Mar 2026 00:43:01 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 08/15] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Tue,  3 Mar 2026 10:42:31 +0200
Message-ID: <20260303084239.15007-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0FCFD1EAF8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54266-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:email,nvidia.com:email]
X-Rspamd-Action: no action

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index aa9ff7fec4f9..b2e706fa727b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.51.0


