Return-Path: <linux-media+bounces-65530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l+VbLg+0O2pObggAu9opvQ
	(envelope-from <linux-media+bounces-65530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:40:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 191656BD6E1
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:40:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=syg4sbhd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65530-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65530-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FBB6302ACD7
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3248B2C326F;
	Wed, 24 Jun 2026 10:39:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D9248F72;
	Wed, 24 Jun 2026 10:39:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297598; cv=none; b=RHigO7FDMRGuxRyg4AwaLV3fbHyhHXSAXfB6oTIz71XqAFGA937Eh4KCwvWbQ2hIeo4uNmLWRjw0fTSRcqWoNg2GwLqSuVHOWzXMwwvsOxjAnIutB3j306jEzSZ5gAGkaDABkfAuQgHAJzOUV2hui7Xz9jpr2kDzBFTb/sIMZus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297598; c=relaxed/simple;
	bh=thCjLnMnHDEA+uaCidNvZgy5TW4QwT+r7j77chD0W0g=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=J3eLtuMzt8vcd5mbQ8rPEvrVnaV70evqhC1y795vK+HSDzU0kumVdKokl7NRskKs56bGGYI3//cpzK70C4mNGDBJ6WR464nqn213I3jsQPpLgTly4u5lF76/tV2zOTqYeU7l+tRYKMdgj6QPKNljV2dmryzzn315aSafRz1z5kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=syg4sbhd; arc=none smtp.client-ip=213.167.242.64
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DD70236;
	Wed, 24 Jun 2026 12:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782297548;
	bh=thCjLnMnHDEA+uaCidNvZgy5TW4QwT+r7j77chD0W0g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=syg4sbhdM0lwnrUa4lFbOd1+Ak9feDj9YAPLz16X9kqmtjr2ORGmgPrTddn8IabEb
	 GNja17mQJga10ONStA3L2E5tOBzdAvGFuBwM9YzWkVCA8ryejYEzQTJ8aKhbr0yUp5
	 EdN4DfzoHNwL0D8lwuNfUjyyoSE9z+JEGbBTjHpM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260619052637.1110672-2-paul.elder@ideasonboard.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com> <20260619052637.1110672-2-paul.elder@ideasonboard.com>
Subject: Re: [RFC PATCH 1/6] media: mc: Implement shared media graph
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, michael.riesch@collabora.com, xuhf@rock-chips.com, stefan.klug@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org, nicolas.dufresne@collabora.com, ribalda@chromium.org, sakari.ailus@linux.intel.com
To: Paul Elder <paul.elder@ideasonboard.com>, laurent.pinchart@ideasonboard.com
Date: Wed, 24 Jun 2026 11:39:44 +0100
Message-ID: <178229758404.3075020.12553514371020830845@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65530-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:paul.elder@ideasonboard.com,m:michael.riesch@collabora.com,m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,ping.linuxembedded.co.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 191656BD6E1

Hi Paul,

I'm taking a first read through, some  comments inline, but not
necessarily a full review:

Quoting Paul Elder (2026-06-19 06:26:28)
> Currently, a media graph contains a main device whose driver is
> responsible for creating the media device. We have however recently run
> into devices that have multiple devices that can quality as a main

s/quality/qualify/

> device. Examples are the RK3588 which has a VICAP and two ISP
> instances, and another example is the i.MX8MP which has an ISI and two
> ISP instances. As there is currently no way to reconcile who the main
> device is in the media device, these setups simple cannot be used
> simultaneously.

I'm very excited to see how we could apply this to the NXP i.MX8MP to
resolve the ISI+ISP issue!


> This patch extends the media controller API with a "shared media graph"
> framework. This allows drivers to share a media device, thus enabling
> the setups mentioned above. Instead of owning and creating a media
> device, drivers can join-or-create a shared media device via the shared
> media graph API. The matching is done automatically based on the
> detected endpoints in the device tree.

Sounds great! I'll read on...

>=20
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  drivers/media/mc/Makefile          |   2 +-
>  drivers/media/mc/mc-shared-graph.c | 335 +++++++++++++++++++++++++++++
>  include/media/mc-shared-graph.h    |  92 ++++++++
>  3 files changed, 428 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/mc/mc-shared-graph.c
>  create mode 100644 include/media/mc-shared-graph.h
>=20
> diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
> index 2b7af42ba59c..1d502fdc52ad 100644
> --- a/drivers/media/mc/Makefile
> +++ b/drivers/media/mc/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
>  mc-objs        :=3D mc-device.o mc-devnode.o mc-entity.o \
> -          mc-request.o
> +          mc-request.o mc-shared-graph.o
> =20
>  ifneq ($(CONFIG_USB),)
>         mc-objs +=3D mc-dev-allocator.o
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
> + * to create shared media graphs or join existing media graphs from other
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
> +       struct device *dev;
> +       struct fwnode_handle *fwnode;
> +       struct list_head list;
> +};
> +
> +struct media_device_shared_link {
> +       struct media_entity *source;
> +       u16 source_pad;
> +       struct media_entity *sink;
> +       u16 sink_pad;
> +       u32 flags;
> +       struct list_head list;
> +};
> +
> +// TODO figure out locking for when multiple drivers touch the media gra=
ph;
> +// maybe macros for shared versions?

