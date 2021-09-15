Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2178C40C898
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 17:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238230AbhIOPo6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 11:44:58 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:51264 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238223AbhIOPoy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 11:44:54 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id QVRgm1nLQps7PQX4QmLWfg; Wed, 15 Sep 2021 15:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631720614; bh=VBVC5n/QOFyzh1m0U/Zb6nGMIoLQzM11KZKnMii5fww=;
        h=Date:Subject:From:To:CC:References:In-Reply-To;
        b=hVZ5L9UW8jqYHjJ3nC5VdEKYUo2azS2faD4NBVh1Gtl77D+IkZ98+O/wa9nQR61DM
         jUT/M89ikpao6CPTWgpxz4oFqiTNEAVE3YzZAo7EUYnB2clx0p95yFOvREOzTm4+c2
         v7nqCRoyjce+50qhh22jjXHNbmIhKljtv6E60OXKKUi4G7W0K4PmJigsvEJQ1et/Rc
         4AVb8bVhskdKcsg2O/a+kHx7HBoxCF9hFVIpfmPk+waHQg7I5oH1uHwDcJ6rdOIF3y
         xBEtiel/O0gMhPcFp4Ar2jNpOxo9HR9n4EKc0a7rlEbeIQtp8CYU8js/Isge2YVbtY
         ZZUoEiUJovHXw==
Received: from [192.168.0.100] ([70.71.78.228])
        by cmsmtp with ESMTPA
        id QX4PmJoP5dCHGQX4QmNsJe; Wed, 15 Sep 2021 15:43:34 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=614214a6
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=IkcTkHD0fZMA:10 a=xOd6jRPJAAAA:8 a=_Dj-zB-qAAAA:8 a=08P_in6lx3LxqG_UJJIA:9
 a=QEXdDO2ut3YA:10 a=p2IOnBAzwV8vXciPbnnL:22 a=c-cOe7UV8MviEfHuAVEQ:22
User-Agent: Microsoft-MacOutlook/16.52.21080801
Date:   Wed, 15 Sep 2021 08:43:30 -0700
Subject: Re: [PATCH 07/11] edid-decode: always linefeed after hex_block
From:   Joe van Tunen <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Message-ID: <F9B610CB-8B8D-4D68-B7AB-7BABF52BBDA3@shaw.ca>
Thread-Topic: [PATCH 07/11] edid-decode: always linefeed after hex_block
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-8-joevt@shaw.ca>
 <2025be72-7f3e-b63d-51c4-33a9720f65fe@xs4all.nl>
In-Reply-To: <2025be72-7f3e-b63d-51c4-33a9720f65fe@xs4all.nl>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-CMAE-Envelope: MS4xfAK1F1MPH4QE4Nl653UzgJhJIO4b5ellrEbOA0oFtvOHLBHgxKWgKR+ZF+M8Olz8fOrBIJ6Ld2lL2zQSSP0urVN71fYTzypBgvD5Vm/C7WVTzPlczoZP
 an2p0iIEVZAaFPdnp0iWMdf/Sf6kpP/gG7QruboomBiVDmR+tqSKvJ3ULjH3DLSaK3e9tMzWzYEASwQY9KgT2EhcvRleEwc/B2wN2tcfMyyqWYvSWEjyx4Qw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Yes, that's ugly. I will do a search for the EDID that prompted me to make =
this change. Maybe it's not a problem anymore.
...
Seems like the problem I had was fixed in cta_hdr10plus. I'll do more check=
ing and testing with other calls to hex_block.


=EF=BB=BFOn 2021-09-15, 3:10 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:

    On 14/09/2021 14:11, joevt wrote:
    > hex_block should not return without printing a newline (which occurs =
when the length is zero). This causes a missing newline after "Application V=
ersion: 1" with cta_hdr10plus for an EDID I have.
    > Any place that calls hex_block will have the same problem if it's pos=
sible for the length to be zero.
    >=20
    > In other words, a hex_block needs to have a linefeed even if it has z=
ero length, because the caller assumes it will go to the next line as it doe=
s when the hex block is not zero length.
    >=20
    > Signed-off-by: Joe van Tunen <joevt@shaw.ca>
    > ---
    >  edid-decode.cpp | 4 +++-
    >  1 file changed, 3 insertions(+), 1 deletion(-)
    >=20
    > diff --git a/edid-decode.cpp b/edid-decode.cpp
    > index 2316abc..6aa93fb 100644
    > --- a/edid-decode.cpp
    > +++ b/edid-decode.cpp
    > @@ -698,8 +698,10 @@ void hex_block(const char *prefix, const unsigne=
d char *x,
    >  {
    >  	unsigned i, j;
    > =20
    > -	if (!length)
    > +	if (!length) {
    > +		printf("\n");
    >  		return;
    > +	}

    Hmm, with this change I get this:

    edid-decode -c Digital/Acer/ACR0282/B12D637C1F12 with the linuxhw datab=
ase:

      Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
        Source physical address: 2.0.0.0
      Unknown CTA-861 tag 0x00, length 0

      Unknown CTA-861 tag 0x00, length 0

      Unknown CTA-861 tag 0x00, length 0

      Unknown CTA-861 tag 0x00, length 0

      Unknown CTA-861 tag 0x00, length 0

      Unknown CTA-861 tag 0x00, length 0

      Unknown CTA-861 tag 0x00, length 0

    That looks pretty ugly.

    Regards,

    	Hans

    > =20
    >  	for (i =3D 0; i < length; i +=3D step) {
    >  		unsigned len =3D min(step, length - i);
    >=20



