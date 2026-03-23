Return-Path: <linux-media+bounces-56762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKS1GzJ4wWkQTQQAu9opvQ
	(envelope-from <linux-media+bounces-56762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 18:28:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F16A2F9EE2
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 18:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FDF93040504
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98473C4551;
	Mon, 23 Mar 2026 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UQtVioMO"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF623BADB3;
	Mon, 23 Mar 2026 17:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285612; cv=fail; b=dpm8cgPyVo+xTEIvwgudPloBAc/YsWu03UV0bMvLF9eSNBrRFEJBvgAGafUKz5m67P2Tt30EeMqn/te6VmPHjDaYyouTooLPc4ubXKCEHDiwALgtAwj8+OcgXWs6IJw2uR2ttPQTyLmoFvqh0Qc2CEhPHdUimixnVprDGyUgwjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285612; c=relaxed/simple;
	bh=WvBWK66bUCwq42aCQ9nlU7BBa6vu/7r5Ya8vu3p+z7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OxJSvZijD66AiXfGClgl/hXcJY415WU+h0RuwaZt9Z9ohyq+8k1v8LqLojZJUdD1A72i+jQsdX/N+7MfwfDi7zu4thNCmQcLH8f6U/9KxTYGVMU/SW1N8t9DWkTqUt89Ufcue9ugMP60oYabOBoDRvETaWdHqYj7aGKoI4Yu69o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UQtVioMO; arc=fail smtp.client-ip=40.107.200.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dk8TEs7y0aSbgNr5LUT4yYpIZKjY5kGyOoQppTeI4QnrzmMaOsrDr65i0VOLm+aUsPzf7QLhZJ5/QawebSvrkMKQ6Zh3mgBfe/g4EbI+Nte9nmCH+p+rSCJRbX+dtCaDCWSD5vkDiWDZ14XRMh9QZ1CTdqoNgOQGwKX3pmlB5z/nPSiou/GBlypMTmVroOPqFgsqHe/QrA2jzC9YjFm4aTTPyg+wkhOHiwZ61puJqUIab+f7+isGFX3Z5iKxUlEyRC2cBfDqWtt09royZwTtF9sYoLnfMDC0ExGhqNq7HKrLATT+DgS8C11tTDgPSu8AKU4z+N1zQ17erotDbjtnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTDlvRkC9mkvhDVpZYOLma/9B820MzPnJouaH2c22Jg=;
 b=hB64XxaltrRc1vWW3IxG++viEeGZFhs0v7gdJUH7V+rFcDmPtTfl05E4fpva0kP87mKpRwbMpX/h6QqdY9UQyFR4uFxscK6B5SFy5Y3Go5uq9natQIXRcN724MXK1slICWwXmMa23aiaS8VRkmeg96yvbx17a7Ixxi8nqNibcRJ7K3GEVu09czlD9YP/MCPGyqHfn+WM3i4SXDpKflUuA0D/PT7AF/qFoSRCG0ii9P14azmXcglZPciAXq/kuZ5SV+DrCP4ke/Ypmd0TXFKRzZjn4cSgRPLw9a+cb0JGFXBfFxrOs7otDs7GZ/KZ5xIT88uZPRKIi7GX4ZXCcRiA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=chipsnmedia.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTDlvRkC9mkvhDVpZYOLma/9B820MzPnJouaH2c22Jg=;
 b=UQtVioMOgPi0k85XnnYGoevHruHf1MWkULSYMCpOfeOqjpS0k+GNROUWT3rIw1mVQv7q3xKl10adKEYt+neYha3xCa0ySsea57dWg+wjM51R81g1rsYZvueXjO1dAcCmqY3bBitWRJnJxvMoXBmDN8ccdpqv5cf4LgkM7nFRSWk=
Received: from MN0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:208:52f::29)
 by DS7PR10MB5213.namprd10.prod.outlook.com (2603:10b6:5:3aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 17:06:46 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::ec) by MN0PR03CA0019.outlook.office365.com
 (2603:10b6:208:52f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 17:06:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 17:06:41 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 12:06:40 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 12:06:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 12:06:40 -0500
Received: from [128.247.81.76] (b-brnich.dhcp.ti.com [128.247.81.76])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NH6e2T649033;
	Mon, 23 Mar 2026 12:06:40 -0500
Message-ID: <f1b92f5b-c21c-44c0-a711-251e49b69114@ti.com>
Date: Mon, 23 Mar 2026 12:06:40 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 2/3] media: chips-media: wave5: Support CBP profile
To: jackson.lee <jackson.lee@chipsnmedia.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "Nas
 Chung" <nas.chung@chipsnmedia.com>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
 <20260319053210.90-3-jackson.lee@chipsnmedia.com>
 <5d1cf57fcfa10d224b05f6f1fe5bb33979dce750.camel@collabora.com>
 <PU4P216MB11491F8F792A075D77749805ED4CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <PU4P216MB11491F8F792A075D77749805ED4CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|DS7PR10MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: a0700f9e-6872-40d3-fac4-08de88fe8db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GHBLMF+UKQbReHQ7PLlqoLpQJ5XWDcXicLlkU29/GuhAUemhdXFklFfH44V/y9khe+VVHBibnS2snjj9Vv+TzCKstMOTMY2oGSjY/3YaI8zWq9lmh94U6zG5K1IoltXdzHnTIWblE/euH4BRHmlsdi5NaA9eo8Ay4eJYzy0nmiseDx1fLloIMQC3n0fyHuuv5I1SYi4wB7NVzIzxRdqcq4NasfA7qfP20xcRubnw44pEd0Q6ST0cOgpRp3Dt7Lf7uCGkRmCepv4oU8Br2ePKp67UIxp35LNU1yM0N4bKLa9kZTtI2kmaZ9zOvCRqBqHm3Xwq59aKYfu4SrNTX230oqjOAoFTa3HUDXYsinQXtmbE+55w4ssD+4pfOVo+C8KhFV2iuPlj/kmct5EKC1Z6IqYBFppUumN21fb7RKJyHby+EuGhhUKCOtIb83MztGf3U/KrLxUdbWvmyQSD78BhtmpnjZFmgQcfxTdWNPvh/BVM0wTwReAxIkXXv6blMFcMxFAaSAFyqUdXpGGMoLLTvlOFUKD0M0mgNKFJ+J71bR2hIC7rsjN1iLKdioqf8jwqNnl7hKq8G96dUHTlI0vJ5+HXp24QtrysVi8UdBF/xRixiXjRSOePQags2eP3ttsxFONNtOBlEo6QeWEHif1b3YWDx7tdwmFSuApCy7r/z0a0LTBkfMpCmGrUHxO3fM/5io7Mv7FbdavcUsd+XrxuseYIcv2MNUEa2SFvTBpMaDyOvr6fukiOzQXrKhyI8NX7rUTsVf8hsNgnsRDNaDLnkw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tvfF1A8QvPR1DV+7WSUWgZvpJueEvqHcyjjNZN9J/F7Q4lCMyLmMzB6FiB5y6fYYmvDwrK3qtoMZoBOMVVJoOW0a9cgu1j/WTc432WczLqttptsLM6QZLTL4AhjoNEiEVIrDdjC3CIMNKhP7eFNHzfDeHi/JYQorFWWT91uqG2PXbd4vCCdjAKdu2kSSi3oVI98Pb7hM3mVV1PLQwnOE7qipxNPloyzLvEkYd/u7GQXWMbq5avvSoeDqxgCTDL699whw+zQDs9FCVrIKLVGtN07JnGl0nrHq4geHnzLk0ni0kD5nD55NlwKTwRMk1K5kikwSkqrPpji3BGSNYyqdZA6vOyNyZb2PyeRdcWUTAZQTzfIkQQlgsGF/qQIpRShQNqC6I8AtDrGii7eKSAP7K+QxAAByuoCMggp5smnM54Y3aFDYs7TV2T21GRWA+lv3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 17:06:41.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0700f9e-6872-40d3-fac4-08de88fe8db8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5213
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56762-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[chipsnmedia.com,collabora.com,kernel.org,xs4all.nl];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,xs4all.nl];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-brnich@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3F16A2F9EE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jackson,

