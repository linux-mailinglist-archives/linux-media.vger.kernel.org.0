Return-Path: <linux-media+bounces-52678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LWBGth3jmlbCgEAu9opvQ
	(envelope-from <linux-media+bounces-52678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 02:01:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F61322E2
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 02:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4885305DAA5
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 01:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91584503B;
	Fri, 13 Feb 2026 01:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmVh1FGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1Lz1nMz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F173EBF18
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 01:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770944466; cv=none; b=I4EGcvfiuzKrCH+5QnEvHrQdq4Nl6YxQaPBevYvysm3EO+7k3bSbn/aPCkGE6+Fpp9mgdqVHwlUH2lHSiBZkYZQrlDLBngl9ViF3bGY5HLR0TaIf1shtBUckbz9oZGmNetffDY5flqroExmO8Eve8fSlc/P2UYVHphFJ5G4wV5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770944466; c=relaxed/simple;
	bh=PLOic1PDV4Kmy9Vdv+1H3ImLgEBPfniENq9kcrN9h6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D70ycs/CH4PVyB4cye+pE9uOyzLN9jIprQmNngkc624stD3C4LA7EsyDG+zq1BgDcg26z5U7lJcu9ZimhB3KVLDn3T0jDVaOJA8F/TtPcGgC/dRHQHn7ZBM5xpGh2WQSCt6UH+dL/h/ANkO7ej/0M6QCQFlH5s59PVSONA9heys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmVh1FGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1Lz1nMz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CIdWwI1756673
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 01:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lo3899zobW97mj9wJxzzwBJDQjxmwEvYTLQ2OkIeEtM=; b=gmVh1FGDQk0uyvlh
	Wjdurg3YhoVTZzKQ7AJM88nyDQcJKfXD8ZFZTEvmUfl1FU7XKMQGvUEtSrcaGfUw
	IsEvX/D8A0x7AzuSxxxwUQ0BFUcUsl9rRvHZxy5hAVG61IsOKWeolkdQIgStWzIr
	NR8ozoH1SvzSlxlsZZRc8eaKfNP4RiPnTC0jIQ4aoXTDPeeds8xBTcIAqDEdnZeC
	QIxnSpoEUxatq2p3u0oowF8J5f3G693cWxhqj9wzwpT3diPI4sWjnW91N72mtA9K
	ld2J4aX4nVljEs4l+56hYuRajsySqKY54Wk5yDZ5iqc8NGYUfA9FbHSbnF7E+zlQ
	koNDIg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mb117ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 01:01:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127381651c1so56263c88.1
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 17:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770944462; x=1771549262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lo3899zobW97mj9wJxzzwBJDQjxmwEvYTLQ2OkIeEtM=;
        b=e1Lz1nMzLA+DDMgxaBWoFvLb38jsXYdYkkvIHhyUUiWUPXF/HpPPLpirTM9gbwTgc8
         nMenRKYKcz9jFokkIgWgNpjk/CxGINbnnhrGy7eRLnrFbzJc5np5WxJWZhKpGzEZaxVG
         rJnugxBzmnKYaiIu3210O08LUaZ7s/uLac3/lcu7nHJO2S73uWsv7I+kDrNN5HRotbBK
         URZCxSkcWMCBzccdJBeuYIT6/VEy8KLOWGMnTV0lyM1DbKxfcHQ2mTpF/FZxyiRId+Sz
         JDAkyzAMNnyP5rDrX8wRt/TMk5Xg1ADP/dtYresdECSl3uH3ny4TPW/LxqpAm2+m7rk0
         l8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770944462; x=1771549262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lo3899zobW97mj9wJxzzwBJDQjxmwEvYTLQ2OkIeEtM=;
        b=kBB8CNt7BjFgypsfrZu8UlClcu+CgnLYnCEWaDz941q1yX2DV3Khr9k/DKE+7+u4Tn
         zKxBuWNl1oJy55e3QPQjk5FhAgpI/FT5Aq0ZP41p+qZ+evQsalM/S6dulJbRvDL5A/kZ
         ygcuwcWa3IKyGqhg2j17DuygQzeiRcv/LOOlfhueQTfRmIfmursUNqyMobU08T/ExpJt
         FoA0OOcGd935LK2jX1qo/YeUHWAxVQKO+q5xT5vGJcB/hgB+vrma51yFSydxQSJQlYHz
         Yw2KyfAozKS62qkbzxeAswCyAEcNhb13Vb/Zfm6MKkXiFUpvhS2SEo2zW0KlvbmAcBRe
         eDyA==
X-Forwarded-Encrypted: i=1; AJvYcCUUR69zrMrralU2Bc/nKoAHeREurs1dcMyIJRdGF4P22aVydKh6fdyZdz02Woj5SFpSu2lrBYAqCuuIkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycMWx2+uvZIvUnovcacN+BvEwc19CoySpTvTiIVHnal6oSuhxb
	rmzlA1NdWFXFytDzDmgahVvyQdOT3qTg30Vr0xE+TT0+Z94nXDRblviHDyVGul+Ny77X1NCYM5i
	Z+Qr+MB5WkVV6k4i16+T9rJbqInph3eSerw8kYFiZtVmr/a/suCtBzovdlNOMwxZeg/FDigVX85
	hO
X-Gm-Gg: AZuq6aLgQdbNxgb6H8JMt45XE7SRrdVHytmLCVn8T9m4raqDwy4EoUGv5rgRRMDFC0b
	fMXVrhAut+4PTM9uVtYjqrCEvPqFQ8or+B9chP5qbXBosQJEGraehAa1qB9z1phXCd2zlzWtPEF
	tN3IDlJnTFcxIBa7upDXG8SchED4ofhkVTeeY9x5kO7yii4ykOZhSFy8R9sMy4GsAnar224NZWg
	1usVyXVzzaGgHT9FyBTq3MWneR2GTQJn4Ifpu1TwJbV/oFuReE+jaH5tfxzL3gMghNN36rVUgIw
	391q43lGcSV5/IQTSvy1ZwLkWBCd0xvZUOyAzQgtUnZuVtAjQlXJ619xGQe+2qx56fKIYGso+OT
	6HFq1pvp3nacyQqmBybWq9MDq+ue6XwVIJfwnLGfe9lMONhHOmeexMG/GA0ATB3pc5ettlGGAyg
	qjYe+akFN0
X-Received: by 2002:a05:7300:e10f:b0:2ba:7526:f74d with SMTP id 5a478bee46e88-2bab9eea972mr167020eec.0.1770944460113;
        Thu, 12 Feb 2026 17:01:00 -0800 (PST)
X-Received: by 2002:a05:7300:e10f:b0:2ba:7526:f74d with SMTP id 5a478bee46e88-2bab9eea972mr166997eec.0.1770944458421;
        Thu, 12 Feb 2026 17:00:58 -0800 (PST)
Received: from [10.110.84.180] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dcd42c4sm4551928eec.19.2026.02.12.17.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 17:00:58 -0800 (PST)
Message-ID: <b2acd3cb-e80f-42c6-ad07-30d8275976c5@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 17:00:56 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4l-utils] v4l-utils: Add support for AV1 stateful decoder
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
References: <20260107-av1_stateful-v1-1-a691013af2b7@oss.qualcomm.com>
 <69097d9d-3c4d-49b6-b9ad-7c8b75d4c777@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <69097d9d-3c4d-49b6-b9ad-7c8b75d4c777@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAwNSBTYWx0ZWRfX4FCOqRqG6PGZ
 FcAnA+I2Vkmbf2ojeHCtKtxpIoIdIp6kvEWKLYoQgA7dqWk7/PWmwBRLE1VN97mH4ORTLvrIKa9
 CiWwFqA/g/9ja0hZtxCFrf6En2NcNMnIwGmChI39WLEj/QWWJFD/A1Ogk4Rfn7eRR3gpA+qw8JN
 xbNqMMp1dG9BnJvq6GxsiEiZmIMMZm1dpRVGhYZa+qTw2OFb3Qzk1spTLSAzLUNTkz1y3lmgT/I
 /WhMnUa3J6xlA0++1AqddQ0uyoQbGnGH6vxThKIclh23DPQsWCIIx0uNCNmvJL2bzFkV3TZTmqi
 7PIvHbemFnTb6PP50nGug0sZUCM1jh5QHzd5KkrMdQixkiHXOAa6JOPYFDCNhTx0iU3fqbrlluV
 lVkeW99sityOPkmhhOCPuQbWHyyjFravwsmoB1esDFhDJFhNnKfGd09aIBbWBrI2TJFcQ6O3MLN
 aj0HJ99IS/trYxbK1jQ==
