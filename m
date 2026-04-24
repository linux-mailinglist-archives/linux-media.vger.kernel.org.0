Return-Path: <linux-media+bounces-59563-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAThFJDl62nNSgAAu9opvQ
	(envelope-from <linux-media+bounces-59563-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 23:50:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51D463927
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 23:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47D84301DACB
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 21:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B35E387566;
	Fri, 24 Apr 2026 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2fB2Y+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLbMwkiV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BFE336884
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 21:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777067380; cv=none; b=YM/miBES2JOAThFvK7zeGihvEQ+c0f4ZePHuddf00vVsJMwBSHOQDudz2juHxvTZsCg/nksjEnngxUws/e+6lEmOAcLPpLkb17BfNmlE7IX0uHaBMuNJeax0aGO3x1z4GgPETRrPkc3LyTKazPKylhJ1j/atoAoflBY6oVr25jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777067380; c=relaxed/simple;
	bh=+XYWczDOoPybU5e0IdPXSu9R5cSK6HrDm5LBv1YesTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5tkUtZPfHSLKl0U5/hKSJ6BYPCnMIEF1adlg4PobCiDoZrUgoQM521dnW8pFfyvx+nEkH+sV1KyrNrvuUHeux7nmMZBgf9HZ3psqHANAyB7gvLi8YTJERFMoiuLMmwPclQUArbPXZ+ZrEy5hiJaXyd429IQ37u8m+6l5B+l7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2fB2Y+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLbMwkiV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OGuttR084894
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 21:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KG4vOmtiLHVWGti4JzTme8Kd6ok3qEZubhJuWpQcuRQ=; b=b2fB2Y+BI+wSGlnm
	jYAYnVIObd/nzA4Os47v5pnAqzFIZ/T07aLHqeZAll8Q07nYw/5GAgpJYh2q1T8d
	A66pU6b8AAR7DeDL81eRdphYrvybB/w6pLyEXEfrRn1Md3WxekQevTIx48w5NTQE
	OCqFmdCVZVggzwjQoXDl7AyXGmNDLckQQ9Z7IrknrnKNdMeYYAbT3fruf3e/8LgQ
	ibc8P7dfqlnZb8bKovv8j1O9t3jHhhh27UidpMTMThHTdfyj3dFv/z1XfYGiFjBP
	rlqsQHwSEKBtcaNj/U9RdZ8q4IO9iyjo6wPXO1U+Ys4SOh8vordvcBYwJ3SRy2HL
	F7lXGA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rvwjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 21:49:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so9409101eec.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 14:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777067377; x=1777672177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KG4vOmtiLHVWGti4JzTme8Kd6ok3qEZubhJuWpQcuRQ=;
        b=PLbMwkiV45Th6W6ec5beO50E67gq0+egGxHVPostTnKgg12+EYzByG8v1fD6YEtlJU
         z2qiB998iuoTxM88e6q95ObA7HyqS4zTX+C/v406ui/dxnyI1J8TiQ/7nM1oR7XwdVQP
         1OBLYucCYN2UM25M4R4Tf7AOwDShG6dvMzWc2APtQITSspxRkMKL5rJGxAchsjMFeYCk
         +oNk0Lp/Wi8oac0U/y1uwWLMrkM9XCs83uTWYf0JhPxCqdBdS0ZTd9AojwQmPz/zH6Xg
         CIqj2vF4pl7icUoVUTphIfQGM2DruMzwrH+BXepRHbcV1r7c2gBZM/gd+gejfL/b8sr4
         3JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777067377; x=1777672177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KG4vOmtiLHVWGti4JzTme8Kd6ok3qEZubhJuWpQcuRQ=;
        b=AQhp0OXtIg+po/2dlkAm8zseQzjTdiSfmcFC86Kyc43uLfj0N9DW1ERu1K8/g3jmQj
         ISCAyYI/Ish/xj6nAoUGSVpYQFKX8t6LjIfABMrNPxhyTh9we4j0tRzC9nkfKt0lWMlY
         pGt2JtDQzq5LtI1pe2TPxnNtGTkWnzfNevKT5ZO12ikoCrpuvVC/cZiJywHzHxRPxrPi
         YZuqhgE1T320WgB/5BrVG9NZQP4ZYbRrV7GEa9IMmFXRLgfk87rv7FKkzPMzfVW9Fmv7
         gq/TT2OrEuG4fgmH2ZpbGIF+AhpWu8eIV73bZhlxvDxyLANMdGWcoBs5tglfc/T/8Kzj
         tn9Q==
X-Gm-Message-State: AOJu0YwwTtKQmo1IuJVRAgq8cofAKLx0uF6YxY8uqWtqYjh3o3tltNqv
	bzda7aIelAd1dFwdnIGwPtJK6GgThRaO/gT6EOqCpsWu8boNltIK46aIiIABJVZ7WvMe8WyoAlf
	OA/ha9lkrk4LLjsJq+eAv5pWh9BC46gARdkm1CdQon7rLJ62ooGv1Sw5KJ2AqtwnJJA==
X-Gm-Gg: AeBDietTVZJHCTH0E76N/SGn9aNOhv/cTMQQa93EWlbL/RN55A899WRZ7a9n9GLM1en
	cESA6cztLRrqTRsEl/iwjAu/lJDdPd2fGldVv3ftgsT2vbzBPQKbDhHoaf4nmS0d4O39EKHNBkx
	LVE+0e6wGzL9CTNbMnPHXYNOzF09KdyBOJO5oPTNgXjV3NU9ezsrNa59FyrGH80INJI3c9M8Wm4
	6+EDCtA7HRXoieathHP3Ud435jFTgO96qg7Yjjt6k3bgzZjiQ5irsv/T+b/EjerXIx1l+ePEEIx
	u1WskJ7uZoysPZo+9i02s6tjzoyDIgNyVlGYFwMEdw4IkglgjpC40UiFoFRipI8lDa8jtrUSbAP
	ZK/QjOx/pnZlWq4KlKDUmH0HQQY+WOeRuquoTPlP2Ljir363dXCHP+mwnxn8PFjah7vYL80C30K
	SrZ9CtkZE2hPTw
X-Received: by 2002:a05:7022:69a:b0:129:fe5:117e with SMTP id a92af1059eb24-12c73fa3c8fmr16125454c88.26.1777067376983;
        Fri, 24 Apr 2026 14:49:36 -0700 (PDT)
X-Received: by 2002:a05:7022:69a:b0:129:fe5:117e with SMTP id a92af1059eb24-12c73fa3c8fmr16125430c88.26.1777067376241;
        Fri, 24 Apr 2026 14:49:36 -0700 (PDT)
Received: from [10.62.37.228] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc81d0c73sm3673850c88.7.2026.04.24.14.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 14:49:35 -0700 (PDT)
Message-ID: <5008f174-340e-41a7-9dcf-f09495c1fcf9@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:49:34 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Fix RDI streaming for CSID
 GEN3
To: bod@kernel.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
 <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69ebe572 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=LgFBGBsrqOKMokOYI4YA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1GLH1qJb3qR9VLKjfjAS1pD4_DqDZEj0
X-Proofpoint-GUID: 1GLH1qJb3qR9VLKjfjAS1pD4_DqDZEj0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDIxMyBTYWx0ZWRfX1XBYjuN73CU0
 LGJ8CzP+21DLY5iQnSffhV3lhLewXGx/o9AZbeS9XhF2ohptACYAu7uZzWWB8qQDrCU64g04MLY
 HdET1b9ukXSfehKQxAUtAME5W3xzpbkA00x+OzZYaLDrk1ZZsrXDDdxCiwDYxOtUZlxUIcCY5MH
 PW1q7Ehr3pWerjh0x14bubr1O95T269VrWmlnLx04qSQttP8PYq6FLgvLryftugD+nJotr9XeQR
 J2DMb7PSP/Snce0Z2PzFfoYnb2ORPh8OgDuF+qdHndCvzk4iLDJy0CuTGhJmmOEypAE6ax+7KfU
 OJZWOD6AVizvM8nQiKjy+EcdIJ2nBpNKLh85s9kI+Df+5CCp/U4ml84SjN56+603iS1zZSuPzg3
 Ftri57zeWinSPPVJryKv7MBqt2IwQRsPmmN8uTmLO8cwPzN/qsMxZhlzh6SlwAgSm/jAMMxwoTa
 m0xcmtUqpYSYf943YFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240213
X-Rspamd-Queue-Id: 9E51D463927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59563-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


Hi Bryan,

On 4/7/2026 3:34 AM, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern we
> have replicated throughout CAMSS where we use the VC number to populate
> both the VC fields and port fields of the CSID means that in practice only
> VC = 0 on CSIDn:RDI0 to VFEn:RDI0 works.
> 
> Fix that for CSID gen3 by separating VC and port. Fix to VC zero as a
> bugfix we will look to properly populate the VC field with follow on
> patches later.
> 
> Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../media/platform/qcom/camss/camss-csid-gen3.c    | 28 +++++++++++-----------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index bd059243790ed..ed5c5766efd36 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -145,12 +145,12 @@ static void __csid_configure_wrapper(struct csid_device *csid)
>   	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
>   }
>   
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>   {
>   	u32 val;
>   	u8 lane_cnt = csid->phy.lane_cnt;
>   	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
> -	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>   	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>   								   csid->res->formats->nformats,
>   								   input_format->code);
> @@ -163,14 +163,14 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	 * the four least significant bits of the five bit VC
>   	 * bitfield to generate an internal CID value.
>   	 *
> -	 * CSID_RDI_CFG0(vc)
> +	 * CSID_RDI_CFG0(port)
>   	 * DT_ID : 28:27
>   	 * VC    : 26:22
>   	 * DT    : 21:16
>   	 *
>   	 * CID   : VC 3:0 << 2 | DT_ID 1:0
>   	 */
> -	u8 dt_id = vc & 0x03;
> +	u8 dt_id = port & 0x03;
Sorry if I was late, I think this is wrong. DT_ID is more to shrink the 
data type of a stream from the sensor into 2 bits so that the number of 
configurations to be maintained in the CSID are less, the way the HW 
logic was on previous architectures. Now, the older SW logic of deriving 
it from VC itself was wrong and making it port based that doesn't have 
anything at all to the DT_ID or CID is making it worse. Do you want to 
just maintain the older logic here?
>   
>   	val = RDI_CFG0_TIMESTAMP_EN;
>   	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
> @@ -180,7 +180,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	val |= format->data_type << RDI_CFG0_DT;
>   	val |= dt_id << RDI_CFG0_DT_ID;
>   
> -	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
>   
>   	val = RDI_CFG1_PACKING_FORMAT_MIPI;
>   	val |= RDI_CFG1_PIX_STORE;
> @@ -189,22 +189,22 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	val |= RDI_CFG1_CROP_H_EN;
>   	val |= RDI_CFG1_CROP_V_EN;
>   
> -	writel(val, csid->base + CSID_RDI_CFG1(vc));
> +	writel(val, csid->base + CSID_RDI_CFG1(port));
>   
>   	val = 0;
> -	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
>   
>   	val = 1;
> -	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
>   
>   	val = 0;
> -	writel(val, csid->base + CSID_RDI_CTRL(vc));
> +	writel(val, csid->base + CSID_RDI_CTRL(port));
>   
> -	val = readl(csid->base + CSID_RDI_CFG0(vc));
> +	val = readl(csid->base + CSID_RDI_CFG0(port));
>   
>   	if (enable)
>   		val |= RDI_CFG0_EN;
> -	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
>   }
>   
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -213,11 +213,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   
>   	__csid_configure_wrapper(csid);
>   
> -	/* Loop through all enabled VCs and configure stream for each */
> +	/* Loop through all enabled ports and configure a stream for each */
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>   		if (csid->phy.en_vc & BIT(i)) {
> -			__csid_configure_rdi_stream(csid, enable, i);
> -			__csid_configure_rx(csid, &csid->phy, i);
> +			__csid_configure_rdi_stream(csid, enable, i, 0);
> +			__csid_configure_rx(csid, &csid->phy, 0);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   }
> 
Thanks,
Vijay.

