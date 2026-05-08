Return-Path: <linux-media+bounces-60929-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AzwKtsH/mkxmQAAu9opvQ
	(envelope-from <linux-media+bounces-60929-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 17:57:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 121CF4F9152
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 17:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434DA3064651
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 15:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126B03D4128;
	Fri,  8 May 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgFjvecf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF22E37FF45;
	Fri,  8 May 2026 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255749; cv=none; b=dkR0FdQ03DJW80gDTLQCwY3xf7NqeU4KWxiw+keK1DF5sp194jLe7m1Iwf52A8FQb0UXq8mG57m5C7EdyrKJfU6ADawiZbRO5XWns0w0atHAIh95F/klR9FFWarhPtUW56xwbAJToeP5z2GC8LsxnAQIlaJHzyDoAJQEmHyJWas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255749; c=relaxed/simple;
	bh=tQNMO77q1RoFS2peTCeV+chY0UHWgS+ahepCs6y9Ctk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPHXcahxIPO+ZVwjBvw3aaFQsLrhDuzrpDY12DC8rpW5HZMaAS3rra9xsCEpYTlh8H9gVZKRg5wtVeFSR5ESzaYzSf38eSrsg7hMZZquZ6qHm+qWTM0Br+LNN06Am2SyG6EKuf0tUqXCvWrtNT/jjHNLBO5O2vHblG6XbuebKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgFjvecf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EE9C2BCB0;
	Fri,  8 May 2026 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778255748;
	bh=tQNMO77q1RoFS2peTCeV+chY0UHWgS+ahepCs6y9Ctk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kgFjvecfojaqR78q3o6iDGs+GwLXxE3ijza9xULSKjaUZw6YIzXHSHuR853JNtLPp
	 qFaJXLnGL9paEPyR1VJ9kimT7O1+8rqWJnWhqPUxpuhLqPODM5Fmcm7QoHFctGHnBL
	 8B9dH5vU39E/8tDzB18G2UaZGshRkpG+TRCMirmpn/JawTHo5L45PrIA2nbGTzhi/A
	 +2ruuC3zmP5RwK1dVu/lpb8CJ3Yj0Zoeg7MdPK5nLM1b4izkEqiRlODCqDXalxTz0u
	 H1KxN3ekmoxHOJXJTwx725F41oCVJ1ikDvq3SEIuBpv3MImCWOKujZe0FskUp3jB2A
	 Vh5kUp1Qk/myQ==
Message-ID: <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
Date: Fri, 8 May 2026 16:55:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
 <f5TsKnC12rLsH63vAi01aN4oXUFLrfgIhn14IQFDb9gcac6anLzzhJdkGNdQ2dRs4vYbFKUptfEgWuKdgIgGsQ==@protonmail.internalid>
 <20260507-msm8939-venus-rfc-v5-5-d7b5ea2ce591@gmail.com>
 <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
 <CYaHtccGOWlaUtl3QIKva44ybJiRHsPOZmHEkl2KKGmnDxJ8vTH-SVNMGbL7bjkYjI692nplORzOhpfjs3XJfg==@protonmail.internalid>
 <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
 <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
 <tawGGT4rtpw22Ng-MgM--GhoEihBU7tY_TrFUHf8raMKApyqTcSkKHyfSuRIL_bqNp_5zWD4SBG_C4c8CB7_6Q==@protonmail.internalid>
 <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
 <614a087d-d219-49cb-85ee-772044558649@kernel.org>
 <Jxt4BbN1dL8VKh_Zjah1xecAjz3c9VfbhKSm4a0K2D1MNKfJKIFnCPLj2VvdW1q4LnMIQy8bCzV3YoVnLFYUlA==@protonmail.internalid>
 <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 121CF4F9152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60929-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 07/05/2026 16:51, Erikas Bitovtas wrote:
> 
> 
> On 5/7/26 4:37 PM, Bryan O'Donoghue wrote:
>> v4l2-ctl --verbose --set-fmt-video-
>> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
>> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
>> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-
>> from=cyclists_1280x720_92frames.yuv --stream-to=/tmp/
>> cyclists_1280x720_92frames.h264 -d /dev/video1
> 
> With the patch kept:
> v4l2-ctl --verbose
> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
> --set-fmt-video=pixelformat=H26
> 4 --stream-mmap --stream-out-mmap
> --stream-from=cyclists_1280x720_92frames.yuv
> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
> VIDIOC_QUERYCAP: ok
> VIDIOC_G_FMT: ok
> VIDIOC_S_FMT: ok
> Format Video Capture Multiplanar:
> 	Width/Height      : 1280/736
> 	Pixel Format      : 'H264' (H.264)
> 	Field             : None
> 	Number of planes  : 1
> 	Flags             :
> 	Colorspace        : Default
> 	Transfer Function : Default
> 	YCbCr/HSV Encoding: Default
> 	Quantization      : Default
> 	Plane 0           :
> 	   Bytes per Line : 0
> 	   Size Image     : 708608
> VIDIOC_G_FMT: ok
> VIDIOC_S_FMT: ok
> Format Video Output Multiplanar:
> 	Width/Height      : 1280/736
> 	Pixel Format      : 'NV12' (Y/UV 4:2:0)
> 	Field             : None
> 	Number of planes  : 1
> 	Flags             :
> 	Colorspace        : Default
> 	Transfer Function : Default
> 	YCbCr/HSV Encoding: Default
> 	Quantization      : Default
> 	Plane 0           :
> 	   Bytes per Line : 1280
> 	   Size Image     : 1425408
> VIDIOC_G_SELECTION: ok
> VIDIOC_S_SELECTION: ok
> 		VIDIOC_G_FMT returned 0 (No error information)
> 		VIDIOC_G_FMT returned 0 (No error information)
> 		VIDIOC_G_FMT returned 0 (No error information)
> 		VIDIOC_REQBUFS returned -1 (Invalid argument)
> 
> With the patch reverted:
> v4l2-ctl --verbose
> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
> --set-fmt-video=pixelformat=H26
> 4 --stream-mmap --stream-out-mmap
> --stream-from=cyclists_1280x720_92frames.yuv
> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
> VIDIOC_QUERYCAP: ok
> VIDIOC_G_FMT: ok
> The pixelformat 'H264' is invalid
> VIDIOC_G_FMT: ok
> The pixelformat 'NV12' is invalid
> 
> Decoding breaks if I revert the patch as well, it fails with a power
> collapse fail.

If you declare both as decoders can you successfully decode @ video0 and 
video1 ?

ie be sure the error is encoder and not core specific.

---
bod

