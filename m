Return-Path: <linux-media+bounces-53654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFzpNYUtoWk/qwQAu9opvQ
	(envelope-from <linux-media+bounces-53654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:37:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 410341B2ED5
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60AF331096BA
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 05:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCA03DA7C7;
	Fri, 27 Feb 2026 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSW3wCi6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLRLET7B"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8587389470
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170473; cv=none; b=Dl2EE4asRejZjwR90irbTQ978FIWImP4/0D2zbbewl5382tOBW7MuNCfaWBqYdk62VxwmgepiXAlD1uPmxKTApoNQStVTRX8QXcClrJOivtUR5K7NdKw24gGj0VDfoezh+4o5W/XZF62H/dG8DUPHBNwMKwjM89WGuR/O8VfrQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170473; c=relaxed/simple;
	bh=T0icPvT3kPixrTJc9Y43LyRFOzvLFzRfhhehpihRACQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duhkgGhdfPCo4fCO88gBTX81e3gMNkdyo5PJwKYSFMrsZ+tpI4yv0QEQWF6bynjCqO0wY+raIeT96OizAqNq2RbHWXimWvdVdrYe7viN1VBe/vMCoNJrNhslakyfeltegqRh+jLuGqqPTuMWoMA41GACmi3p3oHXgjbXPp4TgYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSW3wCi6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLRLET7B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K56B3185561
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5TIO3fSGKjj2aR6ScBoOO/Xpvzu2mHHwm+1mDH8hzs=; b=MSW3wCi6SSMP734y
	KuhxzFh7Pf6Lg9Y+Q0RPnxoy5Z3jtJYZChb0baWGUqR4JGQ91MeTSpb8cotMJcwN
	gqadiLgvLct87iWxKfFa5A9WafqfwnHBgdo0kVYFpc/0VMTwzzi4q5ZTOCFLmgO4
	GF2oWrO5/91baWZ1gj25v/R5gQX+12loFRKFGEJVTDzof2QUrbWieiscwKlsMhtW
	7f/J4d7ktrg988eNVwuEgsouKX45ReLUvdROMrkVTdx2XDE+BhCU1jlDNXOI6Cvv
	sw1TFCdnVMNIq8ySvXlFtmDC4t/aJpQoqIzFC73HwwOrdJXHrC8gMD0XX0FU0L1B
	ajqsBA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjmp63dxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:34:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899c3239a28so330257966d6.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 21:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170471; x=1772775271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q5TIO3fSGKjj2aR6ScBoOO/Xpvzu2mHHwm+1mDH8hzs=;
        b=BLRLET7BxYUacjfZvw+ukv3sWfguNkHR+ebq81RGteyg7+e6/WE7F+30z+fA7NFaNc
         h/X5J0wKnaES3xYPA6WIhJBPBRpyQX9/quysFihH9zNLEF3Gv1GLNsTNeTwVz4SF/Z9G
         EsWFtZgKUMOuCyWK9BlRwjbradeuzl64dOImJTDKNbXAAB4alzQ794s8Y0k/jP/q3u3i
         Wht53ILE4UFddb1Gv3mSUjR4YFz2AVXBopdFV5ReN/dXAAxMyNTMkbNCUdTh/+syz4W1
         D1r2Nf7fywJW4Ro+LkF75W2SLw7CbFR5B7oJDeiRALZB+bq+QOQwgyMmDV9So/wa5hFA
         vJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170471; x=1772775271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5TIO3fSGKjj2aR6ScBoOO/Xpvzu2mHHwm+1mDH8hzs=;
        b=VSc4QKp8+Wq8zDLYtRR8xkYW9k9zIIadnzUFi2lzl5rl+l6V94sWSQwtD70MFacJM6
         rcvIjp47WDnYJyl5nPOQvwqdNCqaEUUHpAfZ/D3MADMAqR9prcU2ekThybfIWSWMVnwy
         fwhbVxeIb4qIk7uZLQBjdZm+1QO4hN8Pxvfud0OypBmpz55pFeqPrutITH3k6LcuQ8v9
         yK5JYhTz0Zk2wLU7ZnKz7BQlvJToE/Fe5Itm2W7YisoGDOvz3oIDtsirvxhi7CGQiDF0
         vC/Pa3fgmQ1eTcQFVod8/veIayZGDYSNEeWDsRgOFPGtMMRA29WBY4PJBUfKCdV1z8zC
         kOWw==
X-Gm-Message-State: AOJu0YzSy8d3IafjDpmfAS5451FsJiP3usuv0D40E02ytIxFE5VRewln
	N87v79TuAlHALWigS6cCUbF+aOzAx9i6awV/Ofs+XgFdzKTz+lETOLoGTBdAkiS42Ez9f5exSIf
	nCTt0dXKyhULHPL+62ns0+8abMORdRn/xTrqliGbYIVF9MOPj+ib6l8EmT3ObfRWFJw==
X-Gm-Gg: ATEYQzwJgcfwvxwZk0QownUlp9039VyvTGbSih6jMKaZKB3jhmIL5wZ+wTSB37z4nnc
	iaYPw5XY1zXjzRTy1INYVcGQiDQt45WyEl8q3F4N/tuZDmUepY4XDtwxJOoReb1JoTFlXLlovZC
	MGGVNzgEhnBWmFvrsNnXGzK41o1hbZTBF/xZA5AVJ6BkVTQgUvvusGJUAXqjir4whsybtXNw/g0
	QnnQzLPSspyu3boQVQcPyMFtX7hy8no3wmS6vcPIDSoxlvZlKhrPcnhbgJMIp3SCeSCY4i3VBhK
	KU2sillMbgI5qcMOhf4VbBhvoLtAJup8lg+u4P+ss3NS/pBml38xymIXia2IPZx2O8PklwJcYYf
	llbkY4qf8gYMPLdcZ3m8afCqff6OiNjuSsqx273yVI/gwbICUvjK8bZBvZ4eBHQiJayDYi3aRYx
	LXAasEyBeoDw==
X-Received: by 2002:a05:6214:19eb:b0:896:fb75:d982 with SMTP id 6a1803df08f44-899d1dc464fmr27022076d6.22.1772170470809;
        Thu, 26 Feb 2026 21:34:30 -0800 (PST)
X-Received: by 2002:a05:6214:19eb:b0:896:fb75:d982 with SMTP id 6a1803df08f44-899d1dc464fmr27021936d6.22.1772170470391;
        Thu, 26 Feb 2026 21:34:30 -0800 (PST)
Received: from [10.111.169.142] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c716c53dsm34430476d6.13.2026.02.26.21.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 21:34:29 -0800 (PST)
Message-ID: <9e52af03-772b-4ec2-8834-7f2007efcf78@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:34:25 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] media: i2c: imx412: power on timing adjust
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-imx412-v7-0-e58303f2b76b@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260123-imx412-v7-0-e58303f2b76b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PvPz5SNMJUWdNAlCoCVR9wLs_alEVe16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0NCBTYWx0ZWRfX9Wa7tokriy33
 29fuK51fFTtsiObcFQg7TRG7GAHlel/G0gpM4XeWC7wXvUhLh9OJA9yEg4v1J3QM8cKPUuTeoL3
 LzC1T7Jp0Ohkw4KhjKR9s2qKdWJEqAV6BCMbqd52kdrVp7KKOYC2vyXNcoWC2yQunQMLgsoDuRz
 Dn0kEQ39XgYx6KuwvP74smbXpJ923hKAKlmEtC6PPDs3XciNy79dphMFUgEtJ/QUZqOkNBiD0XW
 zGoe1QfldoYbOcEi0YuBpDXV8N68RQn7bYsP1Ys/7q6oULq886Tejbb4MPOPZiD7YqTOu6ZQgdK
 WBFPrXBtPNLUS5xQ8xWPeJ8DpymKolrcT1IsRrTBgkQzZ69uNCR50bBOAmppNoXbF0owMuSJ6I0
 dmfG989QJGr2JBh+6V36GhgvnwbRz8SVgCoUCg54a79zH2eEqwko3p3yYbO8V96cnVNI5liLqtu
 KmrQD7A/e7Ogpj6dtGQ==
