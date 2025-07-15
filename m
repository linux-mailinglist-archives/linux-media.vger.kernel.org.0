Return-Path: <linux-media+bounces-37771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B335BB05895
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14E754A70D2
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132CB2D948B;
	Tue, 15 Jul 2025 11:16:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F022D4FF;
	Tue, 15 Jul 2025 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752578208; cv=none; b=YmtaEn4lIzloZ+j3tOg21By/r5Oh2RvnworZdjb8R3wziVpR7nFoKRRcMuKvgvRSTEy0ZbRcnqM2uCrmWWTby7CG3M56s5+o+Z9frrLH2Gy9mZYwnovhsCtOB/3FpkiaE9mTRDECB0umzthvBoiKG/F43Yx+iZR5HFtVoidRY/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752578208; c=relaxed/simple;
	bh=HSYv+vlxOBi997Gjh5Q/4wPcP03GK86VIwNW6IKLr3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7QXL7jDpUHTmzjKrSicnSVNZ5Gs2RV/C0Ym39QsjWozXCGQeqivRiTmxUMZxEg+m5sFUgyLjAUkns42rDuxLCV3fI8A+uYuWoqhuk2QIbfz8dEI2TQqVRe3jh5lSTLEA6nWJKiD2eb0vN+1CtemmPlDNVmtrtZgKhRNvIwYaOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E01CC4CEE3;
	Tue, 15 Jul 2025 11:16:44 +0000 (UTC)
Message-ID: <4281887a-e7c0-43bc-9e72-96f0e432c58f@nxsw.ie>
Date: Tue, 15 Jul 2025 12:16:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
 <ae0a309f-7e52-4d3c-8f26-989f22da5b07@linaro.org>
 <GbVC82h7wSXQsAJh8XybKorKYy9wupjQLndjf_uYNXOZnk1UqS_tT4Yg9gzf8X3Kn55Mt5bXfcFrHtyMoFZ4-A==@protonmail.internalid>
 <a4ebdf5c-8d4f-4994-afd9-22c8d889fe97@linaro.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <a4ebdf5c-8d4f-4994-afd9-22c8d889fe97@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 11:27, Vladimir Zapolskiy wrote:
>>> 1. This is an incorrect assumption, unfortunately it was not discussed
>>> previously for whatever reason, good news now it gets a discussion under
>>> drivers/phy changeset.
>> Perhaps you can explain why ?
> It's quite easy, sensors are not connected to CSIDs. Moreover data flows
> from any sensor can be processed on any CSID, there is no static hardware
> links, which are attempted to be introduced.

This statement is not correct.

The port@ in CAMSS pertains to the camss-csiphy device not to the 
camss-csid device, so there is no hard link to any specific CSID in the 
dts scheme here.

---
bod

