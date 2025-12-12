Return-Path: <linux-media+bounces-48694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04ACB8522
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 09:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7C35300BD93
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 08:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC3C3112DC;
	Fri, 12 Dec 2025 08:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsNNWqc4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15232C0F6C
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765529400; cv=none; b=XeibDcMvlIcgK/L5cV4n8WIWd9FBHSeCdBVERttmOaGCVdvLJmUcZXAcpXQu4c0cAMuJKbhDAJhZlabcu2y9Z+f5oilSSmC5+CGXTXqe2RNFf2qCI0e5OucZHmUqxVRuvt6LMY+8v3OyqkTURH+gSBF/Pyy+9a56UfIzARwH1M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765529400; c=relaxed/simple;
	bh=uEXD+fl1VaMsAi+rOzB/qKb7cAebaa0SHJ9PEe/VNO8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TzRz+Yh1OHClTJz1Jic/ly+1o87Qeem9GfLr8CSfSDWghKRNaDU3KCoLGEPpRdCkouo4l55CNlgn/kq9Q3BwVtVb9v1+WV+EKhG6fFemrtEgJD7nwA9XRmxoeLxM4NoiwHzxDzKiEtxHBmAg0YvgMZnoYqoTT7Zw6zxLeTSZ6I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsNNWqc4; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a3d86b773so8651331fa.0
        for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 00:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765529395; x=1766134195; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEXD+fl1VaMsAi+rOzB/qKb7cAebaa0SHJ9PEe/VNO8=;
        b=EsNNWqc4433YvIgkkhRTrFG8awpVof2pFounGRHC6xorCUftsOvD+j3tQ7Ibkg0Lkt
         Y2/y0DX+/BTKuCiYnPIl0psG0SiuzxBv2etdHlWW/0Sll7CTLncZYfB5a9JLXEYvPklC
         eB85tNDmr+xSvvNS/pAjp9K9nojEfsvbpnxNfaRIIfrSUw4Z+74Ks1yHGkfhYxtW7L44
         ljHSRf8ufwxjjLKmzqCCrUUkkdLDTKTAnlo8G9nd7/ANUVIzY2FSzrLLGT6cvlZI90IA
         QfSxL090R+Z5v6LmVXZAJjv3i7Nvslg6LwWFYqAoNuZN4pdWsk6NQzrA4ZezqAsZNkyF
         K8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765529395; x=1766134195;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEXD+fl1VaMsAi+rOzB/qKb7cAebaa0SHJ9PEe/VNO8=;
        b=luh/0hzt9BEBskMtbu4gI2iGvkHUONCRmzIu+aKmS9Y8/zBVUtXPhxFGroQXSneFVS
         imzPp7hANzZRxh+wWHdlhJhzQmKgx9tAolBHvO7H+wBMTQ4uTGf21ZTVLrk5SRGygQOG
         vna7eOD8FO++Cyn2LAV0syBawNNoUKUfUGTRM4WLovouFFiu0VUEhs8bwm4rpLia/Vmy
         inPWCJraHPZ8JyTClzQfcaMoVV7Qwnh0aSJ1gtlOnNvoJNdgCKsW+JaosbjrCg54Wm44
         HekCnrc9kLpa+mfVNPOt8+cFZGc6bsAiw+lYTKNR9v/e87UAg6gah3K5w45FFh9n+GEt
         yxJw==
X-Forwarded-Encrypted: i=1; AJvYcCVL/5k74e1KHumrLwfaLWtghpabUAQCwBvyKRHL8nH6CVMDoxaxsq5zzZTVT8zNdUfCYV/12Pn46cAn9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsIJo5/DLewB9RJ1pF0LIQzVOR3c1MHMnOP12qs7VhzHXz3nnL
	D1keOg+yolD6PSjb070c/9vuEM3z6AzJZ0s4B35iHQiJhAYHmasunjmX6yvWZ3HZWO+n53yaYwE
	Pbn1Nd4SVEHrZ06+a4m/n2pd56uQKUoo=
X-Gm-Gg: AY/fxX7Eq/QtjcrgiXr5PHTX37aZndCjrJ8RduqLz5ZRX3LM/uIfcFPrYTuvPqVxATf
	PwTLAbDUcM8t46NklFa0mLfNB4lamjbnIltp0A666u52PW5Y1LDUBDYSGFJ3lD9qloekDwno90Y
	UOyXQwwuBNdwFcqxcX3wcJvSSab/9PzoMAEqWmCCqN+3gUo7QMakbrBLKczlNIX8TvTj/1ryriQ
	pzFT1H8r4x64cOVZNW3ZiLv9y8uBV+tUyv/jkDF95EPSoiCgvJHBxDACvJZqMWhQCDtXwC3Y1oH
	q9DtxiQZuZg0SWzHMjndJI4cywJ3
X-Google-Smtp-Source: AGHT+IHtqUZX4vVesa0t6KZet3L60PV7SBPibR53J9EHZRf/1SiaQqpFxmCqV4+n1A+BVBTgbyu/4Hy3MbflM61OujA=
X-Received: by 2002:a05:651c:210e:b0:37f:cac3:c280 with SMTP id
 38308e7fff4ca-37fd08a22a0mr5090041fa.33.1765529394838; Fri, 12 Dec 2025
 00:49:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 12 Dec 2025 09:49:17 +0100
X-Gm-Features: AQt7F2ohWplDOv5RTh-KQQ3ppyn50BBO-Ap-Pz1SuupVjkC3VOvw6eMVkUMhsfI
Message-ID: <CA+icZUXPcT0gQbp+oXiRNE0yBSvLGWWvP93kMPGdcFJjW52n2A@mail.gmail.com>
Subject: [PATCH] media: solo6x10: Check for out of bounds chip_id
To: Kees Cook <kees@kernel.org>, Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Andrey Utkin <andrey_utkin@fastmail.com>, 
	Ismael Luceno <ismael@iodev.co.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Kees,

Thanks for the patch.

Feel free to add:

Reported-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v21.1.7 x86-64
Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v21.1.7 x86-64

More details here:

https://github.com/ClangBuiltLinux/linux/issues/2144#issuecomment-3645456824
https://github.com/ClangBuiltLinux/linux/issues/2144#issuecomment-3645492492

Best regards,
-Sedat-

