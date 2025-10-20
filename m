Return-Path: <linux-media+bounces-45069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F80BF2FD6
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 69ED834E567
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E581A2D5C6C;
	Mon, 20 Oct 2025 18:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8wVGJLG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB81C3314;
	Mon, 20 Oct 2025 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760985992; cv=none; b=VuXyabzlSHVP4sWpevg/T58j2q8kxDKPdefZpyUKeXHzzm73GLs6xr2F3z8dSlwa25F9mUnmWKxZL8OMTzVamTSaBHZi3G6rFXNtHy3UiXphNU2x21TPgZXlNLiv71Kl1q7glhhaFgvCThqOTuBGGX7UFBF5IrfK9XJG2iylWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760985992; c=relaxed/simple;
	bh=Y6cCYtHS8ljGWK/XNbrYzLPntPrCQKewobnH6mUBAbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+2t9Bqu11LnyNnc2+fKMwB4yINU48f1rL/X1eHiN2y7GYjHWSfiLpmSJyfi13fLyUasZYo9FhGNJ1E9t+nqHzmd/A/Q/oh62nQTtHR4fsnxptj4/FxSIF7231hB1p1dvhdqJmpxrLI+LKl7PHlnVJcxDNz5OHLVnEg0yYQN5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8wVGJLG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED6AC113D0;
	Mon, 20 Oct 2025 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760985991;
	bh=Y6cCYtHS8ljGWK/XNbrYzLPntPrCQKewobnH6mUBAbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n8wVGJLG2E60McizrptQi/R56kCAf0GLTZypmdPsMl7E2jpJF04r+RGYqnhqzlc7b
	 zp87lTVXZ9suWJkqap2ZQdy1/i4B6Rz5bt9uepZUGS1dOAeitt48+iFPXqXB7jDQKz
	 vUFCpIe/+0kh2ysIoxsvnaAcusDpwh1GIXlIFNJPzQ43J4rYyyP/+botHbxL+Kfz+d
	 MzzkjholaxVQWWkXUiWq5yGcLVgc1Ds+j0S9ct6ONPbAA0MkgWvD0diqI/0stBJ2HY
	 RLu0shG8/3txeeEVR7AsHQRUCX786YqH++K5FvRB3Ru6Ixi9uyiU/rq05mj21VdraL
	 nczc6KPd1O/Cw==
Message-ID: <79a4bc8a-18e4-4b38-ab7e-53e34d0e8dbb@kernel.org>
Date: Mon, 20 Oct 2025 19:46:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: qcom: camss: Add link support for TPG
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
 <20251017-camss_tpg-v5-2-cafe3ad42163@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251017-camss_tpg-v5-2-cafe3ad42163@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 06:06, Wenmeng Liu wrote:
> TPG is connected to the csid as an entity, the link
> needs to be adapted.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   | 43 +++++++++++++-------
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  1 +
>   drivers/media/platform/qcom/camss/camss-csiphy.h |  2 +
>   drivers/media/platform/qcom/camss/camss.c        | 52 ++++++++++++++++++++++++
>   4 files changed, 84 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 5284b5857368c37c202cd89dad6ae8042b637537..196cbc0b60e9bf95a06b053c69c967e345ffcd4b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -35,6 +35,8 @@
>   #define		HW_VERSION_REVISION	16
>   #define		HW_VERSION_GENERATION	28
>   
> +#define LANE_CFG_BITWIDTH 4
> +
>   #define MSM_CSID_NAME "msm_csid"
>   
>   const char * const csid_testgen_modes[] = {
> @@ -1227,18 +1229,22 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
>   }
>   
>   /*
> - * csid_get_lane_assign - Calculate CSI2 lane assign configuration parameter
> - * @lane_cfg - CSI2 lane configuration
> + * csid_get_lane_assign - Calculate lane assign by csiphy/tpg lane num
> + * @num: lane num
> + * @pos_array: Array of lane positions
>    *
>    * Return lane assign
>    */
> -static u32 csid_get_lane_assign(struct csiphy_lanes_cfg *lane_cfg)
> +static u32 csid_get_lane_assign(int num, struct csiphy_lanes_cfg *lane_cfg)

ah semantic commnet

add your parameter to the end, not to the start please and give the "int 
num" are more meaningful name - num_lanes ? Decided for yourself what 
that name should be.

