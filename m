Return-Path: <linux-media+bounces-11795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B176D8CD045
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30F34B22C97
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEB813FD95;
	Thu, 23 May 2024 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jt+Tc59O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9713E3EC
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459820; cv=none; b=RgEjZKSN7PXlx0LX357Q/ziwTPi+JN7DcJ/BVHZr9MbDrSKl7fXo+3O1tDBLkb+B3X5dNG73W5mAmZ4spp53a6rYLlmA4v2V400DnnfXqF9D9xn5mJYMnEIJH8XEb1BDre1vlMdjJelsIWaMs3t9rj/oMLeVswZQvHgBM1zIAlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459820; c=relaxed/simple;
	bh=2KipswG3SW06NUnJzETJvY0SfYT0V8GYDD2v8dOrjrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRgFlL3KiRJv2U5gW4l2WSd6IEKk8SuegPuGH2aTSi0pjK9q3G+SsGHUAtCbvLkY2tCry8ztxv5Qvq7bKKtDS4Jc09pPkPHG2hOuejiddHMumPVvhMmiUF/i7f8wQnwfmNkPi6rh5VT5OWAcG1GVcmSqFF2IC3MQFJoruuocRLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jt+Tc59O; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51f3a49ff7dso9732276e87.2
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 03:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459816; x=1717064616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKSB7IlQHbEtURtFb5gxRDwbVXbfNmYltNG39raj9z0=;
        b=Jt+Tc59OJwYgtbkiKVOiZ8+cBGfM+bxufNx2SFQRzAqlPEpa/KrOHAPFPoWBujzEBX
         LHlUpgjlaTTKIRffH6Cwl7LPnfYY25ppvF9msna+rCMxhM4JdA1EVACLlJEgItGdZ863
         5+dAOBwI01s/K2xUK54T0kiy4BSD51ZrJ1l1oiIbblsigpFGtEi7kSdICyqShoePPSAk
         Z2AbmDTvpuan9KwYBCzvEJmID1nWUP3vKiXiFCLc//SU8XrF/OUm7dGY2zTw+e0i4atg
         vCI9yY59MHRxIPj7iodmITOpI8AM/Zbn1MABUR7qj/+1lTTl0ZPL2KfGf6pOp+elj745
         4nCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459816; x=1717064616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKSB7IlQHbEtURtFb5gxRDwbVXbfNmYltNG39raj9z0=;
        b=cxlWjMMt5t1jQGV7wgWDhMtQkPkwRH0Vq3aoPQSKXe+dn3XFVsPzuMhDVdzek+iLZN
         O/zK02qR5XseXe/EYeasZuZLyyuyMiVa3T7r2JcKCnElckpEpsZCyR2TNBbCaiLv59A0
         Poim8K+jfrB6yB1QMerxOikHaMNe5iRrtFutsn+WmwUuBvCYf4QcJcopSUWK33M+N0Nn
         zfZGetjAbe53srhJeL1jMPBn4G6xMl+SJFvvLiuGM14ojjUkg3KbXNMJF29mf3Jt+MJk
         7h2D2752XH6vK7i85eLUfwhhuCpEafTt0Dad9l24wAR9eQYN/6HL7ikT/P6ZhznmCzjc
         Dg+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8xdV3MRrbEt4Oo1ywA+UM4zcgs0gj3NeeIp6mmmE5Jvd6JcjtLYUBN+KFLAsOEtBbbzAg/V5gnyJ0MilA4EJ9VNE0u+00tW3saIQ=
X-Gm-Message-State: AOJu0YzBxqSXJrsP6LfP2IqXpZ08RnJPXYzVCSaovng1qo6wwcWrv2St
	tQJ7YyNrLiE6eAZPN0TWytXBdfprE9Q0NimvB1VLKsbOtfdAyyErsYpJBXODbLI=
X-Google-Smtp-Source: AGHT+IEzxmh8z+32apu2/wM5J7agRdiD9NBJtehzlsORjUBmhCc0n9L3OJrcZNqTzzbLZrKSNAoRhg==
X-Received: by 2002:a05:6512:3b85:b0:528:996c:137c with SMTP id 2adb3069b0e04-528996c3830mr730488e87.63.1716459816721;
        Thu, 23 May 2024 03:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d899asm5271242e87.231.2024.05.23.03.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:23:35 -0700 (PDT)
Date: Thu, 23 May 2024 13:23:32 +0300
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
Subject: Re: [PATCH v14 18/28] drm/tests: Add tests for Broadcast RGB property
Message-ID: <3pxdrdobtqbxedsstby2bfexuvzyqinzlxdp7d3gii6bbecp3y@zg6wl5lu4kgk>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-18-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-18-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:51PM +0200, Maxime Ripard wrote:
> This had a bunch of kunit tests to make sure our code to handle the
> Broadcast RGB property behaves properly.
> 
> This requires bringing a bit of infrastructure to create mock HDMI
> connectors, with custom EDIDs.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c         | 116 ++++++++++++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 151 +++++++++++++++++++++
>  2 files changed, 267 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

