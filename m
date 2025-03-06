Return-Path: <linux-media+bounces-27780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3AAA55710
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 20:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7ED2169E15
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 19:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6F9272917;
	Thu,  6 Mar 2025 19:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X8icVlPx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35CB27183F
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 19:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741290414; cv=none; b=o5iJJ/9cjmN2ny5OXG3vwfj3bZX1BgvXksPSiA27GFRkqRSYVljvBkpScJhrLI1LpI8mNRUVw5xfbWpqKeC8AJng11gKqfxKCmzMpMrCwnucZ9zjQyUokibrrIVUrjQAbI+lU3GydcOwEFnasFENSxUFcbI7xxurDU8DjqVZ+qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741290414; c=relaxed/simple;
	bh=Qy7zGsJTaXY4YvT3V6KgAR44azxYg0LCKGz4DciGpLw=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:Cc; b=RDeireccJRkHKdy53sa5WembaZrZ6jSehitTEesaR/DH9YB9mX9zKKvOi1qvgTi8lWr8FWRq6Pg8N4O5mINWS6ZxHLzdTKJpuYsZL4i9qwUICrqf2zyRGe3aw9RzldMZkkZ25PExGg5Oxa3wJYCHhcROTGvXWmQt5en3RmwVMWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X8icVlPx; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85ae4dc67e5so32366739f.2
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 11:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741290412; x=1741895212; darn=vger.kernel.org;
        h=cc:to:subject:from:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vAZsrQ5pHfKfGgxDS14zPnvQCXj7F1Vy1cfr1GUo/8Q=;
        b=X8icVlPxEPYrMHLFFVZ8vqVsvKbTOHHHtSW6jsCeDfgwViL9cu06PeZ8ykuy9Mge8Y
         dLIrvIcDzUvzJI87Fz8+Ou8dgGQU5Qp8so5UgEzCMOpxAfTRwccSKP8NFGAIxEbbfTzp
         h52bz4mr7j5YZ8VDMRfgQ76XlIREM/0/4kS58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741290412; x=1741895212;
        h=cc:to:subject:from:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAZsrQ5pHfKfGgxDS14zPnvQCXj7F1Vy1cfr1GUo/8Q=;
        b=lsuHo0lmuS2WOK3boKVJwAvpTTz6cls6whv0+n4Ah/r9jjg9UX/dkjSHEFkDfRWFMm
         EGtYbUNtXZwRVzX41/grH1+5VRrn/R4jaq3YIlKWy74rJDcYTjTxR6H1Tef9WPzpcZlB
         Ixx6LEzSFet5cGFmuZ4dMVW/4SpSaoNdKpY/xGEV7Bnj5Vrrs0Bp/hVeQov4p7qNZHYV
         OmWd2YD8m3Ld7S6Ixt1eXUG/Eq6iTN0KGhJG4QshGHYAIXe3O+KF9tiSan10B0FWs+ec
         fjVTGvPD66b3C49dYO2GreMmcQ07srAailuVioXQU/9SqZEs+C9RhipHN6TFNEk1VG93
         456g==
X-Gm-Message-State: AOJu0YxmxphpvDs4dz3NtfDidxxFBUpu2ybie+1M2C6T1cCtHd4C7y+g
	d6U4h7tPS0qnByhwpyzBQInj+SYrlpnFdgeqMo4IrUtP9jYJyKeRYwOiwLWEk1E=
X-Gm-Gg: ASbGncs4abVI9loZTHOb3/7g6YZG3vm+qJ242uhT/KVfLQ8sS/fYfcPmGLiA/nBRqNs
	Hf3c7b723mHV9oSwYNrUSDMMgCoXu8oPJW07NyRtnP+OYFWMm2eg7KuL2lAVUPkGK954uLWzbYU
	xbGBcKCLbD3mVq7atMousBqKGg0LVV3OQbyVyWV3WRtaAjrqEKq9cI1inl+umg1EPiTjWYNwm9v
	mWBSYXK84qLPtzvBgR5csK1im1Y8F21REGUG3ej19v6c/aAo3KCLmsROimgQsvsqI2zB3/Dp7GQ
	wZAAlR9wWSfB0+qrGa6fWYX10kXxZCg5kl6MixF65uNeYT4OmH908Z4=
