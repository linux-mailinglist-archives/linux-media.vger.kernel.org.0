Return-Path: <linux-media+bounces-59871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIhEH4/28GkwbgEAu9opvQ
	(envelope-from <linux-media+bounces-59871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:03:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C6D48A5B6
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B25BD31050F8
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 17:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E53D45349C;
	Tue, 28 Apr 2026 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AjKdZCsr"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEED44D023
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 17:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777398906; cv=none; b=fIy36ecV3mvv6fVmFXM3GuvHQaCIiN15CAF/LCnin/ESkDnQNh+Bi+iw1kO4JnqE/QZT6Ruzn3rOOPiGHCi8YKHmhkk4dNNP0wG7b3UGQ1yYMiaDmFR3S+jDpnrgwcw24Pzc3Rzmyv8KJTPq7HCpjPIGukZBFRy9ty8ECbijOwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777398906; c=relaxed/simple;
	bh=p9PI4bcFHDehbhkV0coRbCIRXDq8RZEQ3ZhD+Mn0ORY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jYHHtrL1fFq5ypccPnccawNvCH+n0zshZENh2usf1u5Txd6/Fa11IWoA7zmfyw6Jk8D4fviio84vpg73sT05wiyvptqGcEs/GRh4Er47zggMsOpzJSAgE29SoN4/51LQadCiQbySdDSrLRytNFJPpjPk4u5q+kElYorz3tqCF/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AjKdZCsr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777398902;
	bh=p9PI4bcFHDehbhkV0coRbCIRXDq8RZEQ3ZhD+Mn0ORY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AjKdZCsrgRWsUwE/+WUeQcbIvgqtQdC33HxSQOg2LXwQzfX6QMR7AuqAfsHAHXK3h
	 vyudGOFebEpWeoao+hkyOAfmhsEoNYzUSbk+EuAq7mvNeimFFRkcpuIbX11an+DydQ
	 LV9ikViC/OcaPn9NGPQTn9m8ghhIgv/bz3xEq0pLZLlAakC6p8HcMYVZvtnPEDWb8i
	 Lvyx7jCdp2HkfzjZ06PcThi1bFa0WGkdW7s94pjpKG+kXDCqemlOdPHOuytYmzQnnv
	 5nrZEnSNJoCKRWfqkOxMnq7AUyrG/kDgZAfHzbkYEUeAYlmJW5NCsMXA8blDplS3un
	 flOhll81Sc9Pg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40D6817E10A4;
	Tue, 28 Apr 2026 19:54:58 +0200 (CEST)
Message-ID: <1182ce00f1c55cf28e13e6eb4f2e018b52a8f6a8.camel@collabora.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Jacopo Mondi
	 <jacopo.mondi@ideasonboard.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Michael Riesch	
 <michael.riesch@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,  Sakari Ailus
 <sakari.ailus@linux.intel.com>, Niklas =?ISO-8859-1?Q?S=F6derlund?=	
 <niklas.soderlund@ragnatech.se>, Tomi Valkeinen	
 <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>,
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>,
  Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
 Kieran Bingham	 <kieran.bingham@ideasonboard.com>, Kevin Hilman
 <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>, Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>, Hans de Goede	 <hansg@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Brandon Brnich	 <b-brnich@ti.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Sven =?ISO-8859-1?Q?P=FCschel?=	
 <s.pueschel@pengutronix.de>, Devarsh Thakkar <devarsht@ti.com>, Yemike
 Abhilash Chandra <y-abhilashchandra@ti.com>, Jackson Lee
 <jackson.lee@chipsnmedia.com>, Jai Luthra	 <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,  "Padhi, Beleswar"	
 <b-padhi@ti.com>, "Donadkar, Rishikesh" <r-donadkar@ti.com>, Rouven
 Czerwinski	 <rouven.czerwinski@linaro.org>, Nayden Kanchev
 <Nayden.Kanchev@arm.com>,  Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <Anthony.McGivern@arm.com>
Date: Tue, 28 Apr 2026 13:54:56 -0400
In-Reply-To: <77ea77b9-5503-40b2-882b-e96e30028c43@kernel.org>
References: 
	<CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
	 <20260413201907.GD4034@killaraus.ideasonboard.com>
	 <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
	 <20260413211602.GE4034@killaraus.ideasonboard.com>
	 <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
	 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
	 <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com>
	 <20260414074230.GB4061@killaraus.ideasonboard.com>
	 <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com>
	 <20260414084259.GC4061@killaraus.ideasonboard.com> <afCmQhSbQLDb6gvo@zed>
	 <77ea77b9-5503-40b2-882b-e96e30028c43@kernel.org>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-metYBE+2kaxYs3SHM6gN"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: B4C6D48A5B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59871-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--=-metYBE+2kaxYs3SHM6gN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 avril 2026 =C3=A0 15:00 +0200, Hans Verkuil a =C3=A9crit=C2=A0:
> On 4/28/26 14:30, Jacopo Mondi wrote:
> > Hello
> >=20
> > On Tue, Apr 14, 2026 at 11:42:59AM +0300, Laurent Pinchart wrote:
> > > On Tue, Apr 14, 2026 at 10:34:13AM +0200, Loic Poulain wrote:
> > > > On Tue, Apr 14, 2026 at 9:42=E2=80=AFAM Laurent Pinchart wrote:
> > > > > On Tue, Apr 14, 2026 at 09:20:56AM +0200, Michael Riesch wrote:
> > > > > > On 4/14/26 08:55, Ricardo Ribalda wrote:
> > > > > > > On Tue, 14 Apr 2026 at 08:47, Hans Verkuil <hverkuil+cisco@ke=
rnel.org> wrote:
> > > > > > > > On 13/04/2026 23:16, Laurent Pinchart wrote:
> > > > > > > > > On Mon, Apr 13, 2026 at 04:25:54PM -0400, Nicolas Dufresn=
e wrote:
> > > > > > > > > > Le lundi 13 avril 2026 =C3=A0 23:19 +0300, Laurent Pinc=
hart a =C3=A9crit :
> > > > > > > > > > > On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poulai=
n wrote:
> > > > > > > > > > > > Hi Hans,
> > > > > > > > > > > >=20
> > > > > > > > > > > > I would be happy to discuss this if a slot is avail=
able:
> > > > > > > > > > > >=20
> > > > > > > > > > > > Title: Generic V4L2 ISP M2M framework
> > > > > > > > > > > > Presenter: Loic Poulain
> > > > > > > > > > > > Time estimate: ~20min
> > > > > > > > > > > > Description: During early development of a Qualcomm=
 Offline Image
> > > > > > > > > > > > Processing Engine (OPE), we relied on the V4L2 memo=
ry=E2=80=91to=E2=80=91memory
> > > > > > > > > > > > (v4l2=E2=80=91m2m) framework, which is widely used =
and provides solid support
> > > > > > > > > > > > for buffer management and scheduling. However, appl=
ying it to an ISP
> > > > > > > > > > > > use case exposes limitations: ISP engines often req=
uire a richer media
> > > > > > > > > > > > graph, with multiple pads and metadata flows, simil=
ar to inline ISP
> > > > > > > > > > > > pipelines (params, stats, outputs). This talk propo=
ses discussing the
> > > > > > > > > > > > need for and design of a common V4L2 ISP M2M framew=
ork to factor out
> > > > > > > > > > > > shared functionality across drivers, particularly a=
round buffer/queue
> > > > > > > > > > > > management and job scheduling.
> > > > > >=20
> > > > > > It seems that we share some pain points.. :-) :-/
> > > > > >=20
> > > > > > Over the last year, some ideas have been brewing in my mind. No=
t
> > > > > > necessarily *my* ideas, mind you, rather ideas that have been a=
round in
> > > > > > linux-media for quite a while, actually. What I would like to p=
repare
> > > > > > for the Media Summit goes along the same lines.
> > > > > >=20
> > > > > > > > > > > That's well aligned with the v4l2-isp framework that =
Jacopo started, and
> > > > > > > > > > > to the multi-context and media-jobs APIs that we have=
 proposed. I
