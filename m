Return-Path: <linux-media+bounces-45172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85946BF942D
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 01:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 471063BB97F
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 23:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B3A2C21D4;
	Tue, 21 Oct 2025 23:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZVqnZNw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77C1DF985;
	Tue, 21 Oct 2025 23:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761089957; cv=none; b=faOrI6quPZn92oM8dIJzVLt4EGyxeJMxIQre+febua0l/JYsmG1IU1NruNfStCt7hssxrfYrbpjvnctI6Fnp+P9MvwkwndkQsjBvlZGp1G/Ysb2ShGL7E+XEk7MlD4qg2EBiNCF9iNwjZUfR1f/JorMJKpvSsLyoM6ZPkM97v2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761089957; c=relaxed/simple;
	bh=v3PRdK68VHgVDa+VkaT4X6q55bE9Q4pru+pazvQtp18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUCIB36PMDQudNw2LQRwbfPE5IM/YQVnLQSf1Dx/u9Fbd3xoxybhvxy+JGIpPXeb/N0gXnbvfsYPlw47btyr3VETOSA+UdfH5lsNRDvH5SCWrn7d2c9vw2ujyAjGQkwq7LOsyWXevXIPqzZHiaTFJOgu0/Xs2GKdprAzQXZaZxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZVqnZNw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0E2C4CEF1;
	Tue, 21 Oct 2025 23:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761089957;
	bh=v3PRdK68VHgVDa+VkaT4X6q55bE9Q4pru+pazvQtp18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YZVqnZNwjSpHTTFwWTVJsV+6iMS4CUtXWqTPaenWeKFLDrNcs6WjnUD1RYPR7RJC7
	 Fhalfk3N9RnvS/+4vOMP2R1dPt5yLo3lzQ8X5KZRMFtD+OmP6Xb7ZPG2e86dn7x2fi
	 alZirKgmKvXNzH++z5uUkgvcnNRabn3OuovyYMJiDqAW5y82AyGLHO9ZdStfNgbwHV
	 0aLcvr4fKtZW876QnFiNYFLlGUWYdJ2SXqwFKbWa6rjo/zJjTUBQ6y7knY6peK4jR8
	 wANNDXG9h9/NKbpUVgVz71faIMo/Oa7M6wcYCjimeI5ZR8YgC0q+aSTd/UOiilUuDo
	 pnozTrpNe65AQ==
Message-ID: <9d39841e-d2c1-46e9-8745-1d4d8d073739@kernel.org>
Date: Wed, 22 Oct 2025 00:39:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] media: iris: Add platform data for kaanapali
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <bRFGFB-aXU67uJWfk8UwBE0tOCTXpquadL2rGHbdcoY0nEdQ17cATN_K1Khk6RWZ8cGONLIs9N6XLd_pe9CHOw==@protonmail.internalid>
 <20251017-knp_video-v2-8-f568ce1a4be3@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251017-knp_video-v2-8-f568ce1a4be3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 15:16, Vikash Garodia wrote:
> +	.fwname = "qcom/vpu/vpu40_p2_s7.mbn",

Dmitry pays more attention to this stuff than I have but, is this a 
released firmware ?

If not, are we sure this _will_ be the correct name that hits 
linux-firmware upstream ?

---
bod

