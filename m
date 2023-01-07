Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1008E660D0C
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 09:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjAGIoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Jan 2023 03:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjAGIoL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Jan 2023 03:44:11 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C1B61445
        for <linux-media@vger.kernel.org>; Sat,  7 Jan 2023 00:44:10 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id co23so3262926wrb.4
        for <linux-media@vger.kernel.org>; Sat, 07 Jan 2023 00:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+6ScRDZ6PX5crj95gb2PeuR7M4+92xiqDVtcNYoN7GE=;
        b=aE9RMtI4+WDm6gxXi9IX7QOmK0pHBOIQCPb+tA/byj+5XC1Q/1DfyB8UsVC7xFRq5N
         lTokJM6AR8Xks1N1WCSOIh2+7fgTI0ACdwRB9KZ6OP1fSRjTu2fxHjft+T3fVATYMMbS
         V1L/LYPsS0shYrSouau9asGnJyXAlr9wBGyOkIUe/8w1pc53kM7GlEEHiDXhaq+inEld
         W4CmBFmQKAB/kYfwz7i+k/4EvdiKowbHwLXYLQINXx1+b3xa8o88iNw8WTH+RvN5QE/m
         +Gf4fb6I2alOBRkWUzcqxcUOZt3qxp0zHetvYtyBg4xsWWrqu9QpDLE+a5cxraCX+YXS
         npGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6ScRDZ6PX5crj95gb2PeuR7M4+92xiqDVtcNYoN7GE=;
        b=cVzJhUWxn06iqQn/il9wim2HxRfwFJtMYsAu7B35g0QFmqdc4dgcZwy9Bk3IqmJTLB
         OsFOxuyYod9uaN7AWuV3rNyaN+ceRV2NBZAhYO3OcjwG3VV/wGzHs0QZikyeHckGhIgz
         pHAADJA0kAyYpP/xNED7GOFV0PG8I2XSGf1wKY/hSVuA+D8n8PuZck7/ndGATwzEraxU
         Yp/OFPWMujlAjFxQRCEq/KmUvX0jDrN2I4H1/YFcbmIByYrSsJX3OfWP5WWf2THej4c5
         F8PDWLcE61qKg0vvvWFsd5S/TJEhBMaVp+eSbXPnJi4zl4vcKk+0pUgi0EGJdqtTHl4x
         be3Q==
X-Gm-Message-State: AFqh2kq9mEPOiuufToWMSxdR+vsU8yLVOA4qPbpxP6nLSNtMnGJzsJc1
        FlHSlpNrLczBLLlYlAiDH5WJqDP4TFTVrQ==
X-Google-Smtp-Source: AMrXdXvaUGx/9Wm2ekg2dgzHetJ9P7UmSNLny73Wp8avGRbP3U2OIjLZ6r38mohuhZvHkX/8EboOHw==
X-Received: by 2002:a5d:4950:0:b0:26e:7604:6575 with SMTP id r16-20020a5d4950000000b0026e76046575mr33538853wrs.65.1673081048483;
        Sat, 07 Jan 2023 00:44:08 -0800 (PST)
Received: from 192-168-1-215.localnet ([90.242.19.250])
        by smtp.gmail.com with ESMTPSA id m7-20020adffe47000000b002b880b6ef19sm3202047wrs.66.2023.01.07.00.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 00:44:07 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From:   Adam Pigg <adam@piggz.co.uk>
To:     linux-media@vger.kernel.org, piggz1@gmail.com
Cc:     mchehab@kernel.org, linux-sunxi@lists.linux.dev,
        paul.kocialkowski@bootlin.com, laurent.pinchart@ideasonboard.com,
        yong.deng@magewell.com
Subject: Re: [PATCH 0/3] suns6-csi changes to support libcamera
Date:   Sat, 07 Jan 2023 08:43:43 +0000
Message-ID: <3476105.iIbC2pHGDl@192-168-1-215>
In-Reply-To: <ig7fmi.ro3721.rtjy47-qmf@smtp.gmail.com>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <ig7fmi.ro3721.rtjy47-qmf@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9048664.CDJkKcVGEf";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--nextPart9048664.CDJkKcVGEf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Adam Pigg <adam@piggz.co.uk>
To: linux-media@vger.kernel.org, piggz1@gmail.com
Subject: Re: [PATCH 0/3] suns6-csi changes to support libcamera
Date: Sat, 07 Jan 2023 08:43:43 +0000
Message-ID: <3476105.iIbC2pHGDl@192-168-1-215>
In-Reply-To: <ig7fmi.ro3721.rtjy47-qmf@smtp.gmail.com>
MIME-Version: 1.0

