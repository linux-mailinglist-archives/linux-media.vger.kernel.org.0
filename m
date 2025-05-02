Return-Path: <linux-media+bounces-31552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F69AA6C5F
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C46C7B2003
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 08:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8C01519A0;
	Fri,  2 May 2025 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="Q25aoVHX"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4C8828
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173747; cv=none; b=vDhyH4lBjmYFOfsfyUSfBWQeVcHoSBcD/nNFgwiOZCB4VjZ+Z1YByV0VW13vfwmCY7QAAGCwW1T6i9ivjJ41LGRlzKSrrVZUFb51YHAak1X5N7c9AmDjZhK4ioe7vuCMtJsxmbp2BHPbc4I9Spjy52G+kW45jEfMDkJVOaOL8Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173747; c=relaxed/simple;
	bh=maP0RyjIfj27hlG+FZYguD1Iqtj2Xyh9Yi0v8wvzgQg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=P1gIk0P/llMIRyVnk3kZWPquFL3+wnDgtEPR9kQay+DeQH8S7G1j6T3MihZmQd/mkMEuNfnx+neHDkmT1Y4rTupiRwha9y/Olt9uO1lqSPiEOrqB2stNtr72q7Ld9AektDe2xfGYPnFKE/CCjrUJNhnSLHIrSfA50j5/XcHVUFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=Q25aoVHX; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4ZpkJ201pFzj6r;
	Fri,  2 May 2025 08:15:30 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4ZpkHz5FSlz7T;
	Fri,  2 May 2025 08:15:27 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=Q25aoVHX;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1746173728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=tHkYqz2YBjG6wEhK3hT5viHS6rS3e3eUoMqBIDylR/o=;
	b=Q25aoVHXjfc0cb1r1NGwzzlDotPBxwwiEKy09rgu37lGWuSpb0CPBquayHI7NXJKuvc9uK
	GNW5TUQY7NFAdwzHg15rBu3zGI8VEZxC+T+J3Y128Ctt+BAz/cOKvm2I6/MbbsvglJn/jR
	jA9jgDjEUa3a8JYWSbA57k2bIzn80KaEiM9RjCdtNkgGv1GJjutTkaNn9bKxQov1dIY3fJ
	W2VFVVcwX5+jJHbmEyLTIsj1b0/1NvtZxRq3lJjwyve6PTxOugduPEUrvW8U6GSkSgHZE5
	MG0ev5YRBNHeA4SD+8uEmvgwPjuC//DVxk70ghi6V7Gbcv37Bsxbey9RzML+PA==
