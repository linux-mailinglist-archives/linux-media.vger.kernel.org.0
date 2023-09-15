Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8957A1D10
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 13:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbjIOLFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 07:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbjIOLFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 07:05:08 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BCEE71;
        Fri, 15 Sep 2023 04:04:38 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RnBCh4v2zzybD;
        Fri, 15 Sep 2023 14:04:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1694775874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9FSsWmQrFC61n5NQWQhh9aHTyg8StbZKmyWn6br55MY=;
        b=Nsv+XqPgW9Hg/IL03sk/hZ3lbGPNtlHJPILaltkPc7bZ1dp0wjTAyRGBjcL1MA/z3IXLaP
        pAMtNmgFTI3SYI9cGlxwq25wiK+OUgcR3IKauA3twiFqb96R4tEJL3RLcqw/nxgzEZd2MM
        t615J4xFtVgHpURlDY/cKIaQ7EDHd94=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1694775874; a=rsa-sha256; cv=none;
        b=wUgC7akW+qVkfjaE+gpHUmBnhZRBY+6UQ8XkikcMzsQ/VnhcJALEvh64U7tKMmMhql+bd6
        grQYbeThSvREQKmqxz2JsaHAixoqLVgnCBFrs+jLqXLhhWLx+e+2dFPW+LlXAjuPm8eY3P
        Ey7MvY4gcGBeot5c0mpp33SAUH7XPZw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1694775874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9FSsWmQrFC61n5NQWQhh9aHTyg8StbZKmyWn6br55MY=;
        b=nbDppxZS3lRPtMjrcX611fM+bsNt3ywvvLNx5u+AXE3025cj5yAUYdQEoX+MP0CNJwDdqf
        36lB73k06ISQhxkvakd1wUyIJn7FOPEJ1LKmvvmnlS4puOFkKeoEhVgf6wA29n3+KTJlgs
        yOzrQDkWQicxx4ApBV/1uQEtEOte1ig=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B7CE6634C93;
        Fri, 15 Sep 2023 14:04:31 +0300 (EEST)
Date:   Fri, 15 Sep 2023 11:04:31 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Rob Herring <robh@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, mchehab@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v4] media: dt-bindings: Add OV5642
Message-ID: <ZQQ6PwO27Qq28KEn@valkosipuli.retiisi.eu>
References: <20230913192811.1946423-1-festevam@gmail.com>
 <20230914145935.GA1276539-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914145935.GA1276539-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Thu, Sep 14, 2023 at 09:59:35AM -0500, Rob Herring wrote:
> On Wed, Sep 13, 2023 at 04:28:11PM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> > 
> > As explained in the description text from trivial-devices.yaml:
> > 
> > "This is a list of trivial I2C and SPI devices that have simple device tree
> > bindings, consisting only of a compatible field, an address and possibly an
> > interrupt line."
> > 
> > A camera device does not fall into this category as it needs other
> > properties such as regulators, reset and powerdown GPIOs, clocks,
> > media endpoint.
> > 
> > Remove the OV5642 entry from trivial-devices.yaml and add its own
> > ovti,ov5642.yaml.
> 
> Many of these Omnivision sensors have the same supplies and same GPIO 
> connections, so why can't they share the binding? There are some 
> differences I've seen that boil down to just what the driver decided to 
> require or not, but that shouldn't really vary. See commit 44ade291b77c 
> ("media: dt-bindings: Merge OV5695 into OV5693 binding") for example.
> 
> In any case, the binding looks fine and any merging can be done after.

The sensors differ from interface capabilities (one or more of parallel,
CSI-2 D-PHY and CSI-2 C-PHY), number of lanes / data lines etc. For
historical reasons, many have different defaults for vsync and hsync
polarities, for instance.

I suppose some of these would reasonably be taken into account, if not in a
single file, in a couple of files. CSI-2 connected sensors are the most
common these days.

The device for which this patch added the bindings appears to be 15 years
old.

-- 
Regards,

Sakari Ailus
