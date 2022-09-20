Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4075BE03E
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 10:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbiITIee (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 04:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbiITIdz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 04:33:55 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F6F25C49
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 01:33:54 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id C4C6520167;
        Tue, 20 Sep 2022 11:33:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1663662831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iYQYnTFVDWkcHz2GRTo43wmx1dEy6A9m4nH9vs5CMsc=;
        b=I9ohRiV6MSAFRfaGpPrmhNRK21exGIGQNY4pD5pF1bWWgXwcq3FZKOfLO9n4kTIkcnkYjX
        b9wU9DkuE75rv1aggeX8aDqouW/2sgMBVFOF0JIdVgqBaCzFunOik2xiV/H2J+LI2dBeeM
        Eo78n6oy2lokR14Mm//21+ihTYKJTTc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4D364634C92;
        Tue, 20 Sep 2022 11:33:50 +0300 (EEST)
Date:   Tue, 20 Sep 2022 11:33:50 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH -next v2] media: Switch to use dev_err_probe() helper
Message-ID: <Yyl67oamQ/i8PZpZ@valkosipuli.retiisi.eu>
References: <20220919155843.1097473-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919155843.1097473-1-yangyingliang@huawei.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1663662831; a=rsa-sha256; cv=none;
        b=XFJ7D9Pz9wLMbUPcj6a25qpJ5pyomR7s9r9Fzwi3992FKuqysnVA+oaO0zscSiWr9GCev0
        9G94X3zrcqqz/QObJFkyfzI5gcl9oCwjxyBVbT3CocA4DEPX07po2QZdB5tvGKwa9K8EVc
        2IFd60uWFe6vWt3ZNO817RjR6y7Z6dE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1663662831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iYQYnTFVDWkcHz2GRTo43wmx1dEy6A9m4nH9vs5CMsc=;
        b=Iln0TECo5lNRiTsODGgey+LIU6xh4mI5iGAG7dbtLWRJ0eBT7X83lwFFZChBYyz601uk0N
        33ttD3VicsV65WrjSLRcISRZeXxvKlu/RXy2UcYQGrgSbeVg23spMmUcA30U9woIy+WU1q
        0vhLy6N9b3lHQ0y7ELCdOp5bxWb7LsU=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

On Mon, Sep 19, 2022 at 11:58:43PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.

I don't really disagree with changing to dev_err_probe(). But I would like
to ask how have you selected the drivers and calls calls in them that you
do change.

E.g. the imx274 driver has a number of such calls and the patch appears to
change one of them. Other drivers similar to imx274 (e.g. other sensor
drivers) do use dev_err() as well.

I wonder how difficult it would be to do this more systematically with
Coccinelle.

-- 
Kind regards,

Sakari Ailus
