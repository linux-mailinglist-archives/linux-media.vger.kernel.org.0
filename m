Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B9520B39D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbgFZOcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgFZOcO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:32:14 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A1AC03E97A
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 07:32:14 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id 35so4359476ple.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=GKpkeXKWO0/iDRkI3q+gRM2gA+nsT7NG+tuZI+pAMYk=;
        b=jV/dxvtVMQcrfjcqcVVv9uXznboRU3/s79VY2/M4aoMhDnKykFxMlGw8Xzjziq9/BZ
         n8eFNGk41n8LQKrYlMlPT+UnKoR7wzOMCAHbsCJu/8Da7gUsd70JQjUHoMKOfUY+ID9P
         8fQ5XwgrDVoGtws730S5vRbPWks+ZurBnfGK6g4MXkT5JsDmVc9+PTBwyfgfg/JUESTV
         9ASG8Y4TLo3B64ybtBO7CSqa22k54VxE9afF+ZLW3igIoPOrb/QsilDPpB1P7dRsSpDm
         KZqyqTQaMmLi2shuTrSciE9MnNqc8IQNgB+h/RmAJCPmWwDW/n9IM4mR4/gRXaWe/A3P
         KpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=GKpkeXKWO0/iDRkI3q+gRM2gA+nsT7NG+tuZI+pAMYk=;
        b=um/yOFUzMaYUsWj898xEDrwGHydv4Fp9ruerE5vKioh17deh7QkCxzCxKd3HSrnp56
         C3C59nII9ZpdrQcqRVk7UntCOMbaTtHst9GbsLu4lX+7QbjeteeF2FuUhCTDCDSTJyNi
         DoRrDacXivuFByolnFuTeUjLjkQIkvq5poewhJ0VcKXyvgLgkRtiMKDi7ixMVEz/eVgh
         lw4haWeudVNUlpXStnmUW8qZeD3KuT8TSG567y/Q01L6JUyCjcnlLfGigBbOCqMn5OcX
         I2y5bIbNgulaCzWd1Y6dIKzEgXn/prwrO1rqXPE0V5t8/PIEVpO93DIS7u8XHEjU4tjo
         z23w==
X-Gm-Message-State: AOAM530QwftbPokdXJZxt5RoFs/O6zNdg6PZssoaJqkcOOPS/n8JX01n
        gfS0wsu6uYD6xKT1bSg/CX4qkg==
X-Google-Smtp-Source: ABdhPJwPdgnkxqxpQw98XN7dwymyUdzZYUz1a8GyNPp65VYN6Gww16MIcnFmXN0iHxPz98RnvJfBlg==
X-Received: by 2002:a17:90a:f014:: with SMTP id bt20mr3855879pjb.135.1593181933623;
        Fri, 26 Jun 2020 07:32:13 -0700 (PDT)
Received: from localhost ([2406:7400:73:e1a0:908:f18a:1156:5c38])
        by smtp.gmail.com with ESMTPSA id g17sm11640913pju.11.2020.06.26.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 07:32:12 -0700 (PDT)
From:   B K Karthik <bkkarthik@pesu.pes.edu>
X-Google-Original-From: B K Karthik <karthik.bk2000@live.com>
Date:   Fri, 26 Jun 2020 10:32:05 -0400
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: usbvision: removing prohibited space before
 ',' (ctx:WxW)
Message-ID: <20200626143205.xns6nwggskssujao@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yqjlajrqt7jpyhif"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--yqjlajrqt7jpyhif
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

fixing ERROR: space prohibited before that ',' (ctx:WxW)

Signed-off-by: B K Karthik <karthik.bk2000@live.com>
---
 drivers/staging/media/usbvision/usbvision-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/usbvision/usbvision-i2c.c b/drivers/stag=
ing/media/usbvision/usbvision-i2c.c
index 6e4df3335b1b..010ad03c6ec1 100644
--- a/drivers/staging/media/usbvision/usbvision-i2c.c
+++ b/drivers/staging/media/usbvision/usbvision-i2c.c
@@ -32,7 +32,7 @@ MODULE_PARM_DESC(i2c_debug, "enable debug messages [i2c]"=
);
 #define PDEBUG(level, fmt, args...) { \
 		if (i2c_debug & (level)) \
 			printk(KERN_INFO KBUILD_MODNAME ":[%s:%d] " fmt, \
-				__func__, __LINE__ , ## args); \
+				__func__, __LINE__, ## args); \
 	}
=20
 static int usbvision_i2c_write(struct usb_usbvision *usbvision, unsigned c=
har addr, char *buf,
--=20
2.20.1


--yqjlajrqt7jpyhif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEpIrzAt4LvWLJmKjp471Q5AHeZ2oFAl72BuQACgkQ471Q5AHe
Z2pDagv+PATulRWVHbym5HqDKtCQ4CL05+yOdlD3xp6SzMjbBVhHVC20gEDf//cb
NDNUriJZSVyS16k/PEDmbMKC3wuuclKzLKwBBxGWQC4X9Y0jKEN9oO44gdFmSrED
GvqMLgfRiQSCiVqmkUeKiQxAedfA+Yx7gJpRI8t6HsKF1RaDvimq5iH2ru7BVx9K
TcZ5weEujvWVjsliZGO5+EEnX5Zlx2by2JpLHcsOzVFecCB9YqvYVFBXfLJOmW1H
9tVuPoIt2mme3lu5HEK71pUqjR/M/NoyobwoKpkC+zH4Cf/9nl72eEjbHzJoC3pX
o42J9+yeGVzWdywIH090qeeiTfcdb++hrFutlMFYJ5enB/pWO5zYRHF/0irompAW
y00L9i4RJR4ynHAQ1A3SWhzGlXxzOx+ntqfZ6cSiGaitChwvl4KjuskTfYcwZfW+
xL4Z8rzYFU7GQXzlK7TVOGGZ9wzveyFUhaUI8kftnwhOeJ/mry7vdu/fiqagQesK
00mlR7Aa
=DJTk
-----END PGP SIGNATURE-----

--yqjlajrqt7jpyhif--
