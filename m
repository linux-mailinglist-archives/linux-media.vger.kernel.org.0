Return-Path: <linux-media+bounces-21563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F179D1FC7
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 06:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8DFB1F22134
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 05:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E9514F9ED;
	Tue, 19 Nov 2024 05:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lU1Yz6NL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C56142E7C;
	Tue, 19 Nov 2024 05:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731995662; cv=none; b=O1cPXAEZEVg/7MepJ3Fp1ZL61kJob76Ykc5QvwCcnR0V4RDS38c0YZcso18sPAM0V2kiamJPiXDa4uA9tJgR6X1F/BBOcYmjmK+d4zDkBgF8G7euiVKe06H4PmhP6bhajNF2ZmsiZpk7XtY410MIPxRWMdOyiAeXFKh1E7jYzyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731995662; c=relaxed/simple;
	bh=US1eIW7LeA+1KfPrGLNezD6Ss3WLd5RhZ/sxS2uSAyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ljawcl05quOHnkzIT7gdmo7Hy7kje3CmzvidBYkHyRZUeEdc94DsKHy1KtRqTMecJZBCs/fybkzk4pMoB5EydC27qfeG54ThcjEAqX8sRKjtTLLfUHYKvDevmpnm+stBJXOpO1ouBXHexc4IgMhCi8/jjvkMEhFUaZTQRE4tZl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lU1Yz6NL; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ea4d429e43so1682064a91.3;
        Mon, 18 Nov 2024 21:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731995660; x=1732600460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sPR84UHCUvaOEvWy/NGk03Dr1sgtX6rUbFD2LbTCjgE=;
        b=lU1Yz6NLpmsTbgYg7yhhCpTA3EPYdQIhp1RwLeCDUQfCMqO0K3bZVJsKRhZl5yRnzE
         3lj8m+FwudWghoJ8PtuM6J6Icpk17dyjA59QchDDBbbtDQrQXxAkspNFl+TcVlRBiMKy
         Hl4HSCmJNhXmxOt0NoYO/1dxObTsA9dm3au/MOCm+e+rmDiz93aIERu1CfTFKe4b8uh3
         JkcEBRoCCNB6BPrsCDqnzFc8P0RGuSu/GGWCogYJ3w2cCyLB+3DOPmcIuqT7HLy4s2ts
         XG5QboeYmTYenAnNNxtOs02+0QLfkNaRgkuFiz5CFDFRlJ9dcoOWwyGZGP6nxEXLvcME
         ZgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731995660; x=1732600460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPR84UHCUvaOEvWy/NGk03Dr1sgtX6rUbFD2LbTCjgE=;
        b=VJNqFEMWagjheNGWgra1Bv3TSpK54kA5yajEsryx964JiokiFSxRFdrqNGE7bbsJJR
         OvzCL8g8X9a3L6gIbilecuJzb7qitUP5ydm5azeolW+twlmyblObhM+KV+3MI1ZWJ0lI
         xIl5eJbBQgyb5p7US+66Hg5Xb4r4cEmKl+BuhPRhTMnCyP+SPGeCh5+wzPE9kjdsG17C
         bq83IhlFHCLKvZyEBklQBxHScT+CZjj4DyPenQnRGSUVXlKD2r/j5tXj7QCgauvG70F/
         XRVZ3p2Qst7Og6eiSfLNhzlzVxrOSpq2In51c03AAAuQJX5vrOCwt/0vEBWG78UT3Rk1
         m4uA==
X-Forwarded-Encrypted: i=1; AJvYcCXVPksq+khRT3XG9/z7Ih6Bot+u7j9pMe7YmVVqbP1xy5xuJaNPf69T0f5kyWIQLoPFSgpnGf2ImnkE9F4=@vger.kernel.org, AJvYcCXw4y4vV1lv7QCMyZZB62rdVJjz7UNEaMVC7kcf1UAbdux/KIaKWXoZhqJTgQGa4PIOG+CR1ya/HYQ8mMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPjQSFTwC2JCLHb7ECuRp4y13hHvPA/uN3byCH20xn4v5da+Xr
	J4+GrTRappcTvDDmGYdGqwdtJhBMlfzJgjCFZozYKPTjUgPvhL5VeclLY2JN
X-Google-Smtp-Source: AGHT+IGnv4VCMQafOLUTrIv29G+Q/+Mep91ihQQ7OEyN58NPfepR4RjFIymBqCb5CgP8lUvQpWrV2A==
X-Received: by 2002:a17:90b:3b90:b0:2ea:4578:46c6 with SMTP id 98e67ed59e1d1-2ea457877d6mr12280134a91.30.1731995659578;
        Mon, 18 Nov 2024 21:54:19 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea81b0e2fasm2581653a91.52.2024.11.18.21.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 21:54:19 -0800 (PST)
Date: Tue, 19 Nov 2024 11:24:15 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: dafna@fastmail.com, laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 media-next] media: rkisp1: Fix unused value issue
Message-ID: <ZzwoB4jt9LyTm0x7@HOME-PC>
References: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>
 <3obha26vg2agtmrxjft325ifiwyaftqchgpdgmm7aok7vt7e5c@jfknj6opiudo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3obha26vg2agtmrxjft325ifiwyaftqchgpdgmm7aok7vt7e5c@jfknj6opiudo>

On Mon, Nov 18, 2024 at 11:18:34AM +0100, Jacopo Mondi wrote:
> Hi Dheeraj
> 
> On Mon, Nov 18, 2024 at 03:07:21PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > This commit fixes an unused value issue detected by Coverity (CID
> > 1519008). If ret is set to an error value in the switch statement, it is
> > not handled before being overwritten later.
> >
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> 
> Indeed there's something fishy here, however the issue is not very
> much about ret being overritten but rather the error condition
> 
> 	fwnode_graph_for_each_endpoint(fwnode, ep) {
> 		switch (reg) {
> 		case 0:
>         HERE   ---->   (!rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
> 				ret = -EINVAL;
> 				break;
> 			}
> 
> 			break;
> 
> 		case 1:
> 			vep.bus_type = V4L2_MBUS_UNKNOWN;
> 			break;
> 		}
>         }
> 
> breaks the inner switch and not the for loop.
> 
> I would
> 1) Slight reword the commit message to make it about missing an error
> condition
> 2) Add a Fixes tag
>    Fixes: 7d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")
>    so that this is collected in the stable trees
> 
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index dd114ab77800..9ad5026ab10a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> >  			break;
> >  		}
> >
> > +		if (ret)
> > +			break;
> > +
> 
> The change is correct
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
> >  		/* Parse the endpoint and validate the bus type. */
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  		if (ret) {
> > --
> > 2.34.1
> >
> >
Hi Jacopo,

Thank you for your feedback. I agree with your suggestion and will update 
the commit message to describe the missing error condition.

-Dheeraj


