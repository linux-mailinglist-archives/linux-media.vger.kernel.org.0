Return-Path: <linux-media+bounces-41966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE2B486E5
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483CE1663D2
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 08:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3455326E71C;
	Mon,  8 Sep 2025 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UNzXTYPp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E782EAD1C
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319820; cv=none; b=jT5ZMb56m/m6YxMgs6Kv974a/PsuQOb9bl9kzyKYsDrRqukNkNzqhMKyz8ibjJp2BeBR8p5WJXxKx9sBBfI36BDNl9E69+IX71vD0MLb8lG/HAKIX1zlO2PdUTMLmXDRZ15hER+dua5GVbHyXAFOLtN77YGq1j1+f9cuTiOPl+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319820; c=relaxed/simple;
	bh=8+by6ZAZyD9xbPWaBU25LhFVjdbedeOp3cHD4UKqC7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0SlYEK59v0JGXMooL3SHpgnsdrD6P7tqPBz9Nctls7ixeKKAgxNpNmtESCb2dckE0SgrnH2oh6gSUEZm6YBjhFbzyM6caw5r3wWKJ05HSjBbum9V4VokfnbgrlTSi5U7IMGvW0Ji8GLiCT5fl/URZk51BwRkLXAJfcg3Q8K9j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UNzXTYPp; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b045d56e181so640231666b.2
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 01:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757319817; x=1757924617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IDsLfEl3Bc3ynxxzuRcTJTa1XuYIkbwYHFFTkbC2BKM=;
        b=UNzXTYPp6kw5BAm9damKV+DRrLJ0NK9TA0JJVRH+CfacI/kRgDe7XT9D154CXJ3sGL
         tUnftpVVjLpX5xj2ScpQS2aWmnMD+QOVpeldWUqzXmtYhaXP/BQURIMj2uVPMNS3EU1y
         UksQnssC65lXYnRcZPvV9m26R/P7d6wK009Aagp0MXtznMwPxhjakQAttKHQSYDk6HH8
         BZA9U+yiDUEsnZmLdQ0BvC+s/i9I4Qo+E3o26jfYt0dbmbYVLB9LWSwjeRiCgwn0uPyZ
         o+Q/Epq2CHkT58eoyKz7NZpQiSC1RmOnBwZzckJajZvl+pFzc+OXe06FC8fduekd0q/j
         DpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319817; x=1757924617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDsLfEl3Bc3ynxxzuRcTJTa1XuYIkbwYHFFTkbC2BKM=;
        b=NHLajExeYv4cULimSgCD9peUS0Ln3aOWMj1SgjEgRYI0i3N/GwiANzz6avcgtMDx/2
         +tmArWT7IVQ90Qo4INZCnxxRrlZYNAbv9q6VIoSHh8/IFfdhcjFDUHWEefUwArdIZHLT
         B4223/vifZnWIdzrZdLuLi6/eTndp4L0edr3lt1vnV/3/3ZQNeATmgJ5QlU+c2kzCg2h
         zsN3sO48J10sb3YHMOc/EXn4ygMByxFbAmq+bLljdXda0vXX4CgXSkI0mxrLeLkXviJF
         SeSXq9pebeB4ELW8X/GbaEk7y7regY26PVD0y0amnOupgwCCe5r4vAno3EEaTld5SC89
         vVPg==
X-Forwarded-Encrypted: i=1; AJvYcCW741WCHBiJQeeov+WTx+4tJXUUD7eGo1duNPwV31tozwUk0q2LKacbiRxVA8xHQv0j1qR6VRqbgkC6MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUpW3qnnHXPZd9gC7V2TPr/A8nqyu6c+/0m4GigUU3lNlGNn92
	3JVFvzx5Ell029+Hpz5xXXYzFntwwWZrexmLC+lHt9JrQfVrpEQDd8fZy7hs1jbo5qk=
