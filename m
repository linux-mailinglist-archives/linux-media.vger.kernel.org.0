Return-Path: <linux-media+bounces-38433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68DB115E6
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 03:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C7893BF70D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 01:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EBF1FC7E7;
	Fri, 25 Jul 2025 01:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="Hvsmd8lv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD9933E1
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 01:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753407361; cv=none; b=abHl3cz86yliW7O8csJU1YwEB5LOumy/p5Wa+QsyPf/8p1cfTFX8+UW7nAQA5ic/Ao6NzCqftOfoYbbxfkdaLV8YaM1lLR4WXWbRwPo75UP39lBid9ydAbfOiXf9nnzaNgOVZJYyAMDw0KQNAG65LgGzlXcGiObMYcse7OonFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753407361; c=relaxed/simple;
	bh=+3pLCZ4SMur/eeBu3d6qYxeNxPFr8TFUr5342JtNzXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLRdbywoXIGDnYv9JH10cM5yQOrXjKe8p+p1nLErKzkK+JmKnPB20ttl41JLja3X8JkkSp69eK684+ayB4qcaUyhvJvcVD/JZAuaintD1+lBVZoDZvet1bOIF3RcD+5mAQCp0dPcR15ZfLjOzxTYie7BIxGWpmlyckNtON8gAfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=Hvsmd8lv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1558270b3a.1
        for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 18:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753407359; x=1754012159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LMeSZT/xp8mSZTumn41Z33GAONrSp2+tqVJkfIWyd60=;
        b=Hvsmd8lvY7wfv3doUmYISwn/zCv7pJ5+9d77cP4k/SXxX1bkLoh62NrtMJOQVAMCI8
         tQzs7WJOmALUWWbAsmZwOj6MPFiEN5y4IVbYFty4WWssOf04vDGHViWT9njKAAieGc12
         t4xVWmcNutUsiX54QUY6O+8wY0hnti10CXE1l789OgQ5eFKit1NC7RZsSq+yqr/Lfexq
         zkLAmNsQYTFCPIQ7s5HWwdvUa4Lu2FPSo31TRon9jbkdTP0qcVpIvCkyWtBDrpCeU3Zh
         CqTO3ogcN9F5Pg/Ur8lro6pW4JPT474W0g8l0BeY3Ps+1WyWfOdT2scjLuIHWPHN0t5N
         0n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753407359; x=1754012159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMeSZT/xp8mSZTumn41Z33GAONrSp2+tqVJkfIWyd60=;
        b=f5goJW6jFDQcGx0awQuiNMGS8BLOcMwQ7x4baisczJh616LTMAaTONPbW2/AWnn9wC
         RdQ0GBxXFJOThvoX73n83DpmjWFLkDNS8YTLzNdQKKRogwcKPEzs3MpLe+GZYC8cJr/O
         UxFRy4LqmTDRsOWJw1ND9zaZoPDwU5BfkAP0T31KRZztlHEWwMBu+2Xr187w4lOnvk4s
         tc4XTZmLtsGHhqM4wx6/1bSXnQKyfmG4U21WIQjM/lrpL3vkKT7OaHCLEZwjrxZswTxx
         IQ4C6AemLCqp2TXe5cL36qhJ/KxW3s05p9SFjXevJQHR7Q1r42zx9MnLoPWT78jmarNh
         c8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/AlyBDFKYvsGGdEuWLti8bqbwGgWuJcwBMOcjxetXXc0dy0rAdJkFwJtrn5oFjSmwXGM6SpKRdK905Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3lVhH/sxk/5W6AbX+Z5ogYP1aCh4HWdQi8nZ96GL2O8MYG8ZD
	fwYH5uH+P4tie3bImgB3iyBWiJ79n53txNSMHi30DsqJWz8bZhGg7ozzcH8c1mUO79FL
X-Gm-Gg: ASbGncuvC24c5Q0GpXCl1DEovhPsCPttO7a3JCq+Ik5wGImKknZaK8KpVdzhvkZIGi7
	uNe2J3ozrCvoMR/x94RmGY5bOU16u9ZN00JDyT5EFeE0G6/Q6Lox06mgdroR089csxwq1lGMt/z
	tvUu9w4HNTCXvw355omdA9PBd+N/Xz7hD/h9vcPOpFWB43bIZ+kdszuRsxgmbVGhe72gmM9pQ42
	Gu2r7FbszEpLIwu8X6hJYNEqDBQDgAOZnwSjRfUILRfpvcg7adWEJQxwXWvwG9vcv8GLeOleZFQ
	uKr1aFYgCc1orJI0wZZoyTnfc6GkB8jZrfW4FtvE7wCkGesK27Zp5Dz7vE91YWBplL4GREcn4Rd
	XJCJ3QE7IBH1WbT9h05pz2fk=
X-Google-Smtp-Source: AGHT+IFA3tRC9XK23Q+gCAkinzEN10zdeRX2dov6MnJnP0d1hmo0CpjXc6mkrOmcoPi/HBmXhSPCJg==
X-Received: by 2002:a05:6a00:3999:b0:744:a240:fb1b with SMTP id d2e1a72fcca58-7633266fc94mr423305b3a.5.1753407359443;
        Thu, 24 Jul 2025 18:35:59 -0700 (PDT)
Received: from sultan-box ([79.127.217.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b061a061sm2635297b3a.115.2025.07.24.18.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 18:35:58 -0700 (PDT)
Date: Thu, 24 Jul 2025 18:35:55 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 5/8] media: platform: amd: isp4 subdev and firmware
 loading handling added
Message-ID: <aILfe9qaR49KGkcW@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-6-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618091959.68293-6-Bin.Du@amd.com>

On Wed, Jun 18, 2025 at 05:19:56PM +0800, Bin Du wrote:
> +static int isp4_parse_fwnode_init_async_nf(struct isp4_device *isp_dev)
> +{
> +	struct isp4_subdev *isp_sdev = &isp_dev->isp_sdev;
> +	struct device *dev = &isp_dev->pdev->dev;
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *remote_ep = NULL;
> +	struct fwnode_handle *local_ep = NULL;

[snip]

> +err_fwnode:
> +	if (remote_ep)
> +		fwnode_handle_put(remote_ep);
> +	if (local_ep)
> +		fwnode_handle_put(remote_ep);

Copy/paste error: the second fwnode_handle_put() should put `local_ep`.

> +
> +	return ret;
> +}

Sultan