>   {
>   	u32 lane_assign = 0;
> +	int pos;
>   	int i;
>   
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_assign |= lane_cfg->data[i].pos << (i * 4);
> +	for (i = 0; i < num; i++) {
> +		pos = lane_cfg ? lane_cfg->data[i].pos : i;
> +		lane_assign |= pos << (i * LANE_CFG_BITWIDTH);
> +	}
>   
>   	return lane_assign;
>   }
> @@ -1266,6 +1272,7 @@ static int csid_link_setup(struct media_entity *entity,
>   		struct csid_device *csid;
>   		struct csiphy_device *csiphy;
>   		struct csiphy_lanes_cfg *lane_cfg;
> +		struct tpg_device *tpg;
>   
>   		sd = media_entity_to_v4l2_subdev(entity);
>   		csid = v4l2_get_subdevdata(sd);
> @@ -1277,18 +1284,26 @@ static int csid_link_setup(struct media_entity *entity,
>   			return -EBUSY;
>   
>   		sd = media_entity_to_v4l2_subdev(remote->entity);
> -		csiphy = v4l2_get_subdevdata(sd);
> +		if (sd->grp_id == TPG_GUP_ID) {
> +			tpg = v4l2_get_subdevdata(sd);
>   
> -		/* If a sensor is not linked to CSIPHY */
> -		/* do no allow a link from CSIPHY to CSID */
> -		if (!csiphy->cfg.csi2)
> -			return -EPERM;
> +			csid->phy.lane_cnt = tpg->res->lane_cnt;
> +			csid->phy.csiphy_id = tpg->id;
> +			csid->phy.lane_assign = csid_get_lane_assign(csid->phy.lane_cnt, NULL);
> +		} else {
> +			csiphy = v4l2_get_subdevdata(sd);
>   
> -		csid->phy.csiphy_id = csiphy->id;
> +			/* If a sensor is not linked to CSIPHY */
> +			/* do no allow a link from CSIPHY to CSID */
> +			if (!csiphy->cfg.csi2)
> +				return -EPERM;
>   
> -		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
> -		csid->phy.lane_cnt = lane_cfg->num_data;
> -		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
> +			csid->phy.csiphy_id = csiphy->id;
> +
> +			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
> +			csid->phy.lane_cnt = lane_cfg->num_data;
> +			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg->num_data, lane_cfg);
> +		}
>   	}
>   	/* Decide which virtual channels to enable based on which source pads are enabled */
>   	if (local->flags & MEDIA_PAD_FL_SOURCE) {
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..680580d7fe46a215777f3fa1b347f4297deea024 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -799,6 +799,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>   	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>   	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
>   		 MSM_CSIPHY_NAME, csiphy->id);
> +	sd->grp_id = CSIPHY_GUP_ID;
>   	v4l2_set_subdevdata(sd, csiphy);
>   
>   	ret = csiphy_init_formats(sd, NULL);
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 895f80003c441dcacf98435f91567f90afa29279..b7bcf2bdd2124f77b5354b15b33aa1e0983143e8 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -21,6 +21,8 @@
>   #define MSM_CSIPHY_PAD_SRC 1
>   #define MSM_CSIPHY_PADS_NUM 2
>   
> +#define CSIPHY_GUP_ID 1
> +
>   struct csiphy_lane {
>   	u8 pos;
>   	u8 pol;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2fbcd0e343aac9620a5a30719c42e1b887cf34ed..2ede19e1347ae32f2f6919905b535352bcd134be 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3691,6 +3691,19 @@ static int camss_init_subdevices(struct camss *camss)
>   		}
>   	}
>   
> +	if (camss->tpg) {
> +		for (i = 0; i < camss->res->tpg_num; i++) {
> +			ret = msm_tpg_subdev_init(camss, &camss->tpg[i],
> +						  &res->tpg_res[i], i);
> +			if (ret < 0) {
> +				dev_err(camss->dev,
> +					"Failed to init tpg%d sub-device: %d\n",
> +					i, ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
>   	/* note: SM8250 requires VFE to be initialized before CSID */
>   	for (i = 0; i < camss->res->vfe_num; i++) {
>   		ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
> @@ -3779,6 +3792,23 @@ static int camss_link_entities(struct camss *camss)
>   		}
>   	}
>   
> +	for (i = 0; i < camss->res->tpg_num; i++) {
> +		for (j = 0; j < camss->res->csid_num; j++) {
> +			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
> +						    MSM_TPG_PAD_SRC,
> +						    &camss->csid[j].subdev.entity,
> +						    MSM_CSID_PAD_SINK,
> +						    0);
> +			if (ret < 0) {
> +				camss_link_err(camss,
> +					       camss->tpg[i].subdev.entity.name,
> +					       camss->csid[j].subdev.entity.name,
> +					       ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
>   	if (camss->ispif) {
>   		for (i = 0; i < camss->res->csid_num; i++) {
>   			for (j = 0; j < camss->ispif->line_num; j++) {
> @@ -3883,6 +3913,19 @@ static int camss_register_entities(struct camss *camss)
>   		}
>   	}
>   
> +	if (camss->tpg) {
> +		for (i = 0; i < camss->res->tpg_num; i++) {
> +			ret = msm_tpg_register_entity(&camss->tpg[i],
> +						      &camss->v4l2_dev);
> +			if (ret < 0) {
> +				dev_err(camss->dev,
> +					"Failed to register tpg%d entity: %d\n",
> +					i, ret);
> +				goto err_reg_tpg;
> +			}
> +		}
> +	}
> +
>   	for (i = 0; i < camss->res->csid_num; i++) {
>   		ret = msm_csid_register_entity(&camss->csid[i],
>   					       &camss->v4l2_dev);
> @@ -3926,6 +3969,10 @@ static int camss_register_entities(struct camss *camss)
>   	for (i--; i >= 0; i--)
>   		msm_csid_unregister_entity(&camss->csid[i]);
>   
> +	i = camss->res->tpg_num;

\n

> +err_reg_tpg:
> +	for (i--; i >= 0; i--)
> +		msm_tpg_unregister_entity(&camss->tpg[i]);

This is broken for non-TPG cases - for example it is possible to jump to 
err_reg_csid when camss->tpg == NULL and then to dereference &camss->tpg[i];

Please fix.

>   	i = camss->res->csiphy_num;
>   err_reg_csiphy:
>   	for (i--; i >= 0; i--)
> @@ -3947,6 +3994,11 @@ static void camss_unregister_entities(struct camss *camss)
>   	for (i = 0; i < camss->res->csiphy_num; i++)
>   		msm_csiphy_unregister_entity(&camss->csiphy[i]);
>   
> +	if (camss->tpg) {
> +		for (i = 0; i < camss->res->tpg_num; i++)
> +			msm_tpg_unregister_entity(&camss->tpg[i]);
> +	}
> +
>   	for (i = 0; i < camss->res->csid_num; i++)
>   		msm_csid_unregister_entity(&camss->csid[i]);
>   
> 


