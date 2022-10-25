Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C463D60CE84
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 16:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbiJYOM7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 10:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbiJYOM5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 10:12:57 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5659B864;
        Tue, 25 Oct 2022 07:12:54 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id E46441B0044A;
        Tue, 25 Oct 2022 17:12:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666707171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XFL+t8pTLlxshR5Y494Lo/7XFKIEJLwgm1LVi7RCUyc=;
        b=CRGeKeLobSYGjuleAsTPFcvFtR/AwxK4AoQ2KHLCyOEwAwEnvk/p0elprM291+Ol4gHiFw
        zqdS77a8+OBIogwIeNdf7VLvFCW/Zgwux1DhiXZ417EmuZytOae67L7CPT4R8Y8bIFWyhn
        ApIDWgEDf0418GDZliG4PfJx9kCWnH5yiHSeGZMV5jk5Z7dqVnMHwaFcNHDMXzG36cQCYl
        1knvssY3bHjAdVwnqneQcyuaUoJnkxIv5BiwuTMG1rdOWihvZOhvjlZIYm0kmtMR6Jw+mA
        UjkuJXUq8MW2a1c37UW6EKhjlPfh7TtTsE57PmPBhh/cHphSr03v7/3lAVVHZA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8A631634DB0;
        Tue, 25 Oct 2022 17:12:50 +0300 (EEST)
Date:   Tue, 25 Oct 2022 17:12:50 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/20] media: dt-bindings: Convert imx290.txt to YAML
Message-ID: <Y1fu4krZn+bMPTIs@valkosipuli.retiisi.eu>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
 <20221016061523.30127-2-laurent.pinchart@ideasonboard.com>
 <CAPY8ntCH5qc9cMHEjyX2K-2spibi=zp8vdvexz1Coouyp5sKWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntCH5qc9cMHEjyX2K-2spibi=zp8vdvexz1Coouyp5sKWg@mail.gmail.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666707171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XFL+t8pTLlxshR5Y494Lo/7XFKIEJLwgm1LVi7RCUyc=;
        b=RHfidUSKTgN0Hn5VvPGupU3ZCvEfedZPJ9LSvsEZ/ilYdpSKyEycs0daofGByhymJNhVQ7
        j7NnJIKcYk6tyZn674m/qmIOoEz/y4aksGLZJgWYGBe9ZbYBVgS8Ey/xSx/MK+s8ZTyacR
        KJQ2B/MM9XzInMLAFi7OYsG/St6KSUxey6Vd+QQEvkpMUiKimNdWgILMndilxLwaIDRhpi
        9IQjDmQz0vWqpgfcWIXwIpMClM9x+HfrB/UDrnnM1sXlQKNK1fL5e0XbVT9cJd6tNfvLI+
        N2PeQ6DVjfvp5K+A90dT1VU8mZGVc1UdL36J8/HUMot2rIF+O+JwqhmRZ3za/g==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666707171; a=rsa-sha256;
        cv=none;
        b=OJgrF8DWxKGGXg54BH3s328jleHV+ezEWbLWHI7pfjPkQ82F7P2XsVio7TklUUaxaxJSPP
        rolCmgErFx3WmARbqg5Mng8JWwk3bvuetnpcp84BSA7018b71H/BQeaiVCP9zfYjVyXiaE
        ym8Mgc6ufpjTIH/9V5b8fdUbzfuOQFf9mz1ZB5TMpMb79yxQx9BPK+DzXAwiphXXaHahs+
        doEdnPn4XmY+m9OcpYaR0AAwQUrzHStrXK8KRJMFBeuWVdNcO7Fk14TjxAymPH5R3lIKBP
        /LEwi4r2gISoTXOry2ugDkkPlfnb1PakEE1ybLL2IRPMaN+EYuK/by2hLBfs8g==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Mon, Oct 17, 2022 at 02:57:58PM +0100, Dave Stevenson wrote:
> > +                    link-frequencies = /bits/ 64 <445500000>;
> 
> Minor nit that this won't work with the current Linux driver due to a
> driver restriction implementing the recommended settings from Sony.
> OV8865 has the same restrictions and notes it in the binding[1]. I
> don't know if this is the preferred approach or not.

The DT describes hardware and is not bound by (current) driver limitations.
So I'd say that if the hardware supports multiple frequencies, the
supported ones need to be listed here.

I'd also like to merge the series, it's been out of tree for long already.

-- 
Kind regards,

Sakari Ailus
