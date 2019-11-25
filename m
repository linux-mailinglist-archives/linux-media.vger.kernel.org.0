Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B755F1088B6
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 07:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfKYGcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 01:32:45 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.137]:41363 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfKYGcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 01:32:45 -0500
Received: from [192.168.0.100] ([70.71.78.228])
        by shaw.ca with ESMTPA
        id Z7vMieS6pRnrKZ7vOic6HW; Sun, 24 Nov 2019 23:32:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574663562;
        bh=Fqfqpz4w6nB6t123hoL86ibaLvEnRT2WVWwKsUeByr0=;
        h=Date:Subject:From:To:CC:References:In-Reply-To;
        b=rCIFyJLhay+2Ui4AVON0a4GDNss3diJm+UKnPsiiPk30p7YBCyIzSGh2ztsyoFuT+
         D+8KTYoCEeU8Mj7tn8BlOJ5eTAmvDi46dMCdfEub+eb5vYHbDG+kAjoTOpZnHEYcCH
         AFV+6/HYw2BUrEPFYCc3j0DygI1KAkcnm6XSeVqtU2n3Kpy+U+/MAVN5vvrNziTZB6
         SGjpRfbw9iE7u87aWqHqzTZTZ/Rs29qhG1Z193j5eBK6ZIOoNtrBPTutqVoBcC2f7p
         Ztxchj5LNRT3l+hakJmRi/nwdTpz1Qeo2FnCe6gABieNT2oTbIhp3x6OeCs/sJgIgZ
         xPQ1TPOVCu0LA==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=_Dj-zB-qAAAA:8
 a=y0nVKhX3KRCUIhdP5vYA:9 a=RXxRhh06qIOVxgq1:21 a=uHXeYnP6_SwP_Whm:21
 a=QEXdDO2ut3YA:10 a=c-cOe7UV8MviEfHuAVEQ:22
User-Agent: Microsoft-MacOutlook/10.1f.0.191110
Date:   Sun, 24 Nov 2019 22:32:34 -0800
Subject: Re: [PATCH 05/10] edid-decode: output timings for YCbCr 4:2:0 cmdb
From:   Joe van Tunen <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Message-ID: <7C871732-2189-421D-A4E1-CA6F1F972AC8@shaw.ca>
Thread-Topic: [PATCH 05/10] edid-decode: output timings for YCbCr 4:2:0 cmdb
References: <20191123164604.268-1-joevt@shaw.ca> <20191123164604.268-6-joevt@shaw.ca>
In-Reply-To: <94798280-18ca-31af-6544-3cd6e9447f12@xs4all.nl>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-CMAE-Envelope: MS4wfFUvJq0561JbctBHs5AuQoenj16aKAnkPrlbLsVk+uXPtLA4DWeITFY4wi66of46EoREVpB6zeLn8yAUynEl/owUxRp7AvNXWmA7s7rGIsTBQQLf2OHn
 5505ivaf0EzsNcjdg2UmLxUyb4pUv5gECgu4mpuSCsIBT5SJcfs3pgdPwef93bs1i/pOGoXuEptDW2unBFlRt6z1O4pEJMXzuCs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right. The code will have to iterate EDID extension blocks, find CTA extens=
ion blocks, then find VDB blocks.
In the case where Y420CMDB length =3D 0, I would maybe output "All VDB SVDs"?
Also, shouldn't "VSD Index" be "SVD Index" to match the abbreviations in th=
e spec (or "VDB SVD Index" since it doesn't include SVDs from other sources =
such as Y420VDB)?
=20
Can we assume that an EDID can't use more than one Y420CMDB to get beyond V=
DB SVD Index 240? Each Y420CMDB will use the same set of SVDs (starting at V=
DB SVD index 1). The spec explicitly says that bit 0 is the first SVD of the=
 VDBs.
=20
On 2019-11-24, 2:26 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:

