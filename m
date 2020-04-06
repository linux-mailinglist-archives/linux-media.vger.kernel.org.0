Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C4119F0E2
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 09:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgDFHiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 03:38:10 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38594 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgDFHiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 03:38:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id l11so3535383lfc.5;
        Mon, 06 Apr 2020 00:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=y/vsYsSK347NGcDbBlGxiDR9TuwfcgK2h148wOGntc4=;
        b=XVFFvRbAinJ+BEsDnYgB57PWfp/Zf34UTwGrxCy+CdkaFTalmpdRS0+g4zeQ+OmwgT
         NEbliAskkDuy5dwWijf2RLOxFzD6ehO71UcWeNzdAyOFj/9nvi87ZY+UkIAdBBVjFsxY
         28H3pHsbVySs6m5BIa51U6z9aEMmTtp1uj3TAOsIAY4Zqh1mzS8Ra7yvBol4EnCAJM1s
         TQJWMsXiryOI/xmDyiyxQcH4FUmw/nt9uTyngk0hzawq1QlU5crlder39jaJc/Qp9+6o
         9ecgPZh9uMNUuzxJIfzdWv/q2YVmzYEZyuiGVf6Gv49B9JKBpZjM7Asp5HcTcURFbLK9
         IKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=y/vsYsSK347NGcDbBlGxiDR9TuwfcgK2h148wOGntc4=;
        b=BBHtnEE8S1WRl+7YvCBaKcEENL2oGUGfZsVl1MuTJFbfX3d4Jia3h8Fy/loFZtGcor
         V3yMk2aIH569B1LtxK4bcwlF+9xdLpyrpphqEE0t5Muukmm1KsqRSQL/JhDLV4KEhiyF
         dsPFhc2OyqE/FQtew/LvOMYjDiUft+tx1dXtQn/vETLiJRKiJMfz/s0pLySvUmF40zx5
         z9XaBG5jFIpI1bR7J3pCajNIsdIxsiEc/vlsSx20M+VEARWL3dVXj+3BqdoTTEHqCGrQ
         RqHFOS9O89yzJl8N0cbLg8d4OiJweVsIQNLAKqHOG/QN3ObViyE/wCYMvgMijAbWQb62
         a18A==
X-Gm-Message-State: AGi0Pub1yaOqBAmELUZdxjTBKneoRGm3aD1fNeI3SErY30uvxG9D6zmc
        vjbOK+ccolfOxUGdZWBZC4M=
X-Google-Smtp-Source: APiQypKmxIdXHjYcrf9rWedfxk/q8eOWs3j3tEDFVxuTYOnVr8JpxLKWuqGbNLAiGXMLO9cTmrq+Rw==
X-Received: by 2002:a19:ef0e:: with SMTP id n14mr12220596lfh.61.1586158688577;
        Mon, 06 Apr 2020 00:38:08 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id r206sm3703618lff.65.2020.04.06.00.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 00:38:08 -0700 (PDT)
Date:   Mon, 6 Apr 2020 10:37:58 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        laurent.pinchart@ideasonboard.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Message-ID: <20200406103758.1be49f78@eldfell.localdomain>
In-Reply-To: <20200401151332.GU1922688@smile.fi.intel.com>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
        <080ddddf-717e-61dc-8522-fbdbe52da94a@xs4all.nl>
        <20200401151332.GU1922688@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DiWGmGA9BuE3BQZbAQv63qz"; protocol="application/pgp-signature"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/DiWGmGA9BuE3BQZbAQv63qz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Apr 2020 18:13:32 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, Apr 01, 2020 at 04:13:51PM +0200, Hans Verkuil wrote:
> > On 4/1/20 4:05 PM, Sakari Ailus wrote: =20
> > > Add a printk modifier %ppf (for pixel format) for printing V4L2 and D=
RM
> > > pixel formats denoted by 4ccs. The 4cc encoding is the same for both =
so
> > > the same implementation can be used. =20
>=20
> %p4cc ?
>=20

> Another possibility
>=20
> 	u8 ch[8];
>=20
> 	if (*fourcc & BIT(31)) {
> 		put_unaligned_be32(tmp, &ch[0]);
> 		strcpy(&ch[4], "-BE");
> 	} else {
> 		put_unaligned_le32(tmp, &ch[0]);
> 		strcpy(&ch[4], "-LE");
> 	}
> 	return string(buf, end, &ch[0], spec);
>=20

Hi,

mind, if I guess right what that code does, I think this would confuse
the fourcc code endianness and the pixel data endianness. I think fourcc
codes are always crafted machine-endian, regardless of how the pixel
data is. At least, that is what drm_fourcc.h seems to be doing with
fourcc_code(). That has nothing to do with DRM_FORMAT_BIG_ENDIAN which
refers to the pixel data.


Thanks,
pq

--Sig_/DiWGmGA9BuE3BQZbAQv63qz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6K3FcACgkQI1/ltBGq
qqcp8A/+MFQ/BvUrgpGrroUNyMx5PPIdWVMcfUFCr9qFTvHtgEGi27qifT7TYdgK
91dOR+rQKOE4Dhx7/3NPtr+qq8LSI2/zV199rrbCFhiCsqRLQLQwNDUF9oPqRXDh
FRQXaniCSLU6ROYj5xxVA0SYYB5SxrP7k5H6fHnzodu83HQg/yWmUrHoWLZscdap
Vj09jcfbCzICbwet9l+1fXfR1BNQPp9FQQxfclCQWDyeLDhMmYUcXT+7bayUlzLs
lAeO6gIZBjafsipFnf7sb6viVRVa7lmzhnzLuqoSaCdWoYfmyBCrP+sUYDZbkv7K
mEKeulPbDldxaWl11h6yJvVZusRoX4XM5xLl1JzVG5yTmqsU/oSjt11guMG5Z/0t
/Ipfu1TK4F7/dD2A03+DX2PnRgFtK0L9xVSmAhxj3Z1qwvo9Myvjqkbu+cHu0q1N
TUYT8ILBVmhgYKk3BqM1YYQo4OMmOglzDxnxWlnSPXxdEo1zaH8p3VaCxBPJQob4
XIurW+oIJwKHepmOt34RLbOaIAr4ypfaw4vtUmOLLSiTO8RkeFpeWQpiMqA4gRLq
bJuD2UJzykFx1uwsKwLmE18eT32q14R0JSkQP8WXj9BioAcOE6gct+RltRngK+gL
2G94ro4TnIBTJihF1srsE2EqE/m/wd6wdNM3GaYAAmJSOkj0Q5I=
=8lW6
-----END PGP SIGNATURE-----

--Sig_/DiWGmGA9BuE3BQZbAQv63qz--
