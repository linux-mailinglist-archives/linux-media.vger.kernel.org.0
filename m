Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C8740CC88
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 20:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhIOS3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 14:29:17 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:58148 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229466AbhIOS3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 14:29:16 -0400
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id QVeTmOKuCczbLQZdVms1tk; Wed, 15 Sep 2021 18:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631730477; bh=b9j7ZVSws7jN1zwb4nb9QRY/vqDgL/Fha9lKLj13OTU=;
        h=Date:Subject:From:To:CC:References:In-Reply-To;
        b=ipGGgBq+LJE1OxfY0yrMRGgdCTEFL018qj90yzoh51FLUajMaxIgRGa7ybFP2EaaR
         yWpncY8zBY1Dx0tZTS8E39mVv4pL6nZR1fvHbCtQBc5VgMpCFN+wMqKhBdTyrIbL/B
         GbN/Gs7TovTssncDnfzdnIJD/6bp8xO84c0Hpv/RxjPPdswoMTe3oTkhrnmF98QfVW
         SMb6M/I+JZiNvNkII+OdcIR99LNkaRpGwDfU+4quRUkyjBUaZ+iOWvw6l2GfPv2czN
         RRaVz1RoV2jS0YAYpkEl/Q75jOKvFOBOMM1Ey6XdJqSCEmj82nSQI6s6ai73WiH9Dl
         GeAdFjoGrbvWw==
Received: from [192.168.0.100] ([70.71.78.228])
        by cmsmtp with ESMTPA
        id QZdTmoeSWcHSBQZdUmvuah; Wed, 15 Sep 2021 18:27:57 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61423b2d
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=IkcTkHD0fZMA:10 a=_Dj-zB-qAAAA:8 a=xOd6jRPJAAAA:8 a=_Hv29zpPPXLx2p5k5VQA:9
 a=QEXdDO2ut3YA:10 a=c-cOe7UV8MviEfHuAVEQ:22 a=p2IOnBAzwV8vXciPbnnL:22
User-Agent: Microsoft-MacOutlook/16.52.21080801
Date:   Wed, 15 Sep 2021 11:27:53 -0700
Subject: Re: [PATCH 07/11] edid-decode: always linefeed after hex_block
From:   Joe van Tunen <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Message-ID: <3B7DF45A-B3B2-4335-99CE-FD1A19B4814D@shaw.ca>
Thread-Topic: [PATCH 07/11] edid-decode: always linefeed after hex_block
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-8-joevt@shaw.ca>
 <2025be72-7f3e-b63d-51c4-33a9720f65fe@xs4all.nl>
 <F9B610CB-8B8D-4D68-B7AB-7BABF52BBDA3@shaw.ca>
In-Reply-To: <F9B610CB-8B8D-4D68-B7AB-7BABF52BBDA3@shaw.ca>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-CMAE-Envelope: MS4xfIC4YEjx+QnKWVTbhvH5geoYmvttfteTRc0SUXkHFpehFamckUl6wt3fd0bLB79z/RBctTp10uQqmIoW9uo/yl9bs1UI5yNYaoEzdHwLJLhP3MsJBil6
 /HNH9NkZ+MTBY0445FMoVpMq4+7IK3rPzNNM/06j9rxgBalCpK7AWvlaSoULPqoHylUCoN5eohF3mZQSyUPM+S46pOt+Fr19++T6o8tzAFqTr4nbzZkw4l2/
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I found no place that requires this change to hex_block.
This patch should be ignored.

I did find one call to hex_block that should be modified:
cta_hdr10plus outputs hex on the same line as the "Application Version: %u"=
.

It either needs to always output a linefeed before calling hex_block like t=
his:

	printf("    Application Version: %u\n", x[0]);
	hex_block("    ", x + 1, length - 1);

Or it needs to set step to the same value as length, like this:

	printf("    Application Version: %u", x[0]);
	if (length > 1)
		hex_block("  ", x + 1, length - 1, true, length - 1);
	else
		printf("\n");

Those are probably the only acceptable ways to call hex_block (first is mul=
ti-line or no-line, second is one-line)

It should also probably check the length:

	if (length =3D=3D 0) {
		fail("Empty Data Block with length %u.\n", length);
		return;
	}


=EF=BB=BFOn 2021-09-15, 8:43 AM, "Joe van Tunen" <joevt@shaw.ca> wrote:

    Yes, that's ugly. I will do a search for the EDID that prompted me to m=
ake this change. Maybe it's not a problem anymore.
    ...
    Seems like the problem I had was fixed in cta_hdr10plus. I'll do more c=
hecking and testing with other calls to hex_block.


    =EF=BB=BFOn 2021-09-15, 3:10 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:

        On 14/09/2021 14:11, joevt wrote:
        > hex_block should not return without printing a newline (which occ=
urs when the length is zero). This causes a missing newline after "Applicati=
on Version: 1" with cta_hdr10plus for an EDID I have.
        > Any place that calls hex_block will have the same problem if it's=
 possible for the length to be zero.
        >=20
        > In other words, a hex_block needs to have a linefeed even if it h=
as zero length, because the caller assumes it will go to the next line as it=
 does when the hex block is not zero length.
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
        > @@ -698,8 +698,10 @@ void hex_block(const char *prefix, const uns=
igned char *x,
        >  {
        >  	unsigned i, j;
        > =20
        > -	if (!length)
        > +	if (!length) {
        > +		printf("\n");
        >  		return;
        > +	}

        Hmm, with this change I get this:

        edid-decode -c Digital/Acer/ACR0282/B12D637C1F12 with the linuxhw d=
atabase:

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





