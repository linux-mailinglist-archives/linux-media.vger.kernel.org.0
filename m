Return-Path: <linux-media+bounces-44023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A8BC6B14
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 23:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 31F394EE312
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 21:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA892C0F91;
	Wed,  8 Oct 2025 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="qIy6MKyz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0711EB5FD
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759959157; cv=none; b=HSQDjMXJm2DDlZ4foUU/1NOMrUSTQYJuwAlpAoiW6zHhsSuX1NGOLnTkpHdVuov/hAO8omzFxd4IXIF1W5Gu6wTH2EmT+0rDAFCERMyCy4vCinQuHE9fszFJ6ZFCnSYBJyv+uVSnNUvy1V9OfjLqukgRgiQoRHZyQDxohTHt8vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759959157; c=relaxed/simple;
	bh=e70Bs/O5EAKRWcYxVR2GwoG02d0actk1OQmwEew1rKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cbfuy/Z+v1Hk/fegYEiN6oNFuICs49GVoL5H8kFOgZb4c5OqHDR2m2rJZkfuCayia3oqJFi4OoWEOXpi0mJhoYHbj6asjeKXD19Ig1KcwlPTXsKVeeec9I5AbadtNNIR37TEy2fc1uX6xsVabQhMFeCZbpEgjo0NCQdwFC/A+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=qIy6MKyz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee1381b835so321535f8f.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 14:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1759959154; x=1760563954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iib8S/atLqN/Z8rYxef/QQXPaAWrsYEKhr0SHcC79yE=;
        b=qIy6MKyz0EoO17TBcV9sZV6hPnbhQ4N1RCTtb7loFX72MQeoSJspWQe3obPVzjLXpS
         5Jo+8+agFK++Q59Dvt+vEHJm6u0sc4q/osxm6qLoaO3z19fRBYkW06SJStEw9CmCgOOz
         W2IOf+CJMr+6Ljk7AHtOEKLGl7lGe3xC/fOqqskFmABpox3/dC8cF1yYueXg22pcIraA
         NIriJA7jXCyfCAQpk9gBFgzwtaLr6ddt758Q0nOx3JoT6eTl00sqkP3OlIk72L/iO9+k
         BCrKaAby6hTGeakxMlvGQ6IZ3SB9W77l/boJr9k8rErm94tpwHvH/Uqt7zf4A5RVMdkB
         2ZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759959154; x=1760563954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iib8S/atLqN/Z8rYxef/QQXPaAWrsYEKhr0SHcC79yE=;
        b=cokMt9vgw8imjoru4ZzXTlHcNzJpZRuTnJapcrC6fhCfq/f/m4kt8GjG7Qjh1XQmiL
         HE5d38oJ94zeJVrELuewhqZhm5nEBMAJ3M/RbhimsawlIpgB5YAqLhpI2cOZ1QpD2gjY
         zLjvXfezuF7pHqotG3peNcMgBhxIzaDvCt7/IF4P+y++OfgyHJ2ZrNz/CE9qa0gZvwaq
         O3YEnD8k4j014pMC/b74RHloDBVecDXigWHEY2LF5WKUiM2MUpCOPgEeOSFZsha8ppFF
         HTlN4YfoDuaQxVoDqDJJdDsi125AlXWsLQ7fmoBrBlbhT6kcKQgnDZWsHu55s9VrRjpP
         fmhg==
X-Forwarded-Encrypted: i=1; AJvYcCUSE/W+k8tDsSOjTr9YWDwrda/v+eGOzobyketqSZe521VCBD2rlNztagTK3ttOJEaiUPs7ykB6g+rMdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXWcokd0rVxvGwt4kvg1gK8bLNOdld6fSWZL/SLDyT5yTXSLi2
	iJh+s41KsrZ+B0PyNHqxIjAYzK3/Psnrn2hB/BfFWVbjjs4fF5MgKoSxhIOEeTY2DQ0=
X-Gm-Gg: ASbGncvxgVSKKSmOPZlsBUUsb+S29loMnwbMl3xvvrSgZT2wXoAlaYaEaRLCAk9dPth
	y71s2utPpySjWCJdejK6ieutIyGs8/khwOZhiOHSAIvzTy2u4/j7dQhVobIEIqdEYH5/YmR9MXf
	yrnsMTvIXMCLIgaccR7BVJlTBitji4l19odits1+O9/Y+mwvjNaaOue2SfEmKXx5uxuEFSYsU+n
	ZjEmj+r4zw0Kfqg6eVn8sMt1M37e8CQM8s3z928Jrd5R/JLGV1ENTGeTN95YDaBoGJFfmR+t1zx
	3vVXeg5oAYDiUuDsaU8Xv24kLAS3Zp1766nKWxzxTn6+20XV967D9zgNg0lXuMHtmHqlBfQ5eCx
	Cm7p3CnxbvptJYdxGgT3IOhR3JewvzVRA/BYsV6BdHXv5AgFDt3WBjVTpqSs5nApt
X-Google-Smtp-Source: AGHT+IEHIfW75N5y0R98OUlepL6okEPOBq4l5OxuL7bDpbGtJWWxEFFZctsR4HRbkhMXOYHJWxXZrg==
X-Received: by 2002:a05:6000:2305:b0:3e9:b7a5:5dc9 with SMTP id ffacd0b85a97d-4266e7d6bb2mr3037022f8f.23.1759959154071;
        Wed, 08 Oct 2025 14:32:34 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:b672:801:34e2:2e5f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f0170sm32585881f8f.49.2025.10.08.14.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 14:32:33 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: conor@kernel.org
Cc: asmirnou@pinefeat.co.uk,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Wed,  8 Oct 2025 22:32:33 +0100
Message-Id: <20251008213233.8541-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008-pushiness-underwent-a1f0450a933f@spud>
References: <20251008-pushiness-underwent-a1f0450a933f@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 7 Oct 2025 21:47:29 +0100, Conor Dooley wrote:

> On Wed, Oct 08, 2025 at 06:50:36PM +0100, Aliaksandr Smirnou wrote:
> > On Tue, 7 Oct 2025 21:47:29 +0100, Conor Dooley wrote:
> > 
> > > I acked v5, any reason for not applying it?
> > > https://lore.kernel.org/all/20251007-geologic-epidemic-2f667f232cf6@spud/#t
> > 
> > Yes, the dt-bindings patch can be applied.
> > The v6 series does not change anything in the dt-bindings patch - only
> > another patch in the series was updated, so v6 was sent.
> > 
> > Apologies - I wasn't aware that an acked patch could be omitted from
> > the new revision.
> 
> No no, it's not that it should have been omitted - it's that you should
> have applied my ack on v5 when submitting your v6. I guess timing worked
> against you because I sent it like 20 mins before you sent v6.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for clarifying. I'll make sure to include your Acked-by tag in the
next version.

