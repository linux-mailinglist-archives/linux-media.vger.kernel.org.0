Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285F6561E1A
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 16:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237205AbiF3OhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 10:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbiF3Ogz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 10:36:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609441EEF1
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 07:32:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6573845F;
        Thu, 30 Jun 2022 16:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656599527;
        bh=Dxvfyl88SqdUAZkcaSY5ytpMFtAzx5vJDJT2gqnD2A0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NyYqOQ/R8jq76JvZGjCJe7/SYAn/nUuvpIc4cs53Lmtb4wGqNvjxi5gLBCYWLwFPZ
         ejVVIzVv9ggSbQgSUW6x68chanQwf8aLFruPqePOcvQW4THMgRiHYIIczWjzVkT5t6
         FOKrD9O/tTWFMpXWGyPwzbFaYekBjp4gm+ye2FN0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220627171418.43854-1-umang.jain@ideasonboard.com>
References: <20220627171418.43854-1-umang.jain@ideasonboard.com>
Subject: Re: [PATCH] v4l2-ctl: Fix typo in --list-patterns help text
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Umang Jain <umang.jain@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Thu, 30 Jun 2022 15:32:05 +0100
Message-ID: <165659952579.2049236.1476117017637696677@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang,

Quoting Umang Jain (2022-06-27 18:14:18)
> s/stream-pattern/stream-out-pattern/
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-=
ctl-streaming.cpp
> index 7f6482d6..05de44d7 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -330,7 +330,7 @@ void streaming_usage()
>                "  --stream-out-dmabuf\n"
>                "                     output video using dmabuf [VIDIOC_(D=
)QBUF]\n"
>                "                     Requires a corresponding --stream-mm=
ap option.\n"
> -              "  --list-patterns    list available patterns for use with=
 --stream-pattern.\n"
> +              "  --list-patterns    list available patterns for use with=
 --stream-out-pattern.\n"

At the least, according to `v4l2-ctl --help-all | grep -- -pattern` this
looks correct ...

>> $ v4l2-ctl --help-all | grep -- -pattern
>>   --stream-out-pattern <count>
>>   --list-patterns    list available patterns for use with --stream-patte=
rn.

So=20

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>                "  --list-buffers     list all video buffers [VIDIOC_QUERY=
BUF]\n"
>                "  --list-buffers-out list all video output buffers [VIDIO=
C_QUERYBUF]\n"
>                "  --list-buffers-vbi list all VBI buffers [VIDIOC_QUERYBU=
F]\n"
> --=20
> 2.31.1
>
