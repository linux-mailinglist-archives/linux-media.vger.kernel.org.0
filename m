Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFD270D425
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 08:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbjEWGmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 02:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjEWGmo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 02:42:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CDC109
        for <linux-media@vger.kernel.org>; Mon, 22 May 2023 23:42:43 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1q1LjF-0006T0-Mb; Tue, 23 May 2023 08:42:41 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1q1LjB-0008VX-43; Tue, 23 May 2023 08:42:37 +0200
Date:   Tue, 23 May 2023 08:42:37 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Ford <aford173@gmail.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com
Subject: Re: [RFC 2/2] media: rkvdec: Add VP8 encoder
Message-ID: <20230523064237.pvj6pipj7ftnduom@pengutronix.de>
References: <20230309125651.23911-1-andrzej.p@collabora.com>
 <20230309125651.23911-3-andrzej.p@collabora.com>
 <CAHCN7xKQv=Dx7cVSc_ekZ2GHzOVFuv6Yzum=kGQnCVfWxV0m5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xKQv=Dx7cVSc_ekZ2GHzOVFuv6Yzum=kGQnCVfWxV0m5w@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On 23-05-20, Adam Ford wrote:
> On Thu, Mar 9, 2023 at 6:59 AM Andrzej Pietrasiewicz
> <andrzej.p@collabora.com> wrote:
> >
> > A stateless VP8 encoder for rockchip vpu2 found e.g. in rk3399.
> >
> > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> 
> Is there a good place or resource where I could learn more about
> what's needed to port the vpu1 VP8 encoder?  I'd really like to port
> the Hantro H1 encoder that's used on the imx8mm, but it seems like the
> vpu2 encoder has different registers than the H1 encoder on the Mini.
> I was hoping my employer would send me to Prague for the conference at
> the end of June, but unfortunately, that's not going to happen.  I'd
> like to get more involved with projects like this as a personal side
> project.

I'm currently working on the i.MX8MM H264 encoder kernel bringup.

Regards,
  Marco
