Return-Path: <linux-media+bounces-54045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EElBjM9pWm36gUAu9opvQ
	(envelope-from <linux-media+bounces-54045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:33:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEA1D3FA0
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A35B3039331
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 07:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD635383C89;
	Mon,  2 Mar 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vt7nhzNJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsyLSl2P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E2A34C806
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436688; cv=none; b=ERlFre9vC0n5Tp2+m1K/7XN705mn+ThGwrekdl/u2Ge8ZolMiHGSJtI7vbsrHWFpV8j9ZXvcO1QS1vLrraMSPhUOWomTBDp84SskLQfDTvx6rqlg5vzRdRdknmf0k+WUGPndqrjTEzA21QG49QAwrRLgWLBC6rqy4CH/fW6eBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436688; c=relaxed/simple;
	bh=O2VTGVdvg3lhFxxaKosfdcYYaZPGYCa8FpdgjEoOdeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTtALI15eUG6fcTDU6y9Uhg8Vk9GYWOhmZo16IjOJ/cIzwzOsSfYdo7Y4Y/KB/HWsA/f8o3ScrCrbNPUTFbdMFdJHFaJFqIKWNLRwBkR8VvI6OJjX26lELQWVnvkBuFzK6B+5GMAaeXjcRHgZ2GIGADSSyQro97FTlk2GgPmVNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vt7nhzNJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsyLSl2P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226h9IT2504590
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 07:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3nSpYdfjHnrXojouJgG/12wwvJoPG3PAC/dtHuCsgo=; b=Vt7nhzNJpJQQKVQ6
	ZGum+4xp8jEdoPcpTk7WkMuO40crJ/yFITKmiWOu/8b6BLVLfUJD/TRaxa03q3sF
	5+fNS/8e1jOtEkkQlMm5NVFf1w7Uc8K6sev+1rL5GJpMkivHbxLqlYKT8Ls++D0P
	gSagKPvww+aPkeCk/tkqShD3HUiO4Hy7O+PSeXH4TswHhNS5pX+p5Jj1dgwk9Bu8
	xIv64o14cBqsHUAl8R/1mu+7MAXQrc7GD64akcwQWd8LwPhhhuIsSN+ll/j9bVdG
	e87pbRd4MekDUBQ1Qqbl7yGP3AS1RVseTvMdHbpznorpFx6RI2xT0Rcb59ID6BCh
	/WZP8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5her4cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 07:31:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4a6bb316so11243495ad.1
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 23:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772436685; x=1773041485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3nSpYdfjHnrXojouJgG/12wwvJoPG3PAC/dtHuCsgo=;
        b=CsyLSl2PoTYCY59QTrfTqxlYLGEBdTzs5zhUqkZUmp5Q0ZoahnbVRNT3u6vNNOaMx3
         QVRq2a4eROq7IVqEAuUDT2VBIAfNTytR9pt2w9YYqSrIwH6GJh8LrOcuUW03CTRvdrZN
         p/BmEqp4rXRZ9gKXL69KztkjmtdJrvtgN171rcL5DUa6G8Ec53hxUQiaFlPQWcka7oIm
         CbSid1Lm0hTKesAgiCpvNp4dLnSkmtgJSskGDXLqwb4gjpRa7/HTyfmoDFXj2mGfLXSk
         +xrgdtbewit4D8qHjyx0IObdma9pxY4d4b8QySnUAiUGQANpC431pjUh+MlE13f3Nq2W
         otDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772436685; x=1773041485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3nSpYdfjHnrXojouJgG/12wwvJoPG3PAC/dtHuCsgo=;
        b=bQDo33l/5NVGqgk7LruuvM+d+zIQ7WCVY53eRL61krKj1FuUXAbdfuqQrCPsr5R3qy
         YM3gujjKDIr5fHSTXjsOhdjwotNVEBNUfJqg59Wvp+bs5Nm4inrp0x6r4pY3PzeaBDk6
         e1pE+UM5+JtxyQ/9Alpyjg0Q9mjmIhTjHVlh1wvXsfkrFAbBbJsrasQfaLcYxAfENL+X
         MaNmxr91pXnZ6Kt2ttg8mPr0iqiTvINeP3P85amp60M9iMbnccN4PbAjzA/UgA4ph9cC
         LaAMPqhj6uTAzbWDW5c9/OOB5/FkhRlwr9Ar0acnc3SKm4jC+GPTxX4wFiCkRGeusgjF
         rHXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRjtlDw6T057yrg1D6EPkjHSJ4EZVDdv+AdWYO2Ga1Tml8oSXDDhgxJqWhs0RsPIBRQmFh3Diu6Cly6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqz2ugLE5kfgueVivm+81jHS27b2tFjokeBzpqOBTeymbhCBxK
	M4xmvYB0V9rchWFkpw1zILlu6F8u6hZxfl0gFEzSJMUrLaNKp8TmGhLuiVIh6oY/Z3GwsEMLw04
	TlKl2lU3YJ07pvLdjmXMVNntws3vQCX6VdQ0qLvCGgUGHbEAmD5r/DhpdOTA9ojkULg==
X-Gm-Gg: ATEYQzzEYlh2w2wM9lBdA+IBGeKeoFKpJtgh+uRE2KqtlTZGb6PJ0oTWSCkdL4q9UrK
	7EhWgHy2t+75i8BtcYJpmv9Uf/+LiJatF90a9TY3r8K8dceh2MDk9Z+JkXrpS7Yh294rPwaO7Uj
	XH63EnbfhYg5SWdo6u1QlHz1FYBHri5gnWAAkrRsL1xT3sRhEFEhU6/kbLW3S87AbdQJhuh8sFX
	IaRQfscyvS6rtoVajO3mpURd3tIJSO6pnbmj3/jXxmFkUC2DIYOXwa08hVeEBH+GmZUQ6V4Ed5p
	7iLQN+nazifs8S96lroQWIriimzaXivSeQ0luxs6l0VdQUeMyWMSQkIGbbI3U69pZnp9LtMGAHh
	yJpzT7izRs7wv9K/SWAJX2sQc3yF7rwJJiHZqYc9FlY3xf0huOuiwDQ==
X-Received: by 2002:a17:902:f68d:b0:2a7:757b:35a1 with SMTP id d9443c01a7336-2ae2e4b2457mr136702705ad.38.1772436684660;
        Sun, 01 Mar 2026 23:31:24 -0800 (PST)
X-Received: by 2002:a17:902:f68d:b0:2a7:757b:35a1 with SMTP id d9443c01a7336-2ae2e4b2457mr136702165ad.38.1772436683906;
        Sun, 01 Mar 2026 23:31:23 -0800 (PST)
Received: from [192.168.0.172] ([49.205.253.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae399acba4sm66235775ad.67.2026.03.01.23.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 23:31:23 -0800 (PST)
Message-ID: <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:01:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: allow interlaced video streams
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
 <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a53ccd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=WNU4mP0iZEZjDg176sUGxg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pgx13x3EImjs4AM0mqgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0J_EHIiqr_Opxa6uleTW4wRzK5IdQR8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA2NSBTYWx0ZWRfX6tzx4CtnD5fp
 gVSIZ2I6Xug0IaRhu2WKa5Ucor+U0p2325qfaMkWYFvXfg0IE/vt5E39QF8TfLuSUeqDeCnr93w
 tqcHO4jO/7mj+AM1kRWUJ2SnPQbeiSNYrJUjVVOP2MGj/BaHLuIpLR7dT/ASYy3a1f4BRPxuvd2
 NknUEaGRpxf3FQYRKwqlWKOCAX3ly08gs6mryaLAsuNAX0uDOim+6v1rAvveVRN9YKWMSgadBpy
 6B9xJmFGbsFSnuqOGgyas1v2fm9LNUpwn6lc8HrJwIyMMNZDow2MlosQzfViVg1qnCThuPJqNSI
 KDPnKeylwIEpX6YMpnU6r211drOk7kAQrdFPj9GqZbY1yxFgCyQbuPcU6q3+qLHV6jnvZAuktG8
 o9UaHt34awtEeKHNczrjq+ussdE7cgQNnkugD0v4ysdvZW2qoMfaaEhgYLmMr7SMOk9u5OA0MkH
 x0QEMuItqOzZGG/v3zw==
X-Proofpoint-ORIG-GUID: 0J_EHIiqr_Opxa6uleTW4wRzK5IdQR8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-54045-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,venus-mpeg2.md:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2DEA1D3FA0
X-Rspamd-Action: no action


On 3/1/2026 4:05 AM, Dmitry Baryshkov wrote:
> On Sat, Feb 28, 2026 at 09:54:20PM +0100, Piotr Oniszczuk wrote:
>>
>>
>>> Wiadomość napisana przez Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> w dniu 28 lut 2026, o godz. 10:49:
>>>
>>> Venus driver errors out on the interlaced streams with the 'field isn't
>>> supported' error message, which e.g. prevents decoding of the MPEG2
>>> video streams. Don't error out if the buffer is set to contain
>>> interlaced data.
>>>
>>> Tested with the fluster enabled to handle MPEG2 through Gstreamer:
>>>
>>> ./fluster.py r -d GStreamer-MPEG2_VIDEO-V4L2-Gst1.0 -s -so venus-mpeg2.md -j 1
>>>
>>> GLOBAL SUMMARY
>>> |TOTALS|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
>>> |-|-|
>>> |TOTAL|30/52|
>>> |TOTAL TIME|75.526s|
>>> |-|-|
>>> |Profile|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
>>> |MAIN|26/32|
>>> |PROFILE_4_2_2|0/9|
>>> |SIMPLE|4/11|
>>> |-|-|
>>>
>>> Fixes: 059790467bf4 ("media: venus: helpers: handle correctly vbuf field")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> drivers/media/platform/qcom/venus/helpers.c | 5 -----
>>> 1 file changed, 5 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
>>> index 747c388fe25f..71e79093a4c7 100644
>>> --- a/drivers/media/platform/qcom/venus/helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>>> @@ -1466,11 +1466,6 @@ int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb)
>>> if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
>>> if (vbuf->field == V4L2_FIELD_ANY)
>>> vbuf->field = V4L2_FIELD_NONE;
>>> - if (vbuf->field != V4L2_FIELD_NONE) {
>>> - dev_err(inst->core->dev, "%s field isn't supported\n",
>>> - __func__);
>>> - return -EINVAL;
>>> - }
>>> }
>>>
>>> if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>>>
>>> ---
>>> base-commit: 779cae956c8316aebc1946ef86ca001f99658270
>>> change-id: 20260228-venus-mpeg2-495f9187a1ec
>>>
>>> Best regards,
>>> -- 
>>> With best wishes
>>> Dmitry
>>>
>>>
>>
>>
>> Dmitry,
>> I applied this on 6.19.4 mainline and give run with interlaced content (hd tv) on qcs6490 (radxa dragon sbc).
>> Playback fails like this: https://gist.github.com/warpme/a368983678af0a76af85314808773076
>> pls see a bootom kernel output showing venus failure.
>> my sw stack plays ok on e.g rpi4 stateful v4l2m2m so i think root cause isn't in my userspace....
>> pls let me know if anything extra is required to fix venus decoder issue.
>> br
> 
> 
> Interesting. So, most likely, H.264 decoder can't cope with it and we
> need to allow non-NONE fields only for MPEG2. Let's see if Vikash will
> have any other ideas.
> 

Venus should already support h264 interlace.

Piotr, do you see the same failure without this patch ?

Regards,
Vikash

