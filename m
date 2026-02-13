Return-Path: <linux-media+bounces-52724-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAVQGzUdj2lQJAEAu9opvQ
	(envelope-from <linux-media+bounces-52724-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:46:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B1113621C
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 935B4301C8BC
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 12:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CE235BDD5;
	Fri, 13 Feb 2026 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="TXpqgEUS"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E762CA5A
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770986798; cv=pass; b=SHePtitVyoSD48Tp0x0osKSmsstB9soTEQAyPkkQtvWgs7tdEHF5Qhk53lEW4Wdg8ZaDI5kqhW0P5K6rVNq5pJLG8PlQTRdfcRegIPUpjeqoeUU0V0pB1Bp7qOKYrgiIz/5brcuNhzwkYiJ4V2PVHnkIyIMS3xfz5zeQGRjnV9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770986798; c=relaxed/simple;
	bh=XId74tA20H9c2W+ag51X92+qv8uJj8iFneuaGrSQMrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J3RXlMzJv++8/vXWfbVr5kYYtNK79lpVtNRKA1E8nw5mj6niw4mf46xl0CAjQ1DD90R01ID2bC8v1zfFMEd7L18/g+sbmKeC36ke6NcjRvnoD3n3l2ALiXS1FH31xRNM3gcgfgZNMhun3LB1xQCHuqHfFutH5vQvM/MRaDYn95E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=TXpqgEUS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1770986779; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eRqEHUu6cX6Lyc1t6SMLfFccyojxkiD/lnfxg07cPsxRLFo+JtM7nOjOOohRWtsH1atzu8HmBi+8EIX5ZEcYYkc2BCFAbkaQNvpU8Ixze/mGC9Zh32pPYySr8pAwGS3o6wLIKUGdfi4Tcln38OlofFE+M+3Aql4Nb/tYqKsQ3Fs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770986779; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4DG1L87kErUXJrKvSMCQJ+WEeY3HjwLz3JfGGAnE+K0=; 
	b=Sc3lUmqFcYzW5h9Ocos2vVw+DLVdzoVPjqezqMiAzaVpzB1FXxAa/WeD0mGth2b6lOLMlD/XaDwTwPtI9l25jw0dUTqEsjg4urL2LlnK1GndDsiDclNWBXjiMqCfdae50vKZAvStJdpkIn9okvk2fbEuhrDF24gbfXCKZC+LUgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770986779;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4DG1L87kErUXJrKvSMCQJ+WEeY3HjwLz3JfGGAnE+K0=;
	b=TXpqgEUSweghW1v7LmJhuCbB+fkmaOL6BC1iKC4n3T8mnOq/QsHphVC+vcel8eLo
	qSX46ABByrUCWYLPXbqvqymT/MB5XypCHLWb1gXOlXR75JVl3cR0qTakTkDkr6BSIcQ
	bTOJMEEjp8+TgD02by32VSRRLzCdMGHbf14q6jrc=
Received: by mx.zohomail.com with SMTPS id 177098677813555.01548820549135;
	Fri, 13 Feb 2026 04:46:18 -0800 (PST)
Message-ID: <476df663-2391-46ef-a5ae-2000bb418d73@collabora.com>
Date: Fri, 13 Feb 2026 15:46:13 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: hdmirx: snps, rk: Fix EDID injection with proper
 HPD toggle on RK3588
To: Ross Cawston <ross@r-sc.ca>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
 ezequiel@collabora.com, benjamin.gaignard@collabora.com
References: <20260209061654.54757-1-ross@r-sc.ca>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260209061654.54757-1-ross@r-sc.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-52724-lists,linux-media=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Queue-Id: C2B1113621C
X-Rspamd-Action: no action

On 2/9/26 09:16, Ross Cawston wrote:
> The existing VIDIOC_S_EDID implementation writes EDID data but does not
> properly trigger source renegotiation on RK3588 boards. This results in
> no visible change to the source device despite the ioctl succeeding.
> 
> Even re-plugging the HDMI cable does not trigger renegotiation on previous
> versions of the driver. This version reliably triggers renegotiation on
> EDID injection on tested hardware.
> 
> Fix by mirroring the vendor BSP behavior:
> - Disable HDMI and DMA IRQs to avoid races.
> - Simulate plugout if 5V power is present.
> - Toggle HPD low before write.
> - Schedule a delayed hotplug workqueue (1000ms) to re-enable HPD and
>   force renegotiation.
> 
> Bump WAIT_SIGNAL_LOCK_TIME from 300ms to 600ms to ensure lock.
> 
> This ensures custom EDIDs take effect reliably, allowing userspace to
> force specific resolutions/timings.
> 
> Tested on Orange Pi 5 Ultra and Radxa Rock 5B — sources now correctly
> re-detect and lock to the new EDID modes.
> 
> Signed-off-by: Ross Cawston <ross@r-sc.ca>
> 
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 43 +++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index abc123..def456 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -88,6 +88,10 @@
>  	HDMIRX_NUM_RST,
>  };

Hello Ross,

I was able to reproduce the problem and confirm that this patch fixes
it. Will need more time to understand what's going on as pretty sure
EDID was working properly last time I was testing it, will get back to
you after.

BTW, kernel's source code has ./scripts/get_maintainer.pl that you
should use before sending patch to ML to find relevant email recipients
of the patch, otherwise it may stay unnoticed for a long time.

-- 
Best regards,
Dmitry


