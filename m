Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68B5601398
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 18:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiJQQh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 12:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiJQQh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 12:37:56 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECFD6F24C
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 09:37:54 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 87B441B001C5;
        Mon, 17 Oct 2022 19:37:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666024671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bap9ps00af1Gc9QYZGA2Ahvy6VU0UEPuGt3hz441AXc=;
        b=iwqSkSEoSyN9tsrQkfrFe7FbjXIuKkmKM9itZkVM7DBb2jQYwwRZUGUp4PxuKB5isgiBXG
        8L70AZyRVTe3ho1J4I/Jl0w406urbniCmlwsDv+LbYHml9XG/wAAxx75fyFAsBv0Tv3KUw
        OzLACfaF6wGlT6mJzcu6to3A1GvNIsSiPOVcve3gPPlomnUg4YePlXBIo1QVG997ihzSiD
        OqeU94kp4brv/qtyXO4zyWOb2QRu9oySe7avTOf0OXHdk+3RxJZQ0IDLs4iXljNKA05bY2
        adoCMmOJ7dEZQSHvQslLLjB2u4Ah9FHhTnzBKZ7on6oO/shVzzky3/LT2rBeEA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5BF73634C93;
        Mon, 17 Oct 2022 19:37:50 +0300 (EEST)
Date:   Mon, 17 Oct 2022 19:37:50 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Y02E3nBSHC6id7K6@valkosipuli.retiisi.eu>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <m31qrk6wgc.fsf@t19.piap.pl>
 <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
 <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com>
 <20221017151003.5vqxgfewyjrmrdei@uno.localdomain>
 <Y017fLwL8zqzukl9@valkosipuli.retiisi.eu>
 <20221017163159.ttozu526qsqiiaaf@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017163159.ttozu526qsqiiaaf@uno.localdomain>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666024671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bap9ps00af1Gc9QYZGA2Ahvy6VU0UEPuGt3hz441AXc=;
        b=HaozPCEuW1VFv50OlM+Kd0mQmdInURsMBl9fy9jxKIJw7D23KPZoyIOPHxKjkgBgcRsIMB
        WEr20tAGjwb81TN/7EEMgwjJnnijmM14Xjjd9eCIMINAfMS9PcopHh97VWTjgCOWVyBPrT
        oZRbjf3XOwmkWakBzoXnDLvwCTdMtN0lMCfy49mTnI4IkNY2aj6jBUcmdswEd6KHb87AAf
        6TdceR2qlxeVyM3lXHsQSYoFlKiNTaFyYauJMgu7s1fLcO99aSS7JVOx08S97TKtp72Vyq
        HkPr7x1t5BTislTvsTCn65gYclnewcGEFyABxW2bYzxM/Ys48p0lcmEQ4Vfq5w==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666024671; a=rsa-sha256;
        cv=none;
        b=AW39fwHcXZn52fKWPP/mPnXnNInidMaruHqnIV5v/ry3D4dV7NwIGh7KrrbQQ1P2b/UI16
        k3XDxubqgr1Sw12NjxfC3qOgl6LyyWZTeDw/x8V8OaJ5Zz/MoH26OEfR5zm5H6pyIXyPQC
        R7uhK4UOrbIRmmiL9J7FtXpMuEXsG4oKZDZie9ptGHoVL5DREDBP2NfQvwaJA84IkU6Gaz
        OurWY12LYPKOHmBwrxVkyZWEIN4laE/qIXxX3ty3Z8tHVjKvPx4g0VbLMe3ym3Dx+/rxfn
        qZeUoHaQucSH2yRBzUDABNitNliPb1DRkp+RfgRDj7gWOwjLs/KmgKlzFNtj/A==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Oct 17, 2022 at 06:31:59PM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Mon, Oct 17, 2022 at 06:57:48PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Mon, Oct 17, 2022 at 05:10:03PM +0200, Jacopo Mondi wrote:
> > > > which is also named analog_gain_code_global, but is documented
> > > > differently.
> > > >
> > > > Could you btw read registers 0x0000 to 0x00ff and provide the data ?
> > >
> > > There is nothing interesting there if not default values. I was hoping
> > > that analogue_gain_m0 analogue_gain_c0 and analogue_gain_m1
> > > analogue_gain_c1 would provide a way to inject gains using the
> > > standard CCS gain model, but those registers are said to be read-only
> >
> > The m[01] and c[01] factors in the CCS analogue gain formula are constants
> > that determine how the sensor's analogue gain setting translates to actual
> > analogue gain. They are not intended to be modifiable at runtime.
> >
> 
> You're right sorry, indeed they're constant.
> 
> For this sensor:
> analogue_gain_type: 0
> analogue_gain_m0: 1
> analogue_gain_c0: 0
> analogue_gain_m1: 0
> analogue_gain_c1: 4
> 
> I should be capable of programming the global analog gain using the linear
> CCS gain model if the sensor is actually CCS compliant.
> 
>         gain = m0 * x + c0 / m1 * x + c1
>              = R0x0204 / 4
> 
> However, the application developer guide shows the gain to be set
> through manufacturer specific registers (0x3028 or 0x305e) and I cannot
> find much correlations between the manufacturer specific gain model
> (a piecewise exponential function) and the model described by CCS, which
> seems way simpler.

I wonder if the values in these registers are just leftovers from an
earlier sensor. If the device implements a device specific gain model, it
is unlikely to support the CCS model(s).

There is also an alternative to the traditional CCS gain model, in section
9.3.2 of the spec version 1.1. The formula in that case is:

	gain = analogue_linear_gain_global *
	       2 ^ analogue_exponential_gain_global

-- 
Kind regards,

Sakari Ailus
