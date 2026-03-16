Return-Path: <linux-media+bounces-55927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML4UDE8TuGk7YwEAu9opvQ
	(envelope-from <linux-media+bounces-55927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:27:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED829B546
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D08C3051143
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2CE27AC31;
	Mon, 16 Mar 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KPbS2RaX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7212765D7
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671091; cv=none; b=BUNtdyHCca+xC3oYYHmtYKVCGJ4knLH/kjyreGQB+xfmOy+guLCU5AIHvlF0m89vWhB0t6G/oX8ILyrol+/ahYdElRChz46zRVvQje6t5dzsx8npOazP5LEf7gdRAclz3TH2Pbyp8yopHb1UGbICpQHtMMdoUGjZtpm5Cj4t1wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671091; c=relaxed/simple;
	bh=Xkqrf1BuI6bC6V4x+n9ymu9SDz1mVTCdxmU19+l2dm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/av5QQmHmWEBEs7qv7tMrruau/H5PDUXSa2KJfxrnPjHLObNHgsjFf2/SnZzfvc3holgJ1tO3pAOPMZyowngvnaCvQZn5Jg8Zth2p/4ivJ4PDo04nbcNQOW9Ez1Lcit/E/M2VhG3oLzPpMmZxwhix/xoHymijjSOnEqUvG6dp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KPbS2RaX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C6420B1A;
	Mon, 16 Mar 2026 15:23:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773671017;
	bh=Xkqrf1BuI6bC6V4x+n9ymu9SDz1mVTCdxmU19+l2dm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPbS2RaXK1+Sdl9UHEKBsHXN4BI7V4bwnP5DnzG8AnjEiLte4jU2Tt1BVl68KFY3g
	 YE5ITjDV9pNW+LPz1HWc8jJ1OwG6nWxcr+vZXtelXRTIhh7xVykEzBjW/aKjl3vEb4
	 0XV/iMBV2dkY3dGZgUnMQIJ5HTtn5O71aMdlKpw8=
Date: Mon, 16 Mar 2026 16:24:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yazan Doofesh <yazan.doofesh@gmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH] media: uvcvideo: handle duplicate unit/terminal ID in
 UVC descriptor
Message-ID: <20260316142446.GD31604@killaraus.ideasonboard.com>
References: <CANEv+DwzykgnHxs7GNUrTPFtaavoSWVP-yYikBwA7YXQ9Eq1iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANEv+DwzykgnHxs7GNUrTPFtaavoSWVP-yYikBwA7YXQ9Eq1iw@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55927-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 95ED829B546
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 05:18:45PM +0300, Yazan Doofesh wrote:
> Hello,
> 
> Some cameras incorrectly assign the same ID to both a processing unit and an
> output terminal in their UVC VideoControl descriptor. When uvc_alloc_new_entity
> () detects the duplicate, it currently invalidates the new entity's ID. If the
> new entity is the output terminal, the streaming interface (which links to that
> terminal by ID) can no longer find it, and no /dev/video* node is created.
> 
> The kernel log for such a device shows: uvcvideo 1-2.3:1.0: Found multiple
> Units with ID 5 usb 1-2.3: No streaming interface found for terminal 65535.
> 
> The "65535" (0xffff = UVC_INVALID_ENTITY_ID) confirms the terminal's ID was
> overwritten.
> 
> Fix: when the incoming entity is an output terminal and the conflicting entity
> is a unit, remove the unit from the entity list and allow the terminal to keep
> the original ID. This is safe during the parsing phase because chain-building
> has not yet begun.
> 
> Tested with: Generalplus Technology Inc. GENERAL WEBCAM (idVendor=1b3f,
> idProduct=2247). The camera works on Windows (which tolerates the malformed
> descriptor) but produced no /dev/video* node on Linux prior to this fix.
> 
> USB descriptor excerpt showing the conflict: VideoControl Interface Descriptor:
> bUnitID 5 bSourceID 4 VideoControl Interface Descriptor: bTerminalID 5
> wTerminalType 0x0101 USB Streaming bSourceID 4 VideoStreaming Interface
> Descriptor: bTerminalLink 5
> 
> Note: this patch was diagnosed and written with the assistance of Claude
> (Anthropic AI). The fix has been tested and confirmed working on kernel 6.17.7.

NAK. Please don't waste my time with LLM-generated contents. The next
attempt will result in your e-mail address being added to my block list.

> Signed-off-by: Yazan Doofesh <yazan.doofesh@gmail.com>
> 
> drivers/media/usb/uvc/uvc_driver.c | 21 ++++++++++++++++----- 1 file changed,
> 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/
> uvc_driver.c index 50e158966..39fbdc166 100644 --- a/drivers/media/usb/uvc/
> uvc_driver.c +++ b/drivers/media/usb/uvc/uvc_driver.c @@ -814,9 +814,26 @@
> static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16
> type, }
> 
> /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> 
>   • if (uvc_entity_by_id(dev, id)) {
>   •   dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> 
>   •   id = UVC_INVALID_ENTITY_ID;
> 
>   • {
> 
>   •   struct uvc_entity *conflict = uvc_entity_by_id(dev, id);
> 
>   • 
>   •   if (conflict) {
> 
>   •         dev_warn(&dev->intf->dev,
> 
>   •                  "Found multiple Units with ID %u\n", id);
> 
>   •         if (type & UVC_TERM_OUTPUT) {
> 
>   •                 /*
> 
>   •                  * Some cameras (e.g. Generalplus 1b3f:2247)
> 
>   •                  * incorrectly assign the same ID to both a unit
> 
>   •                  * and an output terminal. The streaming interface
> 
>   •                  * links to the terminal by ID, so drop the
> 
>   •                  * conflicting unit and keep the terminal's ID.
> 
>   •                  */
> 
>   •                 list_del(&conflict->list);
> 
>   •                 kfree(conflict);
> 
>   •         } else {
> 
>   •                 id = UVC_INVALID_ENTITY_ID;
> 
>   •         }
> 
>   •   }
> 
>     }
> 
>     extra_size = roundup(extra_size, sizeof(*entity->pads));
> 
>   • 
> 
> Yazan Doofesh
> 
> Project Manager
> Tel: +926 799 866 381
> Amman, Jordan

-- 
Regards,

Laurent Pinchart

