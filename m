Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FA51FAEC5
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 12:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgFPK6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 06:58:39 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56914 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgFPK6i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 06:58:38 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05GAwZo7076679;
        Tue, 16 Jun 2020 05:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592305115;
        bh=2rsatO4DrL5jDImhv6pEh04MSu9W822is2UMj56v8Oo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MoAN3wngO4aP273gVTq23JtNV2DxdE8hjBuI4oWJcNJEp6stahN6IDnkhaf+r2te2
         gNn+9YhPXy/cHZ+VRY4Bwnjm3ITlCmMoSKUQ+g33Spg6VmdY6rMmj1a8OyDn1Fb48+
         w2RpU+UC14Wq6LaESPpf2lkPkbyk7PcdM8F8iEMY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GAwZiG028209;
        Tue, 16 Jun 2020 05:58:35 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Jun 2020 05:58:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Jun 2020 05:58:35 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GAwYM0078672;
        Tue, 16 Jun 2020 05:58:34 -0500
Subject: Re: [PATCH v1 027/107] media: ti-vpe: cal: Name all cal_camerarx
 pointers consistently
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
CC:     Benoit Parrot <bparrot@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-28-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <28c3b5c4-cf7d-791e-eb18-ac345906df18@ti.com>
Date:   Tue, 16 Jun 2020 13:58:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614235944.17716-28-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/06/2020 02:58, Laurent Pinchart wrote:
> Name all variables htat point to a cal_camerax instance 'phy' instead of
> 'cc'. The name 'cc' refers to Camera Core, but is not commonly used in
> the driver or in datasheets.

s/htat/that/

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
