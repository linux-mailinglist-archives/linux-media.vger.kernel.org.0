Return-Path: <linux-media+bounces-50544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E00D181A8
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7795B304283A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5A827466A;
	Tue, 13 Jan 2026 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ys0M03zk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f044blbQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A64819067C
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300788; cv=none; b=iQQ8TV10roeA/oMqTxIdp4EVVJFbUFra7/DXRkKBDVJ4RS3F8+dHuy4lbAdtUJP8mXjYL9m27gdkBX4jd/I98XgVmKIkjiETXJHLDeWJ2eVC+ZXoDNb61JdDRXkP0lkuZ3r+2z7RcgXQ+coCHbBoMUQmaVcQ8Otkfyo+uAg51oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300788; c=relaxed/simple;
	bh=YX2GwTKjZTANdkjSIG2uqWaplNxvriLnbPlDtWKjkSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwXcE/sRErjwLH//LcBcSAEr9BL+vh1yfpfBtR/NMRydRxFQXWZl2rR2MxyYdRNns2U+VZ9zk0irz2cBuKub6bSo4zj1P/58n4rCatGjjBuNlpfFq8iYyvY26bWdwtfmNcVPMcg1RUoUiyqsqDNPNkbrP8lhF/erL7pt4hwVZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ys0M03zk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f044blbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SsRb3868843
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgS7BDkNJ9sW3VNFd2ykKLG3x2SkoDLGjv9R71zBquA=; b=Ys0M03zklKy8k8ZI
	jUW9rIy6qrSReAtVixOoet/PQgC4CTb1W3lPPRLA4xbNvzoPS3ogB/4yJmAFzx46
	tRo67+6+uJTaCbVuoYkxruqXKLx6CDlQRNCHtsJj5sCRKfpEgd8VnS0yZwk1RH7q
	V+rbhcnWYwafQx+nkZz6ni8bhWqnrIVEJrfja0wczKh8U71cL+p/w89Cwxoex2uF
	7Hs8xnCVx5ciPiZ6lbAe3M2rRna5XLp8asm87mali3gLiIqBpdiCjcatrBXRcWXf
	YwhiTMeueWCYa85jWlukF/sK1SfQ4Y7Xyo2Z4n9rz/eH1Bx/R98cNMz9T5qzuejd
	hdnvIQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8x4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:39:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c1290abb178so5315680a12.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 02:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300783; x=1768905583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UgS7BDkNJ9sW3VNFd2ykKLG3x2SkoDLGjv9R71zBquA=;
        b=f044blbQnMuEVL1qYK3igjwGR+Cl0R/6HJHBlF16T4SgAK2vXb6CIeP5aPndrz7yIL
         fYKbVPyg5HmON4S7jtHccJ8Sp3c4rcZIJICaY8NSSykVrb+hanlMbBAdQW+hdNFLcDyg
         wHWhs7Ti65AS0kuKIrYGjQSYPY5h/U5Bwzu/pC8mMbUK6pkfRoAXgnKlepJRXg5nBKKK
         njPe//wxcy47oY+SUBjrUAuIRVIdaMP6ZKRVXUE8+jMPn7+jBVuTEseF7IXA93AURBzZ
         hMC4e3vvI5kHo/ZfGD+TMLOsirHMFmBZYM3KL/RF9zsZoHx2bxeRLcGI8TBR8tVzl+Fq
         PQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300783; x=1768905583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgS7BDkNJ9sW3VNFd2ykKLG3x2SkoDLGjv9R71zBquA=;
        b=slPdjtrr3KIArVSaeHMaZSXoNr8NMye02HSprKGmpoLV9WncVB2OcinvaZse4fLpaI
         9AoT1+QB96F/zixYVpguOgo1FmL1MeKVHLikorOe1+zaJMjykKIqqIHtWx4WqB/tQRX2
         L3hz1EL3ZdcCnRNIac36Zlc3mkKUM40VWBiPe7tkzalzS/m+kwhvWKGUbECz7zY0PCtV
         XsnKv+NCoZmTOca9OclUBuxidEeLXj6qsxcN25zsTYDjL9spig0Ta1dMx9DWDi89nz6X
         yB6l9knN+7tZKI3yDJsT+PCxRo/F5MmlUXR1R7cIsFP7H+mW0V8Q4hypRcp1VUSCH1y0
         EE3g==
