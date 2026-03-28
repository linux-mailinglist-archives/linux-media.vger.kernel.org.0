Return-Path: <linux-media+bounces-57402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDDREckjx2lATgUAu9opvQ
	(envelope-from <linux-media+bounces-57402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 01:41:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA8E34CC21
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 01:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6DFF302824A
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6854A1FBEB0;
	Sat, 28 Mar 2026 00:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="viLd/j5O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA081F03D9
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 00:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774658488; cv=none; b=HAlWXxmawq4HACVoN4f/XmuOKIR45F17vFyiAcdqKc7AVY+sYssMfY1XryY2+z/eot5HPzvPxvBYQWw3q7E2Ea9Lc+QJJIrtjJgxDEgoQPrBsoeWO82sLbaOanyQnERAE6PDEzQGLMcA6KMiuyPW6M6gP4tLlg2zoVrasCPZb98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774658488; c=relaxed/simple;
	bh=vWi5PsX3/N3kIUZKJo1GpcR0ab9hV2ov2mnFXm2V5+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEB/v249rx5ZGszhPPJ3DpJTsO+wc8hFeZ3YuQzFRB13uAps0BnIO5/H9Tewbv9VnrX7qe1gLKYMga9LXvyvp8lD7gq0d94+3T60O1dfkaN7KkGEene4OWCVSjQURzUtfw7ogwDhUwdKvqjRNnUZok5IQzVr6b8M6Ndw1Y6mX/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=viLd/j5O; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a2fb8ad36so1047151fa.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 17:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774658486; x=1775263286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGqFSu/F2IhY+ii28nyc1IJ0LboHG+irAmTUkiXh190=;
        b=viLd/j5O2afh9CeeL7DUdhStyVjJFcDF6ElR5yozqSLwFVxltdeipYPTM1iqpOs4S8
         g9GsGm3EWDd++XvTgzutVAxDs5PWlCYE8iwpsr20wVhGW+syqxXc91zb7A/Wrv8KqMwB
         ce+TfK90UvO4J7mcE1f2IQGWsa2oDkPI/8tUD+ZmEW8w9p3RVf2IDk449ZRYjsAj10P+
         HSkBpOQktql+AC5srfbOj5lW+eMmdtIHEYIeT3Z9h7UjbYxH2iah2Jl9AO46jsYTTyPD
         FIcAlepEXvAEItXFvoH7twz0c4pBbfOdO1VbfobrczypBqYVghDP+X88afwuvrArF780
         IvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774658486; x=1775263286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGqFSu/F2IhY+ii28nyc1IJ0LboHG+irAmTUkiXh190=;
        b=ZPsXfxxi0WcCi762oo8r4Ke72OWcDpVdFEMuYB4Cg9JQV0kPDloReddWcZwBvqAhd6
         aP3aGglvkgPRb2N2kzTREbrSLvwQYA7EOLVMtNi6pNvufQ0+St5g27Cs9aMNDr1pj6+l
         a+0/ISw1mbVd7c5tD/3HpJrmJT7dxFO1jq1WpGr44hB+YKXg7opOgtFtRTokML8OJLBt
         TDw4BvV6dit4L2HTeys66u8i1kR2DUiOE7ROqMdtWxkl4PtPA64qORf13qRfraI+w5pI
         pikhn7ef4pceMpZJW8R/0dmg2rvIRtm6wzXdYr+h71rlgOhrwG1E6zjpEhQhusRLBhGV
         75vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB8uRK32FCXJdbx9E2Gepszl76DVfEHPER+KC055zLmF/3+mj2p2Ec57mctNcjBWqM3HcXr8wytUr+cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUsjL4qU34ooeDtqZ5XDsyBYG03gbuA4gp0nQIs6gYAa10MfG
	NJXZ9nbtJlXyOgJiNlyBsnmziOI1ZDyc+NS6usYQclgMh6cog8t83rVP431JDWqq050=
X-Gm-Gg: ATEYQzwLnw8+8ZEHKIV2Psd/hIr5FQbJzI6MqKUohUOAjMg/a9TNT+CEizKr6q7aFhT
	Ebw8A4GCy6wq71kDkVG3oP8BhSmpJjEv77eDHOVTd1zqcLJsC03qsMkWAvXR5W0hTSGHEgM8OOg
	pe6EtJT1y3FiAQd67NkXlYvt3GlhPyTTSYfAiuApn0lO+M4ga9UAzDn5zCKldr4RjzAakM/Odyt
	6wTQyxrbGl+sDv8yHZK1pxHeHCCKgkmOk9n9ZspxeTtsog4k2hmMMXYiCfAXQqpvjPK0V7zNEGg
	hzmc/YIDJGiCOh71V1RS/I5OJS/zDM83tAOUHQOleXZUUALq0wOtM+F5lPyCBdMbwY5mtDKioi/
	LE0frj9Aiv2ZTS8aBg1k5joNN0ycekBPrvzHuIN4Jw55tWhb/3xJd8EcNNos4qWdFPyx9Ee9zCd
	faMkI5Guv27IzsAYjBfqUdyvd87tvA8Bzw4UgfYz3vnG6GmHUKg/vlpG6owFpXSNUway4IJMVBB
	j6g0+/NRfMcO1Qg
X-Received: by 2002:a05:651c:4cb:b0:38a:3473:526d with SMTP id 38308e7fff4ca-38c740675c0mr7346841fa.7.1774658485521;
        Fri, 27 Mar 2026 17:41:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm1397891fa.21.2026.03.27.17.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 17:41:25 -0700 (PDT)
Message-ID: <d2ebd15d-71d1-4063-903c-2b5971696a5a@linaro.org>
Date: Sat, 28 Mar 2026 02:41:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
 <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57402-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 4DA8E34CC21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/28/26 01:23, Dmitry Baryshkov wrote:
> On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
>> On 3/28/26 00:29, Bryan O'Donoghue wrote:
>>> On 27/03/2026 20:51, Dmitry Baryshkov wrote:
>>>>> That's just not true. If you read the camx source code you can see
>>>>> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
>>>>> PHY to support.
>>>> This needs to be identified from the data-lanes / clock-lanes topology.
>>>> And once you do that, there would be (probably) no difference in the
>>>> hardware definition.
>>>>
>>>>
>>>> In other words, I'd also ask to drop this mode from the DT. This
>>>> infromation can and should be deduced from other, already-defined
>>>> properties.
>>>
>>> It still needs to be communicated to the PHY from the controller,
>>> however that is not a problem I am trying to solve now.
>>>
>>> If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
>>>
>>> I'll aim for DPHY only and we can come back to this topic when someone
>>> actually tries to enable it.
>>>
>>
>> DPHY may be the only supported phy type in the driver, it does not matter
>> at this point, however it's totally essential to cover the called by you
>> 'split mode' right from the beginning in the renewed device tree binding
>> descriptions of CAMSS IPs to progress further.
> 
> Okay. How would we describe that there are two sensors connected to the
> single PHY anyway? How would it be described with the current bindings?
> 

An RFC example was sent about one year ago, it allows to specify one or
two endpoints under a single phy port:

https://lore.kernel.org/linux-arm-msm/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/

-- 
Best wishes,
Vladimir

