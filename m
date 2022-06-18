Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B93BC550771
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 01:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbiFRXUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 19:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFRXUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 19:20:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C202B4AC
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 16:20:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 373E0993;
        Sun, 19 Jun 2022 01:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655594435;
        bh=HW//KFvb3Uk1kTukT6WoPhd8syVLHG4jvIVfhXbA0xg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pOim59snAyG18oMGuvXRytr9N1CrqP/+U0vv5GplDY/sj8Sppywrql/6qEBiSPa0M
         ixcBxm2tmcQcb+aq9A8oAW61YbfYK3Ao3lnG7aA34UoZ1JYrVfcsDp47DnDGlDBfR8
         tlklJYqTOCEY5/CnxwaY/SLcLZn/AkPPukWXCamI=
Date:   Sun, 19 Jun 2022 02:20:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: stm32: dcmi: Register V4L2 subdev nodes
Message-ID: <Yq5dtc3MHz5gp5BK@pendragon.ideasonboard.com>
References: <20220618222335.478205-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220618222335.478205-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Sun, Jun 19, 2022 at 12:23:35AM +0200, Marek Vasut wrote:
> Unless the V4L2 device calls v4l2_device_register_subdev_nodes(),
> the /dev/v4l-subdev* sub-device nodes are not registered and thus
> not created. Add the missing call.

This driver configures the subdevs internally. Exposing the subdev nodes
to userspace would conflict with driver operation.

If you need the subdev nodes only to query subdev information, you can
use v4l2_device_register_ro_subdev_nodes(). Ideally I'd prefer this
driver to expose subdev nodes to userspace and stop propagating formats
internally, but that may break applications :-(

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
> Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Philippe CORNU <philippe.cornu@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/media/platform/st/stm32/stm32-dcmi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 5f08ba47ea96b..56f4e04bc7c49 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1805,6 +1805,12 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  
>  	dcmi->vdev->ctrl_handler = dcmi->source->ctrl_handler;
>  
> +	ret = v4l2_device_register_subdev_nodes(&dcmi->v4l2_dev);
> +	if (ret) {
> +		dev_err(dcmi->dev, "Count not register subdev nodes\n");
> +		return ret;
> +	}
> +
>  	ret = dcmi_formats_init(dcmi);
>  	if (ret) {
>  		dev_err(dcmi->dev, "No supported mediabus format found\n");

-- 
Regards,

Laurent Pinchart
