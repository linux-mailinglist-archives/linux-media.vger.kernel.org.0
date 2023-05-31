Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 049CF717804
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 09:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbjEaHY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 03:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234653AbjEaHYN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 03:24:13 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82148EE
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 00:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1685517846; x=1717053846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=56MBSzwjQmIxJmbbzWD4uA9JIvIZaXr4zsJTBRkTWaU=;
  b=afWU2nqxgbqa1KUJrAJ5scELQ8Ay1G3E0RYMBYFizy/PidyTtLmHPfFA
   HDWxdEaaWNGlUPoCiSqC3dq1lrfZC6SDbWumod7w+qy/cEj6icKcb3+ha
   m/BzBpdEQyrXugygRLhZlJ6iNBp22q4peh7SVdocVy1HxaxhjDLSkRiQU
   dFoefJCykmhEZtdVv4wf8pLl0uySa7zlCOkOzqP/A+ZAFfcUbECPfTrKr
   6mYNARujt6LWqO63VtsZLjkn7+reK90m6chmjL5f8j7wtEKfBD1Hj+EfJ
   6j6i4N9jPMBP5Kw6RyeDi46JuJtkC6Byq7rIvX6Uo0JkroobBhLpSsU5C
   g==;
X-IronPort-AV: E=Sophos;i="6.00,205,1681164000"; 
   d="scan'208";a="31184479"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 May 2023 09:24:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 May 2023 09:24:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 May 2023 09:24:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1685517844; x=1717053844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=56MBSzwjQmIxJmbbzWD4uA9JIvIZaXr4zsJTBRkTWaU=;
  b=TOXAVentN88Zl1uDkr4j0rlvtYoGCbAVMjib/woN1D/Q7BpbDA/yQixx
   Y7X9UMd2dzoE6DVs2T+Z06J+f6jSxdKumb3yDJt9lO7IAeEWl8NTjCk9U
   BiIJgukv5O6e32xhEdAIFCoBZ/ryijNSNZ1fHdA2++5hE0rZdI1mct2Zn
   U3Uf0H1y8yppdyc72QImNEV2HtyC58JR6kAAwp31a90RhLjaJ+wGDgg+n
   s+8BymZ1BPSeZdSsZ6S1xvfc8QOMapei4b7VlV2ry9KTtB9YUqrr+mzdb
   N4NLG6WE9HvM5ZP1ysDFkbNSLqlC6joVNbdBowxTJu7MYaVv3qTf9EJdb
   A==;
X-IronPort-AV: E=Sophos;i="6.00,205,1681164000"; 
   d="scan'208";a="31184478"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 May 2023 09:24:04 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 438D7280099;
        Wed, 31 May 2023 09:24:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Shijie Qin <shijie.qin@nxp.com>, Eagle Zhou <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ming Qian <ming.qian@nxp.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 1/1] media: amphion: use dev_err_probe
Date:   Wed, 31 May 2023 09:24:04 +0200
Message-ID: <13280365.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <AM6PR04MB634181E89FCBAC78DB6F78C1E7BD9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <20230131103244.624698-1-alexander.stein@ew.tq-group.com> <4055673.mvXUDI8C0e@steina-w> <AM6PR04MB634181E89FCBAC78DB6F78C1E7BD9@AM6PR04MB6341.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am Freitag, 17. M=E4rz 2023, 09:52:51 CEST schrieb Ming Qian:
> >Hi,
> >
> >Am Dienstag, 31. Januar 2023, 11:32:44 CET schrieb Alexander Stein:
> >> This simplifies the code and silences -517 error messages. Also the
> >> reason is listed in /sys/kernel/debug/devices_deferred.
> >>=20
> >> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Reviewed-by: ming_qian <ming.qian@nxp.com>

Thanks. Who is going to pick this patch?

Best regards,
Alexander

> >is there any feedback on this?
> >
> >Thanks and best regards,
> >Alexander
> >
> >> ---
> >>=20
> >>  drivers/media/platform/amphion/vpu_mbox.c | 9 ++++-----
> >>  1 file changed, 4 insertions(+), 5 deletions(-)
> >>=20
> >> diff --git a/drivers/media/platform/amphion/vpu_mbox.c
> >> b/drivers/media/platform/amphion/vpu_mbox.c index
> >> bf759eb2fd46..b6d5b4844f67 100644
> >> --- a/drivers/media/platform/amphion/vpu_mbox.c
> >> +++ b/drivers/media/platform/amphion/vpu_mbox.c
> >> @@ -46,11 +46,10 @@ static int vpu_mbox_request_channel(struct device
> >> *dev, struct vpu_mbox *mbox) cl->rx_callback =3D vpu_mbox_rx_callback;
> >>=20
> >>       ch =3D mbox_request_channel_byname(cl, mbox->name);
> >>=20
> >> -     if (IS_ERR(ch)) {
> >
> >> -             dev_err(dev, "Failed to request mbox chan %s, ret :
> >%ld\n",
> >
> >> -                     mbox->name, PTR_ERR(ch));
> >> -             return PTR_ERR(ch);
> >> -     }
> >> +     if (IS_ERR(ch))
> >> +             return dev_err_probe(dev, PTR_ERR(ch),
> >> +                                  "Failed to request mbox chan
> >
> >%s\n",
> >
> >> +                                  mbox->name);
> >>=20
> >>       mbox->ch =3D ch;
> >>       return 0;
> >
> >--
> >TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> >Amtsgericht M=FCnchen, HRB 105018
> >Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> >https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.tq
> >-
> >group.com%2F&data=3D05%7C01%7Cming.qian%40nxp.com%7Cf727eee294b74
> >d6b250d08db25219119%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> >7C638144598318747307%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> >MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%
> >7C&sdata=3DUREXcvYNz6K%2FoF%2Bahc7%2Bhos7fv9Lz3N0Fx2u5a%2F8Jlo%3D
> >&reserved=3D0


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


