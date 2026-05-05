Return-Path: <linux-media+bounces-60404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCTfKgTj+WmlEwMAu9opvQ
	(envelope-from <linux-media+bounces-60404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 14:31:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8C34CD882
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 14:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6962E303EA59
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 12:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACFE43CEC3;
	Tue,  5 May 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQOU3M/j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C7443CEC6
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 12:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983937; cv=pass; b=UOIDYSU5s/J7xcShkOE2/BsWNEmVrt383YUd5bgjNVA9dBOdCTw3q+P1r2PDvl4bjFt2pVCapKXbBazy/yOYZcEovFZr1DwRGbGGsMYnr1SjNQFedH/QQvT+MZDrv8QwuPf5Bn5sk34pN3h5oq/jwR8pK0nG4ClOch5Li5uStQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983937; c=relaxed/simple;
	bh=HZWYzWladWJeV9q+/l+O6PxJw3m9uSCSBP6PCqtZITI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nrh59aX98mOG321umU/KyEeq9K3pp+ArUedvJ548gdHGCkdePFYbP/gEDCKkymbFnf/nU2E7f4jNVNoUDHbZuXRlIk1vdIuDGwgU05+xHJpCATsST3RXZFCzNLUv6sxxmW8408CSdYAuJ+aNgkPhQpGsTbvN0Aje6Mc9CM7Hp70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQOU3M/j; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64d5a7926cfso5019903d50.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 05:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777983935; cv=none;
        d=google.com; s=arc-20240605;
        b=CWnURG+kx77HQG3XTSBMnyNHRYvfcevGj576M4f4i8m2ylu6in/tQbNMAYc3hcOQHJ
         Rb4SwfGYtLr+ZklXGIiHyWESV0A+J9DhdU4B8EHpm11s2rF4znvDFxBQN7oJHP+wv6m6
         EBaNTIgDVOnP2ozuJDzCuyZUhpVNuQKijvyOhsHlBRPbAWEJV3iSHwp7RpzWEhM3wWxC
         xj5gyqjmUWZx02OMwUO0UAhbekcNXNOpBQN78sXmnjP+8b6GUksy0mI69CMPcm8nok20
         X++0aEN12B6k/hbqsowzpPzl0HG14lFHbgr3OAzWYFf7jQqhS6XILVQG7vyr3WkTTfNL
         4xyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HZWYzWladWJeV9q+/l+O6PxJw3m9uSCSBP6PCqtZITI=;
        fh=yPYvDOY9WZowN7u7UCHjGgKRqyPg/lLnZar50jOXrCI=;
        b=hElp9WHtN2YDLwACBfqxkEJ7WMufU4dPcHlCa2M5tU6ExR4r+3ucf6ZkoDkMog2GcR
         yPRi3IKSsS4APoX+0fY1WQm2OOehe2yXnHdue3jXmcWAgH88dUc99CwAQG8wPUuosbd1
         IspP602oraSZQITXtd8eudfzhQD2jw6WpBtEeAO8J4gKe9Gm/O1YeqT9+oSnQlCrKwjb
         ct3qcrDqfcLzqHf6AIWNTtDX3Df9eTC7f74Z/gUKJKa/a5CHM4PODrUEAPRrV0xR+7QM
         RtbGRlDhUFNXpOnMvOrqIjXAZaviqHSYJZqiJuDEG1PsjcHFXSB4GdJJIB1Bd9xFdTQ6
         lKqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777983935; x=1778588735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HZWYzWladWJeV9q+/l+O6PxJw3m9uSCSBP6PCqtZITI=;
        b=ZQOU3M/jG+OwqxFi729qgWQmFUv+ytbhs1jBEIQar5Sq2VGaMcFgpBe3e/Zrr4sB04
         k2MCsjSWVe9m+nUGYbwADmXCg36vV3r1oVznnJSlQWENc5gKk+EJ1EWQybXccT2Uocnw
         N73ZwF76OJFX4vK+WsiFgerU4zKGQ93hRYvxMMX7nRBuDPq00sORmxXhSvtZCgXJomzP
         JL2LHIC7Y6DTQmUsS/G4mtkWIxMPswCCdO1YmJpf7ABZsVJDOr3SKCI7UTwJ7eri2Azo
         Uew5lb+uP5efwW1WAmbZX+lY0S96cfjJdSSuGT68vU/qmq7jSSmQhqJtb4zro75C9z+p
         IFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983935; x=1778588735;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZWYzWladWJeV9q+/l+O6PxJw3m9uSCSBP6PCqtZITI=;
        b=SmaThLEjObkKAxE6L/bbbAlInA7jx44AE4IzqqGajKciokJNqRcYvZbJfwS1TvZVKi
         Yci4BrUg0sGQPCNgj/zuY0W9LnYJN/G5tPvCRv9T4qpTumBy5ps8hQs411t3TOJiuDkI
         1gXTkNWPaHy+w3a7/DB3PZDxfkYQ7nJwmTVX95pTMIF9v2gJ6m/zX/Z/R3X45UNajBVg
         FtiQAW/eDvyS1OJPzhyO0UT1Wf1+ydEXLnItaMuTvy9gLwqBshbMyk9YbSt/hZRLKxdx
         h2woZ/0Dqb4DKNPL+Pq0CXMQRqAHgnJBK2jeb55JpfSpckiaMTJkr7zh9MMr9lg6EMNM
         Fbww==
X-Forwarded-Encrypted: i=1; AFNElJ/szgH1N9EUaLs8ZhpZgJDe3/7M8QOjd6T5NdBC8A5W+rpf+X4f+xrQbzTk/WEnTjExK5+zkdwJpTISVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI9Xo4svi91YyXSrLLGklCYYmKESWy2zVCYneoMq6JHEscqsck
	8jFJEzviye+G/FoCrkBYCPrssOlEXoKcExvJvkR9zVbX9x+fIQTaLyRlXsbqeUvtelnIh2E3vaW
	CzarTksUcTqRTm8dHlubwL5FGrHFVrCA=
X-Gm-Gg: AeBDiesFTzzGzuP7Go4GHr6WHUAgDTjiRET/RsqTnF5vXO0Pt18oW+c6CqAycFYnTNq
	XbUvSfhEfpZL5ETKds8mL9NadqhE9RM3jJ3MP7X4J1TIwzBDzpiGFwjmGZXu66FxP2bPPRylR0m
	Y8Tbohlmo99OAAbl7go8pVMiP6gIp1xcXTGjIocZDmyo7RlOqZcxtA3n01JHYvKFJxfTfJWsy0m
	nWGQA+bcmentW4YVJEaDcOM4DV7DdihVN9vmJHLEX11FeREpqvhBqknblDjebqCTKfEHgmGOvK1
	PZUbPrhCsscbI0eD3CQp/CUJDtvbJxvDd8W66ohPHWq7hy/4b92X2a0x8ro=
X-Received: by 2002:a05:690e:bcc:b0:651:c642:92aa with SMTP id
 956f58d0204a3-65c3d96c23cmr13772518d50.4.1777983934692; Tue, 05 May 2026
 05:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 5 May 2026 14:25:23 +0200
X-Gm-Features: AVHnY4LL44QJqBkbe9sCcXJw21A8-75K1LYnugX0XOneV6VVtcfwiV6fhBeQKiE
Message-ID: <CAHijbEXhuVRgkkPA2dAC=njGBU7vpAbxAbsSmxvvPznO-ckVRA@mail.gmail.com>
Subject: Regression due to /sys/kernel/dmabuf/buffers removal
To: "T.J. Mercier" <tjmercier@google.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	corbet@lwn.net, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: AD8C34CD882
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60404-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]

In ab4c3dcf9a71582503b4fb25aeab884c696cab25 ("dma-buf: Remove DMA-BUF
sysfs stats") the /sys/kernel/dmabuf/buffer directory was removed.

I've been using this interface, specifically the exporter_name file,
to detect dmabufs created via udmabuf. Such dmabufs show "udmabuf" in
exporter_name. I've been doing this for two reasons: 1) to detect that
mmap on such buffers will be fast and 2) to detect that GPU access to
such buffers will be slow.

With the removal of that file, that detection mechanism no longer works.

I'm not particularly fond of that mechanism but it was the only one
providing that functionality that I could find at the time. If there
is another one, ideally an ioctl on the dmabuf, please let me know.

Shipping an entire BPF compiler in my application, which the original
patch suggests as the replacement, is not an option when the removed
alternative was simply reading a file.

Thanks, Julian

