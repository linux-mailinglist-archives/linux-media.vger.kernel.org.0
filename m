Return-Path: <linux-media+bounces-63223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE15MANJHWo2YgkAu9opvQ
	(envelope-from <linux-media+bounces-63223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:55:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F27F61BDE2
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB80A3075BE4
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 08:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D578B364E81;
	Mon,  1 Jun 2026 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jr8djq8/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B79B362138;
	Mon,  1 Jun 2026 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303764; cv=none; b=mwfNxzgj0kBEIL5zjF6nh3EEojsMRZ+g0fD0zqlcBz/LTyuEBCMYdc+S4vCNsEPcm7z6nfk68pcOC22sMkAkQC8C7a9Gh2joB4BV+qDuibxycY+kfkWzBq9q4ersFxISKR383z51++CnnX7MXFLSpqltgeB8KXZArKQiEBV5FwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303764; c=relaxed/simple;
	bh=fTvCiLQ1qEn3j38tQJSp5tkE6HMSqruwdKwHOipmk6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqhgTp6PAifHl2HWrrpmNheszlwk6CLdW+i6myVR5hq8BUd+OLtq6bCxrfMtPhaEueyPd/adOhzpohOpYo+TDOyfYAlYscI4ZhNfPoT+kUhiGsDzL0IczNdRiW9hXQvdW/X7vg8pm8fWcr6pLePPtOVJPIIUQyTfD9Y6Ti4+lT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jr8djq8/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780303762; x=1811839762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fTvCiLQ1qEn3j38tQJSp5tkE6HMSqruwdKwHOipmk6I=;
  b=jr8djq8/sLcNclP1FRtVyg4BY2b0jcDmCAhISYWeCZW30CDBWGp93eIV
   gYPbol2GNJscHfY6VR7N1K8pxk/Zw1i4cfW+Zhy7bmRYzdMsfuueLKVoN
   e1OlVr5ycV+61CmCCJPHRo0rt1WeTq2/74wcjr8CWAO+7Fk2tCe1rY8WB
   bmdDmEt5SNbXgcP6i+0kaCpSB+w7Ci3T080UnqHoQbkBjR1K10hwe64zY
   B8UbUYSQ0ImUYwnQYkiZewWGgWLPn2A/Xv3kfuqzfF1eVLhS3MNIK5k0e
   MpSW/CMlpmbIkXUgZm96FmFjf+EYdltslvIeVLPJGq390uDozJsNwV67Q
   g==;
X-CSE-ConnectionGUID: IvGAhukCRHei/h6sS4NRWw==
X-CSE-MsgGUID: HwK0vw5AR4WO63OA5RCNuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="98474204"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="98474204"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:49:21 -0700
X-CSE-ConnectionGUID: ETK12BOoRJaALBN70KuoxQ==
X-CSE-MsgGUID: CdUWl14gT06TeVN7Sq7SOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="247482971"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:49:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 433941206D5;
	Mon, 01 Jun 2026 11:49:10 +0300 (EEST)
Date: Mon, 1 Jun 2026 11:49:10 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: david@ixit.cz
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	"Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Kieran Bingham <kbingham@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH WIP v5 2/9] media: qcom: camss: csiphy-3ph: Use odd bits
 for configuring C-PHY lanes
Message-ID: <ah1HhruI1Qc2FfwG@kekkonen.localdomain>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
 <20260531-qcom-cphy-v5-2-6be0f62b4d65@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-qcom-cphy-v5-2-6be0f62b4d65@ixit.cz>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,joelselvaraj.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63223-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: 2F27F61BDE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

Thanks for the patch.

On Sun, May 31, 2026 at 03:08:10PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
> 
> Since there can be unrecognized configuration allow returning failure.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 +++++++++++++++++-----
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |  5 +--
>  drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
>  4 files changed, 48 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> index 9d67e7fa6366a..bb4b91f69616b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> @@ -89,19 +89,19 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>  	t_hs_settle = (t_hs_prepare_max + t_hs_prepare_zero_min) / 2;
>  
>  	timer_period = div_u64(1000000000000LL, timer_clk_rate);
>  	settle_cnt = t_hs_settle / timer_period - 1;
>  
>  	return settle_cnt;
>  }
>  
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>  {
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	u8 settle_cnt;
>  	u8 val, l = 0;
>  	int i = 0;
>  
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>  
> @@ -127,16 +127,18 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  			       CAMSS_CSI_PHY_LNn_CFG2(l));
>  		writel_relaxed(settle_cnt, csiphy->base +
>  			       CAMSS_CSI_PHY_LNn_CFG3(l));
>  		writel_relaxed(0x3f, csiphy->base +
>  			       CAMSS_CSI_PHY_INTERRUPT_MASKn(l));
>  		writel_relaxed(0x3f, csiphy->base +
>  			       CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
>  	}
> +
> +	return 0;
>  }
>  
>  static void csiphy_lanes_disable(struct csiphy_device *csiphy,
>  				 struct csiphy_config *cfg)
>  {
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	u8 l = 0;
>  	int i = 0;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..d4624417a7424 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -9,16 +9,17 @@
>   */
>  
>  #include "camss.h"
>  #include "camss-csiphy.h"
>  
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>  
>  #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
>  #define CSIPHY_3PH_LNn_CFG2(n)			(0x004 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT	BIT(3)
>  #define CSIPHY_3PH_LNn_CFG3(n)			(0x008 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4(n)			(0x00c + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS	0xa4
> @@ -1108,23 +1109,32 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>  		writel_relaxed(val, csiphy->base + r->reg_addr);
>  		if (r->delay_us)
>  			udelay(r->delay_us);
>  	}
>  }
>  
>  static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>  {
> -	u8 lane_mask;
> -	int i;
> +	u8 lane_mask = 0;
>  
> -	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= BIT(lane_cfg->data[i].pos + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>  
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= BIT(lane_cfg->data[i].pos);
> +		break;
> +	default:
> +		break;
> +	}
>  
>  	return lane_mask;
>  }
>  
>  static bool csiphy_is_gen2(u32 version)
>  {
>  	bool ret = false;
>  
> @@ -1143,31 +1153,46 @@ static bool csiphy_is_gen2(u32 version)
>  	case CAMSS_X1E80100:
>  		ret = true;
>  		break;
>  	}
>  
>  	return ret;
>  }
>  
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>  {
> +	struct device *dev = csiphy->camss->dev;
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  	u8 settle_cnt;
>  	u8 val;
>  	int i;
>  
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>  
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
> +		return -EINVAL;

If this is the only reason why you're changing the return type to int, I'd
suggest using WARN_ON() in this case. I presume it'd take a driver bug for
this to trigger?

> +	}
>  
>  	writel_relaxed(val, csiphy->base +
>  		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>  
>  	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>  	writel_relaxed(val, csiphy->base +
>  		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>  
> @@ -1184,16 +1209,18 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  	else
>  		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
>  
>  	/* IRQ_MASK registers - disable all interrupts */
>  	for (i = 11; i < 22; i++) {
>  		writel_relaxed(0, csiphy->base +
>  			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
>  	}
> +
> +	return 0;
>  }
>  
>  static void csiphy_lanes_disable(struct csiphy_device *csiphy,
>  				 struct csiphy_config *cfg)
>  {
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  
>  	writel_relaxed(0, csiphy->base +
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..ec0dc9d31b585 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -260,16 +260,17 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>   * Helper function to enable streaming on CSIPHY module.
>   * Main configuration of CSIPHY module is also done here.
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
>  static int csiphy_stream_on(struct csiphy_device *csiphy)
>  {
>  	struct csiphy_config *cfg = &csiphy->cfg;
> +	const struct csiphy_hw_ops *ops = csiphy->res->hw_ops;
>  	s64 link_freq;
>  	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
>  	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>  				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>  	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>  	u8 val;
>  
>  	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> @@ -290,19 +291,17 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>  			val |= cfg->csid_id;
>  		}
>  		writel_relaxed(val, csiphy->base_clk_mux);
>  
>  		/* Enforce reg write ordering between clk mux & lane enabling */
>  		wmb();
>  	}
>  
> -	csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
> -
> -	return 0;
> +	return ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
>  }
>  
>  /*
>   * csiphy_stream_off - Disable streaming on CSIPHY module
>   * @csiphy: CSIPHY device
>   *
>   * Helper function to disable streaming on CSIPHY module
>   */
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 2ebb307be18ba..42f0134635316 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -70,19 +70,19 @@ struct csiphy_hw_ops {
>  	 * @lane_cfg - CSI2 lane configuration
>  	 *
>  	 * Return lane mask
>  	 */
>  	u8 (*get_lane_mask)(struct csiphy_lanes_cfg *lane_cfg);
>  	void (*hw_version_read)(struct csiphy_device *csiphy,
>  				struct device *dev);
>  	void (*reset)(struct csiphy_device *csiphy);
> -	void (*lanes_enable)(struct csiphy_device *csiphy,
> -			     struct csiphy_config *cfg,
> -			     s64 link_freq, u8 lane_mask);
> +	int (*lanes_enable)(struct csiphy_device *csiphy,
> +			    struct csiphy_config *cfg,
> +			    s64 link_freq, u8 lane_mask);
>  	void (*lanes_disable)(struct csiphy_device *csiphy,
>  			      struct csiphy_config *cfg);
>  	irqreturn_t (*isr)(int irq, void *dev);
>  	int (*init)(struct csiphy_device *csiphy);
>  };
>  
>  struct csiphy_subdev_resources {
>  	u8 id;
> 

-- 
Kind regards,

Sakari Ailus

