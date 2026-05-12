Return-Path: <linux-media+bounces-61303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE7GBKtXA2rf5AEAu9opvQ
	(envelope-from <linux-media+bounces-61303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:39:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC1524E14
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F13F330BA9E2
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77623CF96D;
	Tue, 12 May 2026 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjHXFo90";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NT8IR3ik"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24CC3E1717
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 16:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603598; cv=none; b=bj4Iqr3vsAwz1KjZNoRBxYOybF6V1CzD7v5SiH2OvbfTEPPwJWVyhTl/IW41NGzvCizONABrlHbiJg950WC4iefmE/3iKaYafeBye35zWECM8BCk9p1EtDxCSNhs2WNa8imnoXDk1hC7BQGeMZOhUANFK79es2pcZRyGe5kcKu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603598; c=relaxed/simple;
	bh=Yp6nAARU9XVSCEW05u32veLAh1I8fS5I6LuP49o/pzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJSl0R4Vv0aap96a9LxfGnrt886Gr8OyvH50RQ35R7nHXCoDcoaNXIT0rHSwrpIu4iAGOMclt+y30MhcAPpz471drEYxHyeSyz7wTQLDVab8blj0OKe5fWvrwM5YqnUNOjVXguG5Iba8zIn/vaCcW428A8D3H6KVGjcJMHkPluQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjHXFo90; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NT8IR3ik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CGGCVj740775
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 16:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDi9TZpO57ClLA954huq+FpLjiBkLO/JKvZoyMx0Gf8=; b=TjHXFo90hOmuUfvo
	uebrvy+7+aIhf6Gf1A7o4iDm6HWiSV8WU4570Ng3W5PoBmNGOjVCvMXttcS9qxPc
	CoiYeORqvjDjwgXDurPSOy46/r5VpiOTvxvAw6LZfGOt0+6zMKbqQp9naDekptr4
	hPNVWtMzOVTF1zW25ArW0ylL8rPPoVEKmXMgkYuaeyfyuibiVfFP8Rjx1f8LxXHe
	B0VnDeEnv116unw/Jmi5wjpWIbBAt0Rd8JO0Qb+YtFGTU+/IC8IXn3kYabcdVnqf
	V+wknhhW31sAyI17VrfI6pJby+jezjI9mHJSXcx8uqCArjsgtDBdWyt2i7OO2+Ez
	v3kiog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhsea9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 16:33:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso6824268a91.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 09:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778603595; x=1779208395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YDi9TZpO57ClLA954huq+FpLjiBkLO/JKvZoyMx0Gf8=;
        b=NT8IR3ikUtisZOAsvmEU1jVhQyJ5IMgERJRFab/SXheO3TCENn/bwMQ/WTERtcol2Z
         EKONnlbhem/IbNbmjZojjfIRv0Je5ciQU3yLW6HSI+fBf+z5wrd9gHFSPAVuvSy0ozhO
         r67hNfz9NlFW5RjsYuhf2+eDDuRxqp0vMM/UkGxwr46c04xnKWl+OYALqt13T0/NFajT
         AVOl0d0sxRm0EiOT9WbluniSTCFDVaSYVk7ezX3/4sQXrFKiGRMTYe2G4hlzAXwYhu48
         1dSu5aoYNQSVd+gezUTdf6VJBQNGWpQQC47eWeDPCgBtih3hlAYd0PXtFS8o4Qmd33xy
         5Jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603595; x=1779208395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDi9TZpO57ClLA954huq+FpLjiBkLO/JKvZoyMx0Gf8=;
        b=Lv7ZfoG83LWi39g+W0zyR7fNPR1Nbej5KHD16mODW419WYKEzYWuo4iqNXpY1zhD0X
         606/MUL8hOHKrufqVm4wPb4kziZgaZ4Z0pnt2eg7prYuoQWJ7cm5JZUIJ4kolXtgzcFW
         xcFVRKCyYxCw4Omq9B8dVcSpofjsKYe1sgsj7DrDktNWQDgVQZ5xsPJggFW6aSPiJwZ6
         9v3cwzbi/yFszeYekPRylnBMBJ6Q+cFpYx0pPju9vupEYkF2DQbfyC/bEF+UZGh4jFI7
         mVCqzHZwpJsnXkvRak+lEAyJdXFtgu7qghze3wSqrrLPLLQKH1YfNRPJbMa2fAofZgKI
         49ng==
X-Gm-Message-State: AOJu0YxQCXkmJp6Qjchzukxsm5GZSYwr2XJLvHTBiXD6k/JCIGSf1DjA
	aDI/B3tIYQU//eUA/Bn+gaWpgBJNivKNyvYnvh6sYqlgSj/YiSUtDzqfOdTT7GKolG+Q3u+aIVR
	aSioqyuNr1COPtRJ0XWMn93SkDOXdRaCKQqi+8fOGZEriBrairsqnES/MYIjCaxdTAw==
X-Gm-Gg: Acq92OEWPVTm8oaseyo3PeOqOwck9R8Wz4UipazU1qag/PYOGIhyvCa3s2J+GLV0249
	0fi+8JuWBv+eEEdeYP1m7FmBuKGJTX2+dgHhCVdAi8KJtj+JynrGl5zd4LveTGT1hXjlPRNzR1Q
	ItW/ouxPIvHtxgorjCcbCtJbdoZfn3ceV+FzIwNScR8v39WCOJdWCWqYVE/7jsQpsVFMipUP2tY
	2Bfga7KkXxqRJiHiPkkJRV1cBgVt1B3i/hFyMK8ezt8AbkShdcpZix2rQNsT9TDVbHidswIrGDX
	ysnGJKI7vlxw8aXmjDwCs5RMLjucJuZPAhh4PCtBamLDm8rXdRRGb92Hh0CeP3dK7W1yj9PJBwS
	Ife3IkgBTmi9TD6Ft9JfrTMp/JRT8QIgDQSULa1ATjDANia6iOacwUmEw
X-Received: by 2002:a17:90b:4b08:b0:35f:c6bf:2bba with SMTP id 98e67ed59e1d1-368abb24d2amr4657775a91.11.1778603594552;
        Tue, 12 May 2026 09:33:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:35f:c6bf:2bba with SMTP id 98e67ed59e1d1-368abb24d2amr4657747a91.11.1778603594090;
        Tue, 12 May 2026 09:33:14 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ede2074esm347739a91.1.2026.05.12.09.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 09:33:13 -0700 (PDT)
Message-ID: <63f1a17a-3502-47fc-ad6a-9694e76367d1@oss.qualcomm.com>
Date: Tue, 12 May 2026 22:03:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
 <20260512-kodiak-gen2-support-v4-v5-2-a98968423d24@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260512-kodiak-gen2-support-v4-v5-2-a98968423d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3MiBTYWx0ZWRfX4NjhfPCpqodp
 NXeZsiASHobfANlYDnGdne//mQcYW/OhjUfmWYvBPrSAHrwWFzDFkSfEUIxm8Kv+MbZ1IyGV6El
 HCWWxF8rvSOvj1Ya9vWFFZtzEU0aXI7kQ8/20QLhS8oTeGvthIt40V5D/gjd5CzH+ul59X1r3EV
 WbrMbc/aeReikHp8ihEE2Yk9CwVaJGGsvvQCI1A0tu2uRkL2h1Lj6nR/a0aspbQH0HrUdLjySWn
 5xTE2E+wxPZYVpGKK4rbh8S2MPcqbiwVvI75CiKu851zkkVfjbQpV121+Ta94tbCz6VedWRE2Kb
 uhtuLkqydE4penqN7Ou3opo9Jmp411nIN/SbuTiVoMA9dCTi6f4F1jGbmW8tvI3rq6/i4DZeBBA
 7FnBGjg+kmeOc6rLDdQUp57S8VofA3b0JCEMVH6NipLVJ9tPbkRcMH4T/sr26TFlsd6qdhu9ELy
 7zVEuoIkFXECAh8TJtQ==
X-Proofpoint-GUID: ESk6zFSUjSIl63NZQQk8VfAmJhH7v1dE
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a03564b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=o+V+sR5qrBln4ZYy4JV1aQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0mKQKuFm7qoxaEEgN30A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ESk6zFSUjSIl63NZQQk8VfAmJhH7v1dE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120172
X-Rspamd-Queue-Id: 89EC1524E14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61303-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/12/2026 8:51 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>     descriptor when present and attempt to load the corresponding
>     firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>     descriptor is available, retry with the Gen1 firmware image.
> 
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the driver detects the
> firmware generation at runtime before authentication by inspecting
> the firmware data. The firmware is classified as Gen2 if the
> QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
> 
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
> 
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Co-developed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
>   6 files changed, 105 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 1a476146d758..64a2170bf538 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -16,20 +16,95 @@
>   
>   #define MAX_FIRMWARE_NAME_SIZE	128
>   
> -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +/* Detect Gen2 firmware by scanning the blob for:
> + *   QC_IMAGE_VERSION_STRING=<version>
> + * and then checking:
> + *   - version starts with "vfw", OR
> + *   - version matches "video-firmware.N.M" with N >= 2
> + */
> +
> +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> +{
> +	const char *marker = "QC_IMAGE_VERSION_STRING=";
> +	const size_t mlen = strlen(marker);
> +	int major = 0, minor = 0;
> +	char version_buf[64];
> +	size_t max;
> +
> +	max = (size > mlen) ? size - mlen : 0;
> +	for (size_t i = 0; i < max; i++) {

check for comment in previous version.

Regards,
Vikash

