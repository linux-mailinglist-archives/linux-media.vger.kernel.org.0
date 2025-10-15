Return-Path: <linux-media+bounces-44612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B384BDF823
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 18:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E643189A073
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 16:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2886349659;
	Wed, 15 Oct 2025 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHh1VLkw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A8A29D277;
	Wed, 15 Oct 2025 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760544014; cv=none; b=PRJ4CtuRrSdTO1UXEZy/U2vGF4SJ/B1g5GVkwDjxnUg/jOOnGHMK+Pw9FNx8Nj5m68cwG+s+1rDtqkMLNEG0l4/mfKd3nZCbqSQXCej1SwyYR+xz+tIutRQ1pv34+1WERKxCLZG8AAaa/knf8eLIGjLPxXen1nFk12uwGneBhU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760544014; c=relaxed/simple;
	bh=lzG3SiictJPt7H1wLRa3zTke5BdsXsZIMoHsaeuSMRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojlHqysWKM5fZMoc+4tu0w354GX+npGdy2wdpLo+snOC3AB/C4nwdf8rN3QfCFhxxg/LkEavOGEtnoBamFKiXpvqEO0GYF/q5cH9tlY6Gm1foUbwyHKDmbLK5LFv8U8UM17q2o2H8zjBrvVH5C1KEJa6L5uwzmZnHeVRXMoxbvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHh1VLkw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCB0C4CEF8;
	Wed, 15 Oct 2025 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760544014;
	bh=lzG3SiictJPt7H1wLRa3zTke5BdsXsZIMoHsaeuSMRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UHh1VLkwm8Fsc3JzUYoaGl+HrdoFLeOaR1Dk3PVkvz5fBjurRfy7redoUdICwNCe4
	 PukLzrlgHq3gNCK2MH93l4hP9dXbQgPubS8oQDhnmh+rGBCPaTPxOFQELhy63PHpeF
	 P/OeKFOdByYdd5SbYen+22f4Gzk9st7RuicBsFF5JOPIZ313am48tOpEcKxQ/pLLJP
	 Xr3MuRMu1TTNggvepLkV9SoScaJQ7QFP3A19sm/jesbiYQ6qLR5U2RO1tlgeU9rKCh
	 JpAr7JGlQuqJ+S56S4D3NO0QjNXcGVvG2u7mSArBl4aw+WAiTskd6GoiIfUlMpgXmk
	 YfA5QMeOVcgDg==
Message-ID: <a1edafeb-af41-4c96-8c39-a327528e0802@kernel.org>
Date: Wed, 15 Oct 2025 17:00:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] media: qcom: iris: Add support for scale and
 improve format alignment
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 abhinav.kumar@linux.dev, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
 quic_renjiang@quicinc.com
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
 <1pcfuFRPOvlbfcSRFpaPmuhVvjNGodlAA-7UuSbGcqo5JUEv5bhYSaVjnriJNG4fpngOAgeasXFZDGVWzX3ZOg==@protonmail.internalid>
 <20251015092708.3703-2-wangao.wang@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251015092708.3703-2-wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 10:27, Wangao Wang wrote:
> Add output width and height settings in iris_venc_s_fmt_output to
> enable scaling functionality.
> 
> Add members enc_raw_width, enc_raw_height, enc_bitstream_width and
> enc_bitstream_height to the struct iris_inst to support codec
> alignment requirements.
> 
> HFI_PROP_CROP_OFFSETS is used to inform the firmware of the region
> of interest, rather than indicating that the codec supports crop.
> Therefore, the crop handling has been corrected accordingly.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Generally a patch that contains and "and" could be split into two patches.

Please do that here.

- One patch for your alignment changes
- One patch to support scaling

in whatever order is more logical.

---
bod