X-CM-Envelope: MS4xfPV5UW9y65lJgP0iT3+kV9+hTkQqA16HoZwoKJcZVtKXCGoaQPWrqvR7gszNex0dfXt8CNagtLxP9ywcEIGMycwITGQnx4bZst//iYH1z8o/60lKAJ6X ftUMQMChqbV5rSo3QBm5ofQzG+EPK2yIMHe2U31drZPgxuT8E7/Ap9e97/T//d246ZWnIKDCJuNvdA1ISzunamgjj8dW8qik/NScOqIiEZ62C4oIiVad0m4O lylSI9iERGcV39guWlfJrh3q2njBTlVhdK1v9jtYjM1ox2Efa4bhqdZXVY58hwTH0h0niGg7RvH6nnBmh2cjywHAyZnefMEyi1TRvNMyO/UHGLWoCESn34fV WJ63p4zTjLrCdRzioT0gfPfxSVBLkBIS6pXIyPVF7kqL9yGUIhSVnEwCUp6GumtA2ah7dd5ZjUBrDS6NG4ZV/tC9WccEAJkv85C+ZP49Hi1863NFu+75k/Rj l9IAJk6+HS9PSplq1KsKe+O6nUsLIoq6gi9mSqZLbU5+OUgRWfHGFrMEP4dxZls+kzBRA71sqZGM5Bk9FzYOSYjK38zY6cXiSqbKEzHrv2XjAG45jNE+qaME NhmoSGzSd//2IhCOYsyMOGFLDawiUci3KHJBB6zOz84gw3Od3GYMhX9g6YKQUE4kiXOJmb3wOF4TrBTuqY03jdAR6gy1rQhN9oIixoBYhjUZj8hlSpPK/okQ pfDtu7ryXXSJMvghNTZQtqqbMewsW8eWaObBWUBZbB7jB1eCFQ0rDVDNSUUBSm6o4m4MNr/OArJ0vb87u/TpND9BGQOxTup96dTaIHRtu9oObLHaDR806WJ6 TH6AI9jII61XC0E7SqbfLUIQ82cgtfseilOAH5pRpmhfE/CFOLAqBOjObKk+ENFXGivQkH1FLTf+FoHYlUSHFd1OzgezBivfvYQjskAzp8yG+soMCzyPGuF1 UwQM2+jV5QrWdoK
 bPu+2G/uXNc4TxXwZrLLJrnPed99KqvZ395AHi2gBGeCqQFlR2VZOjQQLWBs+wGQ97TtIKlXk38RCTLyd3JAdWUKZde7vBVugo5QRkRJg EwGCo16t05JeF5I8nlC3ZAx9vURyK+icbGuaQp46yb3gMsj+6OY5RFaYYJlPHGE2WCue1TuDvL+FcbiM8R1LfuiRng6GXujWLu30cbiCiEmP3L1ngLH5AdJN fPpxlR/kdEfhDznYnlhgkVdc6DyH8NAYY0nJhsRRorN1EhI9gK3k38siCEaH2gAq0+VvZ9a87pR9Hiprzp+6TxL8EyLDwFeGKnb1PE08rBwkNJ2GX/I0APFM sBiZ2sRRX69U2RgMYxCYKsZfzk1jErFY//HhDcr+6Nvd55jfRqQ=
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=68147f20 a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=8s3bVdB6AAAA:8 a=smFrE9sGAAAA:8 a=VwnfekaSAAAA:8 a=xOd6jRPJAAAA:8 a=WN6_cwnCAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=20KFwNOVAAAA:8 a=P1BnusSwAAAA:8 a=8b9GpE9nAAAA:8 a=cm27Pg_UAAAA:8 a=RF00TdSWAAAA:8 a=sozttTNsAAAA:8 a=dML_XACEAAAA:8 a=mK_AVkanAAAA:8 a=PssDBZGIAAAA:8 a=8AirrxEcAAAA:8 a=N7ie1MMDyZOTvO5XP-kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mX_46NTfp5VFrLZRzBmZ:22 a=F_EvON2TorMte8AU-hMi:22 a=eAomlcYGng2R2mZ923rV:22 a=ndfOWLLM0rR49n6Yv1rF:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=D0XLA9XvdZm18NrgonBM:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=_nx8FpPT0le-2JWwMI5O:22 a=L0fzO-P85HkJbeZJe4ir:22 a=3gWm3jAn84ENXaBijsEo:22 a=HJRSn2hXXqGixlvEXVkw:22 a=ST-jHhOKWsTCqRlWije3:22
Message-ID: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
Date: Fri, 2 May 2025 10:15:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hans Verkuil <hans@jjverkuil.nl>
Subject: [ANN] Media Summit May 13th: Draft Agenda (v4)
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede
 <hdegoede@redhat.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSBIYW5zIFZlcmt1
 aWwgPGhhbnNAamp2ZXJrdWlsLm5sPsLBlAQTAQoAPhYhBAUs3nvCFQU7aJ8byr0tYUhmFDtM
 BQJoBTEAAhsDBQkX+5V7BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEL0tYUhmFDtMb8EQ
 AK6Ecb5mGBanCa0R+J/WkWxGVsgqsaTjNU6nS5sl9lkiY64Tad6nF8RNO9YKRyfuokm2pxAD
 a91Tk92DFstszKGwiisEG7PQ3zXHEJTqxIosy9ueLbHTOvB4CnWVChcvaBWZ2uilyKFsWNTq
 mbDQf3/0UC3LxbEvGsYNU1Q6Pz+h+Pdv7GgdOJhYGKSLCpQyPYOyaU9tenHDKx6aNedNG4ZI
 2OAM18nDfKrEplSjDF9E9Ras65/n9iWQfGoUdxSlGrxM/t3EVgi1FXEq14FaCi6HhvreBZuw
 3NTHg4Za6bqnYsZnbyHY36bgnxi2YJYxKlh+IMT/TpfEh8nf2nnJTgs3bsNIVVaaYxJtl4w/
 Y48gKt6YzcWsHR6l0CSMQhZXQqp/Ljpi+/xtE6JJ/tJnG9Wyi3+hA11GFQ50uciXTpp9/w8s
 fScrv8qrfRiUsd+zfd0MC6EJmHSlW7qSVQjEauWDsdCFmsER8y/ab3DQb5uhrsyuooB+V7uj
 476vUbH/fM3KMrvh8HOTUBoAE/Mf82/bMlrduuU5PkbO+3/PcUR0WFUSK2yRK32GX/Tt2tD+
 YJq0RnyR8UeYslVLzyehrt8Cgc9KgHa8VUi/vkSTenjieYJYxgrd+oTYXB38gKlADnhw+zyp
 CsqeGGZu+SS2qrPUyUkeruRX7kC2tQ6gNoYpzsFNBFQ84W0BEADcy4iOoB5CIQUCnkGmLKdk
 kqhfXPvvSzsucep20OLNF96EymjBnwWboipJFOjZxwkmtAM+UnEVi2kRrtT844HFcM5eTrA2
 sEdQbThv16D0TQdt+dT0afvlvE1qNr4mGGNLiRyhRzC/pLvatD/jZHU8xRiSz/oZ+8dEUwzG
 4Skxztx9sSc+U1zRPc0ybiHxgM90oQ6Yo782InmN99Ac2WH6YLwpZQ1TOROF4HxeBfzfdMFi
 rudHzANNbn8LvvfRhMExVRtms+U/Ul3e730oEUpM18u4XJ8Y+CITnzOk7POfwYzHiKXqskw3
 bLnrQYF/QzDFsTFpewS3ojMzBq35CeLb5aH9LFY7q14m04m2cn8hkdq4nIPIk2x8hWgM19rh
 VaGWj8a6e7nQ30PerH89IXrBfWYvHezZzZzGG1JlLWktPNy/5dhAyrwiJIUo3ePFxfmjvFYa
 wn211qRkWi3GP4MYtk10WBvcQmuzyDYM/Usjt+LC+k3hT0mZ+Gz0FeTtY/OQ4+IwXnAdZM9m
 q88JVlijGVG0dOB03gLrr2LwihDJ31twAc3aJ4e9EHaiW6UBnwBdqeP4ghEylrqnn4jmJ6Uf
 D6qEANQ2L97e8vQyDeScP/Do+cDnhMm8Or0zAdK658fiWl78Xh0pRcx4g+opfwoQw5CfSf3o
 wh1ECJeNMC0g0QARAQABwsF8BBgBCgAmAhsMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wFAmaU
 3McFCRf7ldoACgkQvS1hSGYUO0zJTw//aaYKzeGfYF7WvSHUvGvtBO5Y/3XNC5xfU+jDKmlA
 vghX304jqDQ5314fLH7Kk4wE+dE7FaXZR+mMj5W1ORUfGwvMJ7ayemUVg3RyYggy6jQP5Rlb
 SCj9WFvHwNNbYTHFVMkAnVVKpwcjCYiUA82WK1/hP2ClE4dkS+WHtH6ABhO0hs32WoCNAzmT
 fdsOfXtSYN8wYWF0CI8wW4RiMu7rAX7xPPNhnVGz9vWyn06XDipCSIDuivsPNg/9XeUzjUg9
 eOvlMkphJ42MRyPJAWGmSeLm8mKwxoF094yAT6vIvYmT9yUnmf9BfVCJV+CnjEhvMpoAkUqi
 9cvaZfUdnsAnqQmoRJE0+yInhlMyWc+3xlGsa0snsTxNfqjaLH61CLt8oUQOgCI4cD4rJWks
 A8SyOqlgxEHnljUGmFEhCBUOV5GcXf1TfCXjMBiAKtex5cpvic4wZIJJtS1fS18PQ/DEC3vL
 UnhF1/AWSHp+sv8vlNgnncxLDCho8uVjZrn4jzswd6ticBUAsPAKDYnO7KDzfQlQhIHdq10v
 jlGW/FbxA1UUiuWH+/Ub3qh75oQHTTlYe9H+Qr8Ef231/xItks8c+OyoWV6Z9ZcZnHbOmy2I
 0wGRdGp8puOL7LzhLkIN66sY/+x4s+ANxyJK6U1nJVeq7tbbhqf2Se2mPG3b87T9ik8=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham

