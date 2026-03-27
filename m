Return-Path: <linux-media+bounces-57257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGV+MdmWxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:40:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 102333463B5
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E11D63043976
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2247E3F7863;
	Fri, 27 Mar 2026 14:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+YDmp8B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBFE3F7E77
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622299; cv=none; b=p4ZD5Y2YGjgP9fBdPP3DA/wVPnJpJJ02U9tWZzKwdhhfGgC3VT2iNQAldCamgY/Ag+zgCpDaOPOPLzqTsMiNd/PpyQ8emIR3LTDTYjvkt50Mz2I//QrFbaiJ7YvyUWm30BP2dTtVYjkjq0Jye7wlXUmwEUmpl2AFrM1muZOpVtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622299; c=relaxed/simple;
	bh=cJvQjfP9254ZxGBTE+ZydM3eM349poCVeRdu7qw4XpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeTsDNaLWowuOa9AVxTq1CFdcpmlcf3dNsBdYwnw3dBRmLStpRoTOpgK6zYg6ewdMg+Am4td38YhccUEp1nyhMftlJpqscFuONZ5mOQnq6jcS/PTkwshBym55co7mnSX07moHozFhY9Jlgh16J+nEzd+7XeBIkWp9tJahkinRKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+YDmp8B; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439c6fc2910so1519700f8f.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774622294; x=1775227094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0Jo0aFxcF9Ybb4MoHJTFDiEvjw/5Yz1myZV3Vc0n1c=;
        b=E+YDmp8BHGANo7DY3weMTDKZSpEWWcjnKwl/quOmHP9lgiWEJ0amXyhfR6JQnv5ANJ
         r7519bnU2pw77pkZQ93qC/lz3p9q6RzKHz+NSlEfe+IbICpkL9Ut9bwHuifCYeijVdJR
         QvoXA6uVAS2bhG2TqbBBAkOLq2L8iTvsVAGmkBcTTRJBJnnAt6WtE3RMze1iiKyS3Zoi
         cE3dtNuDW6812Gn+oQKLnQ67zQPPo645trDxihBFIOp9BqhfKfCWgZq73Jb8QLSJpS8p
         7Y0e86pAccV/v3hzmqgxbJB9o+EYaJk8zk3YEye2lYVDT0ilZdReVW8wjIFO6/lnJrrE
         HHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774622294; x=1775227094;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0Jo0aFxcF9Ybb4MoHJTFDiEvjw/5Yz1myZV3Vc0n1c=;
        b=qwTmRWKQoZUx6jcni3GNaVmtl81YgugBc5WXtG50QXfN0qTi82TBwHxkjSJftPRJdG
         mS7kpjVHjMP+tEacFgjRspcJCSoRulc3NqqZtoDYvTvk8Yur0C1l9T4kxJIelWQL407w
         Y9ZwK9zNT7nLBD7JwAwwTrv6t6ybn0FsBe++VIz6LdbVEoHHGVAW6mTBZRLxjbTxHp+a
         6uKSnNG6gn5Z4Aw0ZX+pJ2hHDcdI0ORxfxYXtS1krwTSPajjZhGoIE8+FDvJ8/yH6SAL
         QlZOGMB8bqjmxcPsQybxO+Dwdu2laww/YRDBF83ef3fqgQBAtoEj+BgrNJu29MLEH/tt
         +RaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVz12PIwEdkYCK5pvlPDKaII2dmjcSETEreyvFrzcqRflkTev2gw5Js5DVw+qiaYqAK4vECSVburqeDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpCSo+IMMrq/NEysrge/KsbT5IopPEWH94EKZOp7MDTInWon0
	LCqrZ88V60t35D3mOgG5C5uP46azZWrVCrcys88Op+xgjlH/dhkbZ+RpIESIl0eloNc=
X-Gm-Gg: ATEYQzyGmDtEONW5Yndhi7kA+rajyx73sd3rlF98nz/wrElvRWQ+0dgfvMm6UaZpmzg
	IfywZROZVKqnG8MaEMKzOF4WIa2FK4HqTYRzQ5OkShCzsZlzakRzf5rn/yBq/PYjTzkozTB2Zjj
	Q5nmvl7jadq7TKXdVn3vCkMS2Xsyw4ckUfOrw9GHgST3UamVQbLriAbESHL0EmKuKXw5xAT34fp
	WB6mYukPrtU1YSQmGETIbZKihaJwtRQVLLQFrzlzw/wznx7dce6+6i0a+qnT+U8+uKIYamvITmE
	Vu3vGqvt3wrue/PxSq8Vo+dPbo9+dh+uO8POCEA/PkQD02uVKH6sbG7GfcL3t36o8FGFjf6dMiO
	kgF3xefkar13S0pRuuAoJHD9HpRJ3hcAFVqlVdF2MtjzKcU+ezLRTXbxNRuk9MH5pQy+99e/QO5
	S2ofglfCcIqwORXU6aCIpgkCFkMfqKQD7vu9pg
X-Received: by 2002:a05:6000:1ac8:b0:43b:8858:1146 with SMTP id ffacd0b85a97d-43b9e9fad6dmr4533166f8f.41.1774622294053;
        Fri, 27 Mar 2026 07:38:14 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.214.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm16761200f8f.27.2026.03.27.07.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 07:38:13 -0700 (PDT)
Message-ID: <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
Date: Fri, 27 Mar 2026 14:38:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-57257-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 102333463B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 10:07, Konrad Dybcio wrote:
> On 3/26/26 2:04 AM, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
>> capture those modes as:
>>
>> - PHY_QCOM_CSI2_MODE_DPHY
>> - PHY_QCOM_CSI2_MODE_CPHY
>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> Does the_PHY_ DT node need to be aware about this upfront?

Yeah that's a fair question.

The standard model is to pass the mode via binding right now. You 
_could_ configure it @ run time in principle.

And you could even conceive of a sensor hardware that might find value 
in that - but IMO it's a 100% hypothetical use-case - you'd basically 
need an FPGA that could output CPHY, DPHY or for some reason SPLIT_MODE 
DPHY.

But that's a pretty off the wall use-case to hypothesize. Split-mode 
OTOH is a board-level physical reality which => a DT description not a 
runtime choice.

> If we have some sideband signal (e.g. the sensor driver specifically
> requesting C-PHY mode), we can simply throw all this complexity into
> phy_mode + phy_configure_opts, all at runtime

Like I say its conceivable but IMO not a real thing and unless your 
sensor is an FPGA not possible to support in real hardware.

> Further, the combo/split mode may possibly be selected through
> aggregation of requests.
> 
> The question remains whether the sensor should have a direct connection to
> the PHY itself (i.e. phys = <&csiphyN> or of_graph straight into the PHY)
> or whether it's going to be translated by the camss node (which would be
> the one holding a PHY reference) - there's probably surface for adding such
> negotiation logic in both places

To be frankly honest you can make an argument for it either way. However 
my honestly held position is analysing other upstream implementations 
connecting to the PHY means we can't make the PHY device a drivers/phy 
device - it would have to be a V4L2 device and then for me the question 
is why is that even required ?

The model we have right now, right or wrong is sensor endpoint to 
controller. Similarly the <&phy MODE_GOES_HERE> is a pattern Rob Herring 
suggested and IMO is a consistent pattern we should aim for upstream. We 
see it in latest Rockchip, Cadence.


> Note this is a question and I'm not aware of all the possible combinations
> 
> Konrad


