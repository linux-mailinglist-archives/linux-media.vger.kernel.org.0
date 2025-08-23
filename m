Return-Path: <linux-media+bounces-40832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE44B32C04
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 22:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79BD9E2A95
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 20:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B467E2EB854;
	Sat, 23 Aug 2025 20:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="owJUtLPj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF7E2248BE
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 20:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755981840; cv=none; b=bNENxg0bshmQAWQxhH9x3rkaXQ0C/toog91oKKnZDq/SMgppvKxzAkOcituAUJyudbhhAivCN8I3rfXfRMPVvB61h6uVU9vnRyeav63udhWc5Uj0t1y1AEZ38/hiXg5gvy0UDU5istmTw4Tom8YxsF46xIoZQVmV7G9YaqcLMGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755981840; c=relaxed/simple;
	bh=0Dda5qm2OHi63pkDwgChgj6GsL0RlbZr+Dk8jL/as2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOSvUJqhSgjypYGtXG9grCsaxh6Yqd/1LZkH7L9DlpObsM5CkfXOFdobdceaby5kgPCYzKoKm2kQJAEDB9gUhoIA/54AMPGMpzEK303aUshGQXOGkBfiUN5mP9KJfDYmY5N76+d9a3LxqYmxNnhWEqidBB1KCnZ1VfiO84INVpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=owJUtLPj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c79f0a5b8bso560835f8f.1
        for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755981837; x=1756586637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ncOl5iwhH0rvJNuoHUdRLF2/Z5/Gu+uKD3hX+7/KMaw=;
        b=owJUtLPjT+iy46ZcmwQBLigZcBX1+DMpNeqRqCcXMGhKbCeG3Bu6Z7XVTYglvPl1ev
         D/SpA0gXBk1MWzCJyq6SrrFTKNs8Uqu931SJmeWRrZtLrqZ8o3EJWyCTZzyGC1fyqKng
         1FpMqxp916FixxFPfdBDlnbtMD9+t2+zMf+aU5smXUepvBBO5jzbaSfCbaQIj89YVRrp
         aS/J0fMeLFHuY4cDgbfQIhjS51ZnKsxfqAbxKLRb2BEj4GKubpIKTtcI5eAtlKRcnuWl
         6QGqQ2oarvI/gH1esa8e8M8phO/26YUBe8qhLpu22rIHgKdhXMnyzq7crmbFO9vvh8OV
         nyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755981837; x=1756586637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncOl5iwhH0rvJNuoHUdRLF2/Z5/Gu+uKD3hX+7/KMaw=;
        b=e2LX/BxhC9ihNCvvK82UnXt1mmAUY8oaZH7QQeB9sveuqav24Myvb2xVmpB8Mk36L3
         eKKg23QG48YFzpGlNcDsbEnD64w105zaaFrCJ3ccjZao4Er5MMpLWWF2wR1ngnpyEMHM
         aH3y12XUumOKwrIo/BUKW16DF9SBPMX6Rljh0ClDB0WaqfTnQqq/C8wls2AqK90a9KsO
         4KCBSjsASpkawAs5sA6+Pve4LDGRDlq/zDCY35/MstsOEj94mtfftbPjESjFoZ/872NX
         DB0Jmat8uDE3gy0q8nJii1GEQ1UtovRLg59q+XEpFx3TbLLVhdt2oOlI9gFP3r2yAM4Y
         /8yw==
X-Forwarded-Encrypted: i=1; AJvYcCU0O85D1Zxt06PcSkX5jW0O+ui0Jh1+RR22rIkWYXOsuqz218uJGeZtow6qbREApHEdnoXPd+nhL9Fe5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOztLEW781SPjpEaaVWgwFznqdBVY91fQrGn7mOYB6m3tBjhUP
	c+8xqOjXXSnFuuGQohwsIenDc4YiX1RI2GYNxXkXCMfwA9VPu2gvT9qr/reGAiXXs0I=
