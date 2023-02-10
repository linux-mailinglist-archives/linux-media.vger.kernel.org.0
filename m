Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7C426924B5
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 18:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbjBJRkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 12:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbjBJRki (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 12:40:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C7A7A7FF
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 09:40:07 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pQXNU-0007m3-Uq; Fri, 10 Feb 2023 18:40:04 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pQXNU-0001T0-5s; Fri, 10 Feb 2023 18:40:04 +0100
Date:   Fri, 10 Feb 2023 18:40:04 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Deji Aribuki Ext <deji.aribuki.ext@brainlab.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Laurenz Eschwey <laurenz.eschwey@brainlab.com>,
        kernel@pengutronix.de
Subject: Re: Mainline zyncmp vcu driver: support for the video decoder
Message-ID: <20230210174004.GB29504@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Deji Aribuki Ext <deji.aribuki.ext@brainlab.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Laurenz Eschwey <laurenz.eschwey@brainlab.com>,
        kernel@pengutronix.de
References: <FR2P281MB28166C9AD7111B3488BCE297A8D99@FR2P281MB2816.DEUP281.PROD.OUTLOOK.COM>
 <20230209135444.GB30549@pengutronix.de>
 <e1bf1a456ef83eeca9ad4dd18c55f7e423105be8.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1bf1a456ef83eeca9ad4dd18c55f7e423105be8.camel@ndufresne.ca>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Feb 2023 10:58:01 -0500, Nicolas Dufresne wrote:
> Le jeudi 09 février 2023 à 14:54 +0100, Michael Tretter a écrit :
> > Hi Deji,
> > 
> > On Thu, 09 Feb 2023 10:03:19 +0000, Deji Aribuki Ext wrote:
> > > I would like to know if there is a plan (or if there is already have a
> > > patch-set) for adding support for allegro dvt video decoder.
> > 
> > I currently don't have any plans or patches to add decoder support.
> > 
> > A while ago, there was a bit of interest in decoder support, but I haven't
> > heard of anything new for a long time.
> > 
> > Are you interested in adding decoder support to the driver? I would be happy
> > to review and test patches.
> 
> Isn't the decoder side stateless ? That could be difficult to achieve without
> reference code or documentation.

There is at least some firmware running on the decoder. And I am pretty sure
that it provides a similar mailbox interface as the encoder that the driver
must use.

However, I don't know, what messages the firmware expects. Thus, the decoder
maybe stateless. Maybe it even keeps some state in the firmware, but still
requires the software to parse the stream and explicitly set the stream
parameters.

Michael
