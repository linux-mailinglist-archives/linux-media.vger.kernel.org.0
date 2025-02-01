Return-Path: <linux-media+bounces-25516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585B6A24844
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 11:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FFF23A6A2D
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 10:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED97153824;
	Sat,  1 Feb 2025 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvJBSr4r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0CB17BA5
	for <linux-media@vger.kernel.org>; Sat,  1 Feb 2025 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738405855; cv=none; b=bHLJmIVD7+xeIsWQOuYHl/xYoKR8Gc1tOxxCf5gIoqfHGfMEIoOUVyhLk0MvVNlXDIsgZnBzEEXUbaPKVpvLPOadXlq6ljducI6AXsYLiEqYk2LVqcniQ+4hsHmfykW/yITArSAZYsgUQg/ycYWsgYB6onNUIoTjFzONKZAkzH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738405855; c=relaxed/simple;
	bh=3iXei+zMuga5mqMZDCe8XCjwCF2tjKl5U1Wbnl4CHtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5qgIXgojdyhvzTz/C1dp7nUzWs6CPZVzn14sHcHkfSaU3jFK3WYBqoXkPy97BDa7h/P+/6wjoc1nlyXgyvWxXVuMo8RFCv5fC6pj5/2RuM669yjfuJJ9ek9qMoZ6DjLTLnUQ/6ysNfXxrqtbH1lI41R00fTTbnlpGViYqu/XJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rvJBSr4r; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436a03197b2so19178625e9.2
        for <linux-media@vger.kernel.org>; Sat, 01 Feb 2025 02:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738405852; x=1739010652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xohF1aQ9sBB9g7xPx+Tdicp2pC5qB9GNqW8EawpT9YE=;
        b=rvJBSr4roHTlya3FZPgONLxXzLeriVndi/2aivBMGiotIVTHD7Y56GQYkm4K2VD5Zh
         WJkfWmIZAIrf3w6/2WNPuzgHcCJdU6Pjc5OqF5SJcjBdvXEXR6kjBcx7RSw73ucEOeiG
         fJ9aKQYjOtqpBX93ZUexDSB+tcFRpIbML163nF1p3LBr4rzoXpIXpfiU7YTOyzMoSzBs
         P3ActCOWYW+gnDl037ik6Hp4+qXOcJTJJxHZxIyF2HBRZwDeW69EgHjieT1fTpQJt+U5
         cMceKLY/VozMpPHuJVCg1s4zbOOh0XoVl7TypEWMY0hYOdV2v3OmIq3BpP+xraIO6Ddb
         /SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738405852; x=1739010652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xohF1aQ9sBB9g7xPx+Tdicp2pC5qB9GNqW8EawpT9YE=;
        b=okq+zY/bYXoeSL+aw+CENqmvV5HQzy4ZmsdSPQvJGMdqSoMSEa1ns1JMGGyxvE3GqL
         BNrnz8PGY03H+5bQ/H8TRsBXVDzPUCq+6igMrAOmKXT/BDO1r31w76w+6ZzH0A7mOlpp
         Fi2g2HtUZb+ows2IFvlbx88l3dt8MRr6IC6IxzwIqzXweYrZIBIjm2CGoGUuOAzHl2Al
         NZbYViAVM51ITUTIva13HdoaiUduCtrHu/oHWSKYcdhV0bQq+hhO2BI+TLNapZrXuAiL
         XU1XFFSKvvnXnwPP/Ry++uFgFkkNk6j/jU8gMfmRwPj11egzMfKmAA7paC+1LAZHnsNZ
         7u2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCpczij1aU5qb1ykU1mG/zLgHHc6FsQIshHW9ex9V9z5khLSQe0ZL/pPnZaeNjfEWylsw107y5aPR1uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfmtqBDlVpEj0q1iZJyr3WPxAG+2IGrZVKIcBWfC33zLta3xOa
	E0t4sLA9ED1nQ6MkEVMNJibV8tte8g+aF9BKhI+LnJPn+nqFlpsUIeJ026QoL9c=
X-Gm-Gg: ASbGncvkT/f5APqR4XmxA1L6ALS2WTf4bs9Fy1jJGfuoo9yQxAvF4COfYoyd1AZlUMJ
	BY7ySK6zDtkll1N9murKPUahQzHRUl5C5Yu3j3XHf+HbJlmTa7AFIEncuJ8sfRZqnxn7EqqajFN
	fmDf5GGzyqVCzdeOQWrWY7tYg/rQ3Wim1XGizsKqfKkCfZc2TQDnVsZOunUM79x0jfpRqfspuvR
	aUEPkSlWzU2ZpGOktRusSoTAeGqUDJa6ehxplZGjF8Z7tRC12o/KJHaLb2Ik62IJXgc0RGi8HCC
	8D/rCHdd6yMjIAaj56fk
X-Google-Smtp-Source: AGHT+IF0BG43GtXbK+RPYd0fGTqtRp85sB3ItAL9AxWDKVzVZUuEde1c6xbWxd/3dCeIjoZisES8Pw==
X-Received: by 2002:a05:600c:3b98:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-438dc3be214mr127884145e9.12.1738405852406;
        Sat, 01 Feb 2025 02:30:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c1b5136sm7118399f8f.65.2025.02.01.02.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 02:30:51 -0800 (PST)
Date: Sat, 1 Feb 2025 13:30:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC 04/12] staging: media: max96712: change DT parsing routine
Message-ID: <e2b7b98d-fb16-497e-9102-ba49e04e1748@stanley.mountain>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
 <20250131163408.2019144-5-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131163408.2019144-5-laurentiu.palcu@oss.nxp.com>

On Fri, Jan 31, 2025 at 06:33:58PM +0200, Laurentiu Palcu wrote:
> -static int max96712_parse_dt(struct max96712_priv *priv)
> +static int max96712_parse_rx_ports(struct max96712_priv *priv, struct device_node *node,
> +				   struct of_endpoint *ep)
> +{
> +	struct device *dev = &priv->client->dev;
> +	struct max96712_rx_port *source;
> +	struct fwnode_handle *remote_port_parent;
> +
> +	if (priv->rx_ports[ep->port].fwnode) {
> +		dev_info(dev, "Multiple port endpoints are not supported: %d", ep->port);
> +		return 0;
> +	}
> +
> +	source = &priv->rx_ports[ep->port];
> +	source->fwnode = fwnode_graph_get_remote_endpoint(of_fwnode_handle(node));
> +	if (!source->fwnode) {
> +		dev_info(dev, "Endpoint %pOF has no remote endpoint connection\n", ep->local_node);
> +		return 0;
> +	}
> +
> +	remote_port_parent = fwnode_graph_get_remote_port_parent(of_fwnode_handle(node));
> +
> +	if (!fwnode_device_is_available(remote_port_parent)) {
> +		dev_dbg(dev, "Skipping port %d as remote port parent is disabled.\n",
> +			ep->port);
> +		source->fwnode = NULL;

I don't understand the refcounting in this function.  Should we call
fwnode_handle_put(source->fwnode); before setting this to NULL?

> +		goto fwnode_put;
> +	}
> +
> +	priv->rx_port_mask |= BIT(ep->port);
> +	priv->n_rx_ports++;
> +
> +fwnode_put:
> +	fwnode_handle_put(remote_port_parent);
> +	fwnode_handle_put(source->fwnode);
> +	return 0;

I don't understand why we save source->fwnode but drop the refcount on
the success path.  My instinct says that it should be a source_fwnode
local stack variable instead.  (But again, I've only glanced at this
code so I could be wrong).


> +}
> +

regards,
dan carpenter


