Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2043CAE7D4
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 12:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393676AbfIJKSi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 06:18:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40268 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729475AbfIJKSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 06:18:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8C97828C51D
Message-ID: <255f22b1ddea5fa81104865769eec0fcb5617b36.camel@collabora.com>
Subject: Re: [PATCH 03/12] media: hantro: Fix H264 motion vector buffer
 offset
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Tue, 10 Sep 2019 11:18:34 +0100
In-Reply-To: <HE1PR06MB40115337CD86C429EF24430CACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20190901124531.23645-1-jonas@kwiboo.se>
         <HE1PR06MB40115337CD86C429EF24430CACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

Thanks for fixing this, I'm happy we are reducing the amount
of black magic here.

On Sun, 2019-09-01 at 12:45 +0000, Jonas Karlman wrote:
> A decoded 8-bit 4:2:0 frame need memory for up to 448 macroblocks
> and is laid out in memory as follow:
> 
> +-------------------+
> > Y-plane   256 MBs |
> +-------------------+
> > UV-plane  128 MBs |
> +-------------------+
> > MV buffer  64 MBs |
> +-------------------+
> 
> The motion vector buffer offset is currently correct for 4:2:0 because
> the extra space for motion vectors is overallocated with an extra 64 MBs.
> 
> Wrong offset for both destination and motion vector buffer are used
> for the bottom field of field encoded content, wrong offset is
> also used for 4:0:0 (monochrome) content.
> 
> Fix this by always setting the motion vector address to the expected
> 384 MBs offset for 4:2:0 and 256 MBs offset for 4:0:0 content.
> 
> Also use correct destination and motion vector buffer offset
> for the bottom field of field encoded content.
> 
> While at it also extend the check for 4:0:0 (monochrome) to include an
> additional check for High Profile (100).
> 

As with the scaling list, I believe it would make a lot of sense
to document this in the driver itself.

Thanks,
Ezequiel

