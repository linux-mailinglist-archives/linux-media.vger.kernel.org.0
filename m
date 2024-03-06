Return-Path: <linux-media+bounces-6586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A44D78738FF
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 15:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F7B9284AD7
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 14:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999D9132C19;
	Wed,  6 Mar 2024 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVdAFXFT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6993F130E40
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735191; cv=none; b=RMjFa2iKkMqFL3tR9PsYX4kfg6CvdZuYdUyIaTqo4op2hT8OKBn8+VoQPXLwjDXGE6OgsyHdJGVU3LtA3UjmXFmjC5HTaYHFqzy/4UNagXeqYYrV+JqLtbFOQ8O5iXAc6tMu9MtugUDU/hgEGRGxiYezwMkE6RjIMuI17TMbNgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735191; c=relaxed/simple;
	bh=NFU1mATLRRBJqrorShDtM8d86bmqV3E0R8MdZOK7Xig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YARLcFW2v1m3H756kuPr6OPsHkuOLVeDKu8aJFHwNDuUdhZ3KJk/DWM/DiR53pKf0Fx4G3Ae1SEBvRIfcfhKDx5+XXOy9AxvY96NccCFJio1Mu4cCW4DBB7SAo7NcNrWNv5epTCnhaChuTJt0SlKwnGnd7SdxY3CER63Hub82Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVdAFXFT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-412f1ccf8d8so8585515e9.1
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735188; x=1710339988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sz597cPsAWEUKOTFznKZhGZK0K5yCCqY1F6ggOkfftM=;
        b=XVdAFXFTk0hi1ebzbQik5YAG9vsRXoyTswNA4gSAOJY3y50tcp0MQ8DuIV5KI/2kL9
         dABKbR9NFrz3KRDEa4K0fjP1EnRoa8aW8MTAjeZLjUUHcOeYLamD87kk1Gt+ffNTwaZk
         NdLsHp5tZq78GJMOdCifLg+iA75udKVBjemtA47OTVxmSa6q580TMX2Z0Bj+uxnMUavO
         PMI0k3W5L9bIjieAHgN3nH2wV3/mqrE4ntjADOb5PnZjqB+uwpU+SSUfSnrn6K0upPP2
         XQkSghYEZy3SYJhRJIK8W+BcecmY67xNS54kyHr162qi/7cT6WtTU1MClkhpZMX9cLjP
         MSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735188; x=1710339988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz597cPsAWEUKOTFznKZhGZK0K5yCCqY1F6ggOkfftM=;
        b=WkYOGrVJSZAmvCOCOdPinQ4fhzuoN4QoH/wNmcAeJBJOoTT17wLD4JjevBxANzBhzO
         tlwKXJR+KQ21GwKMMyBGfl9ftlzC0TtJl7oaGzC7gUUJ6gB66cFBx135MDxWBaQG8bqt
         QOEKkgUNBRECPmL7k8+p7yKENfe8QEa/A7mg8VxRbtAlHlsqlsvsWSzSWP37FS1rsJjE
         g5ovYyW7ETeGeHS26yWs7+PVMHn/RYJVRSy0ZE/FF2XwjIeIacuOAmvtdysEeBcqH3V3
         RDaPmKoOxjzBcmeX4qtD0gIfYiuDkgIbEzluDKlOd+Gl+BFCezduxVKiEpkL3wKTqGUz
         Br7w==
X-Forwarded-Encrypted: i=1; AJvYcCXrj+yRAEGiUepNoMshofTgwPZIJz72wjgcybWLpZ4eYha8rJAejZRm8DE4Oy7Hl/b4CrpM99eZa1FlFZZNt3g80puRrUZeDDoH3lM=
X-Gm-Message-State: AOJu0Ywds2c0L5pUag30v3MGa6+lWupUYbnmbUwtARo774rOobblwP4r
	guoEVk9lbGQUdOQUkjbGbIfJRs8U5KR797bvWWMF8YOclMfUfgWBg3BsWeKnozA=
X-Google-Smtp-Source: AGHT+IF0YddF+g3tLcQDMU53CKKJm1hZPkdzoF7aB0gEjJiiRFsHLJHMcGngoj6lxG/F3l6jAhGIYw==
X-Received: by 2002:adf:fc8e:0:b0:33d:284a:401 with SMTP id g14-20020adffc8e000000b0033d284a0401mr11678384wrr.68.1709735187795;
        Wed, 06 Mar 2024 06:26:27 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n6-20020a056000170600b0033e45930f35sm6077958wrc.6.2024.03.06.06.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 06:26:27 -0800 (PST)
Date: Wed, 6 Mar 2024 17:26:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 6/7] staging: media: starfive: Add raw output stride
 configure
Message-ID: <9f346733-320d-4a7c-95d8-1eb2e5cec22e@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-7-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306093334.9321-7-changhuang.liang@starfivetech.com>

On Wed, Mar 06, 2024 at 01:33:33AM -0800, Changhuang Liang wrote:
> Add raw output stride to enable sent the aligned raw data to memory.
> 

Subject: staging: media: starfive: Fix raw output stride configuration

I think this is bugfix?  What is the impact of this change to the user?

But I can't really understand the commit message and it's hard to review
the code without being able to apply it.  I'm also new to this subsystem
so maybe someone else would have been able to understand it better...
Sorry...

regards,
dan carpenter