> > > > > > > > > > > wonder, however, if a short session at the media summ=
it will be enough,
> > > > > > > > > > > or if we should try to organize a half day brainstorm=
ing workshop at
> > > > > > > > > > > some point. Depending on when the people interested i=
n this topic plan
> > > > > > > > > > > to arrive, Monday could be an option.
> > > > > > > > > >=20
> > > > > > > > > > I'm also/still interested in the multi-context for m2m =
decoders that have inline
> > > > > > > > > > post-processing capabilities (current model forces us t=
o waste a lot of RAM). We
> > > > > > > > > > just restarted some design discussion with the team, wi=
th an increased
> > > > > > > > > > confidence that multi-context is the way. The scheduler=
 could come handy in the
> > > > > > > > > > future if we get to deal with more multi-stage codecs i=
n the future. I'll be in
> > > > > > > > > > Nice all day Monday.
> > > > > > > > >=20
> > > > > > > > > I will unfortunately be available only until 15:00 on Mon=
day, but Jacopo
> > > > > > > > > should be available through the day. Let's see who would =
be interested
> > > > > > > > > and available, and try to organize something.
> > > > > > > >=20
> > > > > > > > I'm available on Monday as well. I think this is a topic th=
at is well suited
> > > > > > > > to a brainstorm session.
> > > > > > >=20
> > > > > > > I am also available on Monday and would like to attend the se=
ssion.
> > > > > >=20
> > > > > > I'd be interested too. Right now the plan is to arrive on Monda=
y
> > > > > > afternoon. Depending on what time you agree on it may work out =
anyway.
> > > > > > It would be great to know the exact time this session will star=
t (as I
> > > > > > might need to adjust my travel arrangements).
> > > >=20
> > > > I can arrive on Monday, with a preference for the afternoon.
> > > >=20
> > > > > We need a volunteer to organize this, as in finding and booking a
> > > > > meeting space. Note that Monday is a public holiday in France (Mo=
nday
> > > > > the 25th of May in particular, not all Mondays).
> > > > >=20
> > > > > If the number of attendees was small I was thinking of hosting th=
e event
> > > > > in the place where the Ideas on Board team will be staying, but i=
t looks
> > > > > like we're already reaching a fair number of people.
> > > > >=20
> >=20
> > Are we still considering this BoF session ?
> >=20
> > We would someone to volunteer organizing this, at @IoB we're quite
> > full for the week and we might have an hard time organizing this one
> > on top of the libcamera workshop.
> >=20
> > As Laurent said, that Monday is a public holiday in France, and
> > getting a room somewhere might be complicated.
> >=20
> > We can host some people in the location where we're having the yearly I=
oB
> > get-together, but you should arrange your travel there (35 minutes
> > from Nice by car).
> >=20
> > If we get a volunteer we can should maybe a dedicated mail thread as th=
is one
> > was about the Media Summit ?
>=20
> If the number of people can be kept low (say <=3D 6), then it shouldn't b=
e a
> problem to just find a hotel restaurant or similar, close to the place of
> the media summit, and just sit together.
>=20
> Who would be the key people for this? And who are 'nice to have'? :-)
> I think I probably fit more in the latter category than the first.

