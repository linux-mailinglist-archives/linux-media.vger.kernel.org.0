Return-Path: <linux-media+bounces-64607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YIZWNg/wKmrIzgMAu9opvQ
	(envelope-from <linux-media+bounces-64607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 19:27:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C175673F69
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 19:27:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=O4OJHa9F;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64607-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64607-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C485F3135839
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 17:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE3A4DBD7F;
	Thu, 11 Jun 2026 17:19:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC84DBD75;
	Thu, 11 Jun 2026 17:19:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198374; cv=none; b=XCZ2DGIZERBGEdVGEi2XLP5EomtrMMvarDRN/UYaJkhUCON7EcTbWNcSTVg7mZCQdyUUdgMgeeOSA6G7P4KWKAsY18VqfJyWbo3jlRG1p38/sHCpVspvcC2BhGfIqdtaC6o0ZzcwjZVaSPEY8+CA3e1vEN2D49QHn0zjLxTHUGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198374; c=relaxed/simple;
	bh=Y5tR0HBxKMCII/Vm6f2Hob/IXfD4tb2efPERYMwk+Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhH9MPC9+4HpJ9JXwlW+8rvRM2hV5uhAERVwoNtyYjZloOYCW7ofHTOa7YvF18ZrRrEzsgc9+gtXKGM7pwrrwz/JfHIWZarWE1zsAozi5sgFBvYWow+D59oznLjkg/yl1C1+PqGS7PlPR97eUyrJHKvdu8gjuEH2NnYRbn+GzS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4OJHa9F; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2DF1F00893;
	Thu, 11 Jun 2026 17:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781198367;
	bh=BDBmLI1jGDHWs/rlgRqCU9JunRK8+w2FOw4F5+o3Tto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O4OJHa9FDW5jjtyg71+66wM9iLy4o1Pjj0qTyotGe6ud5WtK1XdK6x4h4xowG9XK1
	 sH7rtyOnWjqwFeTe6o0QV4LJaAysiPQnPtpOXI/O3AMnbVGgmbLZeX7Nw1fcUYD32o
	 S5ufEWL0+OuyGOiKpwiXB778bLXy8QdSzuTJLWcX3l9TxDWAzqTAZyGcu/uCIupmNi
	 Lj6ZRk9C7nNaa489Kk9eX6vuM/6qmrh+Y0E0KeoH6pZdcihbFMieBoqA1OTyPNB401
	 AnS5yJL2qhbZDA0ZGL5aR+IGU5RWwxxe5gOpD5A8AkoZ7e+Qd/SWDFroE7KTfM9JsG
	 ZUl7mVYpRnqdw==
Message-ID: <104fd807-e041-4458-9e3e-b9dedd77361c@kernel.org>
Date: Thu, 11 Jun 2026 20:19:21 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: {Spam?} Re: [PATCH] media: bcm2835-unicam: Fix querycap multiple
 caps
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
 <b549ea8a-76cc-4a7a-bab6-710fddeaeebd@yoseli.org>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <b549ea8a-76cc-4a7a-bab6-710fddeaeebd@yoseli.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:jeanmichel.hautbois@yoseli.org,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:laurent.pinchart@ideasonboard.com,m:naush@raspberrypi.com,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64607-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C175673F69

On 6/11/26 09:51, Jean-Michel Hautbois wrote:
> Hi Eugen,
> 
> Thank you for the patch.
> 
> Two issues with this one, I'm afraid.
> 
> Le 11/06/2026 à 08:09, Eugen Hristev a écrit :
>> The unicam exposes two video nodes, one for image, another for metadata.
>> Querycap should return the right caps for the respective node, not both.
>>
>> video0:
>>
>> Capabilities     : 0xa4200001
>>          Video Capture
>>          I/O MC
>>          Streaming
>>          Extended Pix Format
>>          Device Capabilities
>> Device Caps      : 0x24200001
>>          Video Capture
>>          I/O MC
>>          Streaming
>>          Extended Pix Format
>>
>> video1:
>>
>> Capabilities     : 0xa4a00000
>>          Metadata Capture
>>          I/O MC
>>          Streaming
>>          Extended Pix Format
>>          Device Capabilities
>> Device Caps      : 0x24a00000
>>          Metadata Capture
>>          I/O MC
>>          Streaming
>>          Extended Pix Format
>>
>> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
>> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
>> ---
>>   drivers/media/platform/broadcom/bcm2835-unicam.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> index 8d28ba0b59a3..4bf36ce80047 100644
>> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> @@ -1833,7 +1833,10 @@ static int unicam_querycap(struct file *file, void *priv,
>>   	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
>>   	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
>>   
>> -	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
>> +	if (is_image_node(node))
> 
> First, it does not compile, as node is not declared here.
> 'struct unicam_node *node = video_drvdata(file);' would be needed.

Sorry, my brain must have been sleeping

> 
>> +		cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
>> +	else
>> +		cap->capabilities |= V4L2_CAP_META_CAPTURE;
>>   
>>   	return 0;
>>   }
>>
> 
> Second, and more important,  I don't think the current behaviour is a bug.
> Documentation/userspace-api/media/v4l/vidioc-querycap.rst states about 
> the 'capabilities' field:
> 
> "The capabilities field should contain a union of all capabilities 
> available around the several V4L2 devices exported to userspace.
> For all those devices the capabilities field returns the same set of 
> capabilities."
> 
> Per-node differentiation is the job of 'device_caps', which unicam
> already sets correctly when registering each video device (your
> v4l2-ctl output shows the Device Caps are already right).
> 
> So this looks like working as intended to me, and the patch should be
> dropped.

Thanks for taking the time to explain.
Let's drop the patch.

Eugen
> 
> Thanks,
> JM
> 
>> ---
>> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
>> change-id: 20260611-bcmpiqcap-f893a9ea2da9
>>
>> Best regards,
>> --
>> Eugen Hristev <ehristev@kernel.org>
>>
> 


