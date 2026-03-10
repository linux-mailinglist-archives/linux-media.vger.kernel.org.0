Return-Path: <linux-media+bounces-55258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDyWNKaSsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:52:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45525886A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F36F30603FC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FB83F1668;
	Tue, 10 Mar 2026 21:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VBgXmYF6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B943EDADF
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179554; cv=none; b=eBrPPobGIo8TuWiqj6mbpPeF9cCnuo4Zrkee0S3H8etRu9d9G69zjNWov+NyxczVWwu46BHfvr3q+iDm8WZUpbXfpTkDPEUiMTwlDZ54G2sA2bbrfQ7DVsilB33pLSsF36gnwWJ/PiVANwFjuzVDR5voZ9ObiGQMg1M4TA5ty1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179554; c=relaxed/simple;
	bh=y84qubhrfr3cMc6nAC3U/0mPJebsA1MPz29TDYveouw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ipk+AdC8rxx1EtRVTZ8uMQKS/hkYXiZdV5job+OD5i2mWszt+qTpM/7bRRjlVfqhmuZJ5P8FP4z5My1sn7V0JnCcInKJXzi/d6KuNGjnwOEhtrU92G+GLBgFDXi18lykjfTd4Lf4dF6t7EICQmLnLja/YHyeFVgSpwQTl0Xs1hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VBgXmYF6; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4670676ba03so1033713b6e.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773179551; x=1773784351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=VBgXmYF66HCQW3EXVqSV8U+tAEba1ONLGiCRwPrRVN3xpnc2IdkJECTwYeFFSkzZM0
         XnjK0Xt9b9K/59rLA1o1zNQ7u6wsYJH4mG0j37Vr5xesm4W3iEq091pkeYZg0a67qDD1
         hocNFYmo3Smn3MLcsrotD984wrOcKCEx6Dhn3CIj92tLlAzn+FqfOuViMmy9OknvJvkz
         yCGrPbYQxPN+4stePPOnP8LvZA9PGG0iNG9nbzGwgglag3qYh3T4sPUqjTgI7v5HqY+8
         6GwjPYqdeW42br2RjquUUPCYvhCY6dYJ/A7NUoHgmQIImtaqqUfvOQGPCzXLg5+OPo16
         ZtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773179551; x=1773784351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=wTxM0AjzStOxBdrKNwOIhS65Y7NNlOzbD8PLHmq5PO3Hgy3ZYaf0it+C+yiP2xqztT
         H3bgrLskXIXneCKpm4w0NxMkny22T/NGIv4Ug2aUOBaXms9BlzKFU03nm/BBnLm59akm
         gEu3awEq58+26rmFxymRisPC2qdMbI9CkrIWsGtqo8rBusyi3CU8uu59TaEB+g7Ibp5J
         nFc7f2mMDQ2kxmSneV93J0Zms5llwqezudCsCFJfd4M35MEF7zW48xfFLIxu6CQyOJTd
         Irh+arTUhnrqxZX8uTrZKmtWJWBQRVFNnGdaIgBKXvkI1yiVLk/c+hiJ2fjkNrcvenYi
         c3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVPj6dUkUgJcuAyM/tfrJa5MRkUQu+OjwyIFSag9Cph/ltTESXesEWOduSw4rfhZuokJm0Xk2AweVrQkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPWyfFkHXsn3NQP7HXpaz1mdSBlp8a9+RnOWEmksGmCgPQoFZ
	OEaQ/BWcTKi8grUi61x3x96YKoRx97aU5Ko3VRFsPsweVfIUhVQX7b+d5VlbiTUPQTo=
X-Gm-Gg: ATEYQzyO9F4bv4zcjy7au/6xL5mJaSpOzrkoAf2xg/L+wWrzQr9vnAJRQ+W0YJ5ir59
	cTnjv5UmD10glfeyyTqsyKLzvojoQVK+CEc4GNnS6ysVc7OLdiRVn81sn0uQaEsHMM4yzXnZFvm
	cBbEqv7IpP6rAMC8QKdiznkO0XOrNS3vUUTL63t52jV+j4ngPO4ELA+ipnhRCY00AlKo1T7t8YA
	MqjDiFIP8mrx3PpHXl93CwZohSTF9nQIVLCWIbVoNwEnYl8GFFzbO+aoaez1hQOG5oFbfH+xGVp
	C1Pg2oBFj7KiqMrNaaYWs3VIHvbsVd0p6sbMdNEx8yVQxXGmxszahcIjblak/E3AQoxsgxjIut/
	ffVhphRyK2AYVzPqGijOt8nCYwNIfJGKoe7E54mODlwj4vMAi9lBh59KvcM0UaxPrxv/o3QN3fa
	vNpffir1shI/drkK1SSzox9O9jDAWPtcyXWO2Ldcahf+i6ROSq/xGkU8rkVkkHxCypO//2Zec4N
	w==
X-Received: by 2002:a05:6808:1929:b0:466:ecc2:6f47 with SMTP id 5614622812f47-4673354b18amr144459b6e.31.1773179551449;
        Tue, 10 Mar 2026 14:52:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:78e2:51e2:14b8:2e10? ([2600:8803:e7e4:500:78e2:51e2:14b8:2e10])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm48179b6e.7.2026.03.10.14.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 14:52:30 -0700 (PDT)
Message-ID: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Date: Tue, 10 Mar 2026 16:52:28 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
Cc: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
 kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
 marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
 hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com,
 dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7D45525886A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55258-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,mediatek.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Hi all,
> 
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
> 
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
> 
> No functional changes are intended in this series.
> 
> Testing:
>   - Compiled with W=1
>   - Build-tested on i86_64
> 
> Based on:
>   <linux-v7.0-rc2>
> 
> Feel free to share your valuable input in context of the cleanup API.
> 
> Thanks,
> Sanjay Chitroda
> 
> Sanjay Chitroda (7):
>   staging: greybus: simplify cleanup using __free
>   iio: ssp_sensors: simplify cleanup using __free
>   iio: st_sensors: simplify cleanup using __free
>   media: mediatek: vcodec: simplify cleanup using __free
>   media: chips-media: coda: simplify cleanup using __free
>   media: allegro: simplify cleanup using __free
>   staging: rtl8723bs: simplify cleanup using __free

There is no reason to put patches from different subsystems
in the same series when there is no dependency between them.
It just make for more noise for everyone.


