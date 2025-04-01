Return-Path: <linux-media+bounces-29094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE29A772CA
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 04:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 099107A4518
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 02:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4591C860D;
	Tue,  1 Apr 2025 02:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tL6EIhDx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1FD189906
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 02:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743474954; cv=none; b=p/Tq5UpL028VlAR9qitiiwcE/qO1yJA0hWUe/yomXbpeujo2WZ7iTuoFbDUlUubrk9HDK7hZ4Kal6whjdyfZkR/7E9vAQcYBviKY74wrh/D/siW2+Ku7rmNEkSsXW+zCOzBdZKgRp427dxO9ssyaJ73mlHDIIxLSrmvvvRKmBMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743474954; c=relaxed/simple;
	bh=zEuFvfD5TMiOqT7S/HQhste+DQ0YLvK1CMZ8Q4P38NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWEQJW5S8Z0t1tDFcj2QjuUr4mkdjbdkKGZ9IaT/z00EdUDNLuBQhs7wC8v6mbKo8i8oEtw5Mm8XkAmpm6+9hKX0npN3PkaQ961zwT+tXybIpuuM+fCU7GEpSyUTQfJr34aYewvmjoQ5Ir7jwD2OzoZPh92oruf83sSqdodhafw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tL6EIhDx; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5ba363f1aso729782085a.0
        for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 19:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743474951; x=1744079751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LwK0xB1JdUqWwI/DPrBR0YPud7lEuyTmpoct668RxrI=;
        b=tL6EIhDxYx2RRBwkJswNblD42GclmpwIJjfFNZi5TPCM9houV2XCkiJGh/52TCqxek
         RGLgnaCVOXTzCxy7kYCdomcZ/l/TeYUKqI6bmg02tW7jo58CTn5wlAElvu4arnNtiOtH
         u3WvJhU0FTnrO/vSFn/S9VGaGAfhUkk1j90AqhheUxDGq1UEvricgZkrwJkRXRkOv4YH
         1SmYwbGOFTc0K2ji252jl2t74Ll6gdOAKlM+CyZSAIuSQRkZSiUqAIdAwRNlqLXfwdRQ
         CoCybKyT4KqiL8xal3bjJtvd4d97hLRtIPpd3B4tCExhl4pQBiZ1vAr5u+TvifCj2cgc
         enlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743474951; x=1744079751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwK0xB1JdUqWwI/DPrBR0YPud7lEuyTmpoct668RxrI=;
        b=skAQhIhaFjPztH2Ak/nPZTAcYLwZiQB9StJIpOpBrqV1F6CZF4nuGsQQrsRvhy4fCC
         2Ud4areGMTyuyNWoM2dI0h9oMBP/RB4Wk0LGaHedg7O1NnEMK7PEgLFO18QI6dxcgVps
         FdfHRwLf+uMsElGVsghh8QfPY6eH+J9HR0IMmUgpv/MkluM4kH/CfXyl1yv1MbAUBycG
         ig78Bxs3QoWsrT5By/sJZ6nZVP9OWAneW/RSbDty3+Tf4BwMdPNJ4rASXJDzJd0tWTGc
         UaMMUXhSF0ldDMJ20qhSYnxJuZ+/eX7RapwHXcEceoY+U+W5RjvOmuY4cXiJElQCn2bA
         RnCw==
X-Forwarded-Encrypted: i=1; AJvYcCX0PB2UuSmxWphwoUJNYeJByzXGpbra5XOKOs5M4Xi/9kWXDZmgkByuno2pEK6idKtAUayVnDYWyEc64Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxELt/+/Q8GC3CuRl6QLdijBPnd0ZsooLpjyBGXCd9eqhTCCEIa
	n8PC+UwuBHPLd+1k6m6vbzCUXhBwI1r0oy39VCfE0EoPkncs5L4HFPCP9gOziw==
X-Gm-Gg: ASbGncvH2xHXTpPPC01sDJNg0vOzn78KjDG0BDTQGwiRpoMOIEd8ujn7VAU6Fd59Hon
	Go2neo8OKYOzCJk9UYLcqKBfo2u6lM+cNl7A02Xu7ZXZsSMJ0xDuSHVu1jv5bpatwsd0uVNuNoL
	xdG1p6zKa2JX07R/Q/YwAVby58o59rW9tE1IR4awCaTDqURDl1DJjwSRpZR0lrJv6vMZOJEc92B
	0QzAtg+QsLHSjFxC1ZZ9l2sV/Ra4ok0LaxP91Cefqr1yFk56BcJZvoskRhEX0pR7NoF3VIlQrwG
	v1CnBFcWpc4XxJAXWt1SDzuoMU1OiAY9P6ce/2ZphiR+QHKvh/0Fy6uc
X-Google-Smtp-Source: AGHT+IHyX/6Bly+OWDyenrcTsokp+64Yl6ZtC3ZBie8KdpeaTG+WXMxnKL0+2sZujOpIxmn/GWwxNA==
X-Received: by 2002:a05:6214:628:b0:6e8:9957:e705 with SMTP id 6a1803df08f44-6eed6271b86mr156640326d6.34.1743474951679;
        Mon, 31 Mar 2025 19:35:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::c20b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9644b08sm55499916d6.27.2025.03.31.19.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 19:35:51 -0700 (PDT)
Date: Mon, 31 Mar 2025 22:35:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
	You-Sheng Yang <vicamo.yang@canonical.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
Message-ID: <9c6cb27d-dd9c-4cb5-bd84-5b11ae099778@rowland.harvard.edu>
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>
 <Z-UAFkshOgeytfB4@kekkonen.localdomain>
 <47dd7daa-cce4-4ad0-ab57-4c76304b0aa6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47dd7daa-cce4-4ad0-ab57-4c76304b0aa6@linaro.org>

On Tue, Apr 01, 2025 at 01:34:29AM +0100, Bryan O'Donoghue wrote:
> On 27/03/2025 07:36, Sakari Ailus wrote:
> > > +static u64 to_pixel_rate(u32 f_index)
> > > +{
> > > +	u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02E10_DATA_LANES;
> > > +
> > > +	do_div(pixel_rate, OV02E10_RGB_DEPTH);
> > The pixel rate control is for the pixel rate on the pixel array, not on the
> > CSI-2 interface. Without binning or sub-sampling these may the same still,
> > but this only works in special cases really.
> 
> Hmm computer says no, I don't think I have understood this comment..
> 
> Looking at other drivers, I'd say the above pattern is pretty common -
> taking ov8856 as an example that's pretty much equivalent logic to the
> above, ov08x40 does something similar.
> 
> =>
> 
> pixel_rate == link_freq * 2 * #oflanes / RGB_DEPTH
>            => 360MHz * 2 * 2 / 10
>            => 360000000 * 2 * 2 / 10
>            => 144000000
> 
> If I'm understanding you though you mean the pixel rate for the control
> V4L2_CID_PIXEL_RATE expressed here should be the resolution * the FPS /
> bits_per_pixel
> 
> pixel_rate = wdith x height x fps / bpp
>            => 1928 * 1088 * 30 / 10
>            => 6292992
> 
> i.e. the pixel rate not related to the CSI2 link frequency ?

I know practically nothing about this stuff, but even I can see that this 
suggestion doesn't make sense:

	width x height = pixels per frame;
	pixels per frame x fps = pixels per second;
	pixels per second / bits per pixel = pixels^2 / (bits x seconds)

which is meaningless.  If the division were replaced with a 
multiplication this would become:

	pixels per second x bits per pixel = bits per second

which at least is reasonable.

Alan

