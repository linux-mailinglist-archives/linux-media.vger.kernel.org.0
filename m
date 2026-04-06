Return-Path: <linux-media+bounces-58097-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKA8Oz/D02mqlgcAu9opvQ
	(envelope-from <linux-media+bounces-58097-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 16:29:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CF53A40B9
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 16:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AB89301ECCB
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 14:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A0B3803DB;
	Mon,  6 Apr 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqR0aKc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWl+ba13"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5A3806DA
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485732; cv=none; b=uDY/KLPwPIsqLoJ/L9WmeeA04k2o8XLOIB2xdUunD/JTWufs4FxnAVT3nl8hX9EXJ1OtJydmzCj82fZTvOSdtYvW5pCAwKFGAH9T5VgFh0hH8bLu45HTwrb19UfcJFbUXnYDKEeYuwrFY8Zk9Pe2Vsh4pE0u6dKZK9Q8dlmIrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485732; c=relaxed/simple;
	bh=8rMe+9wi5I99FMcIghrN1Fw0NAEiAFzwNVkUjTXbm7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/z4TCAlPdzMMOqZhfMC/KK2vrDZGydJQhcYVxta7CN+TVWwxkDVGBjWC16tF1f0WSULLQJCwP1OeI6vFnc5BicwzJ3B7uTu1YzG1dKesge/pnFHdQJe6UnVHDqqT4y5xyrMBTZ1qOhoqLP+5LhU9dwyPeyo/f7U9U8zKKD360Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqR0aKc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWl+ba13; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6368LLGc2543533
	for <linux-media@vger.kernel.org>; Mon, 6 Apr 2026 14:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bcQrXVjO0Fx3i2I1c8CkXPHV
	qu2VjbUC/WCLyjnevY4=; b=ZqR0aKc1FD0g0w8j7XQhShH4V47nQ7ESBUIz/3gf
	YC9r01Iz/kACcG3RU3lp9BcSzptmzF6YKsnYBJNppXjVGVLfruQf5ga2lEQKXaKg
	56AIlxLWJxcQWBmDL7IF4Vp//Q+w/tGGiSZYe6LsaM/DlwMdM4Tj8N0VPZd+GqGv
	NLeRCtnjwgsngrlLjM5CIactux/BlThYB20O9aFPgHaWtHyOh26X/WP8M7wljIH/
	+ut+0Fv1Imt+In6BzP62qKOgP+Aa40RtlwuPCqExWWXhjwdtm4LHI5WSxprh8C74
	9+4eJJKPkzl3NbKD7T2NozsUeacPdO15uD9ViGJU3pqt6Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1dcw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 14:28:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so184508111cf.0
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775485729; x=1776090529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bcQrXVjO0Fx3i2I1c8CkXPHVqu2VjbUC/WCLyjnevY4=;
        b=IWl+ba133tD6kJjjeUxvSjNSMYTx0psUeRrfwK2NToqTnQm5UlH+iPyBZni4wV1loy
         9JHAPE4ovebCljfmkczE0BOTAd5q5YKLcpKCYP648/+CuVJabqHvBWQLdeg8l+a61SjL
         5ao4VWqrNcovLefUlPPF5JaCWh4quTub+8UdgL4ZG5vEGrmCA84wt07Q2zN2T+VSGnwQ
         ljivako8A06+NerSEkqKEZm3345afYzehuizZ/h5lDXYmwnkukiywRX3fd61BhFjI64i
         vQHAS92fkmX0qs91xfM4Z+i4E2ToY2PUPk7aDG9aTKUrfS/h5I7xfP0dkTUA7q+5kAB4
         KeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775485729; x=1776090529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcQrXVjO0Fx3i2I1c8CkXPHVqu2VjbUC/WCLyjnevY4=;
        b=N54b2MNt14j3OqkeheU1IWkgYOb9JshGY4H1n6oUXC+kXp8n3w4z3uk1fMJf7UBqmV
         PCiyQJapfSqgLLPJ6KBWhNICrjYIX0PPgIKXaVeW89UzFfwR+CeJ5Is7U/VJHrN5cNHk
         ksAeA9joIazHjr1xg7XwmKmNvJP3Mit2BXsA2bgvIRXY+j6SB64G+cE9Nd9eEz0ybK7P
         mp6J+yMYlxzRBSifCW1tMUz+b9vDtR9DF8NXKDlxamYunQLml6WgvioBnZSC71IIjA55
         hNLsTymYhdb/j+td4WBYUfapfUVsoQ6ngj9XEB5Q8tJArEBktkp7/WxFcs8x8CWLLlQc
         FOZA==
X-Forwarded-Encrypted: i=1; AJvYcCUAR9R285AVFz6DjCrMT1K1QABp0H9p1+QtcwNVm97vsSEtbi9eVqaEjOSRKb4m6ra/w2ud6WsG/HW9Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Ina4bQhRITeHt4vK/GvUhG43tJxyhqY1QzHcnovBCSuDuz/Y
	Qn/CTBMutL+eNQ5qjkCGvAC52LwXLTvNAaU2bTN+c67+FiWJvN81/ELPGZJrXgctMzSajOVTBF+
	IBJ1kIceRo3V8DVcd4JrHfTc7hftT2XoepgVP1Fq979IeKFHW2L95nUtDdWhRU3tHVQ==
X-Gm-Gg: AeBDiesqHxk/DK0GFggPspB7ftaT2L16a4d9zF+mGK6PLP/BCpUkPzmrsbmk32tFEr4
	SGc+CtxE4PEjuaclix/1hJEy40oF9cVdahJilM+RDBnctEhtbFodx1yXHL9QWs+riDIQ8G+4obc
	skOUZ9vuvKmPIRH0imFxfkHvv0OwBs6dyGRAYNAbw1no7GtBuXzf84MekRJsqItJDfigRl0xayh
	d5tg0D2Pp7Ibrc+gZDlrX4wUC91+dBHmhsWFx0wH2E9WFWB5DGkLRRRpcmpJFKDVI+oA0zWDut+
	zq4Pp8+Wk3P6Z2vtqkW3bekt+FcrmKcZx8B2cuaIfaTeug8UcPHGQv1qWyJ5fb6S5ErqkQMRPgu
	xLm+1g4Ib32zz74Qx53xe5OOgPptAuVc=
X-Received: by 2002:a05:622a:aa54:10b0:50b:49d4:e54 with SMTP id d75a77b69052e-50d6273e5d7mr153688331cf.15.1775485724200;
        Mon, 06 Apr 2026 07:28:44 -0700 (PDT)
X-Received: by 2002:a05:622a:aa54:10b0:50b:49d4:e54 with SMTP id d75a77b69052e-50d6273e5d7mr153687481cf.15.1775485723130;
        Mon, 06 Apr 2026 07:28:43 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm42128895f8f.3.2026.04.06.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 07:28:42 -0700 (PDT)
Date: Mon, 6 Apr 2026 17:28:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <qrzaihfpujlhqeukp7wioqrqjbpih65smmieliixavzlev6las@odmnpbuc3wrm>
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
X-Proofpoint-GUID: 08mX80ybwEwUwwzq35aDUUz7v3-55zus
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d3c322 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=SK55yz8Qm6wm_m109zgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 08mX80ybwEwUwwzq35aDUUz7v3-55zus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0MiBTYWx0ZWRfX+IblggrKbIaI
 repzmoAkOnxaicbMcBn+LMhRUmmUXUGnRrNxfzEt7/fK/IZa9YA//r0TgWIf/aESF/nrfvdcM1d
 dMoUL7JtaUdFJW2WfpjHDWTQ79SconY2S79FThel+5lP2mt90FKk6HwaocVuwdBK59SUTHyjaf6
 v1utUxx/iuOBACcecNPLus5L4WfCd/djJ9nTMDen28St9yfHGj+5XNxhRU+u2e3fqYunUA+QBr1
 6l6PGNSDdU2ahy/CMYyR8axI9JlgzteMZ0Oermfo6Wt+usq9j9NJJUolC1DWFkJFkCLgzdX2CVb
 yQDFDkxupDoTl5QbkT9m9QQt7VGX+GN87IK4JEevGLrtExkO7+jAVV/E2RnFOXZuwnycPcAJI8+
 NXjbqxGvgTwYyJNcl9hagZCrUagOrpJ6DleuAc1DY9jn1ja33S8/JpaxIlQmL6aoyhwb645VgKz
 GgCVSLti9FHjhWRoZNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060142
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58097-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52CF53A40B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-26 01:04:44, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  MAINTAINERS                                        |  11 +
>  drivers/phy/qualcomm/Kconfig                       |  13 +
>  drivers/phy/qualcomm/Makefile                      |   5 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 361 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 298 +++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  95 ++++++
>  6 files changed, 783 insertions(+)
> 

[...]

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000..47acf0d586a15
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Linaro Ltd.
> + */
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_opp.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +static int
> +phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
> +				   s64 link_freq)
> +{
> +	struct device *dev = csi2phy->dev;
> +	unsigned long opp_rate = link_freq / 4;
> +	struct dev_pm_opp *opp;
> +	long timer_rate;
> +	int ret;
> +
> +	opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
> +	if (IS_ERR(opp)) {
> +		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
> +			link_freq);
> +		return PTR_ERR(opp);
> +	}
> +
> +	for (int i = 0; i < csi2phy->num_pds; i++) {
> +		unsigned int perf = dev_pm_opp_get_required_pstate(opp, i);
> +
> +		ret = dev_pm_genpd_set_performance_state(csi2phy->pds[i], perf);
> +		if (ret) {
> +			dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
> +				perf);
> +			dev_pm_opp_put(opp);
> +			return ret;
> +		}
> +	}
> +	dev_pm_opp_put(opp);
> +
> +	ret = dev_pm_opp_set_rate(dev, opp_rate);
> +	if (ret) {
> +		dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
> +		return ret;
> +	}
> +
> +	timer_rate = clk_round_rate(csi2phy->timer_clk, link_freq / 4);
> +	if (timer_rate < 0)
> +		return timer_rate;
> +
> +	ret = clk_set_rate(csi2phy->timer_clk, timer_rate);
> +	if (ret)
> +		return ret;
> +
> +	csi2phy->timer_clk_rate = timer_rate;
> +
> +	return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> +					union phy_configure_opts *opts)
> +{
> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> +	struct phy_configure_opts_mipi_dphy *dphy_cfg = &opts->mipi_dphy;
> +	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
> +	int ret;
> +	int i;
> +
> +	ret = phy_mipi_dphy_config_validate(dphy_cfg);
> +	if (ret)
> +		return ret;
> +
> +	if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
> +		return -EINVAL;
> +
> +	stream_cfg->link_freq = dphy_cfg->hs_clk_rate;
> +	stream_cfg->num_data_lanes = dphy_cfg->lanes;
> +
> +	for (i = 0; i < stream_cfg->num_data_lanes; i++) {
> +		stream_cfg->lane_cfg.data[i].pol = dphy_cfg->lane_polarities[i];
> +		stream_cfg->lane_cfg.data[i].pos = dphy_cfg->lane_positions[i];
> +	}
> +
> +	stream_cfg->lane_cfg.clk.pol = dphy_cfg->clock_lane_polarity;
> +	stream_cfg->lane_cfg.clk.pos = dphy_cfg->clock_lane_position;
> +
> +	return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
> +{
> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> +	const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
> +	struct device *dev = &phy->dev;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(csi2phy->soc_cfg->num_supplies,
> +				    csi2phy->supplies);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_qcom_mipi_csi2_set_clock_rates(csi2phy, csi2phy->stream_cfg.link_freq);
> +	if (ret)
> +		goto poweroff_phy;
> +
> +	ret = clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
> +				      csi2phy->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks, %d\n", ret);
> +		goto poweroff_phy;
> +	}
> +
> +	ops->reset(csi2phy);
> +
> +	ops->hw_version_read(csi2phy);
> +
> +	return ops->lanes_enable(csi2phy, &csi2phy->stream_cfg);
> +
> +poweroff_phy:
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);
> +
> +	return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
> +{
> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> +	int i;
> +
> +	for (i = 0; i < csi2phy->num_pds; i++)
> +		dev_pm_genpd_set_performance_state(csi2phy->pds[i], 0);
> +
> +	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +				   csi2phy->clks);
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops phy_qcom_mipi_csi2_ops = {
> +	.configure	= phy_qcom_mipi_csi2_configure,
> +	.power_on	= phy_qcom_mipi_csi2_power_on,
> +	.power_off	= phy_qcom_mipi_csi2_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static struct phy *qcom_csi2_phy_xlate(struct device *dev,
> +				       const struct of_phandle_args *args)
> +{
> +	struct mipi_csi2phy_device *csi2phy = dev_get_drvdata(dev);
> +
> +	if (args->args[0] != PHY_QCOM_CSI2_MODE_DPHY) {
> +		dev_err(csi2phy->dev, "mode %d -EOPNOTSUPP\n", args->args[0]);
> +		return ERR_PTR(-EOPNOTSUPP);
> +	}
> +
> +	csi2phy->phy_mode = args->args[0];
> +
> +	return csi2phy->phy;
> +}
> +
> +static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
> +{
> +	unsigned int i, num_clk, num_supplies, num_pds;
> +	struct mipi_csi2phy_device *csi2phy;
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct phy *generic_phy;
> +	int ret;
> +
> +	csi2phy = devm_kzalloc(dev, sizeof(*csi2phy), GFP_KERNEL);
> +	if (!csi2phy)
> +		return -ENOMEM;
> +
> +	csi2phy->dev = dev;
> +	dev_set_drvdata(dev, csi2phy);
> +
> +	csi2phy->soc_cfg = device_get_match_data(&pdev->dev);
> +
> +	if (!csi2phy->soc_cfg)
> +		return -EINVAL;
> +
> +	num_clk = csi2phy->soc_cfg->num_clk;
> +	csi2phy->clks = devm_kzalloc(dev, sizeof(*csi2phy->clks) * num_clk, GFP_KERNEL);
> +	if (!csi2phy->clks)
> +		return -ENOMEM;
> +
> +	num_pds = csi2phy->soc_cfg->num_genpd_names;
> +	if (!num_pds)
> +		return -EINVAL;
> +
> +	csi2phy->pds = devm_kzalloc(dev, sizeof(*csi2phy->pds) * num_pds, GFP_KERNEL);
> +	if (!csi2phy->pds)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_pds; i++) {
> +		csi2phy->pds[i] = dev_pm_domain_attach_by_name(dev,
> +							       csi2phy->soc_cfg->genpd_names[i]);

You need to do detach these on error, otherwise you get:

 sysfs: cannot create duplicate filename '/devices/genpd:0:acec000.phy'
 CPU: 1 UID: 0 PID: 93 Comm: kworker/u49:2 Not tainted 7.0.0-rc6-00062-gd691cf9ea708 #12 PREEMPT
 Hardware name: Dell Inc. XPS 13 9345/05H2K4, BIOS 2.11.0 09/21/2025
 Workqueue: events_unbound deferred_probe_work_func
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x60/0x80
  dump_stack+0x18/0x24
  sysfs_warn_dup+0x64/0x80
  sysfs_create_dir_ns+0xf4/0x120
  kobject_add_internal+0x98/0x260
  kobject_add+0x9c/0x108
  device_add+0xc4/0x7ac
  device_register+0x20/0x34
  genpd_dev_pm_attach_by_id+0xdc/0x1cc
  genpd_dev_pm_attach_by_name+0x3c/0x78
  dev_pm_domain_attach_by_name+0x20/0x2c
  phy_qcom_mipi_csi2_probe+0xe0/0x420 [phy_qcom_mipi_csi2]
  platform_probe+0x5c/0xa4
  really_probe+0xbc/0x2c0
  __driver_probe_device+0x78/0x120
  driver_probe_device+0x3c/0x154
  __device_attach_driver+0xb8/0x140
  bus_for_each_drv+0x88/0xe8
  __device_attach+0xa0/0x190
  device_initial_probe+0x50/0x54
  bus_probe_device+0x38/0xac
  device_add+0x5c4/0x7ac
  of_device_add+0x44/0x60
  of_platform_device_create_pdata+0x8c/0x11c
  of_platform_bus_create+0x190/0x38c
  of_platform_populate+0x74/0x108
  devm_of_platform_populate+0x58/0xc0
  camss_probe+0x3c/0xce0 [qcom_camss]
  platform_probe+0x5c/0xa4
  really_probe+0xbc/0x2c0
  __driver_probe_device+0x78/0x120
  driver_probe_device+0x3c/0x154
  __device_attach_driver+0xb8/0x140
  bus_for_each_drv+0x88/0xe8
  __device_attach+0xa0/0x190
  device_initial_probe+0x50/0x54
  bus_probe_device+0x38/0xac
  deferred_probe_work_func+0x90/0xc8
  process_one_work+0x154/0x294
  worker_thread+0x18c/0x300
  kthread+0x118/0x124
  ret_from_fork+0x10/0x20
 kobject: kobject_add_internal failed for genpd:0:acec000.phy with -EEXIST, don't try to register things with the same name in the same directory.
 qcom-mipi-csi2-phy acec000.phy: error -EEXIST: Failed to attach mx
 qcom-mipi-csi2-phy acec000.phy: probe with driver qcom-mipi-csi2-phy failed with error -17


