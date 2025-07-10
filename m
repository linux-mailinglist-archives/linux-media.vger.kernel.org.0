Return-Path: <linux-media+bounces-37337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1668B0098D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F0BC1C85E78
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624C62F005D;
	Thu, 10 Jul 2025 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0mF/fPu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58652797A0
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752167318; cv=none; b=L/+UbYWRghFjYTZuY8BTwR6O9YQZvYGeY3GONSfeglG8O/1VMgvd6v1FFG7o6WQ+iT6lyLiTjiy8tdxR5mZKj4At1SAsnrpj/u7XjfprIHQWQ2/ug937Kf2eHqn6MajY+4xWoM6DXxeCx7r4lR47juBaO8KIW8i+LWjZTt1EoH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752167318; c=relaxed/simple;
	bh=5kPoJs4b5S5HaPu8JrjR9cnFx8ecQ9rQ1rmThby+ONg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gn2gSm5Cp5aX7hos3Y6ShIcnRiIrXpKmtCOn66aNEZDRCvw4fP+M5Rm5S6VEZOMJC5xTolbee0pNUUP0ob5qF3whbiBVEX/NCjf99b7IMzUaHOndPaXqH56aTgbOlQTiOkfYs5C/l4PWO++eC4KzMlJlY/v1usmg0TPCkl5Zurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0mF/fPu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A93u3L030247
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ggtWkiQs89s3QBp6rpOVIdXl7Ukk6uE7CY0cYKUsZ2Q=; b=k0mF/fPuQ3wt2gd3
	lmXfuTO1GRMYeRVg3lZqIzwuAw4QEsDTTvP5dWl98a7EjBwNewYE0DBfozDANZyR
	Nm5hlmnCf+Bs5RNKd0U+/rTb/BtMZ7elCypcs7v/nGjGMqpVlFkIFJ7hd78Pe+4k
	sP+0xbubUqaQWzHFCrVWpzj/FwMyzFmerLibkGRxmdg0+rc23JrcHliP6EN0kveR
	BOgEVHhcuWn9URDwCXhEJ1c/D2Qy253Ei7lQBTK4r33mq1/tzkJbWn849j4Vhebn
	s0sXR9iMd3EACKYbqeN7g69EO3Uy8AGOfI9qLYwuln+6JMdSl9lcrhQxT1SYddx9
	d7xmlQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg5ryy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:08:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a804126ed6so4812881cf.1
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 10:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752167314; x=1752772114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggtWkiQs89s3QBp6rpOVIdXl7Ukk6uE7CY0cYKUsZ2Q=;
        b=egNh1Y4dD/BYH+VRUzjo5SCPSsw9LnxADYUdxTJmehsPkEtBu0MT30OY3RIZGJba23
         v/EWsLWRe1th7J5473xmg/SSolp/fJM4dm2XxY2ZxGhIIXGUGrAz9Z0Au8nEFzNs/GWr
         raqV6OUBVgUa97cr35dA7k0D6yA30FRrPtgbJfwtb1KVKt5RcJjC0qhMjxuTKfQvNHOA
         vPMa5Ce2ewgunafiFZoQ2wtk4SG0gUIAxnUt1GUq+Dp6VSuPqQbDTspj6Pvqspqf924E
         5NbeeJZ3IoZHJpEoZ0wygu3ofWDvPSOnM+sXoTT07ttA2mCga1qBySR5m7CqV79fhazf
         mBJg==
X-Forwarded-Encrypted: i=1; AJvYcCUt/wAf6lPRKLBGMLVR1UnUSP3hmJQKT2xUIoFHCpS1Lc5N7okZkXiRVC7G8VN5gdOzUbs0Tp+nfhHwbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8x+pjCU+KcfZUnFCYH0aHQC27Yr1eGSETNM5ddGoYYGjmsQk
	R5Zodajj+SY79Qr0BdIk1e6bp1GlQKCAh3+e2PRpiBqJiB2hBOgqPsbJ491Ca/otQZRyNmmHYKs
	LBHNxvhrkN0c+YX7Ta+u3MPt7nh8o8LK2JkmX1I+kqpsI8nGXc3mSMs2Xbh3k4Fgje4qEHrtMTA
	==
