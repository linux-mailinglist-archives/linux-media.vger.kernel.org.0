Return-Path: <linux-media+bounces-50085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D93CFBF85
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D8EE3068BE0
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D48239E60;
	Wed,  7 Jan 2026 04:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyLJ+Civ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A3C22FDE6
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760088; cv=none; b=VVLRYRJd7TcO6zmvqrtJ7QgLFqFcviyKeE/AtsTohD/jEjrTEVLBoQqUpQFgzYf3NciV0difKDkBAKxXJS3JphbtGRL6Ozilf5SZ8pL6PJhCO9eiviXnRd7T2xS6XHBGnLzcoKVZtyggcvgMwdRRqBZU78aoeL/KiKYNOVLrOqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760088; c=relaxed/simple;
	bh=NzR3V+hWLebEkE3+SsGGOtJ3Aw3p/n8XHCAiexT6GGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dr/g4o3ndciNx9DVayx0AUyeHol4q01n3x67Uy0R66iI3rR8qddpSUqb3ZfypS1mdElpI/BoP9B+CMFPihtlEXahmeuEOZM8uCUH/Rp8bkaAlzkBF+CUAiGAIYNLEtzy1juH5grEANcs/DMsk3hByJd2yS/zfwoQbsPqlpyBjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyLJ+Civ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4f1aecac2c9so6126241cf.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760083; x=1768364883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NzR3V+hWLebEkE3+SsGGOtJ3Aw3p/n8XHCAiexT6GGM=;
        b=KyLJ+CivbXZtxvCp8TF/x8Sev5yuK/HFr9tUIpwDrj7CKceBHqz4UD1skJzvjzBKRA
         7KeoTys6IH9TyhDXY1nz2JnggQuzNo9T4pAuRTsdFdyA7gH4dsP79Du5DNhM6LlWjNfr
         3yAjPMvVtlGWFCaCIAr5E5b4lN3/x5br9HusnNiQ6l1Mr6ljc39/ABNKWPOyaItuXAjU
         Xqv4fQruvD0cQX4PSGabVvwEq/azJfXiQhguv/wkZoS3Q+8EYnM6liAC3DD+xdeSEtDw
         ibsOy+3qTg62AErYoWV5GWSfo3LQZ3WEK1bkuvI5MJrK8K6ScmCCTEMZREpNylk4TUY8
         NZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760083; x=1768364883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzR3V+hWLebEkE3+SsGGOtJ3Aw3p/n8XHCAiexT6GGM=;
        b=phch0hLTf4tFO7kt9m6Rfr/DYo7zR9vXBRtWDSxXIA/IkL8zxlP4Z4z5jPg3UQOWQ4
         ETPqNJsGf+W8r+7qJYIPh4Q6rgWQzfRnFYGMoymdGLGbm4cE1xdHM4hlDviTGDpws1yN
         QWEyDsbuPy+wx5LVz8ulwI0zIcCJ6z/OouhqTj7uAIhvH2yT72HsRkUEMOu0aIo67hhc
         FKDFcGJgmyZCWJP4c6D87AOFAARlX/vFj1nBX1DjlWl6zu4Zm7OHBT2m008wGNY8Y028
         Xpe3kXZd+4eclydMkEy3RL/ZkGAt7/ecnjtBhsZwXYnfPKEYtKXF1Ff2ro4VvK9Awaat
         bknw==
X-Forwarded-Encrypted: i=1; AJvYcCWTQbGvs6jPkzFQWvJha4A6KXDqJSKyiSsqSO6A9DAlzhrK/L6NzqHGi1n5oLs0QrHgULVBUm7lyksDfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1rZ4odxOw9RXiGqFeqcr/+xpofmVWyVwk/2b4znexlRf/p3VZ
	I5eeNVZRTbdQVyFCB3qP8AI9HxyDgZHS05Lm3UkMDwKaCrKPwNbYZjvU
X-Gm-Gg: AY/fxX5wIfgoC5AfQT/vrwkiPrtCJ4j2gbPg+xCRbCHm4eV/L/qo/o+KAZNC1zmtn4M
	6jTG5ekCOZF5CaUk2TSBQebX8vnju75+x/UsWu7cId551Z6PGcU6aZWgSE8FWuoKS31bMqOTghM
	km9zElS95nMbzpGxJoD9sRBFBKwZxAh3mgeA+gBVZbIVS9uLzQIzsDgHsLxYcj1wxFWto4eBLgN
	EEnmY295YUx/Ny2gJ8ezcykBQ/XErZj2+D/q1pA740DN71OJdGlahVn4REQMDaBnxsBfpeey2Sz
	WrvBWj19uMQQn4wHV+bKQbc5E/6yw/vM3oUsVmzGIA9ojh3usiN/hOovnSJcArK7v4nvpZZX9RA
	rl8HVtCU7HEX1taSr9TciIGsy4lSuqZ/Hrc6+DGXoiecbZoPTcMAaYFXB9059Rl+Qm3er2VxCzv
	kKkLm/z6Y3dZjD7A==
X-Google-Smtp-Source: AGHT+IHnQfsj1iawjyhOVxIptrkGxNIYYfdvLPM+KbPfYJZ1Sz8qmIQNy0qNULXQA+Vaduz8APOYjw==
X-Received: by 2002:ac8:5984:0:b0:4ee:17d8:b583 with SMTP id d75a77b69052e-4ffa84d51bbmr67296861cf.27.1767760083612;
        Tue, 06 Jan 2026 20:28:03 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce985sm26075736d6.11.2026.01.06.20.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:28:03 -0800 (PST)
Date: Tue, 6 Jan 2026 23:28:24 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] media: i2c: IMX355 for the Pixel 3a
Message-ID: <aV3g6NT2JiLX6ELd@rdacayan>
References: <20260107042451.92048-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107042451.92048-1-mailingradian@gmail.com>

On Tue, Jan 06, 2026 at 11:24:46PM -0500, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.

Oops, I need to resend this. This version is empty with no real patches.

