Return-Path: <linux-media+bounces-48671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F155DCB793C
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBDF0302D288
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 01:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFF6286410;
	Fri, 12 Dec 2025 01:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ki65VuYC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A41E487;
	Fri, 12 Dec 2025 01:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765504192; cv=none; b=Cn3S4hDWd6jvuJ1GRUHRxvhmFaqd/hiqyGL00uASo/3LZOkMdF/Og4bq+5xa21d9WKUjvpDkNbxgw5yZEva/sGEarLzuOP6LFvCLH7skXnUJ7h7foMqfcylFRVFEv+wwwp3vtmm6eP7fSMIvU0DLVLTp/l0zAm3NayqpisKanOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765504192; c=relaxed/simple;
	bh=BHw/RutHHZ4jE7W6Xa1RAaTNTX1OqWmUtXNlhThVYeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fR7uTytgUhOos/ADQQWEeg+OzOj+rNk16V713AHeMDb0Wc0s5y+Z0rXI9tdhX5MVXY3C6hgmbcdaLxZeL/eGGqByLY7KQhUDbse3HrhAp+0A7ZDxIconu6TmiXpQSgdnzxPwSRcV1IymNUUtn/n2+btRDNKQ2SrOQYE5BXtpcw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ki65VuYC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D555BC4CEF7;
	Fri, 12 Dec 2025 01:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765504191;
	bh=BHw/RutHHZ4jE7W6Xa1RAaTNTX1OqWmUtXNlhThVYeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ki65VuYC+s9J9CponjDL4tqn1qrG3awCQ5xucFAUErPKDnmR+i1boFmnmc2nBeBeI
	 E4RnT5j5Gw1AhVJMeCd+nHvzdlOnlX2Vjnoa6upXCEiOEOegpi+oZhwmm/DYVuJUKY
	 kfP21fAOv8VZM3eNfWjpWD5NIsqC/R8Gaq3yY6PtQNN/cVue0K3QFSMZ41kq+m/xlI
	 2/xjEsbMLjzsTG5WibiYwbbXOfRigf2w5uxQ9FfY1P4HLGP1+ltTS3Fj4UXdHKSOFX
	 1p4Bdy8/P9jGif5ozGwehlQL42Qzu1hztlku8RgfrGBvTcX7dbQJS3qmU8eLHMpkPq
	 6kI2Wr9MVIpUQ==
Message-ID: <6d6c3c08-5e99-4cfa-bf85-b664770f00bc@kernel.org>
Date: Fri, 12 Dec 2025 01:49:43 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] media: i2c: imx355: Support devicetree and power
 management
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <oX9MH9S_YbvFY2xsd7jV6mW7fOQelIb017TSAlCIyunLezBkBasAcuVmvP-CURoqU__oSSH3483zd7AjVdQ3nA==@protonmail.internalid>
 <20251211014846.16602-3-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251211014846.16602-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2025 01:48, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of power-managed resources such as
> the reset GPIO and voltage regulators can be specified in the device
> tree and handled by the driver. Add support for this so the Pixel 3a can
> use the driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/i2c/imx355.c | 118 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 110 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 776107efe386..c225bb8959bd 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -3,9 +3,13 @@
> 
>   #include <linux/acpi.h>
>   #include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/unaligned.h>
> 
>   #include <media/v4l2-ctrls.h>
> @@ -125,6 +129,15 @@ struct imx355 {
>   	 * Protect access to sensor v4l2 controls.
>   	 */
>   	struct mutex mutex;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[3];
> +};
> +
> +static const char * const imx355_supply_names[] = {
> +	"avdd",
> +	"dvdd",
> +	"dovdd",
>   };
> 
>   static const struct imx355_reg imx355_global_regs[] = {
> @@ -1515,6 +1528,54 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
>   	.open = imx355_open,
>   };
> 
> +static int imx355_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(imx355->supplies), imx355->supplies);
> +	clk_disable_unprepare(imx355->clk);
> +
> +	return 0;
> +}
> +
> +static int imx355_power_on(struct device *dev)
> +{
> +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx355 *imx355 = to_imx355(sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(imx355->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
> +				    imx355->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		goto error_disable_clocks;
> +	}
> +
> +	usleep_range(5000, 5100);
> +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> +	usleep_range(8000, 8100);
> +

I'd suggest taking the chip through an explicit reset sequence - 
including appropriate delays here.

The code as-is assumes the reset line is logic 0, which it may not be.

Better to whack reset, give some reasonable amount of time for reset to 
complete, unwhack - delay and then off you go.

That way you've put the chip into a known state and probably you don't 
have the documentation but, if you had the documentation you'd see the 
chip mandates such a start-up sequence anyway.

---
bod

