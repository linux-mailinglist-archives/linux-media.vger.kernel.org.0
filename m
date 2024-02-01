Return-Path: <linux-media+bounces-4543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611584539B
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 10:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16E5CB28B63
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 09:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8FB15B0E9;
	Thu,  1 Feb 2024 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C49M6ZE4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A6615A4B1
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706779041; cv=none; b=szRJUOh6XexIRM06QH3q8lOA92JPq0zJwjVtZ5YgHsLgxJcXPDIJIA/yyopv/tNqjcjNFAutDBaTuYu4VW5UCd7JAg/Z+dpa3vzBRxzOcH4Ho1jjw8HKjhisztIl/vyHGyCeC8WsYLSB9oeqMGPFMT9JWooXEWJprRfa3Xo53R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706779041; c=relaxed/simple;
	bh=dRninrZn2CkwbSwfJqwV6JQ+mQirLeF+tfpFdTzDgr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwDVsgEMpngmV+vZjOsrBrYubpVs03Q5Ee3txW4qJDqj635rElV61xcdCrs5dUohd8Ocajh/rT29JshE1+A2YZIUe4DxSCkfr+/wGGaN8RnwZwIovn52KRcuD/4ABfchQXoiXu+17UbrcboqCfl8MNE4CteQf/U4+e+hdqi2Tv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C49M6ZE4; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2903498ae21so488116a91.1
        for <linux-media@vger.kernel.org>; Thu, 01 Feb 2024 01:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706779039; x=1707383839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dJkkh16LsRYgqIVCy18iB8Ohh+azXN/44nJo3EFjyPs=;
        b=C49M6ZE4xXjin4Jn4ag0qvcObHOkls4ZaqMnx5hp3cvYxnm+Kt4+dZyRNJMgeVIM2C
         MFwP54lxc+0Ri4PPMJtR/ec72BGLTZByW2DONSTLzskMX0/EH8B9ZmRozwJEoIHFnDTX
         Bm5RETK+Gdb/mIaYiPNNXMtQ+Ytu5B9A6vuF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706779039; x=1707383839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJkkh16LsRYgqIVCy18iB8Ohh+azXN/44nJo3EFjyPs=;
        b=MoL2YNKvIf2/1R0rJgFF7DOQUUqtWZAQtl/FGXSVJAa75oVMDMO1lyQqO+0w8/oD6Q
         /T12r9gfU2DhxfulQ53h7QFaH6n+DqFpuo2Dz1pkP/1TZPDwcsh0uTQtf7n2nQmh8LTr
         druXY+0rcp3qW4Qn8Q8YDYi8IBmTuB+1BZmv/4tVJnLoT3TDe0YfSmVAkp+QV6yLSoVv
         D9NzC1NVWgQNG8m9LqALuTedjaa49wijKEFznUoQ+9xuRNYNBVG5uHlA3FEWxRTQUx6R
         vGGNLYriaWsKk76eYoJeEBM+Kvx3wB/YyMv3Zym4d8HHYz50JKRI1rmyeuCbySztCKLX
         ZcOA==
X-Gm-Message-State: AOJu0YzPO5Zp3TdfttBRySSYkBNC+W70qnn4aWqtVminHV+DRzE70hru
	ly6VjL/vVWl9DYXr3JZHPGN9y+8LlcnORh7N502mv96I4N8BPP0mxv0NGEglkA==
X-Google-Smtp-Source: AGHT+IGCK238jdbepuO9jPnoWPHTerlxpySqPE0TVE3XzjndyXj2/nH3QpOtvRHlDeqhE0qebFHR3A==
X-Received: by 2002:a17:90b:1947:b0:294:9d68:228 with SMTP id nk7-20020a17090b194700b002949d680228mr1497697pjb.1.1706779038902;
        Thu, 01 Feb 2024 01:17:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXvTfceYrCsT8yjdud+69TIu9YT8kgzufsrWF6D2LkN03usjXKyo8BtgTM4bmqpkIXCnRA/88mrOuvoRh3Jw30gg4sNVcelibkU7sOia/Z9EEUvXaiiAeHYI9uHMAjQmfJjG3B/32f9ityqbNAkQZoYP+vPDC+YxQH3iAfZKDBhuWqNxm4f3EwEEdXJR7HMIEGJLD4RuB+ZDnnl0vo17gTHaWzok08ciPPrABpOK9DUFRdDaQsiIQ6I1HXyLUctEdq0PbW7e9iq1cMjXi1YZ6T4zpsnToqavnUrX8mIM753t6CcNZt44Kt/OvrmD/Y9S17aex5N4CG6
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id ph11-20020a17090b3bcb00b00295f1aa0a68sm2547677pjb.7.2024.02.01.01.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:17:18 -0800 (PST)
Date: Thu, 1 Feb 2024 18:17:13 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v7 17/19] media: mc: Check pad flag validity
Message-ID: <20240201091713.GA69174@google.com>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
 <20231002105557.28972-18-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002105557.28972-18-sakari.ailus@linux.intel.com>

On (23/10/02 13:55), Sakari Ailus wrote:
> 
> Check the validity of pad flags on entity init. Exactly one of the flags
> must be set.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/mc/mc-entity.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 83468d4a440b..543a392f8635 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -197,6 +197,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  	struct media_device *mdev = entity->graph_obj.mdev;
>  	struct media_pad *iter;
>  	unsigned int i = 0;
> +	int ret = 0;
>  
>  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
>  		return -E2BIG;
> @@ -210,15 +211,27 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  	media_entity_for_each_pad(entity, iter) {
>  		iter->entity = entity;
>  		iter->index = i++;
> +
> +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> +					     MEDIA_PAD_FL_SOURCE)) != 1) {
> +			ret = -EINVAL;

Can we please have some sort of WARN_ON() or pr_err() here?
This is a pretty big change.

