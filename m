Return-Path: <linux-media+bounces-66463-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m5ykHI7MR2r6fQAAu9opvQ
	(envelope-from <linux-media+bounces-66463-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:51:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E9A7039DC
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 16:51:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=GBuFRYhY;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66463-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66463-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 505DF3075405
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 14:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5757E3F4DE2;
	Fri,  3 Jul 2026 14:45:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E583D45F8
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 14:45:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089945; cv=pass; b=hAV8xTpcmCXZoa8Lr+MpfR5W+wLsf3EgpV82jWsPYwSGxwo0mxSfbhpSbHiTwcLKBRej3Rl+nx5ceXRfGMpVSzu+0mCVxNgK8oef2kr1ES/cA3ciObd5w2JDTpazD5PBbg0xSuzjsu8IJlt3tKPAcaMO6vN0VdLTTUJHjXCbd40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089945; c=relaxed/simple;
	bh=bbdnBOpPYQwxQVCTGpvXRGqVIgi5VAXFlurWB8Z2dcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=med1eMiqd7jhoxIBWvE0vScB5kHPe8eJT7JvWWHYcKUgdnMWSd2VWWX1S2sMrxFMucHwidDAa+E1KFPUAQ/voOkqqHmHZCEHmsUaIZrLBa5qwHyqNx+UvfJjzrQu8ZGbj8HSulP5LI/sVNL6CfMrzTztGW/vEp5ze+OtqO1+AtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=GBuFRYhY; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal: i=1; a=rsa-sha256; t=1783089934; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V0mhtmKGJrUTPlM4lNx+yH7/IadKtHIBvxLnnSk2nop0GWeeDzpjIlpoCv7UIDS5jo7s87fsfH9vwOARyTCKchgR5NCUdfDPoc1u+TiB+sorojg+KRYagmHAV0RFZwOrWHo6iDE/RWLLLBEa0soziS3QP2DsKDFNLUYI9Yl648w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783089934; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nmDpc7B+19awYjGJUdI/Ymoo0z93Zz7smuvzaSA0a28=; 
	b=DvX+NEY5qim6ws4lyA3ZeFrT7EWh7jEt2h+Hwa5/QEIiRx0tv+1n8si6duz6N9RLa+zezXlRiGj8yF1Y8nAU47Ggp6nk7v/+s0xO5/h4wbXN3FqQGMMNYBZk1gnqaG70t43F2QWjToJnu56t4rx3dRS3g9K6Upq0xx6r/qNj/9k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783089934;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nmDpc7B+19awYjGJUdI/Ymoo0z93Zz7smuvzaSA0a28=;
	b=GBuFRYhYHzebXdw0PFXduIql65kvRp+OtNZoNJqLXCpWo4Y57jcZ9ywQxMMjyHbX
	+cTPKqWbs+oyQLvu6CUqCJwAfKG87O84soDkVP8f7QKYJrN6T6FIwqdvMdh76Epp00A
	+o/mwwVd68enBBtnPhcYZjDS3na+HljNcqjsv0Vs=
Received: by mx.zohomail.com with SMTPS id 1783089932845313.0430968504985;
	Fri, 3 Jul 2026 07:45:32 -0700 (PDT)
Message-ID: <3f9b7fe7-de08-4dde-94af-408dce1060f4@collabora.com>
Date: Fri, 3 Jul 2026 17:45:29 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: use request_any_context_irq()
 for 5V detection IRQ
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Dingxian Wen <shawn.wen@rock-chips.com>
References: <20260703070029.1762457-1-eagle.alexander923@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20260703070029.1762457-1-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:eagle.alexander923@gmail.com,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:shreeya.patel@collabora.com,m:shawn.wen@rock-chips.com,m:eaglealexander923@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,kernel.org];
	FORGED_SENDER(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66463-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5E9A7039DC

On 7/3/26 10:00, Alexander Shiyan wrote:
> Replace devm_request_irq() with devm_request_any_context_irq()
> for the 5V detection interrupt handler. This allows the kernel
> to choose the appropriate execution context (hardirq or threaded)
> depending on the underlying interrupt controller. On some platforms,
> the interrupt may be nested or require a threaded handler, and
> using the fixed hardirq version can cause probe failures.
> Switching to the more flexible function improves driver portability
> without affecting functionality.
> 
> Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 4c8957505a50..fa9818705f42 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -2609,10 +2609,11 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
>  	irq_set_status_flags(irq, IRQ_NOAUTOEN);
>  
>  	hdmirx_dev->det_irq = irq;
> -	ret = devm_request_irq(dev, irq, hdmirx_5v_det_irq_handler,
> -			       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
> -			       "rk_hdmirx-5v", hdmirx_dev);
> -	if (ret) {
> +	ret = devm_request_any_context_irq(dev, irq, hdmirx_5v_det_irq_handler,
> +					   IRQF_TRIGGER_FALLING |
> +					   IRQF_TRIGGER_RISING,
> +					   "rk_hdmirx-5v", hdmirx_dev);
> +	if (ret < 0) {
>  		dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
>  		return ret;
>  	}

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

