Return-Path: <linux-media+bounces-48732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78708CBA5C7
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 07:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B62D530B5FC7
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 06:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693D726B0B7;
	Sat, 13 Dec 2025 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJH5yfhr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706C1264F9C
	for <linux-media@vger.kernel.org>; Sat, 13 Dec 2025 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765605603; cv=none; b=bCi7IOE0YDtMpKxk2Ph9SgmYh+ziayMJOb02584jiPzWi0i1URUpmUg+G9XhrqOFgZ1qb5iDCmi92UMgEo4xX1UH58n/mCfNFawsTsjm2VTSFDfzMtHl8ljaz+RtWC7kDMWQTNI140FUOUxjiwBb8WEks+qrEInISN2WTccz5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765605603; c=relaxed/simple;
	bh=+rwfO26Bv4zxCBRJtW1ytHBz6MhNx4VrLDIQaPsUAv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1ufTvgQuLicvXENEC5RrRX52JraoSa0MIG2t5+WYXJTV6RvVmaMR/wUQ1AyBi+TPQdKtrF2tdhjJ1zLnN6OoZw8+CrjZwOicoXA48n/m0KIjnv5TmeI3L7E9rh0XjSR3WYxW7BMKJu/h3Itk7P4tuzqCte+v55cNxe5TMhRFQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJH5yfhr; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-349e7fd4536so226232a91.3
        for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 22:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765605602; x=1766210402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rwfO26Bv4zxCBRJtW1ytHBz6MhNx4VrLDIQaPsUAv8=;
        b=lJH5yfhrV06o8RkDo98s10U+/L3hfOMpImCoJEO3XWwlUCqikER4f0krgiKcDF+PJo
         lzYlZNYuU1j3yLdBefui+gU/ckJ9bUpfZpyx0bsVORyeYSD7RtDGknjKv2tv196imCf0
         vNNir9qcXAkQMF5VNWvisphiWtAGQqSR+5rVvT9aqB/G0cwheMyoaomVtVQIwP2+zTYm
         mvTtDLneTH4EpF4F/gmmkq2eAWoXoKAA2dmucZtrFf/aQhj7B7u1E/vX4cFuHNQkDa38
         EqIkZfV6qj3Sv2XmC+ipGREDSh52ViLMu4UHyossAaSpsCIcttzVdQdnbvxsfzyxghAQ
         +IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765605602; x=1766210402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rwfO26Bv4zxCBRJtW1ytHBz6MhNx4VrLDIQaPsUAv8=;
        b=kU1XjJD55gHGwxgRk4Adrdkyd6LVMSc8N/eHohYKyGds8hY2bOhe/oqNYqidLBoXVf
         hHsG9q47oaUmIR4CeE4mlCGA+a3lFAUjjd9kvcdN4hMyZX3BJTdnd0lMrkAF2RBTrwPM
         CkTEmzQ1Xaxbeq9dWWdB+2J+D5eZYytf6K7P+Esp7j3N0ItpMWVSI9pb6Fd11CmntmXn
         hDbDSJ9RSkgFzaqI1qb0iiWoHHa7x5opK1VXFJt0cjKVUvlm+PsLCsbFPb8wECHlCOHA
         6oOJLmF6/gQvTzvkJZjN5c8CnDX3k4A4dya3gGguJUtGyhXk6E9jDGQAU8xz9gLOyqMY
         e3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM3qdqH3SRxmXb1MQ5jn3htarRL9IXHBx0a/2oHUyptwOgSnPo7FPze55Bxws7XX7kb7YfmIf4FzPCgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ALcKeWpyQ/uDkPPdQOkqqZSIa73IL5HRVe2gB3lbboVVImHG
	sLivYeuYxUv4HqUKo8TLg7v0W5p1M5KPZYqUFdIHRTT/Ac00TM3q47xh
X-Gm-Gg: AY/fxX4oVUUXnS2Oiw6amjp7HmHC4F8/aWWlsOKO5qopLGNT44Ww73bgzvYgCVJCPE3
	QAEGQGAU9efFH5zHpw4laBMAolp0yt6yFneVYyincmTyk0mrv2Ssb4FgKvoVSyu3lISJQDDWDq0
	Dj2goAoc1zr2ol4ACZGgrOAmklFjKgXN0edDoaEqm+CP6SpIkCHmaYwJ7sLCGi5DCGaSGxeV9Jt
	ThJjMF4n5wH4SuhVxXKqO4Otm4ZY0o+iEjPXIau0s759X5t76JyWx8i+5RrsfZww5NoRvFy4ZGO
	9iRMuBIbtrXtC+xlsvrkDzaa7mWbkx8ZWoB+eVbRytEXYnZ44n+tf2H/zGNhE/IaS23tsluBMtb
	HsGksohfH6iPn38te5ID7NqAskvsXvIGgOSIhpN4EVQOwjGk66t5Bdllm3gcE0F4D89mpHY+dDW
	Q6BFQTfokACbb+YSUYttzo5w==
X-Google-Smtp-Source: AGHT+IGcN/Y+jGJuMAQROSfnsb/2OTBPCk4orf4q1OT3ssFfpsTYdLd+1aqhMRXyMqSoRRC74QwrIA==
X-Received: by 2002:a17:902:cccb:b0:2a0:879c:ed37 with SMTP id d9443c01a7336-2a0879cf44bmr16150795ad.2.1765605601660;
        Fri, 12 Dec 2025 22:00:01 -0800 (PST)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b49csm72038125ad.95.2025.12.12.21.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 22:00:01 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: nicolas.dufresne@collabora.com
Cc: detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	hverkuil@kernel.org,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org
Subject: Re: [PATCH] media: rkvdec: set ctx->image_fmt in rkvdec_s_capture_fmt
Date: Sat, 13 Dec 2025 13:59:42 +0800
Message-ID: <20251213055942.3046647-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8f24c8204984a46bad7d0bb24b78c8115906f748.camel@collabora.com>
References: <8f24c8204984a46bad7d0bb24b78c8115906f748.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Fri, 12 Dec 2025 12:53:53 -0500, Nicolas Dufresne wrote:
>I'm reading you here, and reading the spec again [0], and you are saying the
>Chromium isn't following the initialization process. That means, it should be
>impossible to allocate 10bit capture buffer, since the SPS in place specify the
>color depth. Other parameters in other codec can influence the reference buffer
>size, so you could endup with the wrong allocation.

Chromium does follow the spec when decoding 10bit videos[1], but that is
still limited to hevc and vp9. For h264 and 8bit video chromium thinks
this is unnecessary.

>You cannot accept a format that falls against the color depth in the SPS
>control, and rkvdec does not do color conversion implicitly. This can otherwise
>lead to letting the HW overrun the buffer (forcing 8bit with 10bit content). Can
>you check with Chromium dev if they can perhaps adhere to the spec instead ?
>This is all news to me, but I probably never had to test 10bit playback in
>Chromium outside of MTK (which might not be less strict, hopefully done the
>right way).

I will try to fix chromium to follow the spec. Since rkvdec driver is the
only driver related, I didn't check the stateless spec.

[1]https://github.com/chromium/chromium/blob/145.0.7577.2/media/gpu/v4l2/v4l2_video_decoder.cc#L648-L650

Best regards,
Jianfeng

