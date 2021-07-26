Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903033D60E5
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 18:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237291AbhGZPZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 11:25:37 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:45278 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238310AbhGZPZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 11:25:19 -0400
Received: from hillosipuli.retiisi.eu (dbd1vftgng281pd4yskly-3.rev.dnainternet.fi [IPv6:2001:14ba:8eb:1240:ab2d:b956:f00:7a12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 9D2371B0009A;
        Mon, 26 Jul 2021 19:05:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1627315546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X6uAcRoKgp16X+DSs3GaN2VBrn1/8cfpWVI9R/7BdOo=;
        b=axmm8thYCXHB/axNWS4d9PnOgrRmTkW0klvRR4qv61xDbc9Nr4nGRbHZcTAmR/nLbGgrVl
        GB3uYNeKpZi1udKIiaMI3qa/BtvFmxsEvX6AzVPLmcqhMZEqi3mjSyiw4gxPPSV6MCU/C5
        SHnm7+tI2qxTpZLPH9nF9l4v+aJb9qaIHggRt+KaMBkDatKYKNAn2yR9vxaeQRxj3Tr92j
        emI5Sz5tcOLiazIhYi80aHeeF5IErv/TO/Sb9B6nY4CcyCBVsrMNeGaGDk/1WmSzpjRL/g
        /NJOmnp+kAkf27A3h3Vfv1v5RJtFMQfssNp5umJFqoez6vnFMTGNNSK/vfiTSQ==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2BEF0634C87;
        Mon, 26 Jul 2021 19:05:10 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1m836j-000187-04; Mon, 26 Jul 2021 19:05:33 +0300
Date:   Mon, 26 Jul 2021 19:05:32 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2.1 11/11] rcar-vin: Add r8a779a0 support
Message-ID: <20210726160532.GE3@valkosipuli.retiisi.eu>
References: <3b15cc12-2c3c-c622-fcbb-3aed583f09d1@xs4all.nl>
 <20210721085357.4181098-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210721085357.4181098-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1627315546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X6uAcRoKgp16X+DSs3GaN2VBrn1/8cfpWVI9R/7BdOo=;
        b=UCD4htETDkG/yYjJPMnRZKrjJs1+0JOnZadhJf2SpbZjWPx1oY1bhIQpkJPSgNqq4tYF3s
        Rxiu5jKBCeg3IBwCr3G3CkM00bC7JjKMXAcZ5GtdSjc70tYT5MSAxJs+6agzYpqDTkvLNZ
        MTd0+uJ8FLoD5oFEzENsvIiiMxzxd1boXsTtHDxlNe4lGpyKTB5o82o/o6rkDt/U3FToIh
        GLEr0yYV4KMKMMlCoINWEmf+XjGqrcw34A1296gZEksCtDJAdTIN1/Zroraxdbq0SXMWwZ
        qaKypD7ze2vyv5y3ruhzumKe3sIE3sIh/3b91Dd3b5AQJ/m3CTZlGPVZbbPY0Q==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1627315546; a=rsa-sha256;
        cv=none;
        b=pP8jtMlYUo5C2WqCLXB9m8kaCX/PANfvpRP/OM3uY3FmJs31fiChFKeaw6OtNtt95B8V6y
        VefE2zUXVRnLuqFDW2c8wsgENrBjza3h1q6bKjnccHUv14J6GNKFTp0gjwPcwjUNS5jjf9
        QzhhlNXtWhP9PH95fBgoMzRChMfCbBgdpbuITdmnlvRPxRL/5A0pJ5QcDGEvXyUyQ15VaZ
        FdcKJrwU0yLOsI8NjTH0jVFmBJNrHW3VXTpaguyIHkUBxbA8WFmYFdSCS7JGJ4QAcLYQCx
        JNJhI0SRIqLH2XET2pfyvf2azszeddB73LeOupub5vsP4OFV2xzEXpn/67+qRw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 21, 2021 at 10:53:57AM +0200, Niklas Söderlund wrote:
> Add support for the R-Car V3U (r8a779a0) to the driver. The V3U has the
> VIN modules connected to a ISP instead of directly to the R-Car CSI-2
> receivers. The reason being that the ISP performs channel selection
> based on CSI-2 VC/DT pairs and routes the video data to different VIN
> modules. In other SoC versions this filtering is done by the VIN modules
> themself.
> 
> While the media graph is very different from other SoCs the only
> difference in operating the VIN modules is that the VC/DT filtering
> should be skipped as that is performed by the ISP.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Hi Niklas,

I discussed the set and the PRs with Hans. This conflicted with my other
pull request with async notifier rename patch and a bunch of other stuff. I
noticed I needed to change something else in the set (for ti-vpe changes)
so I thought I can change this for rcar-vin, too.

It's here:

<URL:https://lore.kernel.org/linux-media/20210726154828.19693-1-sakari.ailus@linux.intel.com/>

I intend to send that in a pull request tomorrow.

-- 
Sakari Ailus
