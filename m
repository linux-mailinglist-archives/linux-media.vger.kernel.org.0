Return-Path: <linux-media+bounces-19544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A25DF99C232
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CDD11F20F65
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4ED1509A0;
	Mon, 14 Oct 2024 07:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZCZsS7U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2E14D2B3
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892487; cv=none; b=p7yBhhwqrADOHPpUpYZQKGd6nsCiH67Ciy/BW7UvgjTKNMwe/W6kSLMNR7BeeVNg0RNAjRtpR2Iebs7/9bVINTnpIkHhdUYxJDOofsZqbo3phPELUEbVaRX1u2T5jpztF+Iibp6gslUsFVi4u/J0At4cjmy64Z9GPG02W4gH/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892487; c=relaxed/simple;
	bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=t2ymuF886P80yQgo2idBodlvcG38xtCHXLCAfFvFdgZZSby3k1LvZZiuAKdLWhh8RlYs0svT8pQ+HuL5bKs3xllwT2ALWhFd994uRYyWvMphE+OjGPlGNjzLoH9p35aKg/LCcqy59TNlMSokYVcZFgQ0w+iBnzukojfrcKyleWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZCZsS7U; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2e6a1042dso2784250a91.2
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 00:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728892485; x=1729497285; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=;
        b=mZCZsS7UfjeALOv6R/kf8cb8+DSC8jiZf2B4IphPLUvREyXlpjQH+PalDxIgh+odRu
         MHzOsCywV0erESl+BKqBA3933ciJ+Z7AYf+lg4xkhSb9snAXsAkz2BITOvx136ocWUYG
         xdUcIP1+iCGj8+Ht9D61J7MeLzVOVnYnuz9L+JuTX/7gsgYtxqXLLdwmnolfyoosKLio
         q2FWDCd/s+IVvyW+lHKzFDk0KdaIPc6ENtvXIs5SrMewznRbT9g6ETQs0UAbwaCm7LNG
         t5CCzLNPns4YCpjZwEKy9XxwsUa9Y+H1kmlDxkcD4VNlEt3ZIfZ0Hy5+o98PlYJdr2aF
         D7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892485; x=1729497285;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=;
        b=tj0scD+6X6StjMYFSOCukPpH6ZfUXcAAoKu1MYDg03Ho723kcRpnjMrtkVptsOaq6W
         I23Z8KKtBF4twC4cXjTqoNlGFxz7bP5jSCjUsB6+XlUv8eTn4plFRJiQoLesQLJmJom0
         /Zz+uw9ROXqy/emG0fKwP0uZQJ0pymV/MU7ZWB1AzthjMEB5WjuA8BP//+kFYVCqo/KS
         SxJcj6VSqbiokfyiJo/mTx2WA6Y1uFmr3IJaRD2/VAyhaG2Wk+sy+F/1kDj76zZAAJ+r
         HA130rfmWzU6WUypWZLNli5Z/cwj093XQap/LgVvmp7Vr7nHUM3Am100E7q2ssPw1YNd
         Y+FA==
X-Gm-Message-State: AOJu0YzR+mFs4TjRwHeaXn4xALb6bOFBVnjYXC5QzBo9VgD9djFv8mmo
	dn2fKMqHBhDkVlFcHaeBfVEsQvQjr6vzgN4AYAIG5N2wSayY5niABh+qMA==
X-Google-Smtp-Source: AGHT+IHyG9jbYGH4UCkYfO0vlsMrbHwjSvTF9Tp3kFrvmdxnc7xQQkLMpZMg2mhlJQ1UMmHNR/qhsg==
X-Received: by 2002:a17:90a:300c:b0:2e2:a8e0:85e9 with SMTP id 98e67ed59e1d1-2e3152e379bmr9742456a91.18.1728892485402;
        Mon, 14 Oct 2024 00:54:45 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a57096f6sm10491519a91.26.2024.10.14.00.54.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2024 00:54:45 -0700 (PDT)
From: Debbie Magoffin <elijahbaase38@gmail.com>
X-Google-Original-From: Debbie Magoffin <dmagoffin@outlook.com>
Message-ID: <5d254b2f3b7952bdf8fcbe8a301c182352670dc2a4b078e603d17777dd0484f6@mx.google.com>
Reply-To: dmagoffin@outlook.com
To: linux-media@vger.kernel.org
Subject: Yamaha Piano 10/14
Date: Mon, 14 Oct 2024 03:54:42 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I am offering my late husband?s Yamaha piano to anyone who would truly appreciate it. If you or someone you know would be interested in receiving this instrument for free, please do not hesitate to contact me.

Warm regards,
Debbie

