Return-Path: <linux-media+bounces-24836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6E3A1381C
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 11:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7CE4188A680
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 10:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2DA1DE3AA;
	Thu, 16 Jan 2025 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vohKc3eW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75C1DDC23
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737023917; cv=none; b=gwHslsGzHNtGOP7mS57vq+6A89JHZ5keh/2Qrh/6clkGcSfJ5FuX7Owp0GUITyN5VTiFpUGbtyIHTEBsTne0rfPpnzAofcEiUJuDkM1XuaUBqWpKmAYXjuckQ4nmnI/T7ideh7oiqgl42NOFdfbXmCbzGml/cSwwaDkK6g7OuPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737023917; c=relaxed/simple;
	bh=IlhjavGIe2MHWqoogZgT0Tv9nU2JtOgo2Ll+57Tw5AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlSmlCEBF4j6piCdWNyjb1HM3KhGqfFUlHlcrtMZ3tFuZ06ARKekcprmlboAuqz/WnIkualpafnskgZPcFtTg1ULG0V/E0lDttFK4jwlr9YSmUOhWX5uN7rH9mhd5qm1ard5MJIUat6LWT4se4tfz+RnfXAv0hGsGIrSQBUS/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vohKc3eW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54024aa9febso910295e87.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 02:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737023913; x=1737628713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBhCNj1Ot5T/tQjv1DMwwgWfzqJXz8/rTbkNJze1yOU=;
        b=vohKc3eW2PvFiWfDQ7KLmO10JJxLi0K+wEgZEA4fGiMrkwNm5+2CPvimg3isK7xrkd
         43f84EtaoBKjJz9m6c2nATcfR2qa1mTtfU15DW1UeTxy3GYLAaYZ4tonHGhZuXiEqwNF
         VJgrBTSC/lhHvKObiBblSHRWHSAgyQxLSMDW9mCeF8pr3LqrVDS/XcAt0jH609KpZfjH
         DPX+qXundgLtBeMt9trenk6McULbYPpKMUxn+uzB+4FA9/HlatVERjKz5SZVH4R/1deR
         PKncHI0GvceIxQQ9lnLO3Ovhh4Bh9J0VBwJMJeIfMcx8Rm5qlhkkVSRwiEb9FeOaHWar
         FHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737023913; x=1737628713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBhCNj1Ot5T/tQjv1DMwwgWfzqJXz8/rTbkNJze1yOU=;
        b=HNyg/UUryc5G5TVUKlkSnf0iPQF1KyoTDIXziRFBUoDMLanOI6TTmjpwS2bZgrtb3y
         Pc2IEsN0/IqRRmW5l87pHMcexKW/jt5Af68zivEpEQwSXpQUyggl9rRMlUWNSWttLC3q
         NoGvYp7TkmDEIyVrO1DqlStqD1tNML6xIwAxwMlEhZLhhdb3AChJ0HBTyl33fkX1Rfe9
         CUBbdX/4FngQJSnYZ2U1meyP2xPSxOyTVwqpm+Hnz2Rgp0bnTSHJkKz+SU3pLhW5JRKB
         Fx0qteKxkY96sYJyMdg0VHrwl3wKsv9REtNbY956CgU1Q2B5GwBAMwYW1tPZd4RJEJOB
         I9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrTbfhGG0zS2TNP0UuuzGNAEl/zsRVvi4JXkcvUVxjlh85Px5WEqq2fef8QGExJu0fcIh0G+X/df8dwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaa6RdxamzK2A00K9IAO86UxtrnFwGpU25KJMunlcJRy//9fsD
	ksSREd35Tn700r+P5CN+anLCaqy98xmJNpsyBYUPKHR6YcZrOFuBjXLnkL7HqBk=
X-Gm-Gg: ASbGncva6U7z798jogsUwprPrYBQVh+MSd5sSuTiP5ZG80QUcXCNwTjMdSz7dIEWb95
	IGEa2lA4GufQ9WwQX0Mq8AaWNjJv/vhkcnd0fdR3oFfFggg5enjpLrkB2MdtDwCCGbmakb9DGn5
	10ObjuFWR40B1UaXNFkvqRTJ61rPFkLVhO1/EsZ5KGqTRjWfQFP8KyEQ3jo5vsIukYKkQ7COeDP
	FuWYxvClSRU+GGiGcWCEKNGBlgXWP75bhLS6OnbIrBYuL/xw73izGPHw1WvXDq4vsOSef9pSQJh
	b3K0rSHdIfYJ8+WN7mEicK5r75dIuJan0H7E
X-Google-Smtp-Source: AGHT+IFhXBoiRlW8Mx5QhOgFOK20C7MGzfmBzt5IEaG3JdqNKEPDxs1ULyLjSw62pHB2VYYJC4Hffg==
X-Received: by 2002:a05:6512:3053:b0:540:251b:fe09 with SMTP id 2adb3069b0e04-542845b9becmr9553305e87.19.1737023912650;
        Thu, 16 Jan 2025 02:38:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6a72sm2265097e87.151.2025.01.16.02.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 02:38:32 -0800 (PST)
Date: Thu, 16 Jan 2025 12:38:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: quic_vgarodia@quicinc.com, quic_abhinavk@quicinc.com, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, 
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org, 
	neil.armstrong@linaro.org, nicolas@ndufresne.ca, u.kleine-koenig@baylibre.com, 
	stefan.schmidt@linaro.org, lujianhua000@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	krzysztof.kozlowski@linaro.org, johan@kernel.org
Subject: Re: [RFC PATCH v10 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <wyvecqo5mral7oosaidiyx7zbefckah2k6et7zyfyg5mequjjk@qzxufrvitgyf>
References: <20250116070234.4027116-1-quic_dikshita@quicinc.com>
 <opr6hm5ci2palw3ilj3qrotqnkxbrphngfknddd6yhgojf2ixm@kfu22wuaylek>
 <054c5dcc-9bb3-3c38-9195-e9efd4189946@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <054c5dcc-9bb3-3c38-9195-e9efd4189946@quicinc.com>

On Thu, Jan 16, 2025 at 03:51:52PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/16/2025 3:50 PM, Dmitry Baryshkov wrote:
> > On Thu, Jan 16, 2025 at 12:32:34PM +0530, Dikshita Agarwal wrote:
> >> Initialize the platform data and enable video driver probe of SM8250
> >> SoC. Add a kernel param to select between venus and iris drivers for
> >> platforms supported by both drivers, for ex: SM8250.
> >>
> >> This is for preview only, and I will post a proper v10,
> >> if everyone is OK with this RFC patch.
> >>
> >> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell XPS 13 9345)
> >> Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-SDK
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > 
> > Hmm, it seems lore has only this patch from the whole series. Was it
> > sent properly?
> > 
> Sent this as RFC to avoid sending full series.
> Will send the while series v10 once everyone is happy with this patch.

Ack. Then you have my comments :-)

-- 
With best wishes
Dmitry

