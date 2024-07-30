Return-Path: <linux-media+bounces-15584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D7294159A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 17:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FD29B2511E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 15:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3541A38D5;
	Tue, 30 Jul 2024 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qbQwnnDB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F86194A65
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354193; cv=none; b=BMwagkzVQIoU7JjDyLgPC0nvpWix3IWrLwWWCgmnC8ItZKworj+pSk0z9rjmBIb7p92id/5Vsc3VRT8dOt49I9C63HlCcS7RmyTC14z3WawBa2E7LHoQyRhcDJ6vnN7NOSRzxSxjNaN+pTTIZ4EFNICrr6AgeN+oJrxc7INXDno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354193; c=relaxed/simple;
	bh=rSvGfadipcs90Hv/YQ9X3+4TBeY+iyPipFcMLItNGww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzApoAT3wDGzuVX5JRzLljkCScfZouyqzcs5V3JN6WFgypRtUuVg8D1mhaCREGvN63XQuWgMDC02HzKvAONcU+/LnDiVquOPSPZDAJQs2CeGurQT2Czq4zf2/jqC086+e0d0HIWfgunmYZ92YK6adVs/xO3UWP9nZoX6TC3L+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qbQwnnDB; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-261112c303bso3294351fac.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722354190; x=1722958990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GZs3J/cTXLWFL7SSFr9tAI/IXhUTrybV87IR2TNiVLQ=;
        b=qbQwnnDBWqxhif3jbOCD5EjvTscFRbA1mdvEaMFltz6TtvtOHsojQrzbmAgh8wTSAH
         T23A91Swf8LJYfDP3HGx2rBCEOqGL3IgoonIH4Mf+R9PBd8bsO+2kOrAtE7eDt4nzPNh
         RsHKALDAlxDzC6C7KPyEv2vayTlT6pXtSHOhJgtBd58DPaxCUdemv1wfq479t3VNpAdN
         sZ1oBq6Bd+9APK1HUGLalzeV0sOrMVoz3MqDuuqmuQ9I5Hy36XWYYRkmTEdHJcqWh1+5
         fH+3SAGuhOvWkRq19Z/jLyUemr1Bm0bftYyYfSfVcuvhPxVgdkJxVJNUZbYX5L+D3aTE
         nDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354190; x=1722958990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZs3J/cTXLWFL7SSFr9tAI/IXhUTrybV87IR2TNiVLQ=;
        b=qqfGeRH4gdf139f72aMCx8QLJd/qKd5EwgZhWUvQPbWMksgykcZS+l/4t8Fyi86Z7B
         MeQb/I7L8BUtayk2gtXiX2F08Qfru28c9mHfLKVD/AINBe8R/HEKe1MQi0iL/qc6P4jg
         3fpmf0t/gwIil5JDjuQet7o+h9ZujYkwZLIpC2VEGgyquA6iz93c/nUR8U3Gwa/ln6D5
         /LGCRicArMvtGF8m6bF6tnha8eMgE80krl5Cce8VmeN51qzAI8v9XCNcd8T7oLpthfmZ
         kBOFQ1UgwIoLl2lpQDc3iRLf94bdMIyFGB+VRqv7OpKcWY4DaS2xO+wo40Lityzfo2b+
         FiDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgCjL/UCH5xszgpan21wJ6xGbv7L4+MQpGz0CZF/V2W/plvu+kVw5lozRT3/9tq2RLNw7u/Cj8hi3AWJaiT5242ltS6e7wyBTmArQ=
X-Gm-Message-State: AOJu0Yz8TbUhTVZ0aR9qV56nJxGoiYMZGxdGSzHeqVVOjXwEQkH+KpUr
	yWV+UhGDIMLOD5nojlowGRITkvkOFZmBHWtcyKUal3kc2it+xl7LUAdPnsNl8cw=
X-Google-Smtp-Source: AGHT+IHyIFq/MJPHYNYxljNwR5PEhaFOsCTOZ+ANviYaWzIHF0QHtuX7rhJ3Yvr1fkY/b9wA7vbcGQ==
X-Received: by 2002:a05:6870:330b:b0:258:3455:4b02 with SMTP id 586e51a60fabf-267d4f3b2c0mr12329491fac.51.1722354190145;
        Tue, 30 Jul 2024 08:43:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2657723ada8sm2269453fac.57.2024.07.30.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:43:09 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:43:08 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kartik Kulkarni <kartik.koolks@gmail.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com
Subject: Re: [PATCH] staging: atomisp: bnr: fix trailing statement
Message-ID: <582189dd-48ee-4ca5-87ca-dd640b09f18b@suswa.mountain>
References: <20240730123842.37487-1-kartik.koolks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730123842.37487-1-kartik.koolks@gmail.com>

On Tue, Jul 30, 2024 at 12:38:42PM +0000, Kartik Kulkarni wrote:
> Fix checkpatch error trailing statements should be on next line in
> ia_css_bnr.host.c:48.
> ---
> Newbie to contributing to kernel code
> ---
> 
> Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>

This signed off by line needs to go above the --- line.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter


