Return-Path: <linux-media+bounces-14175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8A91806A
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 14:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBB681C24163
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 12:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5403C180A70;
	Wed, 26 Jun 2024 12:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=m4com.de header.i=@m4com.de header.b="UDcqxJBW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgw1.m4com.de (mgw1.m4com.de [159.69.93.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8A015A856
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.93.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403268; cv=none; b=thVnPQ2X1dGTarpMzDgTn4nkvEIRrn70eLp6TD9oc+mBe5Qhp+BUxIfZA7uwZMtluGy1YdDAXRuy6JdgCwjlpWVyZbux8maNQl+K3KDPsFRY8Jtjl1brLYw0GuCNYB/jEB0xlpNPNgnZGoAhWuqI/8HSLmH/H3vIKXkLIKvTZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403268; c=relaxed/simple;
	bh=7lx9HOY7qYwqjQLiuaIGQKf7xLqEM5ioTXfBlmph8cA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=dtnjqRNJgiu9wG2p5OvlRWBnltDVdVMatTpYgR9tUwSEhd5kw3Jk5pOhz3esMjMm9Q6c9ivEsKoWdpnFElMJji/tRs7t2Hf5Ya/feQn3GuSAsmCLaUs3AviTnha4gK7ObGtg+L5LqPH3Se0SAZjSRuY8yxKCncpzm5B2pQeLVIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m4com.de; spf=pass smtp.mailfrom=m4com.de; dkim=pass (4096-bit key) header.d=m4com.de header.i=@m4com.de header.b=UDcqxJBW; arc=none smtp.client-ip=159.69.93.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m4com.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m4com.de
Received: from mgw1 (localhost.localdomain [127.0.0.1])
	by mgw1.m4com.de (Proxmox) with ESMTP id 7D24920009B3
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 14:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m4com.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:message-id:mime-version:reply-to:subject:subject:to:to; s=
	m4com.de; bh=rC/NN+ESX0kaMematWhtLJuj0KwIP34QpmP3/E4dnPI=; b=UDc
	qxJBW8bGmNSFIxwJqC9c5UzJh4GCMSPe3xQeLTxIf3M5i0h2x+WeI/h/zSbagNRm
	O0LCct2k1f99EWUiJaTr9thf/MSZMLdsw84DsTUHhfsupUML1HRVW8NOHDMuPdNX
	VaEUiubJgfK5L1yaeLVVJu/hH9fvlVLPtuwrJFeOadg7HruPEJVNovMA7G87dhjC
	2kHye9q+e/5XgKH9gtqF/pOyaxfs0dU6kWhyBX/ToE4QmQiBkgbAnBpLh3gzITyE
	8+sMPQjiwKfFWROPAxNidA8sj66mSxWbKvJ6ScIZJbE3pf+brgC4rRhHJ7bH9pqF
	8B/GQOvehpUnex0iJXzeuVs+43938X+ynYIljHs/dQW3pqIG85AHry8EiXekNd4W
	zcK8vfw1zCIHNzkoagO4CEMVDs3uHrnsXvkJIlRbucMnFoMFf7zFsrq5JB8sy8IZ
	HKZannguQcWEJGfM9JIAnrTg8JQJyKBttkCvn5A86RODnnwIrBIumA8suP/VwZBS
	Hi/C5ppGPP2Keq36M66ROx5dZHaTgUFIXI/tKpnsMcf8qg7poRZV+Tbk+LyJ1vpf
	uQKOlR4DTosSOFa61GiQFDHTKtUmNy4ClngpZLO0HPI3wHKdBLbqX/JN9NZCgKoI
	8U6gvMOL//nmtF7zZXsKMiJ0lRbSDD5pHwT+8PbA=
Message-ID: <905f8c62-2dde-47d1-b8ce-8e9e35f40322@m4com.de>
Date: Wed, 26 Jun 2024 14:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org
Content-Language: en-US
From: Marko Lukat <mlukat@m4com.de>
Subject: [PATCH] libdvbv5: dvbv3 stats fallback in dvb-fe.c uses wrong value
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

having been tasked with getting some old-style devices (it930x based) to 
work in one of our products, I couldn't figure out why tools like 
dvbv5-zap kept showing nonsensical error block count values (UCB). Turns 
out that the v3 fallback code uses the SNR value instead when storing 
the UCB value.

> diff --git a/lib/libdvbv5/dvb-fe.c b/lib/libdvbv5/dvb-fe.c
> index 7848fcda..4ff9eee0 100644
> --- a/lib/libdvbv5/dvb-fe.c
> +++ b/lib/libdvbv5/dvb-fe.c
> @@ -1520,7 +1520,7 @@ dvbv3_fallback:
>                 scale = FE_SCALE_NOT_AVAILABLE;
>         else
>                 scale = FE_SCALE_COUNTER;
> -       dvb_fe_store_stats(parms, DTV_STAT_ERROR_BLOCK_COUNT, scale, 0, snr);
> +       dvb_fe_store_stats(parms, DTV_STAT_ERROR_BLOCK_COUNT, scale, 0, ucb);
>  
>         if (parms->p.verbose > 1) {
>                 dvb_log(_("Status: "));

HTH,
Marko


