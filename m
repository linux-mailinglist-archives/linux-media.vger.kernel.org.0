Return-Path: <linux-media+bounces-55552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LN4A/RCs2l6TgAAu9opvQ
	(envelope-from <linux-media+bounces-55552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:49:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E8D27B1BF
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 425AB3065857
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512FC38734D;
	Thu, 12 Mar 2026 22:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="LIchj/JZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989FB4A23
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 22:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773355760; cv=none; b=nE5XZhDG3cN9ufuzsFaA6sGMHtFh0SaN/S2cdEoTvUE4CIMKjqgMAGZYOskEi2Du5802yEFtCtMF8k5jcjPZQbdqd1rEU3pGym672C02+oHQha8iI4GwIZJpsVhZDw8UiEWMRsmifBV7FqagEBuQ647cwQrHrULMlKrlxtm13SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773355760; c=relaxed/simple;
	bh=JYKzkxziDhMsF2NgCIbZ0s5tuzLaj07GcZ6suPGLLNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ltA3zCEHlZEeOFis0MO7udO35s6XUmp5v0A0SAkn49Uz5RV8/KTtjefLN1DBkB0TmU1Ahl2vjm6ODryZ8GLD5acGagLDkzkxBO2PBpcLFkmpDrpISdZ2Pa51npwj5pzjj5EpqDDnzSeBEZXmZ667GPb472E/jk942QtNhNase7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=LIchj/JZ; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40438e0cba6so1066000fac.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773355758; x=1773960558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EKBoXH3qduUszfuQygVawIP0LJUJWC1CMBV10KLeOLY=;
        b=LIchj/JZG8CtAMzhhH9UZTq/9bLJh37VKpedyDMexRiwpvoreZHpGDNxfmcrd5Pr6a
         ofaa7+JNVwdbEVg45ClrvSEaMc2in/YCFE9FPDAGtqgKC5GL+B+vPhHWpf/nTPUBV/ZW
         dF6Y1NgYm6NqcKXrtlOrD2YCDA92FT3P6jdre6KrFdaqWY9nN9f2fY7YtlflIZ5Ghs/O
         nNs8kMz3KLlBUzlMsc+CG9XDGb8pd/kXZ9jtriGjU8wOrMgngjwhrjRI3lwyCd9iUU88
         CRE7/yfUeXbu/Xi38/1Md+gi6qd6nLjopc0w6fVtJ5+MhHZkYX7RYtsNcl9IGRLt048s
         Rw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773355758; x=1773960558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKBoXH3qduUszfuQygVawIP0LJUJWC1CMBV10KLeOLY=;
        b=ctXqcbZMUZn54Y4shGzLS8r6uthaKNb9Pf9oqk5X5Tm25fiznGGszm0FhhP1WNLWP0
         N9OcNJJ1kknYzQHHhV8GVggIJnvYjh5MhOE7LVrezmsm34SzOnKDuFYy+7pXPHmUJ9gj
         GAH7IhVI/HKp2jnkjrZB9yjjOShqCHa7iNccoVtyHcijrjYFBfWKN1qVRgDVSU7DQopB
         oqWUkUpuQrQvBS0Dkyy3+ch6e4bQf48Wfmbg6x0n057i9dFcw4F/NWWwFMxdxjb0XJ+t
         dljH6dtQ8KHbqBvfqsrhPwozlyhgvyWNyRK3kBLJwmPgJe5N6AdupsenEq+RFCQ1jdkB
         KyVA==
X-Gm-Message-State: AOJu0YyqX+L79IW4qi96+YeNkgsmM643amYERTk/2gHHQ4AsUkA/mZPy
	O+/JYl1qlBSbwEbxiOCzn4hngGFG3UsPHzVr0BhgghMmhluEeRYLCTDBamiov0GLAKV18jy2yyd
	IDAksySw=
X-Gm-Gg: ATEYQzzxrlyrZ2iod/IZ89xGr9lJN9wzog3b51HX6D5klt9iQwNgcWcmXVod0MEry8G
	Nxjzpf6cl9wjW+rzKLVAT6HPhwPslj77U06BPCREo1BMJ3zrNzXFsVKEoE61pdyWsEpbhtUafuh
	AnixpVLoG0cxR6Wwh5BHSo0b68F0gyCuSPpQl6TtAjnIAPMTXEhuR46To/VPayfUOscL8mKCtmk
	MOYLVVtww5vSd5mLPWwz/CC/cHGKit1Apr2AHbGhsazJ9xKWKxaGjgI9NyAwr5VlddXADi9NtJc
	utZ2dtTYj0Gr2QU9S2UJbNGx1/FPG+PfyYLVJKbqgD42kFneYJAiYsC+HREIOAHlp9EVRd7opA5
	C/AqeP0LRG38U1LAkpjmQwZMo2ZnWzyjFO9F9sjuYwbsJLVGFsa+3ftYilIBMiINnWh6ekaQhmD
	qb3diDEo81WqTKTmwEFcNUrH9wbGJh0V+X42zFiKxphbXtA+4WL0Zy6MZbzs/HGetKy/LcezHZH
	LP9B0pIVkHwHh06n3qNZKtiSUA/Zg==
X-Received: by 2002:a05:6871:d615:b0:417:59e3:92e9 with SMTP id 586e51a60fabf-417b9397e02mr624006fac.25.1773355758207;
        Thu, 12 Mar 2026 15:49:18 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e26e2c6sm6690125fac.7.2026.03.12.15.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 15:49:17 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 0/2] em28xx: Add empia EM2828X chip
Date: Thu, 12 Mar 2026 17:49:13 -0500
Message-Id: <20260312224915.2907539-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55552-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 59E8D27B1BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Empia 2828X chips have some video input capabilities.

Included here is minimum support for NTSC and PAL formats,
for Composite video, S-Video, and analog TV. While only
"plain" NTSC and PAL code is supplied, this appears to
work on a variety of tested NTSC and PAL flavours.

For analog TV the em2828x requires already decoded CVBS
signal. The device included which uses the new chipset is
the latest revision of Hauppauge USB Live2, which has moved
cx231xx usb bridge to em2828x. In a subsequent series I will
submit si2177 tuner support, which implements analog TV in
this way.

A media controller decoder entity has been implemented,
so that graph generation can succeed.

I have left the long lines as they are in em28xx-cards.c,
they were originally left long as it is more clear as is.

Regards,

Bradford



Bradford Love (2):
  em28xx: Add support for Empia em2828X bridge
  em28xx: Add Hauppauge USB Live2

 drivers/media/usb/em28xx/em28xx-cards.c |  47 ++++-
 drivers/media/usb/em28xx/em28xx-core.c  | 146 ++++++++++++++--
 drivers/media/usb/em28xx/em28xx-dvb.c   |  15 ++
 drivers/media/usb/em28xx/em28xx-i2c.c   |   2 +
 drivers/media/usb/em28xx/em28xx-reg.h   |   3 +
 drivers/media/usb/em28xx/em28xx-video.c | 217 ++++++++++++++++++++++--
 drivers/media/usb/em28xx/em28xx.h       |  20 +++
 7 files changed, 426 insertions(+), 24 deletions(-)

-- 
2.35.1