X-Gm-Gg: ASbGnctC0JJ05KHEbLT02ZiHjUTTTIJox3janyd/nYcNUdD1TYQX4lQ0TGrsqcwB0y1
	gFKq0BRpODPWJBHwrcjKjMpQ2lqf+eEVNRKtkLTKLc1G7hPVku0Z2hGNLgDoyDmn1el/jZC1cFN
	8SL2bQqLRWv1x+le0rt29yZDnxdktqjgiCIDCGvNvsKmibDXaoClTfQ2xNC2N/4B0xIBqTPxRrj
	jXWi0LZjKpyDbRbqEx1zMXXuTgi8c6iSc2q+cXVveUrhJR7mANq7S9vF9tgMz8r7hj98f3xPMyQ
	yINv+CSEjWiipp87QAbuH4/mg05TiClvsldMl6+Hmuo/4BbpmFn8H8/zHrk5RF5m2XY8a4jaaDF
	F0pM=
X-Received: by 2002:ac8:5dd1:0:b0:4a4:369e:6e54 with SMTP id d75a77b69052e-4a9fb922a3fmr961751cf.12.1752167313959;
        Thu, 10 Jul 2025 10:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRHm3dqHnb1sbGXQjan0u+Nhsc9101QDwKITMxsWlBddsLL+3wYaDC/munBnmlmfNnLol/aQ==
X-Received: by 2002:ac8:5dd1:0:b0:4a4:369e:6e54 with SMTP id d75a77b69052e-4a9fb922a3fmr961461cf.12.1752167313312;
        Thu, 10 Jul 2025 10:08:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82e5309sm163847166b.173.2025.07.10.10.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 10:08:31 -0700 (PDT)
Message-ID: <895b931d-15a4-4922-b52f-6c6cf7fc6243@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 19:08:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686ff393 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=lTISj-4ZNgYCTWXxptsA:9
 a=aagMJU_kSCl_YEFH:21 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NLS8FcLzJpos_Jv4k6223BYh_TZm34oZ
X-Proofpoint-GUID: NLS8FcLzJpos_Jv4k6223BYh_TZm34oZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0NSBTYWx0ZWRfX3TbugX/n9EyT
 TRoMVp5ivCST5Rbgmhr60rk/fSkNygg0OFHL5J4eHyJP8TcO+NB8DJfKWWASZx3fVZv0u7XqW0s
 V1NBAPKxx3NbytATm0++cAS639+gA+8fO9FgL/NcotGF5L6i4JkFb9OpPHPu0RSjvNugoogcLti
 636CfCrAKGFRB3Qyn5QNHCcBzvOKlHu7GcpPgVg/wfyI30DtQdAYKWeJ2rYtMPozHmgt7f5BvAY
 WB1xG1Wf9i036SvEMMSN5z4WsrUUL7k6IGboPVfi6cvw8vd+Nod8FU/mtQHYdcgkjxqaZpkjZ1H
 /cA6FaZxaO0wepkt+5IHnNDoFSC/QutnSUNLBYGg6B+4DWSy9hb/RM36vyRckbXkmS2G6ZdPZ+g
 Va9YJdEGSnPukAPqsF7bOSGBKmb8fNxS0fl4JBOzuUpxSB6DfNL8xc/sBsCcPvD2c5y7vtzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100145

On 7/10/25 6:16 PM, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in D-PHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> In-line with other PHY drivers the process node name is omitted from the
> compat string while the soc name is included.
> 
> At the moment we follow the assignment of lane positions - the bitmap of
> physical input lanes to logical lane numbers as a linear list per the
> existing DPHY @lanes data-member.
> 
> This is fine for us in upstream since we also map the lanes contiguously
> but, our hardware can support different lane mappings so we should in the
> future extend out the DPHY structure to capture the mapping.
> 
> The Qualcomm 3PH class of PHYs can do both D-PHY and C-PHY mode. For now only
> D-PHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well proven
> in CAMSS and mature so the main thing to watch out for here is how to get
> the right sequencing of regulators, clocks and register-writes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