On 3/19/26 20:23, jackson.lee wrote:
> Hi Nicolas
> 

[...]

>> *ctrl)
>>>   		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
>>>   			inst->enc_param.profile = H264_PROFILE_BP;
>>>   			inst->bit_depth = 8;
>>> +			if (ctrl->val ==
>> V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE)
>>> +				inst->enc_param.constraint_set1_flag = 1;
>>>   			break;
>>>   		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
>>>   			inst->enc_param.profile = H264_PROFILE_MP; @@ -1214,9
>> +1216,11 @@
>>> static int wave5_set_enc_openparam(struct enc_open_param *open_param,
>>>   			open_param->wave_param.decoding_refresh_type =
>> DEC_REFRESH_TYPE_IDR;
>>>   			open_param->wave_param.intra_period =
>> input.avc_idr_period;
>>>   		}
>>> -	} else {
>>> +	} else if (inst->std == W_AVC_ENC)
>>> +		open_param->wave_param.constraint_set1_flag =
>> input.constraint_set1_flag;
>>> +	else
>>>   		open_param->wave_param.avc_idr_period = input.avc_idr_period;
>>> -	}

The above code breaks setting GOP size for the AVC case. Any reason this 
shouldn't remain just an if else where the else sets both constraint 
flag and avc period?

Best,
Brandon

>>
>> nit: Just keep the bracket, so that all branches have brackets.
>>
>> cheers,
>> Nicolas
>>
>>> +
>>>   	open_param->wave_param.entropy_coding_mode =
>> input.entropy_coding_mode;
>>>   	open_param->wave_param.lossless_enable = input.lossless_enable;
>>>   	open_param->wave_param.const_intra_pred_flag =
>>> input.const_intra_pred_flag; @@ -1687,7 +1691,7 @@ static int
>> wave5_vpu_open_enc(struct file *filp)
>>>   			  -6, 6, 1, 0);
>>>   	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
>>>   			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
>>> -			  0, 1, 1, 1);
>>> +			  0, 1, 1, 0);
>>>   	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
>>>
>> 	  V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION,
>>>   			  0, 1, 1, 0);
>>> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>>> b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>>> index dc31689e0d27..7b08fef58217 100644
>>> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>>> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
>>> @@ -570,6 +570,7 @@ struct enc_wave_param {
>>>   	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8
>> transform */
>>>   	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
>>>   	u32 forced_idr_header_enable: 1; /* enable header encoding before
>>> IDR frame */
>>> +	u32 constraint_set1_flag: 1; /* enable CBP */
>>>   	u32 bg_detection: 1; /* enable background detection */
>>>   };
>>>


