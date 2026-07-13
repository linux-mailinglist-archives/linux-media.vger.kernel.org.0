Return-Path: <linux-media+bounces-67419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u3eWMa5FVGpEkAMAu9opvQ
	(envelope-from <linux-media+bounces-67419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 03:55:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11860746822
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 03:55:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=kKKTXOg+;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67419-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67419-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 760B8300CBF1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 01:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E98290DBB;
	Mon, 13 Jul 2026 01:55:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5001818CBE1;
	Mon, 13 Jul 2026 01:55:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783907749; cv=none; b=s+z8f4GrXat03tGYR4tRqdUTP7JrwiqgXrafA15ZHhi4lAVhSSogMnnu0SiTYGxeJKjaZWOw0W9+pTH0yNTd+gWgdUxSt1BeFkMlrcpXy1t0XMxPEtb0N/7dj6I73GYW/sD10WorKdL76t7JswddKeFIVU42DSVfk9XCcyahHpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783907749; c=relaxed/simple;
	bh=R8heZzhx0Rbh/T9aeambSHqG3wFIiGP4zx6NIPVOf1w=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iryI+nsbIg52mohBqORCWTj7SFZYpgGvFwLNNdAUNaZFqdN+QBDBC00i2UsUWT5X9cLXCoFEhvCkfJ8wJT75vPS1mhh9SfGVNdUV78Yg/g2eU5uPFAnYeNkmcwK2BAUhTvAt5bjT2kjoFiHkwvWCtG8aWKP8VydFyPlvNv46/GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kKKTXOg+; arc=none smtp.client-ip=213.167.242.64
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:9e15:c3c3:480a:b02e])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DB3AEB2D;
	Mon, 13 Jul 2026 03:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783907683;
	bh=R8heZzhx0Rbh/T9aeambSHqG3wFIiGP4zx6NIPVOf1w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kKKTXOg+ozj7JOq4sbVmFtE8cnDZNwt4iF7X7GMm++vRzd+8Ri4v4ZeM74zy/4pSm
	 zJ5K+1QgTVR2nOSjpRpXeMiLSZFiWFLBMbT9IitsioLenJF3ZR6wgwOcOlKe0iVZrm
	 2uLuFnuHlmkJIkkgXRIBRSJqghaI+r+e87Uq7ioE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e5f16200-3881-4f25-b67d-7053b3b8af19@collabora.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com> <20260619052637.1110672-2-paul.elder@ideasonboard.com> <e5f16200-3881-4f25-b67d-7053b3b8af19@collabora.com>
Subject: Re: [RFC PATCH 1/6] media: mc: Implement shared media graph
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: xuhf@rock-chips.com, stefan.klug@ideasonboard.com, kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org, nicolas.dufresne@collabora.com, ribalda@chromium.org, sakari.ailus@linux.intel.com
To: Michael Riesch <michael.riesch@collabora.com>, laurent.pinchart@ideasonboard.com
Date: Mon, 13 Jul 2026 10:55:29 +0900
Message-ID: <178390772961.8891.12325171786588563297@neptunite.rasen.tech>
User-Agent: alot/0.0.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67419-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,neptunite.rasen.tech:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11860746822

Hi Michael,

Thanks for the review!