X-Google-Smtp-Source: AGHT+IE4jehB2r0k/L1GncTFMRlZv1hWZJcvcV/y63BhnbuVN9R9itnxTvtsR2t8iDnag8rzRyLbxQ==
X-Received: by 2002:a05:6602:3818:b0:85a:fd12:9270 with SMTP id ca18e2360f4ac-85b1d05d2e3mr108030739f.10.1741290411723;
        Thu, 06 Mar 2025 11:46:51 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f209dee919sm518783173.15.2025.03.06.11.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 11:46:51 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------w78nUxmUbzxQVn2eMG0M3ZMu"
Message-ID: <a3344fc3-c7ea-44ae-8fc8-86184315a58f@linuxfoundation.org>
Date: Thu, 6 Mar 2025 12:46:50 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] Linux Media vimc update for Linux 6.15-rc1
To: Mauro Carvalho Chehab <mchehab@kernel.org>, hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>

This is a multi-part message in MIME format.
--------------w78nUxmUbzxQVn2eMG0M3ZMu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mauro,

Please pull the following vimc update for Linux 6.15-rc1.

Fixes a bug in vimc streamer pipeline init code found by syzbot.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

   Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux tags/linux-vimc-6.15-rc1

for you to fetch changes up to d6813eb9c3de01307801f253d89d777b4669a0d0:

   media: vimc: skip .s_stream() for stopped entities (2025-03-06 09:11:39 -0700)

----------------------------------------------------------------
linux-vimc-6.15-rc1

Fixes a bug in vimc streamer pipeline init code found by syzbot.

----------------------------------------------------------------
Nikita Zhandarovich (1):
       media: vimc: skip .s_stream() for stopped entities

  drivers/media/test-drivers/vimc/vimc-streamer.c | 6 ++++++
  1 file changed, 6 insertions(+)
----------------------------------------------------------------
--------------w78nUxmUbzxQVn2eMG0M3ZMu
Content-Type: text/x-patch; charset=UTF-8; name="linux-vimc-6.15-rc1.diff"
Content-Disposition: attachment; filename="linux-vimc-6.15-rc1.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdGVzdC1kcml2ZXJzL3ZpbWMvdmltYy1zdHJl
YW1lci5jIGIvZHJpdmVycy9tZWRpYS90ZXN0LWRyaXZlcnMvdmltYy92aW1jLXN0cmVhbWVy
LmMKaW5kZXggODA3NTUxYTUxNDNiLi4xNWQ4NjNmOTdjYmYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbWVkaWEvdGVzdC1kcml2ZXJzL3ZpbWMvdmltYy1zdHJlYW1lci5jCisrKyBiL2RyaXZl
cnMvbWVkaWEvdGVzdC1kcml2ZXJzL3ZpbWMvdmltYy1zdHJlYW1lci5jCkBAIC01OSw2ICs1
OSwxMiBAQCBzdGF0aWMgdm9pZCB2aW1jX3N0cmVhbWVyX3BpcGVsaW5lX3Rlcm1pbmF0ZShz
dHJ1Y3QgdmltY19zdHJlYW0gKnN0cmVhbSkKIAkJCWNvbnRpbnVlOwogCiAJCXNkID0gbWVk
aWFfZW50aXR5X3RvX3Y0bDJfc3ViZGV2KHZlZC0+ZW50KTsKKwkJLyoKKwkJICogRG8gbm90
IGNhbGwgLnNfc3RyZWFtKCkgdG8gc3RvcCBhbiBhbHJlYWR5CisJCSAqIHN0b3BwZWQvdW5z
dGFydGVkIHN1YmRldi4KKwkJICovCisJCWlmICghdjRsMl9zdWJkZXZfaXNfc3RyZWFtaW5n
KHNkKSkKKwkJCWNvbnRpbnVlOwogCQl2NGwyX3N1YmRldl9jYWxsKHNkLCB2aWRlbywgc19z
dHJlYW0sIDApOwogCX0KIH0K

--------------w78nUxmUbzxQVn2eMG0M3ZMu--

