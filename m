Return-Path: <linux-media+bounces-54080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFQQDYBspWk4AgYAu9opvQ
	(envelope-from <linux-media+bounces-54080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:54:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A35641D6F33
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EDEA306907E
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 10:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B7E35A3B9;
	Mon,  2 Mar 2026 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5RwGYNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUgrFNn4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7E359A6F
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448671; cv=none; b=s9Kico/Eb+dFkGgUz6Nl9094xQpPIxIRKtYufQqqswExZx1Rqqy/11eqjniyBOd9FNT8qSc9Z9cQJfWwzPjXN7lhUo1xyKRmwQ7N+1PyeubjyBYzJG+hvvrqUPtrx9Fs40Gdx/0RmJBKSnmL7mV1sCRmnTafwzlQNLeErCo9DiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448671; c=relaxed/simple;
	bh=Xan2sp5Unx0bPGsDuyVyevUS9wrfj0OnwMIJ+imtTNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5hK94KJXaX+JOOvIuqn6uKZjHxnYNB9bm2Xz/zbMptcxhW2D632ygVTKoqPZtfjcFNKqwRPuz4iCvYehtHnYUtAIQkezEUF/6yL+00JGqFWMgY7/Prn/W8m5xvm0m8M+nHZ8X4jwaPGp3UsGoKF63kN8DVve220HNQdwz2nxqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5RwGYNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUgrFNn4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294kpI1291359
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 10:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TW5XzJ8Z2CHrEQieBmz8WS7yy3jLI1DuwaSqa7l9+DU=; b=n5RwGYNBhbdExBN+
	TYTASXyAkIjViFgEs3eYEhh0hR/gVBFp9C0jFq+ZDAnuz9fybfRH9cQ4itqsrelJ
	X1PXqYKINF0lpTR6qUxAAIKWzkgVTxuX43BKOkT5j0uDYZBZh8FnifwIYipor19J
	yxMjcB4YaGRjo6a3pClduyc+7LRWhafrmf/mFUg04u8XlEQ891MfZB35/iCRX0pR
	HLFu2yT6CDAGAxtyrIWQ4txC9FMzX3XPW5XrS2UaSSVKmx0OhOCm+r02Q1Hg0tpT
	v7OjlZ+X34Hv2Vs4r9ygEd5T30pQHMJw6iyehYA8+IEoB6+TSWi7DzX0EPH84dl5
	rtU07A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku0ch4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 10:51:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3597b55adebso1175576a91.2
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 02:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448668; x=1773053468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TW5XzJ8Z2CHrEQieBmz8WS7yy3jLI1DuwaSqa7l9+DU=;
        b=gUgrFNn4l2Y4Rr6N4gqRro4J/QMh5pOsn99GnT185aQGqlMxxllMvzU3SwZ7HBbZle
         o3pGJ0Wr3oTQiInCo6aWhamdvIIELgxavJiueJfZNZTPmyKaF2KQUZWRne6tv4zhva8W
         /OlO/uLqh5xFwAxTE+23d3mE4//CJMZqOzjwlWujuYDDi0mSX0ZuLP99XiqRHZyPVnot
         WjsPjxr+vc9BZ/WmOSz8w1pRTuoTwXE4IliVOk3NecBDpvO3MZ0CS4YLNFT/NL6MzVcR
         A2RO1coLpMZI4U3cUB4L3mO9XatBIhgPgmdukmEQ9MnYaao56f7FSaFJZCndQ+eAXVwN
         btlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448668; x=1773053468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TW5XzJ8Z2CHrEQieBmz8WS7yy3jLI1DuwaSqa7l9+DU=;
        b=jiuqqK8LQDer+RzHGZTWNEmJtzE5np6YUBluLGOEZHfqRAN/jVJvDks6ySULrPvzC7
         83RGxQAY4xyrm/HCkHpWZIU77wwKxvvMhoTKuP7T+9S15psoHDar4JnujYpJVguvi3IH
         TrwVTVdIHfRDJA0fFoSK9RZDTesYkhG8U95eVeY02QYXTvlVfm6JugY1drdjUJ7ajwGR
         KiCg6zhBq9OqN7XtsoP3oBzfBC9af7T1XRp0oQ+EzyvutkAObwZkswl0k/CsYvJqQs00
         DZT/Pxdw8cm+tT6lT/TAqX7FTNXvak24pgrb01EJCqT/tm5wScpqq9RoFpxN3Rxw8Uiw
         ZEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUELKOW0qGDxyznwWW7vK1QCIt1hO+FSDQy6Mn7jNOEDzfbSD83rCiGsr1WA2pdUNFIJr25hviXE9smKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNSxb8u6DgqGt9/EkOZLghNpV4oIz+pnMHbcEgi1VHFFR4oj/M
	wV3F7GRwLsyQvU70YyGV6onB0/gbrlJQEj/GKi76zflQsKLeIcfX8C56ShUXiiyh3VP+MNfWXAD
	mxa6xZK6/tATEw/6Qnh78NoZwTOsdk9yv2N64/ntqxc4WtEEPpY0SlXk1ohaM+HMZDQ==
X-Gm-Gg: ATEYQzwYmtw9ohAn/RWrOe/ouIxR6dBGA9CwnFjTJzXHg9LeNxr4Mqnim1lP15wUpoW
	2ll7lszBLU6TkMNLfqE82m9xSIQYrpQv243/WgTV8+pmFGP4wlvYecTs/g60IvrfDVudt94PhjL
	xjxKAqjS8FEgQ/8LxBRPStwA4oxtK4cmvQ3f+r+sDlQi+IPxDIpwKCn1mHGie7z2BuZKMdwHsYj
	Bh8gyVI+u7iFNQzIrYY5MAc11PlJQ2uJboZ2TXyrU4OXhUUSOswobqMIgzvRCWaO+BBIxH8UqxH
	5655VzkAebeotjDf8a3l//cTGIgZgjd0vTD/xi0t4eBrmR+YpYPkOYSfGUE88Unj6m5y00cSHgM
	WyQjxKhycHZffszfG6OhruUZRo8NVoL7Xlly9y8K/hwote7MCBT38Mw==
X-Received: by 2002:a17:90a:fc4d:b0:359:1821:b4d5 with SMTP id 98e67ed59e1d1-35965c386e3mr8793223a91.5.1772448667644;
        Mon, 02 Mar 2026 02:51:07 -0800 (PST)
X-Received: by 2002:a17:90a:fc4d:b0:359:1821:b4d5 with SMTP id 98e67ed59e1d1-35965c386e3mr8793204a91.5.1772448667161;
        Mon, 02 Mar 2026 02:51:07 -0800 (PST)
Received: from [10.0.0.3] ([106.222.233.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a03fbsm183069735ad.43.2026.03.02.02.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:51:06 -0800 (PST)
Message-ID: <f9938ff4-2ef6-8ea0-dc31-19e532b08ebd@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:21:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: fix QCOM_MDT_LOADER dependency
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260205145623.1360105-1-arnd@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260205145623.1360105-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a56b9c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Rcr8AszoUWCL+GUTnXSVkw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=beQPn6Kv1YGn9YLEiWQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: jLDSamvWl1JpjaDa4rtEPD2K87oJ972T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX9Qs8Hvw629vu
 dr2vT3u0r2eX5Tzt7cNOLsc4ZTYlZM+hVQIdqurATohBruRRRDVMhYLNquyYLxRPPwwAY+AIjT4
 4/iGscsO7+IJcYqUp7jB8KPmGeoZcFvU0STuTvXCi9TIJlL9vetJwZiGsyT/eRfxFHPcI1TP298
 jwjRswC/xGPodb3qzZ3cE4N4JYtkB4xVyTEKukevdiCJOGGiSZ4WB5rdIVucPYhD4x1Yq4svjOw
 cHZQepJgY1GS78Sbsa0u4o4pWTTBcT4HUGVqg25LpAbEL1CmhkqK0bgrNd8ZR9sariGesXlWxrP
 JbA4z9ZwZ/45Q7jIzL5o+ESR73K0vW2yXA7m4K87jleeiuKuPHuQMn+BEvjITGtUFGJ4rgRblzM
 FxDLz+Uat5En06iq1gZiuCDBi+zit60wixA1CrSj4KXALI0FM5dKespdAUtICiDeAC+ruLX+PZW
 kTcOfePC2n7Q0W5Akyg==
X-Proofpoint-ORIG-GUID: jLDSamvWl1JpjaDa4rtEPD2K87oJ972T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54080-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A35641D6F33
X-Rspamd-Action: no action



On 2/5/2026 8:26 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_IRIS=y,
> the kernel fails to link:
> 
> x86_64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.o: in function `iris_fw_load':
> iris_firmware.c:(.text+0xb0): undefined reference to `qcom_mdt_get_size'
> iris_firmware.c:(.text+0xfd): undefined reference to `qcom_mdt_load'
> 
> The problem is the conditional 'select' statement. Change this to
> make the driver built-in here regardless of CONFIG_ARCH_QCOM.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/qcom/iris/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..5498f48362d1 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -3,7 +3,7 @@ config VIDEO_QCOM_IRIS
>          depends on VIDEO_DEV
>          depends on ARCH_QCOM || COMPILE_TEST
>          select V4L2_MEM2MEM_DEV
> -        select QCOM_MDT_LOADER if ARCH_QCOM
> +        select QCOM_MDT_LOADER
>          select QCOM_SCM
>          select VIDEOBUF2_DMA_CONTIG
>          help


Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

