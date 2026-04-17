Return-Path: <linux-media+bounces-59014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LkwNmUm4mnt2AAAu9opvQ
	(envelope-from <linux-media+bounces-59014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:24:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1A341B30F
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0CBF302D5EA
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CC1375AA1;
	Fri, 17 Apr 2026 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="LqYiBnHC"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA53624A8
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 12:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428622; cv=pass; b=b/7tzPUAU22VLaA/iETVCzxnnM8pKZ4hSAptAeWvhPho4GoRaStRKyl/y+6EDqdFpw1qQhUxO6lNnS1havanyc8F6F1iJLp5FByAoFT3dTvjb1uSq/SqpgUd9clkwegbDkFdgVI82aVFekj6hOA69mLwwf9LnitFj5X8qFibomI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428622; c=relaxed/simple;
	bh=1rc2Vy9msclXHtAIACFrqIigeQPnRwT+3GH17X4aKXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPekTC6JRjMGimX5lJP66sKrd+0qQBr5xGqnXS8j39qZaAkNaZLxlAfWbfmTLFQCXd0svG2IdHLrFsN24lpLRW91vyts3ywut4byrNlpTaHkYLBae+s9Pzv4db/ObOJ0Xrrb+jFgkZV3eiF41kNRVY4sw8L5ni25TodS5k69Huc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=LqYiBnHC; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1776428611; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WJ9ma7QbELhbw1ATxbndvyZ63/+Z3j/WIS9TNJDXXiXIBahmfKzba8vSKrzU9frIXxF1QXWmnEBD+gw+i+eHU1wTrqrZB+TnKCA9OO3bsdPl7r4Xu40yR+TB/8XYbMdiByC8+IStQm/ziYk4xPa3/2QzLo2eTahL2onTMd74ijI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776428611; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hKvGawkmBf9LybzNtz5Icum2eKRfLvRy5fElCzHIEC0=; 
	b=UjaDW06p7t/0fQ+lNtAXO+CH4MId/s/6CM9kR8SfVQ+Zhohg7fJgerUyGT31tGrOvDVhoLj3e7X/5OdNr7GQbMatxXW8DGRmU8ohDshSansFidqhmFEdYMe3L5wwwGC1+uDSUcXvAEWuHuRTkuyS6rS9y5txHMj018wSIp3N3NM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776428611;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hKvGawkmBf9LybzNtz5Icum2eKRfLvRy5fElCzHIEC0=;
	b=LqYiBnHCcsh5jb+MTl03cLXMideNv6bVdkA/IFmDCrukP0CT5seCBMgCw1zROCaZ
	FZi72ONJqhvd4WGVLkziF5HE7VNYNZnwyHKrSXnHoMZXmF0a2e2KBEDp/ETqE757HJW
	HQILlxdmm2BKZOydauKlgjco3gd8fA3Jo/JvAFrA=
Received: by mx.zohomail.com with SMTPS id 1776428608938270.8876346816767;
	Fri, 17 Apr 2026 05:23:28 -0700 (PDT)
Message-ID: <cf7d589c-1ab7-403e-9809-93f9f87d72b8@collabora.com>
Date: Fri, 17 Apr 2026 14:23:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] media: i2c: imx415: driver improvements and fixes
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20260410061944.241480-1-eagle.alexander923@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260410061944.241480-1-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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
	TAGGED_FROM(0.00)[bounces-59014-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E1A341B30F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alexander,

On 4/10/26 08:19, Alexander Shiyan wrote:
> Hi folks,
> 
> This series is a rebased and improved version of the patches I sent almost
> a year ago [1].
> All patches have been rebased onto the latest kernel tree, commit messages
> have been rewritten, and two additional fixes have been added.
> 
> Changes since v1:
> - Drop patch "media: i2c: imx415: Add get_mbus_config() pad operation support".
> - Reword commit messages.
> - Add Fixes tag where appropriate.
> - Collect Reviewed-by and Tested-by tags from the original discussion.
> - Add two new patches:
>   - Fix control handler initial count.
>   - Cluster horizontal and vertical flip controls.
> 
> Alexander Shiyan (5):
>   media: i2c: imx415: Add missing ADBIT1 register for 10/12-bit output
>   media: i2c: imx415: Add missing CSI-2 timing configurations for all
>     lane rates
>   media: i2c: imx415: Add missing 4-lane CSI-2 timing configurations
>   media: i2c: imx415: Fix control handler initial count
>   media: i2c: imx415: Cluster horizontal and vertical flip controls
> 
>  drivers/media/i2c/imx415.c | 153 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 133 insertions(+), 20 deletions(-)
> 
> [1] https://patchwork.kernel.org/project/linux-media/cover/20250219094637.607615-1-eagle.alexander923@gmail.com/
> 

Thanks for your work. For the complete series:

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

(Please make sure to avoid multiple R-b tags in the first commit, which
I reviewed with my old WolfVision e-mail address.)

Best regards,
Michael

