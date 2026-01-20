Return-Path: <linux-media+bounces-51103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF816D3C331
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 10:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B99BE4EA25D
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 09:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4E53C0081;
	Tue, 20 Jan 2026 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTvt7D3g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B888D3BB9FB;
	Tue, 20 Jan 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900230; cv=none; b=B5oXGyoV5lAmsyafiTsPrKaZ61eswlDiqx08amUiH7KqGJsMdy6NJBeD5R6GmdOx1ipW9g+Pmqjzu27KKoUZF4hmzqXjbU6vXPICje92tWecXVvDmoxq37TNYJjoEt9Dh0CRMbJAC2UwZr6EMVhTXe+1hD+7e6OknbqOmVpDNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900230; c=relaxed/simple;
	bh=SEsc5vd/CRQFuX0hPxahszxSaeM/0iFnITsxxLFg5GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUgSJ4pXvGfRrhtnyv9G4lwIFXAPG3DOoXri8WhKqD7dHn5RrSmgK53aGasgjZtDO83287dYujvBeLV+YQZ7TPTyrLvXoMFxAQLk8n8EESUBnTh6Ux11bBzaaIosDcngQZzB3aLf2iYd37ZcZsBP7btjzazm/7F9l0TaLViK12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTvt7D3g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B74C16AAE;
	Tue, 20 Jan 2026 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768900230;
	bh=SEsc5vd/CRQFuX0hPxahszxSaeM/0iFnITsxxLFg5GU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aTvt7D3gxX2sn1p/Blr5L5116OphcovythP+JvNTGymqn6bM9OIhCMKrBD1hVmliz
	 g7xouVSrdp6GHtzTeIOm/xj8JdWNh8ARr5NJu5L9K6LwA8i0jW+UVYckyx+SDGAXz5
	 673EwmKcJIhqfbu5e5IOgq5pRLCwzzqOgNIg847O5dvsbr4hdhP2OsZdTZwqsfwpwd
	 sztAcMdrwQAdprVbyQ79K8JgwNPTWI4BWHc1iS2HLE3fnD22cTr9qPYg8Dg2S0Xjab
	 cOyfpli1iuZJFTUGG97sDBRTgFEIWLSIFuxMrBW/ssH6SArdq2c/tgRLzsDiDRgvC1
	 Xm4YIyFGugWvA==
Message-ID: <4c7812bb-efe5-4050-b587-4a21b131481f@kernel.org>
Date: Tue, 20 Jan 2026 10:10:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Robert Mader <robert.mader@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <a29ff1e4-117c-4703-b0c7-73ad4e369201@linaro.org> <aW77kXzBjAlIMG1C@rdacayan>
 <aW8whjXGK-rXHhlc@kekkonen.localdomain>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aW8whjXGK-rXHhlc@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/01/2026 08:36, Sakari Ailus wrote:
> On Mon, Jan 19, 2026 at 10:50:41PM -0500, Richard Acayan wrote:
>> On Sat, Jan 17, 2026 at 02:03:02PM +0200, Vladimir Zapolskiy wrote:
>>> On 1/17/26 06:06, Richard Acayan wrote:
>> (snip)
>>>> +static int imx355_power_on(struct device *dev)
>>>> +{
>>>> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
>>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> +	struct imx355 *imx355 = to_imx355(sd);
>>>> +	int ret;
>>>> +
>>>> +	ret = clk_prepare_enable(imx355->clk);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
>>>> +				    imx355->supplies);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
>>>> +		goto error_disable_clocks;
>>>> +	}
>>>> +
>>>> +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
>>>> +	usleep_range(1000, 2000);
>>>
>>> The deassert above is not needed IMO, anyway.
>>
>> This assert is for clarity, otherwise it isn't obvious that the GPIO is
>> asserted low when the function is called. It should stay.
> 
> I'd also remove it: it's redundant.
> 

Not only redundant but confusing - function is called power_on, so why
does it try to perform power off/reset first? If it was called reset
then maybe argument of code readability would stay, but here not really,
especially that there is a power off function...


Best regards,
Krzysztof

