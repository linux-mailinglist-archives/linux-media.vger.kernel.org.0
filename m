Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04ECC31E75C
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 09:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhBRIUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 03:20:13 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41945 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhBRIRf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 03:17:35 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AD266C000C;
        Thu, 18 Feb 2021 08:15:07 +0000 (UTC)
Date:   Thu, 18 Feb 2021 09:15:33 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: qcom: camss: Fix overflows in clock rate
 calculations
Message-ID: <20210218081533.tbivz52c37327ukp@uno.localdomain>
References: <20210217221134.2606-1-andrey.konovalov@linaro.org>
 <20210217221134.2606-4-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210217221134.2606-4-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Thu, Feb 18, 2021 at 01:11:34AM +0300, Andrey Konovalov wrote:
> From: Vladimir Lypak <junak.pub@gmail.com>
>
> Because of u32 type being used to store pixel clock rate, expression used
> to calculate pipeline clocks (pixel_clock * bpp) produces wrong value due
> to integer overflow. This patch changes data type used to store, pass and
> retrieve pixel_clock from u32 to u64 to make this mistake less likely to
> be repeated in the future.

I see this might be the cause for the overflow
        tmp = pixel_clock[j] * bpp / 64;
and anyway PIXEL_RATE is an u64 control, so this seems correct
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> Acked-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
>  drivers/media/platform/qcom/camss/camss.c     | 2 +-
>  drivers/media/platform/qcom/camss/camss.h     | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index fae2b513b2f9..b2c95b46ce66 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1112,7 +1112,7 @@ static inline void vfe_isr_halt_ack(struct vfe_device *vfe)
>  static int vfe_set_clock_rates(struct vfe_device *vfe)
>  {
>  	struct device *dev = vfe->camss->dev;
> -	u32 pixel_clock[MSM_VFE_LINE_NUM];
> +	u64 pixel_clock[MSM_VFE_LINE_NUM];
>  	int i, j;
>  	int ret;
>
> @@ -1194,7 +1194,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
>   */
>  static int vfe_check_clock_rates(struct vfe_device *vfe)
>  {
> -	u32 pixel_clock[MSM_VFE_LINE_NUM];
> +	u64 pixel_clock[MSM_VFE_LINE_NUM];
>  	int i, j;
>  	int ret;
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index eb8fb8c34acd..d82bbc2213a6 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -578,7 +578,7 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
> +int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
>  {
>  	struct media_entity *sensor;
>  	struct v4l2_subdev *subdev;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 86cdc25189eb..e29466d07ad2 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -110,7 +110,7 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>  struct media_entity *camss_find_sensor(struct media_entity *entity);
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>  			unsigned int lanes);
> -int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
> +int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>  int camss_pm_domain_on(struct camss *camss, int id);
>  void camss_pm_domain_off(struct camss *camss, int id);
>  void camss_delete(struct camss *camss);
> --
> 2.17.1
>