Hi all,

Here is my v4 of the draft (close to final) agenda for the media summit.

Changes since v3: added more attendees, added a new topic (cgroups) from Maxime.
Please note that I slightly reduced the length of some of the topics since we
have a packed agenda. Please let me know if you think you need more (or less!)
time then I put you down for in the agenda. My experience is that it tends to
average out (some topics take more time than expected, some less), but a good
estimate helps. I also updated the lunch information.

One important notice: it turned out that the meeting room does not actually have
dedicated video conference equipment. I'm trying to figure out a solution for this,
but for those that registered for remote attendance, be aware that it might not
work out or be of poor quality. I hope to have more information for you next week.

We have 18 in-person attendees, which is in line with previous summits, even though
the time since the last summit is less than usual and we are co-located with a
different conference. It's good to know that those changes didn't impact the turn-out.

Please note that I am transitioning from my old hverkuil@xs4all.nl email to
my new hans@jjverkuil.nl email. If you have problems replying to that new email,
please let me know and just send it to the old email (that won't go away).

The Media Summit will be held Tuesday May 13th to coincide with
the Embedded Recipes Conference in Nice, France:

https://embedded-recipes.org/2025/

Note that there are also some workshops held after this conference:

https://embedded-recipes.org/2025/workshops/

And a gStreamer hackfest:

https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366

The Media Summit will be held at Hotel Campanile:

https://nice-aeroport.campanile.com/en-us/

It is close to the Airport and to the Embedded Recipes venue.

The meeting room is sponsored by Collabora and Cisco Systems Norway.
The lunch is sponsored by Ideas on Board. Many thanks to our sponsors
for making this Media Summit possible!

We have the following confirmed in-person attendees:

Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
Benjamin Gaignard <benjamin.gaignard@collabora.com> (Collabora)
Hans de Goede <hdegoede@redhat.com> (Red Hat)
Stefan Klug <stefan.klug@ideasonboard.com> (Ideas on Board)
Paul Kocialkowski <paulk@sys-base.io> (sys-base)
Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas on Board)
Benjamin Mugnier <benjamin.mugnier@foss.st.com> (STMicroelectronics)
Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
Ricardo Ribalda <ribalda@chromium.org> (Google)
Maxime Ripard <mripard@redhat.com> (Red Hat)
Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas on Board)
Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)

And the following remote participants:

Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)

Note: information on how to connect remotely will come later. See also the notice
at the top of this email.

If any information above is incorrect, or if I missed someone, then please let me know asap.

Agenda:

9:00-9:30: Get settled :-)

9:30-9:40: Hans Verkuil: Quick introduction

9:40-10:25: Paul Kocialkowski: Stateless video encoding uAPI

10:25-11:15: Jai Luthra: Per-stream V4L2 controls

11:15-11:30: break

11:30-12:15: Sakari Ailus: Identifying camera modules

12:15-13:30: Lunch at L'Azur Bistrot Niçois

13:30-14:00: Laurent Pinchart: Review of the status of staging drivers

14:00-14:50: Hans de Goede: Discuss V4L2 subdev API ambiguities

14:50-15:10: Jacopo Mondi: Unify the multi-context support with the m2m context handling

15:10-15:25: break

15:25-15:50: Maxime Ripard: V4L2 & cgroups memory accounting

15:50-16:35: Ricardo Ribalda: Openness Framework for ISPs

16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers

Please reply with corrections, questions, etc. to the agenda.

Regards,

	Hans

