Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816E62D0E63
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 11:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgLGKsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 05:48:25 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:46271 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726214AbgLGKsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 05:48:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mE3OkFNsIarN7mE3SkzDir; Mon, 07 Dec 2020 11:47:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607338062; bh=gWVo8YX1VQxSsOSI04pPBsnfOvUw7NtMunA1qyzkVps=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jKT/DwFs1uxnlPjVbuxcBc5m36tgdSbbBheMmi5rQbE/2Nlq/zWY4tTjVlvcf5Dyz
         oCr3qxpIELZgr6ldAsAloZ2oU1vnHrpTd5pkVUE7CQhocWJPqJuBC41kWSjhaOnO+H
         0ZjJ3GJHq0XiHdoiojc8thNUGtjROedHn1s18kAY2k2iKsle5rgDfuG9D3cIyiZ1sl
         6K+OpjgG8+rnJUk/qzXN5E20ax0F+tVO4OpMKanuUMMqgPj5GtFc8codZ8Z6ynxKDp
         rzsdp7+WoDml73Y7EzIh3WZpXK+UDL5OBkgGHXxeryJ2vrXFG/4jiGlvcIZQj+16zi
         e3SVhAVoaW4uw==
Subject: Re: [PATCH v3 10/13] media: v4l2-fwnode: Update
 V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org
Cc:     bparrot@ti.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
 <1607022002-26575-11-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <845dfd4a-fa11-625c-78a3-cc8adc68bfc7@xs4all.nl>
Date:   Mon, 7 Dec 2020 11:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1607022002-26575-11-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKlT91V/9qHoNEbQguLdjtrxEusCqooMka1R1Z25DwFG17wT85odnqoeRsm++0Zzch7a8bH+1di0wpastSoZvVELgKJHd/ZJy5CDBZfTD4bwan22gYMV
 C7KxBboHLhb1Yptt6u1/jkYzVOvNlqcQQRybr6eFb39d5eGgLihAdmflsBBbDI/pCvtlypxfrRcaEUW8TO+2TXec3MfbNPqzxlYDnOJ1ouBYRK53ergZUGEb
 97/E/JWkam3FjIZhszOQPO8hYKAm7GN3JUc2ofaYgv/d4rjS8bYFAB4ADiFkt8kt++1yW3sVIzwHdyNOogRa8Ynr9KKXEWQt4N9VgH3zjhWbZdMR8TZwEdTX
 aMOtQwlkHub9zJxCo/HQDifMk5m+tep8yWzezayO24YeCUnqtlYlYIKvwtuWZP5PBJR4EXTIcF/GYhAGcjYFP7qZCLb7itRjYKMDmYYrzzLryFSPwYPREY6U
 oyFjX8XMBNMidSuLoqqaj6wM8cJb5gEfzaze1MzYRaLj2LSzdDXPb61Grf0PBun3ntGl/2OGXTS/58LXblSEQmlH8Mem3aBwPagSPERyztfL6JT9pGiViHJE
 C8E=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/12/2020 19:59, Sowjanya Komatineni wrote:
> Some CSI2 receivers support 8 data lanes.
> 
> So, this patch updates CSI2 maximum data lanes to be 8.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 2 +-
>  include/media/v4l2-fwnode.h                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 806cbf1..47e2143 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -534,7 +534,7 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
>  {
>  	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
>  	struct device_node *ep_node;
> -	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
> +	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES];
>  	unsigned int i;
>  	int ret;
>  

I'm not so sure about this change: it relies on the implicit knowledge that
this cal driver can handle only 4 lanes max, so that doubling
V4L2_FWNODE_CSI2_MAX_DATA_LANES is the same as the old 'V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2'.

I think we should either keep the existing code (which means data_lanes
is now larger than needed, so stack usage increases by 8 bytes), or perhaps
create a new define for this driver like CAL_MAX_DATA_LANES and use that.

In my opinion the original code should just be kept, but I've CC-ed Laurent
on this to hear what he thinks.

Regards,

	Hans

> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 4e1f6e1d..92401c1 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -25,7 +25,7 @@ struct fwnode_handle;
>  struct v4l2_async_notifier;
>  struct v4l2_async_subdev;
>  
> -#define V4L2_FWNODE_CSI2_MAX_DATA_LANES	4
> +#define V4L2_FWNODE_CSI2_MAX_DATA_LANES	8
>  
>  /**
>   * struct v4l2_fwnode_bus_mipi_csi2 - MIPI CSI-2 bus data structure
> 

