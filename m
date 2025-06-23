Return-Path: <linux-media+bounces-35634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1256CAE403A
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 573CB162E55
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE42242D97;
	Mon, 23 Jun 2025 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsBm47k4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2F1F560B
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681501; cv=none; b=pzmsSZ+LrUM39PAF5auQa6N1k/xyLe3kmysEoSxxEdFC3b2NXPbF+aIDqbAGBbaDv9WjfW3/xRyAg664jPWUrP5TJuWEoFITEI2o3We5ZF2fldbsjEZoONrPe7nH+i0QRuIYknaa5aWGyrHxOm9dYFs8mfTSzOQDBGddx/Qa8HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681501; c=relaxed/simple;
	bh=fzhUimtOoDqURWlrpzJ2tptbogob8EGE3/Ps29ceZfA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7ekndqy45jE5juKA2D06uZu0Uv+Hsknt+TWjrAmzzdVxBdRuWj4NWb4wPvVvZAri9JFzxmG7af+IzsqlCjzYDSPxWvA6FdGossUp7qoKB3GIr6+RuY9y5AYMjOrGyvRgaalsyqp71cfiK5+UtqkqG3miZ67GBDFKcgUB1ghEKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsBm47k4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9kXds014510
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6lpkVkbFFzrvmphzfIGrU6Jd
	Kd9k8Ffe4NozJc/9opA=; b=MsBm47k4skDxtY+Uv3Onf2K5mjv2vbUvMYiDgk5D
	9aujx/mCBZdxI+QxA1acvBNe32ONBgIAcNqLMt2gqByP+BBWG+FtJyMTgysGjVxT
	0Rkt71eJ/03QeEnDeXfYHY1lw8zsNg0E1hpMODvAQvblKvy43g5jby+GGHcKsoh5
	2KLqWDKVCeYYQCsNyYDeTpRJvZf6qo2Pih1VX/PEdaitgDp5PhGPu63eWHbHL606
	1tBf2+92gCbjET1ej4JiIyYNyYD5Op41DZl3W0OLzXHsmAG3fbMLJvHE3Af4rUkM
	8q5VRodbTxqke98b9dIuF2OxL5E4lQ0a20VQng/v4yi2PQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5hq8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:24:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d38fe2eff2so703685685a.2
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 05:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681498; x=1751286298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lpkVkbFFzrvmphzfIGrU6JdKd9k8Ffe4NozJc/9opA=;
        b=ilbK+zqLA8DiZsLMHEVuJoj8LFGvfWvEll7sEfEdt+yuo3wFGwLjfzMLXjCxkL4Fph
         PbGzPBv9yY+JKgAyW20zVYDnZIk2eeMIWUkghiXppTOWX42Ng4yzw+AdS1NA+rhdlQa/
         rkZKk7gOdGvkD0TBYU4jqiUSU1VqFOP0y96B8K7+sJLr5HPtQ+4ZEbqPcHqCsxiBHpH9
         7nSh4fzIrzaXg/Zf1kkJPxV7a5AEKfo3KWrfBbSbUsP/EquQwpXUTF7YGB4a5Ii/lKs/
         MwkONDfQnUhcSv9DZRkVGN/0EXfB8ujoU8Vnu6JfOE/Ad5AUNZh2bQH0sZPOcFaXb3Be
         iDWA==
X-Forwarded-Encrypted: i=1; AJvYcCVUEcA1063eZqwVp0V0CZyhszSIYLQsnrmAd5IWO8V1+q8L+uq+f8FaBrcD7LaqGyX/J7cRC1LWa4UQMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEiEI+YXGrq0G5+c4Oc5ug6H7SyYkqdMXCSM5CZvuBcvGpXUkz
	S6hT9xe8A2tkfCYhj4y0tloG0nw6Mc/jd/B8DLgwmE8VranIKQyYWjaW4ioLpCVxeiI5imKUk8h
	rEg48x5mfradX/jfyQQ44x8wgqF9USZ1c6R1/Z6gsqXspYmaMH/NExRSA015yPcqPiA==
