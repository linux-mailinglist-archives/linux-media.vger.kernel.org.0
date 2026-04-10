Return-Path: <linux-media+bounces-58532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGWjH9fO2GngiQgAu9opvQ
	(envelope-from <linux-media+bounces-58532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:20:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D82FB3D593E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0F8E306C87D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C683537D5;
	Fri, 10 Apr 2026 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1xAmvdi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B345937C0F2
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815956; cv=none; b=JFZuXkUII9HFCy+aGCkX5pXn7Cm17IY98v0fj8YucM0ulAvbA3MYLZvcIH+6vUFQsMVzpbAFps4r5d9RSwHrBkOxi/foXQKHdKdX5pg8eqzgHlG8irqiqY7eUuQv+Wngt5fSix6Bk+PWFO+oIOjm9sk2jKO9uBVXLPulX0yf3pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815956; c=relaxed/simple;
	bh=YZ4aXcYu2o04FEySgc0ex+0BoAQsWZofRoYPOcOeKMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rVH922Kt36hN7g05yrPXeR170lRG2UgpsheumH+Bbx2PKbegLAX78tV2Ejac8oGqiYtRaNF/yoAIeRsuFIjUQ6QTLohSMCRiBoozAHexPLGXopCqUqTDL9wSqk3nXOh7GvQdXDlkVHxbINXdH9VPbp+Y8D98E+SGq9kV9HgJTzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1xAmvdi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso1168191f8f.3
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815953; x=1776420753; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HWGicKi+cfOFYqHtloaATdKTg9cCcGBmmLOygewQ1c=;
        b=E1xAmvdi+j5xWBSBIxi8w7gbfqH0zgsIFx/y9UwIZOzG9wsWdPFDAW2Ut7omIy1Av3
         jVWk40mw2ab/D5CqXbPkgyUqvMBztoZxT6I5ZCl0jeUrDn2oW6p3TKdyyn8qhme9uXPF
         RDj9RbtmlOnvDMRu0egtbOvUtBLramk+bkCbg4cpOXfFoKg5O5kg1S3N7jc0omfg5Wv9
         SBBw3wDom7UgX+2bqehvmrWtLmu+px3DTd/8JRkDHiLDjSogs9PODKWmT1qLzLvsDmMV
         eWfpwuSJxPBEDj0NwNpzJupos0HwXCN9DDEkJQcQz7GHhtWph7UCkpwewJF1C9VTRbu+
         CyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815953; x=1776420753;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HWGicKi+cfOFYqHtloaATdKTg9cCcGBmmLOygewQ1c=;
        b=aO7RYv2SktD2sNocG5kPnTnCrAHoXuylVv2f3jhdBvxn6wMDrhKwAqO9sHkj+LrZcg
         i2jAM5GzlYriadllzd2rJx3L2MwzoeFsArBR880c6/OfU0JV8afDX9gTjAQm7PiHcyr9
         MSy4HUynU/Op/gI6afS2hgjrPnCG/gHM0q34Okhs80gpsVFsVx0HnaFTZQzpwklFY652
         CGopdtWwWeMtMlq6ZmHBxZaaOBSL2pc7YlNpNiaSegq9BSCWkzkSbYAMg13AQ26eB7Fz
         3zgKHPb45rBdkIdj8qX4m0CuZD9kaWdcdclB7h4c7Xfg/TI1EeaJtTvbNwTiR1WN8JDv
         t36g==
X-Gm-Message-State: AOJu0YxxQIFOT+VwajRSWzjKOsVHJKL/V3Vx/x6zE7nmNS3Hmy5UUAO6
	5kLqjCNMqCBdWxPk1cugLI7MFopJ9MN7Ax2OxNp0Utw6yBKE5T3h1FkZGBzdW7lI
X-Gm-Gg: AeBDiet1IHeY3Jxd8NqoWoO8x4hHoAwmNujO/xSoiK97hHMxtJ782tq4fLbv5m37ooo
	kWEl0vqV70J/5VFxCdhOA9/5q1KFycSRBqnefqFsLj/Stveyo3VkFUXUiMBBPmeDzkxR/mw4qcY
	h7HriVSc4vEUMIs15ZGyhVYRhDW2y2sm14Gk1iO3C3yBiOWuktXx+ny27yiTf2iCejjO5zJzh5q
	xrLzcZxk358p0GfBQuP0H7FvZcAXfSm+6M0d54HWz3npeqNL1ko8hqFUHVLBOdn/+1+mnPqaF6a
	HC/2nTzIvq6/Vm0tpT/Yb8oyKz5vKyah5eOD11gfmr3PkTOw4RSe5CrOPt027H+X2sbEmabqoKS
	QYgZXOy4o4+fQNSP5v0kNjLpY8XO2nVIo7XY7QCyZjg7UpNMod1bMpJH3UU8U8tBnQUY9Q40K+k
	h0WuXc5F7wn78IYfx6jAc=
X-Received: by 2002:a05:6000:1a89:b0:43c:ef4f:79de with SMTP id ffacd0b85a97d-43d6427aa53mr3975862f8f.16.1775815952814;
        Fri, 10 Apr 2026 03:12:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a48sm6924209f8f.7.2026.04.10.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:12:32 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:12:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: rc: ttusbir: respect DMA coherency rules
Message-ID: <adjNDQ6Y3HrG4Xi-@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58532-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D82FB3D593E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Oliver Neukum,

Commit 50acaad3d202 ("media: rc: ttusbir: respect DMA coherency
rules") from Feb 11, 2026 (linux-next), leads to the following Smatch
static checker warning:

	drivers/media/rc/ttusbir.c:281 ttusbir_probe()
	error: we previously assumed 'tt->bulk_buffer' could be null (see line 198)

drivers/media/rc/ttusbir.c
    180 static int ttusbir_probe(struct usb_interface *intf,
    181                          const struct usb_device_id *id)
    182 {
    183         struct ttusbir *tt;
    184         struct usb_interface_descriptor *idesc;
    185         struct usb_endpoint_descriptor *desc;
    186         struct rc_dev *rc;
    187         int i, j, ret;
    188         int altsetting = -1;
    189         u8 *buffer;
    190 
    191         tt = kzalloc_obj(*tt);
    192         buffer = kzalloc(5, GFP_KERNEL);
    193         rc = rc_allocate_device(RC_DRIVER_IR_RAW);
    194         if (!tt || !rc || buffer) {

This ! in !buffer is missing.

    195                 ret = -ENOMEM;
    196                 goto out;
    197         }
    198         tt->bulk_buffer = buffer;
    199 
    200         /* find the correct alt setting */
    201         for (i = 0; i < intf->num_altsetting && altsetting == -1; i++) {
    202                 int max_packet, bulk_out_endp = -1, iso_in_endp = -1;
    203 
    204                 idesc = &intf->altsetting[i].desc;
    205 
    206                 for (j = 0; j < idesc->bNumEndpoints; j++) {
    207                         desc = &intf->altsetting[i].endpoint[j].desc;
    208                         max_packet = le16_to_cpu(desc->wMaxPacketSize);
    209                         if (usb_endpoint_dir_in(desc) &&
    210                                         usb_endpoint_xfer_isoc(desc) &&
    211                                         max_packet == 0x10)
    212                                 iso_in_endp = j;
    213                         else if (usb_endpoint_dir_out(desc) &&
    214                                         usb_endpoint_xfer_bulk(desc) &&
    215                                         max_packet == 0x20)
    216                                 bulk_out_endp = j;
    217 
    218                         if (bulk_out_endp != -1 && iso_in_endp != -1) {
    219                                 tt->bulk_out_endp = bulk_out_endp;
    220                                 tt->iso_in_endp = iso_in_endp;
    221                                 altsetting = i;
    222                                 break;
    223                         }
    224                 }
    225         }
    226 
    227         if (altsetting == -1) {
    228                 dev_err(&intf->dev, "cannot find expected altsetting\n");
    229                 ret = -ENODEV;
    230                 goto out;
    231         }
    232 
    233         tt->dev = &intf->dev;
    234         tt->udev = interface_to_usbdev(intf);
    235         tt->rc = rc;
    236 
    237         ret = usb_set_interface(tt->udev, 0, altsetting);
    238         if (ret)
    239                 goto out;
    240 
    241         for (i = 0; i < NUM_URBS; i++) {
    242                 struct urb *urb = usb_alloc_urb(8, GFP_KERNEL);
    243                 void *buffer;
    244 
    245                 if (!urb) {
    246                         ret = -ENOMEM;
    247                         goto out;
    248                 }
    249 
    250                 urb->dev = tt->udev;
    251                 urb->context = tt;
    252                 urb->pipe = usb_rcvisocpipe(tt->udev, tt->iso_in_endp);
    253                 urb->interval = 1;
    254                 buffer = usb_alloc_coherent(tt->udev, 128, GFP_KERNEL,
    255                                                 &urb->transfer_dma);
    256                 if (!buffer) {
    257                         usb_free_urb(urb);
    258                         ret = -ENOMEM;
    259                         goto out;
    260                 }
    261                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP | URB_ISO_ASAP;
    262                 urb->transfer_buffer = buffer;
    263                 urb->complete = ttusbir_urb_complete;
    264                 urb->number_of_packets = 8;
    265                 urb->transfer_buffer_length = 128;
    266 
    267                 for (j = 0; j < 8; j++) {
    268                         urb->iso_frame_desc[j].offset = j * 16;
    269                         urb->iso_frame_desc[j].length = 16;
    270                 }
    271 
    272                 tt->urb[i] = urb;
    273         }
    274 
    275         tt->bulk_urb = usb_alloc_urb(0, GFP_KERNEL);
    276         if (!tt->bulk_urb) {
    277                 ret = -ENOMEM;
    278                 goto out;
    279         }
    280 
--> 281         tt->bulk_buffer[0] = 0xaa;
                ^^^^^^^^^^^^^^^^^^

    282         tt->bulk_buffer[1] = 0x01;

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