Do you mean for when drivers are trying to change link state directly?

> +struct media_device_shared {
> +       struct media_device mdev;
> +       struct list_head members;
> +       struct list_head links;
> +
> +       struct list_head list;
> +       struct kref refcount;
> +
> +       struct device *removed_device;
> +};
> +
> +static inline struct media_device_shared *
> +to_media_device_shared(struct media_device *mdev)
> +{
> +       return container_of(mdev, struct media_device_shared, mdev);
> +}
> +
> +static void media_device_shared_release(struct kref *kref)
> +{
> +       struct media_device_shared *mds =3D
> +               container_of(kref, struct media_device_shared, refcount);
> +
> +       dev_dbg(mds->removed_device, "%s: releasing Media Device\n", __fu=
nc__);
> +
> +       mutex_lock(&media_device_shared_lock);
> +
> +       media_device_unregister(&mds->mdev);
> +       media_device_cleanup(&mds->mdev);
> +
> +       list_del(&mds->list);
> +       mutex_unlock(&media_device_shared_lock);
> +
> +       kfree(mds);
> +}
> +
> +/* Callers should hold media_device_shared_lock when calling this functi=
on */

Lets add a lockdep_assert then?


> +static bool __media_device_shared_find_match(struct media_device_shared =
*mds,
> +                                            struct fwnode_handle *fwnode)
> +{
> +       struct media_device_shared_member *member;
> +       struct fwnode_handle *ep;
> +       struct fwnode_handle *remote_ep;
> +       bool match =3D false;
> +

is it just as easy as:

	lockdep_assert_held(&media_device_shared_lock);
?

> +       // TODO: parse the device tree endpoints graph instead of finding=
 just the
> +       // first-level neighbours
> +       fwnode_graph_for_each_endpoint(fwnode, ep) {
> +               list_for_each_entry(member, &mds->members, list) {
> +                       remote_ep =3D fwnode_graph_get_remote_port_parent=
(ep);
> +                       match =3D (member->fwnode =3D=3D remote_ep);
> +                       fwnode_handle_put(remote_ep);
> +
> +                       if (!match)
> +                               continue;
> +
> +                       goto match_complete;
> +               }
> +       }
> +
> +match_complete:
> +       fwnode_handle_put(ep);
> +       return match;
> +}
> +
> +/* Callers should hold media_device_shared_lock when calling this functi=
on */

Lets add a lockdep check too then :D (same everywhere/anywhere it's
needed)


> +static struct media_device *__media_device_shared_get(struct device *dev)
> +{
> +       struct media_device_shared *mds;
> +       struct media_device_shared_member *member;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> +       bool ret;
> +
> +       dev_dbg(dev, "%s: searching for media device for %pfwf", __func__=
, fwnode);
> +
> +       list_for_each_entry(mds, &media_device_shared_list, list) {
> +               ret =3D __media_device_shared_find_match(mds, fwnode);
> +               if (ret)
> +                       break;
> +       }
> +
> +       if (!ret)
> +               return NULL;
> +
> +       member =3D kzalloc_obj(*member);
> +       if (!member)
> +               return NULL;
> +
> +       member->dev =3D dev;
> +       member->fwnode =3D fwnode;
> +       list_add_tail(&member->list, &mds->members);
> +       kref_get(&mds->refcount);
> +
> +       dev_dbg(dev, "%s: %pfwf joined media device of %pfwf",
> +               __func__, fwnode,
> +               list_first_entry(&mds->members, struct media_device_share=
d_member, list)->fwnode);
> +
> +       return &mds->mdev;
> +}
> +
> +/* Callers should hold media_device_shared_lock when calling this functi=
on */
> +static struct media_device *__media_device_shared_create(struct device *=
dev)
> +{
> +       struct media_device_shared *mds;
> +       struct media_device_shared_member *member;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> +       int ret;
> +
> +       mds =3D kzalloc_obj(*mds);
> +       if (!mds)
> +               return NULL;
> +
> +       member =3D kzalloc_obj(*member);
> +       if (!member)
> +               goto err_free_mds;
> +
> +       media_device_init(&mds->mdev);
> +
> +       ret =3D media_device_register(&mds->mdev);
> +       if (ret)
> +               goto err_free_member;
> +
> +       INIT_LIST_HEAD(&mds->members);
> +       member->dev =3D dev;
> +       member->fwnode =3D fwnode;
> +       list_add_tail(&member->list, &mds->members);
> +
> +       INIT_LIST_HEAD(&mds->links);
> +
> +       kref_init(&mds->refcount);
> +       list_add_tail(&mds->list, &media_device_shared_list);
> +
> +       // TODO figure out how to reconcile this with multiple members

Aha, right - becuse the 'media_device dev' becomes whoever registers first.
I wonder where it's actually used, and maybe that's ok ?

> +       mds->mdev.dev =3D dev;
> +
> +       devv_dbg(dev, "%s: Allocated media device with %pfwf at %p\n",
> +                __func__, fwnode, &mds->mdev);
> +       return &mds->mdev;
> +
> +err_free_member:
> +       kfree(member);
> +err_free_mds:
> +       kfree(mds);
> +       return NULL;
> +}
> +
> +// TODO figure out how to resolve the identifiers (model, driver name, e=
tc);
> +// atm it's racy and whoever gets it last wins

