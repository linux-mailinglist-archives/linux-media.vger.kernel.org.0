Return-Path: <linux-media+bounces-62227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAQ7L611DWrSxgUAu9opvQ
	(envelope-from <linux-media+bounces-62227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:49:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7558A1C3
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8528D308910C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAB03BE645;
	Wed, 20 May 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lo+4RStz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27303BD65A;
	Wed, 20 May 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266319; cv=none; b=hphGqci9VDm+iR9gQj+LCzFXKfkHVs5EHma6pLFi8/qeBlFN0L+AL+RLeJD59+4tDMmHRCWDuryViuYQxG9XPVdI7ewwNHr0JozOmEbIka7Rj20iphBr/ju0Bwr83XGkyZKOZcEemZ/sIWPaEgfmwH0D3TiXqsZ+/kH6+ydHD04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266319; c=relaxed/simple;
	bh=Vwik3SfRb6OvDifoG3xZHGyXY8/cHwITgze2zrIYXWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6K50So+ZaESpQXNf7/GPvx+Sxj+dDk+18z5IW3Kz5gf+R/i3BDyhMAmWS6cX5g8jGwRnCQ4GVkdxuENUo6gSdGehZWFZz/TfyP+to5n95zPDp2eKABp+gnVJ750liLuxF5r3DbrtBZSerU9KkgFnelON2JecFSKq2C5+H65Nrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lo+4RStz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD901F000E9;
	Wed, 20 May 2026 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779266317;
	bh=8xoxx568hmg/dZQvds54lQN6medggVejTC4d8s3WvyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lo+4RStz+UYG59nzXfxdv5Q4dWnMOSRLvrq0Wlwy4oSNPupZLSRy6dDj7NQf8+1vg
	 /01zbcSRBywDcYvmJ11UNorKV2NcXz5IR/kkn9loKgFqfJbE+m4jbQN1Zqp0G1950F
	 zrWeIzwk8Ias+vs+Xm1AtCKLfU66RI8jD85HXbDgCwgR/P71QzSgm2XSGKpnbIFM55
	 r/aOdVy9GVu31xXCvtBg2qxlQrBU+9iOK88l6jHbIXcb3lSsQQwwlkC+hTG8naa0zh
	 b3ohchyZ35hDncQIImY8cgluFr1mBVBRGmgEcOuGP0inFdoWrGJIcLILCQ8iC0Csmn
	 1UxSMOJg0RQUw==
Message-ID: <da0ea7d4-b533-4392-b83b-fe1861d9f074@kernel.org>
Date: Wed, 20 May 2026 09:38:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] media: qcom: venus: add codec blacklist mechanism
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
 <j1dto3n6N9oXLBtS7z0o48gGVSaEe1wPs8bTSpcqRtG8rbfE8LRrgZZ9YytgJ-uw6a75TMn92kznk3MHutsmMg==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-4-542ec7557ebc@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-4-542ec7557ebc@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-62227-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 5FD7558A1C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 16:10, Erikas Bitovtas wrote:
> Add decode and encode blacklist properties to allow disabling different
> codecs per Venus device, instead of doing it per HFI version.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>   drivers/media/platform/qcom/venus/core.h       |  2 ++
>   drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index c1603eebd757..46705a666776 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -88,6 +88,8 @@ struct venus_resources {
>   	const char **opp_pmdomain;
>   	unsigned int opp_pmdomain_num;
>   	unsigned int vcodec_num;
> +	const u32 dec_codec_blacklist;
> +	const u32 enc_codec_blacklist;
>   	const char * const resets[VIDC_RESETS_NUM_MAX];
>   	unsigned int resets_num;
>   	enum hfi_version hfi_version;
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 92765f9c8873..8e762cf77968 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, void *data)
>   	core->dec_codecs = codecs->dec_codecs;
>   	core->enc_codecs = codecs->enc_codecs;
> 
> -	if (IS_V1(core)) {
> -		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
> -		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
> -		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
> -	}
> +	if (core->res->dec_codec_blacklist)
> +		core->dec_codecs &= ~core->res->dec_codec_blacklist;
> +
> +	if (core->res->enc_codec_blacklist)
> +		core->enc_codecs &= ~core->res->enc_codec_blacklist;
> 
>   	return sizeof(*codecs);
>   }
> 
> --
> 2.54.0
> 

The ordering of the patches is wrong here 5/9 should come before 4/9 
actually, that wouldn't bisect.

If it was just ordering, I'd fix this for you on application but, 4/9 
and 5/9 should be individually bisectable so rather than change the 
ordering just add blacklist and whitelist data for 8916 here.

Then 5/9 can be about switching off the old way. For 8916 the series 
should be opaque.

Assuming you do that please add:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

