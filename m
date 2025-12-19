Return-Path: <linux-media+bounces-49191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A052CD0736
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56B5D30BFD64
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E444C338F54;
	Fri, 19 Dec 2025 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrT7uXZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EU6N1hQn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9532573C
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766156717; cv=none; b=PVFzbCH5TJ6yEWN2c6zgt3BrlaberSlzMXLy8Ul1q1rokocCftjlHIrPUaBguuL3nv6gHZMGW8up6O3atpkK+Q/Rg3UK9jVb2P5j90wZwOu4jabjSerdmeAVc/oQvSiEhxsoMnQNF9h0PKIbhf5TLzFFL+sjiivJ/qmBEIpv0L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766156717; c=relaxed/simple;
	bh=JzQT/NtUVd2ORVFQ2U/bDKhVUcQjuET+Od9RvZC5XGA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PBi24b57Sb+NofuFV5uQ+ebOCeNRnHw3cWZLaBdKP7MLnBqGJu4jHni1E+QZoeFnzYItZi4tnhT4cahiaa8mRzuf0DZrLl+5zi5Fpzvh8d8cagG7VG4SKyYuiOiSD3rUUflx6/Pxk6EXHyX4l7nLoAhfD3kc/05SDwNN/QyDo34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JrT7uXZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EU6N1hQn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBJcnJ091309
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyPkgDMn/MnopwxbaLBNTvT5oHT9fKr6kLbD6Kdh7D0=; b=JrT7uXZx4Sr8OVYg
	eWEKi3F0dXYVb/FM7RKP1cijKxQ/iHvfnNKrDAO+4P4qycDiAIBD6vLR5qmeFmQg
	plcMLXDAx5/qwymq62xJ6OyMiLFDesXrKpInYFM9r3SZfUgUwRyxYpGHxZ9whTIk
	7uu70kDZg/XGDqYF7gvGzs+42lfV+tD2cMnXTFX2KZ9K54OcPlJUBkF+RJtaVtcQ
	z0qqXLTaAREWVTrIsfUmzlVu0imv2sINoufegd0S3kp0jDHCQj0l8CkYADtyeHCp
	WgJPUdTZSBnapW2+EYtywxewU/75mllWPZNQBUUfNXs7UKF9Z4aZJk5pTSLqG6Yk
	vz7Jjg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eb1u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:05:14 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-65d004d4e48so2870702eaf.3
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766156714; x=1766761514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyPkgDMn/MnopwxbaLBNTvT5oHT9fKr6kLbD6Kdh7D0=;
        b=EU6N1hQnpX4iiUr1v/bPeqboQ2h4BUGSQhx0z3JEa9+nxx1lmVwsMj1PE4bJYpaVgo
         +B9Dihja3HmXmjBOgEKmhvItNRqCx+Jr1j51o9TmfdnGXn5b+skkzf5A89d5KLczywuh
         tUjbzrwpwG/LiZDXdV12RsWOMxcYeYEmnnMpR/3YPmWNNnFHRRmYmNujYqbtTu8w2kmP
         Z37zVsRDu6bNtUtMuOAKh19En0+ursOruzfB0iAJEmHIxN60LV3MrFvJlIwvoBuwVudq
         SrSsoKeCJN0KFDhjeDK5pWDKHXL9pXGtbTvGtC5bw47jj23yCQuqGr1d0ZtyWSrru1d5
         +TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156714; x=1766761514;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyPkgDMn/MnopwxbaLBNTvT5oHT9fKr6kLbD6Kdh7D0=;
        b=NUDQg14/H5lbXwCykGFi4rsxxxcQySYKOCP7osTCUgIMGsXq4g9F7W5FdtRpTZ+k5v
         C8Wj987Qw/7z5xCHsoAxgaWDLRGkxkk7oMYqOgKa9YWAZatbsTyxrdUND+rf23iOTEVO
         va2SUSGRqL8g/g+MvN2oNhdOx1WZySUbV663wr5PzafROdrGnatNDCYBvxRfUgtNSEBQ
         Kgw0dJmMUoVHU3MA6gA5L2P5ZuQq1kwKtWGR+aJrB1Q5w69NLHdEfxIPNMk6Cj9U8vZ/
         Dd9LinNKm/+x+/42+ztxgYOvucPlxzA1UVN1d41Ijs1qBRsETQSDLmAcGx1A0xnFHK5C
         VaFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4T+hl/S+uDOLbPiemiH8FEa1X5UTlZvI0AApjz14If8HLbb50seks/TDQdymgHElHysmNDJGO1YibGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOMAfazG0iWBFsWKWpefHp3HNUw6Zq0azFondDmnP31kOTFyi
	/pIjAsx3bmLCyGVemtiRNBGdb9JXy1SO7la17BsSZNcrf0EZAR1Qx0fYoWkmih+i5QjHnmR7l6/
	XCuZeHjh5d7a7NwCyEuaMtYg49Y28hfrA7H5KmiSNsKb4JudaxDd7a9GTJDcexcgkzQ==
