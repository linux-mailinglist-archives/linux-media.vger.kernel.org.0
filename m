Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD43654EC7B
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 23:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378766AbiFPVYb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 17:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiFPVYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 17:24:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4523560D97
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 14:24:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4536B2E4;
        Thu, 16 Jun 2022 23:24:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655414668;
        bh=guYaObE+enVQuun895Jx+m8JfTo1R2pApFrePOPzZYM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sbmVQiEGJMpkRCuCwl5MzqhrtDXvfiQJn5CGHO3cT84tIpUJweOxFojcRO8o1gJpK
         kSkvK0LMqRoxCkf0HlZ2mbXpU0GY6yXb+T9BO96QBhmju1eV3TzMJtdunTCPuusVlh
         904L/aCFGJWtW+0scRA/FOExnX68OcHOGnlN0Rzk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f1bb9483-7199-3e3c-0d8c-89bc13be70f4@linuxfoundation.org>
References: <20220616100747.48124-1-daniel.oakley@ideasonboard.com> <20220616100747.48124-2-daniel.oakley@ideasonboard.com> <02e4de58-9de7-56e7-d673-6c01f50da64b@linuxfoundation.org> <f1bb9483-7199-3e3c-0d8c-89bc13be70f4@linuxfoundation.org>
Subject: Re: [PATCH 1/3] media: vimc: expand the names of vimc entity types
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>
To:     Daniel Oakley <daniel.oakley@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org
Date:   Thu, 16 Jun 2022 22:24:26 +0100
Message-ID: <165541466600.2786155.16126381340154209662@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Shuah Khan (2022-06-16 15:41:45)
> On 6/16/22 8:29 AM, Shuah Khan wrote:
> > On 6/16/22 4:07 AM, Daniel Oakley wrote:
> >> When introducing the lens controller, it became apparent that the vimc
> >> entity type names were hard to understand, e.g. vimc_len_type refers t=
o the
> >> lens. The names of the vimc entity types have been expanded to make the
> >> code easier to understand. There is no functional change intended.
> >>
> >> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> Signed-off-by: Daniel Oakley <daniel.oakley@ideasonboard.com>
> >> ---
> >> =C2=A0 .../media/test-drivers/vimc/vimc-capture.c=C2=A0=C2=A0=C2=A0 | =
270 ++++++------
> >> =C2=A0 drivers/media/test-drivers/vimc/vimc-common.h |=C2=A0 10 +-
> >> =C2=A0 drivers/media/test-drivers/vimc/vimc-core.c=C2=A0=C2=A0 |=C2=A0=
 22 +-
> >> =C2=A0 .../media/test-drivers/vimc/vimc-debayer.c=C2=A0=C2=A0=C2=A0 | =
393 +++++++++---------
> >> =C2=A0 drivers/media/test-drivers/vimc/vimc-lens.c=C2=A0=C2=A0 |=C2=A0=
 82 ++--
> >> =C2=A0 drivers/media/test-drivers/vimc/vimc-scaler.c | 216 +++++-----
> >> =C2=A0 drivers/media/test-drivers/vimc/vimc-sensor.c | 307 +++++++----=
---
> >> =C2=A0 7 files changed, 652 insertions(+), 648 deletions(-)
> >>
> >=20
> > Thank you for the patch to improve code readability. Looks good to me.
> >=20
> > Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> >=20
>=20
>=20
> Reviewed all three patches
>=20
> Mauro,
>=20
> Would you like me to send a pull request for these patches?

Hi Shuah,

Please note that I believe these patches are based on top of Yunke's not
yet accepted patches for the vimc-lens.

--
Kieran


>=20
> thanks,
> -- Shuah
