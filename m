Return-Path: <linux-media+bounces-18993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20F98D3F1
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 15:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F53328300F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 13:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261A91D0403;
	Wed,  2 Oct 2024 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6tgtJ3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014BF1CFEB9
	for <linux-media@vger.kernel.org>; Wed,  2 Oct 2024 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874155; cv=none; b=UjBkCCzlxYqpwamkHXLW5inTeMwgc5tPrZCzpGnVnobbpPBh1aIZHX7hdAajJCpfFrjRvrlAlWqGg6ICCn5jTeqZLDxqWk5pPfgAovXINE6Cgm1uFHzxtADYYDb3qH0KnCCDkbtmsB1zVPRptJWZn0o6i/useQUiQdTK9o/EuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874155; c=relaxed/simple;
	bh=SaGx1GdhB/+cQFThb4TF9eDAGIdoFqYrG1PO8YaBRBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raDPsGcfuzUOSLin94OTwC5WYgKQ5csDPd6CkZ/SDrOW15K0hTZ2cv4+RLp65Co7d4bgrpo6VjX8/Xjp5JwIedifGnPU3B5uUte3OcsUGYXSVUhVbWlTb9IAw+QMF4piLbMisxk5olPq2KNA2KVhwFhzyN+jFZCGo5lbgkEbQ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6tgtJ3Z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso5388305e9.0
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2024 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727874151; x=1728478951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRdEMpb3P4AfeWlV/F/t1Wfo5VDpiOTTekBJOd+V3gc=;
        b=B6tgtJ3ZMBuLA1KoPqL1Pd7SszlkPbltBPZ4A8RTuqzG49WqpaN8LHqZwFNLbTbDk7
         bx2PK9F3Jj8b+3lwhEXLaqoaq1VVcIczjHT+j2ncvvMG9L9DNH+DVIYf3ocbjB9w2k+d
         HAqH9ykK6Ma2dnaR7dmUf9pdevb9vz0ELcgQSc5JJGkK8wj86YWtse89FD3Y5ODevaqv
         XUP+x9Wb6T1zZFKbkQ1tpJiiLc7rK2NEgZz8J711Ct/j3exEX5CjD9BIXAIGZmW5vpKM
         3+beUxaxPZ4dhCMObJE7c6TL1X6pNUetoZfaTCF758JwI4tm63XvP9+wc6MQN5g40cgg
         R/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874151; x=1728478951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRdEMpb3P4AfeWlV/F/t1Wfo5VDpiOTTekBJOd+V3gc=;
        b=TOJQFdxmmVyoBsZoKDu0HaK+sC5BSKeMVLHP82v6V7yWyx+f0/CtvPwPriLx2xedut
         tiwDBmKyDEyNbxBNVMxto1VvLAC5j2gP5tXmZ3g8tXFAdi2xr8EWxOlEZrlR4ZICg68V
         o1VuBQUvGrL5eoLOEJHxvu7PPip5TUtpa2FJBU8L55OeMGyeuGr4Fvez3Cm21EAjEedS
         bY5KhmLfnr4wKg4+KEjfJXvbWeLsExVLxRT1sTijdppixwL5q74wXDPjSkzZNQtSVHyG
         eumO02qnRCeNRTgOiyJ4BCozYhF5XVnMp+ZNocI+qn6kKOAC6lCFTvSoiC/EiEIRPEga
         WITg==
X-Gm-Message-State: AOJu0YxYytQE0yVT+Gbn4gmRMLGiAAmgIIfE66DSRUi6HZ14DctUTh5t
	uiah5rPfGRlTdh858SXLp5MYaarfKKmlu+HAV0Xhb+eDzMQWyGS/MbtprVhWDXaRT+qqdXNZx2t
	W
X-Google-Smtp-Source: AGHT+IGISZ8UcZWKdTj4ER9q1eUecjB1xz1bXx+pdmXID3SSnIj5uWSuHrzdnFb5v9gFQnoyAqIenA==
X-Received: by 2002:a05:600c:512a:b0:42c:b332:1619 with SMTP id 5b1f17b1804b1-42f71306febmr40360025e9.2.1727874151209;
        Wed, 02 Oct 2024 06:02:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79d8d1fasm18291635e9.10.2024.10.02.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:02:28 -0700 (PDT)
Date: Wed, 2 Oct 2024 16:02:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hridesh MG <hridesh699@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] staging: media: fix spelling mistakes
Message-ID: <bfc3e170-7949-4f92-b434-8cf5d08f6e58@stanley.mountain>
References: <20241002101106.56658-1-hridesh699@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002101106.56658-1-hridesh699@gmail.com>

On Wed, Oct 02, 2024 at 03:41:04PM +0530, Hridesh MG wrote:
> fix two minor spelling/grammar issues
> 
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---
> Fixes:
> 	chunck -> chunk
> 	procotol -> protocol

The other thing which changed it "follow -> following".  Put this information in
the commit message instead of the meta notes.  Probably avoid Using "Fixes:"
like that because it's not an English sentence and it looks like a Fixes: tag.

Fix three minor spelling/grammar issues:
	chunck -> chunk
	follow -> following
	procotol -> protocol

regards,
dan carpenter


