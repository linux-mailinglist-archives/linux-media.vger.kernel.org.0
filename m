Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60D320C5F3
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2020 06:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgF1Ein (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jun 2020 00:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgF1Eim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jun 2020 00:38:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2AC7C061794
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2020 21:38:40 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h22so6601110pjf.1
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2020 21:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=HpMMZYRbzQ/bcdlkqQv+0ue6DbtFqUzMKo2iWLbzeLo=;
        b=CzI1RdSgDpgduvsNwIZoh/8jkiOyCbjTIWeVQhjLWnNWcF3W2lnJMXg3/XiCX9PbAJ
         PIMUbRTsUruQyMATe+jlNCQCmChUOfjKnCx2Ww1ILhip/iE3fL21if3CvY4CMkLYo84S
         mW3sWo5fB1fVS/bxWPoYqOh6Y5dXfGw8cnWUV/C1Cda4KVWEjgksz5Rrw+Ht52aAxQVe
         PBtGnIMPZ7mL1/cAq0jEvfTWnDtw3cIo7rkqCTPysBjYwtbq/nxKl1XCrqOkTH9Va3jp
         rBsUkjTpL0ndN4+k5GWDacYqQoqWxq4CtqZVKez0A7RdihYiVgWWqHKEiZgo9RX4UXpN
         95Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=HpMMZYRbzQ/bcdlkqQv+0ue6DbtFqUzMKo2iWLbzeLo=;
        b=Y5a+Zt2atp/91/uZvGge1V7qYE1mP5nNT/jeN4S1GLCvdgd5c6DMi8pwNSzxpFrILK
         la+7S0ACMXSA42Sv4yv7v8h26OhwBGsyHAQzXnvX0f2bPrY1s+iHJyQqviAtcgvDHqD0
         iNtEJW+tDPrj4pfuYyIPD5ZAcp07BBP9o76yubg4qJ76X3eQAaovplFYcAIfYYqT5Dbw
         aciSaXmz44sWMX3v1U8rXyTe1xYK6KFeMmAP/V7H31trS3IHWz53Jbq9WQKfNpAiXEt+
         5plFFm67eIAwUzqshT0T7zxkRlJqjc1lLHbORgBAbObciS63PkbY969mgAGDkp0wvm4f
         iB+w==
X-Gm-Message-State: AOAM533zVjykFAODRiWahfyONSnGVuHGKqCthOqIgtyelbS0kz0Fg0zq
        FZVB6iKdEXZSgz6NqK6PjD5DAg==
X-Google-Smtp-Source: ABdhPJwqyisUZBL/qB5SDxO8FQpoVPLJsZlI7dCcD5F6JQ1ZePzGnIsmX7YpJ3dqlmE3TeQt9X0ekQ==
X-Received: by 2002:a17:90b:3448:: with SMTP id lj8mr10880938pjb.163.1593319120296;
        Sat, 27 Jun 2020 21:38:40 -0700 (PDT)
Received: from localhost ([2406:7400:73:a66d:908:f18a:1156:5c38])
        by smtp.gmail.com with ESMTPSA id y200sm4521437pfb.33.2020.06.27.21.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 21:38:39 -0700 (PDT)
From:   B K Karthik <bkkarthik@pesu.pes.edu>
X-Google-Original-From: B K Karthik <karthik.bk2000@live.com>
Date:   Sun, 28 Jun 2020 00:38:33 -0400
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: i2c: atomisp-ov2680.c: fixed a
 brace coding style issue.
Message-ID: <20200628043833.3dodctrmkec6aoe5@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="j63puneg2vpssyww"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--j63puneg2vpssyww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed a coding style issue.

Signed-off-by: B K Karthik <karthik.bk2000@live.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 90d125ba080f..c90730513438 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -495,11 +495,11 @@ static int ov2680_h_flip(struct v4l2_subdev *sd, s32 value)
 	ret = ov2680_read_reg(client, 1, OV2680_MIRROR_REG, &val);
 	if (ret)
 		return ret;
-	if (value) {
+	if (value)
 		val |= OV2680_FLIP_MIRROR_BIT_ENABLE;
-	} else {
+	else
 		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
-	}
+
 	ret = ov2680_write_reg(client, 1,
 			       OV2680_MIRROR_REG, val);
 	if (ret)
--
2.20.1

--j63puneg2vpssyww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEpIrzAt4LvWLJmKjp471Q5AHeZ2oFAl74HskACgkQ471Q5AHe
Z2o3zgv8Dymrr9Re3CvjBKnfHsbHRE4sqJi/Ro6tYF71Lt7ivGvG/ifDyn6YM9wX
EMHC+KIxMMQHfVdcr0hf+2F7EhU7NkbGKGtb2ONJduh91V7jBNlTyJBX+itlGjoy
ZPMYuP/H7LVoxGMltlHzWrYJxOeCWnzdUzE7HQmSfsXwa9AhEPNILN/dNaYf16TL
lywM6qwwDWwezqK5MVrSLWrtF5pKT3mz4ziR3YP0UoNrdb87Oc4aFleqJLrYCCFe
rPalVYkBewnjL8kj2hBtxKWLn85ycZyR9zTbPdh55qVTiDJJBm2sXVCjeZuu8dwa
n4FGQFRdv6qwFbUaIQafhSwE46f2WcLockJa1/h4udXOD1uy3TCDBPFJ6siN2/ay
Xb+aV7ugY7vAtl4ZN1i2eAnbTN4vZzh2HifOSbMV0nIfBJ9AgwWFMNMXvVn/lrPD
fv1Lis0rQE84odycbWHKUHW4JiO22TEqNyMMmsAlHa457Dv1YWrE6bUyuRcA10Vt
CtnwnGzt
=1LYK
-----END PGP SIGNATURE-----

--j63puneg2vpssyww--
