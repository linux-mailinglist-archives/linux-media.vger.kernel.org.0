Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66D22DBE82
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 11:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgLPKTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 05:19:45 -0500
Received: from mout.gmx.net ([212.227.15.15]:43685 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgLPKTo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 05:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608113885;
        bh=EkN0tAvBXM+bEcRrzO1ui4KVWR+Oa9dgiyO3uTvYRhY=;
        h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:References;
        b=dZ3hfjxakFD1hrPKwt7to2ocChOR3iyTHMDQsW6hGQw6YDZlLTQwgDPALpfKx4wzR
         wbURt9Wg8oUlDEFkYeJDphlyC/IQwE4+YJhpHJsknaO+3DRhengenttjibyHC02OdA
         jy7nZ18eX3iOl5DR2pttTM25dvngRujje35dl8jc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from axis700.grange ([87.79.50.253]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Mj-1kGQ2w1UXL-00aDD2; Wed, 16
 Dec 2020 11:18:05 +0100
Received: by axis700.grange (Postfix, from userid 1000)
        id 8487861F51; Wed, 16 Dec 2020 11:18:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by axis700.grange (Postfix) with ESMTP id 6909A616B7;
        Wed, 16 Dec 2020 11:18:03 +0100 (CET)
Date:   Wed, 16 Dec 2020 11:18:03 +0100 (CET)
From:   Guennadi Liakhovetski <g.liakhovetski@gmx.de>
X-X-Sender: lyakh@axis700.grange
To:     Rob Herring <robh@kernel.org>
cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
In-Reply-To: <20201210211625.3070388-2-robh@kernel.org>
Message-ID: <alpine.DEB.2.20.2012161113060.15676@axis700.grange>
References: <20201210211625.3070388-1-robh@kernel.org> <20201210211625.3070388-2-robh@kernel.org>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Provags-ID: V03:K1:10RrKdIGxPny3KKQBUSxhVFZ4+gRCKzy3mvxV7clzE9UNjib+xt
 TPLTHLsppU9QgL5Azp84GupTgA9vaRob57wDMCsWo1uxols9w9aY2s4WV8CVhF7GFQDn0pB
 F1qYLIzBtIkYWt5C34VjwJZJld2B5/BKrOvBPl5SGqDYk7FL+7aT9YD52YR/sJcGgDR3afN
 U3B8bNd6jRcKZyYFlDOjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nqgYwJno6GQ=:XymytEfsCnpZVPXOdSFnpN
 Ooig8yVSwGaUuxQJlfBexR8B3G/6LfRs7ZlKtZeBXGG23nDII9dcKpPYBQ6hDqisSecIy8yrs
 kzFYZwLuFDKJXXKoKm92k70dj1GhUG8fdiIn11nm5Vt0HVwPKvraaM1eno4Hk2HROlxWgb1c/
 MCR9d+VKzpNPfOPX931z6/tQH48EKTTy1ABGc8SZmkvEAjGehHvrtbWyANY8tLfLn0NdPQWMg
 xtrr/RX0Rqg4urzUrcwM9S9j43VrhqbCeSTaFvcdovG7f32VeH9TRRL+52aYdXkTbmTrMUPjP
 3claeW1NfYUdH07EyaozUaAqjRxuGiAJ6+lz5E7q6LIyfYGEl9INVw4CjMT0t4ANaXsYvo6k6
 HBi25XqImHo+s91e7yeH7V0EPGPBoWQS4OmWn1qRKfy2FY30vxZXFkGOeJYaEJQyrL02he6+C
 K3SqB9LDL05XTXTAFIWFST6o2bs0GtZ743ICktRUb+w8D2NoD5s5uRQ2otc30oL5OWIKxMFMS
 I6TRl+0DRc8Rf/i7MrHPMePD83Tv0ki38Lbv9hDo2OurNQ/1TbugPOsQpoySq4kH2LyB9oG3c
 /el3wwjnXdNTHlaPLmIGO8OfwnBfqXItiKH7ydbE7b4MHJI0c6dHw/q7Kkz3xluXhex/i8ipe
 LcJGMe3HgYwpQbgUclsflR6NNFkroBHSLuvzjjz1rnD6FUEsnW+JjvXeaiGMw+zsqYOqi6VJc
 aE+s3lshYruDDv4lz9P1VpCljKq9xbuVdAneQl8r7D9FXdw8ojIXnwXdT8r4VDkK2IyhcwUR0
 bzrQmHSPfG5Hi7l7inbSbJA1Pk0wGQRhIta+j5w6xDWo5NwcWqFkzlulJYWg9+eY/YXtVVhFn
 j7WfeGIzLWTVud74hSLQ==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Sorry for the delay! I didn't realise my ack was required for this patch.
I won't object against the licence change, but please don't add me as a
maintainer of

On Thu, 10 Dec 2020, Rob Herring wrote:

[snip]

> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.ya=
ml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> new file mode 100644
> index 000000000000..7415a4df1576
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -0,0 +1,344 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/video-interfaces.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common bindings for video receiver and transmitter interface end=
points
> +
> +maintainers:
> +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>

I did commit the original version of
Documentation/devicetree/bindings/media/video-interfaces.txt but that was
more than 8 years ago, I haven't worked in media / V4L for several years
now, so, I don't think I can meaningfully maintain that file now.

Thanks
Guennadi