On Friday, 6 January 2023 23:10:46 GMT piggz1@gmail.com wrote:
> Apologies, accidentally sent this set twice.  please ignore this set.
> 
Ignore this, the first set I sent myself, and I didnt actually send it twice to 
the list!

Also, if you see 2 email addresses,  adam@piggz.co.uk is a forwarding address 
to GMail.  I could see how to make git-send-email set the preferred sender 
address, only the from address.

> Adam
> 
> On Friday, 6 January 2023, adam@piggz.co.uk wrote:
> 
> > From: Adam Pigg <adam@piggz.co.uk>
> > 
> > This 3 patch set adds V4L2_CAP_IO_MC and vidioc_enum_framesizes support
> > to the sun6i-csi driver, allowing the Pinephone rear camera (ov5640) to
> > be supported.
> > 
> > These have been developed with the guidance of Laurent Pinchart, and
> > been tested by capturing frames from the libcamera cam utility.
> > 
> > In addition to these, a patch to change the v4l gain mode in the ov5640
> > driver, and the 2 format propagation patches all by Laurnet are
> > required.
> > 
> > Adam Pigg (3):
> > 
> >   media: sun6i-csi: merge sun6i_csi_formats and sun6i_csi_formats_match
> >   media: sun6i-csi: implement V4L2_CAP_IO_MC
> >   media: sun6i-csi: implement vidioc_enum_framesizes
> > 
> > 
> > 
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 215 +++++++++---------
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.h       |   6 +-
> >  2 files changed, 103 insertions(+), 118 deletions(-)
> > 
> > 
> > -- 
> > 2.39.0
> > 
> >
> >
> 
> 
> -- 
> Sent from my Sailfish device


--nextPart9048664.CDJkKcVGEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEG9S9FlpVKT4WucElgZzecrq7HBkFAmO5ML8ACgkQgZzecrq7
HBkH5g//URjdEf+uZ5ZnLA5IkZnPKmYHS8Yew/78eM+6OV8Z64yy0ptlkrCQIjAZ
tgQKIIGr6ujlWx4oMCkW1nxbrKGNdXXR8+AUnRzK+HnX53m5kIWdkApetAaKSURq
NNWGbVLO1jFXbBqstf6zA3CwG60gg+9NP8mgK3Rhlcq5UAexqoM1piLRlgXLsDmS
o8oiRXy8N/IGwHmb3Ki+f/NWlx8iq7sBL87rSPY/1LSaXiBbraKk6NbXjqmG3pFD
KxdCTc+lte3zb2G9qN23MPX7xAk/ZAyVjQfXzS1io7wd0Cf3sxFHZacNPqZUEOMs
ItQAtkUJLMGd4fuNGge+PKSpwSPisJpT+tWtLkKU+wwEvq/lIeoiOBFObl53oinu
GMgK0tSb6x8MnCNPTZxeZKe/8aIEKFSl4J8+Fjin3s+eJ8bUhVo4w7qGXla+hMgm
aJ1oc++jEyGmKkDgnC0YNq3LhZ4cehxNZ0XU2FruWPJfhQKCR45cgruFReOAzo+d
Gps2ifyuQkG0bX6XfhEjGiNoLKBf/lQoA2oAeJ5y7jE8lwnMeZtrZuEwf/92D/l8
Apnsi/no26/uDcoirs7ht+PV98PsVrwMQSKDWLCk8YzhUdF3H7qaeNzGPQoa9xp4
Lt4ycOJ8YdMDuFFjxOqptyH2EPF41oudU1m7eNCP5P/F2BCzFZg=
=3uut
-----END PGP SIGNATURE-----

--nextPart9048664.CDJkKcVGEf--



