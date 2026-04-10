Return-Path: <linux-media+bounces-58568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FbqFJ9Z2WksowgAu9opvQ
	(envelope-from <linux-media+bounces-58568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 22:12:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4613DC671
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 22:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C5B030658B8
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 20:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDB838F938;
	Fri, 10 Apr 2026 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="lzLgCWX4"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962AC34A3DF
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775851585; cv=none; b=nRY6xEpe/FCB5LINk8IX7ngF9PLjIb3ZVbH4gkcJJGoNUPrC0EyciOSa9utIZzZVlEq//2w1vO0gVBOZqUFxl1MqrLJo+fmtXGPwXuUpwJPQr9GjqOejzOMbKuJcOkws1Tli/UW/9Av+kRDgJec45SYBWPEK/2MkQ+oQ96dQxVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775851585; c=relaxed/simple;
	bh=qy34b7TDfQodHrm9GmA81QczcD4czaF4NMyqU2vcYlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/OcQ7z5EfcxLmloGvDCx6hLoMxyELdFICrjeHaZW1htk303HRljMvNKzyn8M51NVHK91XrW29OyEU4XQ9spGaogAXn3FNBDypdGy4zvJJfKO9FbKvWCgYrtU8mFj8PxPaO4hVJJzU5eH1JeT3ASbTR7kAtILyCbw0/2EicC1+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=lzLgCWX4; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1775851174; bh=qy34b7TDfQodHrm9GmA81QczcD4czaF4NMyqU2vcYlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzLgCWX4r3YPtat+eAiLHsbirUgZVssAqbtDxlrRV1+XDRMQxZ/Ta3Jy5ZOoQo5JD
	 CEl0XNlAVGhc6+xy/sN8pV+JzdUuhnr2QGpc0NrcCo4iSmUrfT9JlxLYyL0Rhx+d6L
	 YvCHMGCOJccobn4pN5l8q2TENyQ5wW1VCIEFxohpLoiGQRzOqSRc999v6WPPrTgRFT
	 niIitiUDCXmaQhtLek1Bybc+6V+v6M63auLtsAT7el+aAQRrkEVn2MwIpLXRWzHfJs
	 V5CYx9abuYyq9/Fh67k+GVePIKG5N+98gHsx1J5tz3O2rW4uQ3N0+Td626uk51wzw+
	 8QVRKLAdgMW+Q==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id CDA0C10119E; Fri, 10 Apr 2026 20:59:34 +0100 (BST)
Date: Fri, 10 Apr 2026 20:59:34 +0100
From: Sean Young <sean@mess.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org
Subject: Re: [bug report] media: rc: ttusbir: respect DMA coherency rules
Message-ID: <adlWpq7_W0U0dgom@gofer.mess.org>
References: <adjNDQ6Y3HrG4Xi-@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjNDQ6Y3HrG4Xi-@stanley.mountain>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58568-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB4613DC671
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 01:12:29PM +0300, Dan Carpenter wrote:
> Hello Oliver Neukum,
> 
> Commit 50acaad3d202 ("media: rc: ttusbir: respect DMA coherency
> rules") from Feb 11, 2026 (linux-next), leads to the following Smatch
> static checker warning:
> 
> 	drivers/media/rc/ttusbir.c:281 ttusbir_probe()
> 	error: we previously assumed 'tt->bulk_buffer' could be null (see line 198)
> 
> drivers/media/rc/ttusbir.c
>     180 static int ttusbir_probe(struct usb_interface *intf,
>     181                          const struct usb_device_id *id)
>     182 {
>     183         struct ttusbir *tt;
>     184         struct usb_interface_descriptor *idesc;
>     185         struct usb_endpoint_descriptor *desc;
>     186         struct rc_dev *rc;
>     187         int i, j, ret;
>     188         int altsetting = -1;
>     189         u8 *buffer;
>     190 
>     191         tt = kzalloc_obj(*tt);
>     192         buffer = kzalloc(5, GFP_KERNEL);
>     193         rc = rc_allocate_device(RC_DRIVER_IR_RAW);
>     194         if (!tt || !rc || buffer) {
> 
> This ! in !buffer is missing.

Yep, that's wrong.

Thank you for reporting, this obviously breaks the driver.

Sean

> 
>     195                 ret = -ENOMEM;
>     196                 goto out;
>     197         }
>     198         tt->bulk_buffer = buffer;
>     199 
>     200         /* find the correct alt setting */
>     201         for (i = 0; i < intf->num_altsetting && altsetting == -1; i++) {
>     202                 int max_packet, bulk_out_endp = -1, iso_in_endp = -1;
>     203 
>     204                 idesc = &intf->altsetting[i].desc;
>     205 
>     206                 for (j = 0; j < idesc->bNumEndpoints; j++) {
>     207                         desc = &intf->altsetting[i].endpoint[j].desc;
>     208                         max_packet = le16_to_cpu(desc->wMaxPacketSize);
>     209                         if (usb_endpoint_dir_in(desc) &&
>     210                                         usb_endpoint_xfer_isoc(desc) &&
>     211                                         max_packet == 0x10)
>     212                                 iso_in_endp = j;
>     213                         else if (usb_endpoint_dir_out(desc) &&
>     214                                         usb_endpoint_xfer_bulk(desc) &&
>     215                                         max_packet == 0x20)
>     216                                 bulk_out_endp = j;
>     217 
>     218                         if (bulk_out_endp != -1 && iso_in_endp != -1) {
>     219                                 tt->bulk_out_endp = bulk_out_endp;
>     220                                 tt->iso_in_endp = iso_in_endp;
>     221                                 altsetting = i;
>     222                                 break;
>     223                         }
>     224                 }
>     225         }
>     226 
>     227         if (altsetting == -1) {
>     228                 dev_err(&intf->dev, "cannot find expected altsetting\n");
>     229                 ret = -ENODEV;
>     230                 goto out;
>     231         }
>     232 
>     233         tt->dev = &intf->dev;
>     234         tt->udev = interface_to_usbdev(intf);
>     235         tt->rc = rc;
>     236 
>     237         ret = usb_set_interface(tt->udev, 0, altsetting);
>     238         if (ret)
>     239                 goto out;
>     240 
>     241         for (i = 0; i < NUM_URBS; i++) {
>     242                 struct urb *urb = usb_alloc_urb(8, GFP_KERNEL);
>     243                 void *buffer;
>     244 
>     245                 if (!urb) {
>     246                         ret = -ENOMEM;
>     247                         goto out;
>     248                 }
>     249 
>     250                 urb->dev = tt->udev;
>     251                 urb->context = tt;
>     252                 urb->pipe = usb_rcvisocpipe(tt->udev, tt->iso_in_endp);
>     253                 urb->interval = 1;
>     254                 buffer = usb_alloc_coherent(tt->udev, 128, GFP_KERNEL,
>     255                                                 &urb->transfer_dma);
>     256                 if (!buffer) {
>     257                         usb_free_urb(urb);
>     258                         ret = -ENOMEM;
>     259                         goto out;
>     260                 }
>     261                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP | URB_ISO_ASAP;
>     262                 urb->transfer_buffer = buffer;
>     263                 urb->complete = ttusbir_urb_complete;
>     264                 urb->number_of_packets = 8;
>     265                 urb->transfer_buffer_length = 128;
>     266 
>     267                 for (j = 0; j < 8; j++) {
>     268                         urb->iso_frame_desc[j].offset = j * 16;
>     269                         urb->iso_frame_desc[j].length = 16;
>     270                 }
>     271 
>     272                 tt->urb[i] = urb;
>     273         }
>     274 
>     275         tt->bulk_urb = usb_alloc_urb(0, GFP_KERNEL);
>     276         if (!tt->bulk_urb) {
>     277                 ret = -ENOMEM;
>     278                 goto out;
>     279         }
>     280 
> --> 281         tt->bulk_buffer[0] = 0xaa;
>                 ^^^^^^^^^^^^^^^^^^
> 
>     282         tt->bulk_buffer[1] = 0x01;
> 
> This email is a free service from the Smatch-CI project [smatch.sf.net].
> 
> regards,
> dan carpenter