X-Gm-Gg: ASbGncv8dUdEqw/TsZ4Qs5Flc2YhE/fnU3vaT1KSTdyp3RCrhY88jH9SqH6BKtIQ75Y
	B/GqwWdsApWlgLaHjhJ7jhUS9AipI/1tWC64+0WaPfdDyHYfNk/TB5pQ8su8c8N4RzWML6P1jlB
	XXUrC4+HzN8BjUaPMZ9qXbpzVgJVYoqPu4317d9cQ6dQ4d0UC1yuo+CE2UDyDLaRp0nXiXv4CiY
	+NtZK27U2J7HS/exbp6upOPbUBdiywPu66Hm3u4wRXi1HDa6gjTSpC+Pz8eDoUDbpmQSIQEbBBD
	0jFILDuT/HtWXlbDttXO+ZBUDpRaFAlC7z31B8nol4EwAEYm38oZPFydUT+5DrjFI2Sqm6+MgHB
	qreCyrmp+xOKwXwo20g0Bwi5pChao1kGa/Vo=
X-Google-Smtp-Source: AGHT+IGs4eKFbPlrT8Yv6hTCIpTHOphruT6aa4eb9E8LlM4kYYOYgvkuN1xHLJp/ymLK+6lCX00Jaw==
X-Received: by 2002:a05:6000:22c4:b0:3b8:d2d1:5bfc with SMTP id ffacd0b85a97d-3c5dcdfed86mr4339314f8f.37.1755981836506;
        Sat, 23 Aug 2025 13:43:56 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:514d:30f3:c6be:a5b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211b0esm5171237f8f.42.2025.08.23.13.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 13:43:55 -0700 (PDT)
Date: Sat, 23 Aug 2025 22:43:52 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <aKooCFoV3ZYwOMRx@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
 <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>

