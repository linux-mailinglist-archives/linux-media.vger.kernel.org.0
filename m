Return-Path: <linux-media+bounces-53648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNEQIPXfoGk4nwQAu9opvQ
	(envelope-from <linux-media+bounces-53648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 01:06:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D59361B11F2
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 01:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B017B305614D
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 00:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A34199230;
	Fri, 27 Feb 2026 00:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9tDB/fE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="edlJJD+f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62D2C86D
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 00:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772150766; cv=none; b=ZL5ysavV+HkVqu8S0L0s2Kl/C4o8G3Kz/+l0WqGiEkC3equCHW5usiffeoQgur2xLeDMmu6XH5o+VUXRQ0z/U8uMiBG76DaHkaCwSO509E7l5LnPozmFoK7MGg+4NrWHvBwDjnb/z6PKkPOM6TG6P+76CibK/vl5tPvo7cS5Fcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772150766; c=relaxed/simple;
	bh=vwhUg7J4Mn418cSfipIFAl1NYvUZTI9KqzfpN/i2Z/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xmv6KIMvcknnz+FH6iEsJeDiV+6G3bZnBZ8UEfeSeNPLp6l+aJjF1IAPVSiTpjA/zmUZx2cB7E2SW3QbVSOf0b3242HsvUEnrOsCcAsGfYqQoB6afYI4/XoJfUBUDf+lnQAK3KoxZo6G57YW/IbtaLT2p5GnNdcIt2wzTHFM1IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9tDB/fE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=edlJJD+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QMadNE3296762
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 00:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/m0CGdB5UrVypqIob07n51ri
	BbJLme1jD0GsHemzo9c=; b=d9tDB/fEOmRYjdq3oJJH1N8ecS0JgbJSxJSMEhBk
	j1hyQtefTl5JmhDLL95mfyoHx+onD6ti73QZ2NvJ+Zx0/CcHGggp2jMOnW8IguD1
	bA1VjXvp2hLqhenfyFgBMqrbkepoNIkFjgkOxy5N2mBap6dQMi/DYIe2MyjAz7yu
	Vq+Cxa7dsmEr3SAV9Vc6aaEy/a1LPUPSCvF9jQPqPSFsc0FTFoP7MdalVvAifIsh
	AvUKbAbJOVKX21vLGthteY1fHA/7ATInP+0FmVZFJaOcCAmjkbYmFr76vq+Pb83f
	Sz13jnOK9Y+c/6oWNVtDMQLiq7bt3QB49L4AhKeiTuKufA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7y9gk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 00:06:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50336ebabe0so251230971cf.1
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 16:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772150763; x=1772755563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/m0CGdB5UrVypqIob07n51riBbJLme1jD0GsHemzo9c=;
        b=edlJJD+fIZiQS1cMPe0l5xzT4C8mqHBXeevlam6NosgvL2LtsekFK7JwWXkWHiNIVV
         UziUDcPl0S1jJESMHk82XFnbaXT9Y9LXpAXQMC43yxjLHQVnkbBS+mpYGhE81UN6epu0
         Tec2M8k32WnTyxFRCagmv88Q1BvB4TUP97Kn0upfcvy7W8Tm9QbS9Mp9DWKP/6+4JUW0
         0vz9EJe67JuZfin9tUgXmbNd0W8PmTnnJFeFLYPITLQ7ZbDBcc47F/xL6HftMFgPrJDw
         FK72I3H4NmIovV5qeaZuGa3GdJ5VsJFUKAAQ3ECmtBwm6cPAv4PbmXQFa2Ys1AKByLNP
         qUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772150763; x=1772755563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/m0CGdB5UrVypqIob07n51riBbJLme1jD0GsHemzo9c=;
        b=HF2nmY8qkxZZ8/8jcpfSa3MmY0V4WFgsp7u6fM0kmRe+GaAhewIhX3JagqQV0/F8x9
         UFF4hNROijeJ+b472tRItZLeRbgSte/5/b0kZqte4Z8PsQUjuLa7GgBexNf3Hj9q/nxS
         tD37sxYMRl3lu2ro+raCH1V8S/hhLKscnZSm6TDfP3u49nALhJX4+fkeoByYNf8O7Q9e
         ZhZ2rZ/saIs7TBoHbrmQfbOGDzNaukIENiIXV3xl+1KnmVeQN4NpNg/JisoTTU2zx4qW
         mALJ3Owig8oxDuaV+2i7lK5CdKFqzBWmDH62fjFXhkB539ECj/o3BbVd7WHmtq1X9+aG
         tJeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEqXY1GmyhmjfcQSrxxRVoiEyxFOoF1UxcbOPm0yVMrq1G7sfA8YUgqM53LgIrHEBziT0Z5BZJG8WgdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWmM6uCPsANc3MNMLi31nqiHXoANB5zQpBkuB3O0vPt4DgQQ0e
	B+47FcnPCzdwe8Oqsoh/HHN69dgP+U05Dz4DBADp9DQhTQ5uJGotR5DE8BO2n0bhDZCjCq3NsmQ
	vxV3+JnYTLD1coSRqxBMf6AQ6mm/akccHHrB3YP1rcGA2QUEAGt8b0GY7LOnSc0r3DQ==
X-Gm-Gg: ATEYQzz/+q6D6eFS4RztViXcfHdAFTJ3NhJrl/G6SmV9Vlejv84IAz+VR8+g+w6Sxf5
	q569IYS0lBAiPqK+UkfawZxuDkAo3Ls9IaDDMRCAz7qQsYwd3kdkEnS858fDH0V8T4lLbras44X
	REm8aXSlNdWQk+UwbgDX0/Fb+73+AP7racNvXjbcJ6bf4gd7tEpJq4G0ZmKaKMJzgzAxJDWD/Zt
	y3u/5e2HbiM6+eDbysq4cT/BW69BI1/YtSpGMbNAtGoRDTxc87b6VFyB3hwCpJzo4upK+8XsG77
	QZztfAtHn9A5NsvoWhf1xmP5tQMzHM11WVwHZRmXf4sPFCHTGX4AI3X+JA5YDEtCq2oemDm0SHz
	PlP0V6jBMIoJ6xKyWilrjlhJUMBubKS7adn/wsqalVUUg3IYAOiF/SK/21R5nj75OxWbgZevCqf
	6HjclcroNqkcs7F3B5a0zowkjQcE+jDdZvBMU=
X-Received: by 2002:a05:620a:470b:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cbbf36a89dmr531479685a.15.1772150763235;
        Thu, 26 Feb 2026 16:06:03 -0800 (PST)
X-Received: by 2002:a05:620a:470b:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cbbf36a89dmr531475985a.15.1772150762655;
        Thu, 26 Feb 2026 16:06:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1112d2be1sm43801e87.20.2026.02.26.16.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 16:06:01 -0800 (PST)
Date: Fri, 27 Feb 2026 02:05:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 6/7] media: qcom: camss: Add support for PHY API
 devices
