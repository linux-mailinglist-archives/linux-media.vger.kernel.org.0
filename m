Return-Path: <linux-media+bounces-47570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AADC79247
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 14:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9B674EA39F
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 13:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB09B3431EF;
	Fri, 21 Nov 2025 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="gw2DlDjx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx12.kaspersky-labs.com (mx12.kaspersky-labs.com [91.103.66.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5CC2F2900;
	Fri, 21 Nov 2025 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.103.66.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763730464; cv=none; b=psZhPD3thgSQbQymcm41kQgqCLZNfIAxlpswbhej5vJnTfsGxb897rgHGkKZ4+wkN5boOuOBMJl9GAhMhEks8QM/PO2eHCGrvR1chkhSZPKdPUvSyDcd6az4+zTFLolGUBDZkVvWmO2WbxYdPyj0yuzSU70c67CZ7FVuJUYXy3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763730464; c=relaxed/simple;
	bh=XSWFcLzFNcH7IwA2R3+9HEqRUYncMcqCIwvE/4AErvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HB4MurpIBG5f5sTXICw8crW5Eyh7jsuH7RiwQWp37aeCVz7Enl4+ZFciq5AAn56EndF94OGO/wSRNzmJuAfpbzwAKrWROOzzCP4mBtefODmJw67wQeV2gOZP7CclcsgD9b/BXNedH/Gc8O6WYq+ETxPSg4XCvzeYoIBEvj0R35U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=gw2DlDjx; arc=none smtp.client-ip=91.103.66.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1763730454;
	bh=VZSbMUCFGQuW/l8NxXF+VNPEjirlq3pKnNbZ2j41dCE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=gw2DlDjxaLXjp7FXldBaOC1zZZMA3A+HJi4TjrpPwMZTsffVk+MUKNb/DEhNV6Rhv
	 axxxrv4PsLs7yEzvzig0FmtW/YUL/tiXUS6aNzAMWOZ8LQ+TxO8umk9motovCCYjvH
	 TZLlP4TjJsCcLnX9qijZ48LALX7WyFWxipXlN1lMiXqlu/T1Rbi32MDSO7FFQcTHwV
	 +h9xnC2W39FE+JsnhEXnoEZN/MIPACDHtXgvEsoZurU/vgltuFNV/7NOsRqCuGOhRd
	 c2bSeha7B9wCopwJv7MyvHw1Z/d6ykoR27C3CL8NfOBVyAsV74amb321V+5dRsPwek
	 qLYHxd1f5kntw==
Received: from relay12.kaspersky-labs.com (localhost [127.0.0.1])
	by relay12.kaspersky-labs.com (Postfix) with ESMTP id F1A235A18AA;
	Fri, 21 Nov 2025 16:07:33 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub12.kaspersky-labs.com (Postfix) with ESMTPS id 164515A17B1;
	Fri, 21 Nov 2025 16:07:32 +0300 (MSK)
Received: from HQMAILSRV3.avp.ru (10.64.57.53) by HQMAILSRV2.avp.ru
 (10.64.57.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 21 Nov
 2025 16:07:32 +0300
Received: from HQMAILSRV3.avp.ru ([fe80::3db3:73bc:819f:30e7]) by
 HQMAILSRV3.avp.ru ([fe80::3db3:73bc:819f:30e7%10]) with mapi id
 15.02.2562.029; Fri, 21 Nov 2025 16:07:32 +0300
From: Sergey Nalivayko <Sergey.Nalivayko@kaspersky.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Alan Stern
	<stern@rowland.harvard.edu>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Antoine Jacquet <royale@zerezo.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
	"syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com"
	<syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] dvb-usb: dtv5100: rewrite i2c message usb_control
 send/recv
Thread-Topic: [PATCH] dvb-usb: dtv5100: rewrite i2c message usb_control
 send/recv
Thread-Index: AQHcV9qGMUMw9E7/x02wMd1BZ/CtXLT59qeAgAA/8wCAAuY4sA==
Date: Fri, 21 Nov 2025 13:07:32 +0000
Message-ID: <f2e6bea0262748bc9c6fdcf81cd70607@kaspersky.com>
References: <20251117155356.1912431-1-Sergey.Nalivayko@kaspersky.com>
 <f0c93964-2971-428f-8fb9-f72147f1ad29@rowland.harvard.edu>
 <aR4dFL75cdb0ccQQ@shikoro>
In-Reply-To: <aR4dFL75cdb0ccQQ@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-kse-serverinfo: HQMAILSRV2.avp.ru, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 11/21/2025 11:55:00 AM
x-kse-bulkmessagesfiltering-scan-result: InTheLimit
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/11/21 08:31:00 #27956385
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52

>On Wed, Nov 19, 2025 at 18:51, Alan Stern wrote:
>> Can't this problem be fixed more simply by setting the=20
>> I2C_AQ_NO_ZERO_LEN_READ adapter quirk flag, as in some of Wolfram=20
>> Sang's recent commits?

On Wed, Nov 19, 2025 at 22:40, Wolfram Sang wrote:
> I think so. Hmm, I searched the tree for potential candidates. Seems this=
 slipped through :( For reference, I fixed it in another media driver with =
commit b5ae5a79825b ("media: usb: hdpvr: disable zero-length read messages"=
).

Thanks for your comment. Unfortunately, setting the I2C_AQ_NO_ZERO_LEN_READ=
 adapter quirk does not solve the issue, as the problem occurs within the d=
tv5100_i2c_msg() function itself when it receives a message of NON-ZERO len=
gth. A message with length 1 arrives,  but it's expected only in the case o=
f a combined write/read operation,  when two messages arrive simultaneously=
 via the I2C interface (this is explicitly checked in the condition). If th=
ere's only one message, the  last parameter of the dtv5100_i2c_msg() functi=
on, rlen, is 0,  and a parameter inconsistency error occurs.

