Return-Path: <linux-media+bounces-48135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBED2C9E6B6
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 10:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A6653A6B70
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 09:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BDE2D663B;
	Wed,  3 Dec 2025 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4q/rkdW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8C22068F
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753195; cv=none; b=RanuXoDvYayz8nZOhBIzi58TjwDcN8fpoUW0AOEz50ZKAybet7bG5D0WvFkQDVtkjglUJ+X86W28qSktuQ0D/ygSWqoovSVpnH8nJ6UGLERwvFf7hv6OTMrJRFdGYOvANjhz3yF9IiTP9mJQqmHOmtKVSMoTM5hbhr3psYrxphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753195; c=relaxed/simple;
	bh=SiNFiW2v1jXP/bwvy/RWPopt2GmMLcv2p4jZbIoMrDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5k9tCTHbs7DR/IyqVVFC8fsXDm6Wny8HYdV6NN3v1vaNp1I//gnyzHJcZckZsaWXQAwust776jZbQO82OGDZ4nC0vUMq9HeV2/tO11wM3IIabk0ETRuew3fjQHOizcQlWXn6MBTBdPzVdbC0Z3uJvxBpsZobdeJh/xzgt06Xfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4q/rkdW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47755de027eso44963935e9.0
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764753192; x=1765357992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1M9E8Fj2AnVlDJvuBANJENV4iXZAUBcbLia3tZSce4=;
        b=V4q/rkdWSTdtV6PGrIR+wD3ZuVmpGFDT5N5F8orrAaG2SUloz6E5MMAi35YwAZTlOQ
         0Jujv6x/H9PAa2qlBUOmReV92LmnRs/cECaSWIXjldbZvUr59XF1J/eEgFt5FwYEKOi6
         ILg8EReltS7V10Ngsu6Wic32UaONfaZmwczkwB/68Vtxzm2MpR4LIgIBr+1JA+RO+gAt
         GTBPEMRfSWiz7m8TIgWxkmCdAoB4+EndOhf5g1qtLfASwXdxDybm5SrWv2DewKl05VnI
         rErgS33tJkThK4AYFGnOG1gn1afbte4BcilQ+4r5tdFUbF7XFwGttTyqd22qhQwIa2+K
         yPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764753192; x=1765357992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1M9E8Fj2AnVlDJvuBANJENV4iXZAUBcbLia3tZSce4=;
        b=IvyrUYaHu6uynTQNkLIbrXcYl9KHl4vUnwfgnm3oCMYRGBvKMepWVTujqDZZg+MF3t
         bHFRZuZ5WPSJ9iD23gEJJMt/j7L4xADvQvQRp2BU5/SrAgdJ9QndPeclzww0WWrsuPw3
         1YVoUm4RE7714bi/6gN+0ZmmkwBEE+HbEZQvBMT7eozKzqaYIWyjw+YaHVlATa/m1gcJ
         KfEuuLLDDzx847E+BD5B7hbJu1a93nL1J/YPD0T4oy6P7q2ti1CZuPLSrfKa/RIXQOYb
         Y5N52fa5HC/FQx8VGM6M10TIMGQ3y8iuuWq0Ra4BdBmWTa3RUv3xCOQEO/4U6H795WDM
         tHKw==
X-Forwarded-Encrypted: i=1; AJvYcCUI0zgYDFrcQjRgW1+vgAfdGyrlYKGgeZAfMkmL0m9DyRZ7728oNDNn+4dPTiKdz0AdbvxdEr1BCQop1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YywStUUKJ440DSZcH231l9qORWs2i3Il8kO7pWyZhaquCU7LWMc
	V0pnyoBAxddBHlxxQZNcv7wOaP22KDUZkM34VEgCNgFPEXVcTZUX/KF6CvBd9jVWCe8=
X-Gm-Gg: ASbGnctS0EGeZHvPc5/ujgsMsHbCtx2uNg7SoNppXRjstH7L3Xke1a+mTlY7NuoTHLx
	AFZi+gnWzPyu2r+Wr4YMaBaM3EtnT9N1bbJoO5oDq/7d7Yrhsddc3obp9SoFOU7CSEOfpS3Rxwz
	L6SyVKCH7n/DusFTPOA793Ghqg6SvJ9E+9WX0lKnduADJpNP9cCAZcfFvVLLFX4xgpPopTlTMnV
	x3yFuBI1C010zslgWXMQrn6owow4/LXauB4jokh1dYlG+JhsWTj/sgCCmo4wVPd0r93VXjXAewB
	SYvK3nNdo3pKIgdbiNKoxc+UgNo1jRhJisni9dy4U/8UcMXiMx39YJo7F5f6XcLyOY6tGFnv9d/
	ZePic9eQ/WyMtdOZfa03YB1GrsvfDLZLkpsS/0ptpdNEgYgYS2VUak+eW70GxQi6O8dPN4MZLK7
	TjbOOCc6JQMzLYzEWK
X-Google-Smtp-Source: AGHT+IE85OeWdP5ivkN2P0Ni8Ax4Hx2IsJ9YAVj4fDjQwtGKBtijAK82rh20nw0nra8KvWjQFzctqQ==
X-Received: by 2002:a05:600c:46d2:b0:46e:3d41:6001 with SMTP id 5b1f17b1804b1-4792af49649mr13247645e9.34.1764753192099;
        Wed, 03 Dec 2025 01:13:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792a79761bsm38261005e9.2.2025.12.03.01.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:13:11 -0800 (PST)
Date: Wed, 3 Dec 2025 12:13:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5] staging: most: video: prevent probes during component
 exit
Message-ID: <aS__I0Mbt4CFbZs5@stanley.mountain>
References: <20251203083411.7072-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203083411.7072-1-pavankumaryalagada@gmail.com>

On Wed, Dec 03, 2025 at 03:34:11AM -0500, Pavan Kumar Yalagada wrote:
> When comp_exit() runs, comp_probe_channel() could still add new devices
> to video_devices, creating a race and potentially leaving the list in
> an inconsistent state.
> 
> This patch prevents new devices from being added while exiting by:
> 
> - comp_probe_channel() checks comp_exiting before modifying video_devices.
> 
> 	if (comp_exiting) {
> 		spin_unlock_irq(&list_lock);
> 		ret = -BUSY;
> 		goto err_unreg;
> 	}
> 
> This ensures that all partially created resources are properly freed
> and no new channels are allowed while the driver is being unloaded.
> 
> Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>

There we go.  Well done.  :)

Reviewed-by:  Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


