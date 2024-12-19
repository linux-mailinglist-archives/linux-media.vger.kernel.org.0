Return-Path: <linux-media+bounces-23820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EED9F817C
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C5216E93A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCDB1A08AB;
	Thu, 19 Dec 2024 17:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ayjQ8Mso";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JV+fg80S"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26719DF75;
	Thu, 19 Dec 2024 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628169; cv=none; b=Xgnug7sEhoQs/haaoauN2pQAEPXr83W8kxKiXqcQBoLh6jdzafC/Pc4L/Gn6GNxBuxqUif25jQ1qu+zg3MThVxSKgis8bY8LA7fqZWtQhJfYNdGpe+/+28wHioqAU0cp/D0dT78bDZnVQ2Li99SDL6VW8tyNMkBCkHWodq8DQrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628169; c=relaxed/simple;
	bh=f/3BniQ1xar58IrcPGmFeXbkVry4UUHQ/s9kZd4c2Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdHQQOWuzZ/TZktx+HnyjMTBo53Ld4MxtmD3fxbpFLziQxZXABSG5M4Q8+anm1evr/oNMWmIAlyg6wVWBqom8hraW1HhtbH/P6Yy3qjIhnMCyLWzW1g1k2ukL6I5qOj4062A4upIWUTwHy9N32hbixc2B/1OHKB/gv+oBYLzGMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ayjQ8Mso; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JV+fg80S; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id F327E114014E;
	Thu, 19 Dec 2024 12:09:25 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 19 Dec 2024 12:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1734628165;
	 x=1734714565; bh=kGWCQ4cplFiZd2s7ryuPo6ZM22sDkVU6frpj0+Okwzo=; b=
	ayjQ8Mso8ZQyA2p+j5YOCRQoYcmpiz6WcReWjpjB3A1NJeVoVc4nA/3lyI2T8Q8O
	RvCAdp4L8U115fUL92w/UGPFViXVkBn0F2iz87AgC6NbeSDR2tiaWTnNR1xaP+KF
	wR6K0DkA+SQOJZdMTA6493B4Bu6Y7zdi5oeD1pr7DKLEkIOnjBeL5a3bEgppndDv
	kmUl4cJNvv7KneHX5McZNxYCxhfflhmBkaUqeDMOutcL/D5DaVaVIjpe6HbUN2Ys
	Y4yMEt8a8ZfPkUvmrXyQY1pA4ibq6ULdRzviTvkp6W1UaOlpLKUgBWWzlcsWFWdH
	bcS0JDktzRjgj2nBtMMdbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734628165; x=
	1734714565; bh=kGWCQ4cplFiZd2s7ryuPo6ZM22sDkVU6frpj0+Okwzo=; b=J
	V+fg80SNolUGV3+dcNRWngxN3Gj4i4a9WmL9MHvy4jBRh92GqkTN5mlIm5JeC6Gx
	sTlMLEVWr7I5Tld36lzqTkDH/0lPkUvYBSz+7BCjGeLfqaj2i+K+zShFB2zKWfWH
	wZ72sZB9k4KEEtCC1CfInXXsrV8i6dcwX4o0ndBSUXoW9ssXEzkau8J2MQ6jn5BF
	HjusvKklxpjWhWsr63vm2fPKISMTAjTA7K5p5gzXfd3hmD2JCNI6XHDiI+K+ndRC
	775BN2NhrVyqFFo/k2wCZ2qh8ePX3KIEll/MaeWkaGwRjcxNS2KzQCWHQ8vn1S1c
	9A+8d+qpXZNh0cT/GWlCg==
X-ME-Sender: <xms:RVNkZwiKAUzQOx3wdM8L08T1QPfMkveFHrh1CtWC6bg38mR5RfrnzA>
    <xme:RVNkZ5ARATbGK1SGhcxEu0WfbjcHcYzTiD-OWQGr2W92-TY6Ddbnn2AweL-5y_sI3
    FPCoL3Y41k0j82nX-w>
X-ME-Received: <xmr:RVNkZ4EyXPww4rd5SlXOPP5MSfBbe9EH3lhyITwFB_cdghwdfx6RIs0YjsizFrNWosbkiXlSf06Md8sKobwRf0rchv27NhKIPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedtgfeu
    gfdtfedvkeffvdevheeuteffvefgvedvieduueegheetgffhvdfhtdeggfenucffohhmrg
    hinheprghnrghlohhgrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtg
    hhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheplhgruhhrvghnthhiuhdrphgrlhgtuhesohhsshdrnhigphdrtghomhdprhgtphhtth
    hopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhhes
    lhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhm
    vgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqsh
    htrghgihhngheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:RVNkZxTTcPr_FY7OBqNOFyf042lViAAx045pU8cbuPDjwjrhPdSqTg>
    <xmx:RVNkZ9ybYSpMeCXjhTFlpcl9sJiqYbt8psPAX9IIezzgd_WVyXCDkg>
    <xmx:RVNkZ_6gTbX9Ws6LWZjFyZSA_sLfKXfJbDqiQhnTAgycmVO42nq5tA>
    <xmx:RVNkZ6xRdxHhUNp50fxxq_h_Y9ukA3GxeDATe9bRXy7zIuecIeYmNQ>
    <xmx:RVNkZ0mBhYYQdjL4hlIBhpMPajSis7SS1xAt0I3eQX9D2UufCS1OJLrs>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Dec 2024 12:09:25 -0500 (EST)
Date: Thu, 19 Dec 2024 18:09:23 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/3] staging: media: max96712: enable extra debug
 register for max96724
Message-ID: <20241219170923.GC3377144@ragnatech.se>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
 <20241219150644.64507-3-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241219150644.64507-3-laurentiu.palcu@oss.nxp.com>

Hello Laurentiu,

Thanks for your work.

On 2024-12-19 17:06:42 +0200, Laurentiu Palcu wrote:
> The current implementation has the register disabled since it is not
> documented in the MAX96724 RM. However, in the chip's user's guide [1],
> in the Video Pattern Generator section, the register is documented and
> it appears to work just fine. Before the change I was experiencing
> approx 10fps when streaming, after: 30.3fps.
> 
> [1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/staging/media/max96712/max96712.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 5228f9ec60859..682ebd20851f7 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -462,6 +462,7 @@ static const struct max96712_info max96712_info_max96712 = {
>  
>  static const struct max96712_info max96712_info_max96724 = {
>  	.dpllfreq = 1200,
> +	.have_debug_extra = true,

This flag was added as I could not find the register in the MAX96724 
datasheet I had access to at the time. As you now prove the register 
exists in the user's guide and that it works I think a better solution 
is to remove the 'have_debug_extra' flag all together then set it for 
both supported devices.

>  };
>  
>  static const struct of_device_id max96712_of_table[] = {
> -- 
> 2.44.1
> 

-- 
Kind Regards,
Niklas Söderlund

