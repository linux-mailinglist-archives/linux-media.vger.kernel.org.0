Return-Path: <linux-media+bounces-11404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC38C4001
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 13:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A041F22B8B
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 11:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA7814D2BC;
	Mon, 13 May 2024 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BovhxuMu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C63014D28C;
	Mon, 13 May 2024 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715600693; cv=none; b=tqNNf1PgwRO8JMSlfbxGhJy3V9IA1KRlmz8dEm23CU3D8PCpnACR2guKOXoqpqreCBpC4ZQkWI8AlpI35tZT6iSpzirU7J3rdtn3Fu5oLUnSwjGSxTxKC7jl6rE3gWvXG67XJzEFUXG82bN3s2fKt1EJxwiiutbx8SDKVpQn5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715600693; c=relaxed/simple;
	bh=1CuQwLvdXNIMjatSyuAeXJFxXLuB2HlU01UVZ00JRcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mi066UHY3BnTr9IwA+ZmmFmOZnPLqOSe65mpf5z6DddPDq1C8I0xAdrjL9m7lu5lSl7aWiU8O9TABjqUgRwoqXBGaW1qb6xJDGJXU3T6+rfve4WhRBOTqWuWSdtsYBvJHkGVlfyGPl2zxzMXactclunt3GZBNK95S1/KOnStUG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BovhxuMu; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D8Jhwc004753;
	Mon, 13 May 2024 13:44:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=GIy0RxbMTa08PqVo24zPZgrWF7BfaDEsPdaCzmdxk98=; b=Bo
	vhxuMuV0hdNvP/zLegqNG36p/iA9JicOtZuRxlzlo6ccvBDDCyR8eC8pDSUVdqZT
	RJE2qM0semhXJU3iPUaWzQlzojCpr+nbWfTb9Zvvu4OSSIW9Ys7oxzczfsjt6dxN
	Bt/dC/AbFaletetPm+hbOJaQGg9uSv3YjiAc/HDfAgSF08AKpboImrlDmJiHLlY5
	tlNDl6RCEOguCt/J1uNZsVFUIfnGn52Md4cQMkGomJ1+IsXV5qr9ylQKiSuAvLEp
	neooNM63TQBlk1wg3nCMvDp8h7VoNYrmjlba/8RwucyLbAfY+xz7N6sLjNaGo8bY
	L0i3rtlsXD2zurhG/LEg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y2kmhm4cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 13:44:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 663054002D;
	Mon, 13 May 2024 13:44:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 151A321860D;
	Mon, 13 May 2024 13:43:47 +0200 (CEST)
Received: from [10.130.76.233] (10.130.76.233) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 13:43:46 +0200
Message-ID: <a688b2f2-d972-450a-9bec-2b506b58a21f@foss.st.com>
Date: Mon, 13 May 2024 13:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 linux-next] media: i2c: st-mipid02: replace
 of_node_put() with __free
To: R Sundar <prosunofficial@gmail.com>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <skhan@linuxfoundation.org>, <javier.carrasco.cruz@gmail.com>,
        Julia Lawall
	<julia.lawall@inria.fr>
References: <20240429163736.11544-1-prosunofficial@gmail.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20240429163736.11544-1-prosunofficial@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_08,2024-05-10_02,2023-05-22_02

Hi,

I took sometime to reflect on this. Currently I favor drivers consistency.
Merging this patch as is would introduce some differences between the
vgxy61 and other drivers that follow the 'of_node_put' flow, which I
think is not an improvement.

Now, this patch is certainly good. Would it be possible to extend it to
all other drivers using the 'of_node_put' ?

That would the consistency issue while improving code quality at the
same time.

Thank you.


On 4/29/24 18:37, R Sundar wrote:
> Use the new cleanup magic to replace of_node_put() with
> __free(device_node) marking to auto release and to simplify the error
> paths.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: R Sundar <prosunofficial@gmail.com>
> ---
> 
> Changes since v1 - 
> 
> - Added missed out __free() marking in mipid02_parse_tx_ep().
> - In mipid02_parse_tx_ep(), In error case, return value is always -EINVAL.  so
> sending the -EINVAL instead of ret variable value. 
> 
> Link to v1 - https://lore.kernel.org/all/20240427095643.11486-1-prosunofficial@gmail.com/#t
> 
>  drivers/media/i2c/st-mipid02.c | 37 +++++++++-------------------------
>  1 file changed, 9 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index f250640729ca..bd3cf94f8534 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -715,31 +715,28 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>  	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>  	struct i2c_client *client = bridge->i2c_client;
>  	struct v4l2_async_connection *asd;
> -	struct device_node *ep_node;
>  	int ret;
>  
>  	/* parse rx (endpoint 0) */
> -	ep_node = of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node,
> -						0, 0);
> +	struct device_node *ep_node __free(device_node) =
> +		of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node, 0, 0);
>  	if (!ep_node) {
>  		dev_err(&client->dev, "unable to find port0 ep");
> -		ret = -EINVAL;
> -		goto error;
> +		return -EINVAL;
>  	}
>  
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), &ep);
>  	if (ret) {
>  		dev_err(&client->dev, "Could not parse v4l2 endpoint %d\n",
>  			ret);
> -		goto error_of_node_put;
> +		return ret;
>  	}
>  
>  	/* do some sanity checks */
>  	if (ep.bus.mipi_csi2.num_data_lanes > 2) {
>  		dev_err(&client->dev, "max supported data lanes is 2 / got %d",
>  			ep.bus.mipi_csi2.num_data_lanes);
> -		ret = -EINVAL;
> -		goto error_of_node_put;
> +		return -EINVAL;
>  	}
>  
>  	/* register it for later use */
> @@ -750,7 +747,6 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>  	asd = v4l2_async_nf_add_fwnode_remote(&bridge->notifier,
>  					      of_fwnode_handle(ep_node),
>  					      struct v4l2_async_connection);
> -	of_node_put(ep_node);
>  
>  	if (IS_ERR(asd)) {
>  		dev_err(&client->dev, "fail to register asd to notifier %ld",
> @@ -764,46 +760,31 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>  		v4l2_async_nf_cleanup(&bridge->notifier);
>  
>  	return ret;
> -
> -error_of_node_put:
> -	of_node_put(ep_node);
> -error:
> -
> -	return ret;
>  }
>  
>  static int mipid02_parse_tx_ep(struct mipid02_dev *bridge)
>  {
>  	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_PARALLEL };
>  	struct i2c_client *client = bridge->i2c_client;
> -	struct device_node *ep_node;
>  	int ret;
>  
>  	/* parse tx (endpoint 2) */
> -	ep_node = of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node,
> -						2, 0);
> +	struct device_node *ep_node __free(device_node) =
> +		of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node, 2, 0);
>  	if (!ep_node) {
>  		dev_err(&client->dev, "unable to find port1 ep");
> -		ret = -EINVAL;
> -		goto error;
> +		return -EINVAL;
>  	}
>  
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), &ep);
>  	if (ret) {
>  		dev_err(&client->dev, "Could not parse v4l2 endpoint\n");
> -		goto error_of_node_put;
> +		return -EINVAL;
>  	}
>  
> -	of_node_put(ep_node);
>  	bridge->tx = ep;
>  
>  	return 0;
> -
> -error_of_node_put:
> -	of_node_put(ep_node);
> -error:
> -
> -	return -EINVAL;
>  }
>  
>  static int mipid02_probe(struct i2c_client *client)

-- 
Regards,

Benjamin

