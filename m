Return-Path: <linux-media+bounces-27531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB98A4EEE0
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 21:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED43F3A9D52
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8B2264619;
	Tue,  4 Mar 2025 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TBUSB3JN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB0B204F61
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 20:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121739; cv=none; b=gH19MQDgO8qPyYG48tPFKDKBZxjwVumemH3mCT5mHn/67SvNYcRDkr7eBNoOorsl88pK6HULGwn89INXODUqgqJ7m+U5bphaI4WKXCrfAh7CT3D7qn/aOWtOKu7ZMTlgdGZity5fT13OG9kfkYZY2ToGVd5QOKY149r1zz2bVDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121739; c=relaxed/simple;
	bh=NSNt9Id4lXxpJ93KsFSenjzsktLV4E4jeRdB9AxjTdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qH3Y09WVQ5e9AfQzMPXh08EMzlOIID39cjzFdcSs3UFgmDkOWjvxv+59n7e0nIGz66yDjnw+0y+SbH4NrTCaRK8NRM6vZwA36/btNkwN3HNN5h44USDa9h4SfFxkUr0kTFciF+fJjJ8BHET4GPHPI9U18jtX3leEO2kbv1x9We8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TBUSB3JN; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54963160818so3697524e87.2
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 12:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741121736; x=1741726536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zlnut3W9WMDFb8LsQDCStS5e+lluNoYb/y0OfzkgWag=;
        b=TBUSB3JNOYb7BZUCA/zt0FRsICNG5GXpiwgpTfqfwwi71LeajB/CHyB4mwAmD95LP6
         ElSy0COPGzhSBQDIb4/maxmLSr39HA+OJTXL3eLzm3uC3KFQBW+UHbot0fn84qGS5Ja6
         UfE22bC8Ek0tSdmN7OZgdXvgBGRowIlWxOS6mE7VRq+owzo7ib8LTS/1hXiPHR5RvI99
         Ah7cJOFH/3EjKDFuNHuInNAmfXuiEkGcSaP448qWYPB3F3FhCG7mAAq20bGQjhgnp92f
         tvejK1GubQK4SyB+U0aBcMPJk6V4NDMqyO4EzP1SIpeXGJ8cjPYf651pg7tJlzlf1Guv
         KWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741121736; x=1741726536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zlnut3W9WMDFb8LsQDCStS5e+lluNoYb/y0OfzkgWag=;
        b=Lgc1ECe/3KsYKfIpwN8XKTBphGVtxP+2Ow0ldzvY4Uxi3zyYQKhI6aDqwzJW+WdB/J
         3O0ND1AuTcOMR6cKrCqN4Awfh0e6yaYfoFRun+QCkifqVyNevxzVq1HvPNgyBPlmC9gM
         qWE5CDlAepcgeO8bWF2BX9yABrVU+Wrs0RqISIkWYjsQVWqUHCsfbxHzPtKbmwqcM09r
         ncOzpFVrdU5Wy2ZR8RvEdkF3gVNwpUSPvszC7MgNJUC9IG89X8rYZG8RUiJ1+n98+TaN
         phPVaxvfj+k52+o/5n+2+3ZaYgRJKBWzEX+V+f2bAxy3eVxnYDupfgKFZztzeZ/PWS/I
         4QSw==
X-Forwarded-Encrypted: i=1; AJvYcCUF8DgijXPGmYnz2S8TPmri4sDRHkVVNXz/n9qF6c3qyeQ05r9NA3LSb0lbBEev7wbyoA7RyzdtjbF16A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFMOtmJM3LRvPr8Fvoq//h3eTqR+/O8qv+9q8mgOYNrltS2BCg
	yCaG33dKfJgPtu0vWnnPz3pmjTVAHsyxgfcsVe/6mUbjw5qiz5zAPk1ZKnF6oLE=
X-Gm-Gg: ASbGncsf+X7enw5akXdBSQYa9orlHcVDc3JSqP+ZIu5R8o4/KmNuvbP3CSaCsZrPn71
	H7LBXlygnf7/VAn3e+mDnqG1Oh46hS3gvhonluWGpYfOoLBZuShDs+BVPXpqpMFvlMMU+aYVHPu
	Zq/gjALYnVrxr4F03/2HfILIL/z97MY5YMTTIFv6Pl+/b3uCg6fo+GBcohKiv6it1peU68PoH7n
	6kqS3e1VGQeNM6h3ljUNkLwSrJvsHtPHlqdQSLL3ruBNplArWqclhnMWakiXZR/ybNrw+GuTV+k
	bIBv3kKKCFptDCIwUpg8VqhQsmPvECZ6/8MRwLFkZM+867g5Coi2Z9zol4qhTXWmMa/aECVs9nL
	1O6RVoNQGQ17ZLe/cg7wNMUw/
X-Google-Smtp-Source: AGHT+IEIFo+QJ3gjvVNTH+uDIO5F147DYqk0crHu9Qb2qxeLZA30uWfc69h6oFKSES/bityKAXb6aQ==
X-Received: by 2002:a05:6512:33c4:b0:545:381:70a with SMTP id 2adb3069b0e04-5497d3368cfmr244970e87.15.1741121735864;
        Tue, 04 Mar 2025 12:55:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495c9d3307sm1006543e87.81.2025.03.04.12.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 12:55:34 -0800 (PST)
Date: Tue, 4 Mar 2025 22:55:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sc8280xp: Add Venus
Message-ID: <cvbunupn64syfeomju3rb4n2xfri6zdjm4dfo67osbt2esrwuo@7g3ji5hnt5bc>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-7-279c7ea55493@linaro.org>
 <77475c23-c173-4512-b257-d7b01fa2054d@kernel.org>
 <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>

On Tue, Mar 04, 2025 at 05:41:27PM +0100, Konrad Dybcio wrote:
> On 4.03.2025 3:02 PM, Krzysztof Kozlowski wrote:
> > On 04/03/2025 14:07, Bryan O'Donoghue wrote:
> >> From: Konrad Dybcio <konradybcio@kernel.org>
> >>
> >> Add the required nodes to enable Venus on sc8280xp.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > 
> > 
> > SoB and From do not match.
> 
> .mailmap breaks this
> 
> I previously worked around this by kicking the relevant entries from the
> file, but that in turn broke base-commit in the cover letter

You can override that by using 'b4 --edit-deps'

-- 
With best wishes
Dmitry

