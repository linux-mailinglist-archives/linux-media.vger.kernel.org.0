Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C08B680C05
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 12:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235799AbjA3LbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 06:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236649AbjA3LbE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 06:31:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D2E2DE57
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 03:30:59 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pMSNG-0006hv-43; Mon, 30 Jan 2023 12:30:58 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pMSNF-0007AB-Rg; Mon, 30 Jan 2023 12:30:57 +0100
Date:   Mon, 30 Jan 2023 12:30:57 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: tc358746: init m/p_best to 0
Message-ID: <20230130113057.5fftc5urluieoaeq@pengutronix.de>
References: <15030a07-3615-fca0-1891-a234dc054b00@xs4all.nl>
 <20230130105912.vufkpuhiejuyipt7@pengutronix.de>
 <aa915c48-14e6-4bdc-09da-644dfedd4f57@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa915c48-14e6-4bdc-09da-644dfedd4f57@xs4all.nl>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23-01-30, Hans Verkuil wrote:
> Hi Marco,
> 
> I rejected my own patch :-)
> 
> It turned out that I was testing with gcc-11 instead of 12. The latest gcc
> version doesn't report this warning.

Good to know that gcc-12 fixed this :)

Regards,
  Marco
