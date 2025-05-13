Return-Path: <linux-media+bounces-32390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A1AB562F
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 15:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA1081895F7E
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 13:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8F228E5E7;
	Tue, 13 May 2025 13:35:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E4628FA80
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143307; cv=none; b=pzLOtC2iH9NHW0GOhd5TqVvPBkAnLSaTSj1weCTSUbIGl4wBxMh54TsYDtlrXgS03b9QabpE2bK/Z+Px79z6mTVY3pw5tGh1DYuLnMAP9zyNbguy8OzQh8x3HEtjYxVuX+mPgCb1Mwarcj79iAC+UEJpNkSi09HQjyGNvawTrp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143307; c=relaxed/simple;
	bh=s6GW5Pvcduw6rnUJeBNVMo8uUk5Ykph08k3RJZ43SOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2PqLLY26R00pp0xYpHscwfuusq7JaYc3L6kl9JRlQp09QdXh9VZA0/rxM6KHz4hXb9bBFu9JmlVp7YbAqKnyHbahYNwv/mfZdrL53GQc7mSBIqOG9ogQtFMop0VTtnEk5B/868bIWKUKiaUY18UcKYpgRshg85sejb7X8olFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1uEpmf-00026v-Az; Tue, 13 May 2025 15:35:01 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1uEpme-002Y1Z-1k;
	Tue, 13 May 2025 15:35:00 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1uEpme-002bJv-2o;
	Tue, 13 May 2025 15:35:00 +0200
Date: Tue, 13 May 2025 15:35:00 +0200
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
Message-ID: <aCNKhGKducVhTLeA@pengutronix.de>
References: <Y4xaXHLoiPupWM6V@kroah.com>
 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
 <2025051253-trimmer-displease-1dde@gregkh>
 <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
 <696f471b-c2d9-4733-9795-0fc31a48e6f8@neat.no>
 <2025051317-deflation-discuss-1201@gregkh>
 <e5cd5e9d64123b319bae1a73c96cd33a3ad9e805.camel@ndufresne.ca>
 <2efb125c-d8ef-468a-a7ea-afcb5b5bee44@neat.no>
 <aCNBNbXceDz2xTCj@pengutronix.de>
 <d2fec157-c1dd-414e-8d9b-e7054c48564b@neat.no>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mKzi7A47K4kDo+y4"
Content-Disposition: inline
In-Reply-To: <d2fec157-c1dd-414e-8d9b-e7054c48564b@neat.no>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org


