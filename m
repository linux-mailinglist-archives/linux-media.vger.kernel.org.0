Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9530D3DB450
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 09:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237639AbhG3HMl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 03:12:41 -0400
Received: from ni.piap.pl ([195.187.100.5]:37406 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237572AbhG3HMk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 03:12:40 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id CAEDFC36956D;
        Fri, 30 Jul 2021 09:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl CAEDFC36956D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1627629154; bh=tiyho+ksOuS7E+whKYZ8Awa+pPodo/HKYJgqPKeF7IQ=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=Pa9pOQrMvjBA9AnfMgkGxnMX19EAnsmY6+XVevJnziWyIEM+LF5x4fdJkfquKraM8
         zmsUhFwDzAZ2rFJ/u/YHTshW9WUxMNSAYlgN5wYGrt135lKieJVMFeWhHjlAUaLu0z
         3H7lvN0zXFC0N7dn4Kq3kYhriIIstAyPhyNyTxL4=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC v3] dt-binding: media: document ON Semi AR0521 sensor
 bindings
References: <m37dhkdrat.fsf@t19.piap.pl>
        <YP9ccgd7WNpHuLgG@pendragon.ideasonboard.com>
        <m3o8aoavrv.fsf@t19.piap.pl>
        <20210727105830.GH3@valkosipuli.retiisi.eu>
Sender: khalasa@piap.pl
Date:   Fri, 30 Jul 2021 09:12:33 +0200
In-Reply-To: <20210727105830.GH3@valkosipuli.retiisi.eu> (Sakari Ailus's
        message of "Tue, 27 Jul 2021 13:58:30 +0300")
Message-ID: <m3pmv09swu.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165318 [Jul 30 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, piap.pl:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;t19.piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/30 05:50:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/30 04:15:00 #16998356
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari, Laurent,

Sakari Ailus <sakari.ailus@iki.fi> writes:

> I think Laurent meant:
>
> 	    bus-type:
> 	      const: 4

Ok I found what it means :-)
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
