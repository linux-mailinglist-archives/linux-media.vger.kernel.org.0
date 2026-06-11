Return-Path: <linux-media+bounces-64598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j5aHCVfMKmqexAMAu9opvQ
	(envelope-from <linux-media+bounces-64598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 16:55:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85C672DB5
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 16:55:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=squebb.ca header.s=fm2 header.b=tCLu88HZ;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="c SIhjFe";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64598-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64598-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=squebb.ca;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CC1733B274A
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DC63D170C;
	Thu, 11 Jun 2026 14:55:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A8F2512C8;
	Thu, 11 Jun 2026 14:55:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781189709; cv=none; b=cHnzZJQyzLhVvUgLMdWjAUNrN/SH06rucpl+2ZMmHD4v0wHS7ajxtzCdqBCCaj97dlLz77YQ0ZEQXfN9iNK6CUgWPjBSp974MuJwel6YZ/Gbx2PM4lzIXOQksh7pkB9u4IqbHvugox/r/kAmfmgHHz5dVxjKq4aKnfnfxn75vY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781189709; c=relaxed/simple;
	bh=9Ui7e1NgBW2YiULZBEEQHthbWzhB25tOGCTLU/4lANs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uAsH/AHEbqJMx5MTx+RLsYrz58oycBPXwOamDTtKEuhj9kkGLLTJ/LE3AgPLbMxzZPDGxIPu/VKSA54PyMDBo9SWDYD5ymJ3JWcKotvFCKQvv0C/D47rSbagnGzXrsMppruCgxAjI7EuTZh8jZfvyoUh+HxEyOkRGbhwTamd460=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=tCLu88HZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cSIhjFe2; arc=none smtp.client-ip=202.12.124.151
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 454221D00145;
	Thu, 11 Jun 2026 10:55:06 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Thu, 11 Jun 2026 10:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781189706;
	 x=1781276106; bh=/TWS880laEsBPQKBKGFU1aU36vor0Le3vM1o2aIZEYc=; b=
	tCLu88HZHO+12RcVYyrqbFtDJmP8km8k8GCd2vygO+46kvNuMD2y8+V2rCVTNKjh
	ywupRMSs/VlLJqdUZV79JkDN7JsG9g+mvGJL9mmizp8Z2GFJtBJA6cypTuqtcrbT
	JbjSc91pxfhvz79ggcKiR5uJby9xcQsz41UeMgJW1aq9BOW1w4zcxepQ/kDyFGp/
	8pEMuNkdkK2zzgq+O4BBVWIoRoWgxxh9+x4B/O98cyZaDEiUReRhPAchinOLHFa5
	CiYEL2NR38GxYgdfcMBeFszApXNh7szE42m3q8PbnYKt1mlYhJYyT0hes2KX1sOy
	HWh5XE+RhRbxwykShRgUxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781189706; x=
	1781276106; bh=/TWS880laEsBPQKBKGFU1aU36vor0Le3vM1o2aIZEYc=; b=c
	SIhjFe2dOZNRBdptcl0Meh1XGT3qfFhi54sEhvNhoWKiMm/PaRJB148Vc8k3ZQzX
	FYvv9a6fjJvyIblQarlBJVdJXlq+F+t2UM+tMFfjBC7pImpiTp5E/ewSxlY4MXiB
	bAYh4bHNU6nKCvZsB5buzOlB+RuEfzPEK+RxLeBkLOVM8T0wRQSbcQCCXVPF4hX+
	JXpIIbkrueUEufrXFTG0IXXG7U4JNOoSZX4PKRZ3eVgliazH5C9esRvhxyWUeWAH
	qwoYFnOwT4hiBbROTRv3wEeEMsD15uC3vDH6JywB8KQDqtZLvs30UfK0QlAbxKzE
	0jTXefW5CRRpdZRmD5vDw==
X-ME-Sender: <xms:ScwqavpCH6t5SweXHrN_T_W6TiLY-crlWL5NXEeJgnT4iw0-VFoyaA>
    <xme:Scwqakf0gliA0552P3xu2_wg87bYSgZDpAR38vyviLahHX5fnjNhzzUoKEHeqBS12
    KCzYI5NIezVnx8y7yqRAgfjS4IBFVI17t6OA59NXlrnwIT-AmBAWw>
X-ME-Proxy-Cause: dmFkZTGHcxuunHC8y8kKAzFk4XfHhauqj3lNGMlZet80DOkhBtr7gQHokJKYHDmAvWO4/S
    VH8QmJvNcyZhBbsJ59f6FXSrTVfkKfG/UiJ0jOZUU8JHwU6tQltxiDYh0sbuipQDBso3ZW
    /VVfBi0fypP2hywsTV4XxTAeQFBOIJQtFy1FNijcFRiNUnFhP4cxOucQHotG0HdN/HwYMM
    4r32r/E37BU4MrEkfcXNrGfp2qK5pb04nfaF34PeTRUBr6sCPD5hNnP+e3vp2G1N2NQtFs
    RIRuXl4P2EGMLAdPvqGzwX69XmEfr02ess8VOhB0EJb9/6wgx5jclfuqCekVER0o4nYpqZ
    2brwru+l1dFJzZFep4LHQ2jbubTeOGAAG2Z61Hyd9EfwKPugLSqCBv8noz9vhGZUZE4Bzb
    fiadw+u9pBocz2T1WiH5ikKqhrqeiuVHtPtTIllr+LbVJf54c1OfBh0o5O3jIzjdSEGSDR
    9vPe5G0x9wHw/be/N1Us/Ovb55VgFyfDLTS4BLlLJlCIRg5ts+ZNYxUO9bOCxPYHjbau5a
    YPOBa+HWPfxaOpiCDn/DWUtWnofpWp8W6dBD0bA0d3+A82LV8P27BhurERDD5GBiXu6T7o
    QTWugG3uvuAS52BbqTEoyV4xgGx2WG58ClA9qZFKoaD+UU9lNhsa9Y/RJnMw
X-ME-Proxy: <xmx:Scwqan0DMrW3-kIzzc_ZvhZtlx1zvkuD-tNYVkYLB7eXMOYWzz3vwQ>
    <xmx:ScwqakVQIhW8PQcSlPDKCa6-j6K4b4sximG-CQAWXE4STaQVigX9KA>
    <xmx:ScwqahNvpKDNCTPOkYuBL8g8GAl16BfmCcY1iSrYEa-YD6MHDwaU7w>
    <xmx:Scwqav0vN_im-VCPPTI-4ARUOaZRmpKArFg0C1_YJvbSTD_aXrMO4A>
    <xmx:SswqameFeD8z37WYryFLS-28aIQ_SfYcxFSYM_LDx98fqZN1IQW06Nwk>
Feedback-ID: ic2b14614:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 467F02CE2B40; Thu, 11 Jun 2026 10:55:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ALjDCc3MNTuk
Date: Thu, 11 Jun 2026 10:54:45 -0400
From: "Mark Pearson" <mpearson@squebb.ca>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Damjan Georgievski" <gdamjan@gmail.com>
Cc: "Kate Hsuan" <hpa@redhat.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans de Goede" <johannes.goede@oss.qualcomm.com>,
 "Hans Verkuil" <hverkuil+cisco@kernel.org>,
 "Serin Yeh" <serin.yeh@intel.com>,
 "Tarang Raval" <tarang.raval@siliconsignals.io>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <9aaa21ad-6332-4dd4-9b78-6520af6a8619@app.fastmail.com>
In-Reply-To: <aiqtsFbFR9SZSDeL@kekkonen.localdomain>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-2-hpa@redhat.com>
 <aineK26VD67Fmibd@kekkonen.localdomain>
 <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
 <aipwpTo5JCiAACVp@kekkonen.localdomain>
 <CAEk1YH41bJSoJdjYMj2ZJp5+WF6DpZhBrwkNKaC1HbPvwDV3GA@mail.gmail.com>
 <aiqtsFbFR9SZSDeL@kekkonen.localdomain>
Subject: Re: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo X9 to the
 image upside-down list
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[squebb.ca,none];
	R_DKIM_ALLOW(-0.20)[squebb.ca:s=fm2,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:gdamjan@gmail.com,m:hpa@redhat.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64598-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[mpearson@squebb.ca,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpearson@squebb.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[squebb.ca:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lenovo.com:url,intel.com:email,messagingengine.com:dkim,vger.kernel.org:from_smtp,squebb.ca:dkim,squebb.ca:from_mime,app.fastmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D85C672DB5


On Thu, Jun 11, 2026, at 8:44 AM, Sakari Ailus wrote:
> Hi Damjan,
>
> On Thu, Jun 11, 2026 at 11:41:19AM +0200, Damjan Georgievski wrote:
>> On Thu, 11 Jun 2026 at 10:24, Sakari Ailus <sakari.ailus@linux.intel.=
com> wrote:
>> >
>> > Hi Kate,
>> >
>> > On Thu, Jun 11, 2026 at 03:25:46PM +0800, Kate Hsuan wrote:
>> > > Hi Sakari and Mark,
>> > >
>> > > On Thu, Jun 11, 2026 at 5:59=E2=80=AFAM Sakari Ailus
>> > > <sakari.ailus@linux.intel.com> wrote:
>> > > >
>> > > > Hi Kate,
>> > > >
>> > > > I know several people have given you different advices but...
>> > > >
>> > > > On Tue, Jun 09, 2026 at 08:49:24PM +0800, Kate Hsuan wrote:
>> > > > > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor s=
o the image
>> > > > > was displayed upside-down. Add the DMI information of Lenovo =
X9 to
>> > > > > resolve the issue.
>> > > > >
>> > > > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> > > > > ---
>> > > > >  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++=
++++++++++
>> > > > >  1 file changed, 32 insertions(+)
>> > > > >
>> > > > > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/m=
edia/pci/intel/ipu-bridge.c
>> > > > > index fc6608e33de4..9e24aaceecdf 100644
>> > > > > --- a/drivers/media/pci/intel/ipu-bridge.c
>> > > > > +++ b/drivers/media/pci/intel/ipu-bridge.c
>> > > > > @@ -134,6 +134,38 @@ static const struct dmi_system_id upside=
_down_sensor_dmi_ids[] =3D {
>> > > > >               },
>> > > > >               .driver_data =3D "OVTI02C1",
>> > > > >       },
>> > > > > +     {
>> > > > > +             /* Lenovo X9-14 */
>> > > > > +             .matches =3D {
>> > > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QA"),
>> > > > > +             },
>> > > > > +             .driver_data =3D "SONY471A",
>> > > > > +     },
>> > > > > +     {
>> > > > > +             /* Lenovo X9-14 */
>> > > >
>> > > > How are the two X9-14's different? It'd be good to have some co=
mment here
>> > > > which model this actually is: the board name is only available =
(typically
>> > > > at least) in DMI.
>> > >
>> > > According to the datasheet of X9-14 and 15. Lenovo offers 2 screen
>> > > sizes (14-inch and 15-inch) and 2 CPU types (Core Ultra 5 and 7).
>> >
>> > Is the CPU SKU the difference here? If so, can you add that to the =
comment?
>> >
>> > > They may ship customised firmware for a specific purpose with a r=
andom
>> > > DMI_PRODUCT_VERSION.
>> > > So, using the DMI_BOARD_NAME prefix to identify the laptop SKU is
>> > > safer and easier.
>> > >
>> > > I think DMI_MATCH(DMI_BOARD_NAME, "21Q") covers all X9 but I don't
>> > > know the side effect :(
>> > > They may propose a new model with a different MIPI camera or HID.
>> >
>> > Indeed. Is the BOARD_NAME guaranteed to be unique by Lenovo? I thin=
k I'd
>> > use DMI_EXACT_MATCH(), too.
>>=20
>> The full board_name is 21QA0048RM (on mine), so 21QA is just the pref=
ix.
>> The lenovo support site only requires this prefix to get you to the
>> support page for the laptops and they refer to it as "Type 21QA".
>>=20
>> Is there DMI_MATCH_PREFIX, for these (if not all) Thinkpads it might
>> make the most sense ?
>
> DMI_MATCH() only matches for prefix whereas DMI_EXACT_MATCH() requires=
 an
> exact match.
>
There are two BOARD_NAME's for every Thinkpad (which one your system has=
 depends on the channel thru which the platform is sold).

The first 4 chars are the important bit - they are defined and won't cha=
nge (they are used internally here). The rest of the BOARD_NAME is based=
 on the config and can vary.
I'm not so sure on the PRODUCT_VERSION I'm afraid which is why I'm hesit=
ant to use it, even though doing the match on two IDs is annoying. I'm t=
rying to confirm if it's a good idea or not.

A useful trick, for released platforms, is to go to https://psref.lenovo=
.com and type your platform in the search bar and it will come up with t=
he match and also list the two board codes.
So if you put in X9-14 you should see 21QA and 21QB - these are the two =
DMI matches you would need to do (X9-15 uses 21Q6 & 21Q7)

Don't do a match on 21Q - that will definitely match up with other platf=
orms that won't want this change.

Hope that helps
Mark

