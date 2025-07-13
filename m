Return-Path: <linux-media+bounces-37574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB9B03174
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 16:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3215A3B1BB1
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 14:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE1A27932F;
	Sun, 13 Jul 2025 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA3Pes4F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955A1277C80;
	Sun, 13 Jul 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752416726; cv=none; b=C3VUlrSDN3XjBJtMBA60pI0Uteofu6ChYlRYSX4JbntApMAKk8si7kDXJYBrQ1sebgtA6q+ni/LaH7I2HL2eUFdKCBeEwDABYXWLLse1d3F/A+E/BeZXHek0Bpu040Pf/USqJ4RIRsPPklDuKx906Kxdd3ro1B6AZbjRCCAnzkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752416726; c=relaxed/simple;
	bh=SA1j2q3ieIAOY0/2qbx5lSEkJGcJ4pIWW2kFypV6oHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjvlO/n6LoMQuOG4DRCw4UmbL7cZdSF9jp0p0EyY6suJIQymHuvbQ+PiISYfG/3y5dJBiXxizu0HdZvzkXI7aPpReTK6X1UVc5dXNaSkJG6OpBXWDMTj7CsBwrjPSQbo6BTVd8eNZfSjj5zEm2Jc/+64zXhgLgkQy0k4okjhrbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA3Pes4F; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748e60725fcso432970b3a.3;
        Sun, 13 Jul 2025 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752416724; x=1753021524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkyQWYlswEIA/awfOx7Ojl2ZOMViZ7vIFKeJUQPM2ig=;
        b=MA3Pes4F0QRtGPgPsDNHw5NV1mDDkE+reOiudPKl6kW3I+Nm452BCn9RXUDe28sH0s
         BETqJkQgZOCzRpkhZKWs4K2R4Yc3XaKzS3f3B7G/b/l/Yy104+KYxo0+UhQ1Bu/G2PFt
         dlIHlsFG5BXDC6c2jsD97bspVaUZX10A0TZCqPpuO1rXGioUf2AvVY+dBJ6URPk7944U
         LqBqg/T+qgjwOln0Pp+U0to7n2pSXMZ5VMtQLMoSJHXXXWElfJx2LAWPE2QPmdoJU7ZD
         DCLub7ZZrTeOFcJOMgeKHEyqkOBjkRsfxXwywDlVQ00vwavChI9emKJYaHNRVDrTFuLJ
         x4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752416724; x=1753021524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkyQWYlswEIA/awfOx7Ojl2ZOMViZ7vIFKeJUQPM2ig=;
        b=KsTxEvvazVcKWkjKOhzgGg+iiR7te7d0sEG+naztpP4Kiab9nhuN7wSe6pbesHU3uq
         fXN3Cutn7UrVwx/bZYvzRCcQTdE4lmu0g6Ik+jjeDx2EDUrV9LJ/tzKwpKqIPnYAutT4
         WIegSLujzNLk1SmO4vfVYfTPDLBDgrZvk2RxzCEOUx/G8GAG5KduKEweHf0s2aIdKX13
         8gKpFuoSH06cTtCmDgpeSe8NeuE+NtwcMtWKEzHt9icT3Ez3abfKbNRe735jcRoKbtJh
         AlvZ1FzskeXzY4D4MdSbHgFDrHJxFTIDYv2YOXdXKuhRlZspkgVqb9uxR/pG0uhuOIRG
         xNDg==
X-Forwarded-Encrypted: i=1; AJvYcCVBGPIXE629onQkcs7HU/7D7BMtt2BSproLyOi13WAHX0rU46Xqp8Sa1WxRQmHM4gnOXi6IDcHOrsU4hPc=@vger.kernel.org, AJvYcCVI94wQhZOzXjhMEP6Ye9sjdi5RqnEkOLqKx4/BGjqfLN+TpfrIxjulNwr72Hic+wGvFwofkckryFK1Unw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0XIJeZkmMLsDmHRwZNueKb2Yjb2e6cMnkjWZLwc3bai3C9vx
	X2hkkslMqfrSAoCp7mWQBqxn9iDdfVGc8QMa2BbH2Hm1t2wHFL0qIxVE
X-Gm-Gg: ASbGnctMmyc19iwe0CCz432VQvSh65EFK2PQu7fmpNLLpreEUkQsXfzGexA5e9waXXd
	GKBOY3+bs346RrDy4PY0cb2yGyyqJSPWzDl2NQgxb6sZymmtvt/DzJ4gWqN8mb8GFz3YjCfM9eI
	e732j4uqUYY8KTTyeKizR8TRJFRWvwNZj5hJ6iriVk0xYVJaPxl52ZFK+Bzuz8eDBdCIVJNIzJV
	6rWXUX3lFuvr/PbXTEyY+EgmgrvUt4dwPqK3i4jcT5tc0pl1Q2mSMIr8jEMbnCr7zv5S1aHphKW
	xdBGIZvhy3BNunr22UKnuG/HpQS7ItFcVColLNhxGxbDSOgKbRJoDb1RNnSDFol4j7nGQhqsvdB
	LGYfPgO97PoHXEkPyP9yDeW/zjQLN
X-Google-Smtp-Source: AGHT+IFe8Nke6gA7rUZjK0GXgdQSkFeo3RLnI6nP7zfSRLpGatQXNVoWZbEIqke10QCKsGdaZplJwQ==
X-Received: by 2002:a05:6a00:b1d:b0:747:b043:41d4 with SMTP id d2e1a72fcca58-74ee3b110b4mr3471889b3a.4.1752416723683;
        Sun, 13 Jul 2025 07:25:23 -0700 (PDT)
Received: from rock-5b.. ([111.172.109.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd7140sm8810149b3a.24.2025.07.13.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 07:25:23 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: heiko@sntech.de,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	nicolas.frattaroli@collabora.com
Subject: Re:[PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Sun, 13 Jul 2025 22:25:14 +0800
Message-ID: <20250713142514.56742-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708151946.374349-1-detlev.casanova@collabora.com>
References: <20250708151946.374349-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Tue,  8 Jul 2025 11:19:33 -0400, Detlev Casanova wrote:
>As there is a considerable part of the code that can be shared with the
>already supported rkvdec decoder driver, the support for these variants
>is added here rather than writing a new driver.

I have tested the new series on rk3588 and rk3399 with chromium. Since the
HEVC decoder need EXT_SPS_RPS related patches, I ony test the H264 decoder.
There are two issues:

1, The decoder max size is detected 1920x1088, which should be the fallback
size when queryig VIDIOC_ENUM_FRAMESIZES[1].

2, Playing H264 videos ends up with green screen.

These above issues don't happen with the old rkvdec2 series.

[1] https://github.com/chromium/chromium/blob/138.0.7204.92/media/gpu/v4l2/v4l2_utils.cc#L520-L533

Best regards,
Jianfeng

