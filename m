Return-Path: <linux-media+bounces-48524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 189ECCB1876
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D60B3006454
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B3F1E47C5;
	Wed, 10 Dec 2025 00:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaqhtgfL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845BF1D5CD1;
	Wed, 10 Dec 2025 00:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327299; cv=none; b=hVodAZhYBlNuZhSVHOHof6e6HqYUk6ou38rHDsXddeBOvAqv/D+PHZO5TO9RGuZq/Cgpg0oz2EnyiIJo53H3PVPswg0+c03pZYA4HcqMOG3r0yVpQIb5AbgkMyDZl3sztryfAWA/A2GTduh9COaM10Eprv0KaNNO24vmZVSw97o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327299; c=relaxed/simple;
	bh=5ve37C/iFYItF3dXh8eAL/9KuKB+jtz25GT/GIGiWb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+jEMqbQfPctWMc6BAKf3Z0lwPPZZwi3rHArG93Kk+9hCsCF0svjlhq1uD9WnJdoAkyi99Urn1wW53GZ6c9OurL5adJWgEOSc8DRdmwS8qxsgRwc684EeVsAGBhKGh7ICxtgLPhoRgZcr5gzMLi1DbgFOk1X2C6s0TCVRMPFE4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaqhtgfL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F83BC113D0;
	Wed, 10 Dec 2025 00:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765327299;
	bh=5ve37C/iFYItF3dXh8eAL/9KuKB+jtz25GT/GIGiWb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iaqhtgfLKixsnxoXE/JepfwhAVYLSez6N+WMiFasP2eCXiLhZg3vbn5IYzPjeh3Z+
	 TP0SoKW4mu5CXv3HDTX0xTOnPwZgsTEEGGKUfgvwtOVnIST3PWkDIjybCrVd/GX23m
	 cFm9JLoddIOvIzVAzqL+wLgABUPhCAVC2qeopmiyeEIoT9j5l3uH68P5Bkr1DthOOs
	 Q5NbEL9le7QF8EFQC5C5tU2YwlGTZxoBl4FYfgVFT5+qgLm3qyDzNNMpM1a8QzdPXj
	 WsCoM7Qd5wMgbzdOtnT/O8nNYGxU5nYa/HykJfqYTt0UQVwpERJY9G/K0gvIvK2xtA
	 ghlVKd+/UcADQ==
Message-ID: <611c84b8-e982-419c-9d58-284319b226e0@kernel.org>
Date: Wed, 10 Dec 2025 00:41:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/5] Enable support for AV1 stateful decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
References: <XWtaMcg7lGClZ4pwr8czLvqGdhEXidF54raCx36v4Rahfsker2E__wKY0i87ff9Os9OAZxAepPTDFO00wvXLlg==@protonmail.internalid>
 <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2025 00:39, Deepa Guthyappa Madivalara wrote:
> - Add inst_iris_fmts tp all the platforms in gen2 (Wangao)

Is this part tested or just added ?

---
bod

