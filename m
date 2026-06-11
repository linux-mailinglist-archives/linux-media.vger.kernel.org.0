Return-Path: <linux-media+bounces-64592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cf5nORG0KmoivgMAu9opvQ
	(envelope-from <linux-media+bounces-64592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 15:11:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F01D6723E7
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 15:11:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=M+ZA36di;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64592-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64592-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C80FB33D7540
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 13:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DEB40629C;
	Thu, 11 Jun 2026 13:06:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB37403E9A;
	Thu, 11 Jun 2026 13:06:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183204; cv=none; b=PWdTY3Y4O5jJx7QoRIhUqYkj4RhlCt4OPR3T8lFDXSV58AB/FVoyK1SRuWWSNC05/PgqbLoTd8o0HgI+RQj1t8uUGVxJeNX928TFWPKEgUqnkMjDAenchrXOnAcCqofiRkimUaipde68iwbyXyJiiqfTjy5IkAqiZj5QdjSTiNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183204; c=relaxed/simple;
	bh=XzASeNJliZuawkpqnviVaJWwgMYlGRM+kWFcsc2UApI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrcIlKXOGigeG9YjIlwYvZREfBSpIY8FcU/Rr0V/3tMXD5EexFFDwKSwxIqIjSedj4CKdEutc546CCNCB5a7jkTc94n2Ij8dMspQbrru8EIeRTi09gUMLweOkslK27Klf6ye3OrhIHOpWNzLOIFeMqNqkiD/dW5rJYWAFWWP0eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M+ZA36di; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D3FDD0;
	Thu, 11 Jun 2026 15:06:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781183171;
	bh=XzASeNJliZuawkpqnviVaJWwgMYlGRM+kWFcsc2UApI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M+ZA36diDuC0rgAOKrRAhsXQnRIVEKIr+jPZG9q+BfwxKnXFpKA+pBwNvFoiLqbWN
	 MhSYOTHqk6zpAdY80VLBUVN5y2JumjEQxjJQJX/FKx1OpGS0gKPM9ABUPo1Kb9wN0i
	 zbXL43u2V5SESC9+1C3mL/CUpEUgKQcDJlfFUFco=
Message-ID: <b39bc319-8ae0-4715-8e3f-b822cdb535dc@ideasonboard.com>
Date: Thu, 11 Jun 2026 16:06:38 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx219: Report streams using frame descriptors
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com>
 <aip-xwYlKT1d3N0S@kekkonen.localdomain>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <aip-xwYlKT1d3N0S@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64592-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F01D6723E7

Hi,

On 11/06/2026 12:24, Sakari Ailus wrote:
> Moi,
> 
> On Thu, Jun 11, 2026 at 12:13:02PM +0300, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Implement the .get_frame_desc() subdev operation to report information
>> about streams to the connected CSI-2 receiver. This is required to let
>> the CSI-2 receiver driver know about virtual channels and data types for
>> each stream.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> [tomi.valkeinen: picked from "Generic line based metadata support, internal pads" series]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>> This patch that adds .get_frame_desc() support to imx219 driver has been
>> circulating for a few years, and is currently posted in "[PATCH v12
>> 00/86] Generic line based metadata support, internal pads" series.
>>
>> However, as some bridge drivers require modern drivers that support
>> .get_frame_desc, specifically ds90ub960.c, let's pick the patch and
>> queue it separately from the huge metadata series.
> 
> I've been recently working on
> <URL:https://lore.kernel.org/linux-media/20260518164318.3367888-1-sakari.ailus@linux.intel.com/>.
> In other words, drivers that have a single stream don't need this. We could

Thanks, I had missed that. I like the idea of a helper that does the 
fallback mechanism. But I wonder about the need for dynamic alloc, which 
complicates the series. In any case, we can drop this series and 
continue the discussion on your series.

  Tomi


