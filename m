Return-Path: <linux-media+bounces-26012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE36A3116E
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E48518848BE
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 16:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3C3253F0D;
	Tue, 11 Feb 2025 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyY19nxw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383C72AE6A
	for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291475; cv=none; b=AfbakAi0TAU7vvF/SO9XgEuttHEd36dT62xF1CzUHbv6W4EGkw9zy/BaLqrEoCwNiRUz2JppqkYqxBPxUnEIjipa7a/uZkGwfyWPeHauoHDrR4XfTZbnB2+DtJZvERPLrxCYhCVB+hHemTUcxiR9bBvX1NnJV6LIb5Nd13jDG3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291475; c=relaxed/simple;
	bh=ieNG5550teoOm9evurNGAIt7IDUR7q2jLsMj9bSrcqg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=V130plbxcuArsTXTHXre25ZfJafROQFBe7kG3nNuhuL/bTrWMuF2vqbZST+uqA8JHUXbEIQ2iiozAvDOMWUYgENcHHgGiEssU76BTNTGPxT+WqaRTDiNehk5RD9acaa8PJSYLGw51I1kCA//Ip/umg3h0v6fzHzJ1R3YIozcDRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyY19nxw; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5de5e3729ecso6647345a12.0
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 08:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291472; x=1739896272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ieNG5550teoOm9evurNGAIt7IDUR7q2jLsMj9bSrcqg=;
        b=RyY19nxwDOCEwbNORk15erkaeUeqpEdgP1abVSENLCDZ6Oal739gV2WkmthXj4cuZo
         9tpxVjjzYZll3klkk7G7rqzGmlAOhMIqN5vbfsMp8goaRZyeGFQkmK8SlszH/4yj4pBb
         WyhfVPsGlVrdusPWZEdZ87s8eiycsbi/rHC1SXgF2DJg0l0fsLsmLtADdKMyq5VJQO53
         xRNXyHfN+EuUMzbPccCfbIIuYppxyshUKCoz3/3Hd9O+C3iPPI3jId7h6HHjDgg0EERz
         mCQWg7a9Xz+hote9BAmnzjoUOehHhOcFH9oOnSbUG0KE2zmGS8iLRPddcUMwvSjVWVwT
         7j9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291472; x=1739896272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ieNG5550teoOm9evurNGAIt7IDUR7q2jLsMj9bSrcqg=;
        b=R2rL77sY0ZSZVKMoj37RTphGGujhrw6fml/0gEUfGB54HzFJnRHhUrNJDDHjGzj8Ee
         qJHkRIzAoOO1DkzSV22OAnD8gzpAbry7ANkxvGhlSRMlVo1+8yEJ2FJjWaND6v/TW81V
         igL9Is9smQrGeEUwKweO01WR66mydiiITR8MDAonTxx7ZQ1mm0iChm5qwOYt8v9bTpnK
         HnGWm2ZH+xx9xIrUeiJwUVMW+SXYJ9AW+kPjA588kX3Nt5FIM5U9shLE+Z4sJHmOiZ+a
         gv+1fqFp4Z6Ikr94HlbeNdIEHyFNkjE8svVo3HajkWU/N+8HOivE2UsUngLEOzrNFXqN
         wAsw==
X-Forwarded-Encrypted: i=1; AJvYcCWNn/YlOToVPw3ai5sZQdjGtGdxIBC6dmHjYlNxi0DnBFWYHaT9sEoRq/sC2il+GtaEfoIJIsySqxTHJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywcVlGbu6mE7GPiLS8RJTWGLOquUWZBqQgp5unBdbLkbqcMe4O
	++UlgBS4CJ8MZA7AearScyT1rmT5tJkGxesfsm7GfBdKEZr4XpQmgOuSqcJS
X-Gm-Gg: ASbGncsFhe8x4zDuUk2+VdA77OquwkwTfXYK0dsWpUJrB8b2TBLBa22o5X4Vfs8J29e
	4BU42mgSgBLH5rFqH1pFndTAdJ389vTb3jVxy4KwcGOiQlKi8WcNNrwMCjk4b/PAgcwB1ztmyvg
	AH8swM1BH1X9o+XChvjOX7D3XK6RyXX1MIC31/r+ZxyIBS9kt+tV2oCHM0ghrztmTyY2AgnZPYj
	ybMHVAWUHYRpraQsGqmsaYgiGkdK+KVK8sRZV8lqY3+LP5vfTOhoi5n/OnwqaIyBSdR43YIZq47
	ZucndcE6ay1CiPro31NVyDEHa6Ft
X-Google-Smtp-Source: AGHT+IF9zaAspOwQiSxv/7z5dzkqUR9J5A7ZqS/A+KKeBOQJtea2s4MufoRyeVuFVl7aKnQW5m4ZTQ==
X-Received: by 2002:a05:6402:2381:b0:5dc:1273:63fd with SMTP id 4fb4d7f45d1cf-5de9a4646eamr3656406a12.20.1739291472100;
        Tue, 11 Feb 2025 08:31:12 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154a:1300:5b91:7670:e404:c65a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7ade9sm9838748a12.25.2025.02.11.08.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:31:11 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	dmitry.osipenko@collabora.com,
	tvrtko.ursulin@igalia.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Bunch of DMA-buf cleanup patches
Date: Tue, 11 Feb 2025 17:31:05 +0100
Message-Id: <20250211163109.12200-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello everyone,

just a few DMA-buf cleanup patches. The first one is fixing an incorrect
documentation which has annoyed me for quite a while.

The rest basically just removes stuff we no longer need or which was
just added as abstraction which was never used.

Please review and/or voice objection if some of that is till needed for
something.

Regards,
Christian.