X-Gm-Message-State: AOJu0YyPPYHZdXGStyjUOgBIDJtbBssZcLnwQtQ3abueKXslHUNt0Dj5
	OFqNHW2AfEo/rKHPcv+11qYyLikaJPHikO7Y4kCSzIhupPxOR5i64j0BeIUkOaBR0dki4QriwG7
	YSStgeGvzpIR8oIBL76Z2MuOgOwOHJY4GZ/AhEATzD9VENT39VYnLeBX5Bap8B+NEvQ==
X-Gm-Gg: AY/fxX6KeoP4jtIa736BZZVVqGRjI0yKLiTh7OgTUO0dz9NznMzMTbx9pwMQNfBnUcI
	TRc5CQGa6JrY/1u9mrGywZxU+xXi+msQs43TM3IENm+8h7mBXl1ZrqpbOWdENaLyaz1uFNt5/YL
	ckb5jH7E/30f/L82BjRwIScc42gn2eaG/MA+QAPs7SU9kLUPHzqHNs6ERmDTn/I1NZB+9N5ryDs
	8jTL2x/g3EoIMsf9V4nhcF4QqpHLIxT2etKkyM5BszszASn4YXqYz28p7UEViz5qoKX96lfCNcU
	IfsbPKo7ed8tQ3GlkIIiUoR5Yd7teV8KfUafTyhwERqzyiRKJH9iZv3ZoWaHqUi6MWZybx765PE
	JwdGV52okKQQKVa1nrNVwLsJo4RfJEz8JInhr2cEwvkTy
X-Received: by 2002:a05:6a20:3943:b0:35f:7e97:a08a with SMTP id adf61e73a8af0-3898f8f4bd6mr16505825637.9.1768300783085;
        Tue, 13 Jan 2026 02:39:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFmdq3qibFvsP73vxvwmhB4mvmXmrDcv8PO6q97rXmqve8Hdfirvhcu40p4MO0vrritkjN7Q==
X-Received: by 2002:a05:6a20:3943:b0:35f:7e97:a08a with SMTP id adf61e73a8af0-3898f8f4bd6mr16505795637.9.1768300782239;
        Tue, 13 Jan 2026 02:39:42 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc95d5c66sm19590056a12.24.2026.01.13.02.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:39:41 -0800 (PST)
Message-ID: <b8248626-b5c2-d301-fc5d-8023ff70cb6e@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:09:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] media: iris: Add support for QC08C format for
 encoder
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <20251008-video-iris-ubwc-enable-v2-3-478ba2d96427@oss.qualcomm.com>
 <899b9ae6-7278-4c16-aad6-ad0f84ca6a49@linaro.org>
 <7ac52a23-a732-4ac8-a00a-cc9084493f38@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <7ac52a23-a732-4ac8-a00a-cc9084493f38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mYzRFhvjXexhPmezRcRFXaoYwD4BmyTh
X-Proofpoint-GUID: mYzRFhvjXexhPmezRcRFXaoYwD4BmyTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5MCBTYWx0ZWRfX+kY0DGSSKh4P
 lSU9fOKTOwMEmPznYys+oq1Zh7JqOA9iuaHvanqgX69AG+eKWZYlc2KRELgkatPjiwzAW000Lcz
 W7K7e9Qdwl2eTmNC8rNCWD92wGRY17akqCekyaf5olfQHjg+/16bGGX8aSOnC5a84ZldH2CZHX6
 ONospf2YzzORi8ME4yiIFLOQ1ocEjxLhp4l1lt2E9yj4xU0jDHk13EYnIS1s1vI2I4WxxKrkc6v
 wozRJ9MvtGK8rkMWkDU1GhsUupJuTkRQxNcOdIYjAfhCm6EOGIYll0l3aeoyEkbqbmkP7OHrTSO
 aS3BtYQ7E/40wGfmw7RHfJQPLvyccD9eqXHlKKpKEUDqwP937cBWftANV7FG23NysNN29AJrdzr
 hNq4Usbdvzbu3F6+L6nox1wtT9V29ifr8LvhLqY7rpk6RjXHjccFZwf/2rEZNZmy+Il1/lE8h/2
 zo/ZnargBzjT+u+hVnw==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=696620f1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MxFkaXIYAAAA:8
 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8 a=HRqkdOj8ywfFDgwv-RMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=bWa-HqqoEbs8MZQ2NTq-:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130090



