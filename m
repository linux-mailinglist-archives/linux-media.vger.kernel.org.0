Return-Path: <linux-media+bounces-67558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9sEHIu8lVmo40AAAu9opvQ
	(envelope-from <linux-media+bounces-67558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:05:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF25E7543F1
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:05:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ArLxSAFx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67558-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67558-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCD57333947E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73443A48E6;
	Tue, 14 Jul 2026 11:47:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF57D3A0E88
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 11:47:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029629; cv=none; b=BosEdjxMGBX2E0o+AmppNU1A0FBr+SPoIHOgKAIrKtC5xR5KRn3AWaSDkK+11RnO/3KqvSjiwIBVybnNhO8bYp0++CRkMtDMC5bOHJM56oNSgm0YhBvuiYayHMJcOS8Y57oReDIqRFbUjC4555i50oJe+byzddI8NhI9xDBg5U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029629; c=relaxed/simple;
	bh=X2wVqRoit1+4E3SJBgb2YLDCRJq7n5J1UWwaW8Wo32c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgKOnrmC2MVRLcoPQgNbRWlsee2SaziPbT0BGV6YYkPTw7IakSggKW052779P3Va1MNcIfwF0Urjx6wo07Q92tH16A00o2uduJGS+3T5WvNW0a8WIP4YKwyqtIjb33tla/c/SAwWuCUbJtXm6zDbyq/qWeH3pQEkYS2Q2/YzBtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArLxSAFx; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso4051323a91.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 04:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784029627; x=1784634427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQQ+xhhQTJIQk1G/3qoal2tftp25+Ya+e3y9IcyhICU=;
        b=ArLxSAFxkT8wPJ4FUtusvN4arssaKMGkBVoyTZkrkBNkQdaGd7icp9J+xwfvjhVkKz
         kMzGj9xygRiapIDXvDuaon7eB/jDOt6d5JH1pG2FgfygAqzVA78kO35gIld/z0quviN4
         8mJZaJbPMXGpl0Rt1Vhvvx5pqSIQvewd/lG1Tkh9Yd7DHUD1uDfKvLFco48N+TDiVY2f
         SGxoJEHUWSxpciaorcmUfE7eJZp9gzODwjmNXye3v1CBWUiWARAYkvLxo3UcpX1eU6Lu
         C/iKy/EAi+VJ715mQg7Mva4eQLF84hs6XtgI4xF318mq5vF7l5Tq4gL1XF39eljdjfaK
         f+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784029627; x=1784634427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQQ+xhhQTJIQk1G/3qoal2tftp25+Ya+e3y9IcyhICU=;
        b=V/RmQjSPto2RWYtLKmg1pnWUbPHeBUE5wlMgHUCehkYlAqarq3UZEMAgtr50AuEH+a
         2wCWMbfCKQ7PNwicX8uRyx5ky9/TLaSeBrtmNPE+mh49M7MhXMbmbPNF+3AN0HqinDzq
         Lj4tGCFnyD3hb5AubjmlyVot2lOaXF2x6dRPJyD3kIlKOy0Ztv+SpkE8A3DXE+FhJ1Zc
         Re2Y1wzSlQN0HbpPwOmCEyprb6+InwjKgoebSBf8ZayOxl61/Rf5Dlmfmkr7NAMG3zrX
         jdXqBgufH5aIZDChjrq3HASjc8lVUuEbCISTImpQ3GMWkyKgddhi4qclJqmTDLa327m1
         E43A==
X-Forwarded-Encrypted: i=1; AHgh+RrZxGgvIXCALvfwAIW9nQWeinFxtJLSBAmBPQGsFAKPqG1tyTDNfqd/QKXDNHJhHj9M8rKuqNIxKlQdcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7TPtqFnvwYiyZvvFiE8VNCjgO5VY22YI4IwxIlRgSuC4EYceu
	3o4agWIKi9CAIzFHGgYrFCzvQp4u12x/KcvgnZok6IsoCz9kRd+U8IjPRXbYFpn6
X-Gm-Gg: AfdE7cn/GzecsbSycK/ZEESy/S5/CNqxWK8buV4UMAGPBQ0xfpv00piGltqUk4S5iHz
	mg4EpgUkvwFaUgDbfb1kG2/QqV30twmKI6g+I436rIeyKJx6OOSc+itFBrbL9U+y7OVNpYEHfm7
	C6fFauTKfQXM71tBv55Yikv981DW4B44FED5Jp9Yf+S1Qjl1cJtzv0sNe7415WKK2xvzv1FKbyg
	vX8y3QvT/K5u8LrUdzFVNb7wS5V1hb3PZ4IRTumIdGNUz+PbEc96vFrtRJTokQUdk8lgCizEqmB
	/0B85qM2OGNz88WHiFfJQCcuzD5ysSqI3BvQSx5EMvL9pYKeoGp6WRD6NuMvTfmdx5mn2+WSVZ4
	tD4eg4eLGVmCXlRpG+x6kzRneNdkxDZ18jwyu4Dp1YGGjD+HLJ+Qm9QDmgzTYf1NDKSo1ovzQdp
	cJfuKkNpziLjR81Hak
X-Received: by 2002:a17:90b:2c83:b0:380:f34a:6ff1 with SMTP id 98e67ed59e1d1-38dc75eb657mr11649534a91.17.1784029627050;
        Tue, 14 Jul 2026 04:47:07 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e17470008sm1356162a91.17.2026.07.14.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:47:06 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Sandeep Patil <sspatil@android.com>,
	"Andrew F . Davis" <afd@ti.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: stable@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v3 0/2] dma-buf: fix fd leak when copy_to_user() fails after fd_install()