X-Gm-Gg: ASbGncuFFOc+3eGdtcNnpoFnqVY6bOAAID5YCDYRii5j2oM49njHY9nZBOdsjV8IWSf
	b2UYsT4hnk2ZaqhQSVwrlfFIxcNKgiO5ZizNZYB65tU3YVP46hmSJtFwrdyFXjVWbxza1NyTrSf
	vj//0aCv+iezeytUeRVOKRmMRRs6k4Tzb95/TnUGauAGeFXAyHAIHU4zYbYBoM3r6tUzyN7esSN
	RCoN5j3RwocAIpuvh+guVAcLrnWhi0oUUrPOGU41QLelQxDhcp00QjbzjsOn9nnl1KgJbzrxRvW
	xaNFHpx5cIMJFQ5yCRljQQeZWNEmly6QaZkTA4SPc1722jz+3aW2aWCGJdZEVS9l8FFmWq0DRob
	wHWYqpONa4liS4qYgd2ferQ09nqcOa6udyHMlIX5W1fU=
X-Google-Smtp-Source: AGHT+IEjmfbXaJR5mLb1vcxyiOuJ52qP/GEvZfS0Ot7eygHk2Y+MfbGgHZLHivzhbxmGCa3WJs3+ag==
X-Received: by 2002:a17:907:3cd5:b0:b04:a1ec:d06f with SMTP id a640c23a62f3a-b04b140a6a9mr731498366b.25.1757319816823;
        Mon, 08 Sep 2025 01:23:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:1f60:42e1:1e1b:d240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041800e89esm1998366766b.30.2025.09.08.01.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:23:36 -0700 (PDT)
Date: Mon, 8 Sep 2025 10:23:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <aL6Sg9dExKfepRKM@linaro.org>
References: <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
 <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
 <aKooCFoV3ZYwOMRx@linaro.org>
 <20250825111956.5x4dn3uguo4xmtss@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825111956.5x4dn3uguo4xmtss@hu-mojha-hyd.qualcomm.com>

