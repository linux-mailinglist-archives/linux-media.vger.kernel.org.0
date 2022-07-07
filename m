Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095AE569ACE
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 08:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbiGGGzw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 02:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbiGGGzv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 02:55:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAD32CDCB
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 23:55:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 100E2B81A69
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 06:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31386C3411E;
        Thu,  7 Jul 2022 06:55:44 +0000 (UTC)
Message-ID: <d248fd16-c995-083c-1b97-d04ca5084d51@xs4all.nl>
Date:   Thu, 7 Jul 2022 08:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/55] media: mc-entity: Rename
 media_entity_remote_pad() to media_pad_remote_pad_first()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-3-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220630230713.10580-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/1/22 01:06, Laurent Pinchart wrote:
> The media_entity_remote_pad() is misnamed, as it operates on a pad and
> not an entity. Rename it to media_pad_remote_pad_first() to clarify its
> behaviour.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  Documentation/driver-api/media/mc-core.rst                 | 3 +--
>  drivers/media/i2c/adv748x/adv748x.h                        | 2 +-
>  drivers/media/i2c/tvp5150.c                                | 2 +-
>  drivers/media/mc/mc-entity.c                               | 4 ++--
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c              | 2 +-
>  drivers/media/platform/qcom/camss/camss-csid.c             | 6 +++---
>  drivers/media/platform/qcom/camss/camss-csiphy.c           | 2 +-
>  drivers/media/platform/qcom/camss/camss-ispif.c            | 4 ++--
>  drivers/media/platform/qcom/camss/camss-vfe.c              | 2 +-
>  drivers/media/platform/qcom/camss/camss-video.c            | 6 +++---
>  drivers/media/platform/qcom/camss/camss.c                  | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c        | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-csi2.c        | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c         | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c        | 2 +-
>  drivers/media/platform/renesas/vsp1/vsp1_entity.c          | 4 ++--
>  drivers/media/platform/renesas/vsp1/vsp1_video.c           | 2 +-
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c        | 2 +-
>  drivers/media/platform/samsung/exynos4-is/common.c         | 2 +-
>  drivers/media/platform/samsung/exynos4-is/fimc-capture.c   | 6 +++---
>  drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c | 2 +-
>  drivers/media/platform/samsung/exynos4-is/fimc-lite.c      | 2 +-
>  drivers/media/platform/samsung/exynos4-is/media-dev.c      | 2 +-
>  drivers/media/platform/samsung/s3c-camif/camif-capture.c   | 2 +-
>  drivers/media/platform/st/stm32/stm32-dcmi.c               | 6 +++---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c       | 4 ++--
>  drivers/media/platform/ti/cal/cal-camerarx.c               | 2 +-
>  drivers/media/platform/ti/cal/cal-video.c                  | 2 +-
>  drivers/media/platform/ti/omap3isp/isp.c                   | 6 +++---
>  drivers/media/platform/ti/omap3isp/ispccdc.c               | 2 +-
>  drivers/media/platform/ti/omap3isp/ispccp2.c               | 2 +-
>  drivers/media/platform/ti/omap3isp/ispcsi2.c               | 2 +-
>  drivers/media/platform/ti/omap3isp/ispvideo.c              | 4 ++--
>  drivers/media/platform/video-mux.c                         | 2 +-
>  drivers/media/platform/xilinx/xilinx-csi2rxss.c            | 2 +-
>  drivers/media/platform/xilinx/xilinx-dma.c                 | 4 ++--
>  drivers/media/test-drivers/vimc/vimc-streamer.c            | 2 +-
>  drivers/staging/media/imx/imx-media-dev-common.c           | 2 +-
>  drivers/staging/media/imx/imx-media-utils.c                | 2 +-
>  drivers/staging/media/omap4iss/iss.c                       | 6 +++---
>  drivers/staging/media/omap4iss/iss_csi2.c                  | 2 +-
>  drivers/staging/media/omap4iss/iss_video.c                 | 2 +-
>  drivers/staging/media/tegra-video/vi.c                     | 4 ++--
>  include/media/media-entity.h                               | 4 ++--
>  44 files changed, 64 insertions(+), 65 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index 02481a2513b9..6eea6a3b6441 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -186,8 +186,7 @@ is required and the graph structure can be freed normally.
>  
>  Helper functions can be used to find a link between two given pads, or a pad
>  connected to another pad through an enabled link
> -:c:func:`media_entity_find_link()` and
> -:c:func:`media_entity_remote_pad()`.
> +:c:func:`media_entity_find_link()` and :c:func:`media_pad_remote_pad_first()`.
>  
>  Use count and power handling
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index 31bac06d46b5..d75eb3d8be5a 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -417,7 +417,7 @@ int adv748x_write_block(struct adv748x_state *state, int client_page,
>  
>  static inline struct v4l2_subdev *adv748x_get_remote_sd(struct media_pad *pad)
>  {
> -	pad = media_entity_remote_pad(pad);
> +	pad = media_pad_remote_pad_first(pad);
>  	if (!pad)
>  		return NULL;
>  
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 65472438444b..93a980c4e899 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -1285,7 +1285,7 @@ static int tvp5150_disable_all_input_links(struct tvp5150 *decoder)
>  	int err;
>  
>  	for (i = 0; i < TVP5150_NUM_PADS - 1; i++) {
> -		connector_pad = media_entity_remote_pad(&decoder->pads[i]);
> +		connector_pad = media_pad_remote_pad_first(&decoder->pads[i]);
>  		if (!connector_pad)
>  			continue;
>  
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 11f5207f73aa..55076fea7b58 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -900,7 +900,7 @@ media_entity_find_link(struct media_pad *source, struct media_pad *sink)
>  }
>  EXPORT_SYMBOL_GPL(media_entity_find_link);
>  
> -struct media_pad *media_entity_remote_pad(const struct media_pad *pad)
> +struct media_pad *media_pad_remote_pad_first(const struct media_pad *pad)
>  {
>  	struct media_link *link;
>  
> @@ -918,7 +918,7 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad)
>  	return NULL;
>  
>  }
> -EXPORT_SYMBOL_GPL(media_entity_remote_pad);
> +EXPORT_SYMBOL_GPL(media_pad_remote_pad_first);
>  
>  static void media_interface_init(struct media_device *mdev,
>  				 struct media_interface *intf,
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index dbdbdb648a0d..a3fe547b7fce 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1323,7 +1323,7 @@ static int cio2_video_link_validate(struct media_link *link)
>  	struct v4l2_subdev_format source_fmt;
>  	int ret;
>  
> -	if (!media_entity_remote_pad(entity->pads)) {
> +	if (!media_pad_remote_pad_first(entity->pads)) {
>  		dev_info(dev, "video node %s pad not connected\n", vd->name);
>  		return -ENOTCONN;
>  	}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index f993f349b66b..8e43efcc33eb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -245,7 +245,7 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  		}
>  
>  		if (!csid->testgen.enabled &&
> -		    !media_entity_remote_pad(&csid->pads[MSM_CSID_PAD_SINK]))
> +		    !media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]))
>  			return -ENOLINK;
>  	}
>  
> @@ -518,7 +518,7 @@ static int csid_set_test_pattern(struct csid_device *csid, s32 value)
>  	struct csid_testgen_config *tg = &csid->testgen;
>  
>  	/* If CSID is linked to CSIPHY, do not allow to enable test generator */
> -	if (value && media_entity_remote_pad(&csid->pads[MSM_CSID_PAD_SINK]))
> +	if (value && media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]))
>  		return -EBUSY;
>  
>  	tg->enabled = !!value;
> @@ -729,7 +729,7 @@ static int csid_link_setup(struct media_entity *entity,
>  			   const struct media_pad *remote, u32 flags)
>  {
>  	if (flags & MEDIA_LNK_FL_ENABLED)
> -		if (media_entity_remote_pad(local))
> +		if (media_pad_remote_pad_first(local))
>  			return -EBUSY;
>  
>  	if ((local->flags & MEDIA_PAD_FL_SINK) &&
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 75fcfc627400..3f726a7237f5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -693,7 +693,7 @@ static int csiphy_link_setup(struct media_entity *entity,
>  		struct csiphy_device *csiphy;
>  		struct csid_device *csid;
>  
> -		if (media_entity_remote_pad(local))
> +		if (media_pad_remote_pad_first(local))
>  			return -EBUSY;
>  
>  		sd = media_entity_to_v4l2_subdev(entity);
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index 4ee11bb979cd..c81a85b350c1 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -812,7 +812,7 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>  
>  	if (enable) {
> -		if (!media_entity_remote_pad(&line->pads[MSM_ISPIF_PAD_SINK]))
> +		if (!media_pad_remote_pad_first(&line->pads[MSM_ISPIF_PAD_SINK]))
>  			return -ENOLINK;
>  
>  		/* Config */
> @@ -1266,7 +1266,7 @@ static int ispif_link_setup(struct media_entity *entity,
>  			    const struct media_pad *remote, u32 flags)
>  {
>  	if (flags & MEDIA_LNK_FL_ENABLED) {
> -		if (media_entity_remote_pad(local))
> +		if (media_pad_remote_pad_first(local))
>  			return -EBUSY;
>  
>  		if (local->flags & MEDIA_PAD_FL_SINK) {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 5b148e9f8134..a9367fdca43c 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1470,7 +1470,7 @@ static int vfe_link_setup(struct media_entity *entity,
>  			  const struct media_pad *remote, u32 flags)
>  {
>  	if (flags & MEDIA_LNK_FL_ENABLED)
> -		if (media_entity_remote_pad(local))
> +		if (media_pad_remote_pad_first(local))
>  			return -EBUSY;
>  
>  	return 0;
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 307bb1dc4589..290df04c4d02 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -328,7 +328,7 @@ static struct v4l2_subdev *video_remote_subdev(struct camss_video *video,
>  {
>  	struct media_pad *remote;
>  
> -	remote = media_entity_remote_pad(&video->pad);
> +	remote = media_pad_remote_pad_first(&video->pad);
>  
>  	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>  		return NULL;
> @@ -507,7 +507,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			break;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> @@ -543,7 +543,7 @@ static void video_stop_streaming(struct vb2_queue *q)
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			break;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 79ad82e233cb..abe77f943868 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -937,7 +937,7 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			return NULL;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			return NULL;
>  
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 49bdcfba010b..1c12a1e75d45 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -845,7 +845,7 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  				continue;
>  
>  			/* Get remote CSI-2, if any. */
> -			csi_pad = media_entity_remote_pad(
> +			csi_pad = media_pad_remote_pad_first(
>  					&group->vin[i]->vdev.entity.pads[0]);
>  			if (!csi_pad)
>  				continue;
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> index fea8f00a9152..174aa6176f54 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> @@ -1313,7 +1313,7 @@ static int rcsi2_link_setup(struct media_entity *entity,
>  	channel = id % 4;
>  
>  	if (flags & MEDIA_LNK_FL_ENABLED) {
> -		if (media_entity_remote_pad(local)) {
> +		if (media_pad_remote_pad_first(local)) {
>  			dev_dbg(priv->dev,
>  				"Each VC can only be routed to one output channel\n");
>  			return -EINVAL;
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 6644b498929d..8d37fbdc266a 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -1258,7 +1258,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
>  		return ret == -ENOIOCTLCMD ? 0 : ret;
>  	}
>  
> -	pad = media_entity_remote_pad(&vin->pad);
> +	pad = media_pad_remote_pad_first(&vin->pad);
>  	if (!pad)
>  		return -EPIPE;
>  
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index 2e2aa9d746ee..576059f9bbe3 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -1032,7 +1032,7 @@ static void rvin_notify(struct v4l2_subdev *sd,
>  		if (!vin)
>  			continue;
>  
> -		pad = media_entity_remote_pad(&vin->pad);
> +		pad = media_pad_remote_pad_first(&vin->pad);
>  		if (!pad)
>  			continue;
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> index a116a3362f9e..4c3bd2b1ca28 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> @@ -516,8 +516,8 @@ int vsp1_entity_link_setup(struct media_entity *entity,
>   * higher than one for the data pipelines, except for the links to the HGO and
>   * HGT that can be enabled in addition to a regular data link. When traversing
>   * outgoing links this function ignores HGO and HGT entities and should thus be
> - * used in place of the generic media_entity_remote_pad() function to traverse
> - * data pipelines.
> + * used in place of the generic media_pad_remote_pad_first() function to
> + * traverse data pipelines.
>   *
>   * Return a pointer to the pad at the remote end of the first found enabled
>   * link, or NULL if no enabled link has been found.
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 51219b1b6ea9..e8e0ee5f2277 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -50,7 +50,7 @@ vsp1_video_remote_subdev(struct media_pad *local, u32 *pad)
>  {
>  	struct media_pad *remote;
>  
> -	remote = media_entity_remote_pad(local);
> +	remote = media_pad_remote_pad_first(local);
>  	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>  		return NULL;
>  
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 187d78075acb..a97c145bad98 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -200,7 +200,7 @@ static struct v4l2_subdev *rkisp1_get_remote_sensor(struct v4l2_subdev *sd)
>  	struct media_entity *sensor_me;
>  
>  	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
> -	remote = media_entity_remote_pad(local);
> +	remote = media_pad_remote_pad_first(local);
>  	if (!remote)
>  		return NULL;
>  
> diff --git a/drivers/media/platform/samsung/exynos4-is/common.c b/drivers/media/platform/samsung/exynos4-is/common.c
> index 26ee2388edfd..e41333535eac 100644
> --- a/drivers/media/platform/samsung/exynos4-is/common.c
> +++ b/drivers/media/platform/samsung/exynos4-is/common.c
> @@ -21,7 +21,7 @@ struct v4l2_subdev *fimc_find_remote_sensor(struct media_entity *entity)
>  
>  	while (pad->flags & MEDIA_PAD_FL_SINK) {
>  		/* source pad */
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> index 7ff4024003f4..03638c8f772d 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> @@ -737,7 +737,7 @@ static struct media_entity *fimc_pipeline_get_head(struct media_entity *me)
>  	struct media_pad *pad = &me->pads[0];
>  
>  	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad)
>  			break;
>  		me = pad->entity;
> @@ -810,7 +810,7 @@ static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
>  					return ret;
>  			}
>  
> -			pad = media_entity_remote_pad(&me->pads[sfmt.pad]);
> +			pad = media_pad_remote_pad_first(&me->pads[sfmt.pad]);
>  			if (!pad)
>  				return -EINVAL;
>  			me = pad->entity;
> @@ -1115,7 +1115,7 @@ static int fimc_pipeline_validate(struct fimc_dev *fimc)
>  
>  			if (p->flags & MEDIA_PAD_FL_SINK) {
>  				sink_pad = p;
> -				src_pad = media_entity_remote_pad(sink_pad);
> +				src_pad = media_pad_remote_pad_first(sink_pad);
>  				if (src_pad)
>  					break;
>  			}
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
> index 83688a7982f7..8f12240b0eb7 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
> @@ -465,7 +465,7 @@ static int isp_video_pipeline_validate(struct fimc_isp *isp)
>  			return -EPIPE;
>  
>  		/* Retrieve format at the source pad */
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
> index 1a396b7cd9a9..41b0a4a5929a 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
> @@ -789,7 +789,7 @@ static int fimc_pipeline_validate(struct fimc_lite *fimc)
>  				return -EPIPE;
>  		}
>  		/* Retrieve format at the source pad */
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> index 544b54e428c9..52b43ea04030 100644
> --- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> @@ -81,7 +81,7 @@ static void fimc_pipeline_prepare(struct fimc_pipeline *p,
>  			struct media_pad *spad = &me->pads[i];
>  			if (!(spad->flags & MEDIA_PAD_FL_SINK))
>  				continue;
> -			pad = media_entity_remote_pad(spad);
> +			pad = media_pad_remote_pad_first(spad);
>  			if (pad)
>  				break;
>  		}
> diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> index 140854ab4dd8..c2d8f1e425d8 100644
> --- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> @@ -811,7 +811,7 @@ static int camif_pipeline_validate(struct camif_dev *camif)
>  	int ret;
>  
>  	/* Retrieve format at the sensor subdev source pad */
> -	pad = media_entity_remote_pad(&camif->pads[0]);
> +	pad = media_pad_remote_pad_first(&camif->pads[0]);
>  	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  		return -EPIPE;
>  
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 09a743cd7004..10cbeff23a9a 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -611,7 +611,7 @@ static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			break;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> @@ -682,7 +682,7 @@ static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
>  		}
>  
>  		/* Walk to next entity */
> -		sink_pad = media_entity_remote_pad(src_pad);
> +		sink_pad = media_pad_remote_pad_first(src_pad);
>  		if (!sink_pad || !is_media_entity_v4l2_subdev(sink_pad->entity))
>  			break;
>  
> @@ -706,7 +706,7 @@ static int dcmi_pipeline_s_stream(struct stm32_dcmi *dcmi, int state)
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			break;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> index 682c26536034..1d46e113d01d 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> @@ -77,7 +77,7 @@ sun6i_video_remote_subdev(struct sun6i_video *video, u32 *pad)
>  {
>  	struct media_pad *remote;
>  
> -	remote = media_entity_remote_pad(&video->pad);
> +	remote = media_pad_remote_pad_first(&video->pad);
>  
>  	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>  		return NULL;
> @@ -560,7 +560,7 @@ static int sun6i_video_link_validate(struct media_link *link)
>  
>  	video->mbus_code = 0;
>  
> -	if (!media_entity_remote_pad(link->sink->entity->pads)) {
> +	if (!media_pad_remote_pad_first(link->sink->entity->pads)) {
>  		dev_info(video->csi->dev,
>  			 "video node %s pad not connected\n", vdev->name);
>  		return -ENOLINK;
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index e69fed117fea..7e72b5cb0423 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -592,7 +592,7 @@ int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
>  	if (!phy->source)
>  		return -EPIPE;
>  
> -	pad = media_entity_remote_pad(&phy->pads[CAL_CAMERARX_PAD_SINK]);
> +	pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
>  	if (!pad)
>  		return -EPIPE;
>  
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index 07ae1a34e6b0..776da0cfcdbe 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -685,7 +685,7 @@ static int cal_video_check_format(struct cal_ctx *ctx)
>  	const struct v4l2_mbus_framefmt *format;
>  	struct media_pad *remote_pad;
>  
> -	remote_pad = media_entity_remote_pad(&ctx->pad);
> +	remote_pad = media_pad_remote_pad_first(&ctx->pad);
>  	if (!remote_pad)
>  		return -ENODEV;
>  
> diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> index 4c937f3f323e..d251736eb420 100644
> --- a/drivers/media/platform/ti/omap3isp/isp.c
> +++ b/drivers/media/platform/ti/omap3isp/isp.c
> @@ -700,7 +700,7 @@ static int isp_pipeline_enable(struct isp_pipeline *pipe,
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			break;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> @@ -797,7 +797,7 @@ static int isp_pipeline_disable(struct isp_pipeline *pipe)
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			break;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> @@ -942,7 +942,7 @@ static int isp_pipeline_is_last(struct media_entity *me)
>  	pipe = to_isp_pipeline(me);
>  	if (pipe->stream_state == ISP_PIPELINE_STREAM_STOPPED)
>  		return 0;
> -	pad = media_entity_remote_pad(&pipe->output->pad);
> +	pad = media_pad_remote_pad_first(&pipe->output->pad);
>  	return pad->entity == me;
>  }
>  
> diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
> index 108b5e9f82cb..11afb8aec292 100644
> --- a/drivers/media/platform/ti/omap3isp/ispccdc.c
> +++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
> @@ -1133,7 +1133,7 @@ static void ccdc_configure(struct isp_ccdc_device *ccdc)
>  	ccdc->bt656 = false;
>  	ccdc->fields = 0;
>  
> -	pad = media_entity_remote_pad(&ccdc->pads[CCDC_PAD_SINK]);
> +	pad = media_pad_remote_pad_first(&ccdc->pads[CCDC_PAD_SINK]);
>  	sensor = media_entity_to_v4l2_subdev(pad->entity);
>  	if (ccdc->input == CCDC_INPUT_PARALLEL) {
>  		struct v4l2_subdev *sd =
> diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
> index acb58b6ddba1..fc90ff88464f 100644
> --- a/drivers/media/platform/ti/omap3isp/ispccp2.c
> +++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
> @@ -357,7 +357,7 @@ static int ccp2_if_configure(struct isp_ccp2_device *ccp2)
>  
>  	ccp2_pwr_cfg(ccp2);
>  
> -	pad = media_entity_remote_pad(&ccp2->pads[CCP2_PAD_SINK]);
> +	pad = media_pad_remote_pad_first(&ccp2->pads[CCP2_PAD_SINK]);
>  	sensor = media_entity_to_v4l2_subdev(pad->entity);
>  	buscfg = v4l2_subdev_to_bus_cfg(pipe->external);
>  
> diff --git a/drivers/media/platform/ti/omap3isp/ispcsi2.c b/drivers/media/platform/ti/omap3isp/ispcsi2.c
> index 6302e0c94034..6870980a2fa9 100644
> --- a/drivers/media/platform/ti/omap3isp/ispcsi2.c
> +++ b/drivers/media/platform/ti/omap3isp/ispcsi2.c
> @@ -561,7 +561,7 @@ static int csi2_configure(struct isp_csi2_device *csi2)
>  	if (csi2->contexts[0].enabled || csi2->ctrl.if_enable)
>  		return -EBUSY;
>  
> -	pad = media_entity_remote_pad(&csi2->pads[CSI2_PAD_SINK]);
> +	pad = media_pad_remote_pad_first(&csi2->pads[CSI2_PAD_SINK]);
>  	sensor = media_entity_to_v4l2_subdev(pad->entity);
>  	buscfg = v4l2_subdev_to_bus_cfg(pipe->external);
>  
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index 8811d6dd4ee7..d7059180e80e 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -206,7 +206,7 @@ isp_video_remote_subdev(struct isp_video *video, u32 *pad)
>  {
>  	struct media_pad *remote;
>  
> -	remote = media_entity_remote_pad(&video->pad);
> +	remote = media_pad_remote_pad_first(&video->pad);
>  
>  	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>  		return NULL;
> @@ -981,7 +981,7 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
>  			continue;
>  
>  		/* ISP entities have always sink pad == 0. Find source. */
> -		source_pad = media_entity_remote_pad(&ents[i]->pads[0]);
> +		source_pad = media_pad_remote_pad_first(&ents[i]->pads[0]);
>  		if (source_pad == NULL)
>  			continue;
>  
> diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
> index b31e5913a4cd..71d97042a470 100644
> --- a/drivers/media/platform/video-mux.c
> +++ b/drivers/media/platform/video-mux.c
> @@ -118,7 +118,7 @@ static int video_mux_s_stream(struct v4l2_subdev *sd, int enable)
>  		return -EINVAL;
>  	}
>  
> -	pad = media_entity_remote_pad(&sd->entity.pads[vmux->active]);
> +	pad = media_pad_remote_pad_first(&sd->entity.pads[vmux->active]);
>  	if (!pad) {
>  		dev_err(sd->dev, "Failed to find remote source pad\n");
>  		return -ENOLINK;
> diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> index 051c60cba1e0..cf8e892c47f0 100644
> --- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> @@ -474,7 +474,7 @@ static struct v4l2_subdev *xcsi2rxss_get_remote_subdev(struct media_pad *local)
>  {
>  	struct media_pad *remote;
>  
> -	remote = media_entity_remote_pad(local);
> +	remote = media_pad_remote_pad_first(local);
>  	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>  		return NULL;
>  
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index 338c3661d809..2d1ef7a25c33 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -44,7 +44,7 @@ xvip_dma_remote_subdev(struct media_pad *local, u32 *pad)
>  {
>  	struct media_pad *remote;
>  
> -	remote = media_entity_remote_pad(local);
> +	remote = media_pad_remote_pad_first(local);
>  	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>  		return NULL;
>  
> @@ -107,7 +107,7 @@ static int xvip_pipeline_start_stop(struct xvip_pipeline *pipe, bool start)
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			break;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
> index 65feb3c596db..807551a5143b 100644
> --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> @@ -30,7 +30,7 @@ static struct media_entity *vimc_get_source_entity(struct media_entity *ent)
>  	for (i = 0; i < ent->num_pads; i++) {
>  		if (ent->pads[i].flags & MEDIA_PAD_FL_SOURCE)
>  			continue;
> -		pad = media_entity_remote_pad(&ent->pads[i]);
> +		pad = media_pad_remote_pad_first(&ent->pads[i]);
>  		return pad ? pad->entity : NULL;
>  	}
>  	return NULL;
> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
> index 80b69a9a752c..e6d6ed3b1161 100644
> --- a/drivers/staging/media/imx/imx-media-dev-common.c
> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
> @@ -235,7 +235,7 @@ static int imx_media_inherit_controls(struct imx_media_dev *imxmd,
>  		if (!(spad->flags & MEDIA_PAD_FL_SINK))
>  			continue;
>  
> -		pad = media_entity_remote_pad(spad);
> +		pad = media_pad_remote_pad_first(spad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			continue;
>  
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 94bc866ca28c..294c808b2ebe 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -698,7 +698,7 @@ imx_media_pipeline_pad(struct media_entity *start_entity, u32 grp_id,
>  		    (!upstream && !(spad->flags & MEDIA_PAD_FL_SOURCE)))
>  			continue;
>  
> -		pad = media_entity_remote_pad(spad);
> +		pad = media_pad_remote_pad_first(spad);
>  		if (!pad)
>  			continue;
>  
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index 68588e9dab0b..28aacda0f5a7 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -395,7 +395,7 @@ static int iss_pipeline_disable(struct iss_pipeline *pipe,
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			break;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> @@ -464,7 +464,7 @@ static int iss_pipeline_enable(struct iss_pipeline *pipe,
>  		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>  			break;
>  
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  
> @@ -553,7 +553,7 @@ static int iss_pipeline_is_last(struct media_entity *me)
>  	pipe = to_iss_pipeline(me);
>  	if (pipe->stream_state == ISS_PIPELINE_STREAM_STOPPED)
>  		return 0;
> -	pad = media_entity_remote_pad(&pipe->output->pad);
> +	pad = media_pad_remote_pad_first(&pipe->output->pad);
>  	return pad->entity == me;
>  }
>  
> diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
> index 124ab2f44fbf..04ce0e7eb557 100644
> --- a/drivers/staging/media/omap4iss/iss_csi2.c
> +++ b/drivers/staging/media/omap4iss/iss_csi2.c
> @@ -538,7 +538,7 @@ static int csi2_configure(struct iss_csi2_device *csi2)
>  	if (csi2->contexts[0].enabled || csi2->ctrl.if_enable)
>  		return -EBUSY;
>  
> -	pad = media_entity_remote_pad(&csi2->pads[CSI2_PAD_SINK]);
> +	pad = media_pad_remote_pad_first(&csi2->pads[CSI2_PAD_SINK]);
>  	sensor = media_entity_to_v4l2_subdev(pad->entity);
>  	pdata = sensor->host_priv;
>  
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index d0da083deed5..9512cd3314f2 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -190,7 +190,7 @@ iss_video_remote_subdev(struct iss_video *video, u32 *pad)
>  {
>  	struct media_pad *remote;
>  
> -	remote = media_entity_remote_pad(&video->pad);
> +	remote = media_pad_remote_pad_first(&video->pad);
>  
>  	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>  		return NULL;
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 8e184aa4c252..9d46a36cc014 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -157,7 +157,7 @@ tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
>  {
>  	struct media_pad *pad;
>  
> -	pad = media_entity_remote_pad(&chan->pad);
> +	pad = media_pad_remote_pad_first(&chan->pad);
>  	if (!pad)
>  		return NULL;
>  
> @@ -177,7 +177,7 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
>  
>  	pad = &subdev->entity.pads[0];
>  	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
> -		pad = media_entity_remote_pad(pad);
> +		pad = media_pad_remote_pad_first(pad);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			break;
>  		entity = pad->entity;
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index a9a1c0ec5d1c..ab84476b25c8 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -848,7 +848,7 @@ struct media_link *media_entity_find_link(struct media_pad *source,
>  		struct media_pad *sink);
>  
>  /**
> - * media_entity_remote_pad - Find the pad at the remote end of a link
> + * media_pad_remote_pad_first - Find the first pad at the remote end of a link
>   * @pad: Pad at the local end of the link
>   *
>   * Search for a remote pad connected to the given pad by iterating over all
> @@ -857,7 +857,7 @@ struct media_link *media_entity_find_link(struct media_pad *source,
>   * Return: returns a pointer to the pad at the remote end of the first found
>   * enabled link, or %NULL if no enabled link has been found.
>   */
> -struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
> +struct media_pad *media_pad_remote_pad_first(const struct media_pad *pad);
>  
>  /**
>   * media_entity_is_streaming - Test if an entity is part of a streaming pipeline
