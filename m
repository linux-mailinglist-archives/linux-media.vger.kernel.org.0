Return-Path: <linux-media+bounces-16468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F21B4956923
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 13:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE7E4283529
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 11:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE001662EF;
	Mon, 19 Aug 2024 11:15:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B72B3770D;
	Mon, 19 Aug 2024 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724066123; cv=none; b=aer3R1z9IOjUI6PfdcZ0pys007KHH8cr17oM2gROb/z790QBBE1X+8sF4UFegkW/GfXngN6rBHH1xBB+KPHHLw1EryqDBPH/4hqRkQA5N/oLnh024b+C8uySXsrJPcimgt2ua+RIHwkNH8cgXFLo8LnBLWVJbKz1hL91lodCHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724066123; c=relaxed/simple;
	bh=L/UhslzauGnofkgP01XLH1SNBKrb/vShNOdCneQwFNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDD/XXgjTjKNg/GMBTBZRDGk9TR0Y0IGxs4nzRWhfrfx6sLotexLkmFmZOeQeXd9cbPTB7m4XTvzSajyn5MddkAgx/TvXzRdE9VJZjk3rCmCUNHHBraZZuxT3cMc10oZb3nk0ouQ7d1jrbGpbfzq99W9ez18iqP1kEo5jrn73O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42816ca797fso34053575e9.2;
        Mon, 19 Aug 2024 04:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724066120; x=1724670920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xEnhR+BnZyqhep0tu1+6gKqzWhCmgeh7ON3eSgIapg=;
        b=ZmkLB3qLc1YJIL7hK1ofvYqxLCV+CY5dYHvkPw1Tf8b1YQSRpsxd3pjQcqztDDjtj8
         /T3ujQDPsmM1SUvnl2nsEwFR0S5hWg+LJnjPYLKZ9F3W64W+RdVWNYx3/gGZB7h/EP2f
         9huwFl4tbrkyEIdC9DBUamcE1iBnJensGBHH53dXjt1XkGgk/Ctr5HOqGf0vyFMk1OJN
         SoQArTaBgsQgHEJgF135X44LQT8gaiB1efXVYegC0emEPHCxWK274ZiglBSOxXDQJH2V
         Y7t19CeBSFrELoWWTEl5He6z4FgzWx0rdvJIheuIvHqzurdGtMNYUeDHSoQR8O0OfmnD
         Fsnw==
X-Forwarded-Encrypted: i=1; AJvYcCUNUJszP+bZ/vZD99IPqCEZZH95UCQAp1m03M7OQN3xwuJJ73PA2GtMg4b9A79eP6d6Gy3ANLGwKvhObog=@vger.kernel.org, AJvYcCWJeVh+FC0Q5ebxbqBeVlLRdE2q6Zw2k4yc/qitr50bYjRWxPVjHC9PJ5IpWnl2AKYULE6ZyAr0Vj5b0O5n@vger.kernel.org, AJvYcCXaVwD8ckeOFqDr9cPqIsBYeaOj4He6/s4WryR5xjrfszYzChsK5rHoJLGOXW6KDRGA2Q3826sYU2tL@vger.kernel.org
X-Gm-Message-State: AOJu0YzDxt9YEivVqjiqvR83wT6d2aFRvvpwdl4uH3kUiVYpf9+uer21
	rQ6+WvnzBrAj7/lz02gYQsT7WdEC4Xn9vmSM5cO8Rl7aEWcXbKBQ
X-Google-Smtp-Source: AGHT+IH8/p+04BfrJXSaCxwKTnTJcsz63gHT8daKI2ZKAyHVF0aeARbyLjNtxUWoElROY9FmJQ+tBw==
X-Received: by 2002:a05:600c:1c24:b0:427:9a8f:9717 with SMTP id 5b1f17b1804b1-429ed620183mr82675765e9.0.1724066120138;
        Mon, 19 Aug 2024 04:15:20 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed784171sm105623845e9.38.2024.08.19.04.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 04:15:19 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:15:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, esben@geanix.com, linux-arm-kernel@lists.infradead.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
Message-ID: <l6t47glpxscvbr6rsq67alwpn6mcltjnxrnr3xs4qa3slqezrr@zp6a43hiwq7l>
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
 <20240819092037.110260-2-hpchen0nvt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819092037.110260-2-hpchen0nvt@gmail.com>

On Mon, Aug 19, 2024 at 09:20:36AM +0000, Hui-Ping Chen wrote:
> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
> 
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> ---
>  .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


