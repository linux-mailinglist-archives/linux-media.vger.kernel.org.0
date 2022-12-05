Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF89642CB4
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 17:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbiLEQWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 11:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiLEQWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 11:22:23 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EB81D66B
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 08:22:21 -0800 (PST)
Received: from [IPv6:2804:14d:72b4:8284:8136:cc5a:dce9:8832] (unknown [IPv6:2804:14d:72b4:8284:8136:cc5a:dce9:8832])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 80BD266015BC;
        Mon,  5 Dec 2022 16:22:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1670257340;
        bh=3XOli3sUmonvATiAGdMEgclcRc9SKKCgAuEEwakb3mg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Nd4Sh6+SLG3G+NviAJw9OJGjQdn5uAsNMEKNxD0EJMGnqnN3dcUPAbUUvgPVtSreX
         X19jgdzxocu/p6pd9gZ2LnAyUYGx3c2YoU69yQFW0GdTMZ9ULedVeHPHy0lBoWzQzA
         yoUK3cafUsXiDrSeuct+2fTrvmeU6Y49WDETX/XB7Q1501jdHPCtDO31SIE6J+q5CB
         vClqF3FpSPs6oNpwxwksQXgqIzLOADRmjKLQGsNGmTJTx/tobPn74+BAkKgTMZawzu
         qCiQRu6nhJj4iEWKFEiqqbYO+i1qRgp6+nh/NeNzqvLZwBnRjU7HzjpPWARxwvArx5
         95oTk8TSKWheg==
Message-ID: <977863282aceb69a08417c505720767793a66915.camel@collabora.com>
Subject: Re: [PATCH v4 0/2] utils: add v4l2-tracer utility
From:   Daniel Almeida <daniel.almeida@collabora.com>
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
Cc:     nfraprado@collabora.com, nicolas.dufresne@collabora.com,
        hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com
Date:   Mon, 05 Dec 2022 13:22:06 -0300
In-Reply-To: <704781937ac3930bc44561fc4001f76401882553.camel@collabora.com>
References: <cover.1669831184.git.deborah.brouwer@collabora.com>
         <704781937ac3930bc44561fc4001f76401882553.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Apparently my name was stated as "Collabora", sorry, I've just switched
email clients recently.

Fixed now.

On Mon, 2022-12-05 at 11:39 -0300, Collabora wrote:
> Hi Hans, this looks good to me.
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>=20
>=20
> -- Daniel