X-Authority-Analysis: v=2.4 cv=daaNHHXe c=1 sm=1 tr=0 ts=69a12ce7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=39SGFpbFQ5yaoE8DcZ4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: PvPz5SNMJUWdNAlCoCVR9wLs_alEVe16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53654-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 410341B2ED5
X-Rspamd-Action: no action



On 1/23/2026 5:19 PM, Wenmeng Liu wrote:
> This series of patches mainly addresses two issues:
> 1. Fix potential timing issues that may occur during the first and second power on.
> If the reset GPIO happens to default to the deasserted state at the very
> first power-up, the previous sequence could let the sensor run before
> supplies/clock are fully stable, while subsequent power cycles would
> differ because the driver explicitly toggles reset. This results in
> inconsistent power on sequences between the first and later power on.
> 
> 2. The Arducam IMX577 sensor requires a longer reset time.
> 
> Changes in v7:
> - Add vendor details to the comments. -- Sakari
> - Link to v6: https://lore.kernel.org/r/20260122-imx412-v6-0-2c0b54594c2a@oss.qualcomm.com
> 
> Changes in v6:
> - Added comments for the modifications. -- Sakari
> - Link to v5: https://lore.kernel.org/r/20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com
> 
> Changes in v5:
> - Assert reset GPIO in imx412_parse_hw_config. -- Tarang
> - Link to v4: https://lore.kernel.org/r/20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com
> 
> Changes in v4:
> - Add assert reset in probe. -- Sakari
> - Link to v3: https://lore.kernel.org/r/20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com
> 
> Changes in v3:
> - Fix power on timing. -- Bryan.
> - Add reset delay time for Arducam Imx577.
> - Link to v2: https://lore.kernel.org/all/20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com/
> 
> Changes in v2:
> - Move the 7.4–8 ms delay before mode-register programming to satisfy T7 (NVM read).
> - Link to v1: https://lore.kernel.org/all/20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com/
> 
> ---
> Wenmeng Liu (2):
>        media: i2c: imx412: Assert reset GPIO during probe
>        media: i2c: imx412: Extend the power-on waiting time
> 
>   drivers/media/i2c/imx412.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260119-imx412-d6710b9fd3c6
> 
> Best regards,

Gentle reminder.

Thanks,
Wenmeng

