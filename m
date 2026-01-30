Return-Path: <linux-media+bounces-51866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPLlL54ZfWkhQQIAu9opvQ
	(envelope-from <linux-media+bounces-51866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 21:50:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B90BE8C6
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 21:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA977303B4C1
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 20:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A0335295C;
	Fri, 30 Jan 2026 20:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5zzSDWG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9309350D65
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769806163; cv=none; b=bsPm6W55c3jD8mJzAhjf7atgF7ByukgyQqrCR2lr8Bu8GMMMSHDEwHF8P/P7hRZop+18SUkEpXe4hkWuZRMmg6DerQzBzB3R1YAI805FGHvlT9hF98d9wzAMHi/ktH0Fi7bJygdOl3ovumw3/ZQLVtghxWzYajzWOCb2rZsChrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769806163; c=relaxed/simple;
	bh=4oTTNNSYTncodn+lV3x6eCziATa/SCKoCQNKWwlug88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7RJpx+TuuTfvJhfAPYNbiPhoq5s2kv/frxE23ZFnoPh3KMXCJ1YrMBPd5XPLkKpMghGUjzSyH3osZ680MWTKGuczhylXTDdgW7yqv0g9vPjnx6w74zo/8Zbn4027R7uDy/kCkKh6/2ts4uwo7cEYQ+uSQhqVawlkYIJVZezA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5zzSDWG; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b6a868ad45so127934eec.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769806161; x=1770410961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3U1U/8LFbm7g5yPxUTPlvGNrI7c4l4CyFa801D7eJd0=;
        b=W5zzSDWGs3ecbyYNpx7PPrcQPoIWkll2qHU6lrLzbveyIzMS9FHvn9RkHm/yKRgom/
         GkitxV/MZHK1t+3VJMvekfy8s/MdHZxnEt1iWCTHEvHSOFwnVhtlQ0Yomv1gNtVr5YDY
         YuAqMuxtUw4S8KlAWWX5e0b84QuMLDZNS15XZkV4vJ4depQfENyQSUUmk7BnD/D3RU2P
         FW1QUYKduPk94GgcA4FeCBbOHnbn6oVQyK6edt2YJshFQBn3Y+g4JTI0fPalBeFCZb0t
         i2NYPWPdjsvu7KmRhVjAFoqDhjx1nmTje74jgiQzg+Z+AeRwJOeFjuXtXWQgbDNYlwx4
         fdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769806161; x=1770410961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3U1U/8LFbm7g5yPxUTPlvGNrI7c4l4CyFa801D7eJd0=;
        b=uOEu/hXFpF0rpsitNrRfI0/VxFCGbbtMrnAbzD8YdEVUYnjjsHz/tnKsrvD+MchLdt
         UqBWarns7gcFwJKLw1R0q3Ju8W+43IEkmYdCDF5cLkpk0MfIFeHjxRq0RkH9rg7DSRiq
         jncT1VTHr24HFrHzAc/fxBHv4I0HVddoPU1XyPGCHqqkp1quuAN0FELOyZ1SeHJlJkms
         BMwWbWwTNOHvs6HyHoPSHaLizBYPYeOFI9I1JI+5MwwKvsGbjcxZESxuB9G949yviX3w
         LNmizVCb5f/QDuXclIYnvLjZKjMFXKjMIvCNSnnsdWQzFSVzLxWDfBADvjvcrEci/9+z
         s2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFzIIC4s/mCk/PVVcMWo+qrR9xg2sTxMKBfcNQh7deGTtBDWqntqIvVps3HMCsSdvKLmoqe+Stz4jyAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlq5jtfZXQ0syB7Sk2FE2LulCgj9ub7cB0znhQrckjwNEit44
	3wVAZcSmMFDfHDjmS2bttmINxIjtu2bFma3bnalh7B+dPoYWS/mMPhb4
X-Gm-Gg: AZuq6aJykXUQSyObehwZo86NL/06SIQDFTppURD0tjZckLa0MLWvNminoNwFYlNkjjZ
	5H7qEpIBTlGZZZpyAUe2uqXIdhryaugCVV+sz71M6OlStinvG6vEzJY8e8ZcnYcQW+VsnpjOT+j
	Evjmi/q2oaUEX8p3m/+liZs0mK2ihR8kVlcFwWW2i+986NJSxWB4G08IAz1igXFd4iNhSprPFtw
	Q8s5XAuDuqe9RYEUPFHMInzMn8n6lhUEOE30JAeUOX5NjnLemCd8KPV6/qGt19/+8w9INgEWm2k
	Re8JUmFtnwV6GX4Fpg4NFJ9QfUHb69MyvWNnYrgjAE8/drA7hSzxvKHkYlChkwRoy2rJyTWvMP4
	NTRytrbvo5hlUn09bVh5y/Lw1L2DrN032B6CVY9r3HCWyTz2QvZd+l6B4SLz9Kb+r14mNqEVZlB
	ZNY15Z
X-Received: by 2002:a05:7022:660b:b0:11b:862d:8031 with SMTP id a92af1059eb24-125c0f12e0cmr1066124c88.0.1769806160920;
        Fri, 30 Jan 2026 12:49:20 -0800 (PST)
Received: from localhost ([2802:8012:29:1100:899:eb0:bfbe:884f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de948esm12981470c88.9.2026.01.30.12.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:49:20 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: gascoar@gmail.com
Subject: [PATCH 1/2] media: bcm2835-unicam: remove obsolete comment
Date: Fri, 30 Jan 2026 17:45:41 -0300
Message-ID: <20260130204628.312246-3-gascoar@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130204628.312246-1-gascoar@gmail.com>
References: <20260130204628.312246-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51866-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[gascoar@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23B90BE8C6
X-Rspamd-Action: no action

The bcm2835-camera driver was dropped in commit <90204a38a760>, but it still
mentioned as a current driver in a comment section. 

Remove the comment making reference to it.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index f10064107d54..551c4e97af8c 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -14,10 +14,6 @@
  * and TI CAL camera interface driver by
  *    Benoit Parrot <bparrot@ti.com>
  *
- *
- * There are two camera drivers in the kernel for BCM283x - this one and
- * bcm2835-camera (currently in staging).
- *
  * This driver directly controls the Unicam peripheral - there is no
  * involvement with the VideoCore firmware. Unicam receives CSI-2 or CCP2 data
  * and writes it into SDRAM. The only potential processing options are to
-- 
2.52.0


