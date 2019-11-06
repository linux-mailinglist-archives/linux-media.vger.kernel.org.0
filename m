Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 951AAF2039
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 21:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732695AbfKFU5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 15:57:49 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33598 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfKFU5t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 15:57:49 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6KuoVG060089;
        Wed, 6 Nov 2019 14:56:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573073810;
        bh=Plw/lbdrFcvrm9T9odjvQNPtgzwCDC6FvtsotYqC7GM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=LGMmjZcS+HM5DoqX16SqLq1uXNIdkdpY1gzHHhtt/nxx05046NJmFiqaXviGgFWnp
         8gZfNx3KTynHwsqVhCEzS7ugmLqYAD7Wqae1S+/CGgztn9iSjEnoHPT7JrkzJCiPeS
         rl0FF9kYDYLxz9zNixqf2ogoWAcN12MCJF/y6n8g=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6KuoT8036801
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Nov 2019 14:56:50 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 14:56:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 14:56:35 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id xA6Kuomh043436;
        Wed, 6 Nov 2019 14:56:50 -0600
Date:   Wed, 6 Nov 2019 14:59:51 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 15/20] media: ti-vpe: cal: Add subdev s_power hooks
Message-ID: <20191106205951.v7iisesmy7hcvozo@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
 <20191104193140.31145-16-bparrot@ti.com>
 <20191106090839.GD6253@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191106090839.GD6253@valkosipuli.retiisi.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@iki.fi> wrote on Wed [2019-Nov-06 11:08:39 +0200]:
> Hi Benoit,
> 
> On Mon, Nov 04, 2019 at 01:31:35PM -0600, Benoit Parrot wrote:
> > Based on V4L2 documentations bridge driver must power on and off sub
> > device explicitly if media-controller mode is not used.
> 
> This isn't really related to MC but the fact that V4L2 still uses a
> V4L2-specific way to manage power state of devices that predates runtime
> PM.

I'll fix the description.

> 
> -- 
> Regards,
> 
> Sakari Ailus
