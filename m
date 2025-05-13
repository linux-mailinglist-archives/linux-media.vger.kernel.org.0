Return-Path: <linux-media+bounces-32385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4813AB555A
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74BD617791E
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 12:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D3B28EA67;
	Tue, 13 May 2025 12:55:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CBD283FFE
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 12:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140926; cv=none; b=pwgcHIO4cSvboR7gTQw4Mcl0/4yykjpi1AampBwmuwqnQlHSN28/Fah+gysWZJR4ObHmW1ghGFKdPI/NGvxrlBiPcNXhuI5VytqsAZMCIvQU+vRqqIopC2KIKQ1nepV0nkj48wO4sd4d5KlR1QxcDd8Kb+zWZvXZ6CKvXOwJzZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140926; c=relaxed/simple;
	bh=bjtSoHlKyIPfYQ3kgFHZDiVr1lMsX1bjP4ayC5i8mUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VljvzaBLxdolZU27lz6ug2oEORXXRvZ3jYShUHBXkf4h3uDIONqoGh4U/LXNQI5gRtDAsBZfbgEwWAOnvsVm5ucN8OAn4l47GTYXdrntg7RQPlnYJ0yTJbvCgWABGP2EmdNF3cRj0OCFTGui7bW+985ovIaYJHiJSwDXIjpdckg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1uEpAE-0007dK-FU; Tue, 13 May 2025 14:55:18 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1uEpAD-002Xcj-1t;
	Tue, 13 May 2025 14:55:18 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1uEpAD-002aPT-2v;
	Tue, 13 May 2025 14:55:17 +0200
Date: Tue, 13 May 2025 14:55:17 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Krzysztof Opasiak <krzysztof.opasiak@neat.no>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Greg KH <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	balbi@kernel.org, paul.elder@ideasonboard.com,
	kernel@pengutronix.de, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
Message-ID: <aCNBNbXceDz2xTCj@pengutronix.de>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
 <Y4xaXHLoiPupWM6V@kroah.com>
 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
 <2025051253-trimmer-displease-1dde@gregkh>
 <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
 <696f471b-c2d9-4733-9795-0fc31a48e6f8@neat.no>
 <2025051317-deflation-discuss-1201@gregkh>
 <e5cd5e9d64123b319bae1a73c96cd33a3ad9e805.camel@ndufresne.ca>
 <2efb125c-d8ef-468a-a7ea-afcb5b5bee44@neat.no>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hj5KqYndMTbzhG29"
Content-Disposition: inline
In-Reply-To: <2efb125c-d8ef-468a-a7ea-afcb5b5bee44@neat.no>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org


--hj5KqYndMTbzhG29
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg, Krzysztof and Nicolas,

On Tue, May 13, 2025 at 12:31:49PM +0200, Krzysztof Opasiak wrote:
>On 13.05.2025 12:04, Nicolas Dufresne wrote:
>>Hi Greg, Krzysztof,
>>
>>Le mardi 13 mai 2025 =E0 07:04 +0200, Greg KH a =E9crit=A0:
>>>On Mon, May 12, 2025 at 11:03:41PM +0200, Krzysztof Opasiak wrote:
>>>>On 12.05.2025 12:43, Krzysztof Opasiak wrote:
>>>>>On 12.05.2025 12:38, Greg KH wrote:
>>>>>>On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wrote:
>>>>>>>Hi Greg,
>>>>>>>
>>>>>>>On 4.12.2022 09:29, Greg KH wrote:
>>>>>>>>On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
>>>>>>>>>Hi Michael,
>>>>>>>>>
>>>>>>>>>On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
>>>>[...]
>>>>>>>
>>>>>>>Given that I'd like to suggest that it seems to actually make sense =
to
>>>>>>>revert this unless there are some ideas how to fix it.
>>>>>>
>>>>>>Sorry about this, can you submit a patch series that reverts the
>>>>>>offending commits?=A0 As it was years ago, I don't exactly know what =
you
>>>>>>are referring to anymore.
>>>>>>
>>>>>
>>>>>Sure! Will do.
>>>>>
>>>>
>>>>Would you prefer to have a set of actual reverts related to this:
>>>>
>>>>da692963df4e Revert "usb: gadget: uvc: add v4l2 enumeration api calls"
>>>>bca75df69aaf Revert "usb: gadget: uvc: add v4l2 try_format api call"
>>>>e56c767a6d3c Revert "usb: gadget: uvc: also use try_format in set_forma=
t"
>>>>20f275b86960 Revert "usb: gadget: uvc: fix try format returns on
>>>>uncompressed formats"
>>>>059d98f60c21 Revert "usb: gadget: uvc: Fix ERR_PTR dereference in
>>>>uvc_v4l2.c"
>>>>e6fd9b67414c Revert "usb: gadget: webcam: Make g_webcam loadable again"
>>>>
>>>>but have a negative consequence that the series isn't really bisectable=
 from
