Return-Path: <linux-media+bounces-52049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KEFN4TlgGleCAMAu9opvQ
	(envelope-from <linux-media+bounces-52049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:57:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DB7CFD59
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6424A30C03AB
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 17:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD39387583;
	Mon,  2 Feb 2026 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/dYP9vx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C624C29BDBD
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054637; cv=none; b=GD705279ipdIeENLtLSIgClkcOjATZN6vWawcnb7p9y7oIZwNv/5hf5N9y1J6zGmAY6NV+OH7hbZ+BSUBPOluA/fC0fWgkRUA5WnWIQaoCDKSuuDd6cEfCOWJVc9Lp6RHO/IEzI/p1nq/MB6m8BvG3DYTfDQvymOYJt0yURZtq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054637; c=relaxed/simple;
	bh=E34ok9rsQ1iyZNF8/pjziTiFznexgL8xTijGUS/jd6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItgD3oqsd6RGkOmQnjeTztUnf/roj6DlUD7OvW823BsZ0osOdtQMwUTwCbFpMzV2TA56+BC704QRg6AV7UMCrHaOG/WSlMczacHJHOmUV6oYcggBs7iNkIa890lnFWsHpnBqHRewHm0dwCO6YqrrfZjlze1MhZndKPnJNWwXXxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/dYP9vx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3044540f8f.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 09:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054634; x=1770659434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx3IZMFtvoxLMIh/gYYF8XJ+LG7aTs2Ot1GvjmzfVJE=;
        b=T/dYP9vxUrsr+tL/n/0bg8t2Hp3Cwg/Wiaksk7f6ePKOg2W9XxqHgi/1FmHVNo2T7J
         y613E0YKO6L9ri2RiiijSRcCxnVBW2lIv+nbF4HLgY8Nob3miszs0GV7xdje6Mp92fMV
         s4K7c0XoJx4uCduEYp5IZF1qHzYRgKK/v36xLASPNAMKr0uxF0PqWA++LmKO8C7/+LHe
         ZSPUj4qEV+Os8yAdy6OcjuNYQ1X5UL5vwypiemZ3QdBTf/8WRkTYpdpBtcgoAWBOlpkv
         /qD9DYJNdo2kOwdSjvclLAIQ4WENwfKM9c8nYs72cUBqNWDnkD2ATPwZkka2L6hMSY3Y
         mODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054634; x=1770659434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mx3IZMFtvoxLMIh/gYYF8XJ+LG7aTs2Ot1GvjmzfVJE=;
        b=DQ5EZ6CLn0/pxQUYEV2F7b4D7YIY9dzC2DowFg2eMFZiJrEZl9/58gOjFYJUO2E+JY
         WIhcWree/cnAOuWYwbCZY854d2xyXBXYXEDzitqbPwIVaxW10K5w8xUi9ICv5zBhJ4Jt
         bAh5jeGhuzgEo7vKBmRm/ENsoiuLaMP9sfKGNRZXVrUWwQtLcGDvPPJDV3r8E8br4+9z
         NzgKxo/CagN340xrwoWQ4Qw9A6nIGfS8WDcp1KTjCHi1iHn55DNmx3xu+SwWUQUeF6Tv
         ejfIv0BQdyPsoyPZ2LXdWWMjaiydvnKCG5fNY66q6ru/xE4Lejrd6Dq9Rv1WsFk1rXKd
         a79Q==
X-Forwarded-Encrypted: i=1; AJvYcCWa1EozLmnXMyOHstUWeYENB0EgIc8X+uEW4YMuqfxlfQ1NQ1w0UMF5kPoA/liQIV3zxKFyYZyd2O6nWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/KlMdVFRW/jYqxKK0mDSqrP7bi43roZVUx++bii++hE7+a7+y
	YKkqcnVVKOq9dkcT/G/kLTmRyg1DOPHmj70mzw/fzLFK6H2Yi5C2uCA9
X-Gm-Gg: AZuq6aJMby3z3+ciKtS5oX00qDUp5wB/5xCgiYJlQTw0s7VrCH+WHTXXj+dhXBAlSOY
	HWJAEt1lRZlI+a4f1W4eXYDwh5KGyWzD7mX1nJ1h3Mjfc4BOcDd7LtLadGQn6QcS8Yuj4iVTgzc
	uIgYvmsJREG4/NGWMzW3UQuCH5lMDLYNhJX6cP3crtoPp++vv1IPuj+e27WUPAXRryhS5UADKPY
	VaKwIfj3zFXKkG82YxJtjzWPgQGV1+4pk1pPTgYo7pAusB4wyWl296l2CE355ecIfNYZKVHV4yx
	pcLjakmsRXEfGiRnDdy7oq0kb1EpGXosGKCOU/u+jDqKO7nSeZz71Ge3eGDW7RgFis5+SPiVClB
	4GXqqY5wo/J9ZLFrTw4EQ+zZrvAnV6vtLBdVNA+OkIvAPuOTjnbLO8eBTSqKl3egfWfFsoxkp7E
	NHkB4ujiH48VgylqcV2Z9qzscjFT67ZZF1z0ZZuw==
X-Received: by 2002:a05:6000:4282:b0:435:907f:e439 with SMTP id ffacd0b85a97d-435f3a7e41bmr18275928f8f.18.1770054633944;
        Mon, 02 Feb 2026 09:50:33 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47011359f8f.27.2026.02.02.09.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:50:33 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 0/4] Cleanup media:ipu3 driver
Date: Mon,  2 Feb 2026 19:50:29 +0200
Message-ID: <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2026020258-very-numbly-b36b@gregkh>
References: <2026020258-very-numbly-b36b@gregkh>
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-52049-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdanelsandu2011@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64DB7CFD59
X-Rspamd-Action: no action

The previous patch has now been separated into four smaller ones, each one fixing a specific type of checkpatch.pl issue.

Bogdan Sandu (4):
  media: ipu3: fix alignment
  media: ipu3: use tabs
  media: ipu3: avoid ending lines with paranthesis
  media: ipu3: use BIT()

 drivers/staging/media/ipu3/ipu3-css.c  | 39 ++++++++++++--------------
 drivers/staging/media/ipu3/ipu3-mmu.c  |  2 +-
 drivers/staging/media/ipu3/ipu3-mmu.h  |  4 ++-
 drivers/staging/media/ipu3/ipu3-v4l2.c | 11 ++++----
 drivers/staging/media/ipu3/ipu3.c      |  7 ++---
 5 files changed, 30 insertions(+), 33 deletions(-)

-- 
2.51.0


