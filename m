Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D30F7D1047
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 15:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377162AbjJTNJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 09:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377002AbjJTNJG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 09:09:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF04B8
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 06:09:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FA7463C;
        Fri, 20 Oct 2023 15:08:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697807333;
        bh=rK6O7IUvscjqFmKLZXcm/oc7ERI1b3QA4e1erw7L11Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Z8DdA1tLOeKMGs928ecx83ALEq2rMun7skcBHAApG2UyXhFrxGD7Q9UI8lSID5ST5
         lz4k2cPZnoIPSU9osx17GKwwthDe98Qlwr2i5TBQixjXmkbgWJVmAFj5FE/WdFQVe0
         moZ+dQJPx+NYniRTlNL9NbBax3fKlDqBMJtC04fk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231020040908.2706654-1-jason.z.chen@intel.com>
References: <20231020040908.2706654-1-jason.z.chen@intel.com>
Subject: Re: [PATCH v1] media: ov08x40: Add Signal Integration Adjustments for specific project
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com, Jason Chen <jason.z.chen@intel.com>
To:     "Chen, Jason Z" <jason.z.chen@intel.com>, andy.yeh@intel.com,
        sakari.ailus@linux.intel.com
Date:   Fri, 20 Oct 2023 14:08:59 +0100
Message-ID: <169780733955.3350128.8191848389476305605@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Chen, Jason Z (2023-10-20 05:09:08)
> From: Jason Chen <jason.z.chen@intel.com>
>=20
> Due to certain MIPI hardware designs using overly long cables, there
> is a loss of signal strength, resulting in failed signal integration.
> The patch includes changes to adjust the driving strength in the register
> settings for a specific project.

For a specific project? Will this now affect 'all' projects using this
sensor? Will that be adverse in anyway?

Do 'short' cables still function with this patch?

>=20
> Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/i2c/ov08x40.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index 0b3b906ebef..4f13e23b325 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -160,6 +160,18 @@ static const struct ov08x40_reg mipi_data_rate_800mb=
ps[] =3D {
>         {0x6002, 0x2e},
>  };
> =20
> +static const struct ov08x40_reg mipi_si_changed_regs[] =3D {
> +       {0x481b, 0x2c}, /* HS Exit: Data Tx TEOT - reducing 8ns */
> +       {0x4826, 0x42}, /* HS Entry: Data Tx TREOT - raising 8ns */
> +       {0x4829, 0x54}, /* HS Exit: Data Tx TREOT - reducing 8ns */
> +       {0x4885, 0x1f}, /* driving strength change */

Are these changes 'relative' to already written values?

> +};
> +
> +struct ov08x40_reg_list si_regs =3D {
> +       .regs =3D mipi_si_changed_regs,
> +       .num_of_regs =3D ARRAY_SIZE(mipi_si_changed_regs),
> +};
> +
>  static const struct ov08x40_reg mode_3856x2416_regs[] =3D {
>         {0x5000, 0x5d},
>         {0x5001, 0x20},
> @@ -2917,6 +2929,11 @@ static int ov08x40_start_streaming(struct ov08x40 =
*ov08x)
>                 return ret;
>         }
> =20
> +       /* Apply SI change to current project */
> +       reg_list =3D &si_regs;
> +
> +       ov08x40_write_reg_list(ov08x, reg_list);
> +

This looks odd. Why isn't this just:

	ov08x40_write_reg_list(0v08x, &si_regs);


>         /* Apply default values of current mode */
>         reg_list =3D &ov08x->cur_mode->reg_list;
>         ret =3D ov08x40_write_reg_list(ov08x, reg_list);
> --=20
> 2.34.1
>
