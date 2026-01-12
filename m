Return-Path: <linux-media+bounces-50461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDF7D1277B
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 13:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEADA30773A8
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC56357721;
	Mon, 12 Jan 2026 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="km1upu8c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0733570AE
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219715; cv=none; b=s1BRBCAOFCUMYawRVvqP0Igr9WSn8m4RXgIOd8cVlNFBdUMldU64/+kZWj5aAPFOPTuGDps/F9muoOFwVfAyCIjrN5mkyvBew0zuV/yFjBrkfs1mKZ0H3SEdw0myEPFdP2w3mBbH6Gu6dxfoenhb52NMs6ImfVV17/2TEdbYN2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219715; c=relaxed/simple;
	bh=oXDBiD54nDhDPSl9qGLWo6F/JzpP0JIj6oqpvLcbyyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fso9BVOaXYXXB3M1k/XdJAECYsNjoSIkzlrbiYdogL3HksndV37nrIQ3rJHBXwAF2lP56pXtMV/N6rmFqa4rk63reo5/u2A3BE9yjRkFxav4IzRAqHTgTEa0KEaDO4sslsVm/gY1K45Kn9UHWMNJh/cjNWyIeuV69lFKOLf2vws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=km1upu8c; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so2973788f8f.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 04:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768219712; x=1768824512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Frq2FNvpHlVXL9K9cW2q2Tna3UfQNHXR0J95x0vAQA8=;
        b=km1upu8cUJgurKkfaL7BA84qGSIt3XlcBD3CR5T1fH0Ld2bFDQqB4MYqhjPlx4grea
         rZFhvD/iVpWQSEIqTkE7PgNJEcPZaDJy0dcl0w/IvscUfsxNMsRMFjJori8pAIoDRPlI
         8HBbtjhn0bjEKwRYX0C003TGZtElng+ga8L83uLPyG/s3LdQnovE4tRcuzX8MIDIx8+3
         NsZ/IYISuZvFtsvSs2NVRJ12n3QmxWYvax/fqi3gIMXnx65PCJItdws7HfjJyWwXHTHo
         rwMpNpuvKz0SD2K3heu7krkeKNE9ZwdrUtquzaSXW0I0LulADIGORPWCFDFlyuO0wHNd
         zk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219712; x=1768824512;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Frq2FNvpHlVXL9K9cW2q2Tna3UfQNHXR0J95x0vAQA8=;
        b=s6VCF6+ZVygp+CQ/uYALPhLK9DSUe0X74EbbwWgmE9/B7kLeQHxe4wzDNYQuXkBbbS
         yZLsY1iVumBA9w8a/PD4d2xkML8DJMdVTpemxHdSliIoUM7CKzjwvSPOB7uvce+s9G00
         3VqixB5beTF+wtpb5oYwaZ3arrHaEF2xwfQt5IVtwz7UyHCHRWWNO14w3eWhoNLsQUpX
         7ZWDQhfgVgR7s+pioh5p58cEsHSzyVuebeELa1K2VmGfbBTpWEwCYbGCAGev3S3ALafd
         ySpoCPpSqm+32kNp/8zI/sWQoFH+K5YWnc72vOl6xOZe9ZMlFQgq60IB0G9lcY/B6bTb
         LUBQ==
X-Gm-Message-State: AOJu0YwXHNwjHK5gtqiHlo7rH3GFByTvY5DAEOVSrTN/UVeNKH9Un+mT
	+fJ8FdzkfeFBeZ+NOT0HBFrA2BzZrenCZ471Ey5TX0kV1ZxHcKe1Lz7YBW02JO1+g9A=
X-Gm-Gg: AY/fxX4hMsRRMvpN6UIv+OP6BiXj1sdZYBteiNRyCF/x+x+BagnmJDL1nqERekU8BHQ
	hnJUeI1yOyXmTizVKQgev/4SG5MkID/3XOI1ZjSePsAh0zzabCUia/EimI9VoQxFm2PVaCR3GVP
	CxsuVjtP3iMiMfr3suFnCpJw9tfGdlWfkZ143CjQqFcCCGjrTJYOyejaP7iVmY/DKGe0wm20RPW
	Z8TV54TkRre7LLmobwvNmTLAQ42KFnlSODrp7r5l1+cW/s7X1pkOQfh4NqLBKRtYSgukoKWLpWi
	sfDN0szGJ66fbF4NNSZZ7Lc+ILfEhYkQVUINbpZ5sy5KyPTeR7Q2TghV6xkdat5rz1ReGFsPxOT
	NpO66nTsPIKCo4+8utgnLa1CZOso1D0banWteRs1PQUtCSsOhSM36aTbUlc0YQ32QcJjnoNsA+M
	cWwaB/MMosntoo8M4SbEl/zhKMxiDK1/rdwQt9r12rv6mDLRQKkgtw
X-Google-Smtp-Source: AGHT+IFdAoVE3LMMfr3WXuJgeaok1n+ZKYXo9Iz2QvBceUMpdDB+n1lzEDB7SDTGntMbA+ArREk/bQ==
X-Received: by 2002:a5d:64e7:0:b0:431:7a0:dbbe with SMTP id ffacd0b85a97d-432c374ffaamr21755981f8f.32.1768219712153;
        Mon, 12 Jan 2026 04:08:32 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm40635361f8f.24.2026.01.12.04.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 04:08:31 -0800 (PST)
Message-ID: <8d51760e-c9ed-44a5-873b-d96824d173ad@linaro.org>
Date: Mon, 12 Jan 2026 12:08:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com>
 <20260112-kaanapali-camss-v11-3-81e4f59a5d08@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260112-kaanapali-camss-v11-3-81e4f59a5d08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2026 09:02, Hangxiang Ma wrote:
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy0-0p8", "vdd-csiphy0-1p2" },

The convention in this file so far is to add new entries at the end.

Since you need to v12 this, please do that too.

---
bod

