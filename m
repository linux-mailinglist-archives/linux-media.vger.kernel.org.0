Return-Path: <linux-media+bounces-60835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDjnJKm2/Gn9SwAAu9opvQ
	(envelope-from <linux-media+bounces-60835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:58:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA124EBABA
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 113CC30F4F91
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 15:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF6444CF25;
	Thu,  7 May 2026 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYQKnE31"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87103F0AB9
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169081; cv=none; b=IsLLsJOnFwoU+3ef+5zBIKQR0tONqFDspjTD+UipSc+byJKgoVbtBd6fzZygVo1EzbKNgPdkly4a4RNy3jZqNkaKZmoXdDLsL3RDp4e6eLyakwO4HNvo1YTR8vt6xIXfzJAUUVjCY/cptidqkb3VNU6oR/lmoTMU740CZLQH0KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169081; c=relaxed/simple;
	bh=Nh1ttZ7apvcu4spD78Oi7RZ4MQs+MxjT4kjH8gqR2QI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/GPkJiQwRrCwfOXpgpe+CRvSmPMXX5dtvzcshI9L6NAS3uNE8t8gxJ0hq5t/IAn0Ueu3fQ1g4LdXhrJkzJ4MM15l3DOS4bSw6dRLv/0+4TtOJ/TKRZxAuzDYl4JWTQYTnopRV0NQTi+7xZsafhBO8krNdjzFmBAaHo2n3qDy+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYQKnE31; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65890a6ca20so1057742d50.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169079; x=1778773879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2yYmWd9mJdnEyzzwS7hgRL4uZz7swPezTy7TkKWYGI=;
        b=PYQKnE31qqBqzjTYBs96p+lagvLcynxBhOLappefc0i87O6MwwGDTQkho7EAYN85+m
         hSYGpBNXRh77sLIkd4cFOQYVkcwYTF9fXpsnmKKSFVU+90Pco7gixGUXsRopWwA/l3Zl
         u0pXJoSwHNUco3Pn75FcZhjWOczRxpfGOa+cLNXTCFgiedMg9DkRyiJ0/kAQ+i0Ibnpq
         /V8MhPxXc1nytoxmUVp+9ZFBGc28SYcExWW88SXN8E26R52rT+hkMpEomO1qQhY3fAob
         q5FcTwUdI0Fxrzg07oNa5rzj6SDiDwgCaugsgHWKS2Oe0u63vWkVMm4GCC0CnfhFATCh
         UWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169079; x=1778773879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2yYmWd9mJdnEyzzwS7hgRL4uZz7swPezTy7TkKWYGI=;
        b=oiuZlpYcQdjVBIYNnzlHhEvt/CztCy/wVbgbh/q6cHU0IrNR6Kq8kmbu6ik3so0Yv0
         KgLR2SoDslNe+LNtZ7hUr08vL4iwgCDEPhpkbS2+7hygJmJEYqyIf9SNmb6itDHeBJGe
         csKknpdsbzFaDzyL83UZxjF7wR3dGprPFUny7n+2XLGXDW+whg8nHWYbujDX9rcgNn+l
         54s57E3iiI3RBchXl1apfOCKIdzPs5Cc1/mT+cNkUl7kAhNASsgC2yhaUhdmyI+67rX2
         jToY0htqaqGEfo9G2GabIFEnKDbtvz8kMsQlz1UDf9E4dWFIiZPuFw4LKaQ1978L2AyI
         pwDA==
X-Gm-Message-State: AOJu0Yy70B9ln2/DUR5576gL/6sHlu+wVrXGfjYsWbjFzLheDWGfUkxi
	epW7sPduGACze7bmde6l+D+A/NqJMU9eCiGgS/UhgeNgKY6zjXlaQ94F
X-Gm-Gg: Acq92OFo9D4lFclhPu3ehDW5n0GBlG1SG5NV29j7qKnVvWaSGbIZ4WL48GyMD1Ofz9t
	bnsr78gw73mRlVnl+e0gV9N07u5s5HsmT52/ooh+4y4q96uwdqRd4YU1Ptof0Ga9+TI4YBAFT1F
	bH5IbitUeID2DL6Mp853nNQiv6LqKAd6EAxHnT8j1p0ppesdiO3+nxE8loWkmkfg88VEfMuqWMq
	mwqvprUniOzK2t/4bH3IDbzJCeLSru0ntbMhi9jfQfK3fkZZ96C2MPAvJ/Yf1zh5M1uFjfz2sKG
	EOeZXt9tnRy76FXnWjwb6PtPg/PhQw4DrvVmMqrKpNDhKs1pdQBROE0jIdY9uAZoyj5l2ZhahmG
	E4YwtgV1x0D9fq8Sdu7tqHBNBnVz8yEE5iyWZCPB8WmUkg6BdKdVrZVMxZXlbtOVORbMbBgIuDR
	DFY6WQp4eW2R1Qa06VFpNp1iUr3xypNt0hq6IH
X-Received: by 2002:a05:690e:144b:b0:65c:febd:c0b7 with SMTP id 956f58d0204a3-65cfebdc8b0mr5697087d50.20.1778169078832;
        Thu, 07 May 2026 08:51:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65d901b9275sm73091d50.11.2026.05.07.08.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:51:18 -0700 (PDT)
Message-ID: <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
Date: Thu, 7 May 2026 18:51:11 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>,
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
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <614a087d-d219-49cb-85ee-772044558649@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3EA124EBABA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60835-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/7/26 4:37 PM, Bryan O'Donoghue wrote:
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-
> from=cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.h264 -d /dev/video1

With the patch kept:
v4l2-ctl --verbose
--set-fmt-video-out=width=1280,height=720,pixelformat=NV12
--set-selection-output target=crop,top=0,left=0,width=1280,height=720
--set-fmt-video=pixelformat=H26
4 --stream-mmap --stream-out-mmap
--stream-from=cyclists_1280x720_92frames.yuv
--stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Capture Multiplanar:
	Width/Height      : 1280/736
	Pixel Format      : 'H264' (H.264)
	Field             : None
	Number of planes  : 1
	Flags             :
	Colorspace        : Default
	Transfer Function : Default
	YCbCr/HSV Encoding: Default
	Quantization      : Default
	Plane 0           :
	   Bytes per Line : 0
	   Size Image     : 708608
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Output Multiplanar:
	Width/Height      : 1280/736
	Pixel Format      : 'NV12' (Y/UV 4:2:0)
	Field             : None
	Number of planes  : 1
	Flags             :
	Colorspace        : Default
	Transfer Function : Default
	YCbCr/HSV Encoding: Default
	Quantization      : Default
	Plane 0           :
	   Bytes per Line : 1280
	   Size Image     : 1425408
VIDIOC_G_SELECTION: ok
VIDIOC_S_SELECTION: ok
		VIDIOC_G_FMT returned 0 (No error information)
		VIDIOC_G_FMT returned 0 (No error information)
		VIDIOC_G_FMT returned 0 (No error information)
		VIDIOC_REQBUFS returned -1 (Invalid argument)

With the patch reverted:
v4l2-ctl --verbose
--set-fmt-video-out=width=1280,height=720,pixelformat=NV12
--set-selection-output target=crop,top=0,left=0,width=1280,height=720
--set-fmt-video=pixelformat=H26
4 --stream-mmap --stream-out-mmap
--stream-from=cyclists_1280x720_92frames.yuv
--stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
The pixelformat 'H264' is invalid
VIDIOC_G_FMT: ok
The pixelformat 'NV12' is invalid

Decoding breaks if I revert the patch as well, it fails with a power
collapse fail.

