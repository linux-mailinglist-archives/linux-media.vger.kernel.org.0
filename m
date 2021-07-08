Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705A03BFAC0
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 14:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbhGHNAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 09:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbhGHNAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 09:00:14 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A66C061574
        for <linux-media@vger.kernel.org>; Thu,  8 Jul 2021 05:57:32 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id BC3AF200B9;
        Thu,  8 Jul 2021 15:57:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1625749050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vHwc2iN6bUv/poqxKz5vkCUvi9lnsC7e2XhitOKa43I=;
        b=GWi5fWrCoNrEnmEO0n68V+MuIf83Pa5GMCwu5NuWaTX32pOylrfWybNp/kULITG189ltIB
        gUNC7CXtUA1P7OGjGn3YzGdmIPAoJjS2Pq3DHDlXkgmdeTH6fiHDTxGkC64WGQz8vn6S9z
        R3ZOsbD2+5uNPXlTA8okxTiQiNkuJss=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 84BC3634C87;
        Thu,  8 Jul 2021 15:56:51 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1m1Tar-0001zl-RD; Thu, 08 Jul 2021 15:57:29 +0300
Date:   Thu, 8 Jul 2021 15:57:29 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v6 3/5] media: i2c: add driver for the SK Hynix Hi-846 8M
 pixel camera
Message-ID: <20210708125729.GZ3@valkosipuli.retiisi.eu>
References: <20210628101054.828579-1-martin.kepplinger@puri.sm>
 <20210628101054.828579-4-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628101054.828579-4-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1625749050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vHwc2iN6bUv/poqxKz5vkCUvi9lnsC7e2XhitOKa43I=;
        b=ZV4eWNlQPCaPsWHai36aWk9In7eCXZhzu8MlWbZnCOzZu3rSIIVknOhIFKJLfOf0pXZ5fw
        i8VD7HF2Qvny9E1VbkkIMCNfCZUIm29Dlpg9taEhD89X3IB18TZJpskUGb0BlraKUqm1zs
        Fz2MWDr08EvKhHWWRarbYTnmskUF7LY=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1625749050; a=rsa-sha256; cv=none;
        b=SVlRZG8gSwlNfhqRWff+uM6gDMT78kKvN757zxdz904VbX53rSUDseGtrOzNZUgvTB9RHa
        yODmLtsDAypE8WVV0xg0qJrK47ZpSjqjI6Kk9nxnNMMAnustMGfPkL5Ryhl7rtA3DVgvNH
        7JZ8SNab3gxjOTv25rpSCOXY3n1iOx8=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Mon, Jun 28, 2021 at 12:10:52PM +0200, Martin Kepplinger wrote:
...
> +	hi846->clock = devm_clk_get(&client->dev, NULL);
> +	if (IS_ERR(hi846->clock)) {
> +		dev_err(&client->dev, "failed to get clock: %pe\n", hi846->clock);
> +		return PTR_ERR(hi846->clock);
> +	}
> +
> +	mclk_freq = clk_get_rate(hi846->clock);
> +	dev_dbg(&client->dev, "clk rate: %u\n", mclk_freq);

You'll need to check this is the value you expect it to be. The register
lists are specific to that value.

Could you also check Documentation/driver-api/media/camera-sensor.rst
regarding the assigned-clocks etc. properties, and align the bindings with
that?

-- 
Sakari Ailus
