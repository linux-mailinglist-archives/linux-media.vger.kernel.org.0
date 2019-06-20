Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5BB4CD0D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 13:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfFTLmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 07:42:52 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:56107 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbfFTLmw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 07:42:52 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id BD1FB100011;
        Thu, 20 Jun 2019 11:42:41 +0000 (UTC)
Date:   Thu, 20 Jun 2019 13:43:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 5/7] [media] marvell-ccic/mmp: add devicetree support
Message-ID: <20190620114355.hox5gsbp4ftlqupb@uno.localdomain>
References: <20190528090731.10341-1-lkundrak@v3.sk>
 <20190528090731.10341-6-lkundrak@v3.sk>
 <20190614103940.4dg43fo7dmbwnpfs@uno.localdomain>
 <20190620113511.rxoybnxm2exv2ibl@valkosipuli.retiisi.org.uk>
 <26d8ac51ff8c454a357028f267efd0d4cdd0ea84.camel@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f42e4j576t2san2o"
Content-Disposition: inline
In-Reply-To: <26d8ac51ff8c454a357028f267efd0d4cdd0ea84.camel@v3.sk>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--f42e4j576t2san2o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Lubomir, Sakari,

On Thu, Jun 20, 2019 at 01:37:53PM +0200, Lubomir Rintel wrote:
> On Thu, 2019-06-20 at 14:35 +0300, Sakari Ailus wrote:
> > Ping?
> >
> > Lubomir: I'm applying the set now, but please addres Jacopo's comment.
> > Thanks.
>
> Hi, I'm wondering if you could wait a couple of minutes?
>
> I've tested the patch set on my machine last night and I was about to
> submit the updated set just now.
>
> Alternatively, I can just address Jacopo's comment with a patch that
> applies on top of the set, but it would make slightly more sense if it
> came earlier.

Indeed, sorry for the late review. I also commented on patches which
are already in, so please consider if you would like to address issues
on top.

It's minor stuff though, nothing that seems a blocker to me.

Thanks
   j
>
> Thanks
> Lubo
>

--f42e4j576t2san2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0LcXsACgkQcjQGjxah
VjxvZQ/+MpS7DtPXinGO04kyb6BsAek2OCLz+P69cjCJ29gqWvSRlBVVlqQSGi3b
lO0ag/u+2BFVuO8G/tNhKcql6Rm/nVEel4lbUgRojIW6vURG7aS9dfly6bTSlL7O
JFKnyh+XD6n4zt46ed+LqGS9NWK98X1yY/EMS0rkTGxvKkbebNCQqmUATH9QCki5
RtkzDf2Sr//Nno5zKjQmRgjsu4UMIzgkmtmsaWIc4pyTZWdnUSlHsozGxrjRPFD0
BV85vuwywVNpvXvathYbAyAl6wgpZ68UnkGAFJYbX8GGrFNGt/axEBu86fLmRa/d
acQtSKeiKTXUdyGqsafvBjE9mcl0uTxKbMITvtOf0/wgAQesj0J/K2b3IJ68VrvL
hcnN4fIg9tlUeecAgaQ/Myyp+Sr+5OPNY6FoWMdY1GNBww9wyJPPCQSc8NA7UGET
CWuzPp1vrAsSnszOCuVm0xmxnvakEefhzuRshmFdt/JBJIvpwd/kiX83swDnmsFk
NQo82o3uiRqfyTYPxAvW4yDLf0TM5ICrDySUg3gPjWQ25j5BP9JwzWd0oZsVonOu
9rt06Q/EOzXlPSwRrPSYholBOue5ZGHWmyfUbD69F0f1JAaEXai2oXfdBbggKZo+
rFjoJ7UBJIFwGEadeXboLtAKIYR1f+wFHHqiy4SERRd2zyrYK3Y=
=t2Cv
-----END PGP SIGNATURE-----

--f42e4j576t2san2o--
