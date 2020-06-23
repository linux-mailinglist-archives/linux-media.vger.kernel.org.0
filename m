Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 371EA204FED
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 13:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732457AbgFWLBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 07:01:30 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:58012 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732289AbgFWLB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 07:01:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05NB1O7m093627;
        Tue, 23 Jun 2020 06:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592910084;
        bh=UIhZRn8PswSyZHSGlBGRj9eOayRxyeZT0e2enlbQRXc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KrpFdxrqD6QzlvOGRC1HzVue0Pc5TyNUxtP/MmCX5rlZxRLupUG69oiroTasxucgq
         v8cMFH8Fp07fFGEWKF3/lxMYUKhKG7/Onh1bACs9fUwTddNlBY+zJ6vQwCJxtywoKa
         6av9M4FALKyt9xyKIfET/UYM/cc39CNxtR7VSx64=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05NB1OeP019871
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Jun 2020 06:01:24 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Jun 2020 06:01:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Jun 2020 06:01:23 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05NB1MVJ062640;
        Tue, 23 Jun 2020 06:01:23 -0500
Subject: Re: [PATCH v1 055/107] media: ti-vpe: cal: Unregister video device
 before cleanup
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
CC:     Benoit Parrot <bparrot@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-56-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2e0af093-bd67-ffba-d7e4-ca1bc808912f@ti.com>
Date:   Tue, 23 Jun 2020 14:01:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614235944.17716-56-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/06/2020 02:58, Laurent Pinchart wrote:
> In cal_remove(), unregister the video devices as the first operation,
> before cleaning up the V4L2 objects, to avoid user-after-free. This

"use"

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
