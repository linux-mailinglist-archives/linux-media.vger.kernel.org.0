Return-Path: <linux-media+bounces-56746-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIQdFVtRwWnLSAQAu9opvQ
	(envelope-from <linux-media+bounces-56746-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:42:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D202F507E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19590308D344
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C758B3AE704;
	Mon, 23 Mar 2026 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lb8LHQlb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E33ACEF1
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276202; cv=none; b=pM/rhd2N70nCnU/n7COVcozLKgYRBUxgsqJpkpWh+zHay8uTbpOsztOgd1BxNVJSkAQQYQemIaEv+OmHkM5htXPYcgltJxjzcWKovQzvs3CowFkSKUk27WEbhDQ49Oc9X/+WIt7XaQl8xWwNqsMtoR2mR1bMGJNtX5ZSgZ0HcHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276202; c=relaxed/simple;
	bh=L9ELsUTCwMNy2+pfr3ESCvpylSNoN2JspHLhkSAs054=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kk/vbmXWp1kMJdpxd4zN9JA6k5hLDnrh15l+F2tCWHV1CwMClVqurGEqhAef4OdNmchHWaUUUMzWvUM9lIPPNMYdm8AvDG+gkh6rybsGdxRD6TolL3SgvbbZ4nfJAYZ4O9P98qbt9wbkcfwKb2mJM/zg1OEPFaCUihPOrJqEbDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lb8LHQlb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso26085935e9.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276199; x=1774880999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWptjvE5w87hMNihQLfqZsM0Pn6ChnKPjJO5RmlXBPI=;
        b=Lb8LHQlbKCo8jnCkYk0SS4Sk8py8AGYKtQSSS8x/8BzBxO+yznjbRN4EE+Oqp597r/
         fPdxnn3QwpnDC+626DI0u33YaFEe3IL9ZsE81A2HnNGjXUKZ764Q+YtDMg4YRCwnchm1
         5I9e6+S0g6WHKTw8tsfPSYm94spwnD+sNmp+dCs1Do81gZmJ7rd2sNOAV8WH6/jxd6Vo
         0ALUlJxM2V0VNCYnXsdg46wcmVIQE2Dc3/GrDNjmbEMuL/qeiMkxIPHR6CiIcKfIgOiz
         VsDIVaQEGPoS80YsgNWPhRnttJY0EInETY5bbl0+CyfKOdH3MdVEbMYP4xalRS0ZPFKi
         6nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276199; x=1774880999;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWptjvE5w87hMNihQLfqZsM0Pn6ChnKPjJO5RmlXBPI=;
        b=VOrOMKPwCreYvL9krjsc9u9gMxqxp+rD/Rvi+oUt/KsIuFNLx8+JkxXW/YF6nSjlwS
         0Laaz81Ce8VWpuGzCE+dnmSKrhsRjcBtJCM2Qq4CwK2Fye4I2nJxaqh+U079qWoG5a6A
         mgUeoP4yRxVgFJ/LiJIVS4DkDF0Z9KWl/Pw7r7jj5q4BtIzYzCr2YceSchMfSqKmoXQe
         xx4v/W6PVERIzB15Af33vc4EdGBFRhZW1gI/vvrQGIT+n4errjd5BHRS3GLs7TlzQf9b
         r96mwaM7Hz8KT2wFQbV4t0084ecZ9KJ8p38dh0tQFfjrlM7zqCpcfyhcNEF0+JALuZQc
         TQcg==
X-Forwarded-Encrypted: i=1; AJvYcCXpExhIPJOsXRlc2/9H7xpaQQHcXeWT5MsZVNf+GDj1we5vJUrerctvPI2NWuJo2FSqP8x3I1nfilVuwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiW1jf+gApP34pHhCM2Swluu/ixh5wDmg8jZLZUJfymGvdrQE8
	QvEiYLgg6qidK1OzdKb7cqkdC7+lJ7i7agjG/ltvSZ6ZKhP8vUkb+7kM7miBRnB7YKQ=
X-Gm-Gg: ATEYQzxcKyvHjwGF1Wp6bueRzwN3cxmx07NNkaAcvhCRcARKjK+BrEepaqn7i8sx5CV
	bXCYCmV3Blwg8G+6hrKOa/RHUit9VO4km/28urDKxeGNet8MqiC15mDqV7xsceIKLEnK1z58Wb8
	2h+E+Oh6dhEhbEx1kEJgR3OTFjZt3G6kpGgbW2mKFO7UVZkPjjEZIyBSsBaJnq4EW/U6lBrFdxl
	W8ZNDlk0povTG1gOkJ4o1sArl+niKcCr41sy93NR35mLEAKC6gK+WK7nq5Rmt52Z37AZcW3Qnpi
	OBNngMc5pmTnx+hJh30yyKcLfC+AaVeIjYIWjzv+pirmUFeQLo6BbBze4lEkpWvx6ARi06pdKyo
	rbzFFKh9Y5wVJk2znxfyW5GphqL1PQrKri6AZwKpIEg6I9WLiuIQ2Quz8KUANIYwgIBXAZ1Kzzj
	n6Uhd7srs3EX/9rHcqbT2NVflamMzlIYxUncbh
X-Received: by 2002:a05:600c:698e:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-486fedd80c9mr156967985e9.13.1774276198953;
        Mon, 23 Mar 2026 07:29:58 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.102.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe967c64sm280452265e9.2.2026.03.23.07.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:29:58 -0700 (PDT)
Message-ID: <8acb3888-0ef8-440a-a680-14478bba3ed1@linaro.org>
Date: Mon, 23 Mar 2026 14:29:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
 <3VqSGUgMUKaCja5WYOrOP8nJ_mw_eDPdItA8d1CvqUg4ASPS5IUc_aT2E-XIo0YmnYo8QltXVw8_6NDxtdqGGw==@protonmail.internalid>
 <5705b48a-fc24-4c5f-aa6d-40952f0070d9@oss.qualcomm.com>
 <edf766b8-2664-4dac-b626-551807b3e5ef@kernel.org>
 <4afceefe-8053-4c10-8595-39dab9379aab@oss.qualcomm.com>
 <4b1b5b79-df37-499e-99c4-1a965a9b2455@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <4b1b5b79-df37-499e-99c4-1a965a9b2455@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-56746-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E9D202F507E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23/03/2026 14:22, Konrad Dybcio wrote:
>> Sure, FYI: Dmitry, Konrad.
> I'll admit I haven't yet read up on all of the background discussions that you
> guys had on LKML, but*if* we're going to put the PHY under camss, the GDSC and
> CPAS_AHB/CAMNOC_AXI_RT references should be unnecessary, given they're not
> related strictly to this PHY itself, rather it sitting in a specific corner of
> the subsystem that needs them to be active (see related:
> https://lore.kernel.org/linux-arm-msm/cb2430f2-8601-4c72- 
> af6b-10f1ff16c188@oss.qualcomm.com/
> )

That's fair comment with the PHYs inside of the CAMSS block. Obviously 
if its outside of the block we need the full gamut of clocks defined.

..

Yeah I think I'm happy enough to drop these predicated on sub-nodes.

> For the other names, I*think* we won't need to rely on them (i.e. only operate
> the resources through PHY APIs from the V4L2 driver) and can come up with new
> ones. And hence I think we can turn "csiphy" to "core" and "csiphy_timer" to
> "timer" (because we really don't need to repeat the csiphy_ prefix)

Works for me.

---
bod