On Mon, Aug 25, 2025 at 04:49:56PM +0530, Mukesh Ojha wrote:
> On Sat, Aug 23, 2025 at 10:43:52PM +0200, Stephan Gerhold wrote:
> > On Fri, Aug 22, 2025 at 10:10:30PM +0530, Mukesh Ojha wrote:
> > > On Fri, Aug 22, 2025 at 06:26:19PM +0200, Stephan Gerhold wrote:
> > > > On Fri, Aug 22, 2025 at 08:36:11PM +0530, Mukesh Ojha wrote:
> > > > > On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> > > > > > On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > > > > > > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > > > > > > >>>> +int iris_fw_init(struct iris_core *core)
> > > > > > > >>>> +{
> > > > > > > >>>> +	struct platform_device_info info;
> > > > > > > >>>> +	struct iommu_domain *iommu_dom;
> > > > > > > >>>> +	struct platform_device *pdev;
> > > > > > > >>>> +	struct device_node *np;
> > > > > > > >>>> +	int ret;
> > > > > > > >>>> +
> > > > > > > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > > > > > >>>> +	if (!np)
> > > > > > > >>>> +		return 0;
> > > > > > > >>> You need a dt-bindings change for this as well. This is documented only
> > > > > > > >>> for Venus.
> > > > > > > >> You are right, wanted to send device tree and binding support separately.
> > > > > > > >> But if required, will add with the series in the next version.
> > > > > > > >>
> > > > > > > > You can send device tree changes separately, but dt-binding changes
> > > > > > > > always need to come before the driver changes.
> > > > > > > 
> > > > > > > Do you mean to update the examples section[1] with the firmware subnode,
> > > > > > > something similar to venus schema[2] ?
> > > > > > > 
> > > > > > 
> > > > > > Sorry, I missed the fact that the "video-firmware" subnode is already
> > > > > > documented for iris as well through qcom,venus-common.yaml (which is
> > > > > > included for qcom,sm8550-iris). I don't think it's strictly required to
> > > > > > add every possibility to the examples of the schema, since we'll also
> > > > > > have the actual DTBs later to test this part of the schema.
> > > > > > 
> > > > > > I would recommend to extend the description of the "video-firmware" node
> > > > > > in qcom,venus-common.yaml a bit. You do use the reset functionality of
> > > > > > TrustZone, so the description there doesn't fit for your use case.
> > > > > > 
> > > > > > I think we will also have to figure out how to handle the old
> > > > > > "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> > > > > > registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> > > > > > handles IOMMU from Linux). Simply checking for the presence of the
> > > > > > "video-firmware" node is not enough, because that doesn't tell us if the
> > > > > > PAS support is present in TZ.
> > > > > > 
> > > > > > I have been experimenting with a similar patch that copies the "non_tz"
> > > > > > code paths from Venus into Iris. We need this to upstream the Iris DT
> > > > > > patch for X1E without regressing the community-contributed x1-el2.dtso,
> > > > > > which doesn't have functional PAS when running in EL2.
> > > > > > 
> > > > > > Perhaps we could check for __qcom_scm_is_call_available() with the new
> > > > > > QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> > > > > > or directly with the registers. I don't have a device with the new
> > > > > > firmware to verify if that works.
> > > > > 
> > > > > You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
> > > > > but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
> > > > > used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
> > > > > video-firmware's iommu property is also important.
> > > > > 
> > > > 
> > > > Yeah, this sounds good.
> > > > 
> > > > > > 
> > > > > > I'll try to send out my patch soon, so you can better see the context.
> > > > > 
> > > > > Are you saying that you are going to send patch to support IRIS on
> > > > > x1-el2.dtso in non-secure way i.e., non-PAS way.
> > > > > 
> > > > 
> > > > The background is the following: I have a pending patch to add iris to
> > > > x1e80100.dtsi, but that currently breaks x1-el2.dtso. My original plan
> > > > was to disable &iris in x1-el2.dtso (because the PAS way seems to be
> > > > just broken), but then I saw that e.g. sc7180-el2.dtso does have working
> > > > Venus with the "video-firmware" node. Copy-pasting the "no_tz"(/non-PAS)
> > > > code as-is from venus into iris works just fine for x1-el2.dtso, so
> > > > disabling &iris in x1-el2.dtso just because the "no_tz" code is
> > > > currently missing in iris doesn't sound right.
> > > > 
> > > > As far as I understand the approach you use in this series does not work
> > > > without the TZ changes for older platforms like X1E(?), so adding that
> > > > code in iris seems to be the best way to move forward.
> > > 
> > > Yes, this series has dependency on firmware and will not work for older
> > > platforms.
> > > 
> > > > 
> > > > I started working on a patch for this a while ago, it just needs a bit
> > > > more cleanup. I'll try to finish it up and post it so we can discuss it
> > > > further. I think the IOMMU management in my patch would even work as-is
> > > > for you, you would just need to toggle a boolean to use the PAS instead
> > > > of accessing the registers directly.
> > > 
> > > Sounds like a plan.
> > > Thanks, please cc me when you send the patches; So, I could test along
> > > with my changes and make dependency on it.
> > > 
> > 
> > Krzysztof raised the concern that we shouldn't model the IOMMU specifier
> > for the firmware using a "video-firmware" subnode [1], similar to the
> > discussion for the "non-pixel" subnode recently [2].
> > 
> > I mostly finished up the cleanup of my patch, but I don't see any point
> > in posting it without an alternative proposal for the dt-bindings. For
> > this case, I think a simple property like
> > 
> > 	firmware-iommus = <&apps_smmu ...>;
> > 
> > instead of
> > 
> > 	video-firmware {
> > 		iommus = <&apps_smmu ...>;
> > 	};
> > 
> > could perhaps work. (XYZ-iommus isn't standardized at the moment, but I
> > think something like XYZ-gpios would make sense in this case. There are
> > many other possible approaches as well though.)
> > 
> > Unfortunately, I won't have enough time in the next weeks to fully
> > implement and propose an alternative. I'm assuming you still have
> > ongoing work for supporting the "non-pixel" IOMMU, perhaps your new
> > approach can be adapted for video-firmware as well?
> 
> I believe, non-pixel case a bit different and thats not depends on whether
> it is PAS or non-PAS.
> 
> However, I liked the idea about introducing something similar to -gpios
> for -iommus as could pottentially solves at least this issue. Here, we need
> to create a platform device and its domain based on firmware-iommu
> property.
> 
> So, its required change in device link to put supplier/consumer dependency
> and addition of firmware-iommu binding for IRIS and little of changes
> over your existing changes.
> 
> But I have doubt, whether @Krzysztof would be fine with it ?
> 

Krzysztof isn't on Cc here so I wouldn't expect him to reply. :-)
I'm not sure if it's helpful to add him in the middle of the discussion
either (at least without proper summary of the problem description).

I think it would be best to prepare a patch series with the motivation
properly described. If making the actual implementation (to create the
platform device etc) is too much work it could also be sent as RFC with
only the dt-bindings.

Have you continued working on this to unblock adding the IOMMU needed
for the IRIS firmware?

Thanks,
Stephan