This is a good opporunity to refresh the code a bit

[...]

> +#define CSIPHY_3PH_LNn_CFG1(n)				(0x000 + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG		(BIT(7) | BIT(6))
> +#define CSIPHY_3PH_LNn_CFG2(n)				(0x004 + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT		BIT(3)
> +#define CSIPHY_3PH_LNn_CFG3(n)				(0x008 + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CFG4(n)				(0x00c + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS		0xa4
> +#define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS_660		0xa5
> +#define CSIPHY_3PH_LNn_CFG5(n)				(0x010 + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CFG5_T_HS_DTERM			0x02
> +#define CSIPHY_3PH_LNn_CFG5_HS_REC_EQ_FQ_INT		0x50
> +#define CSIPHY_3PH_LNn_TEST_IMP(n)			(0x01c + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_TEST_IMP_HS_TERM_IMP		0xa
> +#define CSIPHY_3PH_LNn_MISC1(n)				(0x028 + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_MISC1_IS_CLKLANE			BIT(2)
> +#define CSIPHY_3PH_LNn_CFG6(n)				(0x02c + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CFG6_SWI_FORCE_INIT_EXIT		BIT(0)
> +#define CSIPHY_3PH_LNn_CFG7(n)				(0x030 + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CFG7_SWI_T_INIT			0x2
> +#define CSIPHY_3PH_LNn_CFG8(n)				(0x034 + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CFG8_SWI_SKIP_WAKEUP		BIT(0)
> +#define CSIPHY_3PH_LNn_CFG8_SKEW_FILTER_ENABLE		BIT(1)
> +#define CSIPHY_3PH_LNn_CFG9(n)				(0x038 + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CFG9_SWI_T_WAKEUP		0x1
> +#define CSIPHY_3PH_LNn_CSI_LANE_CTRL15(n)		(0x03c + 0x100 * (n))
> +#define CSIPHY_3PH_LNn_CSI_LANE_CTRL15_SWI_SOT_SYMBOL	0xb8

> +
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))> +
> +#define CSIPHY_DEFAULT_PARAMS				0
> +#define CSIPHY_LANE_ENABLE				1
> +#define CSIPHY_SETTLE_CNT_LOWER_BYTE			2
> +#define CSIPHY_SETTLE_CNT_HIGHER_BYTE			3
> +#define CSIPHY_DNP_PARAMS				4
> +#define CSIPHY_2PH_REGS					5
> +#define CSIPHY_3PH_REGS					6
> +#define CSIPHY_SKEW_CAL					7

These could be turned into separate sub-sequences instead (like e.g. in
qmpphy drivers)

Specifically with 2PH_REGS/3PH_REGS, I'm assuming 2PH refers to another
piece of hardware which could have its own init sequences..

> +
> +/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
> +static const struct
> +mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
> +	/* Power up lanes 2ph mode */
> +	{0x1014, 0xD5, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x101C, 0x7A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x1018, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},

struct mipi_csi2phy_lane_regs {
	const s32 reg_addr;
	const s32 reg_data;
	const u32 delay_us;
	const u32 mipi_csi2phy_param_type;
};

let's use designated initializers, decimal for delay_us (omit it
where unnecessary)

[...]

> +static inline const struct mipi_csi2phy_device_regs *
> +csi2phy_dev_to_regs(const struct mipi_csi2phy_device *csi2phy)
> +{
> +	return &csi2phy->soc_cfg->reg_info;
> +}

#define?

> +
> +static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +	u32 hw_version;
> +
> +	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));

