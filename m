Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FAA33E8C3
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 06:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhCQFIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 01:08:42 -0400
Received: from ni.piap.pl ([195.187.100.5]:43720 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhCQFI0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 01:08:26 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 63C1644396D;
        Wed, 17 Mar 2021 06:08:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 63C1644396D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1615957704; bh=i8Z6ZsDc7yiSIIZ9dPRzKrX/I6BHmKdPDlF7mkoeUbA=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=YpB1tzezlzRSXHiqLOKp7qAxKTTvI7laIgRklqhO9tAODiyNL4T/sWV5EwbkIxSCC
         dU21eRHEccbti2ejRLSiCKgnI9hE4Og3F1h652AzN8OgCQLWNV7DkuhuiQ/6J/Pkv9
         pv2HZHFEsap3M6uzuSBNuMIgiqzU2WMlNU5tjrwk=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: RFC: dt-binding: media: document ON Semi AR0521 sensor bindings
References: <m3o8fjs02a.fsf@t19.piap.pl>
        <YFEBRGF20xhpHese@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Wed, 17 Mar 2021 06:08:24 +0100
In-Reply-To: <YFEBRGF20xhpHese@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Tue, 16 Mar 2021 21:04:36 +0200")
Message-ID: <m3a6r2s6yf.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> +    const: on-semi,ar0521
>
> That's not the correct prefix for ON Semiconductor. See
> Documentation/devicetree/bindings/vendor-prefixes.yaml. Or just the name
> of this file :-)

Right, just missed this one. Thanks for the comments.
--=20
Krzysztof Halasa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
