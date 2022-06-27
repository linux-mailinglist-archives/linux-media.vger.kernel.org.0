Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C388855D164
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbiF0OGy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 10:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236697AbiF0OGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 10:06:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C7812ABD
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 07:06:42 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1o5pNq-0003Bu-Ga; Mon, 27 Jun 2022 16:06:34 +0200
Message-ID: <e67392e43bfc037db6969297b65b0b6945df8b27.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>
Cc:     "Sharma, Shashank" <Shashank.Sharma@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>
Date:   Mon, 27 Jun 2022 16:06:31 +0200
In-Reply-To: <0abe475a7b4b04758c03a9d19b228e86d95ac1dd.camel@ndufresne.ca>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
         <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
         <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
         <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
         <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
         <20220623101326.18beeab3@eldfell>
         <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
         <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
         <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
         <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
         <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
         <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
         <0abe475a7b4b04758c03a9d19b228e86d95ac1dd.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Montag, dem 27.06.2022 um 09:54 -0400 schrieb Nicolas Dufresne:
> Le jeudi 23 juin 2022 à 11:33 +0200, Lucas Stach a écrit :
> > > 
> > > See for example on AMD/Intel hardware most of the engines can perfectly 
> > > deal with cache coherent memory accesses. Only the display engines can't.
> > > 
> > > So on import time we can't even say if the access can be coherent and 
> > > snoop the CPU cache or not because we don't know how the imported 
> > > DMA-buf will be used later on.
> > > 
> > So for those mixed use cases, wouldn't it help to have something
> > similar to the dma_sync in the DMA-buf API, so your scanout usage can
> > tell the exporter that it's going to do non-snoop access and any dirty
> > cache lines must be cleaned? Signaling this to the exporter would allow
> > to skip the cache maintenance if the buffer is in CPU uncached memory,
> > which again is a default case for the ARM SoC world.
> 
> Telling the exporter for every scan is unneeded overhead. If that information is
> made available "properly", then tracking it in attach/detach is sufficient and
> lightweight.

That isn't sufficient. The AMD GPU is a single device, but internally
has different engines that have different capabilities with regard to
snooping the caches. So you will likely end up with needing the cache
clean if the V4L2 buffer is going directly to scanout, which doesn't
snoop, but if the usage changes to sampling you don't need any cache
flushes.

Also I don't see a big overhead when comparing a kernel internal call
that tells the exporter that the importer is going to access the buffer
without snooping and thus needs the cache clean once every frame and
the need to always clean the cache before DQBUF when a potentially non-
snooping importer is attached.

Regards,
Lucas

