Return-Path: <linux-media+bounces-65972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F3NBNQx9Qmqt8QkAu9opvQ
	(envelope-from <linux-media+bounces-65972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:11:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 587646DBCF7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:11:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=gHgQLEEv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65972-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65972-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA836303F44A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79ED11427A;
	Mon, 29 Jun 2026 14:07:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F6E34B68F
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 14:06:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742020; cv=none; b=HjKTUvlkg2ldUdvVROkHw16ZCUSwMJayY047j0k7FAZuaZr60at58SQfI4EKEUV/kL98n6OzbwwXXg+C7/xac80Rqmk9DZELkLUvjuXb8sqAFfRdlrbLg/VjisvWC/JkPxotyvqPLu+1qIHX4g95tioInwr4hbWRDauBrE5CU84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742020; c=relaxed/simple;
	bh=GDsVR/UNKXv/636mkuVFOiM8B+XsgvIdghmpokwZ2RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/CH5z1O7YBXyGHnNg7Yr7oDf5P5mARbDVSQsppC2j3JHhwocj5HTvQvYK5QMPnIPGSwaIKA6J+7SyMiNUFUjb0WloIL/RHbawRFtX2KUzMHsMtWGPlTvLPVOEH2xFJa66ptJpLCDRdn14mlxrpVTOCqRtQpoj980adZ84mVtd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=gHgQLEEv; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782741459; bh=GDsVR/UNKXv/636mkuVFOiM8B+XsgvIdghmpokwZ2RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHgQLEEvO3HCpPPeo9xZsJFU3Hi4wtqSo3RHlq/HCMLLCTVb14lJF4RctCCB9NiqA
	 XXILBtdlXDhrql7OuPwH8mrj2rDO8zU6bmlAaC9YW0qBuM0eYZKn0VvB1826/68nIM
	 QuJlwUFrbU1esA2DzaQjR9EP70EgHzI40tcjqb1a/izKDQxbWvN5aKjrGVGn4sQMID
	 nqFvflH7tv8PfnWz6SGVZfvQxLTtp5Rzx8jLfpC15uqkOkF0pn+yz9J8nc5mh6y//S
	 32QyM/iJXP1Gv13bkkVaZpbJpqv/k+1wq0EnM8obgdX2NScwDc93r4wQd9svk8Kz+H
	 PYa9tLxT8Kf8A==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id D041141CD1; Mon, 29 Jun 2026 14:57:39 +0100 (BST)
Date: Mon, 29 Jun 2026 14:57:39 +0100
From: Sean Young <sean@mess.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: cec: extron-da-hd-4k-plus: add sanity check
Message-ID: <akJ506JWu_B3-p2K@extorris.mess.org>
References: <362ab4a1-6591-4715-ad1e-956a65ec322c@kernel.org>
 <186b19c9-e9f0-42e1-8c40-c594022acd5a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <186b19c9-e9f0-42e1-8c40-c594022acd5a@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65972-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mess.org:dkim,mess.org:email,mess.org:from_mime,extorris.mess.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 587646DBCF7

On Thu, Jun 18, 2026 at 01:16:22PM +0200, Hans Verkuil wrote:
> On 18/06/2026 13:03, Hans Verkuil wrote:
> > Add check to prevent overflowing msg.msg[] in case the incoming data
> > is malformed.
> > 
> > Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> 
> Fixes: 056f2821b631 ("media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver")
> Cc: stable@vger.kernel.org

Looks good.

Reviewed-by: Sean Young <sean@mess.org>

> 
> Regards,
> 
> 	Hans
> 
> > ---
> > diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> > index 3381d86096a1..3c6ce6f3d93e 100644
> > --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> > +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> > @@ -657,7 +657,8 @@ static void extron_process_received(struct extron_port *port, const char *data)
> >  	if (!port || port->disconnected)
> >  		return;
> > 
> > -	if (len < 5 || (len - 2) % 3 || data[len - 2] != '*')
> > +	if (len < 5 || ((len - 2) / 3 > sizeof(msg.msg)) ||
> > +	    (len - 2) % 3 || data[len - 2] != '*')
> >  		goto malformed;
> > 
> >  	while (*data != '*') {
> > 
> 

