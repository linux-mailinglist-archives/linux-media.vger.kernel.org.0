Return-Path: <linux-media+bounces-67619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E4HxM0caV2rAFQEAu9opvQ
	(envelope-from <linux-media+bounces-67619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:27:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D2F75AAC7
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:27:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EzAiVPBn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67619-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67619-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47B1E300CB36
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964C73B635A;
	Wed, 15 Jul 2026 05:27:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65CA3B47CA
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 05:27:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093249; cv=none; b=HjflWPZUu/BKmNVH5yWRtHjVkLrHeudarnOzG/0ToQZ+gZU+9089BcjoXsUqL3DOMCiRNHlvsGbpwiWwsCquplwINt0gnOmXlR27ggjfeCIkD8c7UjtdiUkIJW85hHDShzkitpjvYhdOBALmq3gfc6kxkdZcSKCUoYySFmvulzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093249; c=relaxed/simple;
	bh=s/HSjP7l0fuliS38sucFfBcL+gILDM9+x6hz6PkArQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=toFvR1IJALvX/vLpdcqIgeLfbup9UiliClci7Y3dLVrtCOMZAaICAEPUTWGlc+GB/2B/Ou3jPE5JvU12YYXZ82Hgu7lyQuSkZ37L5Rsyf7IeqmS75bpBgWSBKEp/npR9u14Z2tQqnSYnL3BnTNR6vSEGACBP9zUNyXRk0g5LZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzAiVPBn; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493adc4ff7eso3552705e9.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 22:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784093246; x=1784698046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4eMricuSp+2sv7gYp7OMjI1bUn4crHCf4zjedhWUuY=;
        b=EzAiVPBn9JscRiiUeLwiFH01E89jZUfTZEAfZxSVKbk6cZp8e1Rj9KyBOWssJe5mhP
         by8DY2SR8vd966pWSOSEi7l/DLM+OpUSWTtcfpKVna8lSbpZ3nsS4P3aAeoOtnLapM7z
         QHwG8LxK/qFFIhh78KdIBgWbCTaosCNBrM/ZiH4sDfHVRnEeViVuXj4r89AMs8ZI4oU5
         FyerVuNU/MTVGyGnHLdF7h/gdnQxTifa28/qATls1QfFl43tTdvTN/X8RFwHVlB31fXK
         YDHxXIpZm3lAwNFZQJrm5m7cZ+3nqKz657mlZ4BsPjLsaQwJvYIKGkihjYpatNdTtRL9
         1pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093246; x=1784698046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4eMricuSp+2sv7gYp7OMjI1bUn4crHCf4zjedhWUuY=;
        b=KRoqoGUJzptwKkM4huCiF9OduSgdHEt0CuN0CpnAvfvl+gUHsZ4JSPYqF86wr8jfGT
         O8KazI44+4oG/bezeJvo/B8QXVa9e2lS2wMPYb45pVKRyAK4SldqtJhSXjazriXxH8m+
         YSPpTxABco1TJxRB1RgXKEtXRtI2iS7qyGJuCx8o/1vDblbgnJ2lIBZAcKQ3/gI3/C3h
         6MBQwyKPnIpUxBL4SFuSy5DRKOilIvQf2slxy60c7i7u57ODDRXN5n03nzWf7fwFUD2P
         Xm7DjRo95VeYDdbdrJhjYi3cjvnan+OHperLp8c6+sGfMfdKfxWUSY4eqkK9L+wl18OE
         Ng9w==
X-Forwarded-Encrypted: i=1; AHgh+RqGeF5VoXC6iwLLixL052vNEg9rwmxASlD4MgCo2BJmD0QMhs1x0G03VD1O5umqxRScK+rAbz5x+pK9og==@vger.kernel.org
X-Gm-Message-State: AOJu0YylRC5MFNsLeakKqy7Uy72DKTY3byFJkLihwEWSGrneIi7AtBG0
	9HiI1aQZ8XRp+ILq2jL2iHHHKOqXWdQk0bWg50RbQX1T5q0rkwPGIX9d
X-Gm-Gg: AfdE7clgZ6jnKaEMlj/irWKQ91Vf8j68l0DCtCApHQ2RihZu+7U/IpTFxDLDIP4zYO9
	8mpKp5XjF0UeFzX2m0veRhPp7lz7zg2r4OpA6djBtGW1Lg3Qr750J8oBxQXE5DpvnXKVW4JTPsF
	3DpnNtGIR+4pjgevRRVop1MrMEJ0aVhymgMbpXjDUh+8HN2iN8IHV7m1Z9M6nBwzcyvQWW5gLw/
	vQwAgd5EF8D+7/ZgLW4mXJanioa3esa9VIHrtNt3NeI3uPw49iD6wHmid1P1C1KMIyLslx9GNk4
	GafR1dl65nMaJDZZcDpRki/nZCm79PCkeHXks3l76lhMtOx0QnoTAlXD9eMcVFjnvyl3p3I4ohf
	xvg0RoqqrC3jQtWp1vHhYPUaB6UHh0H+VKMTZu2X6/Vk5NQGFWK0ii1EquQmuAZDnDTkQfUQzMP
	cPftvAaBzKGrdYRppvXIOYRW4ERcu5McmtvwhjXU3RGdZWcVgp4Z/VdnU3q+vdm7TBl0OudUlKL
	rb2OOXSKStkO1py03IK0g==
X-Received: by 2002:a05:600c:c055:b0:490:b2f9:d9a4 with SMTP id 5b1f17b1804b1-493f87dbb37mr69064725e9.1.1784093245921;
        Tue, 14 Jul 2026 22:27:25 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B883700A9E699EB87FB5BDB.dsl.pool.telekom.hu. [2001:4c4e:1b88:3700:a9e6:99eb:87fb:5bdb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm13003669f8f.27.2026.07.14.22.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:27:25 -0700 (PDT)
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
Subject: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
Date: Wed, 15 Jul 2026 07:19:38 +0200
Message-ID: <20260715051939.64652-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715051939.64652-1-royalnet026@gmail.com>
References: <20260715051939.64652-1-royalnet026@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,collabora.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67619-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.osipenko@collabora.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:kernel@collabora.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:royalnet026@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[royalnet026@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4D2F75AAC7

The HDMI RX controller can expose the audio embedded in the incoming
HDMI stream as an ALSA capture device. Document the #sound-dai-cells
property so that a sound card can reference the HDMI RX audio DAI.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87..83c10d9 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -78,6 +78,13 @@ properties:
       The phandle of the syscon node for the Video Output GRF register
       to enable EDID transfer through SDAIN and SCLIN.
 
+  "#sound-dai-cells":
+    const: 1
+    description:
+      The HDMI RX controller registers a generic HDMI audio codec so the
+      audio embedded in the incoming stream can be captured. A value of 1
+      lets a sound card reference the audio DAI as <&hdmirx 0>.
+
 required:
   - compatible
   - reg
-- 
2.53.0