>>>>functional perspective. For example commit e6fd9b67414c breaks g_uvc un=
til
>>>>we apply da692963df4e so the series would have to go in as a whole.
>>>>
>>>>Or you would prefer a single commit that technically isn't a revert but=
 it
>>>>just "undoes" the negative consequences of "usb: gadget: uvc: add v4l2
>>>>enumeration api calls" (kind of a squash of all commits above)?
>>>
>>>Ideally we can bisect at all places in the tree, so it's odd that
>>>reverting patches would cause problems as when adding them all should
>>>have been ok for every commit, right?
>>>
>>>But if there are merge issues, or other problems, then yes, maybe just
>>>one big one is needed, your choice.
>>
>>Won't a plain revert break userspace like GStreamer that have depended on
>>that patch for years ? In such a delicate case, wouldn't it be less
>>damageable to introduce workaround, like alias ? This is one personal
>>script against numerous users of a generic framework implementation.
>
>Shouldn't GStreamer be robust enough to handle cases of old-kernel=20
>which haven't had this feature at all?
>
>The main reason why I reported this is not really the name limitation=20
>but the fact that this patch is just incorrect for cases where you=20
>would like to expose different formats at different speeds. This=20
>feature was there for years and we do have products that depend on it=20
>and this change along with the further commits that depend on it broke=20
>that support for us.
>
>You are absolutely right that those commits added a feature that now=20
>someone else may depend thus it would be perfect to fix it in a way=20
>that doesn't break anyone's userspace but the problem is that due to=20
>the way v4l2 API is designed I really don't see a way how we could=20
>make it "speed-aware" without breaking all the users. That's why we=20
>are kind of stuck between:
>
>1. Leave those commits in and then you cannot different streaming=20
>headers for different speeds but users of those API will keep working.
>
>2. Revert and bring back the feature of UVC ConfigFS interface that=20
>was there since its inception but break the users of "New API".
>
>>
>>I believe due to the delay, you are facing an unusual ABI breakage, which
>>requires a more delicate handling.
>
>Agree. The situation isn't simple as whatever we do would break some=20
>userspace... I'm not an expert on v4l2, so if anyone with a better=20
>knowledge of v4l2 internals has a suggestion how we could make this=20
>work with the existing API I'd be more than happy to try to follow=20
>that path.

As a shortcomming compromise I would suggest to support both worlds by
conditionally set uvc->header if the directory h was found. If the
uvc->header was not set then we could print some info and disable the
main part of the possible uvc callbacks that depend on this uvc->header
objects.

The only downside with that would be that using directory h in the
streaming header will implicitly create the limitations of not
indipendent formats per speed that Krzysztof mentioned.

The alternative would be to put more effort into this and parse all
directories in the streaming header subnode. However since the idea of
using the v4l2-api is already talked dead by a long discussion history,
I would rather focus on transition the remaining functionality of the
gstreamer uvcgadget plugin to finally become independent of the v4l2api.

How about that transition path?

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--hj5KqYndMTbzhG29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmgjQTIACgkQC+njFXoe
LGTf8g//ZSwnVMJrD1PFKr2ZZeq0THS3v9eIc3euhBU7mgXPOzpm7Eo0rkHQZHQB
DkIHUkcnhkNleqJjtaI/yTjDPtLQF3UUr8WDcL3z50OLzIT5w75SE27C8TiYJKPk
7ZkX/CJWMmdTiY2BXcJaiZY/CLN8eUb0PLKIIzpwPV0IN8IzuvMhZVY4+8s/ETrd
cAHA+jabMkM0+tDSvKvZW7UkqI44UEw0B2+KR/IIrFTxxprZVijtCke/F2sjkvdi
9rgpa7KewB8IF8uf8EB8sOeqZi8lea3+EkKp/73RIXQWpco8LLDvGEIQF8AE2uba
8VBVigiZvD1/V9tnvER/oXpAfL5VlNyBI0pGZsgcLsKtAhAgtpq7YIzzR8Oa9jYw
nHI4JCQVW2YkBZWfauVxLMBFj6WVuH30s0e+fgGLJ7Kh1eAsMZL0SsgQ3+W0+xjE
6w09Rc1RmXhGuZB3Tgq7dZFktO7Bn8PtwhSxTZ+6IRqFEEIrryA2gxtgwtaH9fJ6
8G2BxYwtfblO01EOzDuI7/9ETild8Fodv6AruMTr0Q7SueXyJ4PTX5cj3SSyWQy6
f1OduEkzB3xHQZQkI59kmSQQeEA8kd3x686Oaml7UHQ9EmBSUU+qli7+K7tflrh6
CVwNEowgOU4PTxhlkR5Uju9l/EXibryCt5hSTQdPMpYx+72oQvE=
=DMUs
-----END PGP SIGNATURE-----

--hj5KqYndMTbzhG29--

