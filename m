Return-Path: <linux-media+bounces-63226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEOQOtZLHWphYgkAu9opvQ
	(envelope-from <linux-media+bounces-63226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:07:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2461C1CE
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 688A7304724C
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 09:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE9338D41C;
	Mon,  1 Jun 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZ8lHe27"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74638D41E;
	Mon,  1 Jun 2026 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304472; cv=none; b=lZVdMidgM/+ac797WaxLHelVQ+DwofCQADwIFh2GaDcCSoWIer9jhoMfP6LpiNapCleXFvtjltogOaiQMoeRVjbQVRBlr3VqBSw+NELdLzPp2I6w9IJsH62R/P/SAgi7s6IvRpTAeh4Ibgrx0byhlT/TBb1GUptopto191xhX4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304472; c=relaxed/simple;
	bh=bFa1Qg7gaNEFylkSPeIsEgy/Z67BuJhyGHuuX3aIIjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iX7GEJ/GxE4i8iIylovZqTphiKhT64DVbR+bUwkOQ6nCwXnxEwOvvExJa9bTSp6anWbV98af1XEuGtZ+yyy27RcIcb3P1+5q9U7cTdYhpsiYorFNx5SwKN6X9Unt2qJmRGAU63oQOUzzFCiJVqy/13kfI1FLkfIsf3GbFc/kJOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZ8lHe27; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780304471; x=1811840471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bFa1Qg7gaNEFylkSPeIsEgy/Z67BuJhyGHuuX3aIIjI=;
  b=IZ8lHe27D3MNRxwySFl3TLVroTv9CP/Bn4FPOA11ZgnHRSrtnCDF9oAC
   wobN7iY7pyVajocg1fda091DTv2b9JYlJfv88jlsoS33C5AxoM3OeetO+
   PWPKEXF2YV1mLCAYPA3fQgMqBsq/14105f3JHGvYKOEd/FBnYDNzRclGw
   YeHGWmx7RTE2f9llH9k4WnzucgW+ucM9crlQGkMkzV//pbm1R19x86Oi3
   BAK4ZwTDnMdJeYE2LBiN74DdM67/u6RjNCUHWIGhTV/heTDVXjlMzz2rA
   19Oqf2X6ZgJSoUYKW1qNE4Y1xOOrW6LaM/Qr9EjbNcughBLTYM7zLhzBo
   g==;
X-CSE-ConnectionGUID: x6xw2Yg2RGiFA9s2Dfy3zg==
X-CSE-MsgGUID: tApzE1J3Smin35eko5xV+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80789529"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80789529"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 02:01:10 -0700
X-CSE-ConnectionGUID: LBLCKAEFSUO2U+AAhCWrMg==
X-CSE-MsgGUID: MiN1KRZ2S3CSI9K6AFwYEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="247798522"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 02:01:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5BBFA1206D5;
	Mon, 01 Jun 2026 12:00:59 +0300 (EEST)
Date: Mon, 1 Jun 2026 12:00:59 +0300
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
Subject: Re: [PATCH WIP v5 4/9] media: qcom: camss: Initialize lanes after
 lane configuration is available
Message-ID: <ah1KS63aOL4wzhvb@kekkonen.localdomain>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
 <20260531-qcom-cphy-v5-4-6be0f62b4d65@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-qcom-cphy-v5-4-6be0f62b4d65@ixit.cz>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,joelselvaraj.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63226-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,kekkonen.localdomain:mid,intel.com:dkim,protonmail.com:email]
X-Rspamd-Queue-Id: 1AC2461C1CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