I was hoping a small number of people and a simple caf=C3=A9/lobby too. The=
 mass of
people interested in the reply arrive much later, but I'm there all day, an=
d
would be more then happy to be able to brainstorm the subject a bit, which =
is
easier in small group.

Nicolas

p.s. once we know how many, if its too big, I can always abuse Mark again a=
nd
ask him to figure-out something for us.

>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> >=20
> > > > > > > Regards!
> > > > > > >=20
> > > > > > > > The agenda for the media summit is getting quite full, and =
I agree with Laurent
> > > > > > > > that 20 minutes is likely not enough. If we can so a sessio=
n on Monday instead,
> > > > > > > > then that would be a good solution.
> > > > > >=20
> > > > > > Apart from the time and date the scope of this session would be=
 interesting.
> > > > > >=20
> > > > > > Will this be a birds of a feather session in which the next gen=
eration
> > > > > > kernel ISP framework will be discussed? Or even the next genera=
tion
> > > > > > kernel video processing framework, where video processing is im=
age
> > > > > > signal processing, encoding/decoding, 2D graphics processing (f=
isheye
> > > > > > correction units, 2D GPU such as the Rockchip RGA3, ...)?
> > > > >=20
> > > > > I would focus on Loic's original scope. If the solution can be us=
ed for
> > > > > other devices that's great too. I believe that the current multi-=
context
> > > > > patch series is a good fit for codecs. If we broaden the scope to=
o much
> > > > > right away we'll achieve nothing.
> > > > >=20
> > > > > > > > I have never been very enthusiastic about the m2m framework=
: it's fine for e.g.
> > > > > > > > simple scalers, but it's awkward to use for codecs let alon=
e ISPs.
> > > > > > > >=20
> > > > > > > > I always felt that we really need variants of the m2m frame=
work that are customized
> > > > > > > > to specific use-cases: i.e. a codec m2m framework, and (per=
haps) an ISP m2m framework.
> > > > > > > >=20
> > > > > > > > The big problem with that is of course who will do the work=
. Making new frameworks
> > > > > > > > is difficult and takes a long time.
> > > >=20
> > > > A couple of weeks ago, I submitted an initial driver for a Qualcomm
> > > > Offline ISP based on the standard v4l2-m2m framework. Following
> > > > discussions around which parts could be generalized, I started
> > > > migrating this work to a new v4l2-isp-m2m framework:
> > > > (https://github.com/loicpoulain/linux/commit/5d575d7eff8f2371e91d82=
37148ffdb44b0af5b0).
> > >=20
> > > I definitely want to discuss this, but I will be available on Monday
> > > until 15:00 only.
> > >=20
> > > > The API and overall logic closely mirror v4l2-m2m.c, but are extend=
ed
> > > > to address ISP=E2=80=91specific requirements such as multi=E2=80=91=
device support and
> > > > multiple queue handling.
> > >=20
> > > That part I don't like. The V4L2 M2M framework is a big mid-layer tha=
t
> > > prevents drivers from having control of how operations are handled. I=
t
> > > does too much, and doesn't give enough flexibility to drivers. It may
> > > have been fine when the framework was designed, for the devices we ha=
d
> > > back then, but today it's just painful. I want to turn this around an=
d
> > > give control to the drivers, with helpers they can use to implement
> > > parts that are not driver-specific. This needs to be opt-in, not a la=
yer
> > > that takes completely control between the uAPI and driver operations.
> > >=20
> > > Let's not reproduce the design mistakes made in the V4L2 M2M framewor=
k.
> > >=20
> > > I also think you need to decouple the context handling and scheduling=
 in
