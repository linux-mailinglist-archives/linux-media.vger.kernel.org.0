Return-Path: <linux-media+bounces-61240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOwBEuL7AmpOzQEAu9opvQ
	(envelope-from <linux-media+bounces-61240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:07:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A377951E44C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D71E307C0E8
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5E44C6F06;
	Tue, 12 May 2026 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIi7YxgG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03733AE187
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580242; cv=none; b=udfuDKdlVeKIkDsCA8R2M/M5YuBzcacOuox66Fwh/heyeidIGsvYxIHQGK6O6cPi4bt5R8GBty3xMGnCP4FilOvmCso++xpPaTJfWZjbL+CEciicYUpUdTVnpmKKUMej65bYh6klxAb5Co1paBflHwrEBMmoiHSK8jX44efz5FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580242; c=relaxed/simple;
	bh=nMF5wmtNIU0TdQwozJkWBIpubcYRs7NEVSZzMuEjElU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISps2F2CkA9b0Ly8L+GNKDlzlv8YqWklOHb4h520VqksIK2ZBH3K1596V9qBJ7SpI6D2UdHRpsYoAmrhUbwzJcfKumDiTuj5+bX94AUJ0b+H0eC7NNEpTCpTEqZADzEXFYEGHaxY9CtR4JnPdWf7kKEi9DcA4j0wFc6wPqa0G7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIi7YxgG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba545100a13so907053766b.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580239; x=1779185039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBMmjAeqhyczJE1w2fvu/8tw1IKm+NA+d/AMe2qIoNc=;
        b=lIi7YxgGt3/21SKWulgiGFz9KCe/8gi2+YjRxLh8GL4UeaMVX42qKq/Dr22lwSiLV+
         StIuL1VUyb7nC4F7b1pkCrdgAvXaJ/3+ejBynVDbn7eKQJUhtuq7iRWsD53vv/dqszWD
         Zvuow9MbxGfnHTNVosZNQ+X7TlT17+2JJcrqpy2ej4JSUBk8Ibxo0e6fV5/Ia5yqXizx
         zd3q1OONRlcGJJMyBI7LtbFyO3pfD7jMLgCF6HV48mo6ADTFOxxAm2hp7wwjKGQwopP0
         bWZzNLq6E2W3u+mAq8ydwEiYh6KttWcLQDiH4HA0wcGDA/aXddzbLWOCSDAuYPoY9N/L
         3mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580239; x=1779185039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBMmjAeqhyczJE1w2fvu/8tw1IKm+NA+d/AMe2qIoNc=;
        b=RHVVuY1ySOweahL4+GhpiSWX2l5MbjEx6bUFo94CIa9A9eryTkVZqu/igaYzOIYyjV
         3lX0AH3wOoERIOPa+73Y7NqPrQ0vDl2NUmqkvYhhY3cwCY/w1eOl+yY/14JlpO8PwJ/L
         GZCKOyn7KiogbVw2scQMtFZtn2XMy0GL6CvvkwGZRWOlg6CXN+1mmqOO8J2Ur5wEkLib
         fa1UqAu6QkQOCYRqYLEVavfV+Q0/wXaSYRsxXLdQBCGQSUEK7SgNp7SVqXhrv3J9XIjz
         pd0xA4vDJJfRMnd760TE2PvMBfoUqz8E06hyPYRSqoBfEPNvYXG511l51pzRYseuwG63
         ZGEQ==
X-Gm-Message-State: AOJu0Ywuol+QfCcF5e0zqv7xklxjD16qn8nKNdDyfKqb7rUcHVj+6Kms
	oTirtvKwr7lLyNDRGSzneoQHN9JJeJQJdNaAPAPY35eEwyy0RFsKPGFZ
X-Gm-Gg: Acq92OEkWFA7PjpdBdzboheLA+hOF4BLEqAs4449NHW36RETXfaOiZlvvhZWlO4Erh1
	Xc8aGPTY7QkRk8KMMvUerdxFnwvT+uXyvbt9rd1UqKJUfN9V4q/QSh6BX79AowEnLdeJKC+0P6z
	somwrm0HSCH+CUesidok63zYD55C6ae6V87c1/GBqCAnn7r3gb7IpOzc+rOTf7AYs0aav7FQpBK
	rneyiqHJ0dqoAYUMZ3WFZlHgwjYBtZX6cmhByveMH6mHd0BlyIrHaMsAh6if8Qh5FNe+tW+rIw0
	e8+f9qo9nVLp6gLyy7V/7rz/E/6qt9FpOFCv4LAcZpFwjuvO4mo87BSppiFzaUaTNSJZhCiG+bm
	jV2SSa1Lepck0SU3HQO2Sfc4zTPUzaO2X25hB7OhDwA3RmsYzJGW6yqo5RkrJgAp6V6AEAd7xxa
	7kDXHUStPPj3h+4vTcq2Ok0/k=
X-Received: by 2002:a17:907:7fa0:b0:bc3:7b0f:91ea with SMTP id a640c23a62f3a-bcc12768e96mr741948866b.19.1778580239083;
        Tue, 12 May 2026 03:03:59 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm570531266b.53.2026.05.12.03.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:03:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] staging: media: tegra-video: vi: improve VI graph building logic
Date: Tue, 12 May 2026 13:03:40 +0300
Message-ID: <20260512100341.53769-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A377951E44C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61240-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,bootlin.com,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.979];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The existing tegra_vi_graph_build function relies heavily on a one-to-one
match between Device Tree nodes and media pad links. While this works for
simpler configurations, it causes issues when Device Tree nodes do not
match media pad link logic (e.g., mt9m114). Switch to the
media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
linked to an endpoint, rather than assuming the endpoint ID matches the
pad ID.

Svyatoslav Ryhel (1):
  staging: media: tegra-video: vi: improve VI graph building logic

 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

-- 
2.51.0


