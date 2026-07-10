Return-Path: <linux-media+bounces-67317-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uPt5BzpVUWpdCgMAu9opvQ
	(envelope-from <linux-media+bounces-67317-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 22:25:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7876973E384
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 22:25:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=jpNDpTqS;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67317-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67317-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 118623059B87
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 20:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7382C39EF32;
	Fri, 10 Jul 2026 20:24:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78C39C013;
	Fri, 10 Jul 2026 20:24:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715058; cv=pass; b=P4lG6BXS6X7wILEMEIFMl55rPDgNz792Zhesf0SRRrilVzOIqIgfFVUlWlkRghVw5pVgn/goSFl59hmHQMtJcXM1oXZ4smuT9Sab5JVBGCZL6e7/xFV062pVBlFfNQzpCvGwOPY+JvopqNJ72qRwNtHcjOiD/2/TT6V7qKqJuMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715058; c=relaxed/simple;
	bh=M0+26CIehOIVZVZlFZK4T/DydH+j2Gg2eHa6D3TjGbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maor2HNYUO7/thsXWpm4it0DUHKobCfQ6rTS7kiaFXvIQVRTH2JRbw4D+hrOt4VSyX3bmH6inErAFOMigliHOb74VlQcRUD8BszYJq/5ttqlNh6oZ9qycOHVQdSic/dBBjPHPOgkJYtU8Nqkc2mXgPn90BUFa8LfqJIcn1/MgvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=jpNDpTqS; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1783715038; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jUjpdVZhPhzUXCFo7bCRxYua6FPMdA/xKfjDDX1rmlCTnIyDUkEGiT4qVkurhJk5xYgAfcqukISgO5fc49jPyV3WP0WVwpep5gvMI4oTUuWMZNrnecasrw/g2M2zn3lNkURVVAkFepzhPhaKZsguV/ZYfxGRTegmJGVwvvOKqSc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783715038; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DKM1+ABif5rO1Gu8On7VVFamS/ERgEgE9dnMh/k4QPE=; 
	b=LkD2pXfMuWyzocEAoeHUtxbdBbM18JjmC8fAHFt1NJz0vv/J36FsK/GYYnjPKTv9NcqKfdYdWcrcmtcDdUhjGCfzpPEnGCz9dJTO62laSKYICvvueqZmXP8FFykdH5wj5erAQz1Vj6VKV1pg8+ZTKf403oFbg/SIHP2saL4VJ6I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783715038;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DKM1+ABif5rO1Gu8On7VVFamS/ERgEgE9dnMh/k4QPE=;
	b=jpNDpTqS87tT8bMsqL72Nfm8E3LrfIaxvX9SYnLqheusBrJmLrUosXrbJtckxD1h
	/yBnjB/WuL1UNMDkftAGZNVJFTFLgIthI7PseagWSiQuAzHNX5xWheu7w/B1cw3yaCe
	uCO/1jKQ0bPJWwKgU0Q5HfBsu1VHzi5bMuPbESL4=
Received: by mx.zohomail.com with SMTPS id 1783715036140704.6625594278408;
	Fri, 10 Jul 2026 13:23:56 -0700 (PDT)
Message-ID: <e5f16200-3881-4f25-b67d-7053b3b8af19@collabora.com>
Date: Fri, 10 Jul 2026 22:23:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] media: mc: Implement shared media graph
To: Paul Elder <paul.elder@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com
Cc: xuhf@rock-chips.com, stefan.klug@ideasonboard.com,
 kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com,
 jacopo.mondi@ideasonboard.com, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org,
 nicolas.dufresne@collabora.com, ribalda@chromium.org,
 sakari.ailus@linux.intel.com
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
 <20260619052637.1110672-2-paul.elder@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260619052637.1110672-2-paul.elder@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67317-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:paul.elder@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7876973E384

Hi Paul,

Thanks for your work! And sorry for the long silence.

On 6/19/26 07:26, Paul Elder wrote:
> Currently, a media graph contains a main device whose driver is
> responsible for creating the media device. We have however recently run
> into devices that have multiple devices that can quality as a main
> device. Examples are the RK3588 which has a VICAP and two ISP
> instances, and another example is the i.MX8MP which has an ISI and two
> ISP instances. As there is currently no way to reconcile who the main
> device is in the media device, these setups simple cannot be used
> simultaneously.
> 
> This patch extends the media controller API with a "shared media graph"
> framework. This allows drivers to share a media device, thus enabling
> the setups mentioned above. Instead of owning and creating a media
> device, drivers can join-or-create a shared media device via the shared
> media graph API. The matching is done automatically based on the
> detected endpoints in the device tree.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Frenetically-cheered-by: Michael Riesch <michael.riesch@collabora.com>

