Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8D33E5939
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 13:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240200AbhHJLj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 07:39:57 -0400
Received: from ni.piap.pl ([195.187.100.5]:35768 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240148AbhHJLjl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 07:39:41 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 10D43C3EDF3E;
        Tue, 10 Aug 2021 13:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 10D43C3EDF3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1628595558; bh=FdL9BLGInr5kBBQ2TbRJF7G3xMMSa4OZEBxgsKPTq1k=;
        h=From:To:Cc:Subject:Date:From;
        b=IHB3kh2jYUg/Abiia3EXI4aWl0qyE2F6ab7e6H5oP0eo4vSUW6GZ2l9qtDSXURIne
         5AkfaQL6UP03zdjbRSaclSa+FGh7V8i0dh/0aMQspMr62baUbTmWtrtOwjqUwGArrb
         PK8wLivjq6y2DAdnMlt1TIft+SVCTTpUy1j9BVVU=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: My AR0521 patches
Sender: khalasa@piap.pl
Date:   Tue, 10 Aug 2021 13:39:17 +0200
Message-ID: <m3v94d8r6i.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165493 [Aug 10 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 454 454 39c6e442fd417993330528e7f9d13ac1bf7fdf8c, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, piap.pl:7.1.1;t19.piap.pl:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/08/10 10:20:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/08/10 03:45:00 #17007547
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro, Laurent,

I've posted a couple of AR0521 patches (the driver + DTB stuff) a week+
ago (marked 'v4') - is there anything I can/should do with them?

Greetings,
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
