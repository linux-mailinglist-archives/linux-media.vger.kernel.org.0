Return-Path: <linux-media+bounces-63432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fQKIKWo/H2qBjAAAu9opvQ
	(envelope-from <linux-media+bounces-63432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:39:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 464FF631CE1
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:39:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SAHMLq4n;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63432-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63432-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17CCA3039885
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 20:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82A93822A2;
	Tue,  2 Jun 2026 20:38:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2204C37B002
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 20:38:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432701; cv=none; b=cK/zS8EyUjUUPPRCF/SHGybWSZnj0jZYLe2F4wR0zHPV2fmsCWPzUd/rEy0rDma3Quwz+iMTDMa+/Tjdm78SXPz0mYNu2MTml9DbEwR4h/nfBsw0rPxckIdGz57nuivQ81gkXDmYjP4tOExhPyl1OfmzsVIM26fkhn7UJ7jvTfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432701; c=relaxed/simple;
	bh=htek696P51y1qKBmZZzLRsS9pYvkF+38dyJ3vne3hvw=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=rAC6su8vZjqam2UeojHZm/caZticMMSLJJBq7TSIqSl7AJNVurF1SgMfxXPGB6cLC3c2iWXKTDvLbabSQf9d5b7CdWj4dJJ90WtMbHxtarVYJAzhbEjS+jRNOZDWki5Y6NdZ2sZq0ndxuH6McfOPWpW597SWLqcRM7LnD7qY79I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAHMLq4n; arc=none smtp.client-ip=209.85.219.54
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cce77eb087so42261266d6.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 13:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780432699; x=1781037499; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxBuYBQ1XSjDjIjaHXQYU9VuhzlTIRREhVR5WeTyr9Y=;
        b=SAHMLq4nwIoD9mLIY0JoVRKMIwXGObjfmjjw+B6NFz7LtkWbCi8UpgbDS0M6KtdRme
         T1Dg19XIW794JVsoq3r8d+26lGhrOUbEGIMV6Wyqzv7AztwUGpCbMawY384/yfBZ4UGX
         xgu40z7OkyDfQFuH0rXYoCl1L74Hd+a+unYJ4o310SeIfsC1TfY/ae7NJUFc5sb/bP1x
         SnhHP5g9xi97iguzzzJMUC1U8jgxsN7uoQD5wJYHgUIXoxzuBqsdFTxsoclP+wcWCFfC
         u0YITK1tydqpID87cugcdV4RLEVw3ndOxHpypMymWmlXXHGT0lY4yritiBsmnZiWLMSQ
         gfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780432699; x=1781037499;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qxBuYBQ1XSjDjIjaHXQYU9VuhzlTIRREhVR5WeTyr9Y=;
        b=LxiqlfoN5IXspulgemDLob8BKjFPrRvRHf5TCx4SHM2zzZaONGaZKjExJzZE21S52Z
         9NjBeaL1d+vv7WHpLk93MSRbj1zieBpuG6+plkuU+PxfYgw3+b0O+Za3yp1OEQ4sgMPL
         mxFelzO/25W28C5o/GrLc4ZRVzsD08guFGCja2QunnJhOVNdx/TGJBCyt71kT8qpSg2t
         y8nRPnNL2vdTXeprS94VGEcIv3JmhMLWfC1iqZ2P5S7ov2Nt7Dw+eKzl0PYiVYYFWt5O
         QWKYSbI221xsYg5RbwyzFOUzKIpjm3puCHeeSXRJQWc34qAIwOMM7Bff6vmx1UtVd5Z8
         JXHQ==
X-Gm-Message-State: AOJu0Ywa7/jS05eNigH6DGwQPaoxLbNDy+H46PCETi7z/glxF/Pslzg7
	W+O+S6XfWReOJs1b6Lkcr20FFI/XjwHlvgecT5wG8wNIB2lfjFhfxypsjXANSAHB
X-Gm-Gg: Acq92OFjRSXSnLsGyWSmrpLuouH8Ul/t0eT1q6tXD5xlgsY5pwj2ZEgLhEOr8zCd2Yj
	Qw0T9jOvg2iNaaM36GOpjgAyg7w9h/3Wq7P8YKn5RuaxCmKh3BkEdHunkGJgtBZ49nkqlsiafYU
	BaSEjMzfpTaK4hRj+hXMvq4meXK8JLhIsInS2pN/Y2cp8rD/bQ4dk+WmQVmnXtpSpEBox/9mDFb
	aQ8C99H6UERpPphzgXINKtz+LFAySng8yRHDEl35CpAxIzdiLE3vfk0BzncADtHJWkAHAJxQps/
	QeCSM1n6A8oNGL12VYMiYb9Yne+arC8VpcNRc/MG6+uNj7Tvk11JAAr2XM1VXTwiO8/K9oHXft0
	g/wZWSBEiC4R0vw4frBc4AvIFcKr167Z/cOa/qC6wQZNE+7+EP6mBkNb1X7mvn8lmSXiHonijSs
	6HI1jBY8Og60Y+KNiAwHjCWvSaFpq9DlXVg+Vhpv4R0av0WPMSt6Y01vhvnij7iB26
X-Received: by 2002:a05:620a:4509:b0:8f2:c47b:962e with SMTP id af79cd13be357-9158a7fd27bmr118480785a.49.1780432698998;
        Tue, 02 Jun 2026 13:38:18 -0700 (PDT)
Received: from smtpclient.apple ([104.39.165.68])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a240aafsm47303685a.17.2026.06.02.13.38.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2026 13:38:18 -0700 (PDT)
From: Shuangpeng <shuangpeng.kernel@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: [BUG] media: as102: kmemleak reports two leaks after
 dvb_register_frontend() failure
Message-Id: <DAD7161C-A1DA-422E-BBC5-2893ABDC2DD0@gmail.com>
Date: Tue, 2 Jun 2026 16:38:07 -0400
Cc: linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: mchehab@kernel.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63432-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 464FF631CE1

Hi Kernel Maintainers,

I hit the following kmemleak reports while testing current upstream =
kernel:

kmemleak: unreferenced object in as102_usb_probe
kmemleak: unreferenced object in as102_attach

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/f122f8acb8a9e4b9ed08d6a76dd5eb79

I=E2=80=99m happy to test debug patches or provide additional =
information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

unreferenced object 0xffff88811641a000 (size 4096):
comm "kworker/1:1", pid 30, jiffies 4295053869
hex dump (first 32 bytes):
40 b3 2a 8b ff ff ff ff 00 70 47 66 81 88 ff ff  @.*......pGf....
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
backtrace (crc 52c16f09):
__kmalloc_cache_noprof (./include/linux/kmemleak.h:44 mm/slub.c:4575 =
mm/slub.c:4899 mm/slub.c:5415)
as102_usb_probe (./include/linux/slab.h:950 ./include/linux/slab.h:1188 =
drivers/media/usb/as102/as102_usb_drv.c:348)
usb_probe_interface (drivers/usb/core/driver.c:396)
really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
__driver_probe_device (drivers/base/dd.c:871)
driver_probe_device (drivers/base/dd.c:901)
__device_attach_driver (drivers/base/dd.c:1029)
bus_for_each_drv (drivers/base/bus.c:500)
__device_attach (drivers/base/dd.c:1101)
device_initial_probe (drivers/base/dd.c:1156)
bus_probe_device (drivers/base/bus.c:613)
device_add (drivers/base/core.c:3706)
usb_set_configuration (drivers/usb/core/message.c:2268)
usb_generic_driver_probe (drivers/usb/core/generic.c:250)
usb_probe_device (drivers/usb/core/driver.c:291)
really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)

