Return-Path: <linux-media+bounces-51211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNDnJNCocGnwYwAAu9opvQ
	(envelope-from <linux-media+bounces-51211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:22:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A395523A
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CBDD06258D6
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1BD47D936;
	Wed, 21 Jan 2026 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Odxfm8QU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VntBvj6z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB79E2571A5
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990046; cv=none; b=PSvn2LVlBzC4Byn/AbSDeX0fjBN5QGkHgKqlYh0a54uQNZYXEDgihqX8tFO61YvuJYOogM1w+fueU/1m4P9RM7jJB+asdS3bNq8o7xG7Bohrmk7QXfRGj4I6pqg8KoAGkBqVmcOcJKf8f1gVpDbVwuuuA0piT9WFvMSF5h9f47k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990046; c=relaxed/simple;
	bh=23+zNn1ThhaVaKkICfjII3uM6JaMNdj+v/wZrqZRoUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIzcVKDMGhebWuN73/ktZzksuzNrp8DcxSQIU+e61oDddmjcXiNrbBlz8l2WNXGAi8pM2eAhlL5qrVV4M5BpWeQNqWHdU1rEqoKob5C9E+m2oBznJnAg750aarJihvjXG/cdQLaL/Iw9uL2fb3fLTJzD6/angtfXOhseUzuQJGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Odxfm8QU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VntBvj6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9hdkF824271
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 10:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0Dni6xDAJ1UJmJHWK3BeD5fTRHGT/UjK8PpKIn4U+Y=; b=Odxfm8QUEusVElOW
	dExcc8HGx2dxVxELJQskVvKrSFY+4ccR2tb4mvtOQ+L63WWpcS/oFWIEu42TI2eF
	RKj0My0G0szC1vwBK7jE26OuIWc/urPTX0ZLDWIGpM2dFAxy4Dbt2mp66j8jCMfu
	yOxFlaBVAMzKq4w0tEF8UEysmOMjZhu3R1c4jp2RqFhv29v10nCgwak+QkslDTYY
	eJH1TrolqWPQTY2u5huLVnyvXgE44jwvI3owyqCFmKqBm5+oWrxrWwg655HHrxy+
	Yv9T8QGVnd1wnv4Eczd/EQtUqrY28ar0KAwbYj0DoqInrZHGuTyh0NJs3pUOz4yH
	Kdyp1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e3ehx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 10:07:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946198b977so33054486d6.0
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 02:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990042; x=1769594842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0Dni6xDAJ1UJmJHWK3BeD5fTRHGT/UjK8PpKIn4U+Y=;
        b=VntBvj6zvOB3sGgvZytoQibovZZBscodF4MAaHzgHrQKD/DaoueGguxzhCnXq98+/d
         w4qu2dNDNwbsRy+ucfaLIu7me2HJOaS1eUfSgJslwjtsTw+Adk+xlezwqWqWJrfXISuT
         FuEcYwqhy4gWLeGoTZwHDHznG+O66tWMC2JvSVfup4cMuXvZOjtVS9nyaSXJWU4bcjy5
         G8IeUCopbkftZnSwtOOt8cVdF3wjYpRGEya7z+oJRQQT/B1EATvZ7R8njbunG+B2uXML
         tz8vP+FeQwSIoN4EATh3ySsHonwq/qGjUf1xir3FIp82tl9nnCpOsVlaZ1NlrgvmIFhm
         WdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990042; x=1769594842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0Dni6xDAJ1UJmJHWK3BeD5fTRHGT/UjK8PpKIn4U+Y=;
        b=vR1tOWjfP6GRK7+qhVLfO6Z8fL+7l95qq6mca+H36ABlL0sAiG9kF+Ryi7rcw5pMer
         g3Ls4PXEGaNQXVOnYbYFYGddXk1UQQKbSDMWQHO7D/vZuFwZNAe1qnfFJQOpxERVnLxi
         Rn/A7TTUuHK3BICrRSbSmHDzR2vts1CWuE17A8iumP+NAIpkzE92FzUc3086lhWJ3iw3
         mT607Bp5w2yAbmnKDlRHCaFwJ5c+K9qmaD6bdkJ8wtyZhO68RlkKaiToefsOMFrArI+U
         /5FKpdQTbRTd3xeb9W3OdBaD8l6ISDkZsh3EGtJbdOD31pAHqOlyIqF32qIfRDhkwJZi
         icyA==
X-Forwarded-Encrypted: i=1; AJvYcCWfD8dYmZxYkE8EtGGi4FxjzIS7U3EQg+BAN9+VyWDXk4Is3J1ZXm+pCuEW9Fd7QM880iVd+XI9YKFxOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3XfvoP0Ikfb7dAw0jyLHDqLYj4tffk/4YF5Nz+atdL3QrN/ow
	ENzfypRYkIBsNfw13vzbpiZIG1HYkL4Sp+TbGv0KK5c9tYJATX6pZNQWUu+OOEww7JCz2nNDyTX
	x+HOGY0ud/jd07wKe/WFL8Az0Mev8dR8n+vhLE5QWgl1Im9wtbQhw69MnxeISLZkU8dUkLrbdNF
	Yk
X-Gm-Gg: AZuq6aJtn6wM295QIzeUK2/JAfWd3Y/NxNLys4zxShKtmTZ0cKBITMdumTajkUQDoFW
	gRcV53lcspfi92YiPRm1xVJzb3SxElng7Rz2/P//+S7s7pc62ntZBcWAfo9hMxrAyKYT/2jUyEt
	X8H3u3Hrk9Owh0Xys6qyN4SxlWjEqp6Z5YVGlanZgyRcjdNUXfdsSt3SXMYttVyp65XgTt2J6Ik
	0lPSnIL5xDCLaK8HrrMhw7uRg1Lp57B4o1MGJWCFygyCP1kQY2L01wcw9McEXF2ac2pMQYMwvHv
	WMnveaaCHWIZKlP9zYwWIPYAG65TSYcEhVj0xgitke7U8lY8Id+OWFxbA+nupVOOG5p6U7cuppp
	iPZdzuZUbmpNEUV+crR6mIVKIKpA8y80ToblBThAaln9eK3UXB15mXuO01EjAIfxtkyYvt7zh
X-Received: by 2002:a05:6214:240e:b0:894:6ec3:b6fd with SMTP id 6a1803df08f44-8946ec3bb0emr40311696d6.31.1768990042445;
        Wed, 21 Jan 2026 02:07:22 -0800 (PST)
X-Received: by 2002:a05:6214:240e:b0:894:6ec3:b6fd with SMTP id 6a1803df08f44-8946ec3bb0emr40311506d6.31.1768990041795;
        Wed, 21 Jan 2026 02:07:21 -0800 (PST)
Received: from [10.111.169.82] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d6e6e0sm116665961cf.5.2026.01.21.02.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:07:21 -0800 (PST)
Message-ID: <96a8dec5-b984-4a9a-b3ae-93e062a8c81e@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:07:15 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] media: i2c: imx412: Extend the power-on waiting
 time
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com>
 <20260121-imx412-v5-2-be67654a4afe@oss.qualcomm.com>
 <aXCiTU_hTsBkSJdA@kekkonen.localdomain>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aXCiTU_hTsBkSJdA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970a55b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bWESSC9KhrgeG3RmmaMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: C_aWVxGaGX1caPMzgI0wVN0qWQm9mNQM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NCBTYWx0ZWRfX+d6gb2YOZj2B
 YRClK81irgaBKpnrSQv1rbdNQzohNv5Nu/fHVvyPpX6syey3esAsZLElsUElsBYRM3cTX7ELHb/
 Awa/hu+7JZK2H9ft+Mh7uEjoNc6fCvmW7Jn/k0FhrNkx27QDK+y4CimSkYxMvLf3GyHyr5dmCyA
 jjDsSeejo+10hAp2AZ3OzgkMA65tsNh7nKzDMQsLZnmzo7UUIGVhQFZ0OvG67iNyUiXmmRF/Y0l
 9AAQlt8g80JNCpAHumJV3NsTu4i69ggz5EoG4FIZ7yaIVVUj0EuoZD2OSoeXwUL+TUsG5eDf0gf
 UjIza0UOBFCR6bDjLud2YeEkPuDgDyXxTgb/FB8+sLFHUK311ah3eykmYCx/1vD9C7aRIuKPIIu
 7dHhlvLFHJUdO0FhYprjWBm11J8c524b63bYEEBgvFr4CUbJaXsswCsLQWOknNg5OFohBsw1Xle
 90DGtr5JyS/OgqThbGg==
X-Proofpoint-GUID: C_aWVxGaGX1caPMzgI0wVN0qWQm9mNQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210084
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51211-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25A395523A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari.

On 1/21/2026 5:54 PM, Sakari Ailus wrote:
> Hi Wenmeng,
> 
> On Wed, Jan 21, 2026 at 05:12:15PM +0800, Wenmeng Liu wrote:
>> The Arducam IMX577 module requires a longer reset time than the 1000µs
>> configured in the current driver. Increase the wait time after power-on
>> to ensure proper initialization.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/imx412.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
>> index aa63dfc349181bf9c180ffd566b0317d05b410c1..b1c201b4c7d008aa70ac84205e4de119e776047b 100644
>> --- a/drivers/media/i2c/imx412.c
>> +++ b/drivers/media/i2c/imx412.c
>> @@ -1037,7 +1037,7 @@ static int imx412_power_on(struct device *dev)
>>   		goto error_reset;
>>   	}
>>   
> 
> Could you please add the comment why this was being done? It's not enough
> to have this in the commit message.
Sure, will do.

Thanks,
Wenmeng


