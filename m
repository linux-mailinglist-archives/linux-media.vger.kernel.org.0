Return-Path: <linux-media+bounces-54058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GnQJ3tOpWkE8gUAu9opvQ
	(envelope-from <linux-media+bounces-54058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:46:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 060FD1D4D7B
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82B6E302C5E9
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 08:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A2A385536;
	Mon,  2 Mar 2026 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6FZQn/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQr73Kov"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00430AD15
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441017; cv=none; b=nwDhYwnPxrFIVvwe8j2cQK3lZo6986ytIibZHmuHF+7zntKfhBpDajUMzPB+12KEmkgdmmS/T3oYNe2ZhkHo0vfqYaGwkb1YoxcfoQd9IDlNMOcDmLJ+kIqo1JZhdxMpE0j1yhrzAdmtxAMs3OKZaRHcvRXUKLjFjfJVqwpYrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441017; c=relaxed/simple;
	bh=/xZ2osG6NIrmnyZ+TWhCavfR/+FAn/7RvAjDCbyOXRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuawwFCSSdWOxEqQQO5fJxkHmToHweo453s4UkRKxJDMUi0YIaFEaXL+WSq8F8MeT1Ci51FyetR+IZ8fva6q+VATRYxYWLS2tOzPp7XRNP6bMOhUEowgpDjxIhTbhEyqOlhn2Ezl9w+UTHrMyFXKHID/H96lYtdls1uSApSxZ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6FZQn/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQr73Kov; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228HE6S3223927
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 08:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzhcGz9kiSv/N4brhbDMgmBjGdF9z8YyVnAXdkdzS5I=; b=E6FZQn/V+eAhBHn0
	8tH6CLUWeLzRwHKNoHRBXFhESTg8oppg4/shnlBIJSpK+UUNYJAXzfZDV/Xew3cn
	gxxUjFZDbR2tQM7WKMRb0DQ5YsZ3IetF4VzbhlOYem8u3zzwysF/7B3IB19HrAPK
	ws+FiOiFDsF3Q4K/mpYNHAUf9JkNiPHXP10RACAUFmWye2LgYHeVX3Mh9FGZbirm
	TplyKHUGAQNGq1kLz6AXSsZlDeaY4QjdkdTLnyTxJmMydlc93l7LSXqvo22pHurH
	V54k0ahuW39O9Ba6kfFlEUEaoRsTlOo7SQD+XQZAKeOlFk6xUqJo0+N5OEtXWA0p
	1mENwQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1hbda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 08:43:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae57228f64so3985595ad.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 00:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772441015; x=1773045815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzhcGz9kiSv/N4brhbDMgmBjGdF9z8YyVnAXdkdzS5I=;
        b=SQr73KovA7fHWoQANAgttk3PDCptr59qoNUu6qCfuHZNIIyWDWAmO2dLuD4UBNUMp9
         YgCQm0YLpHjA3ThD/gv3ZF8UOfe7i0hdHaGcZ7a8GYXdhOBZY8ETI/KPpOtPXckgMQnJ
         nuxXiZcl6G1XRaRQLV2TVIEp4b6MBnVwaqnqg3efXfhYvMtiB8XfaFBx4Spfl+erxfwd
         1DqqyKjq9G8wYHsI+tgfh3b72y3HVfb4EhyJayBecaaf+l7I5FhyC+LeiVnMhgIJmT0j
         Tbv75qJ3WOw5J0YNmskK3st4keUiEVVoj7iyijsoEuqsMVSULPMftOE6Sqc2Xc+vJSKR
         QYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441015; x=1773045815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzhcGz9kiSv/N4brhbDMgmBjGdF9z8YyVnAXdkdzS5I=;
        b=LGSwK0uPf1LwuEfdlXjYUZktTQW0sM8/eRNAHqkyEnEEg0el3rTI7UaubB1GpgEoO+
         oXjXc8q5h4d+CwHxPBRvBUMl+ioanISHnGLWreS+gWuOm7A2uAnok08LzyNULLScqlP2
         eYnsi+AxHZLwbFg1RSq969ZYrb1Yj8cSv+hJ8Y3yh9WMNFMqnUoDY1NtUi7VMVGUq8Tf
         4CIEUZNPHs74BitIMzKyuBrGIpNZOVNZE9N7TFZhkbYrbVp53OX3FrLs6v2QR/byWvto
         ay3/3wTeKfuIASxvSewmqsiUEjABdNtk3YedFVcDsD8WO3E0QueUkIOejsX5QurjXpe5
         /YzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtNqpB17wnOep8TzHxp/XbfZNFwpsMZ3+gYzqGa9DRAXDc4rK4ApoFEPe0DZqVS3MKd8ewF3zCpUTMDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg1X0RcD+6mwfHMkcf0/EF1LB0UduSQSLrQKnIpfuncYzuaElv
	ly/fQuZQPbyFIrFyl3rBOsIybcREBQ4h3uKAm/n277xXJGvcLcHXU5vzjOXJl1N6RN+NZ6ZnXEN
	4/Ks+pBmdYTXuS4B7xZAUy2Rx+w8MmZ4EeJhKRlVYSM15TQj7laQWcwPtaX5ntRnqKw==
X-Gm-Gg: ATEYQzykcKB7nPACxdgDL868IusA/5WWTUFxnpgzKZ2Qstg5f39cOjdeMu+v/VIjL0a
	ctui3/WVGgKrsFjjzsLyGpYqOkweqVRrDlEgOxmtMNjGnmJfhNSjENXkQdALck5tE6GQuc+vUg1
	yO1rkuJ0VPc4UALkvUbXuv/0WhnO8qYzS+tS2P7JGDbcyOY3tw1sokW6797KVhWyZKJ8FmqGPGa
	IuXOAdS6M6eHK19U4oQLn+COYg0qAAWrm0AEsbD2m4tcQaAFj7bRtmoJwnkmCTc+WsbYQrNcT5U
	9BdTKTH2/QenP3KKOvX9f6l3QEydApNZRftyjcGen4eiCZHo6G4UpjiuMM9YgvNc66v2jIPbPHt
	oc1tyNRp8lnfdUan7aDDflewttAs5cv7Y4VJZ4LfCJOP8sXFkzw==
X-Received: by 2002:a17:903:2352:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2ae4a4e1f37mr39247855ad.25.1772441015340;
        Mon, 02 Mar 2026 00:43:35 -0800 (PST)
X-Received: by 2002:a17:903:2352:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2ae4a4e1f37mr39247665ad.25.1772441014848;
        Mon, 02 Mar 2026 00:43:34 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5276097asm23725485ad.34.2026.03.02.00.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:43:34 -0800 (PST)
Message-ID: <9eb6d9a3-268b-4dee-9fab-ec59322e8a3b@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:13:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <cac08f2f-73b0-4629-898a-1e24840910fd@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cac08f2f-73b0-4629-898a-1e24840910fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HjaK4PCu-H4PPY_2hN6bAbAKGPisCeEw
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a54db8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=AnEmtbbmQWdTvrL9bUcA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: HjaK4PCu-H4PPY_2hN6bAbAKGPisCeEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NiBTYWx0ZWRfX+3cSDIqsG1gl
 YS0sSpfMZ+4+NSMR6Nxg3lG+b7o7iQqpv+1JUq3gshxBWDZwr0l7iZpe+bQxofhUs8LeVIF5/Io
 VhcwS3GWX/MO2nrgplNuaF6esdglFRetruKA8w/auGBHFXhzBL+8r+AFN/HtyyJfZlzjnPT7hBI
 +ZFRE/4XDhLQ8w9IsDpNKsf9tZN9ufV4akn2dV47MbZ15eRUlrY63uH3Cz0pipTqczh1ImlWxyW
 J4eDhbda9huOgRSFV270Xf/YoYIcCapPKrmIF0UG+KlqWAqBEDY1kWq2FRdNR4+6Itjz+OCf2zB
 CMn6hHv6ixeRoAOs5p5zX6mH18s576KCKwfBQDRJ4DHqErOM2uFns8iBGslf1w2CKxN2T2bozhR
 pPjtk6EjzQXvrmouPUxhbuk2B+oKzGAZO5te85IlRUIy5fOIT0bOcDVXhiOp/JDPI/zNuU4tS5P
 WQ7fq11e2EQGjOExOfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54058-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 060FD1D4D7B
X-Rspamd-Action: no action



On 2/24/2026 9:09 AM, Trilok Soni wrote:
> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
>> * Userspace Interface: While the driver provides a new DRM-based UAPI,
>>   the underlying FastRPC protocol and DSP firmware interface remain
>>   compatible. This ensures that DSP firmware and libraries continue to
>>   work without modification.
>
> This is not very clear and it is not explained properly in the 1st patch
> where you document this driver. It doesn't talk about how older
> UAPI based application will still work without any change
> or recompilation. I prefer the same old binary to work w/ the new
> DRM based interface without any changes (I don't know how that will be possible)
> OR if recompilation + linking is needed then you need to provide the wrapper library.
I'll add more details for this based on the discussion for compat driver.
>
> ---Trilok Soni