--mKzi7A47K4kDo+y4
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 03:07:07PM +0200, Krzysztof Opasiak wrote:
>On 13.05.2025 14:55, Michael Grzeschik wrote:
>>Hi Greg, Krzysztof and Nicolas,
>>
>>On Tue, May 13, 2025 at 12:31:49PM +0200, Krzysztof Opasiak wrote:
>>>On 13.05.2025 12:04, Nicolas Dufresne wrote:
>>>>Hi Greg, Krzysztof,
>>>>
>>>>Le mardi 13 mai 2025 =E0 07:04 +0200, Greg KH a =E9crit=A0:
>>>>>On Mon, May 12, 2025 at 11:03:41PM +0200, Krzysztof Opasiak wrote:
>>>>>>On 12.05.2025 12:43, Krzysztof Opasiak wrote:
>>>>>>>On 12.05.2025 12:38, Greg KH wrote:
>>>>>>>>On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wrote:
>>>>>>>>>Hi Greg,
>>>>>>>>>
>>>>>>>>>On 4.12.2022 09:29, Greg KH wrote:
>>>>>>>>>>On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
>>>>>>>>>>>Hi Michael,
>>>>>>>>>>>
>>>>>>>>>>>On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael=20
>>>>>>>>>>>Grzeschik wrote:
>>>>>>[...]
>>>>>>>>>
>>>>>>>>>Given that I'd like to suggest that it seems to=20
>>>>>>>>>actually make sense to
>>>>>>>>>revert this unless there are some ideas how to fix it.
>>>>>>>>
>>>>>>>>Sorry about this, can you submit a patch series that reverts the
>>>>>>>>offending commits?=A0 As it was years ago, I don't exactly=20
>>>>>>>>know what you
>>>>>>>>are referring to anymore.
>>>>>>>>
>>>>>>>
>>>>>>>Sure! Will do.
>>>>>>>
>>>>>>
>>>>>>Would you prefer to have a set of actual reverts related to this:
>>>>>>
>>>>>>da692963df4e Revert "usb: gadget: uvc: add v4l2 enumeration api calls"
>>>>>>bca75df69aaf Revert "usb: gadget: uvc: add v4l2 try_format api call"
>>>>>>e56c767a6d3c Revert "usb: gadget: uvc: also use try_format=20
>>>>>>in set_format"
>>>>>>20f275b86960 Revert "usb: gadget: uvc: fix try format returns on
>>>>>>uncompressed formats"
>>>>>>059d98f60c21 Revert "usb: gadget: uvc: Fix ERR_PTR dereference in
>>>>>>uvc_v4l2.c"
>>>>>>e6fd9b67414c Revert "usb: gadget: webcam: Make g_webcam=20
>>>>>>loadable again"
>>>>>>
>>>>>>but have a negative consequence that the series isn't really=20
>>>>>>bisectable from
>>>>>>functional perspective. For example commit e6fd9b67414c=20
>>>>>>breaks g_uvc until
>>>>>>we apply da692963df4e so the series would have to go in as a whole.
>>>>>>
>>>>>>Or you would prefer a single commit that technically isn't a=20
>>>>>>revert but it
>>>>>>just "undoes" the negative consequences of "usb: gadget: uvc: add v4l2
>>>>>>enumeration api calls" (kind of a squash of all commits above)?
>>>>>
>>>>>Ideally we can bisect at all places in the tree, so it's odd that
>>>>>reverting patches would cause problems as when adding them all should
>>>>>have been ok for every commit, right?
>>>>>
>>>>>But if there are merge issues, or other problems, then yes, maybe just
>>>>>one big one is needed, your choice.
>>>>
>>>>Won't a plain revert break userspace like GStreamer that have=20
>>>>depended on
>>>>that patch for years ? In such a delicate case, wouldn't it be less
>>>>damageable to introduce workaround, like alias ? This is one personal
>>>>script against numerous users of a generic framework implementation.
>>>
>>>Shouldn't GStreamer be robust enough to handle cases of old-kernel=20
>>>which haven't had this feature at all?
>>>
>>>The main reason why I reported this is not really the name=20
>>>limitation but the fact that this patch is just incorrect for=20
>>>cases where you would like to expose different formats at=20
>>>different speeds. This feature was there for years and we do have=20
>>>products that depend on it and this change along with the further=20
>>>commits that depend on it broke that support for us.
>>>
>>>You are absolutely right that those commits added a feature that=20
>>>now someone else may depend thus it would be perfect to fix it in=20
>>>a way that doesn't break anyone's userspace but the problem is=20
>>>that due to the way v4l2 API is designed I really don't see a way=20
>>>how we could make it "speed-aware" without breaking all the users.=20
>>>That's why we are kind of stuck between:
>>>
>>>1. Leave those commits in and then you cannot different streaming=20
>>>headers for different speeds but users of those API will keep=20
>>>working.
>>>
>>>2. Revert and bring back the feature of UVC ConfigFS interface=20
>>>that was there since its inception but break the users of "New=20
>>>API".
>>>
>>>>
>>>>I believe due to the delay, you are facing an unusual ABI=20
>>>>breakage, which
>>>>requires a more delicate handling.
>>>
>>>Agree. The situation isn't simple as whatever we do would break=20
>>>some userspace... I'm not an expert on v4l2, so if anyone with a=20
>>>better knowledge of v4l2 internals has a suggestion how we could=20
>>>make this work with the existing API I'd be more than happy to try=20
>>>to follow that path.
>>
>>As a shortcomming compromise I would suggest to support both worlds by
>>conditionally set uvc->header if the directory h was found. If the
>>uvc->header was not set then we could print some info and disable the
>>main part of the possible uvc callbacks that depend on this uvc->header
>>objects.
>>
>>The only downside with that would be that using directory h in the
>>streaming header will implicitly create the limitations of not
>>indipendent formats per speed that Krzysztof mentioned.
>>
>>The alternative would be to put more effort into this and parse all
>>directories in the streaming header subnode. However since the idea of
>>using the v4l2-api is already talked dead by a long discussion history,
>>I would rather focus on transition the remaining functionality of the
>>gstreamer uvcgadget plugin to finally become independent of the v4l2api.
>>
>>How about that transition path?
>>
>
>If I understood you correctly, you are proposing that if the header=20
>directories are named in a different way than h we would not set the=20
>uvc->header pointer and make all the v4l2 callback that are using it=20
>just return -ENOTSUP in this case? It would also mean that the=20
>uvc_v4l2_set_format() would need to somehow be broad back to the=20
>previous version which does not use -uvc_v4l2_try_format().

Yes.

>Although seems kind of hacky to change kernel behavior based on the=20
>directory name I think if we add this to the doc this could be an=20
>acceptable compromise that would make both scenarios work.=20
>Alternatively, instead of basing that on the directory name maybe a=20
>proper, named ConfigFS attribute somewhere inside UVC directory=20
>"gstreamer_support" or something else would be more explicit for the=20
>user?

This sounds even better. That way we would not depend on the hacky
directory behaviour. And documenting this attribute would be even less
shamefull.

That sounds like it all should work out.

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--mKzi7A47K4kDo+y4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmgjSn8ACgkQC+njFXoe
LGR/Eg//SpGzvyB750mmWfOVr19Aj9oQOpA1wNGz4vgQxOgFhBgus87HGHXaZblj
weRasV+ioIxNz+L6U1KN/GFtBtIWN8CF2+gShnlTx/yUJF9AceQpKWy5W+/ObCPu
3LBv6atA0LzzHLNXh7VeY0mpACeAZF54J0q0BTkfU6wKvDfVq2IImbYFn9QA3oMB
8ayVM8EYX1/CMwUQwHd0iPxKcQu27KyPTbSl1w98z+LpbpckeC/+P8ZpaNGwWPy2
bIsOlPb/WBoTCmwenfVB+BjExY/EQ2bZDuVxron5DlLHRQeYGnJpb0uzg4Ks2DEI
YtcnurTCC9h0i+CZymsNvUQyjEXgzXIAsFn8InvCOsgGGbmAeDat1AR1Mo6nSU8j
nxACOZ1/mCNKHZiGXekzJcvbVjKI9QEpbgH4AI897WP2CPjWLtoLqNvQtUaAPnII
hOGe+IQgXXaW85vFnKuAZfWxcLWpHnf0g1dKOHJ1ZUC3zNIQt1qm/S45SMpjcW3D
k7RcVSvrGXetKflEUwYbrn1zCQPf77VJTV+izOYZaTBIrbi5133RDqg4gJJOg+Hk
gWZPiKL5B7ra4+ZYk2TJeS0cnD/D4LS79wu8uBtKP000vgqlwNjDbbQ3dsBZSZlu
smKjmlsHNf0Z2xf0bbHTboTCqRTmG0fkRAoBAlvTJPVdknIIFtA=
=DN2u
-----END PGP SIGNATURE-----

--mKzi7A47K4kDo+y4--

