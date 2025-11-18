Return-Path: <linux-media+bounces-47306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE23C6A2C8
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 16:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EBB4F36588C
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 15:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3660536405C;
	Tue, 18 Nov 2025 15:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKuh0xHW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0A36403D
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478025; cv=none; b=VuQIAeBvIk1C0+H752iYtO3HR6NYWbkL0PVPCh/oEh1oRFUgTnMt8LjSCIQyFirXpgqg4l7zt0UC4dzQ1da1UKu0DUQofagsG7TaHyFYC7jE4T1XNBGNHszw4J+Ky2m8iB6CxdWixeC+wHvqSaXWU8biE3D7MmgGkn51z3mNDns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478025; c=relaxed/simple;
	bh=yYBIMUYPEMQkGXlIun/Z5XghzFBT2+jZnb6mvUooXYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izGx6tySmdeiKBwAYu93I1ghP+3CURPTypS9BlUCNkFBy+ErnhA5knltwUCOdmeoaqLppp0amINAbadKd5VRnERCFfp5TPBJG5U+PWeJ8JWDtj4nuU0PzmwycW3OXubn5jwDG0vKo3xJaaU3dB0ZeBDz21OTc6iVZhj/SpDmNcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKuh0xHW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso8527635a12.3
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 07:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763478022; x=1764082822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6ycbeHCv6YzVBfiihvNrBQTxTs7GIypa/MVav3f8pE=;
        b=rKuh0xHWyB7JqCwIBvmmAqR4ygE3xvBbpD2tbDnnpG5h8K3b+OxsL4PHDAooxaKHx4
         gS7P3vIsXlUVzeamoTgNAXIU6xAHSCXvFG4si7YXwxk91zX9VW+OgjXfhrhhIcBUH+9g
         JXynzdDgTm/5K2jBKDQ/euvBa2J9WSZ5UG6DWnTuuUpVzdisjs/Nh5XMqV5N0QdT2uJA
         AU6tlwuZh9Y6F+IIRfZtmJ5ZfhpcIwnOhTkvAkJQzRBQC4RcCFz0syEPa5DJzPD1l5fg
         T7lszg2+oPqXzsr927p2cyjgd+1Q6hWeOJtHbbTV3YmCzRGZboEudvyRS63eR0UzvUCe
         zJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478022; x=1764082822;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6ycbeHCv6YzVBfiihvNrBQTxTs7GIypa/MVav3f8pE=;
        b=hwc4akDlaRzsl3INpJh9SsiGmHMHOQC6T2tn+8/u1DkXg9dTZUtF4oWkW5yBM5MzA/
         F8dlqDk74orYeVJuBeg4e6qGYHSaa4SNJaeK+zIwb8BBxvfLMioUMjjbLdimJYXhyyGY
         IMJNzFGq12DO9yE6ZAmwepk8aT+dZO2w/nC0cVKtrQJ0GZLCuB2EpEaNS8Yrd4wUdGtR
         D7kABG+N6yXUjZLWsX9gIkO8pwzhUc9b+BKN01oqkEA+5cm+0VOItIWI3/b37G9rZaEH
         SXyRXripRmJF1MC/PPwS339QsemeqYefEvYuLF2xSsMKbr/LGSKzYpDKB9dGY+5Rmw4n
         0Wtw==
X-Forwarded-Encrypted: i=1; AJvYcCWRcXLfJxiiz8KCObGRJCh/ii0wWCVnsNh3Fzy5SUfXrFlV3PEP6Vh+ADe+2LPo1j/FLKuHq/NrF91QdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nRnkBRC9kxWJ+OKDfQkwpzPqdXJ6rz1qLr/2caQJYsyPZQVD
	sXr7ELpOnTaXX+SKHjcYP21VkNLvRPrE3Jqjal3R2tyBBSLTuh8ZuRTG9Hcr5ro+Yvo=
X-Gm-Gg: ASbGnctrdmLqws9kvcVVKTja8Vuf2xcxYIBPECKc5LHO+RZGHXqwG5mwTj1z0GSuEiz
	r1pgXmqvswz1BdtNhORakUI0H9OHZ9V/NUc2q80lNdlVX5jSNacC+AInvgXUF1ZXHaCdtoT2k9m
	iVgEI3ze3reYBzhSgceaCB9jHkmNvbQWUSBtesyfoJ8G1z7hYHpWkuRTbfEGyuZtk4VZLXSJ8Dm
	EkFRr00VhqNzqfZ+KZPNE9sPDygDBdCJA9EZz/0RGUKHGDVHMPlSRPMcj8RbRvJhWZxq/BtfmPp
	FdopdFWBP36Qi7E4jpSezgJRR/yppi5utQE+UiI4KG/4nprg+fLjV3tSI9qFXPMNr6G70qpUbTx
	oU5iWG9QiobLt24BtqKQSyvmqjbldSnEQWtYmDBpznX9oZUr8QdRrqL9+marwcVGmKAj866Ur/O
	0ZROdmGUdRN9FD+Ka8Rbr/3uITw0BPtBtMZlcwFVGd5w==
X-Google-Smtp-Source: AGHT+IH+SRzIG78Le1UGkTuOPhMOU5+HcBSFJxx8Le0nV1kHbKsPT2vPJv/0gTUUe2wMNoZCRo3Mcg==
X-Received: by 2002:a17:907:980d:b0:b70:ac7a:2a93 with SMTP id a640c23a62f3a-b736793d8demr1658422566b.43.1763478021813;
        Tue, 18 Nov 2025 07:00:21 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad456bsm1398335566b.21.2025.11.18.07.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:00:21 -0800 (PST)
Message-ID: <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
Date: Tue, 18 Nov 2025 15:00:19 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
> +                  <0x0 0x0900e000 0x0 0x1000>,

Why aren't you starting @ 0x0900e000 ? seems to be omitting some of the 
registers in the ICP block. Should start at +0xd000 not +0xe000 ?

> +                  <0x0 0x0902e000 0x0 0x1000>,

Same here.

> +                  <0x0 0x090d7000 0x0 0x20000>,
> +                  <0x0 0x0904e000 0x0 0x1000>,
> +                  <0x0 0x0904d000 0x0 0x1000>,
> +                  <0x0 0x09057000 0x0 0x40000>,
> +                  <0x0 0x09147000 0x0 0x580>,
> +                  <0x0 0x09148000 0x0 0x580>,
> +                  <0x0 0x09149000 0x0 0x580>,
> +                  <0x0 0x0914a000 0x0 0x580>,
> +                  <0x0 0x0914b000 0x0 0x580>,
> +                  <0x0 0x093fd000 0x0 0x400>,
> +                  <0x0 0x093fe000 0x0 0x400>,
> +                  <0x0 0x093ff000 0x0 0x400>;

The rest of these registers start at the defined block addresses in the 
documentation.

Unless there's a very good reason for that, please amend.

---
bod

