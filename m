Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B120F5BE63
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 16:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729724AbfGAOey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 10:34:54 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48534 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfGAOey (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 10:34:54 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61EYeUV073343;
        Mon, 1 Jul 2019 09:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561991680;
        bh=cyHop+GSfkh1vgGnTZxWTEXAnODsgbNOUZbNoREaWBk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=H3tkKiHKfD6ud1lt5vFApjgzjfGno+OkXw3AKgEI3tyv3jA35s8m12VorgAgpurrf
         hZP4sNJf+olbTEG2a1Sstz4TygkTAGhfxdLYwH5oADbGlIEDxsd1kCnS3YZ5BsIyND
         E3kCaOOuOKLvMndMrQazA3YE75/KBs7gHPrGZFG0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61EYexg100699
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 09:34:40 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 09:34:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 09:34:39 -0500
Received: from [172.24.190.172] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61EYajr076737;
        Mon, 1 Jul 2019 09:34:37 -0500
Subject: Re: [PATCH] media: davinci-vpbe: remove obsolete includes
To:     Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190628105131.3130257-1-arnd@arndb.de>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <77b1444b-6d37-28d4-50c3-3f9f79b7a1ea@ti.com>
Date:   Mon, 1 Jul 2019 20:04:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190628105131.3130257-1-arnd@arndb.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/06/19 4:21 PM, Arnd Bergmann wrote:
> The driver builds fine without these, and they cause build
> problems once davinci multiplatform support is enabled.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
