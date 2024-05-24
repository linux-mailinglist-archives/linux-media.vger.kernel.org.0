Return-Path: <linux-media+bounces-11844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B50B78CE30E
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 11:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C22D1F2230D
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 09:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E36112A17B;
	Fri, 24 May 2024 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhlYZXjb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65145127E2A;
	Fri, 24 May 2024 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716541798; cv=none; b=QYDTeo0Hi9gvDbvTPlgMZGwzS/+vno9DPOOJJsBd7rPjGI5QzNAA0Unup0dJLNc4XA8ufCASkYlUEad5DsCc/EqyaWoKSbzVbi79AVXcOq+szweBjZgLoauaeeeierNwi1pETaCbaxTD+sF13+23qgQVw/6fNQrPVdeh8a8GbK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716541798; c=relaxed/simple;
	bh=lstC1JoXk86c4nUHzL+unxjK1j4sQb/y8G2ueEGHWcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFL24QBV+mvq8fTHf6gWYDgyw3O116zUUIYNDHYl3HrjScSAE1+1qKOS5xqbrt/Eiz078ebtmMEXYnX4iBoL4eQPrSDCYqODbrwGFMEjc5bWOHmEgmKQSr/j2mDXQ3QYGq+X3Mx7Sl54a91W39hc2JTfGwPsl7b8KdFsMjcqA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhlYZXjb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5296935252dso572397e87.3;
        Fri, 24 May 2024 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716541794; x=1717146594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGJpJecwhnnThbUhyaw0vAGodYew/vpNpLv3LOUBtPs=;
        b=AhlYZXjbVafUwiqymT5t6WVyrSQkzMilgQnGpfrjDsntOcwXAowct/qvUhP2CpCkBD
         B04plfRqR1D1B4ON2x/32uX/BulMX6ZpXNw5N3JqcE7wjAuu8GD0iIU+P3wuwYcQlQND
         k9WWhLrBo1MnsbhNcQoIpvzXiX9ldtcB39lzXNWmrKqQvZGb83ACjv74N1SiT+342D+A
         Qojanlrc7ayB/Xmhp3Obljbxi4SQIFa7GcTKuHFF6fwSWC60dsmypPNdXjrZ1sdYWUgi
         F9LSq0ulEmGRE9hNp/UThryxr6XflJEXreK6DEo93Ol8a2iGQJjWnGB714ehvUm41kXv
         IheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716541794; x=1717146594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGJpJecwhnnThbUhyaw0vAGodYew/vpNpLv3LOUBtPs=;
        b=TDk/fr9SB1D/vvSYVAtroVFP9+/jP8XJhjfsxfkcQS5MwjMamVdLfFuImol1TR0Q6y
         wekj/zpZek9FbXYhSFyKNMAwVkwIN7Tha9+PPseft4D2/qJvPCLz0lXIp+fcb6nC8j8e
         8ok36dn0Gqpajzloc4/YqOfb91TL8ZzIc5HNhB4Bqh30acZlCiyMrjFP3uYTd4ojAOr2
         o09cdR68Yg9LewI5YKWO2IVeuHUUaeM0f8jaL6U2yOl4+3DdFDdy/Tix8ppYwGGBVLt1
         izThqHzZLP5k3h0u4RRLcz52Mdg4J5gdKF7F8iP4BljgOSMJl3nnmAcpyUmX8PSXx4GZ
         sfqA==
X-Forwarded-Encrypted: i=1; AJvYcCUVGA6ROQ72IMxkWBso1jNZlHhtSYENS9SMw9etymlZZNrbH3vGDbcgbgXvT+QxRBQk2h7czWsuaNV6DSXBnpzsz7MpbxFwheSqbn5Qi1ZgZt3hq7ozpOjYdcNGM1BoxwrgiUNSsVNWQow=
X-Gm-Message-State: AOJu0YxhzJ2U61Z5MHb3TwE5LI8u/NIyOI2WBVXv4aHeMG3fGfhb9jS6
	IWL1S+uGUSRFWe7W5EVJWi+OCQYLEWmBnmoG+zD8ndvWEnW53RfR
X-Google-Smtp-Source: AGHT+IEAjfgWIXUPdAjF4Xqxez+RSQN1xPVEA/NLEHeWg6ykXvZ34GEuRCMq1cjaFdYMkUDwsklYhA==
X-Received: by 2002:ac2:4acb:0:b0:51c:43de:b18c with SMTP id 2adb3069b0e04-52964eaf6e7mr886594e87.27.1716541794363;
        Fri, 24 May 2024 02:09:54 -0700 (PDT)
Received: from localhost.localdomain ([178.70.43.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296e885d9csm133178e87.21.2024.05.24.02.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 02:09:53 -0700 (PDT)
Date: Fri, 24 May 2024 12:09:52 +0300
From: Ivan Bornyakov <brnkv.i1@gmail.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Wave515 decoder IP support
Message-ID: <bliiovkmzwkd5ikvvhvuokiacdclinb5rx4fxbtufwqnvqypgw@uygv56l7a45c>
References: <20240415100726.19911-1-brnkv.i1@gmail.com>
 <mwgydgjstvedkatdvopt3wh4imhnzflr7ut3vejgl6fz3vbgzg@x4spldwklrm3>
 <20240503150721.qd6d7csev5452rss@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503150721.qd6d7csev5452rss@basti-XPS-13-9310>

Greetings,

On Fri, May 03, 2024 at 05:07:21PM GMT, Sebastian Fricke wrote:
> Hey Ivan,
> 
> On 02.05.2024 09:40, Ivan Bornyakov wrote:
> > 
> > Friendly ping.
> 
> Sorry again for the delay, I was nearly finished with the patch set last
> week but the time wasn't sufficient. And I sadly have to delay it again
> a bit as I am on vacation until 13.05. I expect finishing it probably
> until 17.05.
> 
> Regards,
> Sebastian

Do you still intend to review the patch series?

Also should I resend? Is there anything I can do to budge the process?

