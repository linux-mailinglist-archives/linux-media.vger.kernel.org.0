Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2586940CC8A
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 20:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhIOS3t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 14:29:49 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:58148 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229466AbhIOS3s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 14:29:48 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id QVMfmOJJNczbLQZe1ms23b; Wed, 15 Sep 2021 18:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631730509; bh=mg8kMobbjQdvg3S3Z5/XoPxpqUN8VcpVxX4iRrA05TA=;
        h=Date:Subject:From:To:CC:References:In-Reply-To;
        b=Ard088DvtyBTS3mAbetaRGyLxKxoV4zM5FqriAsq4URp/TsApMF/JljFCjnlGOjTu
         zzRQD6V9uSunv7TNlVQRBrxNju+2aJ09FQKgMyq1HAll+rabBVsD2V5rZmKnk0HktD
         ujB6biSnNgPMAXcEsyMrEmx51Z4WRMks+vpfH3XQ0t6zXVLnY9iz0TYGRs8nFNz1gN
         S7topvScxs/Vgq7wYqPyJ9BY7aGt+OCVzl//LFRyHJeKXvvs9X0FxVaA7Gnhe6yKfm
         jZqTZnb2Mw5jNC/mICRRxBQDbj1a+8MAlrJGx4o6XIEZ8Jjj++VyqejqzaeH7YGxOZ
         mI4PdBVXThUkg==
Received: from [192.168.0.100] ([70.71.78.228])
        by cmsmtp with ESMTPA
        id QZe0mewHmU9pxQZe1mvSWO; Wed, 15 Sep 2021 18:28:29 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=61423b4d
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=IkcTkHD0fZMA:10 a=xOd6jRPJAAAA:8 a=_Dj-zB-qAAAA:8 a=ywt57WX9DDL8cH32plEA:9
 a=QEXdDO2ut3YA:10 a=p2IOnBAzwV8vXciPbnnL:22 a=c-cOe7UV8MviEfHuAVEQ:22
User-Agent: Microsoft-MacOutlook/16.52.21080801
Date:   Wed, 15 Sep 2021 11:28:27 -0700
Subject: Re: [PATCH 05/11] edid-decode: fix standard timing vertical pixels
From:   Joe van Tunen <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Message-ID: <C0E330D8-607E-4406-8B84-E9D760311117@shaw.ca>
Thread-Topic: [PATCH 05/11] edid-decode: fix standard timing vertical pixels
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-6-joevt@shaw.ca>
 <075b28bd-35a0-5acb-3cc2-383c8533c031@xs4all.nl>
 <95b0735e-da3a-09d4-78fd-c36db5791912@xs4all.nl>
In-Reply-To: <95b0735e-da3a-09d4-78fd-c36db5791912@xs4all.nl>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-CMAE-Envelope: MS4xfO1JKqyf6OBQKQ/Wk7O3iX0yMp3rHyIViP2A7WGpvLGlr0Q0xhcRUtR73ZhDz75cjlbjykOCGG+4J7KXzyl0Adwe7X4jzolinKQtgOtNOQKNZOFh1VtG
 9941c16tIsnAWoLMeKS4ZnIqfY54Qf3kk3XxYPJOj68Rt/9eTebqctR4GALg5bqwoDU49Ab3Mdy1L5zsSveb0hxw1s9GpC3CZCa8TWpvziVpwz3xfACjV/Br
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good find. I agree with that warning.

=EF=BB=BFOn 2021-09-15, 4:10 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:

    On 15/09/2021 12:08, Hans Verkuil wrote:
    > On 14/09/2021 14:11, joevt wrote:
    >> Don't do ceiling to nearest 8 pixels for active vertical lines. See =
examples elo-4600l-hdmi and kogan-kaled24144f-hdmi.
    >>
    >> Section 3.9 and 3.10.3.6 of EDID 1.4 does not say vertical lines mus=
t be a multiple of 8.  This line of code appears to have been added to satis=
fy the 3rd example in VTB-EXT spec but that example has an incorrect HAP ind=
icator decimal value so it cannot be trusted. Also, all 3 examples have an i=
ncorrect vertical refresh value as noted in parse-vtb-ext-block.cpp. The VES=
A DMT spec has the following examples that are not a multiple of 8 lines whi=
ch support this change:
    >> 1400x1050 4:3
    >> 1440x900 16:10
    >> 1600x900 16:9
    >> 1680x1050 16:10
    >>
    >> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
    >> ---
    >>  parse-base-block.cpp | 1 -
    >>  1 file changed, 1 deletion(-)
    >>
    >> diff --git a/parse-base-block.cpp b/parse-base-block.cpp
    >> index e2901a6..32d2079 100644
    >> --- a/parse-base-block.cpp
    >> +++ b/parse-base-block.cpp
    >> @@ -573,7 +573,6 @@ void edid_state::print_standard_timing(const cha=
r *prefix, unsigned char b1, uns
    >>  		break;
    >>  	}
    >>  	vact =3D (double)hact * vratio / hratio;
    >> -	vact =3D 8 * ((vact + 7) / 8);
    >=20
    > I need to look closer at this. I think it was added to help with 1360=
x768, which without
    > this line maps to 1360x765.
    >=20
    > I'll get back to you on this.

    I did some more reading on this, and appendix D of the EDID 1.4 spec
    says this (D-8):

    "If calculated aspect ratio is not 16 : 10 AR, 4 : 3 AR, 5 : 4 AR or 16=
 : 9 AR
     what timing description should be used?"

    "Ref.: Section 3.9 (E-EDID Standard Release A, Revision 2)
     The Standard Timings Identification code may not be used to
     identify timings which do not match one of these standard aspect
     ratios. Support for such timings must be indicated elsewhere,
     e.g., by use of a Detailed Timing Descriptor."

    So you are correct with your change, but I think it would make
    sense to add a new check:

    // See also Ref. D-8 in the EDID-1.4 spec
    if (vact & 1)
    	warn("Standard Timing %ux%u has a dubious odd vertical resolution.\n",=
 hact, vact);

    So that way an attempt to use ST to describe 1360x768 will result in a =
warning.

    Regards,

    	Hans

    >=20
    > Regards,
    >=20
    > 	Hans
    >=20
    >>  	refresh =3D (b2 & 0x3f) + 60;
    >> =20
    >>  	formula.hact =3D hact;
    >>
    >=20



