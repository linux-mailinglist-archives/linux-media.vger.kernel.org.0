Return-Path: <linux-media+bounces-45788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFEDC141B3
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF0394F38CA
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7AC3043CA;
	Tue, 28 Oct 2025 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFcwfuy6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0971F29B8DC
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761647267; cv=none; b=NAdJlGzzqp1WUdXbi+CsQ6ilQDU2MclT5fR750y+18zLIyHY05gN6mJLsg3ILXCZH9F1EKawQ8Oni64ToVnrZlnbEwWEw305ykzbBFark5Zt+A1at4TSFpa6n/Ij8rH7VC7VXR2G9MwzQlGz9hz+IXGIAyvehd+i7TfwrdTttrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761647267; c=relaxed/simple;
	bh=JRIjRko0iU+3pC4lIHzKRFyzb1AsTuYmzInlVTjXafA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK2LtilIkFV30g+cl7ubnFeA+gbStk0fdlCtDvThs5qvYNUBvxlZfqOCwQ7FkuNpogd4gSaNxfaJn26FsR/NjLhgEtLfjh3MGJjDhprehmofFOVSRpSclpkXw9rimOoExMTJxFr4PQq1UEv5Sw0eaJertt8npIvL79k7kwcdcsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFcwfuy6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7dYBx1032996
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 10:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jchqg3ozjDw/eWeqGxyZ6hjH+Z28PRs9xP9kxhdu6HY=; b=ZFcwfuy6vIKIFkxi
	imJGODU+en0pvk2iwTuHMBkiDpK+NbZNnIIUzv8VbZZJWQ2bh+y5M0Yr6xhcXHP1
	Zcc5gI3wLZ2blW9v5uWTnB3tiMiKDqdRHp10mVxmhCvWnfiiGCk1TU7jlFWkZ7ox
	Gq1c/uylZJKe8+Ipnh/P5HedI3GdVzehjj411CKRdBuOcdRsQh9CnJ/syKQ8EhZe
	XrOrSMhIc8oY/K3Cl3iKN6yVfb0jkezzbImfrI491DFBA/TdF+t38XNb2b1rbwEo
	8OPFO1Tkv5wsz+PoFcQ3vlN6j31GrwnbMt1EmNifhZTqJ1C83RCqr1TJ340zQrwu
	wGwOJw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2smurgyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 10:27:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso3829579a12.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 03:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761647263; x=1762252063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jchqg3ozjDw/eWeqGxyZ6hjH+Z28PRs9xP9kxhdu6HY=;
        b=Aku3pEUx7QpMCI0kBdW1rPcI4E1nyrZxA7xLCP8VMtC52S+n2Ax2quJElCrc3qoI7F
         nMR6gHqV5IlY6wJ0Q3pnfFqu4VnxCUbeqLCpYICSXEWT0cmD3HTAQI12zpjz0qOlmjMp
         k3+PbuEUMFGkX6FNZU/TLaCJA1mvVLTWKqaZD7y90ABip7kug37ywVId0Fo4q7T71VA0
         dJaEWJQ3skkCGBvSQKHFTUl1A3DyC82X9k53yiuTI5olNk1bZL0T87LwplNO4lLb94tq
         IDdi0yGvElAZ3iAWS23rsM2nZ5XuI6cD2lk0PN27kUzjTiuEg3pmCwVuACaITzKiIM6f
         Jkbg==
X-Gm-Message-State: AOJu0YztHM9BvYzSxwF9jwaLlOx3a8P5K9GCblyQDROwKFWGiJn+Cczd
	LIPblGS7hNsbSWvW0lFkLX3NGG3/JgqSjbPurRAzP5hfSuHfOMAjdb5NdKx0kMGjWERbO8EVA5G
	64mRXkih+kJ78Brkc8eI/YO8o75z9EtSFWo/IozxMro1+Ixs41X4xhO2iaVyN4Y3d6g==
X-Gm-Gg: ASbGncsgRTgc1H64u7RwhYTNUlu53Rn7mrCOL7WAQ9oaKGq2tAY8n1cMV8DzQD/ajKN
	6NnVu4VLRLjtkcmIz9dFInCr1j6xW0rOnaC+3GQosyKlp8Dlfn/HAKaauvSjaDvzuBJM4Wh+ZzQ
	7FtPPekf2EnlK1Bt/BY6K0AMuICGyI65B1ZwY0AhGkGchVk0yMvpcvHF+Zo9Is3p1k4CAXMv4AL
	2hbd7WK6AQxYDFPLMNaRwc4oIL2+sAcu3JZe3d5/v+HLEB3kIsfWEycPaCNq3OxC7Ycas0hz4rv
	5Ym1YRhmhsmT+qKcrJnDApwIX0yFL+o+4SfB1CAQbiscj8fBuvQ/Rvf+2m+QG5+udqpOoMe/Ffd
	LyTNPnLLTg/4fTIWF1Idyi2x/V13PH2k=
X-Received: by 2002:a05:6a20:258c:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-344d4712b60mr3554321637.56.1761647263025;
        Tue, 28 Oct 2025 03:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbJCIhZnhAKWXJ8GYzHMDoc2KKe52AUezo9ceNq2KYJVkwO1Il0nxGryU4eVO50BD0ZWwktw==
X-Received: by 2002:a05:6a20:258c:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-344d4712b60mr3554301637.56.1761647262559;
        Tue, 28 Oct 2025 03:27:42 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed74028fsm11610806a91.8.2025.10.28.03.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:27:41 -0700 (PDT)
Message-ID: <32ecd9d4-15b1-46a4-a496-7619de771f39@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 15:57:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 3/6] media: iris: stop encoding PIPE value into fw_caps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
 <20251027-iris-sc7280-v5-3-5eeab5670e4b@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-3-5eeab5670e4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pgPoNceVNLQcTUDDBm2C5yhzW7zmlF-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4OCBTYWx0ZWRfX5Ll8b6VB9Keo
 gt1CkVWmUvfa+j4DRtTOpClnGrNiZfSQNZS97YLFpKhuesSdUvwnuUeT71IKtOdrIqC1y/jQ5Nn
 gYLTHimkQArjXfm8ZOrgmXj0m0lQPAOkvnNRxeXPgFNMf9pmkK09RxH/3ApyUBzr1eoAkArKODg
 ZG19BNKAcpxsbtUaykOqtskIYvnIxGq3DW/CGGl63wfLJMw34Vi2bpLwMoS68KnEdQSG7Mg6kBr
 h771zR+psn8QL0kExnPA8tXuBzjtiOwGcd/CtTTKwrUAQ5sNvODLMQBao8KBM9s+2vTZPy7dTW3
 IrZbp5oQEQma2Zkmhflagn6vRy52am0V6ro397iOwUjKkM+FmkEv6ZDNmZL8XRkKDvSMbvcNuQU
 APW1kqsGodafwYqB6j8+Ji+YNHX6wQ==
X-Authority-Analysis: v=2.4 cv=IcCKmGqa c=1 sm=1 tr=0 ts=69009a9f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yKFMg8UGa7aLXV3ZWeEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: pgPoNceVNLQcTUDDBm2C5yhzW7zmlF-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280088


On 10/27/2025 5:57 PM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  4 +---
>  4 files changed, 16 insertions(+), 12 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

