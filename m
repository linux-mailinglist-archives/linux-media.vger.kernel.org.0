Return-Path: <linux-media+bounces-39124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75BB1E9A3
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 15:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4315AA063F
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 13:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D0314B086;
	Fri,  8 Aug 2025 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GcQRiSTS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819CC12CDA5
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754661284; cv=none; b=iLsSobM74bZH+6dGhdK5/CUcY/9Ze8yllVwNTrBHvyRH/SPUFYimEAuL/eU2YCOhCBEfJQjYp3p51XEf/1rHbYhioa3MFix8jmoAfKVvggD+0aSOspKaAqXgk8Ufj/iC656IySiZfBnQKc6S2IsecXafIHP9vVZO996sxBdrnDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754661284; c=relaxed/simple;
	bh=o+KLbLYuZJ7+bIILdO9pY6vQHMLbC/SzrM/4WRI7UUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAn6Bkl0GczV2AnLeZK1sfnjfiFJHn4wnK06LzcBlRetS7um7MXmHR23elgN8/kT73xWNQiomZS8oYND9F2ZM8rwXe3Zydyz7x29rlyQbJRyoavbAApZ1rrnSqh4JoTpRFurvpWkKAlJiHkw/iXBZp7CPem6LxHkwHm2fwI7bDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GcQRiSTS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-458c063baeaso12557995e9.1
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754661281; x=1755266081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=moUCs0yDM2TAbGC1DYve6KzheacI5lUjhzwM2sT6dYU=;
        b=GcQRiSTSSUwX9NrIOElnIdAiYUb5WJ/VgSgAgwgr4HnXYqKhsR+s3o3rKeeJ/Y5frd
         NepFW331OYJGPCf97buQ4I+UZhZxUunLKBxqRBi/5VEFbXuHAhM2fwn7PAooNW9cHju9
         zBl57mIDspWVKeHZAuOrOf5XIYvGxf+orvb7AkdvRzbjFvDfsqW+swpNqpMfdnoLqd05
         jz6z761K2U0yH5pS1qX1qC+IDJpUZE5BP/9PcmBCb+KO6hKHfsBJfJ+IGXkZh7rfCdXZ
         dZtK7XRcNnGY37Wz59l/82CjRinhNBA2eRo9O8KrV9mmDmpK1zBa4xejaA7tYFDhFa4f
         ENxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754661281; x=1755266081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moUCs0yDM2TAbGC1DYve6KzheacI5lUjhzwM2sT6dYU=;
        b=YT6lmTd+uLiL8BLAFFNu/YNbgncOHFbQ1zu0UPKSQwBjtVn6tiRbt64G38qz4H53nN
         hB9lCJQqUrAN7l3CmP7K6NeYggvb2rZ8DWIOtPVUbnKMZCbzrSliyhJAkSRiH5Kdt0oy
         KBfJJ5YzIggIxOaDdHUQrAauNM3OvWRP/EISKaLbB3VbqQRV/9FwKrZ49Uu7X2+JD3XZ
         3mRzcquxvD9yWm9ejn/H9jNe1WR9AEivGBTO50FiZ979vPPPYFjRUWQgHM/RA07cbe19
         lyPr+ppCCF++qhc4OzmD12dGiJqvqZrIWidRGmYDkqDpwzRWE82nSFC8t32OLhC3a5+g
         WOKA==
X-Forwarded-Encrypted: i=1; AJvYcCXVuFl48s7XW1WouOjZRBPQuKHxy/dPB+an5QYviImgvq7JUR7IwQ7WK6DKKOaTXCzXZLeYGlJf7XcD9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwo+nr6J7BGGmJ8vyn/qZ9Ywd+Qru0O9N8gD/BX6es2Dakrzqk
	mFRvHQRAWMyJXR+JEs2CbSi/ja8YM/OTbAcvFW9Bq0y5UlPKQxxwDno2zBbyKliavk4=
X-Gm-Gg: ASbGnct/19j9xf/neHOD6bE7pfMiOTtVMQH/q//ON/5ginT2aN9N/8maX0Owb5ugPaV
	Zvz3sop7kO/F2GKq2afN5Y28G6ou6CjKIQvMJfWLg33Z35OHZa/Kdrd1PE+avDR+IL5MO+anBa9
	ZWENUyU1fhZNthv1Wus+AO5gnjsSRWAaElXI4RKiOqsj3yYsYG6q8k+FASNLlJx7PUp7FmpBEhZ
	19awTm17XQeTkEsjxGK8fCLqi0bG+fmR1NlilHiLNABjmFAVWPa7wSxBh5W/pAjkn8zlnSnfH+M
	JG44X3ekkeoA2L14gACg2oSR+ba4wuobArNwT7Kt6dhtdVIXmkYii2tBGXn/D6K2knFAxs1i7jT
	TL1h5HqdWpoIsw5Fcf5fviss/xUw=
X-Google-Smtp-Source: AGHT+IHVsSJcpEnemEjHp7IGPVJBlggfM4sjR5uv5Ni77q0DabV1OzZ+8lZwWPntSJgVoUciTeN9AA==
X-Received: by 2002:a05:6000:1445:b0:3b7:8412:4540 with SMTP id ffacd0b85a97d-3b900b72d33mr2075950f8f.27.1754661280768;
        Fri, 08 Aug 2025 06:54:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b8e0846777sm20539318f8f.48.2025.08.08.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 06:54:40 -0700 (PDT)
Date: Fri, 8 Aug 2025 16:54:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix alloc failure check in
 v4l2_subdev_call_state_try()
Message-ID: <aJYBnGXMYOzhgRPh@stanley.mountain>
References: <20250808-fix-subdev-call-state-try-v1-1-000676e46754@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-fix-subdev-call-state-try-v1-1-000676e46754@ideasonboard.com>

On Fri, Aug 08, 2025 at 11:59:15AM +0300, Tomi Valkeinen wrote:
> v4l2_subdev_call_state_try() macro allocates a subdev state with
> __v4l2_subdev_state_alloc(), but does not check the returned value. If
> __v4l2_subdev_state_alloc fails, it returns an ERR_PTR, and that would
> cause v4l2_subdev_call_state_try() to crash.
> 
> Add proper error handling to v4l2_subdev_call_state_try().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: 982c0487185b ("media: subdev: Add v4l2_subdev_call_state_try() macro")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aJTNtpDUbTz7eyJc%40stanley.mountain/
> Cc: stable@vger.kernel.org

Looks good.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


