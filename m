Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D11E5690AE9
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 14:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjBINyr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 08:54:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjBINyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 08:54:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D488B75D
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 05:54:46 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pQ7Ns-00084P-MU; Thu, 09 Feb 2023 14:54:44 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pQ7Ns-0000AJ-7g; Thu, 09 Feb 2023 14:54:44 +0100
Date:   Thu, 9 Feb 2023 14:54:44 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Deji Aribuki Ext <deji.aribuki.ext@brainlab.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Laurenz Eschwey <laurenz.eschwey@brainlab.com>,
        kernel@pengutronix.de
Subject: Re: Mainline zyncmp vcu driver: support for the video decoder
Message-ID: <20230209135444.GB30549@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Deji Aribuki Ext <deji.aribuki.ext@brainlab.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Laurenz Eschwey <laurenz.eschwey@brainlab.com>,
        kernel@pengutronix.de
References: <FR2P281MB28166C9AD7111B3488BCE297A8D99@FR2P281MB2816.DEUP281.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <FR2P281MB28166C9AD7111B3488BCE297A8D99@FR2P281MB2816.DEUP281.PROD.OUTLOOK.COM>
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

Hi Deji,

On Thu, 09 Feb 2023 10:03:19 +0000, Deji Aribuki Ext wrote:
> I would like to know if there is a plan (or if there is already have a
> patch-set) for adding support for allegro dvt video decoder.

I currently don't have any plans or patches to add decoder support.

A while ago, there was a bit of interest in decoder support, but I haven't
heard of anything new for a long time.

Are you interested in adding decoder support to the driver? I would be happy
to review and test patches.

Michael