On Fri, Aug 22, 2025 at 10:10:30PM +0530, Mukesh Ojha wrote:
> On Fri, Aug 22, 2025 at 06:26:19PM +0200, Stephan Gerhold wrote:
> > On Fri, Aug 22, 2025 at 08:36:11PM +0530, Mukesh Ojha wrote:
> > > On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> > > > On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > > > > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > > > > >>>> +int iris_fw_init(struct iris_core *core)
> > > > > >>>> +{
> > > > > >>>> +	struct platform_device_info info;
> > > > > >>>> +	struct iommu_domain *iommu_dom;
> > > > > >>>> +	struct platform_device *pdev;
> > > > > >>>> +	struct device_node *np;
> > > > > >>>> +	int ret;
> > > > > >>>> +
> > > > > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > > > >>>> +	if (!np)
> > > > > >>>> +		return 0;
> > > > > >>> You need a dt-bindings change for this as well. This is documented only
> > > > > >>> for Venus.
> > > > > >> You are right, wanted to send device tree and binding support separately.
> > > > > >> But if required, will add with the series in the next version.
> > > > > >>
> > > > > > You can send device tree changes separately, but dt-binding changes
> > > > > > always need to come before the driver changes.
> > > > > 
> > > > > Do you mean to update the examples section[1] with the firmware subnode,
> > > > > something similar to venus schema[2] ?
> > > > > 
> > > > 
> > > > Sorry, I missed the fact that the "video-firmware" subnode is already
> > > > documented for iris as well through qcom,venus-common.yaml (which is
> > > > included for qcom,sm8550-iris). I don't think it's strictly required to
> > > > add every possibility to the examples of the schema, since we'll also
> > > > have the actual DTBs later to test this part of the schema.
> > > > 
> > > > I would recommend to extend the description of the "video-firmware" node
> > > > in qcom,venus-common.yaml a bit. You do use the reset functionality of
> > > > TrustZone, so the description there doesn't fit for your use case.
> > > > 
> > > > I think we will also have to figure out how to handle the old
> > > > "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> > > > registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> > > > handles IOMMU from Linux). Simply checking for the presence of the
> > > > "video-firmware" node is not enough, because that doesn't tell us if the
> > > > PAS support is present in TZ.
> > > > 
> > > > I have been experimenting with a similar patch that copies the "non_tz"
> > > > code paths from Venus into Iris. We need this to upstream the Iris DT
> > > > patch for X1E without regressing the community-contributed x1-el2.dtso,
> > > > which doesn't have functional PAS when running in EL2.
> > > > 
> > > > Perhaps we could check for __qcom_scm_is_call_available() with the new
> > > > QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> > > > or directly with the registers. I don't have a device with the new
> > > > firmware to verify if that works.
> > > 
> > > You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
> > > but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
> > > used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
> > > video-firmware's iommu property is also important.
> > > 
> > 
> > Yeah, this sounds good.
> > 
> > > > 
> > > > I'll try to send out my patch soon, so you can better see the context.
> > > 
> > > Are you saying that you are going to send patch to support IRIS on
> > > x1-el2.dtso in non-secure way i.e., non-PAS way.
> > > 
> > 
> > The background is the following: I have a pending patch to add iris to
> > x1e80100.dtsi, but that currently breaks x1-el2.dtso. My original plan
> > was to disable &iris in x1-el2.dtso (because the PAS way seems to be
> > just broken), but then I saw that e.g. sc7180-el2.dtso does have working
> > Venus with the "video-firmware" node. Copy-pasting the "no_tz"(/non-PAS)
> > code as-is from venus into iris works just fine for x1-el2.dtso, so
> > disabling &iris in x1-el2.dtso just because the "no_tz" code is
> > currently missing in iris doesn't sound right.
> > 
> > As far as I understand the approach you use in this series does not work
> > without the TZ changes for older platforms like X1E(?), so adding that
> > code in iris seems to be the best way to move forward.
> 
> Yes, this series has dependency on firmware and will not work for older
> platforms.
> 
> > 
> > I started working on a patch for this a while ago, it just needs a bit
> > more cleanup. I'll try to finish it up and post it so we can discuss it
> > further. I think the IOMMU management in my patch would even work as-is
> > for you, you would just need to toggle a boolean to use the PAS instead
> > of accessing the registers directly.
> 
> Sounds like a plan.
> Thanks, please cc me when you send the patches; So, I could test along
> with my changes and make dependency on it.
> 

Krzysztof raised the concern that we shouldn't model the IOMMU specifier
for the firmware using a "video-firmware" subnode [1], similar to the
discussion for the "non-pixel" subnode recently [2].

I mostly finished up the cleanup of my patch, but I don't see any point
in posting it without an alternative proposal for the dt-bindings. For
this case, I think a simple property like

	firmware-iommus = <&apps_smmu ...>;

instead of

	video-firmware {
		iommus = <&apps_smmu ...>;
	};

could perhaps work. (XYZ-iommus isn't standardized at the moment, but I
think something like XYZ-gpios would make sense in this case. There are
many other possible approaches as well though.)

Unfortunately, I won't have enough time in the next weeks to fully
implement and propose an alternative. I'm assuming you still have
ongoing work for supporting the "non-pixel" IOMMU, perhaps your new
approach can be adapted for video-firmware as well?

I've pushed my current patch to a branch in case it helps. It's similar
to yours, but it has no external dependencies except for a fix in iris
I sent recently ("media: iris: Fix firmware reference leak and unmap
memory after load" [3]). You could use the non-PAS use case as a basis
to add the initial implementation in iris independent of this larger
patch series.

https://git.codelinaro.org/stephan.gerhold/linux/-/commit/1e068f5864d958ab9e807e6e3772b778cd0edea8.patch

For the PAS+IOMMU use case, it should be enough to set core->use_tz to
true, plus any changes needed for the SHM bridge (and maybe resource
table). The IOMMU management is independent from core->use_tz.

I'm also happy to add the non-PAS approach later on top of your changes,
whatever works best for you. :)

Thanks,
Stephan

[1]: https://lore.kernel.org/r/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/
[2]: https://lore.kernel.org/r/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/T/
[3]: https://lore.kernel.org/r/20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org/

