Return-Path: <linux-media+bounces-58200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YXcFCF+a1WnN7wcAu9opvQ
	(envelope-from <linux-media+bounces-58200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 01:59:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B93B5954
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 01:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83A06302676C
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 23:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE42438F235;
	Tue,  7 Apr 2026 23:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmgl/xdM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CA8320CD3
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 23:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775606359; cv=pass; b=mioyqFv01aiCp62E3lAN4658zq/ZLTXQKhn+0eg1uJUsWeWK8TC1lOxxTV4Pw3pMzdaBKo6MKTAczat7VwEaJecwHWqRZyP1MpR3P2FI2+x96Hgxu4ZRlnXoQjMhch+IjH6YvWTaS5QHw7NIFTfg9IibBCnjz1fVfkc1SAMzlPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775606359; c=relaxed/simple;
	bh=EWZEt+Vi3klw3aUwVjTWvHLVN5SNDkxrwlnjZJkNvxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Bc2kpFPsyCy1UUhmUjzLlMsAAQxGS5eI/v1WLcBjud6gekUkpCtdsvL1vgr6IncumuwBS6SzBR3vyIEj8Ek9ITlmJrKBEe2FSqCCqQh5WnkEmbL1YhQTMpR/6PjD7ROTQf0I1sdbNyXraVJcgGjH/7rE0ByHaHKSjqg04zkIzUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmgl/xdM; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82cebbdab08so4016830b3a.2
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 16:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775606357; cv=none;
        d=google.com; s=arc-20240605;
        b=OQ6YqyCthmCsW1jkmHlFr0aJAQ3MeaQ57swTUGlGcKES6hwGkrT/03hWcPpQ3TyrB1
         I1hXbh+WFR7/9hWtc5EEHMgBTs3LQ4TVyNMOTAn2iXnMhiJ0xwQRbJmRLBOXYIYOig3J
         WVR0ZWvofDJ12s4lwyzDvcz3MdSKE6wMB0NqTZypq+Ni2G9/3LVH8ovRpXngNU9uFxoh
         rfdNSFo+CzVssb6BlB2pG3LIn5hXzh1LcUUgxORtIze5ae7AWnp2uPR9eBR3Q1w8FfjM
         yB6SIEMTKZFg8Xa0scjbsbG95DeCGYdb91h3S5aDDQvvEs5fPJjPcu4EwogcZSB5CvFI
         pdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EWZEt+Vi3klw3aUwVjTWvHLVN5SNDkxrwlnjZJkNvxI=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=EROuQW4OfBCa8KzEGqcYvVkOarVi6+RE9Sodqz/U3uqli2CRh9EMBKEYyoczx+TLOz
         MgDdg0N+B+/GBItKKLnly+K+eFmjFCVHrqQ8FqgnQ0OBvzeMrP78TA38JQw6nAL1nxbC
         ESger9E1O3MJjQVuUqv/R+uCKt+g7mQqcZbIam1K3nxWv2YfMMmHJhbWL7KQOXDvOZnr
         JBw9mCQPAmyC5PJ4q97h/REmEx5sFaRCEgjj3YM2IBxmjz3Et2+GSricIw46AY5Y5Ukn
         luNs+vBzFG5z2+IgasE0RwdS8c3aQrfv/0nUB0DVDfq7aQFc40wqph7aZrL6IsneTQBK
         Qicw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775606357; x=1776211157; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EWZEt+Vi3klw3aUwVjTWvHLVN5SNDkxrwlnjZJkNvxI=;
        b=fmgl/xdMdHnVHlO6dxa4emunNO/qkHyyZjYHpJ+VD68ynZSOVbKbNxpKycS8O7Erpn
         gvPa7PqdKnl+dJWzeQdNIMaup5sY8NNQhT4fdUkHh//zujfFGKbpugZaSJhzLT2n2c7w
         N38Jja+xM7al0uQ5DL1UGgD22501QSMIDFxtAKleHak6GkxoFaLWPw5E6/cCRqeDrZRH
         +QDgHuFvcdg8i9WlnU0XzaxmpcT9AGdApvc22+xNr62rccAniG1HQZdDej5sZRl0+h8o
         2ny8/q81mWzH3k68GHjFQT76Oz4Jts5nqCBcCQHwH/EXinFzAnCIjhYYiwuaGmW3X3VM
         Z8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775606357; x=1776211157;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWZEt+Vi3klw3aUwVjTWvHLVN5SNDkxrwlnjZJkNvxI=;
        b=DMwNG4eKDlxTwyRF74da/kS/aows42eMh6KL6FvwOQR3UVrKokutaVvsplB3Xnw1Wa
         ECcnfEbNDTlpOyj524fXK7QnKsYuFgdOhptNslujKp90RGYBjoGI3F/zzpJRSnPpzRhi
         2VT0Bwe8B+vOgJjxD3psfDtDarkc/H/CfXdBdnaT75JVyaF4hVzEdU1PxSBs6PvP+2/Y
         J+YDTXZeldvZ8mW2euycL7tUZCEjmDb6WyPZxm2hbTupRDreqTT43MFv8sIkatpFeG8f
         G6oTfIr441VRJ96HA6OYAXpXfOpJj9SJqz9iaBCSXkAOmjhJZmG01CSKmslvjBj7DO5N
         o7uA==
X-Gm-Message-State: AOJu0YxMFs01TvPnek4CF26h+DveuWtW/pwSO50Ue3mOKBiV2JvGSp4n
	tvIuD4S0iwsAcAAc2Td+eRJ3icmtdIeg/PHtE9W3MiW8XCnqVLylWZTAiHBsHJ73Lpj1JaH4yJK
	+ocMY4CuPbXWVrD1lO2eXwpEE+qEHpCgScGCF
X-Gm-Gg: AeBDiespRRUjHVN6WOYuYxqdx04rYS7UTFH/NJklD0+JvrwGcmJ08KVK9GwqalfX30W
	pnkEvb+BAH53rVreUwmvCp/hEdTzmHoV5Y4/IZRzw3EvtfzoCcJG1sZrPeHWaj0akffNxFOZGNq
	khxx3KfksE6IIEUQzsZY/mePng4z+9ZS+ULsq4mHGx16jYSY8a76jw+Y2JUEDE9068225ncyML4
	GRdaGtXiUfZumb2stxEaOivWDxpTkIFi9Swn8tDDvr/RAcAOGBnU8i5+dt8aKkRsCgWmumK4FlT
	2tGoUF6d9n5vS5f614478xD7fc/TYILZXKl62u7jlg==
X-Received: by 2002:a05:6a00:ab87:b0:82c:ae58:4690 with SMTP id
 d2e1a72fcca58-82d0dbd4f9amr18033925b3a.52.1775606357422; Tue, 07 Apr 2026
 16:59:17 -0700 (PDT)
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Tue, 7 Apr 2026 18:59:15 -0500
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Tue, 7 Apr 2026 18:59:15 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: cooper.kevin@gmail.com
Date: Tue, 7 Apr 2026 18:59:15 -0500
X-Gm-Features: AQROBzC4ktIesGSVO0WTf8JunL2vkPwZwe3cHR73VCi79a36GxVRJBWHwZWtDs0
Message-ID: <CAPk_zz-2y+FJAjoONZ+k=i0u8nuDa3f9G4rj_p96LEiL-MYq+A@mail.gmail.com>
Subject: Roxio Video Capture USB (1b80:e31d) - em28xx Decoder not found
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58200-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cooperkevin@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 763B93B5954
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

I am submitting a log for the Roxio Video Capture USB (ID 1b80:e31d)
which is currently failing to initialize with the em28xx driver on
Linux Mint.

The device is identified as an Afatech/eMPIA based grabber. When
attempting to bind the ID to the em28xx driver, the initialization
fails with "Decoder not found" and "failed to create media graph."

Board eeprom hash: 0x00000000
Board i2c devicelist hash: 0x7d2e7f80

Relevant dmesg output:
[959397.397238] em28xx 2-1.3:1.0: Here is a list of valid choices for
the card=<n> insmod option:
...
[959398.616159] em28xx 2-1.3:1.0: Config register raw data: 0x00
[959398.834160] usb 2-1.3: Decoder not found
[959398.834179] em28xx 2-1.3:1.0: failed to create media graph
[959398.834193] em28xx 2-1.3:1.0: V4L2 device video2 deregistered

I have tried forcing several card profiles (card=1, card=64, etc.)
without success. Any guidance on getting this specific Roxio variant
supported would be greatly appreciated.

