Return-Path: <linux-media+bounces-13287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E589093CC
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 23:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CC941C211DE
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 21:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB41185099;
	Fri, 14 Jun 2024 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UpINruS3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE6A13A27E;
	Fri, 14 Jun 2024 21:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718401786; cv=none; b=QwiLvAowCq5x3k/OFwxmw91BGsNgF65ZMz1MW9y94bIygTztmJ6hcIu3k6XbY7MX5YO/qzX7/Js85U8/ReK4Twt6OJREOBjQNX6SimEUU755HMSO1MV9tGibDuG0SLNK376pneaTg1s6iUIqSofS8Aw+KUcfcamDXxQRMztutBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718401786; c=relaxed/simple;
	bh=/vGDtarLtbLIXdtxJ7bjRjbFnBvP5dZH6i5ZowgGCoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSUvzPlHVF3XAKkWJKpdimn2BsAwQMXUN5HxUtvfCSsyk9XQ7pIvzS4emroyP8S9BJ6Y01R54QHiJlGix0BvBpCa+yiUjLE7Bn1wom8TLwY/wBmgcC9+kcd6OxdmYpL0drr09/Bv/qVPNwv6hqE79YmAeLe19NJladBdZL6F5iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UpINruS3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED1223D4;
	Fri, 14 Jun 2024 23:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718401766;
	bh=/vGDtarLtbLIXdtxJ7bjRjbFnBvP5dZH6i5ZowgGCoI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UpINruS3aXPk13W8za+nCeDQYMypu/rFrRybcONzGfg4EW1oroJCVsXaVPrWP/81c
	 plOvVN2VHtcrMFBV1Ejdl/2LYCiFoxKxWZ6WK4/eNtCtIZnVsqtkrnTNOuwgnUg3VA
	 zOqRs+Qsv7LgtgGyyFBxx8s/hIUUF1umQl/GnOuc=
Message-ID: <c0fcf014-ddec-4920-8a44-3cefd7e336ad@ideasonboard.com>
Date: Fri, 14 Jun 2024 22:49:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/16] media: platform: Add mali-c55 parameters video
 node
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-16-dan.scally@ideasonboard.com>
 <ZmyRot1VIBXx3Ab8@valkosipuli.retiisi.eu>
 <2063cbf3-73b7-4b34-8c3a-9fb530047842@ideasonboard.com>
 <Zmyx8ZYIQIuTxIUh@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <Zmyx8ZYIQIuTxIUh@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari

On 14/06/2024 22:11, Sakari Ailus wrote:
> Hi Dan,
>
> On Fri, Jun 14, 2024 at 09:15:07PM +0100, Dan Scally wrote:
>>>> +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
>>>> +{
>>>> +	struct mali_c55_params *params = &mali_c55->params;
>>>> +	enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
>>>> +	struct mali_c55_params_buffer *config;
>>>> +	struct mali_c55_buffer *buf;
>>>> +	size_t block_offset = 0;
>>>> +
>>>> +	spin_lock(&params->buffers.lock);
>>>> +
>>>> +	buf = list_first_entry_or_null(&params->buffers.queue,
>>>> +				       struct mali_c55_buffer, queue);
>>>> +	if (buf)
>>>> +		list_del(&buf->queue);
>>>> +	spin_unlock(&params->buffers.lock);
>>>> +
>>>> +	if (!buf)
>>>> +		return;
>>>> +
>>>> +	buf->vb.sequence = mali_c55->isp.frame_sequence;
>>>> +	config = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
>>>> +
>>>> +	if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
>>>> +		dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
>>>> +			config->total_size);
>>>> +		state = VB2_BUF_STATE_ERROR;
>>>> +		goto err_buffer_done;
>>>> +	}
>>>> +
>>>> +	/* Walk the list of parameter blocks and process them. */
>>>> +	while (block_offset < config->total_size) {
>>>> +		const struct mali_c55_block_handler *block_handler;
>>>> +		struct mali_c55_params_block_header *block;
>>>> +
>>>> +		block = (struct mali_c55_params_block_header *)
>>>> +			 &config->data[block_offset];
>>> How do you ensure config->data does hold a full struct
>>> mali_c33_params_block_header at block_offset (i.e. that the struct does not
>>> exceed the memory available for config->data)?
>>
>> We don't currently...the data buffer is sized specifically to be large
>> enough to accept a single instance of each possible struct that could be
>> included, we could keep track of the blocks that we have seen already and
>> ensure that none are seen twice...and that should guarantee that the
>> remaining space is sufficient to hold whatever the last block is. Does that
>> sound ok?
> Ḯ'd add an explicit check here.


How would you do the check, sorry?

> It's more simple way to ensure memory
> safety here: relying on a complex machinery that can't be trivially
> validated does risk having grave bugs, not only now but later on as well as
> modifications to the code are done.
>
>>>> +
>>>> +		if (block->type >= MALI_C55_PARAM_BLOCK_SENTINEL) {
>>>> +			dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
>>>> +			state = VB2_BUF_STATE_ERROR;
>>>> +			goto err_buffer_done;
>>>> +		}
>>>> +
>>>> +		block_handler = &mali_c55_block_handlers[block->type];
>>>> +		if (block->size != block_handler->size) {
>>> How do you ensure config->data has room for the block?
>> I think through the same proposal as above.
> Similarly here. You already even have the size of the blocks available
> here.
>

