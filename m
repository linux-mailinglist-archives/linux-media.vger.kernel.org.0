Return-Path: <linux-media+bounces-13286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CDA90939E
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 23:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13D681F24F0B
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 21:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DF41836FB;
	Fri, 14 Jun 2024 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="UjiAL+HO"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFB13C671;
	Fri, 14 Jun 2024 21:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718399482; cv=pass; b=EMb409p1310szzBERVTr+RdaGLr4KlTJlyTkczuHP//1HaNkOBMTeEzQcxap63SEsZiu+DVPLsJ8AjThS3NamklJjiTi4lVafpS6UGs2ySFQWj1/WkdtvTtR7eO6kxZTVM2X7Ee1LymzL52AifhyLDDd3WEtS7M7qf9PsSgxj0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718399482; c=relaxed/simple;
	bh=Q/qN1izoJcq4Q4/thJKSbX2FEUqJD1jIUgM6X/aohsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRKdRX9xyYv2MFb9it4RmlK2go+eJj8FjyqSInWzkXna+RGBISCXY6D7D8vqLL+kpssFLl97NHH1GFYaBfCdwnXtOfXKVXKfm3XhHMQvmc7gh+1NBrwkg1kfoFxjEHimiTofxmTqsIjTgjtnOcrLXXQDX+54iONncKK5igZKjKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=UjiAL+HO; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4W1Blm1nk1z49Q0G;
	Sat, 15 Jun 2024 00:11:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1718399476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mB8PptePciwZTHBLBpn6ROe/lR4W3BuJOJvwANVxrYA=;
	b=UjiAL+HO1UMOqvox3W057EUwzxvxr8g4XuRSYG1kty67HGJLieRwizZkmPsOfw9z73/5fN
	wgrP3tKYttuAu3AAIIWecnrAibOQzk0ojsKZncCCGkkWKhx5JenWFO7wQMdbWsTWedmMU2
	hKgoK6Ain6a9J3imP61jRNId19GMOjdF65t3I9z7eeX0KT4pvcdv+gCRySVXZ9fh/upZma
	bRMFm/21+g57plX3aizfxg9FNcjPADa1ZFjICN/R1EhvMTjWP9MUKlJ08PhG8/Y+HyEv+y
	lBQss55z2ShRzoLrtnQIg7tej+ac3USLG7QIKc0kkGr5ZHbpkoyoJClavgVtyg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1718399476; a=rsa-sha256;
	cv=none;
	b=LQWm3RfuZ6rngz/eLFaRoDocB/N1OpGZpQC5WgoGNPEJG6XZA42nzdgLySmIaGMyqZ2nPv
	n43fkoeAvYFadPFOfIVShojECM1kCkrZnUAxdOFVZG1CuBuWeEym5bTsK+4oCdWvFop8B2
	lkERQwecMoo8XRUsEMVw1YDQKXXKQaZZx1TXzhptnE6UdXe4NppId9gwSAsAzCU0G5khyX
	M2PBhDm8qwiWTqNT4hC8xkTuCVyrrgG9BP5cEM/C0sBP0ajQIkz+x0Qub7sgle4hwsFGgt
	BdZomjNdzbS5UEBV/m59emoSWczB4Qp2wYLN8cO4V3qA9c6jOakzmoFgnRQnFw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1718399476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mB8PptePciwZTHBLBpn6ROe/lR4W3BuJOJvwANVxrYA=;
	b=FhDLrw4JE0QSSfI0c86I5bsaZ9T/on4Wh2WLuq+AxSqTXHzgGwqlRyT2ML1v11xSZny+cM
	9RQyxW27+ytOMt8BTlz4RPGuHblUcKV/sYDux7KgSQ+GvkoXVX9x4pKoKwWYeGSKTle/0w
	zKg72eoDMPYKH2NdzqyfUm220+5u7rdxfXWFIoHxB6DNZUfjPyR6GVUsoi97IvpO40o6rw
	q+6ab+L56LvP9XJ7sOSi6tCZReDrmvLOe7O9V177S0em70hgmM9X8o5GWMU5jjbi2SiS5k
	zKcj2i6NqgX+COTMGgFYJBx0HF2yKJhORHxoN3rP1amv5zIPYypXon3isqJZFA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 66182634C93;
	Sat, 15 Jun 2024 00:11:13 +0300 (EEST)
Date: Fri, 14 Jun 2024 21:11:13 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 15/16] media: platform: Add mali-c55 parameters video
 node
Message-ID: <Zmyx8ZYIQIuTxIUh@valkosipuli.retiisi.eu>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-16-dan.scally@ideasonboard.com>
 <ZmyRot1VIBXx3Ab8@valkosipuli.retiisi.eu>
 <2063cbf3-73b7-4b34-8c3a-9fb530047842@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2063cbf3-73b7-4b34-8c3a-9fb530047842@ideasonboard.com>

Hi Dan,

On Fri, Jun 14, 2024 at 09:15:07PM +0100, Dan Scally wrote:
> > > +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
> > > +{
> > > +	struct mali_c55_params *params = &mali_c55->params;
> > > +	enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
> > > +	struct mali_c55_params_buffer *config;
> > > +	struct mali_c55_buffer *buf;
> > > +	size_t block_offset = 0;
> > > +
> > > +	spin_lock(&params->buffers.lock);
> > > +
> > > +	buf = list_first_entry_or_null(&params->buffers.queue,
> > > +				       struct mali_c55_buffer, queue);
> > > +	if (buf)
> > > +		list_del(&buf->queue);
> > > +	spin_unlock(&params->buffers.lock);
> > > +
> > > +	if (!buf)
> > > +		return;
> > > +
> > > +	buf->vb.sequence = mali_c55->isp.frame_sequence;
> > > +	config = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> > > +
> > > +	if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
> > > +		dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
> > > +			config->total_size);
> > > +		state = VB2_BUF_STATE_ERROR;
> > > +		goto err_buffer_done;
> > > +	}
> > > +
> > > +	/* Walk the list of parameter blocks and process them. */
> > > +	while (block_offset < config->total_size) {
> > > +		const struct mali_c55_block_handler *block_handler;
> > > +		struct mali_c55_params_block_header *block;
> > > +
> > > +		block = (struct mali_c55_params_block_header *)
> > > +			 &config->data[block_offset];
> > How do you ensure config->data does hold a full struct
> > mali_c33_params_block_header at block_offset (i.e. that the struct does not
> > exceed the memory available for config->data)?
> 
> 
> We don't currently...the data buffer is sized specifically to be large
> enough to accept a single instance of each possible struct that could be
> included, we could keep track of the blocks that we have seen already and
> ensure that none are seen twice...and that should guarantee that the
> remaining space is sufficient to hold whatever the last block is. Does that
> sound ok?

Ḯ'd add an explicit check here. It's more simple way to ensure memory
safety here: relying on a complex machinery that can't be trivially
validated does risk having grave bugs, not only now but later on as well as
modifications to the code are done.

> 
> > 
> > > +
> > > +		if (block->type >= MALI_C55_PARAM_BLOCK_SENTINEL) {
> > > +			dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
> > > +			state = VB2_BUF_STATE_ERROR;
> > > +			goto err_buffer_done;
> > > +		}
> > > +
> > > +		block_handler = &mali_c55_block_handlers[block->type];
> > > +		if (block->size != block_handler->size) {
> > How do you ensure config->data has room for the block?
> I think through the same proposal as above.

Similarly here. You already even have the size of the blocks available
here.

-- 
Kind regards,

Sakari Ailus

