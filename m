Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47D3F3D73FE
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 13:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbhG0LDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 07:03:55 -0400
Received: from ni.piap.pl ([195.187.100.5]:44220 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236274AbhG0LDy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 07:03:54 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 5DD79C3F2A52;
        Tue, 27 Jul 2021 13:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 5DD79C3F2A52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1627383833; bh=Amq+jkF0BngY9L7QHpS8oR7xrYrTBUXFufJ73FZ21XY=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=jgJ1z/1MZIwzc4MYIOzf+Yq98QPAhzIFppHNqgiOTI1vMeWXq+gIUNQmnnhYicNNi
         JmPtNJdqDddSQ/ttykbHmN19ab3Xkrrzu8d6/EI6mKHe4UgqOZYRtqQ1goFL0rao3D
         P5st0lEF4LP0Y8zSZgs8w45F1Bue7IzoOxYCqsBI=
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
Date:   Tue, 27 Jul 2021 13:03:53 +0200
In-Reply-To: <20210727105830.GH3@valkosipuli.retiisi.eu> (Sakari Ailus's
        message of "Tue, 27 Jul 2021 13:58:30 +0300")
Message-ID: <m3fsw0auhy.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165268 [Jul 27 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_Text_ENG_RU_Has_Extended_Latin_Letters, eng}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;piap.pl:7.1.1;t19.piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/27 08:44:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/27 08:46:00 #16963359
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Sakari Ailus <sakari.ailus@iki.fi> writes:

> I think Laurent meant:
>
> 	    bus-type:
> 	      const: 4
>
> This way the bindings can be later amended with HiSPi support without
> relying on defaults. Albeit the other busses in practice almost never end
> up being used even if supported, apart from the standard BT.601, BT.656 a=
nd
> CSI-2.
>
> Either way is fine IMO.

Ok, so I'll leave it as is (apart from Rob's additions/changes).

> No need to add support for the driver.

Ok.

Thanks.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
