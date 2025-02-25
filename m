Return-Path: <linux-media+bounces-26971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBDFA447A7
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 18:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E224188A81B
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 17:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511841A00ED;
	Tue, 25 Feb 2025 17:10:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDCD194147;
	Tue, 25 Feb 2025 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503458; cv=none; b=faV5KkQmLVlkCLNVIWsAF2Dfloq0ITzakBljvTFF+fV3bmwOkWdplQYFDxx57NV16mZNOfiz43PTBJWArhKtg9TnbOj4xjQygYfw93CucDqGL0t8geSg7zTBhPKTSl/csr2kg29pgD5Kry4BOMzfzkff9dNwH/LDVJVLfgWlpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503458; c=relaxed/simple;
	bh=ERQwZnsyoQHMKJY3CYdQrCBoN9md4r7dtDwmZmlQpRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kpKpUaomEYnoDuw5bDhuEgGv5Vm1dvA8vSEouoJwlfha5UVMBl+jv5Pw9xoWFIjEGTqaHWsThFPikjMynTVrZ24qJj6z6B23kb77LQVTyNatiNJfQlp2FqZ4I9P5v4flkyJNKgQ7cYUyU3Eo+FBAea2Phro+VB8oM1kDO27mhig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.160.176) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 25 Feb
 2025 20:10:33 +0300
Message-ID: <679c279f-a306-4f98-baf8-7e8b655274d1@omp.ru>
Date: Tue, 25 Feb 2025 20:10:29 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: vsp1: Clean FRE interrupt status
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund@ragnatech.se>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
 <20250224-v4h-iif-v2-2-0305e3c1fe2d@ideasonboard.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20250224-v4h-iif-v2-2-0305e3c1fe2d@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 02/25/2025 17:00:54
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 191288 [Feb 25 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 51 0.3.51
 68896fb0083a027476849bf400a331a2d5d94398
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.160.176 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.160.176
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/25/2025 17:03:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/25/2025 2:50:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/24/25 11:19 PM, Jacopo Mondi wrote:

> The VSPX generates "FRame End" (FRE) interrutps, one for each
> buffer transferred to the ISP.
> 
> Even if the FRE interrupt is not enabled, it is reported as active
> in the interrupt status register.
> 
> Make sure to clean it when handling the interrupt.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index d13e9b31aa7cff8610ea196ae4de88ab22e44e0f..17ace4c6844d19aaafc27e79f016cc05091372bf 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -69,7 +69,8 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
>  				i, wpf->entity.pipe->underrun_count);
>  		}
>  
> -		if (status & VI6_WPF_IRQ_STA_DFE) {
> +		if (status & VI6_WPF_IRQ_STA_DFE ||
> +		    status & VI6_WPF_IRQ_STA_FRE) {

   Maybe:

		if (status & (VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE)) {

[...]

MBR, Sergey