On 1/13/2026 2:09 PM, Neil Armstrong wrote:
> Hi,
> 
> On 1/9/26 15:28, Neil Armstrong wrote:
>> Hi,
>>
>> On 10/8/25 11:52, Dikshita Agarwal wrote:
>>> Introduce handling for the QC08C format in the encoder. QC08C
>>> format is NV12 with UBWC compression. Update format checks and
>>> configuration to enable encoding to QC08C streams.
>>
>> I'm late to the party but I've been trying the new encoder features patchset
>> on top of v6.19-rc4 on the SM8650-HDK, but the result was wrong like if
>> something
>> was wrong in the planes offsets, leading the the UV colors moving in the
>> background.
> 
> Gentle ping, I've trying to understand what causes this, could you help fix
> this ?

Sorry, I missed your earlier email.

Are you using the updated v4l2 utils code, I have posted a fix [1] for
regression caused for NV12 after adding QC08C support. Same was mentioned
in the cover letter [2] as well.

[1]
https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u


[2]
https://lore.kernel.org/linux-media/20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com/

Thanks,
Dikshita

> 
> Thanks,
> Neil
> 
>>
>> The encoding was fine on v6.18 final release.
>>
>> Here's a screenshot:
>> https://pasteboard.co/t8HmeNaIFMDR.png
>>
>> The command I use are:
>>
>> ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -pix_fmt
>> nv12 test_video_1080_10s.yuv
>> v4l2-ctl --verbose
>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1920,height=1080
>> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
>> --stream-from=test_video_1080_10s.yuv
>> --stream-to=test_video_1080_10s.h264 -d /dev/video1
>>
>>
>> I did a bisect and it did lead to the very change:
>> # bad: [9ace4753a5202b02191d54e9fdf7f9e3d02b85eb] Linux 6.19-rc4
>> # good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
>> git bisect start 'v6.19-rc4' 'v6.18' 'drivers/media/platform/qcom/iris/'
>> # bad: [6dfafbd0299a60bfb5d5e277fdf100037c7ded07] Merge tag
>> 'drm-next-2025-12-03' of https://gitlab.freedesktop.org/drm/kernel
>> git bisect bad 6dfafbd0299a60bfb5d5e277fdf100037c7ded07
>> # good: [8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88] Merge tag
>> 'net-next-6.19' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
>> git bisect good 8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88
>> # good: [490fd9336650a39c57ce2a652676a8cb9dc6c842] Merge tag
>> 'drm-misc-next-2025-11-14-1' of
>> https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
>> git bisect good 490fd9336650a39c57ce2a652676a8cb9dc6c842
>> # good: [559e608c46553c107dbba19dae0854af7b219400] Merge tag
>> 'ntfs3_for_6.19' of https://github.com/Paragon-Software-Group/linux-ntfs3
>> git bisect good 559e608c46553c107dbba19dae0854af7b219400
>> # good: [b3239df349c2c2c94686674489c9629c89ca49a1] Merge tag
>> 'drm-misc-next-2025-12-01-1' of
>> https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
>> git bisect good b3239df349c2c2c94686674489c9629c89ca49a1
>> # good: [6e971cfe62e7a56593b22ab1ad0050ac49551696] media: venus: drop
>> bogus probe deferrals
>> git bisect good 6e971cfe62e7a56593b22ab1ad0050ac49551696
>> # bad: [f53fb31a388901cfe11b95a3a2cf1594355321e4] media: rockchip: add
>> driver for the rockchip camera interface
>> git bisect bad f53fb31a388901cfe11b95a3a2cf1594355321e4
>> # bad: [e687f5cae591dba4a0a968c24cbe7b6141027d93] media: imx-mipi-csis:
>> Support active data lanes differing from maximum
>> git bisect bad e687f5cae591dba4a0a968c24cbe7b6141027d93
>> # bad: [c33f7e61a1c9e9255597102e61add4b4fe91668c] media: qcom: camss: Add
>> CSIPHY 2.2.0 lane configuration for SM8650
>> git bisect bad c33f7e61a1c9e9255597102e61add4b4fe91668c
>> # bad: [542e3540ddd75f0a46dd365978476bcc1dda5b5a] media: iris: enable
>> support for SC7280 platform
>> git bisect bad 542e3540ddd75f0a46dd365978476bcc1dda5b5a
>> # bad: [e5894eeefdebf5a6d7512cd23efec78071985738] media: iris: turn
>> platform caps into constants
>> git bisect bad e5894eeefdebf5a6d7512cd23efec78071985738
>> # good: [7c1f3bd58fa02f427ff4ef611fa49b56bc6f8f76] media: iris: Add
>> support for HFI_PROP_OPB_ENABLE to control split mode
>> git bisect good 7c1f3bd58fa02f427ff4ef611fa49b56bc6f8f76
>> # bad: [456c99da41cb6f39c5c8420710b72fb9fd1450b4] media: iris: Add
>> support for QC08C format for encoder
>> git bisect bad 456c99da41cb6f39c5c8420710b72fb9fd1450b4
>> # good: [cfd71b14b0d6f62d97338a524c858c63cf699c3f] media: iris: Add
>> support for QC08C format for decoder
>> git bisect good cfd71b14b0d6f62d97338a524c858c63cf699c3f
>> # first bad commit: [456c99da41cb6f39c5c8420710b72fb9fd1450b4] media:
>> iris: Add support for QC08C format for encoder
>>
>> I don't see what would be causing this.
>>
>> Thanks,
>> Neil
>>
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 12 ++++-
>>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +-
>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  3 +-
>>>   drivers/media/platform/qcom/iris/iris_venc.c       | 59
>>> ++++++++++++++++++----
>>>   4 files changed, 63 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c
>>> b/drivers/media/platform/qcom/iris/iris_buffer.c
>>> index
>>> 83dcf49e57ec1473bc4edd26c48ab0b247d23818..b89b1ee06cce151e7c04a80956380d154643c116 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>>> @@ -171,9 +171,14 @@ static u32 iris_yuv_buffer_size_nv12(struct
>>> iris_inst *inst)
>>>   static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>>>   {
>>>       u32 y_plane, uv_plane, y_stride, uv_stride;
>>> -    struct v4l2_format *f = inst->fmt_dst;
>>>       u32 uv_meta_stride, uv_meta_plane;
>>>       u32 y_meta_stride, y_meta_plane;
>>> +    struct v4l2_format *f = NULL;
>>> +
>>> +    if (inst->domain == DECODER)
>>> +        f = inst->fmt_dst;
>>> +    else
>>> +        f = inst->fmt_src;
>>>       y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width,
>>> META_STRIDE_ALIGNED >> 1),
>>>                     META_STRIDE_ALIGNED);
>>> @@ -273,7 +278,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
>>>       } else {
>>>           switch (buffer_type) {
>>>           case BUF_INPUT:
>>> -            return iris_yuv_buffer_size_nv12(inst);
>>> +            if (inst->fmt_src->fmt.pix_mp.pixelformat ==
>>> V4L2_PIX_FMT_QC08C)
>>> +                return iris_yuv_buffer_size_qc08c(inst);
>>> +            else
>>> +                return iris_yuv_buffer_size_nv12(inst);
>>>           case BUF_OUTPUT:
>>>               return iris_enc_bitstream_buffer_size(inst);
>>>           default:
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>>> index
>>> e458d3349ce09aadb75d056ae84e3aab95f03078..52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>>> @@ -795,7 +795,8 @@ static int iris_hfi_gen1_set_raw_format(struct
>>> iris_inst *inst, u32 plane)
>>>       } else {
>>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>>           fmt.buffer_type = HFI_BUFFER_INPUT;
>>> -        fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> HFI_COLOR_FORMAT_NV12 : 0;
>>> +        fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> +            HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>>>           ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>>       }
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> index
>>> 5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7..6a772db2ec33fb002d8884753a41dc98b3a8439d 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> @@ -447,7 +447,8 @@ static int iris_hfi_gen2_set_colorformat(struct
>>> iris_inst *inst, u32 plane)
>>>               HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>>       } else {
>>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> HFI_COLOR_FMT_NV12 : 0;
>>> +        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> +            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>>       }
>>>       return iris_hfi_gen2_session_set_property(inst,
>>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c
>>> b/drivers/media/platform/qcom/iris/iris_venc.c
>>> index
>>> 099bd5ed4ae0294725860305254c4cad1ec88d7e..95e3ceb22d8c3a46c1bf3eb87e7c1cc5ccf3039f 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_venc.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>>> @@ -80,7 +80,7 @@ void iris_venc_inst_deinit(struct iris_inst *inst)
>>>       kfree(inst->fmt_src);
>>>   }
>>> -static const struct iris_fmt iris_venc_formats[] = {
>>> +static const struct iris_fmt iris_venc_formats_cap[] = {
>>>       [IRIS_FMT_H264] = {
>>>           .pixfmt = V4L2_PIX_FMT_H264,
>>>           .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>> @@ -91,12 +91,35 @@ static const struct iris_fmt iris_venc_formats[] = {
>>>       },
>>>   };
>>> +static const struct iris_fmt iris_venc_formats_out[] = {
>>> +    [IRIS_FMT_NV12] = {
>>> +        .pixfmt = V4L2_PIX_FMT_NV12,
>>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>>> +    },
>>> +    [IRIS_FMT_QC08C] = {
>>> +        .pixfmt = V4L2_PIX_FMT_QC08C,
>>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>>> +    },
>>> +};
>>> +
>>>   static const struct iris_fmt *
>>>   find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>>   {
>>> -    const struct iris_fmt *fmt = iris_venc_formats;
>>> -    unsigned int size = ARRAY_SIZE(iris_venc_formats);
>>> +    const struct iris_fmt *fmt = NULL;
>>> +    unsigned int size = 0;
>>>       unsigned int i;
>>> +    switch (type) {
>>> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>>> +        fmt = iris_venc_formats_out;
>>> +        size = ARRAY_SIZE(iris_venc_formats_out);
>>> +        break;
>>> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>> +        fmt = iris_venc_formats_cap;
>>> +        size = ARRAY_SIZE(iris_venc_formats_cap);
>>> +        break;
>>> +    default:
>>> +        return NULL;
>>> +    }
>>>       for (i = 0; i < size; i++) {
>>>           if (fmt[i].pixfmt == pixfmt)
>>> @@ -112,8 +135,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32
>>> type)
>>>   static const struct iris_fmt *
>>>   find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>>>   {
>>> -    const struct iris_fmt *fmt = iris_venc_formats;
>>> -    unsigned int size = ARRAY_SIZE(iris_venc_formats);
>>> +    const struct iris_fmt *fmt = NULL;
>>> +    unsigned int size = 0;
>>> +
>>> +    switch (type) {
>>> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>>> +        fmt = iris_venc_formats_out;
>>> +        size = ARRAY_SIZE(iris_venc_formats_out);
>>> +        break;
>>> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>> +        fmt = iris_venc_formats_cap;
>>> +        size = ARRAY_SIZE(iris_venc_formats_cap);
>>> +        break;
>>> +    default:
>>> +        return NULL;
>>> +    }
>>>       if (index >= size || fmt[index].type != type)
>>>           return NULL;
>>> @@ -127,9 +163,11 @@ int iris_venc_enum_fmt(struct iris_inst *inst,
>>> struct v4l2_fmtdesc *f)
>>>       switch (f->type) {
>>>       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>>> -        if (f->index)
>>> +        fmt = find_format_by_index(inst, f->index, f->type);
>>> +        if (!fmt)
>>>               return -EINVAL;
>>> -        f->pixelformat = V4L2_PIX_FMT_NV12;
>>> +
>>> +        f->pixelformat = fmt->pixfmt;
>>>           break;
>>>       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>>           fmt = find_format_by_index(inst, f->index, f->type);
>>> @@ -156,7 +194,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct
>>> v4l2_format *f)
>>>       fmt = find_format(inst, pixmp->pixelformat, f->type);
>>>       switch (f->type) {
>>>       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>>> -        if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
>>> +        if (!fmt) {
>>>               f_inst = inst->fmt_src;
>>>               f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>>>               f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
>>> @@ -221,7 +259,7 @@ static int iris_venc_s_fmt_input(struct iris_inst
>>> *inst, struct v4l2_format *f)
>>>       iris_venc_try_fmt(inst, f);
>>> -    if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
>>> +    if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
>>>           return -EINVAL;
>>>       fmt = inst->fmt_src;
>>> @@ -289,7 +327,8 @@ int iris_venc_validate_format(struct iris_inst
>>> *inst, u32 pixelformat)
>>>   {
>>>       const struct iris_fmt *fmt = NULL;
>>> -    if (pixelformat != V4L2_PIX_FMT_NV12) {
>>> +    fmt = find_format(inst, pixelformat,
>>> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>> +    if (!fmt) {
>>>           fmt = find_format(inst, pixelformat,
>>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>>           if (!fmt)
>>>               return -EINVAL;
>>>
>>
> 
> 

