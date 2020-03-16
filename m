Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF4D1868BB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 11:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730491AbgCPKL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 06:11:59 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53946 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730468AbgCPKL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 06:11:59 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GABtrn013117;
        Mon, 16 Mar 2020 05:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584353515;
        bh=yNmvgpYn7ogOdwoQm4MkrQ2aTuMpR7B0uJW101hOLmc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=crxAk4dZe4d2+Xh6pR9inq1qps90cOZ0O3vO/XA+kE13rvpicl9yYarZaHUemFwaC
         rOiZ/uguAYAXEB8VuGDvaDUosgY2adZxfa8S+76oXkrMNo1hdvD8qa4OMxXiBT45Qt
         Wk+NB3P/icbkHYHUIbXvn5Om3rAyi4WDoynZMw6A=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GABto8045247
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 05:11:55 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 05:11:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 05:11:55 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GABp5o028467;
        Mon, 16 Mar 2020 05:11:52 -0500
Subject: Re: [PATCH 14/16] media: ti-vpe: cal: improve wait for CIO resetdone
To:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-14-tomi.valkeinen@ti.com>
 <1da1aa0c-ac99-bfcb-d341-452be9997611@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <bc9e71c8-5aea-3c7c-98e6-c6e2f0adaff7@ti.com>
Date:   Mon, 16 Mar 2020 12:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1da1aa0c-ac99-bfcb-d341-452be9997611@xs4all.nl>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2020 12:05, Hans Verkuil wrote:
> On 3/13/20 12:41 PM, Tomi Valkeinen wrote:
>> Sometimes waiting for ComplexIO resetdone timeouts.
> 
> This sentence is hard to read. You probably mean:
> 
> Sometimes there is a timeout when waiting for the 'ComplexIO Reset Done'.

Ah, indeed, it's confusing. And same with the next patch. I'll update the desc.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
