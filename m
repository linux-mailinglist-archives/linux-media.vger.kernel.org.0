Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0BCF5E5381
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 21:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiIUTEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 15:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiIUTEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 15:04:00 -0400
X-Greylist: delayed 40750 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 21 Sep 2022 12:03:59 PDT
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3359E0D3
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 12:03:58 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 68EAC1B00215;
        Wed, 21 Sep 2022 22:03:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1663787036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Kzm5Clzp/QiKyfDw+4ulLOOqoDro0Yuq4qY2gsOoafM=;
        b=qVLio5CRvOY+PXgFniHcYtzG0laRpuKfjUrGcJrbcMXz4S5qA0RhcuZk1pil/ZJYuOw+Z6
        UirHe+cRiKhGDsMNfJzhcqHUU8dMWmZ0p+N8AW2KyZqnr1ecMuqIoIEmOmFFT7UmG4U/YJ
        5jCYxaFp5HzpXYU+oCx72HI1xKfSpKkUZlJxH3bJhk3G9p8ovEaKbuFNu4lShsm5K/9OLr
        Sqn7Dc3Q6wak3h+BiS0UlojK7iY++ZpEZ3/ufC/V/WpLlJCG2ivRirLEPuDFb/o30IwzQT
        el524FbC1MtTh8uzl6s0809piNwgXd9oBBlDeTpM14TzJ3j825xyXrnlZgmXrQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0C131634CAA;
        Wed, 21 Sep 2022 22:03:55 +0300 (EEST)
Date:   Wed, 21 Sep 2022 22:03:55 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     dave.stevenson@raspberrypi.com, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: imx412: Extend compatible
 strings
Message-ID: <YytgG+uVdk7Lzupd@valkosipuli.retiisi.eu>
References: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
 <20220916140213.1310304-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916140213.1310304-2-bryan.odonoghue@linaro.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1663787036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Kzm5Clzp/QiKyfDw+4ulLOOqoDro0Yuq4qY2gsOoafM=;
        b=wOX1qWfNLRttQeemRrikjsYVE5R3JOYExu66g9U89v0iWncMhV5ZG7SnkpE+tDUTTAMn39
        T/842McVBvu7fCuwN268tS8S56qc20GH2YhndQPQtRmtj7qHR0z6lxXsC7uFSdZH8xzxpm
        o9uPyaFv0kKiCE8cvZ1GnQjzTs4AQxVpqddOzpJuWfwjmpHeDqOBDK8dU9iz8Q8QMtFxU4
        T+bPvfvivfoe9lxfMNxlG7we04sQwGV5eeMJ/9BvubPFLZLsWXnxV/ANM/4TRcABzJmGcj
        0XvCs8ixm4tQqGIyyV7aWO+ofOS/7fQ0/U6cuN5Rab3f+5bLXc15PxzqfZFrrw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1663787036; a=rsa-sha256;
        cv=none;
        b=kNLgqyPky6jFFN/M4OjvK5LNRXpo3omGDt/VFe7ZMjU7niN2cUSTbxxItXugy+UMzWYDaW
        884dvaRXkywrS7IPyD1/LRtmPIJPxTBPbEBxxu5Zprno9eb6bUEsHoh7NmvHKMc7H0gihp
        Z98dwh7xjya07Bm4W+Se2xqcRBGR0l1sQoJCXZ2AOI9da7myefIxFFFV/2qwqyNMnJ+hPz
        UmSe5Rfob2kFZA0DQUxsADi6B5SL9VbxtMVEe6lHe1eZNiIOJnJopu9TX/0lM5fptXX6uP
        6EQoJoaprVlev4oE7SNIUrjIKRy/Qlbp8YtM+zZMLleiZTX8v3DjO08RKNHSMg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Brian,

On Fri, Sep 16, 2022 at 03:02:11PM +0100, Bryan O'Donoghue wrote:
> Add compatible bindings for imx477 and imx577 both of which use the
> same silicon enabling reference code from Sony in the available examples
> provided.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The patch looks good to me and I was waiting for an ack from the DT folks.
They aren't cc'd. Could you resend the patch, cc'ing the devicetree list
and Krzysztof Kozlowski, please?

-- 
Kind regards,

Sakari Ailus
