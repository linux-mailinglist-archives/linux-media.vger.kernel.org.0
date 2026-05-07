Return-Path: <linux-media+bounces-60792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A1fOt+J/GleRAAAu9opvQ
	(envelope-from <linux-media+bounces-60792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 14:47:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E3D4E868B
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 14:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E6EE3023DC2
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 12:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C653E8C6F;
	Thu,  7 May 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khRdqhCB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692253ED131
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158019; cv=none; b=ckibeqaIKTS2oi89rQkn6lDu4tDVlaOQoS8MRET/pLDWXb9+XRUqpnhHpWP/Z5N4z84ee7nREbaAtYsFEl5ngR4m5t+ZlQ12fab81ElBcuHBvN5Kurq96x1gjj1PEDb1Ab3VTDOHlnKwqc9pIZJalPE8+GofxHM8uDxVmfg2NTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158019; c=relaxed/simple;
	bh=LsNPzTYb4vC/IRp9aPkuk17mGNMZ2iBsyvpkcKxGmAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8qm3wR24WnV/XnZ1de8Hy193VpzDfwwKDp9wrXZUeMHq5UKyeJFUbuSQlWzste4vxjpDIdlpQsSvUaGfzG1gXcaTM8aWdgP3hWVTn5W4oI2FMoHOi9Zhiw7jSmUrfIHx8ucOBeu6yA1C2T7eQhIt8Z9Ydvfw4Gb9qRUhoYM68o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khRdqhCB; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6563f83ae9fso759317d50.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778158015; x=1778762815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqpck66QhRsxNb0AyaQYMFfCYd0FYECyWms2Js1iBwA=;
        b=khRdqhCBafqTwjkbsQBn9aig8F1i7BnjorBwmCPfuM/v7waJLlT8fzHFSn2AsXeYM/
         vo8m6B4r0/0EcIQUHxZp8kUnmhHuQyQ0qMw9SeVtQizMsHLZDfWluPXEuGFTs/0wAyvZ
         o/o5Ngw6g7XazWVgPSvU+sMSS21k/KDmsS0V3j1wpZXpM2MCMsD5arjgtak3D2FSiqXI
         77vJXPZtC/zbZr8OSrRRlKB6IjyxocUQRoI+hRYJ2zC/2XIbXMpdXRlFst9eZVA0VmCx
         dMJhtmK8Yb0B/9o+gmFEQTKIf5nbX3i6/0F9urKmQ1NY0HzjD6WR4PC8Yxr31Su7NaAP
         msWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158015; x=1778762815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqpck66QhRsxNb0AyaQYMFfCYd0FYECyWms2Js1iBwA=;
        b=Yi2/Ccwze/i90TmvWO//Cuohtx46JcIs9nbSglwz97FsFTxvfjUE+ribqonU4gBU2x
         nFzMnsd9rYntGLKmRG7NZf1TwLmB+WgPLkmd9/XA8HWTOLR/6KhiO1d/XKZ5S/r8DV2N
         5AXRePV09M97grB8BF/T26Yu/6KTVPvXZPQP4BaGspOb5zW+vOtKbEdHjLgeGEM0f0ya
         kXWkkzsn8ZmddJf4cUTPifDDDWeNptUHAm0rTq3pcNRoPuYTck+2i04hG1fbGEJgeaY+
         VtTUclXZSqYmAQYAeFqhNlaHMMcDcXu/W5NElOiN4QoZ0yRpHepgjC7/0cEq1TAuvr5q
         /Rmg==
X-Gm-Message-State: AOJu0YxOFdmkvFjWywt1texvBH7Xr/bjpH03hQMVpqt/wJxkEpaFAna3
	poNGoT9tVkyKR4ZTnR4p1GI5tuoDWv/ntdjCDEzKugZ/QXb67cJSqCZ+
X-Gm-Gg: Acq92OFE7PohI2a9oDEsxoFYyNZo43HJ7QFhsmPP6pwZZBntC7dWXzA5XnKDvZPV2Ea
	aK+ol2kdQM9G2K52Bnf1aE9MlJRAbsGGTPxxmiUM1WNzhryulm7dN4aK1F5L/iNuezlVxvw07RY
	yrOu76gVbyJJhnplfRrfcr8KRI1k5aStHV34Rd8lFtl7I7x5luCR1E8iLxoiHn1nU98qoTcOEOR
	tlmOzbxo0QOhuH+KDivyI50MECHuAmBfHS5/DJGrsMy6r3JQVHW6ifUK4ClL4N96xC0hID9krpg
	95FCswrlQZ9yMkc6T6w3fJu55VBMXRz9MpkWx7V2IIxaCK7qQ5CopKLXjmzKB4RyLb/68dkPjNL
	8JzzfCCz2PtYzYEuRBQZmXIiiCN1+3QkCUeNl+ffqBlXaDqH6w4Vfp8THoH7oWP/7L0Axtb8SB4
	S4qBOTbAZDLNSBTZrkmbL5O3WJXWaXa06yeKl1
X-Received: by 2002:a05:690e:d05:b0:64c:9f31:e33 with SMTP id 956f58d0204a3-65c79a23920mr7669550d50.65.1778158014778;
        Thu, 07 May 2026 05:46:54 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65c7abf5e11sm2468850d50.0.2026.05.07.05.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:46:54 -0700 (PDT)
Message-ID: <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
Date: Thu, 7 May 2026 15:46:48 +0300
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
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 28E3D4E868B
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
	TAGGED_FROM(0.00)[bounces-60792-lists,linux-media=lfdr.de];
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

> Try:
> 
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-from=/
> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.h264 -d /dev/video1
> 
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=HEVC --stream-mmap --stream-out-mmap --stream-from=/
> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.hevc -d /dev/video1
> 
Sorry, but I couldn't find the file you were referring to. Do you happen
to have a link where I could download it? Thank you in advance.
> ---
> bod


