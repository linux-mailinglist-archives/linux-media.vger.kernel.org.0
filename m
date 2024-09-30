Return-Path: <linux-media+bounces-18883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFBD98AD05
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 21:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 567DFB21735
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 19:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D73199234;
	Mon, 30 Sep 2024 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AD6z371E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9138E14F9D9
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 19:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727725110; cv=none; b=fsVgAoFNGdOdVhNMv4GkWB7GWyQ0RLUPj/sVHIzWLUcBl/3M0eVdLO4yIhNIJok4hQmyughuptNOGt+Q1QeAgsriMMe7J+G76qijlZi+ZLELOk06O58/NygFDcewK+w2m4vkJWmlOKEcBCztw8nX/Sh1UDk331klWSppp3QsyUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727725110; c=relaxed/simple;
	bh=ofwtZ2utG9kly9E4b0Vz9ygXtqxsS4w+wNNse1effe0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RVXcj9BTUpVwuGPhnP53w8H7c8Wqt0p0Fjpa9MpRSSjRs9vHneeeUjZV2+hw/3IOG76u+w+C0ecDqvgTcgLl86wUU5LBR9uzSvw7VFS31T/prCqtDTbtSBG5jtLtYT4fsIotx2fQ+jXPymhGrQjhL1j6k+yxx+s8dg947d/L13g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AD6z371E; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-6e7b121be30so3168400a12.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727725109; x=1728329909; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AKT8LYqobBT2BaRfv06utI0biZxWMsM1Ve8o0fYaoVk=;
        b=AD6z371EW/pKcWagKg+MQgeh68LmqPgAbTQ/xIepCNsGwJL7ADmhINksafApy5LqXs
         c/bQD+SuoTs4l2uO8h16FTir1+LK+OBZbnmCSGfZf9pJeh9puaLLjO+YqV/I9S23T9S/
         hgzDVkrZFe5bWke8R1MU9H7ffkM78s2U8DrnG14r9pKvMD5ZzD7BoEPX+7abeNgaYiFy
         AOegp6+h81ybYDOKAj5hqZ7NUwRyjlh1pW0zmk+uy3PtcN76sjuxwGxIK8DJbKFQLcZw
         okmtp57gCJZpN1b2qLD3Wm8/6vOXhMW8LFCZE1YoPrG3Z8Ocbr3dHwlj7q4/pp06ol6M
         xhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725109; x=1728329909;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKT8LYqobBT2BaRfv06utI0biZxWMsM1Ve8o0fYaoVk=;
        b=AhGDfQZNl0lc8kY+3VC9uoSAWHC0tOXFJrSTXHOa9QjpthpCev0Qa8IDYUukwDm0o4
         rhvysNZYZ184bY/KaFHGUZ82iwsBHL8cLIaNisf5C7Ns+PXK/hvSkxZ8jTR+K+Tts2x3
         t3ZiCjEyxQCwhdz/waT3ygCYRSIdIFYY+sp0aBoSrCps7nUf8Z+6+tSVskCSCxhGS5NS
         AXo5F/XzxGBHuvzYqviBShnqu5a8tEsJW4c1UDaf+jGmjLq6PS1efbxJoIFzCGWlUcYP
         XXQ1LMJ9ZBm0MYhLVaK1Vg0hTC6565qm7lJTu8Gov0OVjS1E+xjvE89yZUrJXFYDXVfg
         TB5A==
X-Forwarded-Encrypted: i=1; AJvYcCWu9//Hsje4KqPcmYR5KVX6arrNqn3Szn1LgSJpfxlefdyf0WCPC4GhN5QlNstLECgdpUBDk3jx4Guftw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+NXHs3iNFcZuUj1UmHzeb18gzQAKhfUVFO+qalgsGc4LfJt5P
	6HhrpzTCJFtwn45f718RrMzIJnN5MoZQlGcNIM9u6d45HBbfwv65IbvH0M1jD+6mFMJYitUhYDl
	2ZDSSIrKcY0dwFdNxPUbvZaKjcIs=
X-Google-Smtp-Source: AGHT+IFlaF5JPw0wUcDKRw6u7HGnsO/QXSTkRae9tKndIlj3EdkvFhzx8f7JyDR4nekb+7FS8D4QKjv096mI6FOoui8=
X-Received: by 2002:a05:6a20:d045:b0:1d5:14ff:a15f with SMTP id
 adf61e73a8af0-1d514ffa2b8mr9654739637.11.1727725108694; Mon, 30 Sep 2024
 12:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Zichen Xie <zichenxie0106@gmail.com>
Date: Mon, 30 Sep 2024 14:38:19 -0500
Message-ID: <CANdh5G4Yz4+s342F3GHy6wNWNXXR6PTC2tRibfVjTAg=K_KMtQ@mail.gmail.com>
Subject: Question about 'dma_resv_get_fences'
To: sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>, 
	Chenyuan Yang <chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Dear Linux Developers for DMA BUFFER SHARING FRAMEWORK,

We are curious about the function 'dma_resv_get_fences' here:
https://elixir.bootlin.com/linux/v6.11/source/drivers/dma-buf/dma-resv.c#L568,
and the logic below:
```
dma_resv_for_each_fence_unlocked(&cursor, fence) {

if (dma_resv_iter_is_restarted(&cursor)) {
struct dma_fence **new_fences;
unsigned int count;

while (*num_fences)
dma_fence_put((*fences)[--(*num_fences)]);

count = cursor.num_fences + 1;

/* Eventually re-allocate the array */
new_fences = krealloc_array(*fences, count,
    sizeof(void *),
    GFP_KERNEL);
if (count && !new_fences) {
kfree(*fences);
*fences = NULL;
*num_fences = 0;
dma_resv_iter_end(&cursor);
return -ENOMEM;
}
*fences = new_fences;
}

(*fences)[(*num_fences)++] = dma_fence_get(fence);
}
```
The existing check 'if (count && !new_fences)' may fail if count==0,
and 'krealloc_array' with count==0 is an undefined behavior. The
realloc may fail and return a NULL pointer, leading to a NULL Pointer
Dereference in '(*fences)[(*num_fences)++] = dma_fence_get(fence);'

Please correct us if we miss some key prerequisites for this function!
Thank you very much!