Maybe that's something we need to pass or set up explicitly then, so
it's clear it's a 'specific graph'

Would this give us a way to represent the hardware in a new form - i.e.
thinking about IMX8MP - the existing graph wouldn't be available - so it
wouldn't be any worry from a UABI perspective because it's just a whole
new interface/media-device name....



> +struct media_device *media_device_shared_join(struct device *dev)
> +{
> +       struct media_device *mdev;
> +
> +       mutex_lock(&media_device_shared_lock);
> +
> +       mdev =3D __media_device_shared_get(dev);
> +       if (!!mdev) {
> +               dev_dbg(dev, "%s: found media device for %pfwf", __func__=
, dev_fwnode(dev));
> +               mutex_unlock(&media_device_shared_lock);
> +               return mdev;
> +       }
> +
> +       mdev =3D __media_device_shared_create(dev);
> +       if (!mdev) {
> +               dev_warn(dev, "%s: failed to create media device for %pfw=
f", __func__, dev_fwnode(dev));
> +               mutex_unlock(&media_device_shared_lock);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       dev_dbg(dev, "%s: created media device for %pfwf", __func__, dev_=
fwnode(dev));
> +       mutex_unlock(&media_device_shared_lock);
> +       return mdev;
> +}
> +EXPORT_SYMBOL_GPL(media_device_shared_join);
> +
> +void media_device_shared_leave(struct media_device *mdev, struct device =
*dev)
> +{
> +       struct media_device_shared *mds =3D to_media_device_shared(mdev);
> +       struct media_device_shared_member *member;
> +       struct media_device_shared_member *member_tmp;
> +       bool removed =3D false;
> +
> +       mutex_lock(&media_device_shared_lock);
> +
> +       list_for_each_entry_safe(member, member_tmp, &mds->members, list)=
 {
> +               if (member->dev =3D=3D dev) {
> +                       list_del(&member->list);
> +                       kfree(member);
> +                       removed =3D true;
> +               }
> +       }
> +
> +       if (!removed)
> +               dev_err(dev, "%s: %pfwf trying to leave from graph in whi=
ch not a member",
> +                       __func__, dev_fwnode(dev));
> +
> +       mds->removed_device =3D dev;
> +       mutex_unlock(&media_device_shared_lock);
> +       kref_put(&mds->refcount, media_device_shared_release);
> +}
> +EXPORT_SYMBOL_GPL(media_device_shared_leave);
> +
> +int media_device_shared_join_link_source(struct media_device *mdev,
> +                                        struct device *dev,
> +                                        struct media_entity *source,
> +                                        u16 source_pad, u32 flags)
> +{
> +       struct media_device_shared *mds =3D to_media_device_shared(mdev);
> +       struct media_device_shared_link *link;
> +       struct media_device_shared_link *link_tmp;
> +       int ret =3D 0;
> +
> +       mutex_lock(&media_device_shared_lock);
> +
> +       /*
> +        * TODO Figure out flags. Should we use greatest common denominat=
or? Or
> +        * prioritize sink? Or whoever wins the race? For now we just tak=
e the flags
> +        * from the sink.
> +        *
> +        * TODO Figure out how to actually do the matching. For now we ju=
st match
> +        * whoever comes in first. This works with the simple example we'=
re running
> +        * with now (rkcif + one rkisp2) but with setups with multiple co=
pies of
> +        * hardware this will cause problems, like with rkcif + two rkisp=
2 and
> +        * imx8-isi + two rkisp1.
> +        */
> +       list_for_each_entry_safe(link, link_tmp, &mds->links, list) {
> +               if (link->sink) {
> +                       ret =3D media_create_pad_link(source, source_pad,
> +                                                   link->sink, link->sin=
k_pad,
> +                                                   link->flags);
> +                       list_del(&link->list);
> +                       kfree(link);
> +                       goto exit_join_link_source;
> +               }
> +       }
> +
> +       link =3D kzalloc_obj(*link);
> +       if (!link) {
> +               ret =3D -ENOMEM;
> +               goto exit_join_link_source;
> +       }
> +
> +       link->source =3D source;
> +       link->source_pad =3D source_pad;
> +       link->flags =3D flags;
> +       list_add_tail(&link->list, &mds->links);
> +
> +exit_join_link_source:
> +       mutex_unlock(&media_device_shared_lock);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_device_shared_join_link_source);
> +
> +// TODO deduplicate from above

Indeed, it does look like an opportunity.

> +int media_device_shared_join_link_sink(struct media_device *mdev,
> +                                      struct device *dev,
> +                                      struct media_entity *sink,
> +                                      u16 sink_pad, u32 flags)
> +{
> +       struct media_device_shared *mds =3D to_media_device_shared(mdev);
> +       struct media_device_shared_link *link;
> +       struct media_device_shared_link *link_tmp;
> +       int ret =3D 0;
> +
> +       mutex_lock(&media_device_shared_lock);
> +
> +       list_for_each_entry_safe(link, link_tmp, &mds->links, list) {
> +               if (link->source) {
> +                       ret =3D media_create_pad_link(link->source, link-=
>source_pad,
> +                                                   sink, sink_pad,
> +                                                   flags);
> +                       list_del(&link->list);
> +                       kfree(link);
> +                       goto exit_join_link_sink;
> +               }
> +       }
> +
> +       link =3D kzalloc_obj(*link);
> +       if (!link) {
> +               ret =3D -ENOMEM;
> +               goto exit_join_link_sink;
> +       }
> +
> +       link->sink =3D sink;
> +       link->sink_pad =3D sink_pad;
> +       link->flags =3D flags;
> +       list_add_tail(&link->list, &mds->links);
> +
> +exit_join_link_sink:
> +       mutex_unlock(&media_device_shared_lock);
> +       return ret;
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
> + * to create shared media graphs or join existing media graphs from other
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
> + * @dev:               struct &device pointer
> + *
> + * This is the entrance function for a device to join or create a new sh=
ared
> + * media device. It searches for an existing shared media device based o=
n the
> + * neighbours in the device's device tree ports node. If found, then this
> + * functions returns the existing shared media device and joins it. If o=
ne is
> + * not found then one is created and initialized and returned.
> + */
> +struct media_device *media_device_shared_join(struct device *dev);
> +
> +/**
> + * media_device_shared_leave() - Leave the shared media device.
> + *
> + * @mdev:              struct &media_device pointer
> + * @dev:               struct &device pointer
> + *
> + * This function makes the device leave the shared media device. When all
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
> +                                        struct device *dev,
> +                                        struct media_entity *source,
> +                                        u16 source_pad, u32 flags);
> +
> +/**
> + * media_device_shared_join_link_sink() - Register a link sink in the sh=
ared media device
> + *
> + * Same as media_device_shared_join_link_source() but for sink instead of
> + * source.
> + */
> +int media_device_shared_join_link_sink(struct media_device *mdev,
> +                                      struct device *dev,
> +                                      struct media_entity *sink,
> +                                      u16 sink_pad, u32 flags);
> +#else
> +static inline struct media_device *media_device_shared_join(struct devic=
e *dev)
> +{ return NULL; }
> +static inline void media_device_shared_leave(struct media_device *mdev,
> +                                            struct device *dev) { }
> +static inline int media_device_shared_join_link_source(struct media_devi=
ce *mdev,
> +                                                      struct device *dev,
> +                                                      struct media_entit=
y *source,
> +                                                      u16 source_pad, u3=
2 flags) { }
> +static inline int media_device_shared_join_link_sink(struct media_device=
 *mdev,
> +                                                    struct device *dev,
> +                                                    struct media_entity =
*sink,
> +                                                    u16 sink_pad, u32 fl=
ags) { }

Should these two stubs which return an int return an error code? -ENODEV or=
 such ?


> +#endif /* CONFIG_MEDIA_CONTROLLER */
> +#endif /* _MEDIA_DEV_SHARED_GRAPH_H */
> --=20
> 2.47.2
>

