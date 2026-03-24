Return-Path: <linux-media+bounces-56913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM6KNLnywmnCnQQAu9opvQ
	(envelope-from <linux-media+bounces-56913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:23:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3795B31C460
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DD4130E1509
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 20:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A28349AEC;
	Tue, 24 Mar 2026 20:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Kgs9f2SW"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013001.outbound.protection.outlook.com [40.107.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF10F349B0B;
	Tue, 24 Mar 2026 20:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774383541; cv=fail; b=omkNO405u6eJgyohofINWn4U04ustISuSByg1twZzrTizhRFifS8B69DBTMxv4USm7rLtsjb6Gewk2uvukoafC6oXOOyEhzZEyTb2OxBby7FcGdR981/brCKJQJuPoQQsQ35nnHrGeZDjIKlfnvXHpvest8i6A3hhkYyKAHoVR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774383541; c=relaxed/simple;
	bh=ajuKBHAHzqP6w6coFTJGgKw2+jXLjFISMNl7Tc5uoaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EZCskUo+EpfLYUuSRAgNkMSID6N2pkR13owiRSXhidATVj5WjPplyTpqmP2fNXc8opKhkl8RRgLxojhz7K0l/4yBE7RILNMY92GQUn1C19NnNwzgUq/9Rf8NlF/gsTj0yjUVCJD4jq4GtFB8p5OWK3Lu1XzjG9ZqWUQUUMHiG/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Kgs9f2SW; arc=fail smtp.client-ip=40.107.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoGlGMXCdcyVDSdEZdpp4Jrf4+IyxHmgIXEbxoLLuc11auGBnetx9MGxc5t9ktEMdQZNciXyVQIz53NUUw5O46GPEDdxopaHyVx2SQ17xnnmc67ktMkZEXH8uxUd9pNhsJJEmM44r7uhRDi9dLHQFF1WfTh7SNxAuNrn9bppmyW4+g1703xnlYZVpNv8zcV4FfPlKvUu5LMi2kSF0qaDTx555zi9mdV/99OpvQ7CgdMshlUnyMYt6Exub80V2WN7DDvbiXOHCmetNfePJ/XH85WHZYXPGAaceRQT4+tdtt7I4M+1T/kZcPl7t+sxihGwTXLSb0Bo0jPbWaX0An2oqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLCRSjgbnevrtQkoGTFK3rtH0n2sOIn4fAuRTnalZP8=;
 b=qyEL1NYnsn9sGLf5Q1bkqieniMKixcIvST+cyL8om9pstraUkdSLMWu6pirYousVbnLaFOeuatzD7RMJ1BFlQuelEb3uuyCCoflyFWzlpXBqCON7qwnCC07pS7NpyePbkG44RkDVGPHl7d+CvVgAzGiFMzBO8hgAz02smxUMifd7Z9uKmIi/sUlwBBEiSHvb06fidylWN29wpkng/kss7qXS7McyISYu1w9Cx4eFOYfNBeT/UTt4nYOBj1RUASV8ITnHXTuIttznMs4F6bA2IBi/QFiKWvUpgJPIiwMZco/7SvFvyqctT+1/caL1a4abM4P5z0Paz+IsntArI9Cv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=chipsnmedia.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLCRSjgbnevrtQkoGTFK3rtH0n2sOIn4fAuRTnalZP8=;
 b=Kgs9f2SWDbiWECGeiL7Zd5VU81CRGCRzfrQEh0hH3dkVx60CNwrhy9vUkROKTw32BPVk4nV6oqQEydWg3D6grUco0hOx/1pDV5JCj8MPMo9L/vbDU0/OhWw+wqqEx2+uDI4tnJAEXa47HaFwV8gTJepqvU/LamNAZeUMCs86YAA=
Received: from MN2PR14CA0016.namprd14.prod.outlook.com (2603:10b6:208:23e::21)
 by MN6PR10MB7997.namprd10.prod.outlook.com (2603:10b6:208:500::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 20:18:58 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:23e:cafe::f) by MN2PR14CA0016.outlook.office365.com
 (2603:10b6:208:23e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 20:18:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Tue, 24 Mar 2026 20:18:57 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 15:18:57 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 15:18:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 15:18:56 -0500
Received: from [128.247.81.76] (b-brnich.dhcp.ti.com [128.247.81.76])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OKIu6M3232751;
	Tue, 24 Mar 2026 15:18:56 -0500
Message-ID: <913a79b0-7916-4277-be78-237221118f1a@ti.com>
Date: Tue, 24 Mar 2026 15:18:56 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] media: chips-media: wave5: Support CBP profile
To: Jackson.lee <jackson.lee@chipsnmedia.com>, <mchehab@kernel.org>,
	<nicolas@ndufresne.ca>, <sebastian.fricke@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<hverkuil@xs4all.nl>, <nas.chung@chipsnmedia.com>,
	<lafley.kim@chipsnmedia.com>
References: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
 <20260324050400.218-4-jackson.lee@chipsnmedia.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20260324050400.218-4-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|MN6PR10MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: ac828beb-d5c0-4af4-2b55-08de89e29450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	m/+teME0AfyAeHp6zxvHcljhMXbEUYzaOn1Ubc1Y87n/PODHEfOPv7lYTIPi2WdUBWUi/tyCvDXqXua4KNEOU6rYpqBGiD+WlrwxzrzRs/NphTN+v2Ru0XWRiiKpUL5UYuhiCYYnn3ffWiO9fKKzY+ZmojHGHf7O5tz9Btel36DCQVwMD/DAFuHnT2CIuty1kn2bseRzFxfnaKDSvRbu2pPDb3DuX77Grfa67YlC/b+IsUI07XapvSbxO25sBFAfSDrh1H+Vjk1mxfc9OcztoASSLHEnhqyG1sKcY5udm52WIh7fLs69Q7E2D1paTTOQVwnwn7rw8fTJevobB4K9mxgTqU+uNrm2bAvg63PHpWPsM1QExpdFWcbxeki86ST19lNlkx2uhvpbnl/3udUWejTxlk/+bK1zOEQB3NLy7r0Z5+mtSh8zyztVUdNQOQfEHAcbZ3IIUnCugFjY8oZiHrq3tblxUbLYK3hrDM2YhqANLCrLWJnbFoqbV0xgWEWFKgnk1/CNa3Y6O5ZU/pjkTA8Wpy7KV6yYrbT3879zTNIc2l5qsVS8kuGy52YNRBFM8rxEYUBSiaD7MG8zKs37UMmv3DpH0+lD+igjJ8xDZU2MKE5zR2n3oW+Ok3C+WJqaTZcrF2sDuwHvfJIP7V22pAOpbs96k2CqfUxjOr1YlHRoJsTvFHeU+KgeKK9ox6Z8xGlI97C3Ns2aYemEUJFF9EqdWRAKXf8Eu9r6ZV3MoXT6x4mX0GKqkgKuSXoZhoR77ui4thhmpL2bwiv4LegW+g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2zSMqItoow9SSduxAyImz4icoSN86aTMWOv/CBiwXijutWw5FmO1oaMo+JBrwSp5LTB3k9ogjmvZ1Q2i5Azc/7f/DtFynpiCYi7iCAbejDrn4mFVttXsWknplYB1ezmkaeh/a8VI+EQ4vFAa8EkXtjxz9yv62umPVqZjI+/qQPUANNawb1MUmUS4vnd6hE2CZuE3aCBAQ9aH8TfDthnUE7OiWlZmX0C8uNhPQ/nRVhc3uH3xvplg/mJQzUVl29MGOvGSczXQvgw+7A0Tb319hp4ZWosWhiAm9u5k0NX+/2DhSjdtvCXqcdYZC72kRD+R/0iBO69baU/EGx8RuHIle2sVM5NI+1tIZ3BZlkXNtet6WLpJyApI6Gl0ysgUYFZKv5zdFm3qbq79qrmlp5pmyRT1L/x2N005g4x8ZrSvEnxYT2WSvP6QenZkpZnXkgXO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 20:18:57.5955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac828beb-d5c0-4af4-2b55-08de89e29450
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7997
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,chipsnmedia.com];
	TAGGED_FROM(0.00)[bounces-56913-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-brnich@ti.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3795B31C460
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jackson,

On 3/24/26 00:03, Jackson.lee wrote:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> Constrained Baseline Profile (CBP) and Baseline Profile (BP) have been
> treated as the same.
> Introduce the ability to differentiate between the two.
> 
> Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>   drivers/media/platform/chips-media/wave5/wave5-hw.c      | 3 +++
>   drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 ++++-
>   drivers/media/platform/chips-media/wave5/wave5-vpuapi.h  | 1 +
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> index c516d125f553..2392bce8d840 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -1763,6 +1763,9 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
>   			(p_param->skip_intra_trans << 25) |
>   			(p_param->strong_intra_smooth_enable << 27) |
>   			(p_param->en_still_picture << 30);
> +	else if (inst->std == W_AVC_ENC)
> +		reg_val |= (p_param->constraint_set1_flag << 29);
> +
>   	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_SPS_PARAM, reg_val);
>   
>   	reg_val = (p_param->lossless_enable) |
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 6fe01217233f..775beeb10fd4 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -939,6 +939,8 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
>   		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
>   			inst->enc_param.profile = H264_PROFILE_BP;
>   			inst->bit_depth = 8;
> +			if (ctrl->val == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE)
> +				inst->enc_param.constraint_set1_flag = 1;
>   			break;
>   		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
>   			inst->enc_param.profile = H264_PROFILE_MP;
> @@ -1215,6 +1217,7 @@ static int wave5_set_enc_openparam(struct enc_open_param *open_param,
>   			open_param->wave_param.intra_period = input.avc_idr_period;
>   		}
>   	} else {
> +		open_param->wave_param.constraint_set1_flag = input.constraint_set1_flag;
>   		open_param->wave_param.avc_idr_period = input.avc_idr_period;
>   	}

Thank you for fixing. Setting GOP and CBP work for me now.

Tested-by: Brandon Brnich <b-brnich@ti.com>

>   	open_param->wave_param.entropy_coding_mode = input.entropy_coding_mode;
> @@ -1687,7 +1690,7 @@ static int wave5_vpu_open_enc(struct file *filp)
>   			  -6, 6, 1, 0);
>   	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
>   			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
> -			  0, 1, 1, 1);
> +			  0, 1, 1, 0);
>   	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
>   			  V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION,
>   			  0, 1, 1, 0);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index dc31689e0d27..7b08fef58217 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -570,6 +570,7 @@ struct enc_wave_param {
>   	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
>   	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
>   	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
> +	u32 constraint_set1_flag: 1; /* enable CBP */
>   	u32 bg_detection: 1; /* enable background detection */
>   };
>   


