Return-Path: <linux-media+bounces-50150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF1CFE6F4
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FD503095A91
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59267346AFF;
	Wed,  7 Jan 2026 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMZyLATV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4EC346AE8
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796270; cv=none; b=SOM8Q8VeCbv4WtN7YbFwuqgDjz/rFcVlPPdcYCJWBHzxElNU94yLyrWxNuHdpPoAUjm4DUoGFwkE88cJ7hYmNgERDhp4THtnuMpzPWVSXr85KS3XBXa4gHcz5rwtwIybMDIUqJhY9Zk43Ls4Vk6iagR57hINfHp8/zeL2wude2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796270; c=relaxed/simple;
	bh=D8AxSemiKWwzplSHLSboj4TJDF/1ewd39FU62I//Zww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjWnni0bJQ2rmfjo9SMYS0ypf2/eCIydmx4uuZoZ/AdLP1cVfNqFD+gijA3uFsysjgZ/RBMmlVuEKINtA5vyyUJY9773BPihWfU6rT0HQhsjGpwOBJI9QeCxe1gEyq/3bxfNJRbDxbZNJvEskEmfeb4NK9M8kRFH2BpiUybN5Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMZyLATV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43260a5a096so1445256f8f.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767796267; x=1768401067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Zk7xXnEuh19gRn4MSw/h56LQt8KgVnQ0vjZH6L/AeM=;
        b=pMZyLATV1mp70dMhs1wM8FyvwF63r3NqBDbtkvjdk+ycguHwfgy4RbBwe+Pp6DNDiz
         3AI/wagMF20aGFyEYo2DuE/WhSdCofPlPhDHXVkd/1D805OahOt/eppWNYP6tIDvx7Fy
         ldOx8WpC80/1rT+qn7V8M25Thdl9+3BRQgPITvdixG9/ApX72DZXJH4oe0YNPsFd3dFn
         qnVMK7g8I6CRw+bmDJp+JWfkSMq30YWtIZtLHmgOahzRduYhgaksKOVEKggMRn7nIL2r
         ELt7pxTAgIpvzuuxxI7FXi4JC3jlAsw44vJSNHV8/dZsTdBCRvSxFsQwLU3gZl24h02g
         cPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796267; x=1768401067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Zk7xXnEuh19gRn4MSw/h56LQt8KgVnQ0vjZH6L/AeM=;
        b=R5F+z0gNMEdVNuG43m+RzCgrRzn8Izwk9lSTugDPGSi8RpRIhDHngISzPitFa+jtHg
         w1LoT5wWcge1MuLJr2y732QIaVcQEI7CsU9TBtN04na0tbphGy9a9awUQqjg9FWTmrOO
         Rry2GtVvDL78sng4xojsvKnFqytNrjsZKA5vqjPH+IfoHvOHVZKIodOiEh6ZI4DvMglS
         RBX6+soa+JFzcMEb81KxNWadNtevJ561D9kPtfDxyVOMiAHPtiaqPSh/XwaMgqaZ1tad
         7hxN3uW/w6iFdsL5l+kjTmlo24RWS3SAWVR+JSsp9KCXf+SjRvTr66m8JOfUmOTNQJxv
         or0w==
X-Forwarded-Encrypted: i=1; AJvYcCUT+cdOVZavpgnFdHTbg5slugcIzWgy1o/bG0eeDqkjmA7PnMWu9HoqDI+DNQ7cvXm6URPGfvQLb4yS6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGwIeAsi756aCdnknXhfj8LW22GnIf3PVze8n4Xh285sY5oywc
	MecSVX0LSfA6vf/rBDA7GBoDeRhmZFE6UFtj4Hx6CMMu1yErm2bOCkLOT0LIEskZa3U=
X-Gm-Gg: AY/fxX4VIIzJG36t1VvNsG5jYdA1NGBxgziwhFBNz423vuLcq3Wb+88mEPqTVmGYntG
	vThVWVhdufJ9+sWgN2Gbb2fYUim3wN+47AWKAN7URQOR+fEAoOpb/pSMnam7YBqASf5I+wLmP6c
	cJzsZeyj4u0cohpIWY1jZE4UQHuznYGvUO8K4xMOKYiOD6VQckvcOFe93skJcPn5PxDDwzGPlo+
	9X6ji4rmV0XSKNHpfzp7KXpd3Vl/16f/OZSyVf5iEbLkZZ5Qr89JpQBTppbeJWwMu4qH+fzP0MT
	/khgvnH6kUhsOXKBAUn47br3P1/lqBGeDH9URg5PuZ5GbkVRvAc6FzfNrQKSZiMc7vCgcqWzbXw
	dQVYLxmYtJd96Lk3eQhy3xh3t+ayPJMiPIK0WYiCYw7v3Up+qebTe/EiRpVXFcPbnpQfz2RMuzc
	uxXFGLg7FrQw6lLHwv
X-Google-Smtp-Source: AGHT+IGKFvF9bPd/K7p2LRS+DkckL1HEjJZEVJ9c56W23qxdplsmQlw5GknvyXFPwiNFQLGI8KElVg==
X-Received: by 2002:a05:6000:1acb:b0:430:f879:a0fc with SMTP id ffacd0b85a97d-432c3790b06mr3439013f8f.21.1767796267143;
        Wed, 07 Jan 2026 06:31:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df8besm10132548f8f.26.2026.01.07.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:31:06 -0800 (PST)
Date: Wed, 7 Jan 2026 17:31:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND v2 2/3] media: atomisp: consolidate statistics
 buffer allocation
Message-ID: <aV5uJ-bB6wQcq3s6@stanley.mountain>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
 <20260107134844.68074-3-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107134844.68074-3-karthikey3608@gmail.com>

On Wed, Jan 07, 2026 at 07:18:43PM +0530, Karthikey D Kadati wrote:
> Refactor atomisp_alloc_css_stat_bufs() to use a new helper function
> 
> atomisp_alloc_stat_bufs_list().
> 
> This reduces code duplication for allocating 3A, DIS, and metadata
> 
> buffers and centralizes the allocation loop logic.
> 
> The helper returns -ENOMEM on failure, triggering the existing
> 
> cleanup path in the caller which correctly frees any partially
> 
> allocated lists.
> 
> Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 123 ++++++++++++------
>  1 file changed, 81 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index 5c0a1d92b..9e572b3e6 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -678,13 +678,78 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
>  	return atomisp_try_fmt_cap(file, fh, f);
>  }
>  
> +static int atomisp_alloc_stat_bufs_list(struct atomisp_sub_device *asd,
> +					u16 stream_id,
> +					struct list_head *buf_list,
> +					int count,
> +					enum ia_css_buffer_type type)
> +{
> +	struct atomisp_s3a_buf *s3a_buf;
> +	struct atomisp_dis_buf *dis_buf;
> +	struct atomisp_metadata_buf *md_buf;
> +
> +	while (count--) {
> +		switch (type) {
> +		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
> +			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
> +			if (!s3a_buf)
> +				return -ENOMEM;
> +
> +			if (atomisp_css_allocate_stat_buffers(asd,
> +							      stream_id,
> +							      s3a_buf,
> +							      NULL,
> +							      NULL)) {
> +				kfree(s3a_buf);
> +				return -ENOMEM;
> +			}

The caller doesn't propogate the error code either so this doesn't
affect runtime, but generally we should propogate error codes.

	ret = atomisp_css_allocate_stat_buffers();
	if (ret) {
		kfree(s3a_buf);
		return ret;
	}

Same later as well...

regards,
dan carpenter


