Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F675E79E6
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 13:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbiIWLpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 07:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbiIWLpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 07:45:43 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E20FDF051
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 04:45:41 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 733C9200C9;
        Fri, 23 Sep 2022 14:45:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1663933536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rH/fseSLL71Z/Z+Y4xaMAdB6Yh2Drx8uLb7ltd/Nfc4=;
        b=GRSyxw/hy1tEN64hjwE8h8f6YP/L3LDWzWEwjXl/scZmWUobGruklOOdWxW6RxOOQVQqMh
        d4VyhnUZaepJwBmoluqXZop5I9eDiAAoQs5+kc8j5RQ/jOs9O9QSKLKTqafBhY9L7Dgk4T
        +ju1kHmVIQugs4c3fC6GYN89jHYSl9A=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CD970634CD2;
        Fri, 23 Sep 2022 14:45:33 +0300 (EEST)
Date:   Fri, 23 Sep 2022 14:45:33 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH v4 RESEND 3/3] media: i2c: imx412: Add new compatible
 strings
Message-ID: <Yy2cXQzlcdddp5Xe@valkosipuli.retiisi.eu>
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
 <20220922104225.1375331-4-bryan.odonoghue@linaro.org>
 <CAPY8ntAAcbv0myL3F-OOOH_rUUF7q==DQFq1sCaYAY=+JapgcA@mail.gmail.com>
 <cc24035d-9a32-ff9e-bffa-a21a0f79f138@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc24035d-9a32-ff9e-bffa-a21a0f79f138@linaro.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1663933536; a=rsa-sha256; cv=none;
        b=Fp5ihAbGGrv+py25/u+nUAeXNeca1Fz77qTkAX9FC+r6TUorCEF+g0GuefCdsLR+mdfCrq
        Sm5mA1GycdyhDQe92bl6mvqJOg4EOj5RjfqeXtttnVTbU2LTuJOI8e3GJWkaAxKp7f48LY
        0/yHl4/lMm+evsmW/RQx352ScTMLF3U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1663933536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rH/fseSLL71Z/Z+Y4xaMAdB6Yh2Drx8uLb7ltd/Nfc4=;
        b=x6Ihyr1eVeckRkRQCY7964dnk6bqt/bEEeTBpU0bujd8bGcnCF5l90KKJFJBWE/BltWCUX
        EMTsN3q4pJdKsuGCpEd3Hn8YvGh4TTr1TVCDCXcpxprNLsKYSrvS5BRTluBKNngKkmdHEA
        tG1o3GO4MuGOrUW04MyYSDQ469PbaqU=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan, Dave,

On Thu, Sep 22, 2022 at 12:19:22PM +0100, Bryan O'Donoghue wrote:
> On 22/09/2022 12:16, Dave Stevenson wrote:
> > It may*eventually*  work for all three parts, but isn't the time to
> > add the compatible string at the point where it is actually compatible
> > with the driver?
> 
> Yes. I forgot about the 0x477 chip id on your part.
> 
> I'm happy enough to drop 477 from the compat string or indeed to allow
> 0x0477 as a valid chip identifier in imx412.
> 
> Sakari, what would you like to do ?

If the driver already works with all three apart from the chip ID check,
I'd just extend the check.

-- 
Kind regards,

Sakari Ailus
