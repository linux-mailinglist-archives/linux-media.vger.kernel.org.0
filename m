Return-Path: <linux-media+bounces-39393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492CB1FF10
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1CCF7AC806
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 06:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689E4299A9E;
	Mon, 11 Aug 2025 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7BQz5vc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62A32857CB;
	Mon, 11 Aug 2025 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754892702; cv=none; b=IzbfGQEogtq+22kIsv3GH+gM6e9NO8M7NW9IvVu2Pv5UduB8lQOM2eskwl9WwQuCw2Ue+qi/FI33UhAw13h+shLV8L5y3kubTij2+d7iVXX31sXn8/Ff2Q2l+siGZsDStSh4fc+lxRGHTwh++HVXymD09plR2k66af2PaIy2WM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754892702; c=relaxed/simple;
	bh=2pYYuFNQ9ccI34BQZgIcHr6fIRBbkyYN8gmMmukqM4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pm7KquSKkDzVMnDONANujRSm/ccqO8nUTtFYT3MpJZCuiXALl627LMwCI/th8VscALjU3qPt7INulTcMHlMRht7uZwwDa0MDQn0OcF//8Szzro4JshDdl3aA1FCD+qQir+tU5LqGSfTMnEwDCnX7s0UeG+RnqkzB4g9lDnB6SCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7BQz5vc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71616C4CEF5;
	Mon, 11 Aug 2025 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754892702;
	bh=2pYYuFNQ9ccI34BQZgIcHr6fIRBbkyYN8gmMmukqM4c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j7BQz5vco131ko2fycyjCvlPlsYEGGmG29qUXfj5j/VAOPU+XszEm+k3jUPdOABF5
	 /5vuRNMvQ+Yqd/fGCQ3uF8ws25bufVFZWPKVq5AFtOWEq6eRe3FEvcnYUqYIfEuaZi
	 rQDIjX07e1ovtBvPHpC/y5DNGexHoj7RdzsYP85+LERSYJ2sB/rdQV8+733uV9DFjl
	 EApS0xx12dRb0aRwwLQAKC46b114iQVZkrhJ3jAIydNDQLRueskKHaB1ibeqkBHxen
	 o+uj4p+slmqVBdnYHqLuv8IbKaDQe0fq0zeZX5JrpklgtVAYZ1x7WMKaVgLa8OsSTV
	 7WaWSvtjesN9g==
Message-ID: <1d71f9ed-5d77-4f5f-a4f8-6ef3834155d1@kernel.org>
Date: Mon, 11 Aug 2025 08:11:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media/i2c: Pinefeat cef168 lens control board driver
To: Aliaksandr Smirnou <support@pinefeat.co.uk>, devicetree@vger.kernel.org
Cc: linux-media@vger.kernel.org
References: <20250810192609.11966-1-support@pinefeat.co.uk>
 <20250810192609.11966-3-support@pinefeat.co.uk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250810192609.11966-3-support@pinefeat.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/08/2025 21:26, Aliaksandr Smirnou wrote:
> +static int cef168_probe(struct i2c_client *client)
> +{
> +	struct cef168_device *cef168_dev;
> +	int rval;
> +
> +	cef168_dev =
> +		devm_kzalloc(&client->dev, sizeof(*cef168_dev), GFP_KERNEL);

Wrap according to Linux coding style. Not clang.

> +	if (cef168_dev == NULL)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&cef168_dev->sd, client, &cef168_ops);
> +	cef168_dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +				V4L2_SUBDEV_FL_HAS_EVENTS;
> +	cef168_dev->sd.internal_ops = &cef168_int_ops;
> +
> +	rval = cef168_init_controls(cef168_dev);
> +	if (rval)
> +		goto err_cleanup;
> +
> +	rval = media_entity_pads_init(&cef168_dev->sd.entity, 0, NULL);
> +	if (rval < 0)
> +		goto err_cleanup;
> +
> +	cef168_dev->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	rval = v4l2_async_register_subdev(&cef168_dev->sd);
> +	if (rval < 0)
> +		goto err_cleanup;
> +
> +	crc8_populate_msb(cef168_crc8_table, CEF_CRC8_POLYNOMIAL);
> +
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_enable(&client->dev);
> +	pm_runtime_idle(&client->dev);
> +
> +	return 0;
> +
> +err_cleanup:
> +	v4l2_ctrl_handler_free(&cef168_dev->ctrls);
> +	media_entity_cleanup(&cef168_dev->sd.entity);
> +
> +	return rval;
> +}
> +
> +static void cef168_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct cef168_device *cef168_dev = sd_to_cef168(sd);
> +
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +	cef168_subdev_cleanup(cef168_dev);
> +}
> +
> +static const struct i2c_device_id cef168_id_table[] = { { CEF168_NAME, 0 },
> +							{ { 0 } } };

This is some oddly formed style. You need to use Linux coding style.

> +MODULE_DEVICE_TABLE(i2c, cef168_id_table);
> +
> +static const struct of_device_id cef168_of_table[] = {
> +	{ .compatible = "pinefeat,cef168" },
> +	{ { 0 } }

Also here, there is no such style in the kernel. It's just {}


Best regards,
Krzysztof