OK, what follows is pretty much a rubberducking session in which I try
to explain myself the concept you came up with. Possibly there are one
or two thoughts and/or questions you can use to develop the concept further.

IIUC this is a new API with four calls. There is _join() and _leave()
that more or less replace the creation and deletion of a media device in
a V4L2 driver. And there is join_link_source() and join_link_sink() that
are called for each cross-device connection on the source and sink side,
respectively.

There is one shared media device per disjoint graph in the device tree.
If a new device calls _join(), the function iterates over all shared
media devices, iterates over all DT endpoints of the new device, and
iterates over all members of each shared media device. If the fwnode of
the parent of the remote endpoint of a certain endpoint of the new
device equals the fwnode of a certain member of a certain shared media
device, we found a match. This certain shared media device is then used
in the driver of the new device. Before that, a member for the new
device is added to the shared media device.

In case no shared media device is found, a new one is created and used.
A member for the new device is added to the shared device in this case, too.

The actual linking takes place in the _join_link_{sink,source}
functions, which iterate over the links of the shared media device and
check whether a link has a pointer to a source (or sink) respectively.
If a source (or sink) is found, a link is created. Otherwise, a link (in
the form of a newly introduced data structure, not a media_link) is
added to the links of a shared media device. The latter somewhat
corresponds to the v4l2 async notifier mechanism.

So far, so good. Even if the genitive construction chain that describes
the matching above is a bit daunting. All in all I think we are on a
reasonable path here.

> [...]
> +// TODO figure out locking for when multiple drivers touch the media graph;
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

[discussed in other thread]

