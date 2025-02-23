Return-Path: <linux-media+bounces-26704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 917FCA410AD
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007BB3B7715
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B422615855C;
	Sun, 23 Feb 2025 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="EIAQcBWY"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F8126BFF;
	Sun, 23 Feb 2025 18:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740334196; cv=pass; b=sOyctJD6cMrqwfx0fF3hcWr7fHdBpxSnU8jS/eN2xSxs7JS+4FFIDjL7gasoS8RXtAxgDGsve3sd751RgJfkaGNE817fF08ruvSNFzXCWvuYdaWHoCxvW3k3oZ80lduf9S5c09ySxKG9CbnU94ziNTtoNMs5AkfKhCilLQQcyo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740334196; c=relaxed/simple;
	bh=bOQSOrARySaMAwodfsrHrHkvjaEAHlGCuxXaCpvp+oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GC1fghDHgNPvBNhHQ/Ooh92aO/mu+7cX7yUXbDRdbz/Sisa4PsgJNy970VatVzASTv+UkDDC48pYGQEuMazXIFmT6+6Tv/ZBC/wIoG4CIRW1bW0wONSPm8e9oW7E66XB/hsQa12z3kAPICtDYJ6WPt3zgGVKpOSVfTe5NBiV59g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=EIAQcBWY; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740334146; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lR5Xpeon+xZfR0YEGEAoMO0RxcL4DBk2FyX3X15S12bxI6eGecjDvNB4A0wiRL90WheCfjgrgMPkSrcwNLfrL1Wrn9FdgJhKev0csn/0UwM7aMKodWyVaVSKsgnXH0T9X2hhkLgmRWUl265F0yGiFdE8RPe3hJL5v7OcOe2IVaY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740334146; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0PhFMKLaP4CnNVQFwAvqdp7PveYbLnvH99BPyYvIqPc=; 
	b=Bgkn8Un/4vKxVly110XizM3t8o9kTG7kWPZRnUQ8hqzteku9ZUa69BFu6+NdTfD5u1WZT19vbnXKUNCBXirCImo2ltaHDYSJUACVdjB/RPTtbdOzFzuuZA3e2VujjRMil2SO+HgfaqsAyLU2OKxSwmKwqWc8Egy6XudbtZ+hXXA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740334146;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0PhFMKLaP4CnNVQFwAvqdp7PveYbLnvH99BPyYvIqPc=;
	b=EIAQcBWYiLAb8CbsnvEyjvpz3qVQgoklsuraEH0D0uzngfXEI/kD2i74Zheeho2V
	9RhKHFnqwj8TvkoPGZrAfI3aV5cAqI6I/Gv3/lnACCVU5I6CPXC0E+USSIjBQHz1TTd
	woLuBw8GBjxZwHExL8Jrm/CyBhlY8nyut90HAlvw=
Received: by mx.zohomail.com with SMTPS id 1740334144187513.9514643088662;
	Sun, 23 Feb 2025 10:09:04 -0800 (PST)
Message-ID: <c30a291b-c81b-4da1-a0ae-270d323b28e3@collabora.com>
Date: Sun, 23 Feb 2025 21:08:58 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250223173019.303518-1-dmitry.osipenko@collabora.com>
 <20250223173019.303518-5-dmitry.osipenko@collabora.com>
 <88b02c37-6741-459b-b966-d6d58d1f9b6f@wanadoo.fr>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <88b02c37-6741-459b-b966-d6d58d1f9b6f@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2/23/25 20:54, Christophe JAILLET wrote:
> Le 23/02/2025 à 18:30, Dmitry Osipenko a écrit :
>> From: Shreeya Patel <shreeya.patel@collabora.com>
>>
>> Add initial support for the Synopsys DesignWare HDMI RX
>> Controller Driver used by Rockchip RK3588. The driver
>> supports:
>>   - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>>   - RGB888, YUV422, YUV444 and YCC420 pixel formats
>>   - CEC
>>   - EDID configuration
>>
>> The hardware also has Audio and HDCP capabilities, but these are
>> not yet supported by the driver.
>>
>> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
>> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Hi,
> 
>> +    hdmirx_dev->dev = dev;
>> +    dev_set_drvdata(dev, hdmirx_dev);
>> +
>> +    ret = hdmirx_parse_dt(hdmirx_dev);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = hdmirx_setup_irq(hdmirx_dev, pdev);
>> +    if (ret)
>> +        return ret;
> 
> From here, should of_reserved_mem_device_release() be called in the
> error handling path, as done in the remove function?

Indeed, I'll make it to use devm.

>> +    hdmirx_dev->regs = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(hdmirx_dev->regs))
>> +        return dev_err_probe(dev, PTR_ERR(hdmirx_dev->regs),
>> +                     "failed to remap regs resource\n");
> 
> ...
> 
>> +static const struct of_device_id hdmirx_id[] = {
>> +    { .compatible = "rockchip,rk3588-hdmirx-ctrler" },
>> +    { },
> 
> Unneeded trailing comma after a terminator.
> 
>> +};
>> +MODULE_DEVICE_TABLE(of, hdmirx_id);
> 
> ...
> 
>> +    ret = cec_register_adapter(cec->adap, cec->dev);
>> +    if (ret < 0) {
>> +        dev_err(cec->dev, "cec register adapter failed\n");
>> +        cec_unregister_adapter(cec->adap);
> 
> Is it needed to call cec_unregister_adapter() when
> cec_register_adapter() fails?

Yes, it's confusing, but unregister is needed to free the adapter
properly, it's prepared to do it. Thanks for the review.

-- 
Best regards,
Dmitry