X-Gm-Gg: AY/fxX4Krl69jUGNGZ8cYCHpyqJnUk45yG+BfY1MOrbW0oH/f6rcrpOMubGEvKpsKRv
	TV9UeMrLrXSRpbb5Q0RZ9gpKpQuMlAplx+ib3Oy0FQOW4zN2yJ4gkjWsgO4Z8Bz/rYbyL/0x7RZ
	PBsnAFxD4VAFI0mVf52DFt4MEX1FtATjIHvciTWA8ZiZLd3NNVX7aRVjtaEvHAb6VQN6cqXnyCP
	iIsdLDfVQuH0EvT4Y0KhQjbRlWmiB6wVR0m1fkYzg7pjH65XsBTBJpmKMat4bZGPRIj8mGENr75
	lYJgFUiJF/eM8CD8f/2Vx4CH+dHE753WpTJqVRT4Wt0aDpotK9/aeD0ryyNl9Or1e8F2oeICGMY
	6MAm2akeUtdXAA659pIYC3GXt/FXbptYTE08BicCKmPT11XEbxKrjJWhznJf5Q3vwVyAiojj5Rs
	zDxGwC3JDdxP/b2uI9dCY2JGCg6nOovJ1O3+B6BynmQQ4+/+enVOKg62mI93lcaOmO/GlQwKB5g
	sCg
X-Received: by 2002:a05:6820:16a7:b0:65d:a21:d1ee with SMTP id 006d021491bc7-65d0ea5b641mr1457090eaf.23.1766156713782;
        Fri, 19 Dec 2025 07:05:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1gRQg9YXoN7VVxE423HZMBksLPSR7QBgFUhic0mQqygRzSXkJPLsd8xwEFkYJsS1XCMv3gA==
X-Received: by 2002:a05:6820:16a7:b0:65d:a21:d1ee with SMTP id 006d021491bc7-65d0ea5b641mr1457052eaf.23.1766156713371;
        Fri, 19 Dec 2025 07:05:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a4eesm2341064a12.24.2025.12.19.07.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 07:05:11 -0800 (PST)
Message-ID: <7d04ba37-b505-4207-95c3-b0ffb0736ea4@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 16:05:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 1/1] software node: Also support referencing non-constant
 software nodes
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        linux-acpi@vger.kernel.org, Kenneth Crudup <kenny@panix.com>,
        linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <af773b82-bef2-4209-baaf-526d4661b7fc@panix.com>
 <20251219083638.2454138-1-sakari.ailus@linux.intel.com>
 <erf3c6r46lscxeqj3iqc24rkzpuuwrdhob7isva523pxtxtoy4@45gxuhkdbubx>
Content-Language: en-US, nl
In-Reply-To: <erf3c6r46lscxeqj3iqc24rkzpuuwrdhob7isva523pxtxtoy4@45gxuhkdbubx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNiBTYWx0ZWRfXwduISQaUMEly
 EJvU8UWR90XjRjB2RX/7g5lwgXrmXkVXQiKcuVnqjzF3hesZ2lWA0VJ3zdQYhBnhr6L+0vi+FKg
 1Myba2g9q9mDexCKWX6iJCLqUOkcbzsaX1aiYTt69PqelT+Gb1jQYIIA3X8LAXGvNnoJUdlZF+i
 TUh0KlBGJ3zT9q9aOFaXooFWP3ytYKD/INv8TjX5G8LSzBHKOtt3NeQmvoSTdE2h/cgInR02cEV
 q8ZcnAPczjuMR3FUZNSkYITS5wdkP6nY+vR85YG0uJJF1eM6Fg1hVBpD+BIY4oUrnDJduOcVCIN
 HtguzwQbYEt0dw283R+pgG/xj0zeKvUPRaSyZ3PfWaBJGRW/Tzv7WOW7p2dTZxPxxNBquaR+GZh
 JX5xds370WQ3nTBBfYv9emDKHbeZ4WbE4vegvWOGowm5wDMe0oiigxq8VKHQQBKqflzY4QC2hiS
 Tcq+fT0wAm0zrcH/MLg==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=694569aa cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=FVsJegLj7527lu8xIQwA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: XVyH6UrIf4785An5CUV4ZMYze3huoz6f
X-Proofpoint-GUID: XVyH6UrIf4785An5CUV4ZMYze3huoz6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190126

Hi,

On 19-Dec-25 14:13, Mehdi Djait wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Dec 19, 2025 at 10:36:38AM +0200, Sakari Ailus wrote:
>> Fwnode references are be implemented differently if referenced node is a
>> software node. _Generic() is used to differentiate between the two cases
>> but only const software nodes were present in the selection. Also add
>> non-const software nodes.
>>
> 
> it works for me.
> 
> Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

Sakari, thank you for fixing this.

Since this fixes a 6.19 regression: Can someone please submit
a pull-request with "[GIT FIXES for v6.19]" pull-request to
Hans + Mauro with this patch?

Regards,

Hans



