Return-Path: <linux-media+bounces-50931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD67D38AC0
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 01:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AA813089A13
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 00:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307471CEAA3;
	Sat, 17 Jan 2026 00:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3wNVdwy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AA7770FE
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 00:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609903; cv=none; b=SzUMCfOsk8vFZfaZEjClUPaLQBXg1RWeSs7niCT/SAhvyQXx6mkD2A2nKI2J2Ea5iopvdncvCcxjB2r1atQ/pZ33+gytNvKaCcZvfQroCLGuHHyL4xKZRKDAFFMaPT0YSPGYekZIKZtsYIQ2RNsfI7MFcyhW9GlI68iY4384YNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609903; c=relaxed/simple;
	bh=oYQI2hBpIRcvGtuZTojZuoMSi1NBy8aQgzTCzObvMzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XEdRmMyiq1pjBxw6qxFEJnkpl6Mnpfj+vP8lA6+UPrj03bJPqqL3Erli14Di82gJB59Lhpo9wjH07ptXT7bLkLT/2akBVPfwCO72QNF2l+FCpyBGlqj5thpYXEk6o257mPOYIQbHXnbVIjKZgwyHB2t+2PxizTCorxaiIeZD/JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3wNVdwy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801c314c84so14068345e9.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 16:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609900; x=1769214700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
        b=Z3wNVdwyvc69g3580tyf5fWfsc14h+xc/9Vg7PNDraGOG69INSVBA1CzQxPpB4YuJ3
         PKbJ2HX869tVWnNxczVuxy5XUMmrKH6RCTC74NzjWEyITJ8wsFDhSwVO8qFXS3h0nF9l
         zLlMXJJKycuP8R6ewUNsbElXbltaxzQP8B/ylWOmQA8B4ETt5tcgPQQS8iPBTAyRGshV
         y6qj+5YBywUuBf+KdejltrIIANh5VXj9HpnpopRWsjGMjwmUrClqhnzR5GegrUfbYKUf
         EH5Frf4yO93if/0XcU64VQiyErG2KMsxhElv0qzt8UDUcQ+yUMVwWYeaxNCTnnpLrYHq
         Z9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609900; x=1769214700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
        b=SoErEd7aHyQr0lUyfGFDhCf6mDMituuq3r61VvnKGcmVyaCtVDshHj98xX/tPGxP+V
         8BPdIid2C426E3/AihZoSUkVJ+8E8BtObuOz1agwRPaVysEU87uznDZ67BEv/ecrz5n0
         jkFQWRz3/UQUlqzGc9+p915UeitIiiDE3O4iGXR3YLMrtAOrVlA0zSELgBGzSv9MK2Xc
         cfrCQlxe/1JZhTSW8v/UmivxkyAVAELwjfCHBTI/m8oAOi5YzpajZWmSl/hmTbpKH+YX
         b29E4nloNzEu6E4ruBmNdEykwhMToCLM3AwsKtumzL2rpdCcTiJBqXQrD7F+9MpeR75r
         EfEg==
X-Forwarded-Encrypted: i=1; AJvYcCWwDskTK+Bs/FJpIlmHF3Zu0WmSDd5F1VMPO9hRPgoxPNSH+pZuXmAcc5PJ/itIsdPynG5pKYYmEgwJBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9elC8KRj4aqaENtsVSDSfSKEL66Q9w6tmcb+NfYDseV953T4I
	FM8ZlzcAILU3NbjZ5rePBPUut5z+aFipGBa2e5qxhxAcXQJ0SpDcTvuO
X-Gm-Gg: AY/fxX5kA7UbPu13I5eFyluLiT6vyYHcfql2+3tV9mCPOiQunQN0hiC2tS1N3MwxGoK
	LQQKfg4pNuwFQfmCuOL4TIFbDAAiZ5+tfgRkrN5tGI1/g8dbplkAC7zkFpbusbAewGhDn8YEK/+
	QO8pbsZcqn/A2ZQSPHZJSPv/yvjLGFhZ27tKqkb5+64iv6qUOkQ/lxUPcOE6YZuLUIw5NIoqZGR
	CC417j0MU21PZdc58UPP1c+rzI/hKxSy7NM/hii1FH+gTzb+/h9VNoGACSoEsCJXYN71IrKhWi7
	fv7oOUfsyjBOga1Sx+4xZJsWIyfhNkwh21qnf+MV7SqWJIvCaWJBUfaWB5LMtez5gS+nH836bYV
	tfeGOpnVvWPyYTEcJC3y64X83FTz1bqqO4Gz6/xoNuGtmvE74k6erQys5L+n+h3X8+u7LLSwWhj
	TOsN+C62Nwq7VFcpnr1O6KWv5O/xAYI2Ud353fDMDef0BPlrFjsFgOY9S3M+6PlZBNUZajgeKC8
	BVGjg0=
X-Received: by 2002:a05:600c:3b9e:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-4801e2a5861mr63784045e9.0.1768609900200;
        Fri, 16 Jan 2026 16:31:40 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9fb193sm27730315e9.6.2026.01.16.16.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:31:38 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Sat, 17 Jan 2026 01:31:35 +0100
Message-ID: <176860988748.1688420.11717122647073678.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 22 Oct 2025 17:20:28 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[04/23] dt-bindings: display: tegra: document Tegra30 VI and VIP
        commit: d262d030baef287da33344a932639aab5f913c3a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

