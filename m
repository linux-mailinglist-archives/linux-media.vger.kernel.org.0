Return-Path: <linux-media+bounces-57865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEgdJUgDzWmSZQYAu9opvQ
	(envelope-from <linux-media+bounces-57865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:36:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA0379947
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B808431EDB75
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 11:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048823F99EF;
	Wed,  1 Apr 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ow42izfT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048E3FA5D8
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042778; cv=none; b=JuspfpAvEcsy4A/En7Z1umKedxsY6l8AAGWTlvPB52l6v0l1/oyUjf+Qsq+NyJ6DmFzsipFr2OspdzCcJLwa5c4bEEXeJaKO8iGX4oLmzphuIg81K8ISCXYbcM5nL7mx6/tQVIdXTSaDFQxyvUALxSM5QWvLDVt0cPhFjWzuhtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042778; c=relaxed/simple;
	bh=rDq/Oz7HvxvQzJ5OlRCKpPZpjNh8qCNicyFGjpjLpEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ksi0zLuVRM39QQtIEuRm+41S4J1P3oHrPG5SXhtYjnl3g3Rbda/FoDoESMdVeCLHL3DSyVelOv0uLPljnEmCzC3MOjzJlkSmMcEnI8KzTZLkHkDsFHI68452wnf5ztaBijmQBoFv/U7Kox2HXKDapmNBZIwk1QVhiOHkddRTiQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ow42izfT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b41b545d9so7345164f8f.2
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 04:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775042774; x=1775647574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Pyx9gwZ4QMH+c1GPDOh9EwDTt+nJL7P0xkOA/0V1Fg=;
        b=Ow42izfTee8rsEqg9IQ6ipxb89PIo8wMCm30TUOVaUMQYFVA+PhumRgHW8ZtY71dus
         lFyIUsegbSxwVL9+460bc1DPYd9rJ8x1HgzTrjdm+Q+mehPUEmCTOhU3mPleDgw5rOxo
         bt/B9v8olXG15iQFQNUrVNx3yZPglwiimf+rw+lSuZbCvYpMLBIL/hDIlqBuGpl+7Jsb
         422p8lAM6dympmZXjDNqZuV7b9inkaZ5btPQ8phAf4kFTADe2+S2I3lQqnN6itHaEUdx
         Pkbu1m97i2WiXijQcccD2a6NPlIeYqOB6IHQX0vZayjhn3GMq7ZTYuuew+bCdxejn83F
         XH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042774; x=1775647574;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pyx9gwZ4QMH+c1GPDOh9EwDTt+nJL7P0xkOA/0V1Fg=;
        b=tJXUNeeFdjYRBoOAtidCg6gotjbJfFh3qGJ9g9T32q1r7kMHHNT2iBksTTeV4xjXg5
         Hw8a5AisCl+JUO2sxACpMJUdgf/SgD4aW0F+Oh0xG0T4H69lFFnQJYODrJSvneu29dO+
         bSLc3XrJp0K3xQJAN78hC2nPNOBonsnhXWCln/H96FFwUhoRt0MnGjyp1DIGUm/n9bjj
         XHs8h6l0qyAVQBhtVoOB21MYMGXe4BFBwiSiTh4mIcjdyulBlVQh/VkeDeD1aqkaIjge
         84bOfz9AOQLETYSky6lMpRkmIk+IkWTDTH8djyACwMOdqd0K2khOahiAjK/6azqMZmWC
         OSYw==
X-Forwarded-Encrypted: i=1; AJvYcCXww7iF1qenUc2yU5fVo32PT0fM6sVABuAO2a6qwroXKZke17nt8+dwp9Cvh5MEuknKohCZ7mDcz8WLVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFwQjJVLplwycjMIbcts/8Yu9USGUyddHsRjoFCFtEJCpJKDTr
	dntyWF/7s9AlY3pEWi1Q4+eT948ji7LwRENFZyU1OJe1VveGFSwF9PLP7vzfctwWVso=
X-Gm-Gg: ATEYQzyUPQF/MMe4EY98LCDbIyIi28WJpxAmzSLMvhDEkO5D25Kr0eQ5GbZ0XvwqWbw
	pifCH7Dv4ncll1aCPtGWf2OR1hBF2OxqkmdNqRsMIuCc/Kj8cvyky5tT8s61AI2Q5U/c+wG/FHA
	yzehnzl9gj0V6GeSsBEyUw4TMHrnypVBRhe860dFIa00tup5H2HphfPSR+tl+dsMlqthgJ7HkWs
	t6ehHzGYDjUxY5/7v3hRCfL+uY0Y3NYZvEv0cZ2e+bA3ZllDb/nJD0ec87xNh00CGBDq2fTZGFh
	2f9Gf0gAg9Ha8SG01ldfOFf8nrLNFs/FZ4lEXD72bKIi1aWDKg5v08hyWZ3Z+CBTnZO/++oW9vi
	+LpAOshf3bzKbgBrjCriGDaZ2gKFbqITvCqUa3oO0T5JHUbYbO0TVQzI4ORQa6yKRBqPnChIO6O
	z1NBAU3Og4hu6/D1ZNju2mE+iC+BRD63P63Vg=
X-Received: by 2002:a05:6000:4201:b0:43c:f66e:f2d with SMTP id ffacd0b85a97d-43d150c14camr6146306f8f.27.1775042774396;
        Wed, 01 Apr 2026 04:26:14 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.235.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2a7asm37684516f8f.7.2026.04.01.04.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:26:13 -0700 (PDT)
Message-ID: <0e781f65-3b23-4e83-bad7-338d90c4a2b2@linaro.org>
Date: Wed, 1 Apr 2026 12:26:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] media: qcom: camss: Add link support for TPG
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
 <20260317-camss_tpg-v10-2-b4cfa85c2e1b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260317-camss_tpg-v10-2-b4cfa85c2e1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-57865-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0EFA0379947
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 10:05, Wenmeng Liu wrote:
> TPG is connected to the csid as an entity, the link
> needs to be adapted.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   | 45 +++++++++++++------
>   drivers/media/platform/qcom/camss/camss-csid.h   |  1 +
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  1 +
>   drivers/media/platform/qcom/camss/camss-csiphy.h |  2 +
>   drivers/media/platform/qcom/camss/camss.c        | 55 ++++++++++++++++++++++++
>   5 files changed, 90 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index ed1820488c9878df91c173cd4ff0209dfa1e3a8c..48459b46a981bc7504cdde7d6f39fcc4a1e273de 100644
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
> @@ -1215,18 +1217,22 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
>   }
>   
>   /*
> - * csid_get_lane_assign - Calculate CSI2 lane assign configuration parameter
> - * @lane_cfg - CSI2 lane configuration
> + * csid_get_lane_assign - Calculate lane assign by csiphy/tpg lane num
> + * @lane_cfg: CSI2 lane configuration
> + * @num_lanes: lane num
>    *
>    * Return lane assign
>    */
> -static u32 csid_get_lane_assign(struct csiphy_lanes_cfg *lane_cfg)
> +static u32 csid_get_lane_assign(struct csiphy_lanes_cfg *lane_cfg, int num_lanes)
>   {
>   	u32 lane_assign = 0;
> +	int pos;
>   	int i;
>   
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_assign |= lane_cfg->data[i].pos << (i * 4);
> +	for (i = 0; i < num_lanes; i++) {
> +		pos = lane_cfg ? lane_cfg->data[i].pos : i;
> +		lane_assign |= pos << (i * LANE_CFG_BITWIDTH);
> +	}
>   
>   	return lane_assign;
>   }
> @@ -1251,6 +1257,7 @@ static int csid_link_setup(struct media_entity *entity,
>   	if ((local->flags & MEDIA_PAD_FL_SINK) &&
>   	    (flags & MEDIA_LNK_FL_ENABLED)) {
>   		struct v4l2_subdev *sd;
> +		struct tpg_device *tpg;
>   		struct csid_device *csid;
>   		struct csiphy_device *csiphy;
>   		struct csiphy_lanes_cfg *lane_cfg;
> @@ -1265,18 +1272,28 @@ static int csid_link_setup(struct media_entity *entity,
>   			return -EBUSY;
>   
>   		sd = media_entity_to_v4l2_subdev(remote->entity);
> -		csiphy = v4l2_get_subdevdata(sd);
> +		if (sd->grp_id == TPG_GRP_ID) {
> +			tpg = v4l2_get_subdevdata(sd);
>   
> -		/* If a sensor is not linked to CSIPHY */
> -		/* do no allow a link from CSIPHY to CSID */
> -		if (!csiphy->cfg.csi2)
> -			return -EPERM;
> +			csid->phy.lane_cnt = tpg->res->lane_cnt;
> +			csid->phy.csiphy_id = tpg->id;
> +			csid->phy.lane_assign = csid_get_lane_assign(NULL, csid->phy.lane_cnt);
> +			csid->tpg_linked = true;
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
> +			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
> +			csid->tpg_linked = false;
> +		}
>   	}
>   	/* Decide which virtual channels to enable based on which source pads are enabled */
>   	if (local->flags & MEDIA_PAD_FL_SOURCE) {
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index aedc96ed84b2fcc3f352160dcfd31554a671d0fc..5296b10f6bac839a3faa1039bdbf0fbbbe9456ac 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -161,6 +161,7 @@ struct csid_device {
>   	int num_supplies;
>   	struct completion reset_complete;
>   	struct csid_testgen_config testgen;
> +	bool tpg_linked;
>   	struct csid_phy_config phy;
>   	struct v4l2_mbus_framefmt fmt[MSM_CSID_PADS_NUM];
>   	struct v4l2_ctrl_handler ctrls;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 62623393f414494d7d0095aa0efe5673382ec962..69fba36d10ef5d00d0d8e1ae0f5b3646c066d81c 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -789,6 +789,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>   	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>   	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
>   		 MSM_CSIPHY_NAME, csiphy->id);
> +	sd->grp_id = CSIPHY_GRP_ID;
>   	v4l2_set_subdevdata(sd, csiphy);
>   
>   	ret = csiphy_init_formats(sd, NULL);
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 2d5054819df7f9069611bcdf287846b1d20afc92..9d9657b82f748d02bf6be6139480cfbd0c5001c9 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -21,6 +21,8 @@
>   #define MSM_CSIPHY_PAD_SRC 1
>   #define MSM_CSIPHY_PADS_NUM 2
>   
> +#define CSIPHY_GRP_ID 1
> +
>   struct csiphy_lane {
>   	u8 pos;
>   	u8 pol;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd89871ffaee9cb2b2db6538e1d70d..1de35bcd8e5fc6eaa9dab537960520b2c07dd830 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4501,6 +4501,19 @@ static int camss_init_subdevices(struct camss *camss)
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
> @@ -4589,6 +4602,23 @@ static int camss_link_entities(struct camss *camss)
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
> @@ -4693,6 +4723,19 @@ static int camss_register_entities(struct camss *camss)
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
> @@ -4736,6 +4779,13 @@ static int camss_register_entities(struct camss *camss)
>   	for (i--; i >= 0; i--)
>   		msm_csid_unregister_entity(&camss->csid[i]);
>   
> +	i = camss->res->tpg_num;
> +err_reg_tpg:
> +	if (camss->tpg) {
> +		for (i--; i >= 0; i--)
> +			msm_tpg_unregister_entity(&camss->tpg[i]);
> +	}
> +
>   	i = camss->res->csiphy_num;
>   err_reg_csiphy:
>   	for (i--; i >= 0; i--)
> @@ -4757,6 +4807,11 @@ static void camss_unregister_entities(struct camss *camss)
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inpsiron14p