X-Proofpoint-ORIG-GUID: CgC2ioWQkID1koPDngUNOPv76bQlJcSA
X-Authority-Analysis: v=2.4 cv=asC/yCZV c=1 sm=1 tr=0 ts=698e77cf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=LT5z9wtYhDp6pAa6cNwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: CgC2ioWQkID1koPDngUNOPv76bQlJcSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130005
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52678-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sync-with-kernel.sh:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B61F61322E2
X-Rspamd-Action: no action


On 2/12/2026 12:16 AM, Hans Verkuil wrote:
> On 07/01/2026 21:20, Deepa Guthyappa Madivalara wrote:
>> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
>> V4l2 uapi. This format is intended for AV1
>> bitstreams in stateful decoding workflows.
>> The fourcc code 'AV10' is used to distinguish
>> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
>> which is used for stateless AV1 decoder implementation
>>
>> Add support for this in v4l2-compliance and v4l2-ctl.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> All these changes are already in v4l-utils.
>
> The sync-with-kernel.sh script v4l-utils generates all these changes
> when syncing to the latest kernsl, and I ran that after this pixelformat
> was added.
>
> No need to do anything manually :-)
>
> Only adding the format to determine_codec_mask() was something that needs
> to be done manually, and I did that too.
>
> Marking patch as Obsoleted.
>
> Regards,
>
> 	Hans
Oh, great! Thank you so much!
>> ---
>> Compliance test for iris_driver device /dev/video0:
>>
>> Driver Info:
>> 		Driver name      : iris_driver
>> 		Card type        : Iris Decoder
>> 		Bus info         : platform:aa00000.video-codec
>> 		Driver version   : 6.17.0
>> 		Capabilities     : 0x84204000
>> 				Video Memory-to-Memory Multiplanar
>> 				Streaming
>> 				Extended Pix Format
>> 				Device Capabilities
>> 		Device Caps      : 0x04204000
>> 				Video Memory-to-Memory Multiplanar
>> 				Streaming
>> 				Extended Pix Format
>> 		Detected Stateful Decoder
>>
>> Required ioctls:
>> 		test VIDIOC_QUERYCAP: OK
>> 		test invalid ioctls: OK
>>
>> Allow for multiple opens:
>> 		test second /dev/video0 open: OK
>> 		test VIDIOC_QUERYCAP: OK
>> 		test VIDIOC_G/S_PRIORITY: OK
>> 		test for unlimited opens: OK
>>
>> Debug ioctls:
>> 		test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>> 		test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>> 		test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not
>> Supported)
>> 		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> 		test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>> 		test VIDIOC_ENUMAUDIO: OK (Not Supported)
>> 		test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>> 		test VIDIOC_G/S_AUDIO: OK (Not Supported)
>> 		Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>> 		test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>> 		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> 		test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>> 		test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>> 		test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>> 		Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>> 		test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>> 		test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not
>> Supported)
>> 		test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>> 		test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>> 		test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>> 		test VIDIOC_QUERYCTRL: OK
>> 		test VIDIOC_G/S_CTRL: OK
>> 		test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>> 		test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>> 		test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>> 		Standard Controls: 12 Private Controls: 0
>>
>> Format ioctls:
>> 		test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>> 		test VIDIOC_G/S_PARM: OK (Not Supported)
>> 		test VIDIOC_G_FBUF: OK (Not Supported)
>> 		test VIDIOC_G_FMT: OK
>> 		test VIDIOC_TRY_FMT: OK
>> 		test VIDIOC_S_FMT: OK
>> 		test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>> 		test Cropping: OK
>> 		test Composing: OK
>> 		test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>> 		test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>> 		test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>> 		test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>> 		test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>> 		test CREATE_BUFS maximum buffers: OK
>> 		test VIDIOC_REMOVE_BUFS: OK
>> 		test VIDIOC_EXPBUF: OK
>> 		test Requests: OK (Not Supported)
>> 		test blocking wait: OK
>>
>> Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
>> Warnings: 0
>>
>> V4l2-ctl Test verified for 2 streams as well.
>> ---
>>   contrib/freebsd/include/linux/videodev2.h | 1 +
>>   include/linux/videodev2.h                 | 1 +
>>   utils/common/v4l2-pix-formats.h           | 1 +
>>   utils/v4l2-compliance/v4l2-compliance.cpp | 1 +
>>   utils/v4l2-tracer/v4l2-tracer-info-gen.h  | 1 +
>>   5 files changed, 5 insertions(+)
>>
>> diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
>> index 0b1465842b3f0c0cfa7b6dd1802171c69b4753d0..6657998a11fdee9e1e3941d506a84f24ec2661a0 100644
>> --- a/contrib/freebsd/include/linux/videodev2.h
>> +++ b/contrib/freebsd/include/linux/videodev2.h
>> @@ -782,6 +782,7 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>>   #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
>>   #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
>> +#define V4L2_PIX_FMT_AV1 v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
>>   #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>>   #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>>   #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
>> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
>> index a1f30e0382914801c56c0ffec3a90186721e9c95..2503003f8ee6a04acaa9b8e564be51fd86c7dc8f 100644
>> --- a/include/linux/videodev2.h
>> +++ b/include/linux/videodev2.h
>> @@ -751,6 +751,7 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>>   #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>>   #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
>> +#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 (stateful) */
>>   
>>   /*  Vendor-specific formats   */
>>   #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
>> diff --git a/utils/common/v4l2-pix-formats.h b/utils/common/v4l2-pix-formats.h
>> index b0a7fe10bd5d439b2705da536ef4f80350dec353..135a06a8660f19e1787a00554dbc39eeb85b7091 100644
>> --- a/utils/common/v4l2-pix-formats.h
>> +++ b/utils/common/v4l2-pix-formats.h
>> @@ -260,6 +260,7 @@
>>   	case V4L2_PIX_FMT_QC10C: return "QCOM Compressed 10-bit Format";
>>   	case V4L2_PIX_FMT_AJPG: return "Aspeed JPEG";
>>   	case V4L2_PIX_FMT_AV1_FRAME: return "AV1 Frame";
>> +	case V4L2_PIX_FMT_AV1: return "AV1";
>>   	case V4L2_PIX_FMT_MT2110T: return "Mediatek 10bit Tile Mode";
>>   	case V4L2_PIX_FMT_MT2110R: return "Mediatek 10bit Raster Mode";
>>   	case V4L2_PIX_FMT_HEXTILE: return "Hextile Compressed Format";
>> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>> index b82d7dad326907d42edeb3d503cf4e6652fe9b6e..be0fd98537951485c61a1cd0df01ec0593eaf341 100644
>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>> @@ -585,6 +585,7 @@ static void determine_codec_mask(struct node &node)
>>   			case V4L2_PIX_FMT_VP8:
>>   			case V4L2_PIX_FMT_VP9:
>>   			case V4L2_PIX_FMT_HEVC:
>> +			case V4L2_PIX_FMT_AV1:
>>   			case V4L2_PIX_FMT_FWHT:
>>   				mask |= STATEFUL_DECODER;
>>   				break;
>> diff --git a/utils/v4l2-tracer/v4l2-tracer-info-gen.h b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
>> index b54ee579166c84c01403cd3f207f9a590ebd9e1c..bca4556edbd2dd0537b915dc62bade677fb80e41 100644
>> --- a/utils/v4l2-tracer/v4l2-tracer-info-gen.h
>> +++ b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
>> @@ -1422,6 +1422,7 @@ constexpr val_def v4l2_pix_fmt_val_def[] = {
>>   	{ V4L2_PIX_FMT_H264_SLICE,	"V4L2_PIX_FMT_H264_SLICE" },
>>   	{ V4L2_PIX_FMT_HEVC_SLICE,	"V4L2_PIX_FMT_HEVC_SLICE" },
>>   	{ V4L2_PIX_FMT_AV1_FRAME,	"V4L2_PIX_FMT_AV1_FRAME" },
>> +	{ V4L2_PIX_FMT_AV1,	"V4L2_PIX_FMT_AV1" },
>>   	{ V4L2_PIX_FMT_SPK,	"V4L2_PIX_FMT_SPK" },
>>   	{ V4L2_PIX_FMT_RV30,	"V4L2_PIX_FMT_RV30" },
>>   	{ V4L2_PIX_FMT_RV40,	"V4L2_PIX_FMT_RV40" },
>>
>> ---
>> base-commit: ea9e12ad2131e2471d719fbfee17e89f0fca71f3
>> change-id: 20260107-av1_stateful-04524166d097
>>
>> Best regards,

