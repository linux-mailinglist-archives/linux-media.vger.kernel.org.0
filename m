Return-Path: <linux-media+bounces-50932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5C0D38AC6
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 01:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D59D2308EA1C
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 00:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833751D5147;
	Sat, 17 Jan 2026 00:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsVjPYrA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FBC2D7BF
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609974; cv=none; b=cV8+ko5ubXQ7cfgdY3BFounEjUi+9Z8n9CgXFPgxuq3tetDLfMHx1kYjaTYoXJeh5/EMtQnJ8h7Pw+i6xuSjJ77WTe7fP8IyzOeMDFyG8q8JFUvu6hJqg89jX+4p3bvtVK5H7OMXNoxwT+bEIWHZl8Ae0A6zppWj3il+yt4VVJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609974; c=relaxed/simple;
	bh=kIeB6j/N5+LCrPUbz541JOTO0YZVR1wj0iYYqzqWfrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gG6h6sarHFXPyMigIEJkidmM+eykTNPxk8Fgh1BftNPgzU0REueFV3xc35zKhbwNwOqW/xJ56/MKLEVwHQKbKkHOJWMURA9/SMflq5v5lWfJ9FqEtf23qZZsErx89h5v/LWcMR17SnjgIP1+YfGOJDTe+MPof3FANhz3pz0X2T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsVjPYrA; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-121a0bcd376so1801077c88.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 16:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609972; x=1769214772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ytNYdk8UK+5QDwMF9YKV8D+8X+AVHJEWRr0kX0nOWE=;
        b=MsVjPYrApOq5VNP9Rsw4q5tYcJyts68cJ/25I3EedQOVF507p2EYjnbngJO3J2Ip5/
         LRX5EhmA6qrgkEgFeQiG1QEpiDCwYB7kgVeZKe3e7eQjx0cgnFAB8/QGnsICbJt/cL1k
         VpcXBX5ikKZuiz9sCkGZwZ4LH35yprBoBam/MF+9Uij3k1gCvP2QIQPuvaVpBxaPgXtH
         w826GNuVZW7Ju/LCmC44Nlu3edxgVhOOTnNWfJBOUkGPFbveAxgSUeLWyLEolK+Xh27z
         GZRQWbaoU6aUpOVbRy0Q070uOp0AWSzT0UhQaWDj/zrll/+y9Mc+6twH4X42BrQEGcwV
         /pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609972; x=1769214772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ytNYdk8UK+5QDwMF9YKV8D+8X+AVHJEWRr0kX0nOWE=;
        b=DBqe4yNL3TVBYimMvFdHTJ1G4rjaPLehNFlC6otYgAuF9i4NlbNgPRy3Pj8LC6ZSut
         c5+FKQcCr1WkKbZAzLf9BYs6XRX/w+rPgo8dWyM+A7vmI438eMQDMqs6FA/nUkS6FZMG
         ld7D+hUJVo9xyb3aIZ2rbjnrrNHFYXxXy9hHvtQAPDFK8w+rIR+uGCW9pTujTjM0QqG9
         P2jkoygy1ua1Q+niRWmBZhHRzFBB1CZmcAHcdo89VXCTQW52VvAZOITbi1hdlCsXSyy5
         31PI79ps2gKMQ8sphiQ/oYVVB+edjam9gzPdjJeRZ7s76eI+dlzPWSSYzhlRJR8GmyeH
         OcGg==
X-Forwarded-Encrypted: i=1; AJvYcCUH62CXXPCok+Z9jwPK9lEYpeFyPSwtFAKdtTaGh5VCEW0RnOV64Ab6fnx8aRp6xGpH+sJp8qV6+HQ9TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrNUYwOM5GMUbHRYhHrbBIay8UgrEJ7PIerD4X6V03WXx7kuFQ
	w3IqbEkMfHpC5CnVxqUkcr8JmClZMaTdiIwyEn0QuNYpumNUG/OrY5/4
X-Gm-Gg: AY/fxX7KHSDnNOT7GmwtmK5mSFfFCfZuTjHoPToulr1JvJ4pjd1pEZiCITsj6gWyvXt
	kdabQgjbKWUJ7DyFAK6wPp2u5FF6eUzLdrvBfM8zX+bVyGPhqP8fUuFHMn1ueDxsfGvOQLT8Ow1
	bJAyT1eYV3sa2sXZbyGR9qO1fNHSnKMRAgTKcrgTCRFD4kqYeclIyPZ7amBP3l/HsAtY879d0of
	daQ2BvLalEM6tDBr71t/lln+Jv0gfZtn2E5ObhKX7O+Z8PbbPz0pebwTinxwVjBrVAyJmPvLbDu
	8FAW23gD2OcMMmj0oGu2YPWnsGJvq9PAUyqmjX7+eC5yejRZiPFfAkuZW4zRbaiI5prQJERAWzZ
	ikTQhcbc2U12mKdD3OLfd5Mjd06HgSrcqkEQ/kyVbeFemFO83Fo86aybEraIRexoIfNz6av6EXt
	bxiJ5GMf9PRFP7cGCy6ZMDm9XUaq6/UKudkSvr+6ovqIoDOl6U3CnMmEGl1qs4k0VONfsANHTrD
	Ww6fPk=
X-Received: by 2002:a05:7022:619d:b0:119:e56b:c752 with SMTP id a92af1059eb24-1244a73c91cmr4320247c88.23.1768609971804;
        Fri, 16 Jan 2026 16:32:51 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4822622c88.16.2026.01.16.16.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:32:51 -0800 (PST)
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
Date: Sat, 17 Jan 2026 01:32:46 +0100
Message-ID: <176860995606.1697785.9777722896876428268.b4-ty@nvidia.com>
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

[01/23] clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and Tegra114
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

