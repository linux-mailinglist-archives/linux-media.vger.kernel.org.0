Return-Path: <linux-media+bounces-57074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHFCH5b+w2lXvQQAu9opvQ
	(envelope-from <linux-media+bounces-57074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:26:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA9327E79
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 028B5327D6FB
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 15:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFE9241665;
	Wed, 25 Mar 2026 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZAEc28/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyARaTHc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809D396D0C
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451472; cv=none; b=PdJDetpaQKKQkBg4NnEyxP2bBs5JJbeQCe1xrooe3hRmkQbOUhyyP9Dl9Hm0W4LExR7tMP8YNkzsHi2v8lkdA4yOdH7/CwvSIvInb9PYZWnItlRNdwUsW8nux52RgFCoAUtK9/+QxRCi+dWfUDmzWbmZgYsIhNrY/o2XnC7+3Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451472; c=relaxed/simple;
	bh=5YXZAMuhAv9WIGptBrNb0UA7Uho52stASuF9QrHVfi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEuf3wiU7h+rRFqgE/sFO1Vp4Qenxp8s0H+b7RRvsavZvsd1B432KZgg4qMQRzYrBC4FSf0Q+f7spP+amhhRUxC4XakEWdEaZSgKdbuU+0VTxPbZtmFs1oHdh1R7G+pBsFviETeGNbQwh76b2/a39OM/dbyQOGPdtTvbaU8v2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZAEc28/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyARaTHc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGeN43091998
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/MED86hyNcrAbl5YZCxGVVNAkPNVeuRHWU9jWYdAHY=; b=MZAEc28/Fylae5kh
	ZHAzIG6me6yMJVAHJUesiD5+qJyLvYqOCqyWf58Gj4oG4Tqh5gsC951JO8BWY8NU
	mBfbiaFt7pGuJ3oiMxGPpWP6cKOaMF/FrueH+AEULVu96axtmAj/r07QSgdxHT7l
	hWlcNS/7jQLUpu7XhVManmrODFllkSo16XIRtbT4UBlC4OGVA2YYYBZW/MEkcvN+
	/bIJ4jUZqqKlryKg69TXUjVMmTn2sxPGq4wuZYyWS2tEKZXnYvPrYae2TSUFIX+2
	TD6NcoJWePs8B+rf/HRyFDSGE/hjfWvbxh3og7vvayWacCVJudhAMMSEI0ENapbm
	yVDV9Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmps3y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:11:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7422397574so45871a12.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774451470; x=1775056270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/MED86hyNcrAbl5YZCxGVVNAkPNVeuRHWU9jWYdAHY=;
        b=MyARaTHc8PbGsoukwdSug5VfDmoi8q+4lSYfzy4aKL2SXVIwF4qIdJVXu7LjdkvS8u
         8E09EnfzHpPrka1aACWQFXoZ7KEza3YewIXU2MfgyQ8lRL/7zo6XTmZ9hdyJzDUsuYBC
         pSOvMf9429wmSf5FpIbGN8ip63QY4TZ79zjHVjcKGhWpcENZA2/VR4tzXGL2CIzryd+s
         Vrh2boyKIrIMqrLtxrqk+2j/qxi8cRpx1GCDjSEKYCdv9DerKQCnBTGSILkTuZPmDOWQ
         /pQKxTp3quU9YFI0jem/giliAgXKFMznz5+8u4CQwW9GynLDZb83S+giqDJ8XKrrzrIO
         2vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451470; x=1775056270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/MED86hyNcrAbl5YZCxGVVNAkPNVeuRHWU9jWYdAHY=;
        b=qxrjGHr2jsFoA6C9EWeMI3u2sd9C+35N+DUPFAptiHvzVKrQB5hpm7I2qkUPmCIT2G
         oeCK1NzHTQpNmUIW37Ma1PGYc6tw7CSyEfyiOU5FxlB6hd3+uiI9e9m1tj5n+WAaN0f1
         R4vZjKO1xqSQf/+LQP6tBkLQ9BDINd+KbCJOlSvd4G4HtomY9RyvAhbv6RsQbO58qIra
         /S9SELKh0PNwSvXw7Kg0y4Iv6lyLL7ynl0WXnutvuGzcuD6LKMFsBpos2CevWMHm14Xw
         1iwcugVy+cRcoaUUsK+nKaSomM9bySIpRwx68C3JDSH4kFkXOqK83kwRe0LcH0vD/wtf
         99Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVGnsOQ6jR80PQ+8PGuc9z18Fn4nsXl8WzlkZ/jRX+N2cwfQx2ts54IwGUtT4R8319JTK7krrHfx2MLLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsM/nZ9APDxbQdQvad0jeJ4fyI3frwJXTF6WC+3+tTaI9n4Dxc
	GAeDPqQUTGgEL1zB5UfVOMq1flpR3AuF/5BXvVJBKRgzxBWsoyLQaEFIBMD7Hl92b8qZdRRQPHF
	hWc4IKjLqrn45KH8EgF/ox8ooh6zVMoGn+G03zc2GwxVVxN//vwMKNpTnLa96Ljj16Q==
X-Gm-Gg: ATEYQzz5nWPhgC6xF8Ngo4kfgGsaiywTzp8P1oJGj7hxUb1v65PWzC99IPtpPJznBAQ
	4SVJIhD4EPAed/z73mMsod0jGQcyIKQ7mdNM1AHIcNWGthuFvlWFInJ6baO7+vcH0NzZvipps9s
	hUs/LyRdATEqhvMdLRMJjdWc+ImYSyiKsCUNFEy9Ml9PjyBnN0tqrxIKXNyW1jfMxJ67qYeZx+Z
	gm45OHeTu0PJmfgHnuZp8N5HQu4ETGhfxQwAToWoF+B5ofGdlwFX2M8wUKQMDbVhfMepc03rpV7
	8V7BONwbakipiLonzKM3AaLKUHLpvT3e+hf6sc4NRa3L6LCug1i/ulzaNMQl5tyUW2Z3YGpLbHb
	oZlneylINmAOfWiXHE0GIM5hWc+IApu1AQlSuycUpCtlFa+zEYYwrfw==
X-Received: by 2002:a05:6a20:958f:b0:39c:1f90:284e with SMTP id adf61e73a8af0-39c4ad3a74bmr4220745637.53.1774451469556;
        Wed, 25 Mar 2026 08:11:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:958f:b0:39c:1f90:284e with SMTP id adf61e73a8af0-39c4ad3a74bmr4220627637.53.1774451468518;
        Wed, 25 Mar 2026 08:11:08 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c766e9758easm1193710a12.13.2026.03.25.08.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:11:08 -0700 (PDT)
Message-ID: <39d765f7-ae0f-4ae3-84ce-55b419ba3969@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 20:40:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
 <b4115d76-d3e0-4f0f-8ec5-697e116c6584@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <b4115d76-d3e0-4f0f-8ec5-697e116c6584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwOSBTYWx0ZWRfX5C2rOM7DxSmX
 WsKiXyInjg+eV6fx9j+iGOqdLzuwIeEJsWL9L1HvyTYdtgWxy+4tOUKyskoSW+1bOSkjMxe5ZIN
 QGy+iW0kUsEX0wc/1yHXVj+szIPhasphYFGy8fDvAMIEHwJKqWicDdinuiKMr60L59l8vNBkFls
 VNKG33+Rj8lTCrTF1poIoTXru3kaAtyvbFVLL9VlkAuUxQjkFj0b1aLyc3kSb3n/3kuGqI/8cJm
 XYa7GlBPV+eRPd2kNw1gJ9Fz7Ap0y6qX1qhKgGmObB76N9sSJ3S1Bu3HwsPTgUSJ2R/a2XFNEEE
 Mrd/8KUJfoV+jJjP592M0f+Ic3eEZrqP/UkQL6OCa2PJGV4sv3/EUXJef+NLTEsQxa68BYwP/Jj
 VENG/XnYiLV8jmN9hT+TA0nKcinC8Vpaol4N+kS17XQDJTFQQtZ4Xl9MKWPQg0rQGO7k/S3ECRO
 +gj7pidSItJ8+Rue5aw==
X-Proofpoint-GUID: 11kNxULrrVQI2o32yNh6ZRboqHh57sPF
X-Proofpoint-ORIG-GUID: 11kNxULrrVQI2o32yNh6ZRboqHh57sPF
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3fb0e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=DtSqZenC8O3uiLbdm2EA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57074-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FDA9327E79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:13 PM, Krzysztof Kozlowski wrote:
> On 13/03/2026 14:19, Vikash Garodia wrote:
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>    (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> This patch depends on
>> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
>>
>> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> If you actually implement my feedback, then you don't need to keep that
> tag. The tag was given because you were pushing your solution regardless
> of received review.
> 

Noted.

Regards,
Vikash

