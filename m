Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55B232D0B8
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 11:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238549AbhCDKb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 05:31:29 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59707 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238485AbhCDKbI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 05:31:08 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HlFOlZa1XOruFHlFRlFGfJ; Thu, 04 Mar 2021 11:30:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614853826; bh=8dBoIGD5WJNO8NYeWqPRnVSei9pgkj34EmYskMKbeU8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IOpZqX7UtlTAdP472xCUC392I88rohl7tVX9+6dFEXdYfTs4gBrYINiwjBVgf/j59
         snvndlQh+pg/Z/5x2dQkI1fO6bdxZIMC7oUIdI86yX/sbclCsvxcSbWxoQ7RaA1/Wm
         yGlVgA46dAE++8TYLm4ZoKqutnPSvJ7KO8vIgaru9rngD+K8TigraiL+NEvfatUPmv
         PSd7I3gViUxZe95tIFwsKqmH22rA6nepCsmdwN+T3flQ9TDq7ho6CnrcQXj8VopqCg
         mEnPdFdQuCNz1s3DPVn6eGdpd9VXQFE8VmWpzeSIQrL33ATc9lRyTBUiL4t+M9uxHt
         B/oWVYKJXODWA==
Subject: Re: [PATCH] media: qcom: camss: Fix overflows in clock rate
 calculations
To:     Vladimir Lypak <junak.pub@gmail.com>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
References: <20210210122906.3037085-1-junak.pub@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <df806bab-297a-b362-c961-a6fee7d9d1ca@xs4all.nl>
Date:   Thu, 4 Mar 2021 11:30:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210210122906.3037085-1-junak.pub@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG9Km1B3GtcTV0dg9fu7u9EoQUFciWGz3cCjBZl1JN2L+XUKBFTwxFSdDfiUuVTN7iZbPYEtJI8DEx7zUNnhKTkJs3xgHhJyxGXyZ0S+/KWBxdjLzXJe
 6eT6UxorjILfGTno4rMNeCZWj6KchDZZdpE0OyICFbR/aQuGNCO5ETSklXHKiOdXQ8s29okRHRfrpzF8PsXWXv/XES0LeDTyiDSV5yhN7IzvHi5EoyawedRJ
 NCz/3TLZNmQ6/Xz/Y/O7e2mWzEhCtLC3x+e2Nw7nbhzuy3eDOquIKrnwa4yAinpQ2tmVMnIsp7v5hx3/NgS59s8yfTEocUhpo2Rgj1BTL/viMOTeOGxhI9ZS
 lT3roc+NraR2Oc+Zz/p7DsdggAHpLGzTVBckWrI16Mm3HOsjE5X37OzJndNwZmjNWfwePI1o8TMl/RnXRXY/Icfv6JOBUw7pAS+3fSL7YWYPqL6RKq87rEb+
 f8aNpwqJXRqOBHtVRm5FUetI2lypd1ltR+ls6qrALNnc/+t22XyZqZhGFYs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/02/2021 13:29, Vladimir Lypak wrote:
> Because of u32 type being used to store pixel clock rate, expression used
> to calculate pipeline clocks (pixel_clock * bpp) produces wrong value due
> to integer overflow. This patch changes data type used to store, pass and
> retrieve pixel_clock from u32 to u64 to make this mistake less likely to
> be repeated in the future.

This patch conflicts with Andrey's patch:

https://patchwork.linuxtv.org/project/linux-media/patch/20210217221134.2606-4-andrey.konovalov@linaro.org/

I've picked up Andrey's patch in a pull request (not yet merged in our media master tree),
but you should rebase your patch on top of his if it is still needed.

Regards,

	Hans