> > > two separate components. They need to work together, but shouldn't be
> > > bundled into a monolithic system. Very importantly, a driver should b=
e
> > > able to implement contexts with the multi-context helpers, and implem=
ent
> > > custom scheduling itself.
> > >=20
> > > > I am planning to submit this work as an RFC
> > > > before the Media Summit. At this stage, the framework is still fair=
ly
> > > > basic and primarily tailored to the Qualcomm use case. There is
> > > > definitely room for improvement, for example, integrating Jacopo=E2=
=80=99s
> > > > multi=E2=80=91context support, since for now, the Qualcomm driver s=
imply
> > > > instantiates a single ISP=E2=80=91M2M context.
> > > >=20
> > > > As I am still getting familiar with the media subsystem, this work =
may
> > > > overlap with or conflict with ongoing efforts. Synchronizing seems
> > > > indeed important. Based on my current understanding, there are seve=
ral
> > > > related areas of work that appear either complementary or orthogona=
l:
> > > > - Multi=E2=80=91context support, to instantiate multiple processing=
 sessions
> > > > on shared hardware/driver.
> > > > - Media jobs, to synchronize work across multiple drivers within th=
e
> > > > same media pipeline.
> > > > - ISP M2M, aiming to provide a v4l2-m2m=E2=80=91like framework spec=
ifically
> > > > for memory=E2=80=91to=E2=80=91memory ISP devices.
> > > >=20
> > > > > > This may be naive and overly optimistic, but I feel there is qu=
ite a
> > > > > > number of people sharing the same pain points (which are simila=
r to
> > > > > > those Loic pointed out). Maybe (hopefully) this birds of a feat=
her
> > > > > > session leads to the formation of some work group?
> > > > > >=20
> > > > > > > > > > > > On Sun, Apr 12, 2026 at 12:25=E2=80=AFPM Hans Verku=
il wrote:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > (Please pass this on to anyone you think might be=
 interested in this!)
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Hi all,
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > This is the fourth version of this announcement, =
updating the list of attendees
> > > > > > > > > > > > > and the tentative agenda at the end: please let m=
e know if you see mistakes.
> > > > > > > > > > > > > Note that there is still time for one or two othe=
r topics. Also please check
> > > > > > > > > > > > > the agenda if you need more (or perhaps less) tim=
e for your topic.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > This year's Media Summit will be held on Tuesday =
May 26th the day before the
> > > > > > > > > > > > > Embedded Recipes Conference in Nice, France:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > https://embedded-recipes.org/2026/
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > The Media Summit will be held at Hotel Campanile =
and in the same meeting room
> > > > > > > > > > > > > as last year (Nikaia):
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > https://nice-aeroport.campanile.com/en-us/
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > It is close to the Airport and to the Embedded Re=
cipes venue.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > The meeting room can hold up to 30 people and I w=
ill provide video conferencing support,
> > > > > > > > > > > > > just like last year. The location and the meeting=
 room was quite nice last year, so
