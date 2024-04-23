Return-Path: <linux-media+bounces-9939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6308AE7FC
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 15:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D04901C21ADC
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 13:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF41013698B;
	Tue, 23 Apr 2024 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dbPk0RTL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963DB135A4B
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878540; cv=none; b=GYLl6bveZ5/FCpstvebVDDgHF2Xa/FCblJiA9LfL3Sp02tjYpr6NCCq1Ujac2jkAHp/bQpdp6KwOiZAyNR2NMGh9Bzo7jzqMZPcoIPWH9QzhupRS20nTs2/VbHzk4q+9NLs8Who9rHYDDhKPRWtwn8fJ0prZF3oSPrrI1RFQS20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878540; c=relaxed/simple;
	bh=Hv++gcciHk78PNTCIv/A2iJfPJVk4iYqFyoESE4aYIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNjGTNt/tVFf8+Nzz4aEa74VtN+RrwGSiklUZ+G6BTRYW78ksEONl5+8fHFCckH90/si6I6NcaWkamI5yjv+2dPiPPbeKErDIxd3D996gZtMh9xe8EaTkssv2uGa57baWnph2+4MJ8lg2dJUdC8Vy3SmYVPhFNcYFJG9Mop1dnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dbPk0RTL; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so6059954a12.1
        for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 06:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713878537; x=1714483337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1n7JSfYWxQy0YOfnlGRtbUocgojCIv1pFKvACUA3fEs=;
        b=dbPk0RTLhSMQennpZ+/MswXVIM4JaPN9JZ/ZbACybcnJyBB/VA+19qmg6ckl97z9VG
         ofLPJIOJawEon/WREHrik5gKIxXKyqlP2ZqbrO5gxFhgmVMxwA2rlGz0R42vLIxwsek+
         SilmKi0X7LwPTHx7w/RLiJ8JbStXJnPFIOgDUpaJJC9wYEulokrBJFujAQiyqh5rPwIz
         3RSr/TPXiGBs5Jc2V8xsLTljtQUsSjRgIpwxOdAZDKxtqPdQv882oE4Ni8G3eslFjAHR
         U2GRFjoX3o++RfACiDsAV5UIddF511L28FLim7k373+ok2gLoPhXzWnh6JLG9d8W1QKE
         vQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878537; x=1714483337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1n7JSfYWxQy0YOfnlGRtbUocgojCIv1pFKvACUA3fEs=;
        b=jbY7PiUNNSHGSCFPG56sWwROZ7slDLmj8jQols7NYsODUTI2QlXyBy99amKyX6GplB
         rUfn2e+rqcJNq9M1x0GLHG8+PiyGSKb3iM4OCJqr5VsXenat7YFdWzEGgR6uJx6h9KAn
         2r6RzYfMN4PgVw01peP4AQ36t3VO4MyBMUwcDdTiHI4cq2eWq5iOpfNblPKHNP5hprdA
         vM5wJWoB0sA/OeCqixrttqxQ3nDSy/j++X57wK4K+fZ/dX8vZnGEIe+mYz12Y/wcPC+Z
         MiF6oWh+AtUCIw9R8QbAJFDsPTM57STsv5BbQVCeh7kGk4BjGkTD+jCq8SFqbmASUgdM
         v1ug==
X-Forwarded-Encrypted: i=1; AJvYcCXi30pS6dG1SPxmw/nj82gTslHPwDdW81m4WEfRZd0W24R63TV75WuuGPhjQJDRTX8Ymywn/2t6ZUplpJ0n5XUV5KuEKY0oRA044es=
X-Gm-Message-State: AOJu0Yye0o2SJ1avWVYZ8CUtfJSQV5Vf+W+cp1cuyl1aWyZCDjwL1fAr
	+w6z1O9GcOLJ0h/pDwnujrWMY59YrvR1mOCcChr8m7zO6FTIqpiIAPoOQ0XQhsc=
X-Google-Smtp-Source: AGHT+IFQefJU7h8rb4dkLhhIb7FlpFabv8pybeKyFHMNkkIFmzd0O8xUj7u39jSEp0mSnynBk1GipQ==
X-Received: by 2002:a17:907:1115:b0:a58:7ea5:c49b with SMTP id qu21-20020a170907111500b00a587ea5c49bmr1872927ejb.42.1713878536780;
        Tue, 23 Apr 2024 06:22:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id w23-20020a170907271700b00a556f2f18d6sm6980541ejk.57.2024.04.23.06.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 06:22:16 -0700 (PDT)
Date: Tue, 23 Apr 2024 16:22:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 11/35] media: s2255: Use refcount_t instead of atomic_t
 for num_channels
Message-ID: <cf050593-44c2-4b4b-8198-215455c630f9@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
 <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>

On Tue, Apr 23, 2024 at 01:43:49PM +0100, Bryan O'Donoghue wrote:
> On 15/04/2024 20:34, Ricardo Ribalda wrote:
> > Use an API that resembles more the actual use of num_channels.
> > 
> > Found by cocci:
> > drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
> > drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.
> 
> Hmm, that commit log needs more detail.
> 
> "Convert from atomic_t to refcount_t because refcount_t has memory ordering
> guarantees which atomic does not, hence the WARNING for the free after the
> atomic dec."
> 

The memory ordering rules are the same.  They're basically identical.
The difference is that if you decrement a refcount_t past zero it will
trigger an error and refuse but atomic_t will merrily keep decrementing
forever.  With refcount_t you can still have a use after free bug but
afterward the double free will trigger a warning.

There are time where people use atomic_t to get unique number and don't
care about wrapping so that's fine.  But if it's reference counting then
use refcount_t.

There wouldn't be a Fixes tag in this case, because hopefully it's just
hardenning and not a bugfix.

regards,
dan carpenter