> [...]
> +/* Callers should hold media_device_shared_lock when calling this function */
> +static bool __media_device_shared_find_match(struct media_device_shared *mds,
> +					     struct fwnode_handle *fwnode)
> +{
> +	struct media_device_shared_member *member;
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *remote_ep;
> +	bool match = false;
> +
> +	// TODO: parse the device tree endpoints graph instead of finding just the
> +	// first-level neighbours
> +	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +		list_for_each_entry(member, &mds->members, list) {
> +			remote_ep = fwnode_graph_get_remote_port_parent(ep);
> +			match = (member->fwnode == remote_ep);
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

<rubberducking>
IIUC there could be devices A -> B -> C that share a DT graph (and thus
should share a media device), but suppose the probe order is driver A,
C, B then A would rightfully create a new shared media device, but C
would not see it and create yet another shared media device. Thus, the
the find_match() function needs to traverse C -> B -> A to find the
correct shared media device.
</rubberducking>

Just saying that with one and only one media device to rule them all we
wouldn't have to deal with this. Another option would be to assume that
each driver knows to which shared media device it belongs. For example,
the rkcif driver could be aware that it belongs to the
    {
        .id = MEDIA_SHARED_ROCKCHIP_CAMERA,
        .name = "Rockchip Camera Subsystem",
     }
shared media device. This would reduce the magic above to a lookup
operation. All that said, it should be feasible of course to traverse
and find.

> [...]
> +/* Callers should hold media_device_shared_lock when calling this function */
> +static struct media_device *__media_device_shared_create(struct device *dev)
> +{
> +	struct media_device_shared *mds;
> +	struct media_device_shared_member *member;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	int ret;
> +
> +	mds = kzalloc_obj(*mds);
> +	if (!mds)
> +		return NULL;
> +
> +	member = kzalloc_obj(*member);
> +	if (!member)
> +		goto err_free_mds;
> +
> +	media_device_init(&mds->mdev);
> +
> +	ret = media_device_register(&mds->mdev);
> +	if (ret)
> +		goto err_free_member;
> +
> +	INIT_LIST_HEAD(&mds->members);
> +	member->dev = dev;
> +	member->fwnode = fwnode;
> +	list_add_tail(&member->list, &mds->members);

This can be refactored as this is carried out either way, right?

> +
> +	INIT_LIST_HEAD(&mds->links);
> +
> +	kref_init(&mds->refcount);
> +	list_add_tail(&mds->list, &media_device_shared_list);
> +
> +	// TODO figure out how to reconcile this with multiple members
> +	mds->mdev.dev = dev;
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

OK, what options do we have?!

We could pick one device of many. But based on what criteria? If there
was a good way to pick one, we could equally pick a driver that
registers the media device and move on. We conclude that apparently
that's not the case, otherwise we wouldn't be doing this exercise. Next.

We could introduce a pseudo device that provides the umbrella. But
again, that would be close to creating an umbrella driver that registers
the media device. And at some point we decided not to do that. Next.

We move from the notion of a media **device** to a media **graph**
(which is in alignment with the subject of this mail). The media graph
is something owned by the subsystem, not by any device/driver. The media
entities therein, however, could be owned by devices/drivers. Maybe
struct media_entity should feature a struct device *dev; member.

I could imagine that the dev member is used mostly for
dev_{info,err,...}, we would need to get rid of them. If there is
actually something with devm_ then this requires more thought.

IMHO the third option is the way to go.

> +
> +// TODO figure out how to resolve the identifiers (model, driver name, etc);
> +// atm it's racy and whoever gets it last wins
> +struct media_device *media_device_shared_join(struct device *dev)
> +{
> +	struct media_device *mdev;
> +
> +	mutex_lock(&media_device_shared_lock);
> +
> +	mdev = __media_device_shared_get(dev);
> +	if (!!mdev) {
> +		dev_dbg(dev, "%s: found media device for %pfwf", __func__, dev_fwnode(dev));
> +		mutex_unlock(&media_device_shared_lock);
> +		return mdev;
> +	}
> +
> +	mdev = __media_device_shared_create(dev);
> +	if (!mdev) {
> +		dev_warn(dev, "%s: failed to create media device for %pfwf", __func__, dev_fwnode(dev));
> +		mutex_unlock(&media_device_shared_lock);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	dev_dbg(dev, "%s: created media device for %pfwf", __func__, dev_fwnode(dev));
> +	mutex_unlock(&media_device_shared_lock);
> +	return mdev;
> +}
> +EXPORT_SYMBOL_GPL(media_device_shared_join);

Similarly, we have to bid farewell to the notion of a media **device**.
Can we agree on making
    struct device *dev;
    char driver_name[32];
    char serial[40];
    char bus_info[32];
    u32 hw_revision;
optional for shared media devices (or, better, graphs)?

I could imagine, though, that we provide some minimally meaningful info
in a struct
    {
        .id = MEDIA_SHARED_ROCKCHIP_CAMERA,
        .name = "Rockchip Camera Subsystem",
        .driver_name = "rkcss",
        .hw_revision = 42,
        ...
     }
and apply that info here.

> [...]
> +int media_device_shared_join_link_source(struct media_device *mdev,
> +					 struct device *dev,
> +					 struct media_entity *source,
> +					 u16 source_pad, u32 flags)
> +{
> +	struct media_device_shared *mds = to_media_device_shared(mdev);
> +	struct media_device_shared_link *link;
> +	struct media_device_shared_link *link_tmp;
> +	int ret = 0;
> +
> +	mutex_lock(&media_device_shared_lock);
> +
> +	/*
> +	 * TODO Figure out flags. Should we use greatest common denominator? Or
> +	 * prioritize sink? Or whoever wins the race? For now we just take the flags
> +	 * from the sink.

The phrase "whoever wins the race" is surely gold in the documentation
;-) I guess it should be same as with any _notifier_bound setup, and
IIUC it's typically the sink that passes some flags to
v4l2_create_fwnode_links_to_pad. So prioritizing the sink seems reasonable.

> +	 *
> +	 * TODO Figure out how to actually do the matching. For now we just match
> +	 * whoever comes in first. This works with the simple example we're running
> +	 * with now (rkcif + one rkisp2) but with setups with multiple copies of
> +	 * hardware this will cause problems, like with rkcif + two rkisp2 and
> +	 * imx8-isi + two rkisp1.
> +	 */

In the end, shouldn't this follow whatever v4l2_async does? Not exactly
sure, but I think storing a struct media_entity * and a struct
fwnode_endpoint * for side A should do the trick. Side B would appear
later with the second struct fwnode_endpoint. The check would then be if
fwnode_graph_get_remote_endpoint(fwnode_A) == fwnode_B (+ maybe vice
versa). The link would then be filled with media_entity_{A,B} and
media_entity_{A,B}->ops.get_fwnode_pad(media_entity_{A,B},
fwnode_{A,B}). Obviously we need some selector that tells us whether
A=source and B=sink or vice versa for that.

> +	list_for_each_entry_safe(link, link_tmp, &mds->links, list) {
> +		if (link->sink) {
> +			ret = media_create_pad_link(source, source_pad,
> +						    link->sink, link->sink_pad,
> +						    link->flags);
> +			list_del(&link->list);
> +			kfree(link);
> +			goto exit_join_link_source;
> +		}
> +	}
> +
> +	link = kzalloc_obj(*link);
> +	if (!link) {
> +		ret = -ENOMEM;
> +		goto exit_join_link_source;
> +	}
> +
> +	link->source = source;
> +	link->source_pad = source_pad;
> +	link->flags = flags;
> +	list_add_tail(&link->list, &mds->links);
> +
> +exit_join_link_source:
> +	mutex_unlock(&media_device_shared_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_device_shared_join_link_source);
> +
> +// TODO deduplicate from above

Should be possible to have some helper with (..., bool is_source) and
then two nice functions that are exposed to the public.
To start the bike shedding: Maybe
media_device_shared_register_{source,sink}?

> [...]

Thanks and best regards,
Michael