> > > > > > > > > > > > > I saw no need to change it.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > That said, in-person participation is very much p=
referred. This yearly summit is meant
> > > > > > > > > > > > > for active media developers to meet face-to-face =
and to discuss media subsystem issues.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > And it is also a good opportunity to talk to each=
 other during the Embedded Recipes
> > > > > > > > > > > > > conference to discuss topics in a smaller group. =
But if you are an active media developer
> > > > > > > > > > > > > and are really not able to attend in person, then=
 remote participation is an option.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > If you want to attend the meeting (either in pers=
on or remote), then send an email to me
> > > > > > > > > > > > > directly. The deadline for in-person attendance i=
s May 14 as the hotel needs to know the
> > > > > > > > > > > > > final number of attendees by then.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > There is no registration fee, the meeting room is=
 sponsored by Cisco and Collabora, and
> > > > > > > > > > > > > the lunch is sponsored by Ideas on Board! Many th=
anks to our sponsors, it's very much
> > > > > > > > > > > > > appreciated.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > If you have a topic that you want to discuss, jus=
t 'Reply All' to this announcement
> > > > > > > > > > > > > and give the topic title, a short description and=
 a guesstimate of the time you need
> > > > > > > > > > > > > for your topic.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > See last year's Media Summit Report as an example=
 of what to expect:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > https://lore.kernel.org/linux-media/21769183-ca57=
