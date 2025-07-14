Return-Path: <linux-media+bounces-37650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13733B0421A
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC1CF3A342F
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0090255F5F;
	Mon, 14 Jul 2025 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+SyRP3u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB8AEAD7;
	Mon, 14 Jul 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504391; cv=none; b=DVTpC5uviSZBNmUkWNok8K7HS/vLzTvl4y1jfQhGi4noX3VWmQiDrX5TFiQudLt7iTGjGBiGhxCab4T5TI3lOYrmdThYU4LqfOQBlprnOQGVcHT4RXSw+6oUKyApZEISNMHw84/FqSbqDqowJmDN+D8qsj/PxpiGvBOIVzejDz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504391; c=relaxed/simple;
	bh=fJ0aP8vTqAVg27VFBX5sncMoB+p2dxw32cIm9YOnPSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvEsliGrb30vZ35iSlR17Ckz5BUsV6pNLW1AZ9+c56lRNxDEgCWYLdF+nUrCwdIYBfF4WTc+NlJTpRSSqtPF3EzoZaXT+I9bYf2ZcyTkOGqn7F3B/RjHCjp6IBJ58YrMDml0xdXW9VvPBWz/OtJhyxA0y1BMxrZ5csizMll1cQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+SyRP3u; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234b122f2feso3759935ad.0;
        Mon, 14 Jul 2025 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752504389; x=1753109189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTrYnqjKlV8yeDLpYJrmzKSqJHoAjMWHbL04xCtle7c=;
        b=X+SyRP3uc+72Sz16BhaSnBpM8qyW6wcb5h+7V/IRP1zwb1xp+EMN87J9vygY98uIDi
         2Fpo6xSBjRXdN8E+VrQOnhIHvapngO2Kt/37hFeNpQnvG29JwhyjJxhE+NqQ27leNjk8
         2qcRVbwT6aezxV5DKhayFm51GAV5njwvNZZC4hiakhc5OdpX1ZZwaqs6CUfavvteQz07
         w9VjUJ9pSKn2ukby5pAo7qN2sB5NnuxdIBag7sCGdzegI1U66/Y48VwCWAVpyhsk0y9E
         eEVqyPvqkhgk9YLTCD+M2CnQ5kt8IDH3chuh13jq2q3OUz+P6ilT7ResZN514T96WgeC
         syAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504389; x=1753109189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTrYnqjKlV8yeDLpYJrmzKSqJHoAjMWHbL04xCtle7c=;
        b=cIheL9K7fuxwo27RDa7paYXKXsvOrJJ+SlsPurzg6h011SfsyHzEk08gOonhLctdgg
         faKq0soquSvZvTVipUHDSo1EeMZXfqmmh6UizXpDjKPHnpS0Ko3UrwkKHF+OfAtxgG5Y
         1vwLVWdKvMB+I+vRoNBCK8fPocatJsucw9kj+vcXEZnzD6Nw2bjYBaqg6ChhbIVoPpZq
         ftFG2ikYvfrkOzKJRtLHtVYnRvRqWbLLebBvUOVp82xn1dNohWTrn5MKxmyZjI6V9NEB
         Hqf6vA11uHkTSEZhxYyOEHoQB+EMiZPgX5Ctbx6TiId2MRfXCfcvPVrbmQZfqZXOU0YQ
         LjHg==
X-Forwarded-Encrypted: i=1; AJvYcCVppGVzpLieCqPBaiL9FzPZYCgNRAhnWYvtBb9z+lSAeHR8C2dwrMhgdJ8RHh79McfMpX1R6Lg/fd5Rgag=@vger.kernel.org, AJvYcCWS4zb0kb2mR8r2EvLXaAEM1SmI+NJS+RHBacTg523H1ibpfWs7siUadXwSpXF3r1e65xEUp3Br+TzQd70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8vRTForNtxHuGlR/dCrcTqW5+PfHFEpIk4Fp9oPspwaxaWhqy
	9qExr/HIahpoH50LdiQn/2Elcknw29wQbhR6hAfNC4olPPgufr7BGamw
X-Gm-Gg: ASbGncubzudIDIVis90zYKDyHDYwJfJFgQbsgBVWP3qn3S+0+qL56VW6qduV+skxzMv
	mrulZMBl61fA6ohSq1rzBifH59jRr9vMMBwsDeUeIAagvwbXE2UA4RUBrojo2rjR3zyrJUwmGRI
	s6gsBX8H7VBLazJKstlnm/I+d0cQinsWkY9HyKWIAnYjJnVnaBTptMywt+4yvho/f+Dp65X3yTb
	gUljrpcJFMYTSY7Iv9WxVjLNdYg6dFp9QlbdPOVlaFkLiYoRxSqUXNTdSHipRcrKzjWWF7SV1Hs
	//Ob1vQuHpHuaSPu0QJHc9/tCijKxuxlrcz9iKNr/jvVgiFs8YxlHa9iaD0VlP59OaeSRK2kLH5
	lcgbtttlz1Jw7q7bhu1oxubU=
X-Google-Smtp-Source: AGHT+IFAGosVVXQkVk2nnqj6/hurytlHP1Idv7N5hzLwKlkWrcvqLlzgh+DOk6qF95MalA4WEStwVQ==
X-Received: by 2002:a17:903:18d:b0:234:a66d:ccd7 with SMTP id d9443c01a7336-23dede388c2mr76047905ad.7.1752504388871;
        Mon, 14 Jul 2025 07:46:28 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4345e6bsm92622375ad.192.2025.07.14.07.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:46:28 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: heiko@sntech.de,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	nicolas.frattaroli@collabora.com
Subject: Re: [PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Mon, 14 Jul 2025 22:46:10 +0800
Message-ID: <20250714144610.258372-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2229133.irdbgypaU6@trenzalore>
References: <2229133.irdbgypaU6@trenzalore>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Detlev,

On Mon, 14 Jul 2025 09:35:19, Detlev Casanova wrote:
>From the linked code, the max size is hard coded to 1920x1088.
>The driver sets the frame size type to V4L2_FRMSIZE_TYPE_CONTINUOUS, so the 
>snippet you pointed to doesn't update the values for max/min. See [2] for the 
>discussion about using V4L2_FRMSIZE_TYPE_CONTINUOUS.

You are right, the code of chromium should be fixed for frame size type
V4L2_FRMSIZE_TYPE_CONTINUOUS.

>> 2, Playing H264 videos ends up with green screen.
>
>Can you elaborate a bit ? What videos ?
>Is that on both SoCs ?
>Is there any logs in dmesg ?

I am playing a 1080p h264 BBB video[1]. There is no error logs from both
chromium and dmesg, but there is only frames refreshing at the top left
corner while the other part of place is green. This happens on both rk3399
and rk3588.

I have checked that this issue is not introduced by your series. After
reverting this commit[2] which adds Support High 10 and 4:2:2 profiles,
chromium can play video well on rk3399. I will investigate further.

[1] https://mirrors.tuna.tsinghua.edu.cn/blender/demo/movies/BBB/bbb_sunflower_1080p_60fps_normal.mp4.zip
[2] https://github.com/torvalds/linux/commit/5e1ff2314797bf53636468a97719a8222deca9ae

Best regards
Jianfeng

