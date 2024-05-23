Return-Path: <linux-media+bounces-11782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D18CCF7C
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 375541F2321D
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D799B13D511;
	Thu, 23 May 2024 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5NYLLE2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FFE13B58D
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457274; cv=none; b=W+N31RF/OetTwe+2tBROBcnUvgzP54NsVxMAABx+OlmhCbzyRSvyx25pM2qbupUCF129oGQuskIA+iLjB8MtTKLeiRlNmgq9//3kIeLlxIgQ9eDR7rSmDYcFfaV0IebWvgZLmwwvQ1V5jJKgUAqG4nqCBcD8n7p14/8Ubj/qfSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457274; c=relaxed/simple;
	bh=j2zx3VaHX0GsfKBrlQgn1untBcEyimrqEdjGH5+DWdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhiuGV8THPVm42BTPTkx9k1uJEcxelRqU3tUUzapmG5/te6XaCSk5OMH+pZssM+925nLW8qlDY8K2fp0uI+uaNLu+1WEnTYlW3fVJ7MQ1fknpchSqTYlWVzkMhtV2okdVwcvXlZ60vWTUtC3pEk8utfPZcR8GkOh1Y2PLd/4RXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5NYLLE2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5210684cee6so8013034e87.0
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716457270; x=1717062070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymOIxLRXX6/t992boJGrCdN0THAC8qBuamXJNsylAfs=;
        b=E5NYLLE2otA5YJCF3nLVWisS/DzmSW2A0uqi6T4ZhdoRKjLe7LLqbSCX9/WS1vWBsB
         Za9COMKgC3G4chCxrt97Umzv9xuceDHoVQD4vywBhAsxxfDFscGNlG1Ws+ncyuyfsJsB
         LSQprJnj4VqnMO8qY8/h/aQmZrjLV5HGPh8whUw8HJJxf/ynW5W01PEuj8K92yY9b23t
         FKppsKdzuhLTSUrVILe0WtJxx4rVnkqvBDAOlQ98O7uHt4ctCwl4EWdH5a2q+Mx8/qbk
         fI6rg9f0+4CBwOYtYM/BRlfaa/YhAk2iJfYPN2PIKj7WY+3PCIBHgmBUJ76S5IbO2Dzo
         xHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457270; x=1717062070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymOIxLRXX6/t992boJGrCdN0THAC8qBuamXJNsylAfs=;
        b=ZznOrx5uZ/LMHN/4gg5Z2X+xEA9VJushAzUqiOQ1ZyellE3FEXDwgEj1XADCCNM/bN
         J7IulevHWJSLV5Qzhod0qvFTPB7njuNiGOyqZhgE/mCUiZQR/RNJt1uvuJTlGH0eQffz
         15H8bCFkS6z03CtrxjnLMGE0T1NLfFbx5E0X+3+vbVqjLFG99eURs7Y5NkItH9flLqLN
         5rbGZY393nMFYL2i5MK3Y1oToPHCW7e913gz3N65QpjKbXyWS5jwnuLtebRR94mXsOFw
         8EFQXy/3vrHWcO7srErlUo8qp2VUJOTVvCeyFvl7iGBy0D6uSb95PIJOknzkWgn+621k
         dtfg==
X-Forwarded-Encrypted: i=1; AJvYcCXzs3ADqln7NEyfrXqJGY9ons8Z/omHa3WaBqCpIgmN5W1QZ8XWPMIhoBPVwpR0S6GgLl9Q1hyg7kwQVA3vB4KbORgYyKFXXpil7W4=
X-Gm-Message-State: AOJu0YywhlBi5oUdmwmPbk+xconI9Vk+b/T4QcdxEXpb+nDg0tJGktMo
	X8aSSfa16R37pNDOLN9oPWPpPdY6XPI/ROM2OdtE5FUBnZ+3P2gJfJlPkLpwHV4=
X-Google-Smtp-Source: AGHT+IGDBnS6Yxc91Ez/LJRvHEhoF+0Je5SmLoZcaOOlSUX1bIaRGc7t5bjpMnVmIRgP+hN+dWcqmQ==
X-Received: by 2002:a05:6512:611:b0:51e:f1a6:ac39 with SMTP id 2adb3069b0e04-526be6ea79amr2624505e87.12.1716457269807;
        Thu, 23 May 2024 02:41:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52394a319f1sm2983965e87.64.2024.05.23.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:41:09 -0700 (PDT)
Date: Thu, 23 May 2024 12:41:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 12/28] drm/tests: Add TDMS character rate connector
 state tests
Message-ID: <ghotwzdstmtpnovbmt2fgvxxkcno67hfwydzjzbyfn6dkt247c@52ycrfinmimo>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-12-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-12-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:45PM +0200, Maxime Ripard wrote:
> The previous patch stores in the connector state the expected TMDS
> character rate matching the configuration of the HDMI connector. Let's
> add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 166 ++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 216 +++++++++++++++++++++
>  2 files changed, 382 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

