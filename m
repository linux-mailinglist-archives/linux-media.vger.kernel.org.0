Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63B96BA868
	for <lists+linux-media@lfdr.de>; Wed, 15 Mar 2023 07:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjCOGvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 02:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjCOGvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 02:51:22 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE8B3772A
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 23:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678863049; x=1710399049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XW7obNTyytps3WbvRLf1IxunjDH/8ercfzm5Q//RJ+o=;
  b=EyqZB0FH9X8PcZbCJf6XQOuJ30WsY+uXbffor15tExAdBzs8rvAnbr8N
   iTJVZR4vaX0P2FYmfBqBXvQmlw7qMDcbtc90s3pog+qYdIPXqRrqe+tGJ
   sfPogNdZT9xzylHqCD3LiS5G5F0gO0CjvKtkF95qSxPelwHRizmrjn4MB
   DEMt0yhbEH0OWO1/2mV5Of/4zE6pTmSN1LZggiAnYVVyU795CkS31eL9R
   wOEI+knZl5IJo5bmWnm8mOIqe/F2MpuFeOGt61gt91OQ1j1gyiS8XknWL
   BXCuASlWvKeb9ZCH6qUPF5oBrdZHU+pKIncRvzyEinrCULpnBZPsm4R/8
   g==;
X-IronPort-AV: E=Sophos;i="5.98,262,1673910000"; 
   d="scan'208";a="29694136"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Mar 2023 07:50:27 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 15 Mar 2023 07:50:27 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 15 Mar 2023 07:50:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678863027; x=1710399027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XW7obNTyytps3WbvRLf1IxunjDH/8ercfzm5Q//RJ+o=;
  b=F30f3C2fTIRp/fQd2uTXtfeAki6H0jhN+jUVqIVSRSY+xCOxpezuH9nT
   DOUf+GztbKUFvUl0tGg2PCeNOR9ynFaMFUsPgqGudK/9ALQUk4O0SW8j5
   3N4IeTQaiQTj/Ne/epH76YHjTugNBR+SIrwr4h9A9g7PEDEgEKqTJ0i9s
   bO3VYOMuFBxkErBGhzBteTYBwo3OSIhlpqtYrhavAac03dUAuT2GPCQNp
   QEFCYo3yd05Xfd/3YDpNMh/Hcxo4FDsSDLHWc07fg3SMrRpJ+e5LzSLcT
   SGzI+bw+E8Ki4wbJPAY4dKV0EesY4ACNqbxtyDs7KcX98oo+E+wPleUeR
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,262,1673910000"; 
   d="scan'208";a="29694135"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Mar 2023 07:50:27 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 596EA280056;
        Wed, 15 Mar 2023 07:50:27 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Ming Qian <ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>,
        Zhou Peng <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: amphion: use dev_err_probe
Date:   Wed, 15 Mar 2023 07:50:25 +0100
Message-ID: <4055673.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230131103244.624698-1-alexander.stein@ew.tq-group.com>
References: <20230131103244.624698-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am Dienstag, 31. Januar 2023, 11:32:44 CET schrieb Alexander Stein:
> This simplifies the code and silences -517 error messages. Also
> the reason is listed in /sys/kernel/debug/devices_deferred.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

is there any feedback on this?

Thanks and best regards,
Alexander

> ---
>  drivers/media/platform/amphion/vpu_mbox.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_mbox.c
> b/drivers/media/platform/amphion/vpu_mbox.c index
> bf759eb2fd46..b6d5b4844f67 100644
> --- a/drivers/media/platform/amphion/vpu_mbox.c
> +++ b/drivers/media/platform/amphion/vpu_mbox.c
> @@ -46,11 +46,10 @@ static int vpu_mbox_request_channel(struct device *de=
v,
> struct vpu_mbox *mbox) cl->rx_callback =3D vpu_mbox_rx_callback;
>=20
>  	ch =3D mbox_request_channel_byname(cl, mbox->name);
> -	if (IS_ERR(ch)) {
> -		dev_err(dev, "Failed to request mbox chan %s, ret :=20
%ld\n",
> -			mbox->name, PTR_ERR(ch));
> -		return PTR_ERR(ch);
> -	}
> +	if (IS_ERR(ch))
> +		return dev_err_probe(dev, PTR_ERR(ch),
> +				     "Failed to request mbox chan=20
%s\n",
> +				     mbox->name);
>=20
>  	mbox->ch =3D ch;
>  	return 0;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


