Return-Path: <linux-media+bounces-18688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CEE988244
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 515551F22C4D
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012B01BC9FE;
	Fri, 27 Sep 2024 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GKLLTdnN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745A185B7C
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431850; cv=none; b=bFur4FenmMb934/bGxl55AZlviH/HL0fp8qpNnM30kNi3Eu0vSFTbvxGGPGvSp5TBSC3Z5SSPO4SNpVuTHmmxZSDU8akN9X8TbK1x7cbfkdbpHFEUnt1MsVkP9CHF94vSkp/xpBy3l/xYqirGK0a68kDRUh/Eehwz9IG72NrN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431850; c=relaxed/simple;
	bh=82V/weC2dG7OB/opVXdY0JQstq8r5ZG2HazKjLEYZz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKNGezzjzzyft9WmDDlB6aUXbZTTmdPjLwAps6hvCvR7gzSy1GNcOuPPAvrgM29vbxpDameBbluHuQR/+IeZtuG+UUYDVbB6uyYQ6NIgIAitOxVayAep0j5PG2FxC0/zyrp7Xziu+i+xz9+9ikhpwFmaQJSGXZZRAksWSDq9e+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GKLLTdnN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so12338645e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727431847; x=1728036647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qihw7+w8108Risk6Cj7+yuN4HLwBR7iDJgyzm7bJIQ0=;
        b=GKLLTdnNJ/lS5jKg/L+X9kc3oRFXZfcrkFacZOgb3KMP/urqoPQbAvM15Wp9vvTpry
         jeyV5Q+fMknXdDuGJpgGbtugQE1y+QjD91f568RFRw86TSkJ1gCZshhHA+kPiJu7sBJ6
         FvsTuki3mwW6GRs0PcPFebv664yFuZqmgNdzRIO+cnbmEo7PMzZ5Bm3En5nuQmx6ikEC
         1hePNpSoUjxYEMpPd/ztzD7VGb5FLkmiN+ezS91pjLPjK1XlUXpb1a0a2lzh/kEIqlhe
         ojcMC7qLiWkVcWfsaFSUVeAlsTnYk0gSouCNuaMWtWANnwHnAmx9r0rvKc2YAMJRRvoy
         Ckcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431847; x=1728036647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qihw7+w8108Risk6Cj7+yuN4HLwBR7iDJgyzm7bJIQ0=;
        b=o7gOlo67OxA+nqKINV8Qdpp5XoJQyeY9ZFaYJCt9GAbNTZnIYRPc/hw2ANyJ1vYjrk
         oNTfjNAtqVJx443vy+BexwMDsrlj7b2NQTR8SzFpBsJpHHKCa6GT8WjkjC2Paa6rnGTh
         2bCr9/b+ovV88sfOKpwkJtELbnyrcXMtUgWTGyryByutNgARTfFl71M2ZYyUhUcsP0RH
         8IJ9+6LIpXK3YFK01nU5D2NeOCt7cy47aOp4gXxnO3BRv+LHI8sJZhv9EXQwuRp1OcVw
         0jxPZAZqwNQ3z/X3fjaCLLdtQKcDywTYyLofGdAuyFY3y9w+Xtw2vFhL8hAPbrlNJaDf
         WCJg==
X-Forwarded-Encrypted: i=1; AJvYcCXfMuKg+bQ8JG5nq6S2CDVm6JTy4+xCX10YRZDD2+TvUK5sbN1Xplao+pgDN7nLuHfL998Ado+x/uv6lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUh7NoSkz3LdeQO7NPKs9Baam6qxP0HLsfrinWCsjDTtBEx2t
	aUrL76lfzOoatLrpdub8Iyl56hOzM1Rt7oa175dyBzC5cAZHF7IVzh5A23GrVnA=
X-Google-Smtp-Source: AGHT+IHcgcyQYD74PprfDGjdFD8bGNs61lZ/QrBpu1J/emsL5e6sSlWoWQavNAXIDSV+FDiS4Uirog==
X-Received: by 2002:a05:600c:3550:b0:42c:b7ae:4c97 with SMTP id 5b1f17b1804b1-42f52200f17mr36164135e9.11.1727431847307;
        Fri, 27 Sep 2024 03:10:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e13a28sm21924985e9.29.2024.09.27.03.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:10:46 -0700 (PDT)
Date: Fri, 27 Sep 2024 13:10:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/3] media: atomisp: Use max() macros
Message-ID: <aad1bee3-594a-40db-b81e-f7917ab1a408@stanley.mountain>
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
 <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>

The commit message doesn't make sense.  Please, wait for a day before resending
patches.  There is no rush.

regards,
dan carpenter


