Return-Path: <linux-media+bounces-16391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F477954AC3
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 15:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 448D01C23BB8
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 13:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40131B8EBB;
	Fri, 16 Aug 2024 13:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0CsYM8n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942201B86F4
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 13:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813752; cv=none; b=UjMLdV4bzUNwHlDayrZ7TW7YqPCVE7DWZX3Yf+3sUzJkbF8SG+oYkL085APDJzwPM34feYH08gru4mxQpR2d7fl0Yi2sa6u9PUPtcVqxvHx4pVjraZ/qc8pum4YIaNNaXcU1VAmim+lRQkCt1NHhaLzSMg0AVIX2g3LHr49tqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813752; c=relaxed/simple;
	bh=hV61UEsZvxQXAH//23EBTg5Dfv0U9kPjQojStjFfjbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwDtrYh1vDKY7ZzqcVN21elSch6t7TLHoj2550ZwP9oOemzRvns+1Lm2ssU8sbneRSpGh1yUCirQqSDYIKnxLq+q/bsV+1Ddk6OGnc8AvijmuA9oXGt7pE14T8uFfcnUl0TKdar/0UR5ksJRIe/cinexZ7+elB2+PGwEx/PVyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m0CsYM8n; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso19860835e9.3
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723813749; x=1724418549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I57ivJzE0S7Jyj+4EZvgDuynmnlEVJTzFHiR3Sj8E/Y=;
        b=m0CsYM8n+xy8sQdVxy0PxK0vVJTXaBZqOPx+SCC1vvNAeI0fKjsh4hLgO6P+THne42
         iKQQNNZWY/7Z+tvYnR/y0LQw++pxObbcXgHQGN8ILjtEFc6PyahUudcGEglYSUJyyjv6
         zRyXLBCAQXdfSZJ8pMUcsZFKOy9cQD1W6tRrxSncDnV3vFJtcEubdi6PizI+53JpwdJK
         i2fw6xjPsKpP17NVxGU9ve0kyONZt8HDItUDjLqDb2CziEST9EsuqNVqou8vC4ozc1vu
         vRxd9XxzSMVDWk1epoyF7DL6j8dvNUqxINe5NDAsKnH8gQlQRWIKCx14pClnZCyoJtJQ
         1AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723813749; x=1724418549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I57ivJzE0S7Jyj+4EZvgDuynmnlEVJTzFHiR3Sj8E/Y=;
        b=CNdmJL4+XX+od1AX0fprzLqa/B8vA+jYSebAGgDafZbLGK10NOL3z2B8P4SOsIjjOz
         8D+dlbed454KBcPiU5Z4hKOb8aezmQnMRcYlHArKFHLLWoLATDeHwO2XifYAskCWPaNX
         tTH+LL/4lJdUIViThajCwYKrtPFerLW8fZ8tAkKiGfHNC1oUSfg68feXf/7AmKlWZmTm
         Oy87zYAyp5E39ZG4jHEWsaciDqiS6dlsmEkNBLw/o/zQHwQlp0blB/DxIpzJKXK5Afvp
         B2ceDtti1Y/uVG3ePnK2FXooHsnbnFsAp6Oc3uE8eK75g7WnMHBxKPV1bQSKcdm7+0nU
         /2Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXT1uSu7HLTNINmwO+PQq5VjY7JgzQI7OLb8RKDw4lJ7EQhSvZGPFvKU8eI6bb5niE684GbBiAn0nixEZwJHs37x0sWhVm+f0+IFl8=
X-Gm-Message-State: AOJu0Yzrt1VVI6lXQJ64wYs/4wl5cRo6b8gXxeMG3TiCqFOebFzkvjBx
	oKQTYNfNnc36meW4LCWhq2pmjJ/5KnGPTDK3oq5zllZr0TnRD7FU9pBJEs9zm1U=
X-Google-Smtp-Source: AGHT+IGnx6kas1tzOJHAhP+U85MHgXfoWOwHa4tNkKg9SyOtPuPTLGnQgFkIbtCooFiXuJnYxwkOOg==
X-Received: by 2002:a05:600c:3ca4:b0:429:c674:d9de with SMTP id 5b1f17b1804b1-429ed78411cmr22492805e9.2.1723813748808;
        Fri, 16 Aug 2024 06:09:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed648e76sm22683515e9.2.2024.08.16.06.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 06:09:07 -0700 (PDT)
Date: Fri, 16 Aug 2024 16:09:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [v2] staging: media: starfive: Add the dynamic resolution support
Message-ID: <90939451-4e26-4aec-bf69-d078d88fb5c2@stanley.mountain>
References: <20240816125132.514488-1-changhuang.liang@starfivetech.com>
 <0680445d-1108-4400-b150-4804da63ddba@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0680445d-1108-4400-b150-4804da63ddba@stanley.mountain>

On Fri, Aug 16, 2024 at 04:04:38PM +0300, Dan Carpenter wrote:
> On Fri, Aug 16, 2024 at 05:51:32AM -0700, Changhuang Liang wrote:
> > Add the dynamic resolution support for video "capture_raw" device.
> > 
> 
> What does this change look like from a use perspective if a user is reading the
> git log?
> 
> > Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture driver")
> > 
> 
> This looks like a new feature and not a bugfix.  Please describe the bug more
> clearly if it's really a bugfix.
> 

Actually the first version of the commit had a good description.  Just go back
to that.

> Add multiple resolution support for video "capture_raw" device. Otherwise
> it will capture the wrong image data if the width is not 1920.

Btw:
1) Don't put a blank line after the Fixes tag.
2) Put a note under the --- cut off line that says what changed.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Please send v3.

regards,
dan carpenter


