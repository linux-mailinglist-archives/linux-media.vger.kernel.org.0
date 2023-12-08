Return-Path: <linux-media+bounces-2018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50C80ACC4
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 20:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30FC11F2132E
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 19:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270D54A980;
	Fri,  8 Dec 2023 19:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxP1WoZX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B7910E7
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 11:15:32 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-db548cd1c45so2407360276.2
        for <linux-media@vger.kernel.org>; Fri, 08 Dec 2023 11:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702062931; x=1702667731; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HRz7IsCbz6/1gHw/96agdraBnMYiN3V+EnTOm9Z29tg=;
        b=PxP1WoZXlbxCoRCpZELmNs+T74qv6P0sD+MmtqmAjw7ZzOx2HOPaej11xvThq21Hee
         T8W8VtGUiQAFdiVvCsxppiRGlhk1syKT6IvG2ESIY1lToPspIrPyKlfbLoGp70E/jHz3
         ZZP6ZGgiT1Zqn1k7RMYU9ESDPHMYfsnxsksM6V5Q1sv8r1bhxF5hlvTMmWsDQ3r2IDyW
         Hcqm6fa7dxNtqGoAQ/kJa6WJc4JXyFpVwMEWMysERn0XixDZUjyq3BeJwEb6k6mRmR05
         /xEgxPXSAPW2JYe+s/j4c89sFza2bnqiBWKFKQzjwYEfkm8OVPLzOxQ+5Le9cpHqKuEV
         u8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702062931; x=1702667731;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRz7IsCbz6/1gHw/96agdraBnMYiN3V+EnTOm9Z29tg=;
        b=m/WvtzsYGqgIuc2ZXJzS9FpVGsBB1o2Bvpjq3GdEFykgZLvucR6caUfHl+j8ZSxiUc
         DylUvRj+ryZi5gQtY4yRfquy4fzw2c2R+COFHUE1xgTW9qhJkJ4LSLJPVtQol7hYVU9Y
         VbKAFd3oV6k4TmE5jvC7c9Hf6YPDw3IzhIn92g7sMgUh/rK0dAcP+c+iWrbozidhb8Vx
         wtWXHZiHnUieRV+htOz+htZo35K3AoZSdIzDYLlLQG1RxH5N26yLGCll+q2hvSARgZ3C
         ZhBAUt6+T/EB/58tDLhalJzuHbCB1Bpu6ZtJNG1HRVFUBPZSKhmkkj7CoPxaInmZOj6w
         qhAQ==
X-Gm-Message-State: AOJu0YyJB0aOnhZLuVuNypPk8TJ+EOBi6b182IFiJqgqVJvOoMYf3x6D
	AJNLyVG/yek/u8sz2C8qML38gUrIwRopzVHYB6N9rm2Rip0=
X-Google-Smtp-Source: AGHT+IHHhMaCZIVRNMPdrsGuMMSEXxW/C7CvUxAqYCPF92M/zHeyLNysQhaOixln5xwdBzURzvG1PUHwthg4SxT4s14=
X-Received: by 2002:a25:ab86:0:b0:db7:2cad:4b0f with SMTP id
 v6-20020a25ab86000000b00db72cad4b0fmr423879ybi.52.1702062931514; Fri, 08 Dec
 2023 11:15:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jelte Veldstra <jelte.veldstra@gmail.com>
Date: Fri, 8 Dec 2023 20:15:23 +0100
Message-ID: <CAB5oYK+uyNnHRF3MdFWPm0N=xUxR-b_NZHAEwRPy5VeQV_s-Yg@mail.gmail.com>
Subject: Anysee E30 Combo Plus USB DVB-C adapter stopped working on kernel >6.1.38-4
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, I'm running Debian Bookworm. On kernel package 6.1.0-11-amd64
(6.1.38-4) my Anysee E30 Combo Plus USB DVB-C tuners are working fine
and /dev/dvb/adapterX device files are created.

After upgrading to kernel package 6.1.0-13-amd64 (6.1.55-1) the
adapters are not recognized anymore:
[ 1530.507446] usb 3-3: new high-speed USB device number 8 using xhci_hcd
[ 1531.211672] usb 3-3: Device not responding to setup address.
[ 1531.419562] usb 3-3: Device not responding to setup address.
[ 1531.627456] usb 3-3: device not accepting address 8, error -71
[ 1531.963481] usb 3-3: new high-speed USB device number 9 using xhci_hcd
[ 1533.191946] usb 3-3: config 1 interface 0 altsetting 0 bulk
endpoint 0x1 has invalid maxpacket 64
[ 1533.191959] usb 3-3: config 1 interface 0 altsetting 0 bulk
endpoint 0x81 has invalid maxpacket 64
[ 1533.191966] usb 3-3: config 1 interface 0 altsetting 1 bulk
endpoint 0x1 has invalid maxpacket 64
[ 1533.191972] usb 3-3: config 1 interface 0 altsetting 1 bulk
endpoint 0x81 has invalid maxpacket 64
[ 1533.192402] usb 3-3: New USB device found, idVendor=1c73,
idProduct=861f, bcdDevice= 1.00
[ 1533.192414] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 1533.192420] usb 3-3: Product: anysee-FA(LP)
[ 1533.192425] usb 3-3: Manufacturer: AMT.CO.KR
[ 1533.194910] usb 3-3: dvb_usb_v2: found a 'Anysee' in warm state
[ 1533.199872] usb 3-3: dvb_usb_anysee: firmware version 1.2 hardware id 15
[ 1533.199933] usb 3-3: dvb_usb_v2: will pass the complete MPEG2
transport stream to the software demuxer
[ 1533.199945] dvbdev: DVB: registering new adapter (Anysee)
[ 1533.199948] usb 3-3: media controller created
[ 1533.200284] dvbdev: dvb_create_media_entity: media entity
'dvb-demux' registered.
[ 1533.207678] DVB: TDA10023(-1): tda10023_readreg: readreg error (reg
== 0x1a, ret == -95)
[ 1533.207714] usb 3-3: dvb_usb_anysee: Unsupported Anysee version.
Please report to <linux-media@vger.kernel.org>.

As a result /dev/dvb is missing also.

I reverted to kernel package 6.1.0-11-amd64 (6.1.38-4) after reading
of other DVB users that had issues with their tuners cards and got it
working when reverting to 6.1.0-11-amd64. I did not try 6.1.0-12 as
other user experiences suggested that 6.1.0-11-amd64 was the last
working version for them.

The error message suggests reporting it here. If you could get it
supported again, then that would be great.

Regards,


Jelte

