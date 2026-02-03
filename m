Return-Path: <linux-media+bounces-52140-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPyyIN2CgmneVgMAu9opvQ
	(envelope-from <linux-media+bounces-52140-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 00:21:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E3DFB03
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 00:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C34A5302D8AA
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 23:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5237C311952;
	Tue,  3 Feb 2026 23:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eNMZfLj9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B53F7E792
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 23:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160857; cv=none; b=HwesQKYOyIQdXYzH+HZf1OOcJ3U06lKe7x97cfdKYtme1SrqpixmENQR+Da0J8fcLZllMGiVmqYx9gohsQhnKywiifsi1wej1VGvGHkly/0aenfwr8UVgndmXYKyxghEwmjXhD1IS5A2KPKCrA1cM7aNkoUS9T6f9g4ZqZGi+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160857; c=relaxed/simple;
	bh=DBlsEnCNWOdgU65s3UGQhrlX8AWLWkEiqvqbN717n08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOCiJIbZ+mVmjoO84GSh7sk4IO0D8qxeV5OFv9VIFAfvDpZfi0lsnIuH53bGAe1LAmxwZFs7U2BYvk0xS/TOX+a2+ZMcEuWpFBiiUu6NY+t5TFF6qKwuN/m8nvZkz8t2gCPJIs+7sBTNQZEUCG1OtduEq/O+kj20SCzUIaNF85E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eNMZfLj9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so65220615e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 15:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770160854; x=1770765654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kP3cETuc1CkrPsq53s7PbxZQOsGNVLDKkivfucBoVDY=;
        b=eNMZfLj9tkKmMOs7kikYt2+qc5gx6WoZ55jn8TNRRC1cjpDOasTzJW4rUI/5wNRWXq
         SrUNGKbwjHVJaBK8MvjKvfPOqTXD+6NmgLuNSZDtt1+g5LlL9yC3hN7vCoX2zFOgAjpp
         22GvTZLF/qw5MTX8mUbdvMDfxgvkiKU8sHhvdNk0VM+mBPFdmgb5ySpZXtQuiSwf3+QR
         JrW390zUgThE72BN26Quk/LbSP0iU9l9SsxBvkKXkyc1Xt76uFILq18uUQjDaYicR+Ay
         YryAXBbzSUvq1vjS/HnkG/1uQRRETkKfaDj54bMCoszy1nxEkbudE7q4C7KfVf+E0+is
         ct7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160854; x=1770765654;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kP3cETuc1CkrPsq53s7PbxZQOsGNVLDKkivfucBoVDY=;
        b=T84Zpuu95kRXawS6j48FRkYCCc+cVA7YUGK7y4ywPxl9H2tJPd7QF/ydlzh/7LxviE
         dsQsnaP7AYl+hCUhPnnpNfrguhjsn+e98E0ixkMuezOhLmgKPUhatWMPc7UDjqQH3bHy
         4QbdvMGRZH7U3rsJLfRGQS/D6nDurlzcxBfdzeQiA2rqwvszLNasTlhJ1FtlNjw4ddGJ
         RjlQJJZGaDq3nbFA4Wx95x5MDNZzG7TAPxAhgZFVSO/CsqJovH8n73MAD2QnmKx/LIbI
         cq5fEB1LBLObNL4GGnlJJdOHT9KBkVY55xIAT2vbG9lnkpIGrHc7F5uZuBFA+euRGAua
         142w==
X-Forwarded-Encrypted: i=1; AJvYcCUXge3hZ69sjhywaJg8pYew8FKfnkG5oVTq+4wYQB1mJhg/4OLRCm7EXpCMlw2UjC9G9NxOOrcPiLEIjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpALNH8YqC5PyVc5yb5OXNMP8HLmPLIWG1N/BLeOItCRJoA+t5
	gM4IpZ225r7dVE6m35NQoc2zgLlkJ2XmwAsLt1lFqZoOjMZRyx+7IQzdguNWIH656zU=
X-Gm-Gg: AZuq6aLq+qYma3ds3XWe8hOjjWc6vzt8fZqWoZrJ0g4q0uZuDSlR//mQdtwtzooWOI/
	EBBokJvMEH39b9ZUTvKYUGRA7g759/1WNp2wEanYi4VYR4wrr2/2hKzCvEHz7F+ebCipeVBE5xh
	Oj9pF16/VdurTUmwqMACFwdDK4FFEemtDlBumr843cYjN1u4AuONcz57jGlFOqzNGjzRacmiBbL
	DQcsEGBF18I/mHSfSRAHCPsN8pLLHfHzkhF6aF6MM3U9jQsdu7F4NMpIsPsoUrnkUSfYgPslTV7
	X3i7yliIKfdovP4gxrI5CERbJOV2eoP85DG5kkbqWfQoXWwXLBSbMuEfZDT9lMlkeerzRf3p9fB
	o0Al4b3vT1zNrjMoxtkEf4cZdidGLsixRawxXse9cYmk43T5PpynZ6wb6P58YVoCC3NDcpa5hip
	JeB9Chl508tR7ayHJXu9tf1/BUn8gDFCCPgkshLjhQj+PXBTg5XNMVaZqbbT8t1mQ=
X-Received: by 2002:a05:600c:5491:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4830e935736mr15228825e9.4.1770160854462;
        Tue, 03 Feb 2026 15:20:54 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86a7bsm4055075e9.8.2026.02.03.15.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 15:20:53 -0800 (PST)
Message-ID: <e31d9865-5002-49fa-b6f0-06328d3d6a12@linaro.org>
Date: Tue, 3 Feb 2026 23:20:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] pmdomain: de-constify fields struct
 dev_pm_domain_attach_data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <3gNulq9mtM9Uxcj8IfIzusuPDhOGNCEcCGQrxhCBiYbh2DCGhUpRYpLgY-KfrSj746f6RWqzl90Fge-7U_CsUA==@protonmail.internalid>
 <20260201-iris-venus-fix-sm8250-v2-2-6f40d2605c89@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-2-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52140-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 744E3DFB03
X-Rspamd-Action: no action

On 01/02/2026 10:48, Dmitry Baryshkov wrote:
> It doesn't really make sense to keep u32 fields to be marked as const.
> Having the const fields prevents their modification in the driver.
> Instead the whole struct can be defined as const (if it is constant).
> 
> Fixes: 161e16a5e50a ("PM: domains: Add helper functions to attach/detach multiple PM domains")

This doesn't really fix a bug though.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   include/linux/pm_domain.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f6f6d494f728..b299dc0128d6 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -49,8 +49,8 @@
> 
>   struct dev_pm_domain_attach_data {
>   	const char * const *pd_names;
> -	const u32 num_pd_names;
> -	const u32 pd_flags;
> +	u32 num_pd_names;
> +	u32 pd_flags;
>   };
> 
>   struct dev_pm_domain_list {
> 
> --
> 2.47.3
> 
> 

Other than that.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