Do we need to clear this later?> +
> +	hw_version = readl_relaxed(csi2phy->base +
> +				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
> +	hw_version |= readl_relaxed(csi2phy->base +
> +				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
> +	hw_version |= readl_relaxed(csi2phy->base +
> +				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
> +	hw_version |= readl_relaxed(csi2phy->base +
> +				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;

I don't like how you're ORing the entirety of these 32-bit registers
into the saved value, maybe we can get the lower 8 bits of each and
construct the result with more guardrails

> +
> +	csi2phy->hw_version = hw_version;
> +
> +	dev_dbg(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);

dev_dbg_once() will suffice

> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_reset - Perform software reset on CSIPHY module
> + * @phy_qcom_mipi_csi2: CSIPHY device
> + */
> +static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +
> +	writel_relaxed(0x1, csi2phy->base +
> +		      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
> +	usleep_range(5000, 8000);
> +	writel_relaxed(0x0, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));

Can we get a name for this BIT(0)?

> +}
> +
> +static irqreturn_t phy_qcom_mipi_csi2_isr(int irq, void *dev)
> +{
> +	const struct mipi_csi2phy_device *csi2phy = dev;
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +	int i;
> +
> +	for (i = 0; i < 11; i++) {
> +		int c = i + 22;

Please add some comments regarding these number choices

> +		u8 val = readl_relaxed(csi2phy->base +
> +				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
> +
> +		writel_relaxed(val, csi2phy->base +
> +			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
> +	}
> +
> +	writel_relaxed(0x1, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));
> +	writel_relaxed(0x0, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));

No need for any delays?

> +
> +	for (i = 22; i < 33; i++) {

Please provide some context here too

> +		writel_relaxed(0x0, csi2phy->base +
> +			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_settle_cnt_calc - Calculate settle count value
> + *
> + * Helper function to calculate settle count value. This is
> + * based on the CSI2 T_hs_settle parameter which in turn
> + * is calculated based on the CSI2 transmitter link frequency.
> + *
> + * Return settle count value or 0 if the CSI2 link frequency
> + * is not available
> + */
> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
> +{
> +	u32 ui; /* ps */
> +	u32 timer_period; /* ps */
> +	u32 t_hs_prepare_max; /* ps */
> +	u32 t_hs_settle; /* ps */

picoseconds? you can suffix the variables with _ps

Also, a reverse-Christmas-tree sorting would be neat

> +	u8 settle_cnt;
> +
> +	if (link_freq <= 0)
> +		return 0;
> +
> +	ui = div_u64(1000000000000LL, link_freq);

PSEC_PER_SEC

> +	ui /= 2;
> +	t_hs_prepare_max = 85000 + 6 * ui;
> +	t_hs_settle = t_hs_prepare_max;
> +
> +	timer_period = div_u64(1000000000000LL, timer_clk_rate);

ditto

[...]

> +	for (i = 0; i < array_size; i++, r++) {
> +		switch (r->mipi_csi2phy_param_type) {
> +		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
> +			val = settle_cnt & 0xff;
> +			break;

what about CSIPHY_SETTLE_CNT_HIGHER_BYTE?

> +		case CSIPHY_SKEW_CAL:
> +			/* TODO: support application of skew from dt flag */

Why? What are these?> +			continue;
> +		case CSIPHY_DNP_PARAMS:
> +			continue;

"do not program"? why are they in the tables then?

> +		default:
> +			val = r->reg_data;
> +			break;
> +		}
> +		writel_relaxed(val, csi2phy->base + r->reg_addr);
> +		if (r->delay_us)
> +			udelay(r->delay_us);
> +	}
> +}
> +
> +static bool phy_qcom_mipi_csi2_is_gen2(struct mipi_csi2phy_device *csi2phy)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +
> +	return regs->generation == GEN2;
> +}

You only used this once, I don't think it's very useful

[...]

> +
> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
> +					   struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
> +	u8 settle_cnt;
> +	u8 val;
> +	int i;
> +
> +	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
> +
> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	for (i = 0; i < cfg->num_data_lanes; i++)
> +		val |= BIT(lane_cfg->data[i].pos * 2);
> +
> +	writel_relaxed(val, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
> +
> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
> +	writel_relaxed(val, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
> +
> +	val = 0x02;
> +	writel_relaxed(val, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
> +
> +	val = 0x00;

Can we get some names for the magic (un)set bits?

[...]

> +static void
> +phy_qcom_mipi_csi2_lanes_disable(struct mipi_csi2phy_device *csi2phy,
> +				 struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +
> +	writel_relaxed(0, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
> +
> +	writel_relaxed(0, csi2phy->base +
> +			  CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));

Does the former write need to complete before the latter?

> +}
> +
> +static int phy_qcom_mipi_csi2_init(struct mipi_csi2phy_device *csi2phy)
> +{
> +	return 0;
> +}
> +
> +const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 = {
> +	.hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
> +	.reset = phy_qcom_mipi_csi2_reset,
> +	.lanes_enable = phy_qcom_mipi_csi2_lanes_enable,
> +	.lanes_disable = phy_qcom_mipi_csi2_lanes_disable,
> +	.isr = phy_qcom_mipi_csi2_isr,
> +	.init = phy_qcom_mipi_csi2_init,

You're never calling init(), remove it. If you need it in the future,
make it non-obligatory so that you don't need the above stub

> +};
> +
> +const struct mipi_csi2phy_clk_freq zero = { 0 };

'zero' is a terrible global variable name

> +
> +const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy = {
> +	.freq = {
> +		300000000, 400000000, 480000000
> +	},
> +	.num_freq = 3,
> +};
> +
> +const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy_timer = {
> +	.freq = {
> +		266666667, 400000000
> +	},
> +	.num_freq = 2,
> +};

These operating points *require* different RPMh levels, let's
grab them from an OPP table and do the ratesetting through the
related APIs

> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +	.reg_info = {
> +		.init_seq = lane_regs_x1e80100,
> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.offset = 0x1000,

common_regs_offset

> +		.generation = GEN2,
> +	},
> +	.supply_names = (const char *[]){
> +		"vdda-0p8",
> +		"vdda-1p2"
> +	},
> +	.num_supplies = 2,
> +	.clk_names = (const char *[]) {
> +		"camnoc_axi",
> +		"cpas_ahb",
> +		"csiphy",
> +		"csiphy_timer"
> +	},
> +	.num_clk = 4,
> +	.clk_freq = {
> +		zero,
> +		zero,
> +		dphy_4nm_x1e_csiphy,
> +		dphy_4nm_x1e_csiphy_timer,

Throw the ratesetting clocks into opp_config and grab the rest
through clk_bulk_get_all()

> +	},
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..1def2d1258d9dd3835c09c6804e08dfffc184248
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Linaro Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +#define CAMSS_CLOCK_MARGIN_NUMERATOR 105
> +#define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
> +
> +static inline void phy_qcom_mipi_csi2_add_clock_margin(u64 *rate)
> +{
> +	*rate *= CAMSS_CLOCK_MARGIN_NUMERATOR;
> +	*rate = div_u64(*rate, CAMSS_CLOCK_MARGIN_DENOMINATOR);
> +}

I can't find downstream doing that

[...]

> +	/*
> +	 * phy_configure_opts_mipi_dphy.lanes starts from zero to
> +	 * the maximum number of enabled lanes.
> +	 *
> +	 * TODO: add support for bitmask of enabled lanes and polarities
> +	 * of those lanes to the phy_configure_opts_mipi_dphy struct.
> +	 * For now take the polarities as zero and the position as fixed
> +	 * this is fine as no current upstream implementation maps otherwise.
> +	 */

Can we at least grab the data and make sure it matches the
default hw configuration now, so that we won't break bad
DTs in the future?

[...]


> +static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
> +{
> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> +
> +	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +				   csi2phy->clks);
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);

downstream issues a sw reset across a number of registers first

[...]> +static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
> +	{ .compatible	= "qcom,x1e80100-mipi-csi2-combo-phy", .data = &mipi_csi2_dphy_4nm_x1e },

odd >1 space

Konrad