Quoting Michael Riesch (2026-07-11 05:23:50)
> Hi Paul,
>=20
> Thanks for your work! And sorry for the long silence.
>=20
> On 6/19/26 07:26, Paul Elder wrote:
> > Currently, a media graph contains a main device whose driver is
> > responsible for creating the media device. We have however recently run
> > into devices that have multiple devices that can quality as a main
> > device. Examples are the RK3588 which has a VICAP and two ISP
> > instances, and another example is the i.MX8MP which has an ISI and two
> > ISP instances. As there is currently no way to reconcile who the main
> > device is in the media device, these setups simple cannot be used
> > simultaneously.
> >=20
> > This patch extends the media controller API with a "shared media graph"
> > framework. This allows drivers to share a media device, thus enabling
> > the setups mentioned above. Instead of owning and creating a media
> > device, drivers can join-or-create a shared media device via the shared
> > media graph API. The matching is done automatically based on the
> > detected endpoints in the device tree.
> >=20
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>=20
> Frenetically-cheered-by: Michael Riesch <michael.riesch@collabora.com>
>=20
> OK, what follows is pretty much a rubberducking session in which I try
> to explain myself the concept you came up with. Possibly there are one
> or two thoughts and/or questions you can use to develop the concept furth=
er.
>=20
> IIUC this is a new API with four calls. There is _join() and _leave()
> that more or less replace the creation and deletion of a media device in
> a V4L2 driver. And there is join_link_source() and join_link_sink() that
> are called for each cross-device connection on the source and sink side,
> respectively.
>=20
> There is one shared media device per disjoint graph in the device tree.
> If a new device calls _join(), the function iterates over all shared
> media devices, iterates over all DT endpoints of the new device, and
> iterates over all members of each shared media device. If the fwnode of
> the parent of the remote endpoint of a certain endpoint of the new
> device equals the fwnode of a certain member of a certain shared media
> device, we found a match. This certain shared media device is then used
> in the driver of the new device. Before that, a member for the new
> device is added to the shared media device.
>=20
> In case no shared media device is found, a new one is created and used.
> A member for the new device is added to the shared device in this case, t=
oo.
>=20
> The actual linking takes place in the _join_link_{sink,source}
> functions, which iterate over the links of the shared media device and
> check whether a link has a pointer to a source (or sink) respectively.
> If a source (or sink) is found, a link is created. Otherwise, a link (in
> the form of a newly introduced data structure, not a media_link) is
> added to the links of a shared media device. The latter somewhat
> corresponds to the v4l2 async notifier mechanism.
>=20
> So far, so good. Even if the genitive construction chain that describes
> the matching above is a bit daunting. All in all I think we are on a
> reasonable path here.

\o/

Yes the overview is right.

>=20
> > [...]
> > +// TODO figure out locking for when multiple drivers touch the media g=
raph;
> > +// maybe macros for shared versions?
> > +struct media_device_shared {
> > +     struct media_device mdev;
> > +     struct list_head members;
> > +     struct list_head links;
> > +
> > +     struct list_head list;
> > +     struct kref refcount;
> > +
> > +     struct device *removed_device;
> > +};
>=20
> [discussed in other thread]
>=20
> > [...]
> > +/* Callers should hold media_device_shared_lock when calling this func=
tion */
> > +static bool __media_device_shared_find_match(struct media_device_share=
d *mds,
> > +                                          struct fwnode_handle *fwnode)
> > +{
> > +     struct media_device_shared_member *member;
> > +     struct fwnode_handle *ep;
> > +     struct fwnode_handle *remote_ep;
> > +     bool match =3D false;
> > +
> > +     // TODO: parse the device tree endpoints graph instead of finding=
 just the
> > +     // first-level neighbours
> > +     fwnode_graph_for_each_endpoint(fwnode, ep) {
> > +             list_for_each_entry(member, &mds->members, list) {
> > +                     remote_ep =3D fwnode_graph_get_remote_port_parent=
(ep);
> > +                     match =3D (member->fwnode =3D=3D remote_ep);
> > +                     fwnode_handle_put(remote_ep);
> > +
> > +                     if (!match)
> > +                             continue;
> > +
> > +                     goto match_complete;
> > +             }
> > +     }
> > +
> > +match_complete:
> > +     fwnode_handle_put(ep);
> > +     return match;
> > +}
>=20
> <rubberducking>
> IIUC there could be devices A -> B -> C that share a DT graph (and thus
> should share a media device), but suppose the probe order is driver A,
> C, B then A would rightfully create a new shared media device, but C
> would not see it and create yet another shared media device. Thus, the
> the find_match() function needs to traverse C -> B -> A to find the
> correct shared media device.
> </rubberducking>

Yeah I guess traversing the graph is kind of a critical feature.

>=20
> Just saying that with one and only one media device to rule them all we
> wouldn't have to deal with this. Another option would be to assume that

Hm yeah that's true; we'd just have a sea of media entities and we can link
whoever we want...

We didn't really discuss that part very hard last time.

> each driver knows to which shared media device it belongs. For example,
> the rkcif driver could be aware that it belongs to the
>     {
>         .id =3D MEDIA_SHARED_ROCKCHIP_CAMERA,
>         .name =3D "Rockchip Camera Subsystem",
>      }

The problem is where would this information go? We can't put it in the driv=
er;
it *must* come from the device tree. And I don't think we can just add a new
property that defines a media subsystem. So I think our only option is to
traverse the endpoint graph in the device tree.

> shared media device. This would reduce the magic above to a lookup
> operation. All that said, it should be feasible of course to traverse
> and find.
>=20
> > [...]
> > +/* Callers should hold media_device_shared_lock when calling this func=
tion */
> > +static struct media_device *__media_device_shared_create(struct device=
 *dev)