On Sun, May 31, 2026 at 03:08:12PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The lanes must not be initialized before the driver has access to
> the lane configuration, as it depends on whether D-PHY or C-PHY mode
> is in use. Move the lane initialization to csiphy_lanes_enable which is
> called when the configuration structures are available.
> 
> Co-developed-by: Petr Hodina <phodina@protonmail.com>
> Signed-off-by: Petr Hodina <phodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 133 +++++++++++++++------
>  1 file changed, 95 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index d4624417a7424..8bcba6107471f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1164,16 +1164,110 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>  {
>  	struct device *dev = csiphy->camss->dev;
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  	u8 settle_cnt;
>  	u8 val;
>  	int i;
>  
> +	switch (csiphy->camss->res->version) {
> +	case CAMSS_845:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;

Aren't these fields already initialised to 0?

Using the compatible string to assign these using device matching would be
nice if possible.

> +		} else {
> +			regs->lane_regs = &lane_regs_sdm845[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		}
> +		break;
> +	case CAMSS_2290:
> +	case CAMSS_6150:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_qcm2290[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> +		}
> +		break;
> +	case CAMSS_6350:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sm6350[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
> +		}
> +		break;
> +	case CAMSS_7280:
> +	case CAMSS_8250:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sm8250[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> +		}
> +		break;
> +	case CAMSS_8280XP:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sc8280xp[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> +		}
> +		break;
> +	case CAMSS_X1E80100:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_x1e80100[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		}
> +		break;
> +	case CAMSS_8550:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sm8550[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		}
> +		break;
> +	case CAMSS_8650:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sm8650[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
> +		}
> +		break;
> +	case CAMSS_8300:
> +	case CAMSS_8775P:
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = NULL;
> +			regs->lane_array_size = 0;
> +		} else {
> +			regs->lane_regs = &lane_regs_sa8775p[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!regs->lane_regs && c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +		dev_err(dev, "Missing lane_regs definition for C-PHY\n");
> +		return -EINVAL;
> +	}
> +
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>  
>  	val = 0;
>  
>  	switch (c->phy_cfg) {
>  	case V4L2_MBUS_CSI2_CPHY:
>  		for (i = 0; i < c->num_data; i++)
>  			val |= BIT((c->data[i].pos * 2) + 1);
> @@ -1235,63 +1329,26 @@ static int csiphy_init(struct csiphy_device *csiphy)
>  	struct device *dev = csiphy->camss->dev;
>  	struct csiphy_device_regs *regs;
>  
>  	regs = devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);
>  	if (!regs)
>  		return -ENOMEM;
>  
>  	csiphy->regs = regs;
> -	regs->offset = 0x800;
>  	regs->common_status_offset = 0xb0;
>  
>  	switch (csiphy->camss->res->version) {
> -	case CAMSS_845:
> -		regs->lane_regs = &lane_regs_sdm845[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> -		break;
> -	case CAMSS_2290:
> -	case CAMSS_6150:
> -		regs->lane_regs = &lane_regs_qcm2290[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> -		break;
> -	case CAMSS_6350:
> -		regs->lane_regs = &lane_regs_sm6350[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
> -		break;
> -	case CAMSS_7280:
> -	case CAMSS_8250:
> -		regs->lane_regs = &lane_regs_sm8250[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
> -		break;
> -	case CAMSS_8280XP:
> -		regs->lane_regs = &lane_regs_sc8280xp[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> -		break;
>  	case CAMSS_X1E80100:
> -		regs->lane_regs = &lane_regs_x1e80100[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> -		regs->offset = 0x1000;
> -		break;
>  	case CAMSS_8550:
> -		regs->lane_regs = &lane_regs_sm8550[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> -		regs->offset = 0x1000;
> -		break;
>  	case CAMSS_8650:
> -		regs->lane_regs = &lane_regs_sm8650[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
>  		regs->offset = 0x1000;
>  		break;
> -	case CAMSS_8300:
> -	case CAMSS_8775P:
> -		regs->lane_regs = &lane_regs_sa8775p[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
> -		break;
>  	default:
> +		regs->offset = 0x800;
>  		break;
>  	}
>  
>  	return 0;
>  }
>  
>  const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
>  	.get_lane_mask = csiphy_get_lane_mask,
> 
> -- 
> 2.53.0
> 
> 

-- 
Sakari Ailus

