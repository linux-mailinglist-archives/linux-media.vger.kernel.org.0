Return-Path: <linux-media+bounces-9471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2169B8A62D9
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 07:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4DFF1F2328D
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 05:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104DF38385;
	Tue, 16 Apr 2024 05:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SM5m0z7T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C9039AFD
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 05:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713244116; cv=none; b=QgVS1ywUcQD/X488072jsBfRxnsiztOQ7scTxscfDKFxrDUgET1Ajy0qMwfSCP+5G8ertxM9rLAedPVDntiFvf5+sVX5x9uFPk8yrLq0u56p0YIdctF0M9m947PRdvsBJUsobEUrFo64m2hO5sMLZxkyO55/zHDUEBAqCqzc0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713244116; c=relaxed/simple;
	bh=ogTb/EY/IFRV9I9Ma1QpOc93lubjjzj7VSkmXIhlhHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1hDIK4UPgUdb5LePdkpeJOpwGV/AJ4GpgG3xV2NNTyfvGFi+S82mO1XCYBAeq6mPrCYGRCeiUYtxcmDihGmE+u91ve47IhYYuCtknWhKqdQ9Lupp+OpFuZOR3yqxAyo1rja1ziNQifzBpp9HC5kelL8YY0Rgut//zmV2bpv670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SM5m0z7T; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ed01c63657so3563248b3a.2
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 22:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713244114; x=1713848914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+oFRnUlIWAVoS2ogvawh6UrIJvrJD5mfVByWfU6FCcs=;
        b=SM5m0z7TFXqS1fvrFLpjthozuB3gYh9BICiGe5y2jmmTEXs8Y8YyQVSh5PFffZuR8D
         PoiUM0NwyhYDaQzIbHuNkYJhC9nPR6ZGoRc1RlFbDdmJrjFuiwvt/Z6VnaInmRBMWe0x
         DWbbbcz77heOx0YuxJBU2qFq4+LMKKKklfP0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713244114; x=1713848914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oFRnUlIWAVoS2ogvawh6UrIJvrJD5mfVByWfU6FCcs=;
        b=SZ/Jl//kg5dsM9lobp5WGRA79N0//vRv54TomfMH2Df9z13TF/w5S/2d3qHY+pZPvC
         xbm+UGQiCNGKwlHgi3RPzFtauiZjY9m7v557B8cxX3Q45x+ntASo8kGufYy/9aqcH/lE
         OOVhsHTZ14ihI0ZZnXkzhT5dCQqxFNjaK8rOWdoykDgKxcZMSQACADc6GneTiPBMqxSC
         E55ANI6DwkyrnFz5Cy0dB0jLX99vuNpjjYwVn/PoFWJ+Ubnkwkq7OwhzASRf8RyShPn6
         IIhw7lIDT4VujjmhpUN8r08DPWc9lQYH0KVBI8YEGLdA+k3D2k9FFIjiNE/8bEuZmRqg
         G3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOzrsk8s4XI3mJR/I09V2EVXejFbrfjI6TGNcoKMh6ls93RN0oZtrl9D1ZdwkwpGo6lZYUfU1fqKp10sL6hciGHaSynkgn4h3eg1w=
X-Gm-Message-State: AOJu0YweCuV+2glNB/Isw43LJGvj+vwZylrW9SzPaNACK5LnpKCYpH3s
	G+sawoFFsRUHYldZk8P9Ip/FaXBxjG9OD2D3Dl/0/Ci0wTLIQ4jt2QV9pkIZ0Q==
X-Google-Smtp-Source: AGHT+IHdeyQZ3pISdOfe7kK+Dd6aJIUpN4QAP3YPL9N18bYFaJvtwg0bTY9a/3ZlCCWhymzrgDPW+Q==
X-Received: by 2002:a05:6a21:2d85:b0:1a9:c13e:f211 with SMTP id ty5-20020a056a212d8500b001a9c13ef211mr8124701pzb.47.1713244114400;
        Mon, 15 Apr 2024 22:08:34 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001e49428f313sm8835349plb.261.2024.04.15.22.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 22:08:33 -0700 (PDT)
Date: Tue, 16 Apr 2024 14:08:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
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
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
Subject: Re: [PATCH 03/35] media: uvcvideo: Refactor iterators
Message-ID: <20240416050823.GC14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
 <20240416043916.GA14947@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416043916.GA14947@google.com>

On (24/04/16 13:39), Sergey Senozhatsky wrote:
> On (24/04/15 19:34), Ricardo Ribalda wrote:
> [..]
> > @@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >  	struct uvc_xu_control_query *xqry)
> >  {
> > -	struct uvc_entity *entity;
> > +	struct uvc_entity *entity, *iter;
> >  	struct uvc_control *ctrl;
> >  	unsigned int i;
> >  	bool found;
> 
> Is `found` still used?

It is. Never mind.

FWIW
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