> > +{
> > +     struct media_device_shared *mds;
> > +     struct media_device_shared_member *member;
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> > +     int ret;
> > +
> > +     mds =3D kzalloc_obj(*mds);
> > +     if (!mds)
> > +             return NULL;
> > +
> > +     member =3D kzalloc_obj(*member);
> > +     if (!member)
> > +             goto err_free_mds;
> > +
> > +     media_device_init(&mds->mdev);
> > +
> > +     ret =3D media_device_register(&mds->mdev);
> > +     if (ret)
> > +             goto err_free_member;
> > +
> > +     INIT_LIST_HEAD(&mds->members);
> > +     member->dev =3D dev;
> > +     member->fwnode =3D fwnode;
> > +     list_add_tail(&member->list, &mds->members);
>=20
> This can be refactored as this is carried out either way, right?

Yes.

>=20
> > +
> > +     INIT_LIST_HEAD(&mds->links);
> > +
> > +     kref_init(&mds->refcount);
> > +     list_add_tail(&mds->list, &media_device_shared_list);
> > +
> > +     // TODO figure out how to reconcile this with multiple members
> > +     mds->mdev.dev =3D dev;
> > +
> > +     devv_dbg(dev, "%s: Allocated media device with %pfwf at %p\n",
> > +              __func__, fwnode, &mds->mdev);
> > +     return &mds->mdev;
> > +
> > +err_free_member:
> > +     kfree(member);
> > +err_free_mds:
> > +     kfree(mds);
> > +     return NULL;
> > +}
>=20
> OK, what options do we have?!

(Just in general or with respect to this function...?)

>=20
> We could pick one device of many. But based on what criteria? If there
> was a good way to pick one, we could equally pick a driver that
> registers the media device and move on. We conclude that apparently
> that's not the case, otherwise we wouldn't be doing this exercise. Next.

Yes; given that both rkcif and rkisp2 could potentially exist on devices wh=
ere
the other does not, this is not realistically doable. (I mean if we really =
want
to we could but it would be a high-cost mess)

>=20
> We could introduce a pseudo device that provides the umbrella. But
> again, that would be close to creating an umbrella driver that registers
> the media device. And at some point we decided not to do that. Next.

Similar problem as above (can't choose main driver), the one above that (no
place to put group member list).

>=20
> We move from the notion of a media **device** to a media **graph**
> (which is in alignment with the subject of this mail). The media graph

I always thought that media device and media graph were the
same/interchangable...

> is something owned by the subsystem, not by any device/driver. The media
> entities therein, however, could be owned by devices/drivers. Maybe
> struct media_entity should feature a struct device *dev; member.
>=20
> I could imagine that the dev member is used mostly for
> dev_{info,err,...}, we would need to get rid of them. If there is

afaict that's the case.

> actually something with devm_ then this requires more thought.
>=20
> IMHO the third option is the way to go.

I'm glad we agree :)

>=20
> > +
> > +// TODO figure out how to resolve the identifiers (model, driver name,=
 etc);