Date: Tue, 14 Jul 2026 19:46:52 +0800
Message-Id: <20260714114654.3885457-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67558-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tjmercier@google.com,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:sspatil@android.com,m:afd@ti.com,m:srini@kernel.org,m:stable@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:shoubaineng@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF25E7543F1

Several drivers call dma_buf_fd() — which internally calls fd_install()
— before copy_to_user() returns the fd number to userspace.  If
copy_to_user() fails, the fd is already published in the caller's fd
table but the ioctl returns an error, so userspace never learns the fd
number.  Worse, the window between fd_install() and copy_to_user()
allows other threads to observe and manipulate the fd (dup, close,
SCM_RIGHTS), making any "close it on the failure path" fix unsafe.

The fix is to split the allocation into three steps: reserve an fd with
get_unused_fd_flags() (not yet visible to other threads), do
copy_to_user(), and only then publish the fd with fd_install() via the
new dma_buf_fd_install() helper.  On copy_to_user() failure,
put_unused_fd() + dma_buf_put() cleanly unwind with no user-visible
side effects.

Patch 1 introduces dma_buf_fd_install() in dma-buf.c (wrapping
fd_install() together with the DMA_BUF_TRACE call to preserve export
tracing) and applies the fix to dma-heap.

Patch 2 applies the same fix to fastrpc, which even had a comment
acknowledging the problem could not be fixed before.

v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubaineng@gmail.com/
v2: https://lore.kernel.org/dri-devel/20260710105430.3059661-1-shoubaineng@gmail.com/

Changes in v3:
 - Split into two patches (dma-heap + fastrpc separately)
 - Add dma_buf_fd_install() to preserve trace_dma_buf_fd tracepoint
   (spotted by T.J. Mercier and sashiko-bot on v2)
 - Add fastrpc fix using the new helper (suggested by T.J. Mercier)

Baineng Shou (2):
  dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
  misc: fastrpc: don't publish fd before copy_to_user() succeeds

 drivers/dma-buf/dma-buf.c  | 20 ++++++++++
 drivers/dma-buf/dma-heap.c | 80 +++++++++++++++++++-------------------
 drivers/misc/fastrpc.c     | 16 +++-----
 include/linux/dma-buf.h    |  1 +
 4 files changed, 67 insertions(+), 50 deletions(-)

-- 
2.34.1