=C2=A0=C2=A0=C2=A0 On 11/23/19 5:45 PM, joevt wrote:
=C2=A0=C2=A0=C2=A0 > - "YCbCr 4:2:0 capability map data block" now outputs the modes th=
at support YCbCr 4:2:0 instead of just indexes of the modes. Indexes refer t=
o timings in "Video Data Block".
=C2=A0=C2=A0=C2=A0 > - Warnings are included in the output if "Video Data Block" doesn'=
t appear before "YCbCr 4:2:0 Capability Map Data Block" or if the index is o=
utside the range defined in the "Video Data Block".
=C2=A0=C2=A0=C2=A0 > - Moved inner loop of cta_svd into a new function cta_svd_one so t=
hat it can be reused by cta_y420cmdb.
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0This isn't sufficient. There may be multiple SVD blocks in the EDID=
, and that's not taken
=C2=A0=C2=A0=C2=A0 into account.
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0Also, I can't find any requirement in the CTA-861 spec that the YCb=
Cr 4:2:0 Capability
=C2=A0=C2=A0=C2=A0 Map Data Block has to appear after all SVD blocks. So the final chec=
k if the Y420CMDB
=C2=A0=C2=A0=C2=A0 block references invalid SVDs should be postponed to the end of the =
CTA block.
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0I also found a pre-existing bug: if length =3D=3D 0 in cta_y420cmdb() t=
hen that means that
=C2=A0=C2=A0=C2=A0 all SVDs support 4:2:0. That should be added to cta_y420cmdb().
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0Regards,
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0>=20
=C2=A0=C2=A0=C2=A0=C2=A0> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
=C2=A0=C2=A0=C2=A0 > ---
=C2=A0=C2=A0=C2=A0 >=C2=A0 edid-decode.c | 44 +++++++++++++++++++++++++++++++++++---------
=C2=A0=C2=A0=C2=A0 >=C2=A0 1 file changed, 35 insertions(+), 9 deletions(-)
=C2=A0=C2=A0=C2=A0 >=20
=C2=A0=C2=A0=C2=A0=C2=A0> diff --git a/edid-decode.c b/edid-decode.c
=C2=A0=C2=A0=C2=A0 > index b833178..4d6fe29 100644
=C2=A0=C2=A0=C2=A0 > --- a/edid-decode.c
=C2=A0=C2=A0=C2=A0 > +++ b/edid-decode.c
=C2=A0=C2=A0=C2=A0 > @@ -1454,13 +1454,10 @@ static const struct edid_cta_mode *vic_to_=
mode(unsigned char vic)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
=C2=A0=C2=A0=C2=A0 >=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> -static void cta_svd(const unsigned char *x, unsigned n, int for_=
ycbcr420)
=C2=A0=C2=A0=C2=A0 > +static void cta_svd_one(const unsigned char *x, int for_ycbcr420)
=C2=A0=C2=A0=C2=A0 >=C2=A0 {
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned i;
=C2=A0=C2=A0=C2=A0 > -
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < n; i++)=C2=A0 {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct edid_c=
ta_mode *vicmode =3D NULL;
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char svd =3D =
x[i];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char svd =3D x[=
0];
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char nativ=
e;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char vic;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *mode;
=C2=A0=C2=A0=C2=A0 > @@ -1468,7 +1465,7 @@ static void cta_svd(const unsigned char *x, =
unsigned n, int for_ycbcr420)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned clock_khz =
=3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((svd & 0x7f) =3D=
=3D 0)
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((svd - 1) & 0x=
40) {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vic =3D svd;
=C2=A0=C2=A0=C2=A0 > @@ -1511,10 +1508,23 @@ static void cta_svd(const unsigned char *x=
, unsigned n, int for_ycbcr420)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vic =3D=3D 1)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has_cta861_vic_1 =3D 1;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static void cta_svd(const unsigned char *x, int n, int for_ycbcr4=
20)
=C2=A0=C2=A0=C2=A0 > +{
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (unsigned i =3D 0; i < n; i++)=C2=A0 {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0=C2=A0=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cta_svd_one(x+i, for_y=
cbcr420);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> +unsigned const char *last_cta_video_block_start =3D NULL;
=C2=A0=C2=A0=C2=A0 > +unsigned last_cta_video_block_length =3D 0;
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 >=C2=A0 static void cta_video_block(const unsigned char *x, unsigned len=
gth)
=C2=A0=C2=A0=C2=A0 >=C2=A0 {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 last_cta_video_block_start =3D x;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 last_cta_video_block_length =3D length;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cta_svd(x, length, 0);
=C2=A0=C2=A0=C2=A0 >=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> @@ -1531,9 +1541,25 @@ static void cta_y420cmdb(const unsigned ch=
ar *x, unsigned length)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v =3D x[0 + i=
];
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned j;
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j < 8; =
j++)
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (v & (1 << j))
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0=C2=A0=C2=A0 VSD Index %u\n", =
i * 8 + j);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j < 8; j++=
) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (v & (1 << j)) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned k =3D i * 8 + j;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0=C2=A0=C2=A0 VSD Index %u", k + =
1);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (k >=3D last_cta_video_block_leng=
th) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (last_cta_video_block_start) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf(" (out of range)");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } =
else {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf(" (missing CTA video block)");
=C2=A0=C2=A0=C2=A0> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf(" ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ct=
a_svd_one(last_cta_video_block_start+k, 0);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0>=20
=C2=A0=C2=A0=C2=A0=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0


