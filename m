Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA50A234EFD
	for <lists+linux-media@lfdr.de>; Sat,  1 Aug 2020 02:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgHAA7O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 20:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgHAA7O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 20:59:14 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C25C06174A;
        Fri, 31 Jul 2020 17:59:14 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id i19so17744014lfj.8;
        Fri, 31 Jul 2020 17:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bXmSNfhnUE6It9Edp0ZyP+wGCkB4UT/nvR9Ph2JS/Ss=;
        b=IU9EezqiR5eaoJD3QE36dqnFospnSumWjxAhGptuYpv3iLJ83vT/+QaH3FwEmnp2FS
         mD1bHFalPMSJoLJn9RvPxCYAo1NU7pVHH7Gv6THakhGUWwBBsTj11EBve/ElxxW/mqf9
         Plj94CA1ENI0x45PttsiLkJ/VNByggqlb2HwXchYMzOYEZLEhyk3JCCTv++P+RoJnaVT
         Q+MegNBzkBWWR15IEC7sOqf9ul5ZESMvDR/CetjdATvHWQsUhZRl0t9BEzyVxLzAQ3oW
         KcePparNQR3LKKPyOWuKIj4P7NuoCrxWeml4Ux3dNmniKrh8iRPmAZ/BHX33a5iIElFq
         8ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bXmSNfhnUE6It9Edp0ZyP+wGCkB4UT/nvR9Ph2JS/Ss=;
        b=IFZEqGg6Ih7p2x2Ue+Co+36ZAVGzdbj5GpHDjF+oWGWmIF4v4XbdSijYe/bgOJ5sCp
         f8bvXJ/lHVff6QXGj6MrfisKHMQCW3cbV1dU9v0K4VPO+xkC93tOaIayio7fdfNlSFZf
         Mpolcll7ZOmld2FsWp/gE8t+JfWMPEAm7WmGJ5N78DIn4UPdmg/jBLwvegikkTJwQlxC
         BpDqryWPIRW57RNZem8hy1RKujQtJGJNxaKbB9F/k7h+RRinKthXcmcwZT1enPL2prmI
         tU9SVNBZ+EXCtwVjDIub6C8rEfV6sIu4XdLZlmIblmkLX1fU95PbJYW/RxaoJwo2uP7u
         0I8A==
X-Gm-Message-State: AOAM532qxbDcAeKyMQKwMT79I5hCT8DDT4bG3YUNBBc1xK92H9MpK9GB
        HD8It5yp/ppQ0NdIS1b8l/TFpZ+G
X-Google-Smtp-Source: ABdhPJzmRXyyWKi4kMaOeTi/VyIw4KgMWy1+QnaRg/0Llj1HgBtJTn+SjVtc4dx1ZeZ24Wg6WZGk7Q==
X-Received: by 2002:a19:c197:: with SMTP id r145mr3168476lff.41.1596243552191;
        Fri, 31 Jul 2020 17:59:12 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id v10sm2314953lfo.11.2020.07.31.17.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 17:59:11 -0700 (PDT)
Subject: Re: [PATCH v7 06/10] media: tegra-video: Add support for external
 sensor capture
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596231144-12554-1-git-send-email-skomatineni@nvidia.com>
 <1596231144-12554-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <08acaeff-7819-07a3-69ca-adfbdb872ee3@gmail.com>
Date:   Sat, 1 Aug 2020 03:59:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596231144-12554-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

01.08.2020 00:32, Sowjanya Komatineni пишет:
...
> +static int tegra_csi_channels_alloc(struct tegra_csi *csi)
> +{
> +	struct device_node *node = csi->dev->of_node;
> +	struct v4l2_fwnode_endpoint v4l2_ep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *fwh;
> +	struct device_node *channel;
> +	struct device_node *ep;
> +	unsigned int lanes, portno, num_pads;
> +	int ret;
> +
> +	for_each_child_of_node(node, channel) {
> +		if (!of_node_name_eq(channel, "channel"))
> +			continue;
> +
> +		ret = of_property_read_u32(channel, "reg", &portno);
> +		if (ret < 0)
> +			continue;
> +
> +		if (portno >= csi->soc->csi_max_channels) {
> +			dev_err(csi->dev, "invalid port num %d\n", portno);

The "channel" node should be put on error.

> +			return -EINVAL;
> +		}
> +
> +		ep = of_graph_get_endpoint_by_regs(channel, 0, 0);
> +		if (!ep)
> +			continue;
> +
> +		fwh = of_fwnode_handle(ep);
> +		ret = v4l2_fwnode_endpoint_parse(fwh, &v4l2_ep);
> +		of_node_put(ep);
> +		if (ret) {
> +			dev_err(csi->dev,
> +				"failed to parse v4l2 endpoint: %d\n", ret);
> +			return ret;
> +		}
> +
> +		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
> +		if (!lanes || ((lanes & (lanes - 1)) != 0)) {
> +			dev_err(csi->dev, "invalid data-lanes %d\n", lanes);
> +			return -EINVAL;
> +		}
> +
> +		num_pads = of_graph_get_endpoint_count(channel);
> +		if (num_pads == TEGRA_CSI_PADS_NUM) {
> +			ret = tegra_csi_channel_alloc(csi, channel, portno,
> +						      lanes, num_pads);
> +			if (ret < 0)
> +				return ret;
> +		}
>  	}
...
> +static int tegra_vi_channels_alloc(struct tegra_vi *vi)
> +{
> +	struct device_node *node = vi->dev->of_node;
> +	struct device_node *ep = NULL;
> +	struct device_node *ports;
> +	struct device_node *port;
> +	unsigned int port_num;
> +	int ret;
> +
> +	ports = of_get_child_by_name(node, "ports");
> +	if (!ports)
> +		return -ENODEV;
> +
> +	for_each_child_of_node(ports, port) {
> +		if (!of_node_name_eq(port, "port"))
> +			continue;
> +
> +		ret = of_property_read_u32(port, "reg", &port_num);
> +		if (ret < 0)
> +			continue;
> +
> +		if (port_num > vi->soc->vi_max_channels) {
> +			of_node_put(ports);

s/ports/port/

> +			dev_err(vi->dev, "invalid port num %d\n", port_num);
> +			return -EINVAL;
> +		}
> +
> +		ep = of_get_child_by_name(port, "endpoint");
> +		if (!ep)
> +			continue;
> +
> +		of_node_put(ep);
> +		ret = tegra_vi_channel_alloc(vi, port_num, port);
> +		if (ret < 0) {
> +			of_node_put(ports);
s/ports/port/

> +			return ret;
> +		}
>  	}
