Return-Path: <linux-media+bounces-62228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DxBMbt1DWrSxgUAu9opvQ
	(envelope-from <linux-media+bounces-62228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:50:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1FD58A1E2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDF59311A3EE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7193B7776;
	Wed, 20 May 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAD3xE8v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E033AD528;
	Wed, 20 May 2026 08:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266397; cv=none; b=ct2cw2EWIpCMHzA5en2rVXrb6f7K6ymDDW8/POF1FfljwKZkLAb2cukPZ3qbUq4SH8r7aUrV1MFWmaovOliWcoUT9Ym1gBtBeqlwXnp+JlNYD+yMq6387IXQULL+3i5c74VdYiPXSwYxzpGNxN4FC1UJOULzBqEdb+S+w+IWDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266397; c=relaxed/simple;
	bh=Uqc2DbFiBx4ecAKgG0sD981oROOSKoSCKv7AsMzBA6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYarTqNSfw4tzASIPE9lq7F/9wZhns1svCMAlJjw9pWvhhtFFUOjpvzAE6nMAkRbxdpzqmeCwe/1sekaqlVqafnTSN50AKGg+EKSkwIuG9CO0XEHuMx5/1/P0mjbpC4Gs2pbu0CQuHWVglj0mnGnZwda01YQQIz0hC7asvIzkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAD3xE8v; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCC81F00893;
	Wed, 20 May 2026 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779266396;
	bh=K5bQtFywLpFI355A9uvVb884nWw3M8eODnk7osCesEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OAD3xE8vCMsfmUbeQH1CUJX9PvNy5dahTu7K8x8M+dC9nF0fInQ4XLDWV9GIL2njX
	 bDEXycCdfaraMxXfv9k5YN/u+z/I3s+QEzHFtdDjuMEx4ji3g4U/uOmwgdn0bZ6ZlQ
	 MawJKmpygIqko+/Zi3iN8PfmbXibV9vQRcQSuNtTPwSVSAsdM++1AYsltQI3hNWQXu
	 9T1EZuN+eWORAVf6E+3rARoxH0baY8pzaVQYKLiDma/+NQVAYiJxQD7YDCms4azi5N
	 JfvJZEHxZNtd9X8xIEN+EoWYIgNWWJBHu7dA2xO1HiBAIJCPeEEYIFNnnn2ITEPtAL
	 A0zWtGh2/MtUg==
Message-ID: <b9585ebb-acc2-45f6-a57d-ee3c71a0ed84@kernel.org>
Date: Wed, 20 May 2026 09:39:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
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
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <2k5HS02rUkL4criXdLW2s3U-JDGR3bjCoqDdpB7A6x1Rx2-IbQX93RYBW6kBSgJ040MVdoDy6HIS6G22aXxckg==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62228-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,apitzsch.eu,baylibre.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3B1FD58A1E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 16:10, Erikas Bitovtas wrote:
> Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
> them from loading.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index a87e8afb23df..3baa6bb4968f 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
>   	.vmem_addr = 0,
>   	.dma_mask = 0xddc00000 - 1,
>   	.fwname = "qcom/venus-1.8/venus.mbn",
> +	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
> +	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
>   	.dec_nodename = "video-decoder",
>   	.enc_nodename = "video-encoder",
>   };
> 
> --
> 2.54.0
> 

Actually just squash into 4/9.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