-4f8f-818a-6a1ad089298d@jjverkuil.nl/
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Regards,
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > PS: Be aware that May 24 and 25 are public holida=
ys in France. So many
> > > > > > > > > > > > > shops may be
> > > > > > > > > > > > > closed those days.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > In-person attendees:
> > > > > > > > > > > > > Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > > > > > > > Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > > > > > > > > > > > Brandon Brnich <b-brnich@ti.com>
> > > > > > > > > > > > > Rouven Czerwinski <rouven.czerwinski@linaro.org>
> > > > > > > > > > > > > Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > > > > > > > > Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > > > > > > > > > > Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > > > > > > > > > > > Marco Felsch <m.felsch@pengutronix.de>
> > > > > > > > > > > > > Paul Kocialkowski <paulk@sys-base.io>
> > > > > > > > > > > > > Jai Luthra <jai.luthra@ideasonboard.com>
> > > > > > > > > > > > > Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > > > > > > > > Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > > > > > > > > > > > > Beleswar Padhi <b-padhi@ti.com>
> > > > > > > > > > > > > Laurent Pinchart <laurent.pinchart@ideasonboard.c=
om>
> > > > > > > > > > > > > Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > > > > > > > > > Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > > > > > > > > > > > > Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > > > > > > Michael Riesch <michael.riesch@collabora.com>
> > > > > > > > > > > > > Devarsh Thakkar <devarsht@ti.com>
> > > > > > > > > > > > > Michael Tretter <m.tretter@pengutronix.de>
> > > > > > > > > > > > > Hans Verkuil <hverkuil@kernel.org>
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Remote attendees:
> > > > > > > > > > > > > Yemike Abhilash Chandra <y-abhilashchandra@ti.com=
>
> > > > > > > > > > > > > Rishikesh Donadkar <r-donadkar@ti.com>
> > > > > > > > > > > > > Jackson Lee <jackson.lee@chipsnmedia.com>
> > > > > > > > > > > > > Dave Stevenson <dave.stevenson@raspberrypi.com> (=
tentative)
> > > > > > > > > > > > >=20
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Agenda (tentative):
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 8:45-9:20: Arrive, settle in
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 9:20-9:30: Short intro (Hans Verkuil)
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 9:30-9:45: Status of ISP support in V4L2
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presen=
ter: Laurent Pinchart
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Descri=
ption: Summary of ISP-related development in V4L2 since the last
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Linux =
Media Summit. This includes a brief overview of technical
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 develo=
pments, and a summary of the efforts to engage with vendors.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 9:45-10:45: V4L2 Stateless Video Encoding uAPI Pr=
ogress Update
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presen=
ter: Paul Kocialkowski
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Descri=
ption: An update on the ongonig work to support stateless codecs in V4L2.
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some o=
f the remaining open topics will be presented and discussed.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 10:45-11:00: break
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 11:00-11:30: Vulkan Video Codecs
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presen=
ter: Nicolas Dufresne
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Descri=
ption: Vulkan video codecs: what are the viable options for Linux Media
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and wh=
at is in preparation outside of our subsystem. The second aspect is
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inform=
ative as these discussions don't seem to lean toward our subsystem as the
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 founda=
tion. But I think it's rather useful for everyone to understand why and
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 what i=
s included.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 11:30-12:00: Protected Video playback on i.MX8MQ
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presen=
ter: Rouven Czerwinski
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Descri=
ption: Introduction to protected video playback
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on i.M=
X8MQ and missing bits for linux-media & protected heap interoperability.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 12:00-13:30: Lunch
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 13:30-14:00: HDCP support for HDMI receivers
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presen=
ter: Hans Verkuil
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Descri=
ption: I have been working on adding HDCP support for HDMI receivers.
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specif=
ically the HDCP negotiation between sources and sinks.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 14:00-14:30: AI patches
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presen=
ter: Sakari Ailus
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Descri=
ption: What is our policy w.r.t. AI generated patches?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 14:30-15:00 Overview of Media CI: where do pipeli=
nes run?
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presen=
ter: Ricardo Ribalda
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Descri=
ption: How are jobs in pipelines assigned? How does the infrastructure
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for Me=
dia CI work? Are there things that can be tweaked to make it more
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reliab=
le?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 15:00-15:15: Break
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > 15:15-16:15: Discussion of the media subsystem de=
velopment process
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presen=
ter: Hans Verkuil
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Descri=
ption: Review of the multi-committer model: current status and next steps.
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Are th=
ere any bottlenecks, any ideas for improvements, w.r.t. the development pro=
cess?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > As you can see, there is still some available tim=
e for other topics.
> > >=20
> > > --
> > > Regards,
> > >=20
> > > Laurent Pinchart
> >=20

--=-metYBE+2kaxYs3SHM6gN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafD0cAAKCRDZQZRRKWBy
9Ag6AQDKD5mjJkgQQOYBYYheKNnuXWs89XjkJ4obt/b6mCyRgQEA2Pm8uXQbgqZp
5KKy6bjvQy5xXSHXDqHeTvttmGHawQA=
=/oyD
-----END PGP SIGNATURE-----

--=-metYBE+2kaxYs3SHM6gN--

