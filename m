Return-Path: <linux-media+bounces-67412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D3sdN38CVGpugwMAu9opvQ
	(envelope-from <linux-media+bounces-67412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 23:09:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3C9745E8E
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 23:09:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pkNq13xK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67412-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67412-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D50430028A3
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 21:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104D13769ED;
	Sun, 12 Jul 2026 21:09:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx2-f0.google.com (mail-yx2-f0.google.com [74.125.224.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B550271A71
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 21:09:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890550; cv=none; b=k7DG+bHhV995QBwv6y/Hj0Z4wGb5NvrBDcphRwp2/LvGLCMhVoeVDrkMb3mJ6pBGyl+IKE2HtcarPFsz/UtyD4NY2rT5Ad0Sq57UcHmRGoeld1CBRJeqFQ8HPXlxoVk3sh08LltvlBntuZYNypQekaMQeXCCXovq3SRTo+sRbvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890550; c=relaxed/simple;
	bh=bFE/JWW9TAkcpUmzVOdNJc9U2Zqimvu4ws4jMJRFwcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N82FMeng/jKRT+APIc3Pc/Z2L37bdfD2zFqDMIqLLd2HLsZEdwNNXryE9agssE7w5CHXzRWAEy6gD7gem3CzEZjJusMrv1z2HOU/aJA00psJoKTn/aggnQySkVJUCU3xw1c2sVGvGMbclakSsc7TeZzUTm6GQdH5UA+E4GIPBk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkNq13xK; arc=none smtp.client-ip=74.125.224.128
Received: by mail-yx2-f0.google.com with SMTP id 956f58d0204a3-66282525fe1so1726552d50.1
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 14:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783890547; x=1784495347; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1kr4dGY6ek9n+czCQ3eQcMwxF8cQoVhvIzP5bcZmOvM=;
        b=pkNq13xKCyfvQ/MVNn3pflQJBIKqLDtrHk48ISzSaCgOhBug1ewZbfM1YDDw+OgEf2
         iWdlmXpBY9kmgn9YgFa2Gh4a6MnuwTcP7u9e5gmqEKkgb3cqsmUBRAcVARrtKW8VDb1I
         S1oMtGHezwwTH2Q9XdL7L4iaESlAt4DTW4hJ4Dzr56vZmcEHXvqPksk47CWzzsYkVJyv
         mxJK739cJQJzqSjRawbaxCHqWJ7jw+evTJCYFGcz8c/6L6XK+y9Nn9vW7TWhJ36cxMIM
         0EglwZYOcx9zBz0/GNZqr6IvQhmBpnZyGDC3wq+AuYlnR+ENDxODHTOQ6/0ovAJV5gij
         DruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890547; x=1784495347;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1kr4dGY6ek9n+czCQ3eQcMwxF8cQoVhvIzP5bcZmOvM=;
        b=Qwdox6NFgnD6MctBJaJKtGKb0jE1AwamGaFp28uJBQhxjhMO6kyiqWF7THId4GAteX
         gou+iH8F+niESEOO/x+0kg9vVI6EGUccqUpBL3xI5OlnEKB3PyVx260IqzBGKcYlfStH
         sLBzsrYp+gJdbOc7lIPL7Cz7faYnyT/6R0yoBQ9JIegJVeMz6+nyXMX28hjhzOtmT9+K
         QUFfnRd0QHqshHmQAath7j6YkWWToxJ/4em5FiDRzXSyoAnfHh37H5SQPdrjFbUdxBEO
         AEiVr+gAk/FrwPokWvDe94Kix8jXSgg4qkjRuLXHtRLyS34IWjTW5QwwhPcAUlAA90RH
         Mxuw==
X-Forwarded-Encrypted: i=1; AHgh+RrW44Dl+GON1Wkfw7ET+yEK27XnXY9HmIbtq/zhe5/94D3JdpB65Jf5P9dfNkxAO06RAtPzpaeag1o/2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/bkGsdsihbX8J3YecITPvb4siiRfLL2P5+GUKzGbod2j9CfCp
	vBWOL8JAdAdqcYiVaTOGF+Ijqb2X2GGkfxkxySq3haaULUc7beZYd6sy
X-Gm-Gg: AfdE7cnd5x0W2mm7rBgcR2CHOuxbuKX1OGSOs3uUCjcQzv95nbnp8lN40fb3sUdOfLW
	YadSpYdoL91HiYlVN6/NxxE4aw/9mTbgMMmlFPmHhP1JKW2+x5lLKTsUjVeS16YRGtg0l7M95B6
	ZGjzC8CXZvJIWaZDrGXKsLMYXRME9yRNUVpt7ziORKDpIz/J12O19kQN7BndV/n1854PtssF5v7
	SCGowdA2SBrnuqv2TjxBxkok9BxDQUABgHcZnuaSo4ml0qH2v8r1WZWpcInTHowGxqcEVYkhPDe
	Mc5oQ4FniLjLgTLMYIdxBi8qx9vUmMMaPerCvv7xVFcc1I+OgOeGLySpgweG4jg0gvgrVzFniTe
	nN0oL+53hHN9p6X0pGC+hU5jMwqQBarSWpms5TjyZk5Y7okA/GsUQ14bessIaktCzgXowtJB/Cm
	MgMchSLr5W8m+CwcSbzt8SRRiEle2gCXk7eMNVSeC3iRE35cKOh/RabRgbqrWEThLwy2FWOQ==
X-Received: by 2002:a05:690c:2605:b0:80c:ff94:e87c with SMTP id 00721157ae682-81e901090dfmr57952367b3.44.1783890547511;
        Sun, 12 Jul 2026 14:09:07 -0700 (PDT)
Received: from [127.0.0.2] (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be9834dsm99737387b3.9.2026.07.12.14.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:09:07 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <colin.braun.cl@gmail.com>
Subject: [RFC PATCH 0/4] rust: usb: add usb request block abstractions and
 a user
Date: Sun, 12 Jul 2026 16:07:57 -0500
Message-Id: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC0CVGoC/yXMQQqEMAyF4atI1hNou6jgVWQWbU01LnRIqgyId
 7fq8oP3/gOUhEmhaw4Q2ll5XSrsp4E0hWUk5KEanHHetNbhJhFD1CIhlbrF3aJxJvg2W59yhnr
 8CWX+P9H++1q3OFMqdwnO8wKgSIC2dgAAAA==
X-Change-ID: 20260712-urb-abstraction-v1-020a67f16cff
To: Miguel Ojeda <ojeda@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
 Colin Braun <colin.braun.cl@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783890545; l=3122;
 i=colin.braun.cl@gmail.com; s=20260630; h=from:subject:message-id;
 bh=bFE/JWW9TAkcpUmzVOdNJc9U2Zqimvu4ws4jMJRFwcE=;
 b=aqEoR5ebo1/QQ/Rm6VEYTSCX5E60MN/CL5zIQdHKdjL54xZXUZCkk7TZT1E591D+0VJ8cl6aA
 LC57ADqqnGHBiP/zetpJB+loUSSDscTfQc7/Lt8/rY+IYrjLXZKWDHG
X-Developer-Key: i=colin.braun.cl@gmail.com; a=ed25519;
 pk=DJ5DDAbTXtW6OgSgetK6R1PUfhtCNSvSayX3Je17ZAY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67412-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:colinbrauncl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[colinbrauncl@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[colinbrauncl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A3C9745E8E

This series introduces initial abstractions to allow for the
implementation of USB drivers in Rust.

This is an RFC to demonstrate a rough idea on how the USB abstractions
needed to create drivers in Rust could be implemented.

The series is broken up into 4 parts:

1. USB chapter 9 standard descriptors and constants - Exposes the
   necessary structs and constants from include/uapi/linux/usb/ch9.h as
   a new ch9 submodule.

2. Interface and endpoint abstractions - Wraps the relevant C structs
   and functions defined in include/linux/usb.h, allowing drivers to
   safely query and configure interfaces and their endpoints.

3. USB Request Block (URB) abstractions - Creates a safe wrapper around
   the C `struct urb` to allow Rust drivers to communicate with devices.

4. An initial user of the new abstractions - A driver for the GV-USB2
   composite-usb video capture device.

Patch 3 is the bulk and core of this series. By their asynchronous
nature, creating a safe URB abstraction for drivers to use is tricky.
The goals of the URB abstraction are:

1. No `unsafe` needed in driver code. This means providing a way for a
   driver to safely access private data sent with the URB.
2. Drivers are forced to handle the URB status in their completion
   callback before accessing the URB data.
3. Dropping an URB ensures it is not in-flight and frees its resources.
4. The URB can be safely resubmitted from the completion callback.

The patch elaborates on how these goals are achieved in more detail.

Although the URB abstractions do not include immediate support for bulk
or interrupt URBs, I believe it creates a foundation conducive to
future, safe abstractions for them.

Patch 4 is first user of these USB abstractions. The initial
implementation is very much bare-bones, only exposing audio data via
debugfs. It is based on the in-tree STK1160 driver and an old,
out-of-tree driver written by Isaac Lozano [1].

[1] https://github.com/Isaac-Lozano/GV-USB2-Driver

Signed-off-by: Colin Braun <colin.braun.cl@gmail.com>
---
Colin Braun (4):
      rust: usb: add USB ch9 standard descriptors and constants
      rust: usb: add usb host interface and endpoint abstractions
      rust: usb: add urb abstraction with control and isochronous support
      media: add gv-usb2 audio capture driver

 drivers/media/usb/Kconfig            |   1 +
 drivers/media/usb/Makefile           |   1 +
 drivers/media/usb/gv-usb2/Kconfig    |   9 +
 drivers/media/usb/gv-usb2/Makefile   |   1 +
 drivers/media/usb/gv-usb2/driver.rs  | 361 ++++++++++++++
 drivers/media/usb/gv-usb2/gv_usb2.rs |  16 +
 drivers/media/usb/gv-usb2/regs.rs    |  25 +
 include/linux/usb.h                  |   4 +
 rust/kernel/usb.rs                   | 905 ++++++++++++++++++++++++++++++++++-
 rust/kernel/usb/ch9.rs               | 295 ++++++++++++
 10 files changed, 1613 insertions(+), 5 deletions(-)
---
base-commit: 30e873dd61b044092dbc657c7c67a5d19adfd933
change-id: 20260712-urb-abstraction-v1-020a67f16cff

Best regards,
--  
Colin Braun <colin.braun.cl@gmail.com>


