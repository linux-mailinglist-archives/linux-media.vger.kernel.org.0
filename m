Return-Path: <linux-media+bounces-35921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61744AE9372
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 02:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33CA3165023
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 00:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF2E186E2E;
	Thu, 26 Jun 2025 00:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMKXHNVZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1E0219E0
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750897976; cv=none; b=O+GuXP5pGayT/bD+uVYEpiLDE1HmnLb1DoYEhkkgDEBIUCbbrjNKxd80xUQRFzqcaznoaJR091l9IXujIy9XwJkQcMmTI/LllGYFSAqEXWo7ybf3ZRQlijPopX5xGkRu5V5Qody39OdVLuIPIDpmm4o3QVZhwjPQn5TPwbXO1wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750897976; c=relaxed/simple;
	bh=yuoTVrvF7Uo1dzDLeghFSD2HNx+GhM8K2Rklo6JjyGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6+OkjrIujnZDslLcObJUp7cKUkwdWPv3OHQ9/j/ZkX8VsiRUOHD3Q+bcnWAMm5hSHz3PtpISZSlyNh4/Bw5YJbrNQtc3YMnS6CP5goQqil9slVPv6X/afScQW9P6OL4QfoHxNgmw+So2UnlVjxz3t5I1hfWbMyuSI2C4hzNJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMKXHNVZ; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2efbbf5abf8so149786fac.0
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750897974; x=1751502774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8X6fN/sy8ZyQiJgaNrcn1RVnKjXmkhrDdFBrAUFDbo=;
        b=dMKXHNVZhKFVsCXmMOW1hCZA2DaqVesh6vcx98QvuvpjWpSg78pyJ3vTkMUDZYov6Z
         QDXZgRogS43Lgr5Jq3mMFxKELO2jPM0UpgHR1vADwCRYhK8L/OVmi4rPzG4kyR0HywJG
         pnqM3hi3aN3fPTBIq5XRZRIU7UXA7S/W3+c3QC7teMhmc+A27h8rrSZOAqkoiA1IljDO
         zN8tDc7Y9wr/wvtCNLNvjBr590Rm2BLLxj6RrOZihcoX3M6aoAGtLy7As+za9D7Xi+1L
         ZvSGNLMWdfBtIojrsWoWjc1lYhwBWBRUOruynAA13WZqrzEqJKLTvm2DmU/3BOF1IGU+
         332g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750897974; x=1751502774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8X6fN/sy8ZyQiJgaNrcn1RVnKjXmkhrDdFBrAUFDbo=;
        b=aS0rK8i7RV3OXlCuVMIIkKrZUad24J4shCgyRgE/O8PuLXRmMtectlKaBpRbjUykYy
         z8LjEJKZggtIqIQlglQ5XsNg+apexoq4vic26NAB/2vF3ydImdR7NA//lJ7QnP41vyfX
         DwESlBhFJKZKNstM2Zp7airz9fDhweBUY2Xhf7V3VnJlW3hCtnW8wgBtJkPztpLGC0Ep
         e0QXfiCy0wKZ6Fhux66KAbPQbcrdUKPkTzigPycaH/QFquHO3MkzFs0RPolOeh8iokgF
         3EyyEVuiaIPvV0HNpC6LWcOGgZDj5YogUMJNECBtttnKC/12wTXp50VgTfIzhqM3KccO
         Lc8w==
X-Forwarded-Encrypted: i=1; AJvYcCWi5btmuihZkZ4thUIVp/tFDA7e7Ay5E2EN3eTpDHMicfh4vkWDcIaAtC1WqRCYEUa8OrcZtoNuDsMQzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6KFGt/QilP/S07qALl7X5TptKG8RHqOaWSFmaEuKNanTKnFk
	o2r40E/CWuBO9ulnuLDm+HgWT4zOY9KiZWmVj68uahlr3bKeDY/wrFoKbbOhYc/QpWw=
X-Gm-Gg: ASbGncuFsRaEdAL3qPhknzYM2xOrW1e9ZIQjA3wkjOHcFpj4ZMyrL4wqpoRNeIp5cDH
	Np97pAhGadj971MvxRp0gzq+OBb/VsVYu24Q8gSzkD76KdvTGnB0M86PlZDSCnVXFBTMwKhNImD
	JkW7VcXrQa6lQL0P/OjoHpBmlCWgYjEqg7ypivqUl3OrLpulYygafIj5X8V8w5Cl6O8uXDGyScX
	z/jq8VBfEQxHi8GbHWhRqXmhFr1ad8BFgYwnStvNcIdJ9qA0oz3OWYKNyNlbFgeHii0cFjhpYj5
	yRNjO/95ZleBIVlkLKPPqhMmpXthAO6nQd2fhf3YeaCwbWp3ohDyBF8dyweWgIv5tzg=
X-Google-Smtp-Source: AGHT+IGgCT0aIt2Vk/6CBqJqabPF5GPEQRnBgXUMrXjo+VORvIfFnmUByQnjm3rxOduTuCu1c8Cv0g==
X-Received: by 2002:a05:6871:330e:b0:2c1:650b:fc86 with SMTP id 586e51a60fabf-2efb213638bmr3538638fac.1.1750897974327;
        Wed, 25 Jun 2025 17:32:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50fbb67sm81975fac.41.2025.06.25.17.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:32:52 -0700 (PDT)
Date: Thu, 26 Jun 2025 03:32:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
 <20250626002053.GA12213@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626002053.GA12213@pendragon.ideasonboard.com>

On Thu, Jun 26, 2025 at 03:20:53AM +0300, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> > This was returning IS_ERR() where PTR_ERR() was intended.
> > 
> > Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> 
> I'll add a
> 
> Cc: stable@vger.kernel.org
> 
> to obey the media subsystem CI rules.
> 

Wait, what?  The original commit hasn't hit Linus's tree and it's
not marked for stable either.

regards,
dan carpenter


