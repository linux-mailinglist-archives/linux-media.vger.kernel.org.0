Return-Path: <linux-media+bounces-63566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SItqHDv5H2rktQAAu9opvQ
	(envelope-from <linux-media+bounces-63566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:51:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C093363651C
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:51:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=OUo7GFYJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63566-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63566-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BBE330DA913
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4582B423A85;
	Wed,  3 Jun 2026 09:45:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E5D41C308;
	Wed,  3 Jun 2026 09:44:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479899; cv=pass; b=ET2FskTbQ6lh4p1cX6ycjZOXcZYm7pndRIjd3YT0D7EgMNqdhW0mo5qWl0PfA1LkpoifbfFSnxkhgaRSokQPiwQpZ+llr8qISr2U+vKtdzezZjwqxRXCw9dSOLaSunWEqkrAdlTYcslQb9izl9dcAGqe9V4V6CYld5j3MU2npCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479899; c=relaxed/simple;
	bh=044N241ytcYjzM6btTtNPmsFaCGkIkaG5DX2b8LhhP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rjWSMJUwAXo5/sbkRGEMTYUAMWNHehmtnEVQS+yUL3qRzaQfrnVuiOgcx5cmSnlgVeM04W46Czb8KFCbTL5W5oPNz7KPDQvdSEwluzebapCi6k9LwCsJw8eCNCVuDBxWRwbRXYzBt/CIRJ8HkNnW55ctr67tQvp9Oku40VXxqKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=OUo7GFYJ; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1780479888; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GlyViIoiCaTyKx26TNiy9txqN5DsKhmrwYvFrUi5XVAjE1noAgB0nBG81nMoroxP2Hh0FN4ZzaC8fOmweY1wC0KFP0u9VoWrn60V++ulE+043Cy1S57odBUwSYFAhlQq7OhBrGi4gPQWyTNLdo9Ps2wgXe6FRZjTvQfgVRZTC74=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780479888; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=zmT3aT75wI6d21PFeL3JNDVIIVb3pZMuYUehHuMaUQo=; 
	b=MwS9Ts9MchTSrbrwegb+5FUs7/cLALLhFhkfxHHgDazN36oPQLAMzusHLH5QrQeHVCwt0+AjmxeYeaaoi5j2Gm/4nqVvyQX++EOLOGIOHSoqIwFnNa557EYGIRrxb49mfq8StdmBiGcC5xAzglIcPlULWl+V8toF9z6h6mp48vc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780479888;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=zmT3aT75wI6d21PFeL3JNDVIIVb3pZMuYUehHuMaUQo=;
	b=OUo7GFYJB6/trAvxBgodod8n4xxkoj1KgDDZ2vcCx660JXUTzzkTRrru7hgISpRl
	/7XWgfT01QXU6HMlKjxVckGDqurEUqQWmLO2FyOZlL37ZosBqObxKHIXb3lzfktHCEp
	q16Mu/735OyjIJyjp4/WRpmMWfcZaabiELxI1ABc=
Received: by mx.zohomail.com with SMTPS id 1780479886757480.2968078645447;
	Wed, 3 Jun 2026 02:44:46 -0700 (PDT)
Message-ID: <ab1f872e-f700-4ccb-95f2-a7b1b4038246@collabora.com>
Date: Wed, 3 Jun 2026 11:44:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: rockchip: dw-mipi-csi2rx: Add myself to the
 reviewers list
To: Bryan O'Donoghue <bod@kernel.org>, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
 Frank.Li@nxp.com, linux-media@vger.kernel.org
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
 <20260603-dphy-params-extension-v1-2-22e0e1ed8bf2@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260603-dphy-params-extension-v1-2-22e0e1ed8bf2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63566-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:Frank.Li@nxp.com,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C093363651C

Hi Bryan,

On 6/3/26 01:15, Bryan O'Donoghue wrote:
> As a cross pollination activity between Qcom and others add myself to the
> Rockchip list. We discussed @ Nice making reviews more formal because
> frankly we can get gummed up in not reviewing. Add myself +R here in that
> light.

Cool, welcome aboard :-)

> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8436428865aac..25e3f2cfcbf2b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25934,6 +25934,7 @@ F:	include/linux/soc/amd/isp4_misc.h
>  
>  SYNOPSYS DESIGNWARE MIPI CSI-2 RECEIVER DRIVER
>  M:	Michael Riesch <michael.riesch@collabora.com>
> +R:	Bryan O'Donoghue <bod@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> 