> 
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c           | 2 +-
>  drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c | 4 ++--
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 4 ++--
>  drivers/media/platform/qcom/camss/camss-csiphy.c         | 4 ++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h         | 2 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c            | 4 ++--
>  drivers/media/platform/qcom/camss/camss.c                | 2 +-
>  drivers/media/platform/qcom/camss/camss.h                | 2 +-
>  8 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index be3fe76f3dc30..6307b889baa69 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -462,7 +462,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>  static int csid_set_clock_rates(struct csid_device *csid)
>  {
>  	struct device *dev = csid->camss->dev;
> -	u32 pixel_clock;
> +	u64 pixel_clock;
>  	int i, j;
>  	int ret;
>  
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> index 12bce391d71fd..ec66d1557b8b1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> @@ -57,7 +57,7 @@ static void csiphy_reset(struct csiphy_device *csiphy)
>   * Return settle count value or 0 if the CSI2 pixel clock
>   * frequency is not available
>   */
> -static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
> +static u8 csiphy_settle_cnt_calc(u64 pixel_clock, u8 bpp, u8 num_lanes,
>  				 u32 timer_clk_rate)
>  {
>  	u32 mipi_clock; /* Hz */
> @@ -83,7 +83,7 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
>  
>  static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  				struct csiphy_config *cfg,
> -				u32 pixel_clock, u8 bpp, u8 lane_mask)
> +				u64 pixel_clock, u8 bpp, u8 lane_mask)
>  {
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	u8 settle_cnt;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 97cb9de850315..cd6eb88a7c153 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -113,7 +113,7 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
>   * Return settle count value or 0 if the CSI2 pixel clock
>   * frequency is not available
>   */
> -static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
> +static u8 csiphy_settle_cnt_calc(u64 pixel_clock, u8 bpp, u8 num_lanes,
>  				 u32 timer_clk_rate)
>  {
>  	u32 mipi_clock; /* Hz */
> @@ -137,7 +137,7 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
>  
>  static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  				struct csiphy_config *cfg,
> -				u32 pixel_clock, u8 bpp, u8 lane_mask)
> +				u64 pixel_clock, u8 bpp, u8 lane_mask)
>  {
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	u8 settle_cnt;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 509c9a59c09cd..61628f55c4f63 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -102,7 +102,7 @@ static u8 csiphy_get_bpp(const struct csiphy_format *formats,
>  static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>  {
>  	struct device *dev = csiphy->camss->dev;
> -	u32 pixel_clock;
> +	u64 pixel_clock;
>  	int i, j;
>  	int ret;
>  
> @@ -238,7 +238,7 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>  static int csiphy_stream_on(struct csiphy_device *csiphy)
>  {
>  	struct csiphy_config *cfg = &csiphy->cfg;
> -	u32 pixel_clock;
> +	u64 pixel_clock;
>  	u8 lane_mask = csiphy_get_lane_mask(&cfg->csi2->lane_cfg);
>  	u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
>  				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index f7967ef836dcc..450c8247bd533 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -50,7 +50,7 @@ struct csiphy_hw_ops {
>  	void (*reset)(struct csiphy_device *csiphy);
>  	void (*lanes_enable)(struct csiphy_device *csiphy,
>  			     struct csiphy_config *cfg,
> -			     u32 pixel_clock, u8 bpp, u8 lane_mask);
> +			     u64 pixel_clock, u8 bpp, u8 lane_mask);
>  	void (*lanes_disable)(struct csiphy_device *csiphy,
>  			      struct csiphy_config *cfg);
>  	irqreturn_t (*isr)(int irq, void *dev);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index fae2b513b2f9d..b2c95b46ce661 100644
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
> index 8fefce57bc49f..eb55cf436b717 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -555,7 +555,7 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
> +int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
>  {
>  	struct media_entity *sensor;
>  	struct v4l2_subdev *subdev;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 3a0484683cd6e..fabfce9a3496c 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -108,7 +108,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>  			struct device *dev);
>  void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>  struct media_entity *camss_find_sensor(struct media_entity *entity);
> -int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
> +int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>  int camss_pm_domain_on(struct camss *camss, int id);
>  void camss_pm_domain_off(struct camss *camss, int id);
>  void camss_delete(struct camss *camss);
> 

