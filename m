Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3EAE7BBCB4
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 18:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbjJFQ2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 12:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjJFQ2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 12:28:22 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5776CB6
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 09:28:21 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:a4b3::580])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5DFC26605957;
        Fri,  6 Oct 2023 17:28:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1696609699;
        bh=BpBRSzjEt9YdkMSc5bpxOEoFBMPL2m6SmbzqTf/kSWo=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=cUOzZyYgDycfYGD7LgfwXUCzsCkfrGCtypv13YLyql++nFabs8yVGnO8dTxMdgANn
         DZWcf4JOMrzX5BxRIBk/KjfQh18sxV2G2f6XHfSPa2Xpi5JRW29Cnwq7jDl2LNWvKq
         KB3H4VBWRa/LXKwjkgM53jXqoiM8foWRqZWmYTx8OhSnJB5ByflxGZ6Y0otBpNa8hB
         66fR+Rq/FI5CvFiFQCrY8TXklUyVn/DTvZm45Yh7+8WFTitmCQHaPLVJ63G30sGGzJ
         VkEzQacD7UVRX0IwHLBm87gKeJ4DzlEvNw3GW3Cv2gSjXuGOsOybT1w4eZrvD8DDhb
         W/GiN4mJgIYZw==
Message-ID: <f1b9292311ca9b9c723505cdc0fdc3a7280be9dc.camel@collabora.com>
Subject: Re: [PATCH] Documentation: media: gen-errors.rst: fix confusing
 ENOTTY description
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Fri, 06 Oct 2023 12:28:09 -0400
In-Reply-To: <34367590-d62a-4527-b31e-0401ba030ad4@xs4all.nl>
References: <34367590-d62a-4527-b31e-0401ba030ad4@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

thanks for the quick adjustment.

Le vendredi 06 octobre 2023 =C3=A0 15:45 +0200, Hans Verkuil a =C3=A9crit=
=C2=A0:
> The text is very, very old and predates /dev/mediaX devices, so the
> reference to "media device" is today very confusing.
>=20
> It also says that the ioctl is not supported by the driver, but a
> driver may have multiple device nodes, some support a given ioctl,
> and some don't.
>=20
> Simplify the description: ENOTTY means that the ioctl is not supported
> by the file descriptor.
>=20
> Reported-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> diff --git a/Documentation/userspace-api/media/gen-errors.rst b/Documenta=
tion/userspace-api/media/gen-errors.rst
> index e595d0bea109..4e8defd3612b 100644
> --- a/Documentation/userspace-api/media/gen-errors.rst
> +++ b/Documentation/userspace-api/media/gen-errors.rst
> @@ -59,9 +59,7 @@ Generic Error Codes
>=20
>      -  -  ``ENOTTY``
>=20
> -       -  The ioctl is not supported by the driver, actually meaning tha=
t
> -	  the required functionality is not available, or the file
> -	  descriptor is not for a media device.
> +       -  The ioctl is not supported by the file descriptor.
>=20
>      -  -  ``ENOSPC``
>=20

