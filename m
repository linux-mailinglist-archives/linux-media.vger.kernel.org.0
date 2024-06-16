Return-Path: <linux-media+bounces-13333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C240909FFC
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F33321F216BA
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 21:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F102D8462;
	Sun, 16 Jun 2024 21:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PgauEFNv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A249E2575A;
	Sun, 16 Jun 2024 21:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718573553; cv=none; b=ts8ZHen+dCOJ8sTqKvxWvN153Ucprldq1QplD6yXM6qOPkw6Zso5vRCB5dmAz4eT57DklrZNYxjTSY5DOw9qoMT/fPYiLsJ5Stz16XkamBn1oaTH+byNKk3TzztY/P7DTos5MGjKIY+PKUqQR/DqyQDyKQQyfa5XfGjrpJyGitE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718573553; c=relaxed/simple;
	bh=5tgRkWRYNoSCgJVWt/P3G85JyG36Zx5JPaostUQiXgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACBoimR0pL2loUlWxlGjuOfSmuC+AjEKZRIV04KrNavaBWejQLAOEXMTEP3cQS32PJ9aMo6M0IgtjSEKSMqWlOV7OiMpivge/I2NoocYoER7yWs4gJq/Ewp7OwHGkEpHi2Ne8ixZvbB2bJfyvbWf6BCqS4ZcswFhSe05j7QRGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PgauEFNv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8980581;
	Sun, 16 Jun 2024 23:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718573531;
	bh=5tgRkWRYNoSCgJVWt/P3G85JyG36Zx5JPaostUQiXgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgauEFNv29F0eRQw9yzcT+Yb4l7iW+a3RTKbVQH0TUZfaMgB2o6H5s1cTmU5dpsNh
	 my+rCjnG2xlRyZTPHWHD6GN33Mac9MBaP6JgHhrUdQMH0xZPrs+wKL6z4ztD2+GNjv
	 EEZFl1rXKurdIxooN9zllAj82PMBVZ6dfCqgJAPo=
Date: Mon, 17 Jun 2024 00:32:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 15/16] media: platform: Add mali-c55 parameters video
 node
Message-ID: <20240616213206.GE7378@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-16-dan.scally@ideasonboard.com>
 <ZmyRot1VIBXx3Ab8@valkosipuli.retiisi.eu>
 <2063cbf3-73b7-4b34-8c3a-9fb530047842@ideasonboard.com>
 <Zmyx8ZYIQIuTxIUh@valkosipuli.retiisi.eu>
 <c0fcf014-ddec-4920-8a44-3cefd7e336ad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0fcf014-ddec-4920-8a44-3cefd7e336ad@ideasonboard.com>

On Fri, Jun 14, 2024 at 10:49:37PM +0100, Daniel Scally wrote:
> On 14/06/2024 22:11, Sakari Ailus wrote:
> > On Fri, Jun 14, 2024 at 09:15:07PM +0100, Dan Scally wrote:
> >>>> +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
> >>>> +{
> >>>> +	struct mali_c55_params *params = &mali_c55->params;
> >>>> +	enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
> >>>> +	struct mali_c55_params_buffer *config;
> >>>> +	struct mali_c55_buffer *buf;
> >>>> +	size_t block_offset = 0;
> >>>> +
> >>>> +	spin_lock(&params->buffers.lock);
> >>>> +
> >>>> +	buf = list_first_entry_or_null(&params->buffers.queue,
> >>>> +				       struct mali_c55_buffer, queue);
> >>>> +	if (buf)
> >>>> +		list_del(&buf->queue);
> >>>> +	spin_unlock(&params->buffers.lock);
> >>>> +
> >>>> +	if (!buf)
> >>>> +		return;
> >>>> +
> >>>> +	buf->vb.sequence = mali_c55->isp.frame_sequence;
> >>>> +	config = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> >>>> +
> >>>> +	if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
> >>>> +		dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
> >>>> +			config->total_size);
> >>>> +		state = VB2_BUF_STATE_ERROR;
> >>>> +		goto err_buffer_done;
> >>>> +	}
> >>>> +
> >>>> +	/* Walk the list of parameter blocks and process them. */
> >>>> +	while (block_offset < config->total_size) {
> >>>> +		const struct mali_c55_block_handler *block_handler;
> >>>> +		struct mali_c55_params_block_header *block;
> >>>> +
> >>>> +		block = (struct mali_c55_params_block_header *)
> >>>> +			 &config->data[block_offset];
> >>>
> >>> How do you ensure config->data does hold a full struct
> >>> mali_c33_params_block_header at block_offset (i.e. that the struct does not
> >>> exceed the memory available for config->data)?
> >>
> >> We don't currently...the data buffer is sized specifically to be large
> >> enough to accept a single instance of each possible struct that could be
> >> included, we could keep track of the blocks that we have seen already and
> >> ensure that none are seen twice...and that should guarantee that the
> >> remaining space is sufficient to hold whatever the last block is. Does that
> >> sound ok?
> >
> > Ḯ'd add an explicit check here.
> 
> How would you do the check, sorry?

You could simply change the while() loop to

	max_offset = config->total_size - sizeof(mali_c55_params_block_header);
	while (block_offset <= max_offset) {

That would ensure that you always have enough space left for a header.
Within the loop, you will need to check that block->size doesn't go past
the end of the remaining space. Please also check the code for integer
overflows.

> > It's more simple way to ensure memory
> > safety here: relying on a complex machinery that can't be trivially
> > validated does risk having grave bugs, not only now but later on as well as
> > modifications to the code are done.
> >
> >>>> +
> >>>> +		if (block->type >= MALI_C55_PARAM_BLOCK_SENTINEL) {
> >>>> +			dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
> >>>> +			state = VB2_BUF_STATE_ERROR;
> >>>> +			goto err_buffer_done;
> >>>> +		}
> >>>> +
> >>>> +		block_handler = &mali_c55_block_handlers[block->type];
> >>>> +		if (block->size != block_handler->size) {
> >>>
> >>> How do you ensure config->data has room for the block?
> >>
> >> I think through the same proposal as above.
> >
> > Similarly here. You already even have the size of the blocks available
> > here.

-- 
Regards,

Laurent Pinchart