Message-ID: <weutzjofwiuzmed4rrst6ndssjjpue3ydjhkzydy2zgx64ebt7@eavr3ytr5kzu>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-6-a59c3f037d0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-6-a59c3f037d0b@linaro.org>
X-Proofpoint-ORIG-GUID: FA-HlqmyWBGgOwwoG4aMOlKWp9NT6PQP
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a0dfec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=nU6HNqO0-IDNBySTg5AA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FA-HlqmyWBGgOwwoG4aMOlKWp9NT6PQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDIyMSBTYWx0ZWRfX5r36fGDplJqB
 jXqFk5FccSmUTbGK4R+JEN23gx5z78LjMXsIiYn9NDW1nZJ4a3pCCW3WAA+fuOUPFTfHbwluB75
 btICfkFkTBcg6IcmMQa8RCsU6r1D1azhtm5PLvTtbc3MALkqF6nHTJt7ZLUkYTWTFV68sZ5XXkg
 y30rqL//3t8qPtlBsdmDLW2Hswjh395CSMBZoADXWurD7m0rEgaQ0PpsFYi/9UoBYjHyvCw7yZz
 /Z1lfvsqvNJtpNR9s+Uqh8V6lRMQ5Vzjcu4p0FUgYrqa30SQP+FsGfqH0mhiqRxHxBXyBfX/O+T
 EY+6aETrduee9ezORJHttc/HIO/Eq8rcniVo4dn+dFys6lyPtNB9tq61myXwuIYNJpsqeZ4Y4iM
 Rl1Z9/j6bjgALHzc0IaB2oQLav1J8itqHDd7d9k1Fh7l5BTgvBNzKYrR+TitmNXfwTixoppt2xY
 N8qkkMJ5iIHG+7y91Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260221
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53648-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D59361B11F2
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:28:47PM +0000, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
> 
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 185 +++++++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
>  drivers/media/platform/qcom/camss/camss.c        |  72 +++++++--
>  4 files changed, 235 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index 4eda48cb1adf0..1edc5e5a1829e 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_SG
>  	select V4L2_FWNODE
> +	select PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 62623393f4144..b8bfbf2fef8fa 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -7,12 +7,14 @@
>   * Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2016-2018 Linaro Ltd.
>   */
> +#include <dt-bindings/phy/phy.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
> +#include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <media/media-entity.h>
> @@ -131,10 +133,10 @@ static u8 csiphy_get_bpp(const struct csiphy_format_info *formats,
>  }
>  
>  /*
> - * csiphy_set_clock_rates - Calculate and set clock rates on CSIPHY module
> + * csiphy_set_clock_rates_legacy - Calculate and set clock rates on CSIPHY module
>   * @csiphy: CSIPHY device
>   */
> -static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
> +static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
>  {
>  	struct device *dev = csiphy->camss->dev;
>  	s64 link_freq;
> @@ -200,7 +202,7 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_set_power(struct v4l2_subdev *sd, int on)
> +static int csiphy_set_power_legacy(struct v4l2_subdev *sd, int on)
>  {
>  	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
>  	struct device *dev = csiphy->camss->dev;
> @@ -219,7 +221,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>  			return ret;
>  		}
>  
> -		ret = csiphy_set_clock_rates(csiphy);
> +		ret = csiphy_set_clock_rates_legacy(csiphy);
>  		if (ret < 0) {
>  			regulator_bulk_disable(csiphy->num_supplies,
>  					       csiphy->supplies);
> @@ -254,7 +256,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>  }
>  
>  /*
> - * csiphy_stream_on - Enable streaming on CSIPHY module
> + * csiphy_stream_on_legacy - Enable streaming on CSIPHY module
>   * @csiphy: CSIPHY device
>   *
>   * Helper function to enable streaming on CSIPHY module.
> @@ -262,7 +264,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_stream_on(struct csiphy_device *csiphy)
> +static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
>  {
>  	struct csiphy_config *cfg = &csiphy->cfg;
>  	s64 link_freq;
> @@ -306,11 +308,86 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   *
>   * Helper function to disable streaming on CSIPHY module
>   */
> -static void csiphy_stream_off(struct csiphy_device *csiphy)
> +static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
>  {
>  	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
>  }
>  
> +/*
> + * csiphy_stream_on - Enable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to enable streaming on CSIPHY module.
> + * Main configuration of CSIPHY module is also done here.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_stream_on(struct csiphy_device *csiphy)
> +{
> +	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
> +				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> +	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	struct phy_configure_opts_mipi_dphy *dphy_cfg;
> +	union phy_configure_opts dphy_opts = { 0 };
> +	struct device *dev = csiphy->camss->dev;
> +	s64 link_freq;
> +	int ret;
> +
> +	dphy_cfg = &dphy_opts.mipi_dphy;
> +
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +
> +	if (link_freq < 0) {
> +		dev_err(dev,
> +			"Cannot get CSI2 transmitter's link frequency\n");
> +		return -EINVAL;
> +	}
> +
> +	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_cfg);
> +
> +	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +	ret = phy_configure(csiphy->phy, &dphy_opts);
> +	if (ret) {
> +		dev_err(dev, "failed to configure MIPI D-PHY\n");
> +		goto error;
> +	}
> +
> +	return phy_power_on(csiphy->phy);
> +
> +error:
> +	return ret;
> +}
> +
> +/*
> + * csiphy_stream_off - Disable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to disable streaming on CSIPHY module
> + */
> +static void csiphy_stream_off(struct csiphy_device *csiphy)
> +{
> +	phy_power_off(csiphy->phy);
> +}
> +
> +/*
> + * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> + * @sd: CSIPHY V4L2 subdevice
> + * @enable: Requested streaming state
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_set_stream_legacy(struct v4l2_subdev *sd, int enable)
> +{
> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
> +	int ret = 0;
> +
> +	if (enable)
> +		ret = csiphy_stream_on_legacy(csiphy);
> +	else
> +		csiphy_stream_off_legacy(csiphy);
> +
> +	return ret;
> +}
>  
>  /*
>   * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> @@ -568,16 +645,16 @@ static bool csiphy_match_clock_name(const char *clock_name, const char *format,
>  }
>  
>  /*
> - * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
> + * msm_csiphy_subdev_init_legacy - Initialize CSIPHY device structure and resources
>   * @csiphy: CSIPHY device
>   * @res: CSIPHY module resources table
>   * @id: CSIPHY module id
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -int msm_csiphy_subdev_init(struct camss *camss,
> -			   struct csiphy_device *csiphy,
> -			   const struct camss_subdev_resources *res, u8 id)
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +				  struct csiphy_device *csiphy,
> +				  const struct camss_subdev_resources *res, u8 id)
>  {
>  	struct device *dev = camss->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -705,6 +782,69 @@ int msm_csiphy_subdev_init(struct camss *camss,
>  	return ret;
>  }
>  
> +/*
> + * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
> + * @csiphy: CSIPHY device
> + * @res: CSIPHY module resources table
> + * @id: CSIPHY module id
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +int msm_csiphy_subdev_init(struct camss *camss,
> +			   struct csiphy_device *csiphy,
> +			   const struct camss_subdev_resources *res, u8 id)
> +{
> +	struct device *dev = camss->dev;
> +	struct of_phandle_args args;
> +	u8 combo_mode;
> +	int idx;
> +	int ret;
> +
> +	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", id);
> +
> +	idx = of_property_match_string(dev->of_node, "phy-names", csiphy->name);
> +	if (idx < 0) {
> +		dev_err(dev, "%s not found\n", csiphy->name);

It can't be an error. You are breaking the possiblity for existing
platforms to gradually migrate from the legacy DT bindings to the new
CSI PHY bindings (or to the new CSI PHY driver, if you prefer it this
way).

Not to mention that you've just broken compatibility with the camss
schema that was defined for the last 4(?) Linux releases for X1E8.

> +		return idx;
> +	}
> +

-- 
With best wishes
Dmitry

