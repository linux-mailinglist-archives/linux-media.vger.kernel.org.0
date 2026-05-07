Return-Path: <linux-media+bounces-60807-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J9aG6OV/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60807-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:37:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA764E95CD
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B84E13014400
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16B83F9F36;
	Thu,  7 May 2026 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzsNHHA6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2AE317715;
	Thu,  7 May 2026 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161041; cv=none; b=H57xtQOsYYE+5BF6JyvvDfoHJqy1BM/Iso1MbR5IMoI/CwZLKgSAFYsspN6gS0vPx3u67obKHh6UzMmEYsAT25n3DhkVVOusWXtwarV6x1G9j+280f80Bz0ofd87Qcz1QBNg8Tvu1vW7p+DQ4qpHO5Uoa2d8dPTgu716Es9+jqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161041; c=relaxed/simple;
	bh=uDgYd9wh4Z9uLJzVcDJBnzL4XsVwe1cJlFbdJ08Kj0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5Y5inRe4u9cmlFdj5XcbCIcP8YtMztr6izZ5QrWAs7OFBGlweoKX5jNBbZB63z1Ruj5XOYtsaDFz04W4ig0HG3HOlBSxaHcIyiFWrXHiID3TDn60pD+S5DshRiRyiJnHjfJnSrXOEwUaRw+zEi++757Iqu7oGNkbaXHMIfV5M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzsNHHA6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B84DC2BCB2;
	Thu,  7 May 2026 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778161041;
	bh=uDgYd9wh4Z9uLJzVcDJBnzL4XsVwe1cJlFbdJ08Kj0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KzsNHHA6beTFahQZ7Pi3tQF+/zMWTVg6scWEkqAYmrC3+ysDGZ5syFyjCw1oavkv3
	 9d8RANik2DKN7viWqESognvyAfNP0L0pIRlpIHo0rsN/DqUlqz9np4p3FsV6vDdPyu
	 +46yByKJsfJdlj6KOyXSuLMUcDQO+1ScOsriKWzoEITUgKNjwIpXQKCvBv5sDEPRkJ
	 UgZLUsKrngxRx6UAEkY2ZfXnHTitu4xs4WbYl7TJJPH0LRmFjcnOmWfKXokMBfXAD3
	 Zr775i2S1thuIK1ZYsRg6KcKJNaCrP2txRr4ssopAKx4hbEEjcVSdUl09DDYLNROUn
	 TuQgNRGJ7AENA==
Message-ID: <614a087d-d219-49cb-85ee-772044558649@kernel.org>
Date: Thu, 7 May 2026 14:37:15 +0100
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
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1CA764E95CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60807-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,xiph.org:url]
X-Rspamd-Action: no action

On 07/05/2026 13:46, Erikas Bitovtas wrote:
>> Try:
>>
>> v4l2-ctl --verbose --set-fmt-video-
>> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
>> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
>> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-from=/
>> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
>> cyclists_1280x720_92frames.h264 -d /dev/video1
>>
>> v4l2-ctl --verbose --set-fmt-video-
>> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
>> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
>> video=pixelformat=HEVC --stream-mmap --stream-out-mmap --stream-from=/
>> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
>> cyclists_1280x720_92frames.hevc -d /dev/video1
>>
> Sorry, but I couldn't find the file you were referring to. Do you happen
> to have a link where I could download it? Thank you in advance.
>> ---
>> bod
> 

wget https://media.xiph.org/video/derf/y4m/crowd_run_1080p50.y4m
ffmpeg -i crowd_run_1080p50.y4m -vf scale=1280:720 -pix_fmt nv12 
-frames:v 92 -f rawvideo cyclists_1280x720_92frames.yuv

v4l2-ctl --verbose 
--set-fmt-video-out=width=1280,height=720,pixelformat=NV12 
--set-selection-output target=crop,top=0,left=0,width=1280,height=720 
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap 
--stream-from=cyclists_1280x720_92frames.yuv 
--stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1

---
bod

