Return-Path: <linux-media+bounces-45828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98903C14CC4
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 14:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC16F1A28414
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 13:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318BD302CB1;
	Tue, 28 Oct 2025 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spo2mL3B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821841534EC;
	Tue, 28 Oct 2025 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761657584; cv=none; b=ML4qfvwS/WJi3QEGLfd7uZ5kuiis6F+4aa2kcHyGnGarEjxOIljntrCkaA1dA+SjxFatlOUA6QX0ZsSpRghGWKyON7VaUP4884yTSWyGpvcDVhrD1TVn0LIXe95938UI9vbgMwcqqznEqQsJtobxlNJlaeu75v7LCibEvHrRLN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761657584; c=relaxed/simple;
	bh=223JSQ6JYTc4Lclqpz/2oqulc5LmFHo4h3MW2t2f73E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcoDe5c6IpZkZT10BDPUQ7wG+P+6UZ+/wYwAfCNUvsxAk+4d9Xs6sKHeHxLplwBKnzeU88lK+Wjir7jivNFnjC5hlbXD02jjtKwzfdhPcpy7RNXxNC0+M7ADGxBqwLYvB7ZfbJj+Xavqfqrz8Dv58JBtc4OZ26X+BUwpXbF0qRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spo2mL3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA969C4CEE7;
	Tue, 28 Oct 2025 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761657584;
	bh=223JSQ6JYTc4Lclqpz/2oqulc5LmFHo4h3MW2t2f73E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=spo2mL3BEanIEy2YOT8G8XBNkOWwqjsFwG/cT3YpPWFqPYZcAqK0wQqZ5zzYWnd1C
	 SXVrHlGvvkZ13ymnlWj7luw4j09gqI2nHlEBMpMQLkxDzwD0DendbQ2heDzVLSEk4I
	 k9S9VoZFL/JkqXHdkkcC/d+yUyu4NH38mUyY4yPs+NIRP+a3VaVl8vPkZfzEtolbyW
	 sPK3vyj5Tpa0rk6qY/yHAkumXhWIif8Hn5KcJHc/WEHLy+rw3/KkXeCyt03o0a/66G
	 mDLL2EcbjCc7XGKnm0geVa7HlMaVN0rSiOzvPJTkojbbrMSHiWu+OwTMDYupzrz9xr
	 tTwfuhypcL7vQ==
Message-ID: <c0dbc541-d321-4ce1-9d2d-0c4189ef752f@kernel.org>
Date: Tue, 28 Oct 2025 13:19:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: set default size when S_FMT is called with
 zero size
To: Val Packett <val@packett.cool>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <PAqEcmCHEfU40aJzxWzZEpPQfxYCXUAQ9a9lLgcqz47gzKU5z_bOvdOBleE7B3AIZ13bFrkW2ndB0eMgy2TQdw==@protonmail.internalid>
 <20251012235330.20897-1-val@packett.cool>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251012235330.20897-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 00:50, Val Packett wrote:
>   drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426..6be09d82e24d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -196,6 +196,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   	if (vb2_is_busy(q))
>   		return -EBUSY;
> 
> +	if (f->fmt.pix_mp.width == 0 && f->fmt.pix_mp.height == 0) {
> +		f->fmt.pix_mp.width = DEFAULT_WIDTH;
> +		f->fmt.pix_mp.height = DEFAULT_HEIGHT;
> +	}
> +
>   	iris_vdec_try_fmt(inst, f);
> 
>   	switch (f->type) {
> --

Doesn't venus do

orig_pixmap = *pixmap;

try_fmt();

format.fmt.pix_mp.width = orig_pixmp.width;
format.fmt.pix_mp.height = orig_pixmp.height;

should you fall back to DEFAULT_WIDTH/HEIGHT or to orig_pixmp.width/height ?

---
bod

