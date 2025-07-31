Return-Path: <linux-media+bounces-38686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E248B16C1F
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 08:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873A93A35E9
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 06:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169392857F0;
	Thu, 31 Jul 2025 06:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtR6s0up"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D20DE567;
	Thu, 31 Jul 2025 06:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753943987; cv=none; b=g+7nPS6clIhq6sD9fZqK7LZDkJ2oI8THFlGoBteX2SoJP9kSxhGX7Tk1sJX1GWHhU+wQYwljxkQGgZxcbysNqe7WKc4d1PyrdTsBNWHYXQeU4G5OvzzHROYnE4hEcIZ6Mi8H+Wm7qrm7D+RQ9gtead2E8KfKiyxLwedWLOv0kfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753943987; c=relaxed/simple;
	bh=aw58TVUVNwmTjfde0PsXKcqQnwaK5k8ZiN9Mxe+Ts6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLjS7MnvrzNBKJ8xOD+oHYr+KBijS9Pq5vV4bCMQxXUJz7jaZ4bVNgxD8uZ+r2lLdI5mSUr+MFM/DXPttRd8p3pKeecvrb/CvqHGKxH0w1PHyUl6D64Rt4MK3rCU9yIBoNmoSXwCAiWPBnOQeHz0QMWsk58XMoIIFTFyhV/lxDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtR6s0up; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E8AC4CEEF;
	Thu, 31 Jul 2025 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753943986;
	bh=aw58TVUVNwmTjfde0PsXKcqQnwaK5k8ZiN9Mxe+Ts6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KtR6s0upjomTcluvLgo2lD4e8MXD/yp9HfWIpVhOKKEdHk4vublDxiBXiSZjhYpRW
	 6WeVYNeC0rdvZ+SZNCjk7vkhP6qsPNhXX2nc49cVIaH3NXwFUOpwef/OCI3wj9nSql
	 7+JypanORMDtxhzE3lnZkl4FR/xw9POZQUGEZyB5hrKU7h7zwd+pkQuD/b0xtARDkV
	 WL+3eTnt5TIhR1Edm20iJGIBZ33jCuwefS8jQpLo+cWUxNPdOyiQ6oEMoDs0LIOG8x
	 81P7q3IZs06mqWkSa3ntMwQJ9e0S3ultTetLTTi/UCZPe2PZrKxmxNlJpzllnswVnU
	 Y7mh4Wb3N4FUQ==
Message-ID: <28ae1ac9-68b3-470e-9ec9-982370839207@kernel.org>
Date: Thu, 31 Jul 2025 08:39:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add ov2735 sensor
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Matthias Fend <matthias.fend@emfend.at>,
 Tarang Raval <tarang.raval@siliconsignals.io>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Arnd Bergmann
 <arnd@arndb.de>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
 <20250731061004.5447-2-hardevsinh.palaniya@siliconsignals.io>
 <28ba8a6d-a180-485d-9bfd-d5ac8783831d@kernel.org>
 <PN3P287MB3519C0DB4796E4D73411A549FF27A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <PN3P287MB3519C0DB4796E4D73411A549FF27A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2025 08:36, Hardevsinh Palaniya wrote:
>> On 31/07/2025 08:09, Hardevsinh Palaniya wrote:
>>> +        properties:
>>> +          data-lanes:
>>> +            items:
>>> +              - const: 1
>>> +              - const: 2
>>> +          link-frequencies: true
>> Nothing improved. My comments from versions before still apply.
> 
> I asked you in v4, but you didn’t respond.
> 
> Could you please check?
> 
> Link:https://lore.kernel.org/linux-media/PN3P287MB351999B4DB533CCA9C6E6567FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM/
> 
> The driver will always rely on the device tree for the link frequency.
> Without it, the driver will fail to probe.

How is it related? I did not ask to remove it from the driver.

> 
> So, the bindings need this property, just like other camera sensors do.
The property is already there, you just duplicated it. You added
completely redundant code and instead of ACTUALLY TESTING YOUR DTS you
keep disagreeing.

So test your DTS first.

Best regards,
Krzysztof

