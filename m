Return-Path: <linux-media+bounces-8991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653D89EFE6
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99EF4B20C46
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 10:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34E715920F;
	Wed, 10 Apr 2024 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NyqXTw7b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B541C89;
	Wed, 10 Apr 2024 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712745319; cv=none; b=iUObwE/CL3Gf0XXACijcSQ5F/bpgCwPYeV0XYnwWPsmVUhDiykj2HIBJIWVIExXJaZsD5oCOvWlnneMwL8LsQ624rwhQEuLvXjtnoTwXtphlxqKzeQss8Tx0g8mQpe2kAecYhjzeEAURTZB7w/aqLxtIn3nPnVtzg5Q4t17/N7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712745319; c=relaxed/simple;
	bh=ThhvDVPiiaKmDlGxu80KWl9EGYDaS+123BvSFlW+CJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y4Fp27u8o5AUQocTJg4/iemSsgN6dKcMXgrsZQG4wHuRtN6nuGJTHs+D2rsvYobMUDTcXmiiU3iKqlZnzbVqpcy+xAW7l2GzuRKPj7BlYErcP/wgz0ezQKqfq4Yzn5+Mb1uAq95CSkpHM8z+Rp2tA6+PsgLDvsxPKcWcfD8Xuy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NyqXTw7b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43A9EEro001693;
	Wed, 10 Apr 2024 10:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cnv53DMZLY76204Kpb79A2E2O9pO+4e8+cXEvQmbeCs=; b=Ny
	qXTw7bdqVdwwqoylcMBc/uvA1dUO/yeV1CWGV2gRQkr1Kw45weFSe9LhnMaqzM1T
	Vaz2ZQ+68j3d4dhL++1zq3yaF60o1aF2X2CxxU9AJdbjU0Q0WFfKe74XmgO3hDYG
	ndu0nauVdLrXzb1Nu7craw+rcyts4obSZ92yj4h6h6wRognulZsXstSQSCOH3q3q
	cn9o0VSW/6lMOWvaVSEmO7YoQjGitQjp6yQL2JpaUPhjf5cQw8UkxhlgWMmEqFVQ
	rnCruzblG8niQ4qSsAnlarhd+0Ou2R+ufM6l5wvhJKLnpx6OSHc1QH55H+NjmeqM
	teciPjZfWBcDaAY3yATA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdqy7re3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 10:35:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AAZ4LL025905
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 10:35:04 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 03:35:00 -0700
Message-ID: <855d6c78-c06f-db9c-13b9-b8417ea62121@quicinc.com>
Date: Wed, 10 Apr 2024 16:04:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marc Gonzalez
	<mgonzalez@freebox.fr>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: linux-media <linux-media@vger.kernel.org>,
        MSM
	<linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Pierre-Hugues Husson <phh@phh.me>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
 <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
 <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
 <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
 <a8c5b27c-47a9-044a-78e8-51c67acf19a6@quicinc.com>
 <c6a9c20e-02d3-4334-badd-2efe5be9ce7e@freebox.fr>
 <d5abf142-3a2b-454c-660a-249c0fb25208@quicinc.com>
 <33382ecb-8a73-4d2f-96b1-8048df7a6414@freebox.fr>
 <3914555d-3c89-a5c5-2906-0bd24d0bf735@quicinc.com>
 <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
 <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
 <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
 <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
 <c2ce34ce-d532-4039-bb9f-d4d1b2fb23b0@freebox.fr>
 <09bc9231-0e59-4cb2-a05f-02e2fcaf3d15@linaro.org>
 <02a32387-1a30-44cd-b552-6e47023b997d@freebox.fr>
 <8b9cc46d-4267-43fb-b2be-f5996566a349@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <8b9cc46d-4267-43fb-b2be-f5996566a349@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d7watp6wV2Yi2wN5g7zjhPdpIzDllEt3
X-Proofpoint-ORIG-GUID: d7watp6wV2Yi2wN5g7zjhPdpIzDllEt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100076


On 4/10/2024 1:47 PM, Bryan O'Donoghue wrote:
> On 09/04/2024 17:53, Marc Gonzalez wrote:
>> On 09/04/2024 13:27, Bryan O'Donoghue wrote:
>>
>>> Can you give it a try ?
>>
>> Random notes
>>
>> For easy reference, I've used this command to test:
>>
>> $ mpv --hwdec=v4l2m2m-copy --vo=tct --quiet --no-audio demo-480.webm
>>
>> And it displays the video directly in the terminal :)
>> (Rendering speed depends on terminal size)
>>
>> I'd never played the video to the end.
>> I notice I get:
>>
>> [  397.410006] qcom-venus cc00000.video-codec: session error: event id:1001
>> (deadb000), session id:79d7c000
>> [  397.410114] qcom-venus-decoder cc00000.video-codec:video-decoder: dec:
>> event session error 1001
>>
>> How bad is that?
>>
>>
>> Sometimes, decoding simply fails immediately.
>> Must quit & restart.
>> Will have to script a 100 starts and check frequency of failures.
>>
>>
>> Will test with higher-resolution video.
We were writing sample test application [1] to test video usecase and more
specifically with user driven inputs. Incase this help in your trial. I haven't
yet tried this on venus driver and used it mainly for the some other v4l video
driver, but i can expect it to work given it is v4l interface based. It has few
sample config which can dump the decoded output to validate. Ignore if this adds
to your effort to validate from this app, will publish once we try on venus driver.

Regards,
Vikash
[1] https://github.com/quic/v4l-video-test-app

>>
>> # time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed
>> demo-480.webm
>>   (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
>>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> Using hardware decoding (v4l2m2m-copy).
>> VO: [null] 854x480 nv12
>> [ffmpeg/video] vp9_v4l2m2m: capture POLLERR
>> Exiting... (Quit)
>> /*** HANGS UNTIL CTRL-C ***/
> 
> I think there are a number of different resolutions across SoCs that will
> exhibit this behavior, I've seen it with lower resolutions on 8250.
> 
> Its a bug that we need to drill into in Venus but I don't think is a bug that is
> specific to your setup.
> 
>>
>> real    0m21.467s
>> user    0m3.795s
>> sys    0m1.914s
>>
>>
>> # time mpv --hwdec=v4l2m2m-copy --vo=null --quiet --no-audio --untimed
>> --length=30 demo-1440.webm
>>   (+) Video --vid=1 (*) (vp9 2560x1440 59.940fps)
>>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
>> [ffmpeg/video] vp9_v4l2m2m: VIDIOC_G_FMT ioctl
>> Using hardware decoding (v4l2m2m-copy).
>> VO: [null] 2560x1440 nv12
>> Exiting... (End of file)
>>
>> real    0m16.433s
>> user    0m1.764s
>> sys    0m1.118s
> 
> If this higher resolution is stable for you, I'd say this is about baseline.
> 
> 1. The GDSC change should make no impact on playback or available resolution
> 
> 2. Higher more "normal" use cases like 1080p should be fine.
> 
> If so, then file "low resolution is broken" under a "known unknown" and scrub
> your patches for submission.
> 
> If not, we need to do more 8998 specific debug.
> 
> ---
> bod

