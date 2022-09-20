Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDF75BE4F1
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 13:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiITLt1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 07:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiITLt0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 07:49:26 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A82167E3
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 04:49:25 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 07FAD20149;
        Tue, 20 Sep 2022 14:49:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1663674562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rfln/fz8NpPv2fZM3C/e4yFc/DS0W/eu4pXEV/GlBtg=;
        b=Kq8+blXbtV8hfYmTlyXyj74r6EcNswaGQ+xWp3nwyQkMyOkoxBw2rf6sedTYiy2F6t8qG0
        sTTM8znl9pUrxfogpJsCb8/CKguiemjKNXB0udBMmy51sI2hUu5ezM+DAI9qyITaI7bwIw
        zwEZFWQGITyH6nirABuN0K/FL7FEXm0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 88838634C91;
        Tue, 20 Sep 2022 14:49:21 +0300 (EEST)
Date:   Tue, 20 Sep 2022 14:49:21 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, khalasa@piap.pl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH -next resend] media: ar0521: fix error return code in
 ar0521_power_on()
Message-ID: <YymowcJLbEntasyE@valkosipuli.retiisi.eu>
References: <20220917071432.1544323-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220917071432.1544323-1-yangyingliang@huawei.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1663674562; a=rsa-sha256; cv=none;
        b=cN4IWqGRbTc+mjkezdzvzT/P3+fnZFslPj0tG1TU5rR3FO963isCOWyf/Ji48Oi84KjAub
        nFsEsmU0/MzzeQ6F0cp6dTCJfxpa34hkGzWAiWiXZLFLhXnys0MpfrPUktc0jR9JWbGdvq
        240/czB0mkHSumtxRsjWbWTh/4yNO4o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1663674562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rfln/fz8NpPv2fZM3C/e4yFc/DS0W/eu4pXEV/GlBtg=;
        b=aQjHgS/L7s+Ob//A1F2t/NUpxoMW4oxZ7rarcRLXvTajyWxv7xYGiXOY2QYfQQ0o5sUYfw
        +lGugyVX6KHOlh1gOfPT5jlo1CZDnSNCC+Oxid0hyg8AgvV7Z/1ylJv5G+b2j9F1eudyn1
        eI1lvyotu2Mz2Cd5ZSoeMYxqnF0zbX0=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 17, 2022 at 03:14:32PM +0800, Yang Yingliang wrote:
> Return error code if ar0521_write_regs() fails in ar0521_power_on().
> 
> Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Acked-by: Krzysztof Hałasa <khalasa@piap.pl>

This is already in my pull request to Mauro.

-- 
Sakari Ailus
