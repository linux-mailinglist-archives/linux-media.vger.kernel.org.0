Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C4B5F2635
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 00:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiJBWvT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Oct 2022 18:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiJBWui (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Oct 2022 18:50:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD631570F
        for <linux-media@vger.kernel.org>; Sun,  2 Oct 2022 15:50:16 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1of7mU-0001iX-2T; Mon, 03 Oct 2022 00:49:54 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1of7mT-0001rl-Ql; Mon, 03 Oct 2022 00:49:53 +0200
Date:   Mon, 3 Oct 2022 00:49:53 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, kernel@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2] usb: gadget: uvc: don't put item still in use
Message-ID: <20221002224953.GC19990@pengutronix.de>
References: <YzbZ62gq3i4n7Vhx@kroah.com>
 <20220930122839.1747279-1-m.grzeschik@pengutronix.de>
 <YzcWompDLd7iIip+@pendragon.ideasonboard.com>
 <20220930204449.GA19990@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline
In-Reply-To: <20220930204449.GA19990@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Sep 30, 2022 at 10:44:49PM +0200, Michael Grzeschik wrote:
>On Fri, Sep 30, 2022 at 07:17:38PM +0300, Laurent Pinchart wrote:
>>On Fri, Sep 30, 2022 at 02:28:39PM +0200, Michael Grzeschik wrote:
>>>With the patch "588b9e85609b (usb: gadget: uvc: add v4l2 enumeration api
>>>calls)" the driver is keeping a list of configfs entries currently
>>>configured. The list is used in uvc_v4l2 on runtime.
>>
>>s/on runtime/at runtime/
>>
>>>The driver now is giving back the list item just after it was referenced
>>>with config_item_put. It also calls config_item_put on uvc_free, which
>>>is the only and right place to give back the reference. This patch fixes
>>>the issue by removing the extra config_item_put in uvc_alloc.
>>>
>>>Fixes: 588b9e85609b (usb: gadget: uvc: add v4l2 enumeration api calls)
>>
>>I still don't like this much :-( As shown by this fix, the additional
>>complexity that it incurs on the kernel side can cause bugs, and the
>>gain for userspace is quite minimal in my opinion, as parsing configfs
>>(or obtaining that information out-of-band through other means) will
>>still be needed anyway to handle controls properly (I think we have
>>agreed that userspace needs to handle the UVC requests in any case).
>
>I understand your objections regarding the out-of-band configfs data.
>While implementing the parser in the gstreamer uvcsink element I just
>stumbled over this. It still needs to parse configfs just for
>bInteraceNumber of the config and streaming interfaces. So actually with
>the parser in the kernel, this was no issue, since this information is
>already present there. I am more and more overthinking my latest
>conviction of moving the whole parsing code to userspace.
>
>Although, I understand that an partial parsing of the events in the
>kernel for the format negotiaton is not ideal, the kernel parser is
>still an valid option.
>
>In our other discussion I mentioned a proper uvc-events API where the
>kernel is already preparsing the gadget messages and creates events with
>well defined event types. The userspace could then just run an simple
>select over the event types and decide what to do.

I looked into the v4l2_events and its subscription options. Since the
UVC spec for class events only distinguishes requests for the control or
the streaming interface, we could stuff this information in the
v4l2_event.id field .

The kernel would only need to preparse the setup events and check for
wIndex of the ctrl message and set the v4l2_events id accordingly.

This id could always be fixed numbers like streaming (1) and control (0).
The userspace then would not need to parse the configfs for the
interface numbers anymore.

Since the uvc gadget is using private v4l2_event types anyway, using the
id field would make sense in my opinion.

Does this sound sane?

Thanks
Michael


--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmM6FY4ACgkQC+njFXoe
LGRF2A//WMxbsk5ZxScpwKESaWjJ3VUv5kXKDMLX7VBAUeNECKTVJ/YZ5Lq3oxyF
7XNXNdLqMYgD/Nlh5RsBRAXzeJy1GSOc8hGBlDq3hliRBDUVCCgEJWvEdRELzZ3M
hw24gOri633QDGQZnvDo8ATpA3fNHi2zxRZkIIg2ERk2jcaQ2rCaOaVWdiRpCFm0
eUDBpNNFCFe0mP2DfqYYDkWdcjv4Dw6OOFYA0A/wlqEOQPw5wWujvNVufUrBCqzp
+SDdgzv9eg5m7xP5lyR0s4DQLmuyXgaPLtDpcErWUqx/Fhhm+nuvFm/6/eUoETBP
UCAf7XtVqMdjGtto+il0bjStDDY3+1GFdvkqnP1S+TC9MSRy5HHq+7v1yAU8GcSJ
NeyVT/Vx0sItXg4a7lSk5MFUwekUIKtJA0GMM0rc51eFMUqvfZxMnCLRLkciR0w5
syW1A31x8soHwmbTFdgalCVTqqsm2RF9f9yZb7xBpsKr/7+t1PnJVSCDl54VIYcM
Dbz6SNmCGqSV6drYJI75osjQ9R1unhj5pqB4aF/3B/svOLVNPpjExm5uh4HWt0v0
MzGaYimY3Wl0L4ARwJdB+F8aYRFMr+kWjbmD9DlVSGK0gT8pBnS9mZqxQhqn6KlG
jXQRX+wBf7LcIaXciNtxA3DBGXGlVBvTgB4kitFTNC5FqOI4T/Q=
=MYom
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
