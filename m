Return-Path: <linux-media+bounces-53339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEV0IWH8nmm+YAQAu9opvQ
	(envelope-from <linux-media+bounces-53339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:42:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C519848A
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C976303DA3D
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53E53A7827;
	Wed, 25 Feb 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNVLptyJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B0333B96F
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026946; cv=none; b=Lp5M3ElDxwbSP9boN3ysuFngf+OzyXJgC4+ERhdqrGkU2xQ+wjPcENv1ZKC26eh4ohV+epVc0zqfQLQsR7+apK27OmO2NDe8hywEH3Xl8E8cec7sPShDocpqrjq2XKJffDAJ66wwk1b/GG3DSVTgPl/F+xIJoxlUtuyAuq8eUtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026946; c=relaxed/simple;
	bh=tYdjEGnz1EsZUC8A6iACOKdkEfqIBfxVguRN3pG2Qcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+HzHEy89BLqAZHu+HcHhuMDpzwIu3QdNi3XOUPEKcIskYLhS7niw/YoGr1nYJI1UlWoBiNNjWr8JWAt2VECOEer5ap0KlqpZ7SnlqIph0vRlhJ4brhYa7BXxcdO/hNbTkTkX/lQMHJIHG3VLyri9ccoE9BWKyI4j1XQHOSxi2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNVLptyJ; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-65c187dfc82so8573581a12.2
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772026943; x=1772631743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJfmcZ4qFbylZDu+uvn8Ui6nkXp001OEAlMyyRd9wXQ=;
        b=yNVLptyJpnb+yglreV+1vepyRiHjRXHdVbXezDmDD4QVNS5l3jXBM/oud+j4mntewM
         aDNGyvHc6LL83ULDaGiwNIfKWo9nwLIhx5u2jwuAFqIk3Q1ANYBbHtOIUix8WLMLnVkL
         Wa/AZ2wwxaM2RQa6hjbnxtP/j3DehXyQOqjumZI8txDrYiK6BM3IFSZyU2jrTu904QYo
         K0NeUwPnHQ9PzE2dDmL/JjzgQo4bQqSt5UIdODce0JawdFsyOHqZmcSd0MqNAwmW49Vt
         O1Ot3FpEFvz9Dy7D5vOm56aVXERfg32M4QbY5FABNr2lx0tCUPPM9hN+I6ysfNigHc5O
         Tq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772026943; x=1772631743;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJfmcZ4qFbylZDu+uvn8Ui6nkXp001OEAlMyyRd9wXQ=;
        b=MewDin8Wo5JGjZvy82xiaq2pjjTNVtnkuygXvvVCZkLz78cjHyiNER8Q8I/Wph/WKG
         KojyGb3ev4kACJ7lKl2kwoIBEndYelrtAFmTMBaFwwBSkyEenC8GPRf/HVTxPyVmydl5
         yv1r6V9PM3b4kcQFeNkmBdNn9slXnd8VJ77XlbYPjN8ruI0XBC+f5hs0yijtEVd4FM1L
         +K9l3yscwoSb23Zk2XrizEJXp11NQ1FtaYaxSNqF/taCz0GOTihT2TGJmXPI5N6toi9t
         p1Sa3H1O4NwHp7owqBJzSELhcMHC7v/U3V8I5hx2wVAsSEt/4a9l0U+jCZUI7mh7EPzU
         B+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR59+qBz88/D+Wp7QXiT/U9sorULwCetZo7XqkN8yv9sjpkslAOrGj1rU2mdcGBOxDsdw/kYvFF9kiRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZY2E1bxiTrJltcgJqlR3/v5Sl25jDt9fWMTlcRhy1Tykol28
	knT9iqn2bCDqf/oeJZQPJ2hLv4Em0TZoaWdR/4VD5N/A2Xsm1MCp789jKDaqMaEqXYc=
X-Gm-Gg: ATEYQzzskNJuZxh8zeIc2D8JCfy9MISb13S2jqWhwctbLNMxX4RrP1+HeRXBJVvrwE6
	o8Y/hrsPUrhT/d74Gg1wAoKDboJtFIf6F+7hrrqVbyqntSkYUsz1fIY52lu8p7NawPsmhBTH3M0
	LLYwPIHCNEGXAvMW7BBJE61vQg+C/WxrD17MOYpSSJ3v5+3yNrfS7nptPoNzDHJbE9q2/RzkmKo
	BlkCt5gB1c3LA6nB0XrS7B/9zWeNB5PicUqOQFcSi/oeAufoMxoM+Sn+J2LI8F0rq8iIOMwMON9
	xm2xWJMnfLxBd2ssTseu72vLSCmGaVWTTpCWnqQj19Uv6PCyZv155PKojeT7Tbjpo2taakrTcL3
	3g/g6vBn+nNLUVXIeWpCZXrW4VjmMg5J8YXwDSu+Y98Lfm/V/aoK1330O0BfL2Swhl7qlx5IVxe
	Wg0OBXgsh4UsiZ/KOfS58N1TQXm16h65u2gj9+3F2fCn0m/Gj3mYqS7mnqlvX36edj
X-Received: by 2002:a05:6402:51cc:b0:658:b76f:da7c with SMTP id 4fb4d7f45d1cf-65ea4ed5a89mr10428013a12.13.1772026942535;
        Wed, 25 Feb 2026 05:42:22 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eaba13806sm4384331a12.19.2026.02.25.05.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:42:22 -0800 (PST)
Message-ID: <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
Date: Wed, 25 Feb 2026 13:42:19 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <vU2QyEVqOu-D3eGp7BZFICUeauxL32bwWzeidOAijoeVaJTk8KcRVsaQQD4MdFQEcaQTZ5RkzRsz9-Lhl1qsqg==@protonmail.internalid>
 <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53339-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B0C519848A
X-Rspamd-Action: no action

On 23/02/2026 19:08, Ekansh Gupta wrote:
> User-space staging branch
> ============
> https://github.com/qualcomm/fastrpc/tree/accel/staging

What would be really nice to see would be mesa integration allowing 
convergence of the xDSP/xPU accelerator space around something like a 
standard.

See: 
https://blog.tomeuvizoso.net/2025/07/rockchip-npu-update-6-we-are-in-mainline.html

---
bod

