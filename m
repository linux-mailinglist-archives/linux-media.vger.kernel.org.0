Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D77441D82
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 16:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhKAPnn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 11:43:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54602 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhKAPnm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 11:43:42 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25F5D929;
        Mon,  1 Nov 2021 16:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635781266;
        bh=H2n+1TZr+31Qb2fPdoZkratHRv19ZcgBCZL1gk83Ss8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Fx0+MUAJQmdmvowxaLNbWG/8vpFeC2NNvjAAT09kp0z7oGWvb/IcZqsIBVDs8BTAo
         5ahmLZ/iVZJCDiPzDmv4TUyDRdyFjsosXRB4ufa62kHVWPH2UKj6wwTGGoDgSOSc+t
         1tswjeFsOMoUUOEXdzWWwjjVVW4WQyxZVOdtp3Tg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211101150209.an56wy32ttjzoquj@pengutronix.de>
References: <20211026194010.109029-1-u.kleine-koenig@pengutronix.de> <163577655353.275423.6737046445297486684@Monstersaurus> <20211101150209.an56wy32ttjzoquj@pengutronix.de>
Subject: Re: [PATCH] [media] tua9001: Improve messages in .remove's error path
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, linux-media@vger.kernel.org
To:     Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date:   Mon, 01 Nov 2021 15:41:03 +0000
Message-ID: <163578126355.275423.9266309653140708545@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2021-11-01 15:02:09)
> On Mon, Nov 01, 2021 at 02:22:33PM +0000, Kieran Bingham wrote:
> > Quoting Uwe Kleine-K=EF=BF=BDnig (2021-10-26 20:40:10)
> > > If disabling the hardware fails the driver propagates the error code =
to
> > > the i2c core. However this only results in a generic error message; t=
he
> > > device still disappears.
> > >=20
> > > So instead emit a message that better describes the actual problem th=
an
> > > the i2c core's "remove failed (ESOMETHING), will be ignored" and retu=
rn
> > > 0 to suppress the generic message.
> >=20
> > You almost caught me out. I was going to say, this changes the
> > behaviour of the return code. But It's intentional ;-)
> >=20
> > It's still a bit concerning, /not/ returning an error on an error - but
> > as it's not going to prevent removal, and it won't add further (helpful)
> > diagnosticts), maybe it makes sense.
> >=20
> > My only concern would be if it might be better to keep the return code,
> > so that the core frameworks know about the issue at least.
>=20
> The long term goal is to make the remove callback return void. For that
> change I want all implementations to remove 0 to make the change easy to
> review.

Thanks for the update, that makes it much clearer indeed. And will make
it clear that there's no use for a return code.

--
Kieran

> Best regards and thanks for your thoughts,
> Uwe
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=EF=BF=BDnig    =
        |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