unreferenced object 0xffff888166471000 (size 2048):
comm "kworker/1:1", pid 30, jiffies 4295053870
hex dump (first 32 bytes):
01 00 00 00 00 00 00 00 41 62 69 6c 69 73 20 53  ........Abilis S
79 73 74 65 6d 73 20 44 56 42 2d 54 69 74 61 6e  ystems DVB-Titan
backtrace (crc f72415e5):
__kmalloc_cache_noprof (./include/linux/kmemleak.h:44 mm/slub.c:4575 =
mm/slub.c:4899 mm/slub.c:5415)
as102_attach (./include/linux/slab.h:950 ./include/linux/slab.h:1188 =
drivers/media/dvb-frontends/as102_fe.c:450)
as102_dvb_register (drivers/media/usb/as102/as102_drv.c:326)
as102_usb_probe (drivers/media/usb/as102/as102_usb_drv.c:397)
usb_probe_interface (drivers/usb/core/driver.c:396)
really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
__driver_probe_device (drivers/base/dd.c:871)
driver_probe_device (drivers/base/dd.c:901)
__device_attach_driver (drivers/base/dd.c:1029)
bus_for_each_drv (drivers/base/bus.c:500)
__device_attach (drivers/base/dd.c:1101)
device_initial_probe (drivers/base/dd.c:1156)
bus_probe_device (drivers/base/bus.c:613)
device_add (drivers/base/core.c:3706)
usb_set_configuration (drivers/usb/core/message.c:2268)
usb_generic_driver_probe (drivers/usb/core/generic.c:250)

Best,
Shuangpeng


