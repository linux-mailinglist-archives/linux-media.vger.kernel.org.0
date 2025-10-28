Return-Path: <linux-media+bounces-45878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9AEC16BBA
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 21:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B4384EFA90
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 20:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C603134FF50;
	Tue, 28 Oct 2025 20:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXmU5vDF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113C70814
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 20:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761682160; cv=none; b=PnCzoUCbeD9J4jrSnr/DC7fL8ZU5PSyKbmhXXoctGHkfcV9D6oZeqRWPGM5YQPmP7oJmDiuw9McpYHyDUkIT2iQ/n8AOTWfBSVOBH1zFGA6ZvNFkaCKfqQt0be89YOIiyW/D5oEDXrT98U2OVEGtoUD4aqQfbdRw0Gpmc5umsiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761682160; c=relaxed/simple;
	bh=CHNd/FW9/q9aUHITxts7CHIoFbOGRMsv9XovJrpvK+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFdzTS7apPxjDxw3wpLPzXupZO74IMVEbBfkFN4wT76WT4ZuNeaHXhJoJmIhiIb6WyFTP1x6jNX2fVaucbMDZI/ZbEAvrVSIfu5g0xPKSPDWkyWGuOALtkibfFALH3fNIvHBtJE6qslEpToWFVX4Wv2XjoJQi7OeOBmPdfk5XLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXmU5vDF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3577C4CEE7;
	Tue, 28 Oct 2025 20:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761682159;
	bh=CHNd/FW9/q9aUHITxts7CHIoFbOGRMsv9XovJrpvK+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nXmU5vDFFtXEIP6deZINDBDb/WFg/Zw8zSoFzv+cQvYLxhyWgdFshTr2d3tecNF8r
	 7Vr/G6odh5PgO5fNPCHFIVwz1NS8/V7lvxN3kvAc3g61hDHpRwdYRTS7gHFt7lY0Qs
	 q/e0Pk2ShjvFubVWBXu04H3h4+vcAkc0bIu/ez+zMVsMWhQ3ue/1CfYsrbXpy9rhLQ
	 1lijae37Tize9CsgoWKxPhS2n8+PAC8CZ38apz7PVqarTQoRGftlZ8Fso0k2ur8v3u
	 hRW3mxI62tdwH5cfmTJduOcjNxHUuLOjfiC2vgrWrTfAoN+2ignTtwHiOS1WjWwA3u
	 1W0GqWM4IG8Fw==
Message-ID: <a535a51c-215c-48b5-8d7c-e3728425a71c@kernel.org>
Date: Tue, 28 Oct 2025 21:09:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/25] media: i2c: ov01a10: Add ov01a10_check_hwcfg()
 function
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-12-hansg@kernel.org>
 <c7cp4mcuzoplibfj7jmtcvktbozzbw7qj3bd4kof56rplvjdye@tlpto2deyyeg>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <c7cp4mcuzoplibfj7jmtcvktbozzbw7qj3bd4kof56rplvjdye@tlpto2deyyeg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

On 28-Oct-25 6:29 PM, Mehdi Djait wrote:
> Hi Hans,
> 
> Thank you for the patches!
> 
> On Tue, Oct 14, 2025 at 07:40:19PM +0200, Hans de Goede wrote:
>> Add a function to check that the number of mipi-lanes and there frequency
>> are what the driver expects.
>>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
> 
> [..]
> 
>> +static int ov01a10_check_hwcfg(struct ov01a10 *ov01a10)
>> +{
>> +	struct v4l2_fwnode_endpoint bus_cfg = {
>> +		.bus_type = V4L2_MBUS_CSI2_DPHY
>> +	};
>> +	struct fwnode_handle *ep, *fwnode = dev_fwnode(ov01a10->dev);
>> +	unsigned long link_freq_bitmap;
>> +	int ret;
>> +
>> +	/*
>> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
>> +	 * wait for this.
>> +	 */
>> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
>> +	if (!ep)
>> +		return dev_err_probe(ov01a10->dev, -EPROBE_DEFER,
>> +				     "waiting for fwnode graph endpoint\n");
>> +
>> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>> +	fwnode_handle_put(ep);
>> +	if (ret)
>> +		return dev_err_probe(ov01a10->dev, ret, "parsing endpoint\n");
>> +
>> +	ret = v4l2_link_freq_to_bitmap(ov01a10->dev,
>> +				       bus_cfg.link_frequencies,
>> +				       bus_cfg.nr_of_link_frequencies,
>> +				       link_freq_menu_items,
>> +				       ARRAY_SIZE(link_freq_menu_items),
>> +				       &link_freq_bitmap);
>> +	if (ret)
>> +		goto check_hwcfg_error;
>> +
>> +	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
>> +	ov01a10->link_freq_index = ffs(link_freq_bitmap) - 1;
>> +
>> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV01A10_DATA_LANES) {
>> +		ret = dev_err_probe(ov01a10->dev, -EINVAL,
>> +				    "number of CSI2 data lanes %u is not supported\n",
>> +				    bus_cfg.bus.mipi_csi2.num_data_lanes);
>> +		goto check_hwcfg_error;
> 
> You don't need this goto at the end.

Thank you for the review. I prefer to leave this goto in place even
though this is the last error check so that if extra checks are added
later on after this block the error handling is still correct.

But if you feel strongly about removing the goto I can remove it for
v2 of this series.

Please let me know how you want to proceed with this.

Regards,

Hans




> 
>> +	}
>> +
>> +check_hwcfg_error:
>> +	v4l2_fwnode_endpoint_free(&bus_cfg);
>> +	return ret;
>> +}
> 
> --
> Kind Regards
> Mehdi Djait