> > +// atm it's racy and whoever gets it last wins
> > +struct media_device *media_device_shared_join(struct device *dev)
> > +{
> > +     struct media_device *mdev;
> > +
> > +     mutex_lock(&media_device_shared_lock);
> > +
> > +     mdev =3D __media_device_shared_get(dev);
> > +     if (!!mdev) {
> > +             dev_dbg(dev, "%s: found media device for %pfwf", __func__=
, dev_fwnode(dev));
> > +             mutex_unlock(&media_device_shared_lock);
> > +             return mdev;
> > +     }
> > +
> > +     mdev =3D __media_device_shared_create(dev);
> > +     if (!mdev) {
> > +             dev_warn(dev, "%s: failed to create media device for %pfw=
f", __func__, dev_fwnode(dev));
> > +             mutex_unlock(&media_device_shared_lock);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +     dev_dbg(dev, "%s: created media device for %pfwf", __func__, dev_=
fwnode(dev));
> > +     mutex_unlock(&media_device_shared_lock);
> > +     return mdev;
> > +}
> > +EXPORT_SYMBOL_GPL(media_device_shared_join);
>=20
> Similarly, we have to bid farewell to the notion of a media **device**.
> Can we agree on making
>     struct device *dev;
>     char driver_name[32];
>     char serial[40];
>     char bus_info[32];
>     u32 hw_revision;
> optional for shared media devices (or, better, graphs)?

Well I think driver_name and (maybe) hw_revision are still useful to have. =
The
only problem is I have no clue where to put/get that information.

The only good-ish idea I could come up with was something like
"shared_media_graph_{board compatible}_{smallest base address of media graph
member}". So like "shared_media_graph_rockchip,rk3588_fdcb0000" for the rk3=
588
since between the csi receivers and vicap and isp, the isp has the smallest
address. That way:
- the information comes from the device tree
- the name is persistent
- it can identify separate shared media graphs on the same platform

idk about the hardware revision though. I think probably only driver match =
data
can hold that information. But then we'd probably have duplicate information
since otherwise if one of the member drivers doesn't probe then we'd be mis=
sing
the hw_revision. Or maybe we don't care about hardware revision since it
doesn't make sense for the shared media graph part and it only makes sense =
for
the individual IP cores. In which case that information is lost unless we m=
ove
it somewhere else. Or maybe it's not used anyway so we can indeed just drop=
 it.

>=20
> I could imagine, though, that we provide some minimally meaningful info
> in a struct
>     {
>         .id =3D MEDIA_SHARED_ROCKCHIP_CAMERA,
>         .name =3D "Rockchip Camera Subsystem",
>         .driver_name =3D "rkcss",
>         .hw_revision =3D 42,
>         ...
>      }

Same problem as above: there's no reasonable place to put this information.

> and apply that info here.
>=20
> > [...]
> > +int media_device_shared_join_link_source(struct media_device *mdev,
> > +                                      struct device *dev,
> > +                                      struct media_entity *source,
> > +                                      u16 source_pad, u32 flags)
> > +{
> > +     struct media_device_shared *mds =3D to_media_device_shared(mdev);
> > +     struct media_device_shared_link *link;
> > +     struct media_device_shared_link *link_tmp;
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&media_device_shared_lock);
> > +
> > +     /*
> > +      * TODO Figure out flags. Should we use greatest common denominat=
or? Or
> > +      * prioritize sink? Or whoever wins the race? For now we just tak=
e the flags
> > +      * from the sink.
>=20
> The phrase "whoever wins the race" is surely gold in the documentation
> ;-) I guess it should be same as with any _notifier_bound setup, and

Hehe :)

> IIUC it's typically the sink that passes some flags to
> v4l2_create_fwnode_links_to_pad. So prioritizing the sink seems reasonabl=
e.

Ok good.

>=20
> > +      *
> > +      * TODO Figure out how to actually do the matching. For now we ju=
st match
> > +      * whoever comes in first. This works with the simple example we'=
re running
> > +      * with now (rkcif + one rkisp2) but with setups with multiple co=
pies of
> > +      * hardware this will cause problems, like with rkcif + two rkisp=
2 and
> > +      * imx8-isi + two rkisp1.
> > +      */
>=20
> In the end, shouldn't this follow whatever v4l2_async does? Not exactly
> sure, but I think storing a struct media_entity * and a struct
> fwnode_endpoint * for side A should do the trick. Side B would appear
> later with the second struct fwnode_endpoint. The check would then be if
> fwnode_graph_get_remote_endpoint(fwnode_A) =3D=3D fwnode_B (+ maybe vice
> versa). The link would then be filled with media_entity_{A,B} and
> media_entity_{A,B}->ops.get_fwnode_pad(media_entity_{A,B},
> fwnode_{A,B}). Obviously we need some selector that tells us whether
> A=3Dsource and B=3Dsink or vice versa for that.

Oh, good idea!

>=20
> > +     list_for_each_entry_safe(link, link_tmp, &mds->links, list) {
> > +             if (link->sink) {
> > +                     ret =3D media_create_pad_link(source, source_pad,
> > +                                                 link->sink, link->sin=
k_pad,
> > +                                                 link->flags);
> > +                     list_del(&link->list);
> > +                     kfree(link);
> > +                     goto exit_join_link_source;
> > +             }
> > +     }
> > +
> > +     link =3D kzalloc_obj(*link);
> > +     if (!link) {
> > +             ret =3D -ENOMEM;
> > +             goto exit_join_link_source;
> > +     }
> > +
> > +     link->source =3D source;
> > +     link->source_pad =3D source_pad;
> > +     link->flags =3D flags;
> > +     list_add_tail(&link->list, &mds->links);
> > +
> > +exit_join_link_source:
> > +     mutex_unlock(&media_device_shared_lock);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(media_device_shared_join_link_source);
> > +
> > +// TODO deduplicate from above
>=20
> Should be possible to have some helper with (..., bool is_source) and
> then two nice functions that are exposed to the public.
> To start the bike shedding: Maybe
> media_device_shared_register_{source,sink}?

Yeah that sounds like a good idea.


Thanks,

Paul

>=20
> > [...]
>=20
> Thanks and best regards,
> Michael

