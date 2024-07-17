Return-Path: <linux-media+bounces-15068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81A93394D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 10:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBDBF281376
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 08:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B4839AEC;
	Wed, 17 Jul 2024 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KatfJBoB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52DD12E7F;
	Wed, 17 Jul 2024 08:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721205753; cv=none; b=ma1mjb2EPWeDe9Mr2Xu24HTBkaXh0ijS5no9ZOwjy3PPbW3cGErzmGrlCpUFzQBK+mxJzgnPUivfNuDyUd7lHd1sLeXzCvhjId5VrC2tCbFrOkc4AGLfFVl/O55kA0kefKzYaFA5qXzJnvG8YxEpFfcUDSSDvdl+yLVV64u+064=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721205753; c=relaxed/simple;
	bh=RStoaZ0tPyIJ4HDQCgcMDhZfDoRGZ9e4TcdIwm2I28E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bui2acZkNjWT1wgbJ0liHEwkKZrQP8f3zdvWf/zT6WZBYSJ5w89YusTyizcCQMFPOQlbUjAbbm+NFwf52NA8rKu+0onMEr4NWeo6ajtpFGqgoPATyoAhpRKG3j/rcTCgcZe8YSkMOjlpxANuif7ETxIWJ3TJvTQiYyEGSO1xpq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KatfJBoB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a797c62565aso666310266b.2;
        Wed, 17 Jul 2024 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721205749; x=1721810549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=746aN1Dbk1XIVmQy7bVKJXGdCwcI+eJL7zxhTS+X0mE=;
        b=KatfJBoBz5wKf68SOrmnY0wOXejms92VRXi60cdmp+csyHqBRIbD5UPs2x3gYGH330
         BsAMb4W3ajC9yqd+J5opZbUoOAFkkxuUODUmR57yOm6gU6Ru3VlXP19CnR5I7d0kKdkf
         JR0j6yPOrSpDcy8RUWM7MbTr+jXWNp8AyhD2LZ9ncN9QWfkYR1m9N4vsWESwU1OIrdTk
         blunImp2EchKDvWgqnu7HPUYwJXX6CVURC9QPzJEIW11FvbdsS09j9f+LRWUUXyDajWZ
         WecBuD+pAzk6QOGDgkTDDI8OH88jdv9pK6/3desXAMQ9X0nD4eH/O0XEDWQobUOGuQ1k
         hzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721205749; x=1721810549;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=746aN1Dbk1XIVmQy7bVKJXGdCwcI+eJL7zxhTS+X0mE=;
        b=Nqtds/E3+NSTfkwI4R4Ulvi948IcEJsqtPGhY9v/hVeHj4//M82kGjba5rRIyloxTO
         ndb9hKAYGQlDHTIarfgS526WU93YEibpC4hsazcUJ/kPtzjvo7cEIj0x1cxd9Gqk62JW
         nQ8QUnK6te0JW4vi33+TVJ54PNFHhoHZPinnUUvzPLVucivPBVUFKo/dGqQYVWmOaX8T
         b4G4us7ZEs1zwRRurr8+VqjqscK88OAOdbSrtve5UgAFo7HyaGLmK9e4wQIfCNZNzhP2
         V9kgyIHyIsTOJjnVpcs09JTAPzCKENpu9g10aLcVJQ+MtGv1zIFg7+hXXf3YgOxuH8Gj
         EX1A==
X-Forwarded-Encrypted: i=1; AJvYcCXeqAdlk2qRX8iX46oLCPPajB19TVF+bW8yucbZRPNNkGBpLZ6dZxXeyaw2MxD0kp1XkAWckdXe5Uhh8vRPjKf7KevPlZb3+1gb2rUQ0X9BvlEZJhfCNpDKHqhCA4B1cWbpfV/al4bkNlc=
X-Gm-Message-State: AOJu0Yz3xIGGos/Sp8SzT84h47dAMz5jOj+2XgsOky8ffhFXmYXIiWs9
	Xkxs2KXuENgapUOny3SFoI5UIlqrnqVmib13ASl+xlEZj2rFhXXKuoN9HthX
X-Google-Smtp-Source: AGHT+IGYnmX3eZKw7oN1JjvDmmUvKfRij3It4kG7UXO9ruXF2/RRsvhV3RPiQcP6DuWaT30QXWAprw==
X-Received: by 2002:a17:906:547:b0:a72:8d2f:8594 with SMTP id a640c23a62f3a-a7a01147a55mr67280266b.27.1721205749206;
        Wed, 17 Jul 2024 01:42:29 -0700 (PDT)
Received: from foz.lan ([95.90.154.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc80116bsm417466866b.185.2024.07.17.01.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 01:42:28 -0700 (PDT)
Date: Wed, 17 Jul 2024 10:42:27 +0200
From: Mauro Carvalho Chehab <maurochehab@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.11-rc1] media updates
Message-ID: <20240717104227.23de2235@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-1

For:

- New sensor drivers: gc05a2, gc08a3 and imx283;
- New serializer/deserializer drivers: max96714 and max96717;
- New JPEG encoder driver: e5010;
- Support for Raspberry Pi PiSP Backend (BE) ISP driver;
- Old documentation for av7110 driver removed, as a new version
  was added as Documentation/userspace-api/media/dvb/legacy*.rst;
- atompisp: Linux firmwares are now available at:
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/intel/ipu
  so, drop firmware-related task from TODO and update firmware
  logic;
- The imx258 driver has gained several improvements;
- wave5 driver has gained support for HEVC decoding;
- em28xx gained support for MyGica UTV3;
- av7110 budget-patch driver removed;
- Lots of other cleanups, improvements and fixes.

Regards,
Mauro

---

The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

