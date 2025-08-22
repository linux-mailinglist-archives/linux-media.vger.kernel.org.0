Return-Path: <linux-media+bounces-40804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906B8B32552
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 01:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DE5B625C48
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 23:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D10C2C029C;
	Fri, 22 Aug 2025 23:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UietGIt3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647E419DF62;
	Fri, 22 Aug 2025 23:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755904392; cv=none; b=fGc72AnrPbyqq7Z/8i12NbgUQgyEmzK/p+XdybL4vAtRMLh2PFmTBbTF5pHO+SMIdkKne+ptvFxFJIffMpDWAyqbyxF31ZCor78Yl/oQ0Te2nDu9ibDxM9XHfD476NGAAClFriQ1Ssb8R3LKgFL9a0fIpFCTaTOvf8S4sbUlvTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755904392; c=relaxed/simple;
	bh=I5xOOlTlsl1gEAyBnvuWnA9gnCaou1eiZGWyj04CjLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=d/sMGjjE/y4c8p8rR3Z5TzDRXFrvl/AjaPyNyju3waU/JS7gHGyzrCfs3r516YchKPP96SiKsEycglZtacNSONP7qw2zZPdJuv2jEylhy65rNeA2uNMUlrMs1FCv8UOBZVCKmriHMBRyVPhHzKafs2bFsOwzVHdDQZWz9RNM96Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UietGIt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C891AC4CEED;
	Fri, 22 Aug 2025 23:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755904392;
	bh=I5xOOlTlsl1gEAyBnvuWnA9gnCaou1eiZGWyj04CjLU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=UietGIt3h77y7zuiq7YFhM0VrpywFhju+K18giWmvLQWsvo2dxbQ029RiXYcXPVkV
	 sTlj4fug4t6/d35KEWd17rr32OB3DJvf12ijkKS/Jb/s7Dz6xX2dwQ+hvuzOWmGRXs
	 u7zHlaqmxMkMZt0w4dqOZ2E4WgPm2+prJDKCeydXHZEirmCIP6tFEzCkdQpbh619Ji
	 bW5OQZYmqxI/RmYefQTiCxiAeZpkDvXDUvgS5b1nXARoR64pTOqy8SlqbgOk0+Hy27
	 4UuMtVTdrUItneUpNqVHyBTj9WMqiONRd8eTjOHmQoU/6SmCktcnRwFAgK3Vvgpk/z
	 SuzXpPfTRlrFQ==
Message-ID: <5489a439-e628-47a1-b3e9-e1d0f877b7d0@kernel.org>
Date: Sat, 23 Aug 2025 00:13:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] firmware: qcom_scm: Add shmbridge support to
 pas_init/release function
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-6-mukesh.ojha@oss.qualcomm.com>
 <de4b4872-061c-4f03-ae1d-1ad93b35ed71@linaro.org>
 <Qfxl6YfI0Dz_tCk9ukTFlrQpwm06pE4E4DCyITA5T3qnF2lsXpwAvLSttPsnMQb60UyKLpC8Koz4aSYwuoP4Qw==@protonmail.internalid>
 <20250821170337.y7vzhtiugaeydqmh@hu-mojha-hyd.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250821170337.y7vzhtiugaeydqmh@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2025 18:03, Mukesh Ojha wrote:
>> Please review the error paths here especially WRT to qcom_mdt_pas_init();
> Sure, will send the fix patch for the existing bug.

In which case please structure your next submission with bugfixes coming 
first in the series with Fixes: tags and then apply your changes on top 
as a progressive set of changes so we can apply this fix to -stable.

Don't forget to Cc: stable

---
bod