X-Gm-Gg: ASbGncuUzfreZd5P/CgHIEi5gyRw6Q5MIjjhqsDFGTEYF176OonHsQf8Ny9XQ5ob7fi
	Xihlj7xp4lat65wpMhcIaV05HUzuCBSZ30fRg2TClQ+AD63la1i6krWi5OMcDekphJ86WobxMo2
	E1PUG8W+iRdKFOUbmIDhZLLAcXBatr6SE45FkO0C2J/zemSFQFzOfpSsWpt95t0zLj63qM7J1q6
	hfDx5uhzWVe4HKgw0mGk0Jd2ChhwOuK6W7HAFHf5wLXS+33L0MKXI43KJvPJF/IFvZmoNIBvOkV
	g0zXearOmJCRvqqUmec6yCjI/sq6pKXfbLfUiIXAA5g64q8WJdck1BMevQ==
X-Received: by 2002:a05:620a:4610:b0:7c5:af73:4f72 with SMTP id af79cd13be357-7d3f9930eb3mr1617103885a.42.1750681497634;
        Mon, 23 Jun 2025 05:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxicgaoGqZS7jGBzLs7Z+Z09iOtzjIk4ozOFpADlSlP7VJDpknaILbMhdjXScjGiHwmi07ew==
X-Received: by 2002:a05:620a:4610:b0:7c5:af73:4f72 with SMTP id af79cd13be357-7d3f9930eb3mr1617098885a.42.1750681497024;
        Mon, 23 Jun 2025 05:24:57 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d1508sm108268135e9.12.2025.06.23.05.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:24:56 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 23 Jun 2025 14:24:55 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aFlHlxO/V3MMARVK@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-2-jorge.ramirez@oss.qualcomm.com>
 <cbd6b7e3-850a-4bde-a1f9-393c291c1ee3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbd6b7e3-850a-4bde-a1f9-393c291c1ee3@kernel.org>
X-Proofpoint-GUID: KV8QVx-fI3BnlG7zGAUAUvWrdq-lBHjP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3NCBTYWx0ZWRfX5Wfib/x734Hf
 P0I5MZf0wpZACqTiiBDhf8VcqpBaquduaOYq/qu989oi8daNdnbQVBcmC1Q9Foh79e8XX3QWXXl
 /jfo9cgIjxKIodyWplNZt2MQP1rJGE2BBF9ELUZNoDK2RfbLq63d+KWDYZIrxZAVDI4xxIpf+Pb
 UjXCUxuMtxxPzih729XxY1SaRnA0hAE9t06fklhuK/gTBYwgzn8ZoEshvWYKLBR+2ubjRYfB+VD
 b39IsQGujKHpP8ykj8E1McixeWhftH7zsbifu4L5zTxgiC5VRWOMWh8o7rHL+/K0iotHIKe0At6
 WsyZWIEQMLrfLS0am3ITGhK1CGbdY1rD9hJoCEkwDY2IbFLRuvDNzAgwiXJBgoK63A3zoYxIEzS
 enx7Lm7RDXq1FFj2cbLaV+MwXljZ76Irr7a3f1Bl06+CQp4vdmKxGmBsl1mg5ZnSv/lmR/+z
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=6859479b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=MRJ33UoC1PT6Y8aHHn4A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: KV8QVx-fI3BnlG7zGAUAUvWrdq-lBHjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=609 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230074

On 23/06/25 13:49:21, Krzysztof Kozlowski wrote:
> On 23/06/2025 12:51, Jorge Ramirez-Ortiz wrote:
> > Add a schema for the venus video encoder/decoder on the qcm2290.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> Don't send multiple versions per day and allow other to actually perform
> review of your patchset instead of sending for every little thing.

No. this is not what this was about - I already explained to you the
call I chose to make. You can disagree but you should not misrepresent
it. 






