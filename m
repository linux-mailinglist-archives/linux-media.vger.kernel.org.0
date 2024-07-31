Return-Path: <linux-media+bounces-15659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1E4943486
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 18:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E891C23521
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 16:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255DF1BD029;
	Wed, 31 Jul 2024 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CeYuCnD/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C5E1BC065
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444980; cv=none; b=eHlGyZJPS88Dpw+xexLrjyavqpnJ4P4nigZ3FS6iXZ1WGL7MWUZqOFaRpUKxbWwIUXDIQeAUINv5Vzpu5CUoqyS43lQVzvOnAMkQKOKm1JmNp4rG83zbL/WZYS/jxKea7X8sr3DMyHG3NnMLMk9fe2vsynZ0X/DYwD13Vbc3z3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444980; c=relaxed/simple;
	bh=IKLHxbuR0R9BOTQTYx5RDen/I6pf12f5piDZx2DS4mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eceNQz194bSQs4ny364mgskAw66ujzYlFY77RT7KKiCGfHjuAfDQepAyej4DRnk0oqS+JB8NnSJZK8fR4TcelQBaMC+Nor42R3mzM9iYdOmfEo7JUSGJlfNtNDC/5E7Q3k6lDNc1KDuYv7cvqD/liYPhOtdzz8zYSWtlnGGyjQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CeYuCnD/; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5d5e1c86b83so2656715eaf.3
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722444977; x=1723049777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kcpERRGU5dtW2iPAXxOu8gXnKquzRYp88DBD078J7tA=;
        b=CeYuCnD/PqrVffd/TEtCts0wY6bPovDPDK47cVyO7ybb/aYlBmGMyptbk5tPyYa7qv
         mQIywnD7Nh8e0wUEN+Q4ty6/1fdP+4feYx5miC1TiQgUgEyhQ+uloTS2orlKLPG0LIRr
         aA64Kf+ITd1pRVpisQDZ8Ff+kX+/4drIuW/2UeC0pP6BoZRP00rTTxyTswYOAN+6xHR3
         ASUpHDPbpPXKeqyTFjjrH4agVxDdMZjLu38AUZCA8fwXGdLgMVORE/rlJFM/XsM1H+UP
         LKkLdr5eKcDh2hrnaNvrT2Hp5wui5dTCo8B3QNiA67/PFrku9kq5Db6zPhp8p0hRHGi5
         hzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722444977; x=1723049777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcpERRGU5dtW2iPAXxOu8gXnKquzRYp88DBD078J7tA=;
        b=HUJGFaybks/S7WWSnah0hMkoKornZMpgZxBPogGkT/0pYUO2GjnjPTQERQDXIObZgz
         +sYgZDYXMuk/epdeIOkJUV2tcHT36UhDgCmxyX2DJu6qZbLmwBvqfNv/gGRjgvx1j7w/
         Oh95YSzZoDx7CCUy/gYqkCoSobY1w5fvOU3ADqr3skbC7ebzfzqEW/SIPwGOyj/5EOjj
         b2Dju9c33lKYor1S9M6/wMlj9C1Kw5k+jGUOSSnFb5kZjh+xtKlbka9vhJq8jCzaWOKy
         ObbhXch/YHaJ2jFqI43sQPrtfdLHUIQ5z/9CSQWHPy8ze3b3IQxN/zaS5tVUTQ620CQE
         kmuw==
X-Forwarded-Encrypted: i=1; AJvYcCVby67Y7QGl/Dabp8NtZeEYTTB5KorkL40ZPixOpfgVsSP2P0lweM2KNIyHLaA95nybUKRg3fB5qFV2fpvlNmtaRVoe5nVFSx6vgig=
X-Gm-Message-State: AOJu0YxJPoRL+f2GKeq3LpFOaam+it0iAQg0b8GhEeerMTOTFeEi5KG1
	ukNQyjUN7jD1JuZozeDQRneWHtbsUSwpbjOFDztGRQWqsUY1WZZRtg26xtFmVDs=
X-Google-Smtp-Source: AGHT+IEufPjRxTWjzgVrtdmJzPJng6hNeQ52ulh+woNrCp/z6nYp0qwQuW3J63AoyMFVNDqa1RjA9A==
X-Received: by 2002:a05:6820:160d:b0:5c9:d9db:6a51 with SMTP id 006d021491bc7-5d61e3e28edmr105432eaf.0.1722444976962;
        Wed, 31 Jul 2024 09:56:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:c572:4680:6997:45a1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7095ad72442sm978393a34.28.2024.07.31.09.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:56:16 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:56:15 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] media: cedrus: Don't require requests for all codecs
Message-ID: <b3ab99a1-2e72-4b7e-8569-f7fe9beb3018@suswa.mountain>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
 <20240731164422.206503-5-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731164422.206503-5-linkmauve@linkmauve.fr>

On Wed, Jul 31, 2024 at 06:44:14PM +0200, Emmanuel Gil Peyrot wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> JPEG decoding doesn’t need it currently.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---

Does this change have an effect on runtime?

regards,
dan carpenter



