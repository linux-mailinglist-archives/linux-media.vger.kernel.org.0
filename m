Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57AE436C91
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbhJUVVy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhJUVVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:21:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129CCC061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:19:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78A058B6;
        Thu, 21 Oct 2021 23:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634851174;
        bh=EKcAQpKXEZmoBHAInizr+mr6HtyOEjvZVXyk0yG4zlE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=n3TYT8NQLSIBU3mr9M/Y939R0Xq/w88ZNzNFJj4UQPtIAT2dyF+qvHfLelhObu0kA
         aGYhD3LV+7cv1vgCQHRi62/UV+5IskwnO8PqSEZY+WrQkqN8bl/+f4Wprsff+eL5Zt
         fbyxvACbXwBFfyk2mYnewVk6MruZQDsK0iOEbyFk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211021210130.bkags5flfebia74c@pengutronix.de>
References: <20211021062547.51989-1-u.kleine-koenig@pengutronix.de> <163481464506.2663858.16090359620223699606@Monstersaurus> <be94762f-4518-6bdc-e280-41dba484f377@intel.com> <20211021210130.bkags5flfebia74c@pengutronix.de>
Subject: Re: [PATCH] [media] s5c73m3: Drop empty spi_driver remove callback
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de,
        linux-media@vger.kernel.org
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Thu, 21 Oct 2021 22:19:31 +0100
Message-ID: <163485117184.4046931.1144387499119474504@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2021-10-21 22:01:30)
> Hello Andrzej,
>=20
> On Thu, Oct 21, 2021 at 04:08:38PM +0200, Andrzej Hajda wrote:
> >=20
> > On 21.10.2021 13:10, Kieran Bingham wrote:
> > > - To: Updated Andrzej's e-mail address
> > Thx for update :)
> >
> > > Quoting Uwe Kleine-K=EF=BF=BDnig (2021-10-21 07:25:47)
> > > > A driver with a remove callback that just returns 0 behaves identic=
ally
> > > > to a driver with no remove callback at all. So simplify accordingly.
> > > Looks fine to me though.
> > >=20
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >=20
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>=20
> Maybe it would be a sensible thing to fix your entries in MAINTAINERS? I
> would suggest a patch, but I don't know if
> s/a.hajda@samsung.com/andrzej.hajda@intel.com/=20
> or just removing some M:-lines would be the right thing to do. Maybe a
> mixture?!

He has already sent it at [0], I saw that, and that's how I knew to
update the To: after seeing your message about the bounce ;-)

[0] https://lore.kernel.org/linux-media/20211018211353.586986-1-andrzej.haj=
da@intel.com/

--
Kieran


>=20
> Best regards
> Uwe
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=EF=BF=BDnig    =
        |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
