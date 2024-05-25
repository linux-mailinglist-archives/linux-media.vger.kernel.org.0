Return-Path: <linux-media+bounces-11868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAC58CEE6C
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 12:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3431D1F21709
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 10:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA2F22EF3;
	Sat, 25 May 2024 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaVXwYJA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B610A12B83;
	Sat, 25 May 2024 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716631775; cv=none; b=SAJaMxiceQhTszAO03qWF1inEZISQwICWngaf+5H7brEQTj0QiL2moiKednsM/+8dfHxfvaosyPD0Y8TCgE4eXpNTdacs80s/xiwg9S+/tDsXYk1xdajcDCVE4QkYjQ0TxBYamRL+GRsG+NW22AOZNGVtdDMAPnUTUvDhd0Kmik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716631775; c=relaxed/simple;
	bh=zqs9j1k6kqJzwv0KHEg2mNpznZuyVMBE5Z4GeV8kxlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAOWY91cclAtW00nZbClKyl+zP44k/rK8d00+HubnvFg5tSq8lPya31O3fWu6MmCRW4wHiwIUn8jaw9BiiajfANTF/Jbn52dnFUzetYo5bthu8xTqkMRXHBk7vZrhWD3o319OQZPL88kdWfQfv4rTFe0o58E5KwVZwGzkrukO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaVXwYJA; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e9684e0288so3542961fa.1;
        Sat, 25 May 2024 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716631772; x=1717236572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vUOaV2vBXxdf5jUTsdTYD9aM/Pj+H+s6kkpg7loxZLQ=;
        b=VaVXwYJA/saHWLQY4cCzcvu6GckgKsT/hEeWlZKn13TuS0AyZKEqn5ZUrDaAMoGG25
         TMD3eye7XNkFENGQQI2Nob3YsujcZ92pVvQhP3JzaQYreaugVv6OATz58mI/pzw23owu
         gsvpjaCmPjDdiGpkZA9DeO9MzAdueJfvdW0kOPgCob5cHW1ghZqw3K/+p8kpKF4qsckL
         eUoNUajGq5jDYlH+cnCdwnU3AAs6PcclxegWOTsfOBt0MKB+pgNybMraCkQt2hzsTWNZ
         PIWUc8D6IXCRwfmfgzaFBToavnVuqmV2nqZbZeIouTKi48w4RXdBrsLmK77tV3mSBPUp
         GcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716631772; x=1717236572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUOaV2vBXxdf5jUTsdTYD9aM/Pj+H+s6kkpg7loxZLQ=;
        b=jqLaIrdKeSA0K2ygjVcXGzZRLyukeD71tiFtQsX+0VNgyqJ6uyVhNjQKyUmPSqwNeK
         nnuRPtP0zoYI27KaKvsc/IyECcRDm69wFV+euDgBvceq3JzoH6Rc58IcErnQ52fbe0Nu
         btlr5Nxv6IwlS0h9NS9uJ/oul/WfpVtNaaoYuzz+rKE/OKu7AiwdBytVVb/GY2NNyu9K
         T+Y9Mv28IeneW2r4irxc+hDAqbn5D5oKxgPsf77VQrXuMjH3L2EOh16z6xD+fZl9m5O5
         lelsboVKIhsTNE6zwhf+QM1enGN3KAg9SE5sFiUzMWS2chBTd1eTJDUWNcETO+scxORa
         //3w==
X-Forwarded-Encrypted: i=1; AJvYcCWvpKz7OS5qDWp0wJe8l3yyuhWUomSBGPUIfDoNGQjt5QrqB9itfONl+vzrYr8qR/GxbNVbnnzPmwE8Fx7jJfg9fN9GuUsm8ujGhDTOS8omNLs2ABDAlfdFTJNCU+tVyEF/Ymflz+Ufm7M=
X-Gm-Message-State: AOJu0Yx3u9GgsNWYYiOcAxPqZ6IL/I4WYh1jd4g6us7J83lRdpspuyuO
	VdFQD6d6ZLWg/n9JeA2mhclge7sr4SS9ThNo3yGQ2rLX22jzlDxn
X-Google-Smtp-Source: AGHT+IG+k8/71TBeBI0HoC6uDq4/3ivYRjrw4KYOJgHOeToBArl1Mc8j2V/y5kh1U2aMwlN3x7+k9g==
X-Received: by 2002:a2e:9996:0:b0:2e9:555f:54e with SMTP id 38308e7fff4ca-2e95b0977d4mr45005141fa.18.1716631771547;
        Sat, 25 May 2024 03:09:31 -0700 (PDT)
Received: from localhost.localdomain ([178.70.43.28])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bb87429sm6506561fa.0.2024.05.25.03.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 03:09:31 -0700 (PDT)
Date: Sat, 25 May 2024 13:09:29 +0300
From: Ivan Bornyakov <brnkv.i1@gmail.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Wave515 decoder IP support
Message-ID: <pnwbwczlzpofdrrizep5i3la3hxpk3hn6a4sb2aeaac57kldgp@mgqf2mau5hqr>
References: <20240415100726.19911-1-brnkv.i1@gmail.com>
 <mwgydgjstvedkatdvopt3wh4imhnzflr7ut3vejgl6fz3vbgzg@x4spldwklrm3>
 <20240503150721.qd6d7csev5452rss@basti-XPS-13-9310>
 <bliiovkmzwkd5ikvvhvuokiacdclinb5rx4fxbtufwqnvqypgw@uygv56l7a45c>
 <20240524101950.zhzenp3ilarwv5oc@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524101950.zhzenp3ilarwv5oc@basti-XPS-13-9310>

On Fri, May 24, 2024 at 12:19:50PM GMT, Sebastian Fricke wrote:
> Hey Ivan,
> 
> On 24.05.2024 12:09, Ivan Bornyakov wrote:
> > Greetings,
> > 
> > On Fri, May 03, 2024 at 05:07:21PM GMT, Sebastian Fricke wrote:
> > > Hey Ivan,
> > > 
> > > On 02.05.2024 09:40, Ivan Bornyakov wrote:
> > > >
> > > > Friendly ping.
> > > 
> > > Sorry again for the delay, I was nearly finished with the patch set last
> > > week but the time wasn't sufficient. And I sadly have to delay it again
> > > a bit as I am on vacation until 13.05. I expect finishing it probably
> > > until 17.05.
> > > 
> > > Regards,
> > > Sebastian
> > 
> > Do you still intend to review the patch series?
> 
> Yes, sadly maintainer work isn't the highest priority work at my job
> however.
> 
> > 
> > Also should I resend? Is there anything I can do to budge the process?
> 
> Nope no action required from your side, just my busy schedule that keeps
> me from doing the work. If you want to you can help me get through my
> shelf quicker however by for example reviewing:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=12848
> 
> Regards,
> Sebastian

Understood. I'll have a look.

