Return-Path: <linux-media+bounces-67035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fm5mNNdvTmrfMgIAu9opvQ
	(envelope-from <linux-media+bounces-67035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:42:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 612B97282D2
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:42:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Grb34CK0;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67035-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67035-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9945831B2107
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387E53F12C0;
	Wed,  8 Jul 2026 15:22:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF80439354
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:22:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524130; cv=none; b=ssY+YUHxP7AvoH9MYLThH1A1BeawRhx4uNi2Ol53JrHP+mGcraoTuazxCRPFG6T6k+YPiT16WkvRF6QqVOhgx+cMMr30mFnF5PaBTop2rFC/Nt2iWcLacEFj+EtQXDu4V5Ybsc2lkWvKAYcyC3Fpr4WhfYx9gPe3GQS/O0BbBNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524130; c=relaxed/simple;
	bh=/YtPuzecJ2o+kWqqzkix6AtU6d8HTTRWmH0PHgCska0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kklpoFWkI3067HmTpFN4Rk4f7lANcXXa5v2G3sgkzuznG3qTCnWCcbi4G912iMqAAtnIKAFi6mbCS1P++c2DT1KtQ0NjKVSrcMJd9k49jinThEZtTYPzZaUYwZdKkltEsazRFJw2C6CXdqnICHjN/WG6KwJqh5mTmak2v4RFVD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Grb34CK0; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso2926912a12.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783524127; x=1784128927; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dT/4FqiNAEmcewp+PxajT6kJ3w+dqpjt8gG4B1wnCug=;
        b=Grb34CK0DXEvFI9kCkgDp3bjtQwdsx/qZSL2vpR6Lj4IpCUP2J/VEnAnplkm25607Z
         hteqqdhx/6ktgdsQbneNZuMjUXmtpPi1g/z/7bkqXxHkFeWCNzRG2m555eTGbhXv0e3C
         B6oWH5EY4zz5EaD16FMb5SiVgurjPK1sV7svr2BxwYmmwQZXXdFxQ0x8borCVSOZt9UE
         9QS64HvPmQ5n5grl6uhaPU1Ju1gaTTb7xUy8CnHfipJ00h78dv9cccGcYANgn9Ot4Kn9
         wUZrQQdB9Txs2xvPWBOM+KAteWOlTo4epZGQIxgdDplUBH7CqOBX8mYH3NDflCkCuQ2+
         3wWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524127; x=1784128927;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dT/4FqiNAEmcewp+PxajT6kJ3w+dqpjt8gG4B1wnCug=;
        b=jubfs8mlCx0P2hpTVort49HVOOru9unUrV4qWbkmav2jgflbPEjKniJ1EDH1gCyll0
         /G9h3pslmpvkkk38rG0AtSFXnZSVNwTgl7DUDdK1oy12gDPAvb+mCMuzVG/8LntgE+JF
         8XVlL61OyoS/unct/FnM2Eg3Pm0JkEUN988xvZcakDG1QKbaAdlXYptvEVgBAh+0/2fN
         bXzUdo3jF5WcDY2Hdxhh1oLrAxlOfImZCKZi2wf41DQ6XkabRzyThc6UGxTdcYPr02ST
         3SpDk9khQiPtZFc/Q3kmL8A0Pk9PFBhMS+EvcAzWw/D9eqb1dGSTnstm4ImR/bSdSBXH
         tAkQ==
X-Forwarded-Encrypted: i=1; AHgh+RobA2JAp+oDKsPWl1N1ZMNLb+dOhY7Sulbu3+8hNn0gw7hkPBMkNjNKzaf4ivW+/cXoJbCOeQa+w9Y9UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdYv55nNDij4B9Nvh1yM1kS7vIkbZZIhaSEBApAAzQndFblLOU
	Swp+P7cfjXd/M++oMIH4hP4xBv6ssxbp1VDIASptdrbbwKObtoHeycc0jTnGzU0Ww50CrbC36vm
	eLO4IyB0=
X-Gm-Gg: AfdE7cmvt4kLDd2swTzsem41JzHsZcK1Xw6v6PETA5TrElQakAoRCGRF0nHWqahbANQ
	Z0iq1XXlixEdLPI2e0kg7SSIcSpf6HxAQgwNp2tJGw2gZ7aMdvveEqsP/C7GA6GqlW+VHl3oCKD
	FRdL4Qu2ftxCquGCGE4+vuTLNtT7zpnre8Q0xBvph+PfQyMeVwb6yQmpodKmoMMM+OgaCKn2FVS
	miyuUCOOHFt03kmFAmpoXWyImsHmdfZ3a5GDUW7mb1XEni9NRLvY5QonvXIxj8d1TudHWdr9JCM
	PH8CG1wO9n6uTzOkcC+/vUQAm68xhr9pnunaRReBsMlMmnIVnaRvWst2KhL99SHJrZKhG0AkORq
	YUX1CRbYNWQ77KvYDqBJtyVZJqvivID6qCTMFodHfroWlDRNnT7VbL87xgUyx+IcGCpqB0VYmVV
	zCx0bQl982csFiwdLsDuqHSLWgOypJd6lmbfBd6qCjHTM7cL+ySJkz6OwBQZC2iu56pYTYUrjtc
	jnz7xg=
X-Received: by 2002:a17:907:70b:b0:c12:6280:33c9 with SMTP id a640c23a62f3a-c15ce011b1dmr171223266b.28.1783524127378;
        Wed, 08 Jul 2026 08:22:07 -0700 (PDT)
Received: from puffmais2.c.googlers.com (181.179.204.35.bc.googleusercontent.com. [35.204.179.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm213932966b.25.2026.07.08.08.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:22:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] drm/drm_crtc: dma_fence_ops fixes
Date: Wed, 08 Jul 2026 16:22:04 +0100
Message-Id: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABxrTmoC/32NWwrCMBBFt1Lm20heJuKX+5BSYpq2A9rIpIZKy
 d6NXYCf53AfG6RAGBJcmg0oZEwY5wry0ICf3DwGhn1lkFwabsSZPXB+r6ynZ+dp8d2Aq2RSOev
 VSTstJNTmi0L1++qtrTxhWiJ99pMsfvb/XhZMMM9VsPauzKD0taYcxWOkEdpSyhd3oVZ5twAAA
 A==
X-Change-ID: 20260618-linux-drm_crtc_fix2-23a7c354a412
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67035-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,m:andre.draszik@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,igalia.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 612B97282D2

Hi,

These patches fix two issues in the drm/drm_crtc driver. Initially I
was hitting the BUG_ON() in a scenario as explained in the commit
message of what is now the second patch in this series. For the reasons
outlines there, the BUG_ON() should just be removed.

After posting, sashiko.dev noticed another issue, that was previously
masked by the now-removed BUG_ON(). Since we can't have a loud BUG() be
replaced with silent data corruption or worse, I've also added a patch
to address this issue highlighted by sashiko.dev. I believe its
observation and analysis to be correct.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- add new patch 1 to address sashiko observation
- original patch 1 becomes patch 2
- patch 2:
  - don't turn fence_to_crtc() into macro (Jani, Philipp)
  - update commit message to include reference to deprecated use of BUG
- Link to v1: https://lore.kernel.org/r/20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org

---
André Draszik (2):
      drm/drm_crtc: ensure dma_fence_ops remain valid during device unbind
      drm/drm_crtc: fix race with dma_fence_signal() in ::get_driver_name()

 drivers/gpu/drm/drm_crtc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260618-linux-drm_crtc_fix2-23a7c354a412

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


