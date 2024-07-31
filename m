Return-Path: <linux-media+bounces-15660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4C294350A
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 19:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92DB71F22B85
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 17:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE00C1BE24A;
	Wed, 31 Jul 2024 17:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SoPRarwM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668511BD50C
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 17:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722447001; cv=none; b=jf8asRCxfniMbaXJazVZdu5tdmewiO9r4NdY3xgfmPmUjd4w4Sfda52iQQ1cZfdeScCFkWc89R3WF4SCJWK9zu4JubxYlWkotRqG9w0Mx5c/m4Eys67m4uoLaUniFpjblwm8yJU3WNavctaSBbuab6r8SEQFCyATqrDiqUPrawI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722447001; c=relaxed/simple;
	bh=+WdOgppIBKd/amkMUnID1lOCik4HxEEkZwGvDDT4SBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uz598w2muPTjD0j7OiBGPZKNdijPcdkyQFLA9EfqjSeoCnb9axMZYqHjpXGIh9nqdo9bpz7gsIeRAhp0h+KzPY2EXtl/qOs2faYdx/dVSHAv9P9hwsB39DCk01voL7cTgMU3odyufRTShcuNbvOj/2NgdzAW7EVqVXh7AfLRrUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SoPRarwM; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-44fdde0c8dcso33543501cf.0
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722446997; x=1723051797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4KY8JEtInRy5xm4RIX3PTL4BAr3AAklSLy+uBqX6QE=;
        b=SoPRarwMMxZgi7l3FVWylgo9zRI5oLCS7VRAbcQD3kuThwXVX/M02UUXBsLSGFdJXo
         /r60f54al+3JcnfRj6XV59v3BfHAt4qkMR/gL8aDx1N6Pg2W/L5C9yRBkWi2Tp5RuVY3
         uEPVTmKQCNC4sKTIJ0f/7be8dWJoHoen4y5sSyPmM0PXd/dZ9GrsvQSjWolLkb4C5HGV
         Rbx8N6Me0J6bHm0bsD7TX8hAg69hi9n4bgZzqQKws6IxywfNluj+838Ycbd+M/ZzIUAd
         NjMKoY9hCP6okkKA8Pim5pROLfja0kWA9sL6Y5LJKhXEykqjoXfVLJy62E5+rkfzWLZw
         sOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722446997; x=1723051797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4KY8JEtInRy5xm4RIX3PTL4BAr3AAklSLy+uBqX6QE=;
        b=LGN5cPeVd2bGmtVV8wPl6xQnB+64UShpFLLk5d5bd3tgOdRrpkBkJS8JqVz2SJmGIM
         H9t/j8ZstHV6UfQvMpbQEoyG0xfVvwG51nypNPOhXYdWdfOGna6p9YNJRKUw2KwXOm1d
         ZSvRUT/kYITIEsVjcCDjiDEcwcCDLNTT7dlqc09dhHaP9Bieldi/7WlInd2IzN9dIadl
         nnvNmp4/u1a0MsgBOVJLLJI7qDdEs5cw6IaTXXSzQWQh6Upb82HX1wiFgUMnDk5xQN80
         9P+cBjnNUvQ6FUAH67t2h1fJZ0b9ald7Gy/9pbX8q6oyOC17UcHjvhirAiEsWIZneISA
         fbcw==
X-Forwarded-Encrypted: i=1; AJvYcCUUPKglQiHihJqgBl+HFZ2NvAyv5EPGsAVKwGq79Kz51WXkFx4FPRqqJIxIYCMSNhoTNK72U5HSmWfBhOo0mID9PNrtAT3gi5kVdh0=
X-Gm-Message-State: AOJu0YzhByrTi3VdL8rPnrbRUoYfDHetsLV7tjksGJ6Zsfz4F8xlVDV2
	nfgIyjMqmmQ3j1zirg/T7i99UZXgXDcI/OaYM3fNGqDB3qJcN3UZqj/dUjMokg==
X-Google-Smtp-Source: AGHT+IFaLcLGhecfBpoLsXZxMwB3zjexCVb6+nQ4dHeejbB6qTpegfp5KXyGkHY31WGe4ABCodgceQ==
X-Received: by 2002:a05:622a:19a0:b0:446:5787:875f with SMTP id d75a77b69052e-45004f1995amr192443891cf.38.1722446997206;
        Wed, 31 Jul 2024 10:29:57 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe812350bsm61884421cf.9.2024.07.31.10.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 10:29:56 -0700 (PDT)
Date: Wed, 31 Jul 2024 13:29:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
 <0000000000009f6f85061e684e92@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000009f6f85061e684e92@google.com>

The syzbot fuzzer reports that the smsusb driver doesn't check whether
the endpoints it uses are actually Bulk:

smsusb:smsusb_probe: board id=15, interface number 6
smsusb:siano_media_device_register: media controller created
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 42 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
...
Call Trace:
 <TASK>
 smsusb_submit_urb+0x288/0x410 drivers/media/usb/siano/smsusb.c:173
 smsusb_start_streaming drivers/media/usb/siano/smsusb.c:197 [inline]
 smsusb_init_device+0x856/0xe10 drivers/media/usb/siano/smsusb.c:477
 smsusb_probe+0x5e2/0x10b0 drivers/media/usb/siano/smsusb.c:575

The problem can be fixed by checking the endpoints' types along with
their directions.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
Tested-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/000000000000e45551061e558c37@google.com/
Fixes: 31e0456de5be ("media: usb: siano: Fix general protection fault in smsusb")
Cc: <stable@vger.kernel.org>

---

 drivers/media/usb/siano/smsusb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/media/usb/siano/smsusb.c
===================================================================
--- usb-devel.orig/drivers/media/usb/siano/smsusb.c
+++ usb-devel/drivers/media/usb/siano/smsusb.c
@@ -410,10 +410,10 @@ static int smsusb_init_device(struct usb
 		struct usb_endpoint_descriptor *desc =
 				&intf->cur_altsetting->endpoint[i].desc;
 
-		if (desc->bEndpointAddress & USB_DIR_IN) {
+		if (usb_endpoint_is_bulk_in(desc)) {
 			dev->in_ep = desc->bEndpointAddress;
 			align = usb_endpoint_maxp(desc) - sizeof(struct sms_msg_hdr);
-		} else {
+		} else if (usb_endpoint_is_bulk_out(desc)) {
 			dev->out_ep = desc->bEndpointAddress;
 		}
 	}

