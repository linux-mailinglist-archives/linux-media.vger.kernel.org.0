Return-Path: <linux-media+bounces-67330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HkRFKC9pUWr+EAMAu9opvQ
	(envelope-from <linux-media+bounces-67330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:50:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F091A73F26D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:50:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b="jMq1v/mU";
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67330-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67330-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DCA7300F5F4
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC863CBE86;
	Fri, 10 Jul 2026 21:50:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E33C1992;
	Fri, 10 Jul 2026 21:50:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783720232; cv=none; b=mgP/6ta81chbVMfilMcxQvOH2U7+teBETXVygNxwiXC5q93f4GGs00oC8op10Ym4C1VCHcyz8YyNGK4OdOFkFoxjqTFMNey6PXAgFMKEdyyrwgQevYQOlDMRI/GabZ4oFzGKpj0c287EbQ+qY+xFlEIl0dClkiohQt3FhyO9pSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783720232; c=relaxed/simple;
	bh=Eb1gi3rqPzk17seRK10DUGv/BeouXrwe/1jWDc3UGvE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f/DNWXIWY+RtqVo4E9Lv17XcjoayfMKkgjswBAgiSQQirVKtxLZkobOQArrwGo7p1szKRrl13WcraLAoC28ftTltrkGX0On/32xh91XKX6rMbx89ndo/B+gW6dFOk0u5ogizbp56yXtXs86C3JEEnkySl8nqqlvV3OG4pkBzOo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jMq1v/mU; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783720228;
	bh=Eb1gi3rqPzk17seRK10DUGv/BeouXrwe/1jWDc3UGvE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jMq1v/mUey29AtvsmMDN2kl+Pcz6PyCMVqQW4uuO6xGyOiUq3kfc9gVvJ/WZ2tDPt
	 bdz2GoUO3uOR8BqraCCjnkGlq5vW8ZSaeXNk1ZhywCoeuY4QW6Ystf76Vzn7pmzWHd
	 WjYAsY2hUTMAnpEuDwYELVRIF/xrx36lwVBjE2jgveQ6EvQ1J5JKSPZns+AfWybEFK
	 JU4REa1JzOr41EqPzVBTp6xz1+eyGJ8dhC2Tljo+Qfwfapv1YaWJckbLWmLMzY9Ia+
	 67AZapb+7AhngUb17N1TUFEyap1AAGXan2/l4pEyE+0nNwuhHuoAOnx3FtX0bFWDBJ
	 /HoXdyvxploSg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4211D17E07A2;
	Fri, 10 Jul 2026 23:50:26 +0200 (CEST)
Message-ID: <1fc15dba58832a83115cbf5933c61ee33d044372.camel@collabora.com>
Subject: Re: [RFC PATCH 1/6] media: mc: Implement shared media graph
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Elder <paul.elder@ideasonboard.com>, 
	laurent.pinchart@ideasonboard.com
Cc: michael.riesch@collabora.com, xuhf@rock-chips.com, 
	stefan.klug@ideasonboard.com, kieran.bingham@ideasonboard.com, 
	dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
 sakari.ailus@linux.intel.com
Date: Fri, 10 Jul 2026 17:50:24 -0400
In-Reply-To: <20260619052637.1110672-2-paul.elder@ideasonboard.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
	 <20260619052637.1110672-2-paul.elder@ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-7gIX5FwH0oLp6mCGmYw/"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-67330-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:paul.elder@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:michael.riesch@collabora.com,m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F091A73F26D


--=-7gIX5FwH0oLp6mCGmYw/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 19 juin 2026 =C3=A0 14:26 +0900, Paul Elder a =C3=A9crit=C2=A0:
> Currently, a media graph contains a main device whose driver is
> responsible for creating the media device. We have however recently run
> into devices that have multiple devices that can quality as a main
> device. Examples are the RK3588 which has a VICAP and two ISP
> instances, and another example is the i.MX8MP which has an ISI and two
> ISP instances. As there is currently no way to reconcile who the main
> device is in the media device, these setups simple cannot be used
> simultaneously.
>=20
> This patch extends the media controller API with a "shared media graph"
> framework. This allows drivers to share a media device, thus enabling
> the setups mentioned above. Instead of owning and creating a media
> device, drivers can join-or-create a shared media device via the shared
> media graph API. The matching is done automatically based on the
> detected endpoints in the device tree.

Dropping a note, we should check if it makes sense combine this with
include/linux/component.h

>=20
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
> =C2=A0drivers/media/mc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/media/mc/mc-shared-graph.c | 335 ++++++++++++++++++++++++++=
+++
> =C2=A0include/media/mc-shared-graph.h=C2=A0=C2=A0=C2=A0 |=C2=A0 92 ++++++=
++
> =C2=A03 files changed, 428 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/media/mc/mc-shared-graph.c
> =C2=A0create mode 100644 include/media/mc-shared-graph.h
>=20
> diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
> index 2b7af42ba59c..1d502fdc52ad 100644
> --- a/drivers/media/mc/Makefile
> +++ b/drivers/media/mc/Makefile
> @@ -1,7 +1,7 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> =C2=A0
> =C2=A0mc-objs	:=3D mc-device.o mc-devnode.o mc-entity.o \
> -	=C2=A0=C2=A0 mc-request.o
> +	=C2=A0=C2=A0 mc-request.o mc-shared-graph.o
> =C2=A0
> =C2=A0ifneq ($(CONFIG_USB),)
> =C2=A0	mc-objs +=3D mc-dev-allocator.o
> diff --git a/drivers/media/mc/mc-shared-graph.c b/drivers/media/mc/mc-sha=
red-graph.c
> new file mode 100644
> index 000000000000..c4067e5b861d
> --- /dev/null
> +++ b/drivers/media/mc/mc-shared-graph.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mc-shared-graph.c - Media Controller Shared Graph API
> + *
> + * Copyright (c) 2026 Paul Elder <paul.elder@ideasonboard.com>
> + */
> +
> +/*
> + * This file adds the Media Controller Shared Graph API. This allows dri=
vers
> + * to create shared media graphs or join existing media graphs from othe=
r
> + * drivers, so that they can all be in the same media graph. This allows=
 us to
> + * have more complex media graphs chaining more complex hardware togethe=
r,
> + * instead of simple async subdevs.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/fwnode.h>
> +#include <linux/kref.h>
> +#include <linux/property.h>
> +
> +#include <media/media-device.h>
> +
> +#include <media/mc-shared-graph.h>
> +
> +static LIST_HEAD(media_device_shared_list);
> +static DEFINE_MUTEX(media_device_shared_lock);
> +
> +struct media_device_shared_member {
> +	struct device *dev;
> +	struct fwnode_handle *fwnode;
> +	struct list_head list;
> +};
> +
> +struct media_device_shared_link {
> +	struct media_entity *source;
> +	u16 source_pad;
> +	struct media_entity *sink;
> +	u16 sink_pad;
> +	u32 flags;
> +	struct list_head list;
> +};
> +
> +// TODO figure out locking for when multiple drivers touch the media gra=
ph;
> +// maybe macros for shared versions?
> +struct media_device_shared {
> +	struct media_device mdev;
> +	struct list_head members;
> +	struct list_head links;
> +
> +	struct list_head list;
> +	struct kref refcount;
> +
> +	struct device *removed_device;
> +};
> +
> +static inline struct media_device_shared *
> +to_media_device_shared(struct media_device *mdev)
> +{
> +	return container_of(mdev, struct media_device_shared, mdev);
> +}
> +
> +static void media_device_shared_release(struct kref *kref)
> +{
> +	struct media_device_shared *mds =3D
> +		container_of(kref, struct media_device_shared, refcount);
> +
> +	dev_dbg(mds->removed_device, "%s: releasing Media Device\n", __func__);
> +
> +	mutex_lock(&media_device_shared_lock);
> +
> +	media_device_unregister(&mds->mdev);
> +	media_device_cleanup(&mds->mdev);
> +
> +	list_del(&mds->list);
> +	mutex_unlock(&media_device_shared_lock);
> +
> +	kfree(mds);
> +}
> +
> +/* Callers should hold media_device_shared_lock when calling this functi=
on */
> +static bool __media_device_shared_find_match(struct media_device_shared =
*mds,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 struct fwnode_handle *fwnode)
> +{
> +	struct media_device_shared_member *member;
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *remote_ep;
> +	bool match =3D false;
> +
> +	// TODO: parse the device tree endpoints graph instead of finding just =
the
> +	// first-level neighbours
> +	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +		list_for_each_entry(member, &mds->members, list) {
> +			remote_ep =3D fwnode_graph_get_remote_port_parent(ep);
> +			match =3D (member->fwnode =3D=3D remote_ep);
> +			fwnode_handle_put(remote_ep);
> +
> +			if (!match)
> +				continue;
> +
> +			goto match_complete;
> +		}
> +	}
> +
> +match_complete:
> +	fwnode_handle_put(ep);
> +	return match;
> +}
> +
> +/* Callers should hold media_device_shared_lock when calling this functi=
on */
> +static struct media_device *__media_device_shared_get(struct device *dev=
)
> +{
> +	struct media_device_shared *mds;
> +	struct media_device_shared_member *member;
> +	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> +	bool ret;
> +
> +	dev_dbg(dev, "%s: searching for media device for %pfwf", __func__, fwno=
de);
> +
> +	list_for_each_entry(mds, &media_device_shared_list, list) {
> +		ret =3D __media_device_shared_find_match(mds, fwnode);
> +		if (ret)
> +			break;
> +	}
> +
> +	if (!ret)
> +		return NULL;
> +
> +	member =3D kzalloc_obj(*member);
> +	if (!member)
> +		return NULL;
> +
> +	member->dev =3D dev;
> +	member->fwnode =3D fwnode;
> +	list_add_tail(&member->list, &mds->members);
> +	kref_get(&mds->refcount);
> +
> +	dev_dbg(dev, "%s: %pfwf joined media device of %pfwf",
> +		__func__, fwnode,
> +		list_first_entry(&mds->members, struct media_device_shared_member, lis=
t)->fwnode);
> +
> +	return &mds->mdev;
> +}
> +
> +/* Callers should hold media_device_shared_lock when calling this functi=
on */
> +static struct media_device *__media_device_shared_create(struct device *=
dev)
> +{
> +	struct media_device_shared *mds;
> +	struct media_device_shared_member *member;
> +	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> +	int ret;
> +
> +	mds =3D kzalloc_obj(*mds);
> +	if (!mds)
> +		return NULL;
> +
> +	member =3D kzalloc_obj(*member);
> +	if (!member)
> +		goto err_free_mds;
> +
> +	media_device_init(&mds->mdev);
> +
> +	ret =3D media_device_register(&mds->mdev);
> +	if (ret)
> +		goto err_free_member;
> +
> +	INIT_LIST_HEAD(&mds->members);
> +	member->dev =3D dev;
> +	member->fwnode =3D fwnode;
> +	list_add_tail(&member->list, &mds->members);
> +
> +	INIT_LIST_HEAD(&mds->links);
> +
> +	kref_init(&mds->refcount);
> +	list_add_tail(&mds->list, &media_device_shared_list);
> +
> +	// TODO figure out how to reconcile this with multiple members
> +	mds->mdev.dev =3D dev;
> +
> +	devv_dbg(dev, "%s: Allocated media device with %pfwf at %p\n",
> +		 __func__, fwnode, &mds->mdev);
> +	return &mds->mdev;
> +
> +err_free_member:
> +	kfree(member);
> +err_free_mds:
> +	kfree(mds);
> +	return NULL;
> +}
> +
> +// TODO figure out how to resolve the identifiers (model, driver name, e=
tc);
> +// atm it's racy and whoever gets it last wins
> +struct media_device *media_device_shared_join(struct device *dev)
> +{
> +	struct media_device *mdev;
> +
> +	mutex_lock(&media_device_shared_lock);
> +
> +	mdev =3D __media_device_shared_get(dev);
> +	if (!!mdev) {

Looks fun / geeky, but please don't, just do if (mdev). We really don't car=
e
here if the value passed to the if is exactly 1 or some other non-nul value=
.

> +		dev_dbg(dev, "%s: found media device for %pfwf", __func__, dev_fwnode(=
dev));
> +		mutex_unlock(&media_device_shared_lock);
> +		return mdev;
> +	}
> +
> +	mdev =3D __media_device_shared_create(dev);
> +	if (!mdev) {
> +		dev_warn(dev, "%s: failed to create media device for %pfwf", __func__,=
 dev_fwnode(dev));
> +		mutex_unlock(&media_device_shared_lock);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	dev_dbg(dev, "%s: created media device for %pfwf", __func__, dev_fwnode=
(dev));
> +	mutex_unlock(&media_device_shared_lock);
> +	return mdev;
> +}
> +EXPORT_SYMBOL_GPL(media_device_shared_join);
> +
> +void media_device_shared_leave(struct media_device *mdev, struct device =
*dev)
> +{
> +	struct media_device_shared *mds =3D to_media_device_shared(mdev);
> +	struct media_device_shared_member *member;
> +	struct media_device_shared_member *member_tmp;
> +	bool removed =3D false;
> +
> +	mutex_lock(&media_device_shared_lock);
> +
> +	list_for_each_entry_safe(member, member_tmp, &mds->members, list) {
> +		if (member->dev =3D=3D dev) {
> +			list_del(&member->list);
> +			kfree(member);
> +			removed =3D true;
> +		}
> +	}
> +
> +	if (!removed)
> +		dev_err(dev, "%s: %pfwf trying to leave from graph in which not a memb=
er",
> +			__func__, dev_fwnode(dev));
> +
> +	mds->removed_device =3D dev;
> +	mutex_unlock(&media_device_shared_lock);
> +	kref_put(&mds->refcount, media_device_shared_release);
> +}
> +EXPORT_SYMBOL_GPL(media_device_shared_leave);
> +
> +int media_device_shared_join_link_source(struct media_device *mdev,
> +					 struct device *dev,
> +					 struct media_entity *source,
> +					 u16 source_pad, u32 flags)
> +{
> +	struct media_device_shared *mds =3D to_media_device_shared(mdev);
> +	struct media_device_shared_link *link;
> +	struct media_device_shared_link *link_tmp;
> +	int ret =3D 0;
> +
> +	mutex_lock(&media_device_shared_lock);
> +
> +	/*
> +	 * TODO Figure out flags. Should we use greatest common denominator? Or
> +	 * prioritize sink? Or whoever wins the race? For now we just take the =
flags
> +	 * from the sink.
> +	 *
> +	 * TODO Figure out how to actually do the matching. For now we just mat=
ch
> +	 * whoever comes in first. This works with the simple example we're run=
ning
> +	 * with now (rkcif + one rkisp2) but with setups with multiple copies o=
f
> +	 * hardware this will cause problems, like with rkcif + two rkisp2 and
> +	 * imx8-isi + two rkisp1.
> +	 */
> +	list_for_each_entry_safe(link, link_tmp, &mds->links, list) {
> +		if (link->sink) {
> +			ret =3D media_create_pad_link(source, source_pad,
> +						=C2=A0=C2=A0=C2=A0 link->sink, link->sink_pad,
> +						=C2=A0=C2=A0=C2=A0 link->flags);
> +			list_del(&link->list);
> +			kfree(link);
> +			goto exit_join_link_source;
> +		}
> +	}
> +
> +	link =3D kzalloc_obj(*link);
> +	if (!link) {
> +		ret =3D -ENOMEM;
> +		goto exit_join_link_source;
> +	}
> +
> +	link->source =3D source;
> +	link->source_pad =3D source_pad;
> +	link->flags =3D flags;
> +	list_add_tail(&link->list, &mds->links);
> +
> +exit_join_link_source:
> +	mutex_unlock(&media_device_shared_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_device_shared_join_link_source);
> +
> +// TODO deduplicate from above
> +int media_device_shared_join_link_sink(struct media_device *mdev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct media_entity *sink,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 sink_pad, u32 flags)
> +{
> +	struct media_device_shared *mds =3D to_media_device_shared(mdev);
> +	struct media_device_shared_link *link;
> +	struct media_device_shared_link *link_tmp;
> +	int ret =3D 0;
> +
> +	mutex_lock(&media_device_shared_lock);
> +
> +	list_for_each_entry_safe(link, link_tmp, &mds->links, list) {
> +		if (link->source) {
> +			ret =3D media_create_pad_link(link->source, link->source_pad,
> +						=C2=A0=C2=A0=C2=A0 sink, sink_pad,
> +						=C2=A0=C2=A0=C2=A0 flags);
> +			list_del(&link->list);
> +			kfree(link);
> +			goto exit_join_link_sink;
> +		}
> +	}
> +
> +	link =3D kzalloc_obj(*link);
> +	if (!link) {
> +		ret =3D -ENOMEM;
> +		goto exit_join_link_sink;
> +	}
> +
> +	link->sink =3D sink;
> +	link->sink_pad =3D sink_pad;
> +	link->flags =3D flags;
> +	list_add_tail(&link->list, &mds->links);
> +
> +exit_join_link_sink:
> +	mutex_unlock(&media_device_shared_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_device_shared_join_link_sink);
> diff --git a/include/media/mc-shared-graph.h b/include/media/mc-shared-gr=
aph.h
> new file mode 100644
> index 000000000000..487325163f84
> --- /dev/null
> +++ b/include/media/mc-shared-graph.h
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mc-shared-graph.h - Media Controller Shared Graph API
> + *
> + * Copyright (c) 2026 Paul Elder <paul.elder@ideasonboard.com>
> + */
> +
> +/*
> + * This file adds the Media Controller Shared Graph API. This allows dri=
vers
> + * to create shared media graphs or join existing media graphs from othe=
r
> + * drivers, so that they can all be in the same media graph. This allows=
 us to
> + * have more complex media graphs chaining more complex hardware togethe=
r,
> + * instead of simple async subdevs.
> + */
> +
> +#include <linux/types.h>
> +
> +#ifndef _MEDIA_SHARED_GRAPH_H
> +#define _MEDIA_SHARED_GRAPH_H
> +
> +struct device;
> +struct media_device;
> +struct media_entity;
> +
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +/**
> + * media_device_shared_join() - Join or create a new shared media device
> + *
> + * @dev:		struct &device pointer
> + *
> + * This is the entrance function for a device to join or create a new sh=
ared
> + * media device. It searches for an existing shared media device based o=
n the
> + * neighbours in the device's device tree ports node. If found, then thi=
s
> + * functions returns the existing shared media device and joins it. If o=
ne is
> + * not found then one is created and initialized and returned.
> + */
> +struct media_device *media_device_shared_join(struct device *dev);
> +
> +/**
> + * media_device_shared_leave() - Leave the shared media device.
> + *
> + * @mdev:		struct &media_device pointer
> + * @dev:		struct &device pointer
> + *
> + * This function makes the device leave the shared media device. When al=
l
> + * members have left the media device it will be freed.
> + */
> +void media_device_shared_leave(struct media_device *mdev, struct device =
*dev);
> +
> +/**
> + * media_device_shared_join_link_source() - Register a link source in th=
e shared media device
> + *
> + * @mdev: The struct &media_device pointer that is part of a shared medi=
a device
> + * @dev: struct &device pointer
> + * @source: The link source
> + * @source_pad: The pad
> + * @flags: The flags
> + *
> + * This function registers with the shared media device the source part =
of a
> + * link. When the shared media device receives the matching sink part of=
 a link
> + * via media_device_shared_join_link_sink() then the link will be fully =
created.
> + */
> +int media_device_shared_join_link_source(struct media_device *mdev,
> +					 struct device *dev,
> +					 struct media_entity *source,
> +					 u16 source_pad, u32 flags);
> +
> +/**
> + * media_device_shared_join_link_sink() - Register a link sink in the sh=
ared media device
> + *
> + * Same as media_device_shared_join_link_source() but for sink instead o=
f
> + * source.
> + */
> +int media_device_shared_join_link_sink(struct media_device *mdev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct media_entity *sink,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 sink_pad, u32 flags);
> +#else
> +static inline struct media_device *media_device_shared_join(struct devic=
e *dev)
> +{ return NULL; }
> +static inline void media_device_shared_leave(struct media_device *mdev,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev) { }
> +static inline int media_device_shared_join_link_source(struct media_devi=
ce *mdev,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct media_entity *source,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 source_pad, u32 flags) { =
}
> +static inline int media_device_shared_join_link_sink(struct media_device=
 *mdev,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 struct media_entity *sink,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 u16 sink_pad, u32 flags) { }
> +#endif /* CONFIG_MEDIA_CONTROLLER */
> +#endif /* _MEDIA_DEV_SHARED_GRAPH_H */

I've checked the request media ops, and tried to project how request could =
be
placed back into this. The main use of the ops is to extend request structu=
re.
And any kind of scheduling will require that. Though, a scheduler based on
request inside a shared media graph should probably be media graph specific=
.

All in all, it makes me thing that we should plan for something less
generic/storage like, and perhaps allow for for ops by a non-device driver,=
 that
could then further customize scheduling and implement request ?

Nicolas

--=-7gIX5FwH0oLp6mCGmYw/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFpIAAKCRDZQZRRKWBy
9GeJAP990O7+77oLpLzkzLMqWFcqxKMXpVYRgfJHfhwmIqx+zwD+O06yG4kULfnU
8kUa47UwfxuEgkk2Cnbr6dIVrJeRQQQ=
=Rn3d
-----END PGP SIGNATURE-----

--=-7gIX5FwH0oLp6mCGmYw/--

