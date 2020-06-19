Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5A620193B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 19:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732303AbgFSRTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 13:19:00 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55732 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732268AbgFSRTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 13:19:00 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05JHIusd089752;
        Fri, 19 Jun 2020 12:18:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592587136;
        bh=e+AT5soyAb0Uw8cQcpbvAnmBl2VaDJRCdiDsWXJ1KMs=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=nF+64vTE7Oj0J3po1AO5MerahzFCFgXgn7/aBeVzCFjcxZnWxIJUzWpHzkUNW3eWd
         +/qhDkzPE/MzZhhVn5Ykz0ZBTWFLCq3jKmWlOQnbZNR5E0D1Pc15Jr7DfnMbk4avq9
         qM2AHNkjpMXGr/XvhI6SG5TTQPiFPbVBnbZf4be8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05JHIuds129681
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 19 Jun 2020 12:18:56 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 19
 Jun 2020 12:18:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 19 Jun 2020 12:18:56 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id 05JHIti9110013;
        Fri, 19 Jun 2020 12:18:55 -0500
Date:   Fri, 19 Jun 2020 12:18:55 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-media <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 082/107] media: ti-vpe: cal: Move CAL I/O accessors to
 cal.h
Message-ID: <20200619171855.eqyfxah6dpsryc5o@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-83-laurent.pinchart@ideasonboard.com>
 <CAAEAJfDLv-hx=4JL2=+AgU1c8bcLhNu8_ZGu8cNtkXDVLx8H3A@mail.gmail.com>
 <20200619154020.GH5823@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200619154020.GH5823@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > 
> > Slightly unrelated, have you considered moving all of these to regmap?
> > 
> > Perhaps it will make the code more maintainable.
> 
> I'm considering it now :-) Benoit, Tomi, any objection ? Otherwise I'll
> try to switch to regmap on top of this series.

No objection from me.

Benoit

> 
> -- 
> Regards,
> 
> Laurent Pinchart
