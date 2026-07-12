Return-Path: <linux-media+bounces-67381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZaDtI4o0U2ooYwMAu9opvQ
	(envelope-from <linux-media+bounces-67381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 08:30:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77323743FD5
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 08:30:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GLoRaaPR;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67381-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67381-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 426CD300B137
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 06:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D26372067;
	Sun, 12 Jul 2026 06:30:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF51371D0E;
	Sun, 12 Jul 2026 06:30:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783837823; cv=none; b=a/5l93uNZKIp0ELK0lK3ubAx26i2xtGL9qLIrQjptmvBa6O59yQpmMIiVxeW5G5Er2KFFMGg34s6GV5pJG1Hh99Dyq/3K4B6PajElfW14a45iRTw85WndFBzkrcTWj2QBV3PmuDY98fSxyl+sJKCt3kwWRCvjjYZvNwWaV7hXnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783837823; c=relaxed/simple;
	bh=vND1owE+3H5x+oLJk96fTVvLr1nQS25d367M9mQN/dk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLzQARGmmnKnvZP+/nZT7+M6kfH6kLbEAWxkeU6EnejgH5PlfB9rZqRaV6wln3pzLYiBQeiPuA9W7pbtlrViy9u+hdGGiUgmIwHA0dJBFfy2SHLbyE8KiogqTppA6BA36Lym7PHDv21IVHC3gFkrOaJRh8DRhhxaWUFpBkda7Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLoRaaPR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDC21F000E9;
	Sun, 12 Jul 2026 06:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783837818;
	bh=IDE0Lylbde4Bg5+kRb66nf482oHQ73v2lGmIWyDCUy4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GLoRaaPRXF4Z6JnZsUE1jXeRx+M231qiU0tT4cFS3MayUAaIq9a5m+FxHlTYb7+Of
	 yjYl2dTAzOLyEJNQT7IGrZ7GsgQZAH+L5iIa7aTYvw4jM5zIGWGCbwZU7PlIN4F4uX
	 GqgBRK/abwZxzsc5YgT2x3qPLODGPjNG1ywayL9D9lV2f7LtVbYs+jCNIB5eLUvIF2
	 wLBdklstj9Uj/4C0E8d5XfGR9xqrInapwf6XbjXcecFtFYMMTy3AP6r/SHpYGAEOqh
	 XyqfUuVLTdtfv74Vh49IGwWBdBroGhVv1Y9zVHBc9m8dUyFfLswJlsjVvYVn/tVpkQ
	 0TtrVXQaXSNQg==
Date: Sun, 12 Jul 2026 08:30:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Brian Daniels <briandaniels@google.com>
Cc: acourbot@google.com, adelva@google.com, aesteve@redhat.com,
 changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com,
 gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl,
 jasowang@redhat.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, mst@redhat.com,
 nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
 xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20260712082408.49de652a@foz.lan>
In-Reply-To: <20260529160314.1224731-1-briandaniels@google.com>
References: <20250909111216.18d5f78c@foz.lan>
	<20260529160314.1224731-1-briandaniels@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	INTRODUCTION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:briandaniels@google.com,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67381-lists,linux-media=lfdr.de,huawei];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,kernel.org,lists.linux.dev,linux.alibaba.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oasis-open.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77323743FD5

On Fri, 29 May 2026 12:03:04 -0400
Brian Daniels <briandaniels@google.com> wrote:

> Hi there! My name is Brian Daniels and I'll be taking over upstreaming this
> driver from Alexandre Courbot.
> 
> I've consulted with Alexandre and my plan is to upload a v4 set of patches
> shortly based on the feedback from this revision.

As you promised a v5 to Michael, I'll wait for it to review the new series.

For now, let me address the replies from you on the top of v3.

> Before doing so, I'd like to address some of your comments:
> 
> > Hi Alex,
> > 
> > I didn't see on a first glance anything that would cause locking
> > issues here, but, as I pointed on my last e-mail, testing with
> > qv4l2 at the max res of my C920 camera, it ended keeping 24 CPUs
> > busy without showing any results with qv4l2 (via ssh at the same
> > machine). So, I suspect that there are issues somewhere, but I didn't
> > debug any further.
> > 
> > Please do some tests with a high-res camera, using either ssh or
> > GPU emulation to see how this behaves with real apps.  
> 
> I did some testing with a 1080p USB webcam over ssh using ffmpeg and I was able
> to stream video to disk without any issue. Let me know if you'd prefer I test
> with a specific setup.

You need to test it displaying on a X11 or Wayland window inside the VM, not 
just via an app like ffmeg.

> 
> > > +config MEDIA_VIRTIO
> > > +	tristate "Virtio-media Driver"
> > > +	depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || (ARM && CPU_LITTLE_ENDIAN))  
> >
> > Why are you limiting it to x86_64 and arm64 little endian?  
> 
> The little endian requirement comes for the section 5.22.6.1.5 of the virtio
> v1.4 specification [1]. The limitation to x86_64 and arm64 is for two reasons:
> 
> 1. The specification requires all v4l2 structures to use the 64-bit layout
> 2. This driver has only been tested on x86_64 and arm64 so far

I don't like non-portable interfaces. If the spec is not good, it needs to
be fixed; if the problem is at the API interface, you may need compat32 or
similar to ensure that the interface will work independently on host/guest
CPU differences.

> 
> 
> > > +/**
> > > + * enum virtio_media_memory - Memory types supported by virtio-media.
> > > + * @VIRTIO_MEDIA_MMAP: memory allocated and managed by device. Can be mapped
> > > + * into the guest using VIRTIO_MEDIA_CMD_MMAP.
> > > + * @VIRTIO_MEDIA_SHARED_PAGES: memory allocated by the driver. Passed to the
> > > + * device using virtio_media_sg_entry.
> > > + * @VIRTIO_MEDIA_OBJECT: memory backed by a virtio object.
> > > + */
> > > +enum virtio_media_memory {
> > > +	VIRTIO_MEDIA_MMAP = V4L2_MEMORY_MMAP,
> > > +	VIRTIO_MEDIA_SHARED_PAGES = V4L2_MEMORY_USERPTR,
> > > +	VIRTIO_MEDIA_OBJECT = V4L2_MEMORY_DMABUF,
> > > +};  
> > 
> > I'm not a big fan of renaming USERPTR to SHARED_PAGES and
> > DMABUF to OBJECT, as it makes harder for reviewers and contributors
> > to remember about this mapping. Also, everybody knows exactly what
> > DMABUF means, so, it sounds to me that this obfuscates a little bit 
> > the driver.
> > 
> > Also, why are you encapsulating V4L2 names into VIRTIO_* namespace?
> > This just adds extra complexity for reviewers without any real
> > benefit.
> > 
> > Besides that, doing a grep on the patch, it sounds that this ma
> > is not used anywhere.
> > 
> > So, please drop this mapping.  
> 
> Agreed I don't see it being used anywhere, I think this was included originally
> since it's part of the virtio spec. I will remove it.
> 
> 
> > > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > > +#define VIRTIO_MEDIA_EVT_EVENT 2  
> > 
> > OK, here, media events are different than virtio events, so having
> > a virtio-specific events make sense. Yet, better to add a comment
> > about that. 
> > 
> > Also, V4L events are defined as:
> > 
> > 	#define V4L2_EVENT_ALL                          0
> > 	#define V4L2_EVENT_VSYNC                        1
> > 	#define V4L2_EVENT_EOS                          2
> > 	#define V4L2_EVENT_CTRL                         3
> > 	#define V4L2_EVENT_FRAME_SYNC                   4
> > 	#define V4L2_EVENT_SOURCE_CHANGE                5
> > 	#define V4L2_EVENT_MOTION_DET                   6
> > 	#define V4L2_EVENT_PRIVATE_START                0x08000000
> > 
> > As one may end wanting to map them on some future, I would change
> > the definitions above to:
> > 
> > 	#define VIRTIO_MEDIA_EVT_ERROR V4L2_EVENT_PRIVATE_START
> > 	#define VIRTIO_MEDIA_EVT_DQBUF (V4L2_EVENT_PRIVATE_START + 1)
> > 	#define VIRTIO_MEDIA_EVT_EVENT (V4L2_EVENT_PRIVATE_START + 2)  
> 
> These event values (VIRTIO_MEDIA_EVT_*) are set by section 5.22.6.2.1 of the
> virtio v1.4 specification [2]. I don't believe we have the ability to change
> these values as suggested without changing the specification. That would most
> likely be a lengthy process, so I'd prefer to keep it as written if that's not
> an issue.

The specs you pointed seem to be specific to V4L2. I can't see any reason
why not adjusting it to provide an interface that doesn't conflict with
V4L2 existing events.

> 
> > > +#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES  
> > 
> > Here: why renaming it to VIRTIO_* namespace?  
> 
> This matches the name in section 5.22.6.2.3 of the virtio v1.4 specification
> [3]. And Alexandre stated the reason why it was renamed from VIDEO_* to
> VIRTIO_MEDIA_* was from an early piece of feedback to avoid V4L2-specific names.
> Even though virtio-media reuses the v4l2 structures and API, its possible to use
> virtio-media with a different media implementation other than v4l2.

In thesis, it would be possible, but it sounds unlikely that this would
ever happen, as other OSes may have completely different media APIs.

So, in practice, if one wants, let's say, a Windows host to run a media 
virio, it would either need to implement V4L2 internally or will need
different virtio drivers using a different API.

> > > +/**
> > > + * struct virtio_media_session - A session on a virtio_media device.
> > > + * @fh: file handler for the session.
> > > + * @id: session ID used to communicate with the device.
> > > + * @nonblocking_dequeue: whether dequeue should block or not (nonblocking if
> > > + * file opened with O_NONBLOCK).
> > > + * @uses_mplane: whether the queues for this session use the MPLANE API or not.
> > > + * @cmd: union of session-related commands. A session can have one command currently running.
> > > + * @resp: union of session-related responses. A session can wait on one command only.
> > > + * @shadow_buf: shadow buffer where data to be added to the descriptor chain can
> > > + * be staged before being sent to the device.
> > > + * @command_sgs: SG table gathering descriptors for a given command and its response.
> > > + * @queues: state of all the queues for this session.
> > > + * @queues_lock: protects all members fo the queues for this session.
> > > + * virtio_media_queue_state`.
> > > + * @dqbuf_wait: waitqueue for dequeued buffers, if ``VIDIOC_DQBUF`` needs to
> > > + * block or when polling.
> > > + * @list: link into the list of sessions for the device.
> > > + */
> > > +struct virtio_media_session {
> > > +	struct v4l2_fh fh;
> > > +	u32 id;
> > > +	bool nonblocking_dequeue;
> > > +	bool uses_mplane;
> > > +
> > > +	union {
> > > +		struct virtio_media_cmd_close close;
> > > +		struct virtio_media_cmd_ioctl ioctl;
> > > +		struct virtio_media_cmd_mmap mmap;
> > > +	} cmd;
> > > +
> > > +	union {
> > > +		struct virtio_media_resp_ioctl ioctl;
> > > +		struct virtio_media_resp_mmap mmap;
> > > +	} resp;
> > > +  
> > 
> > Heh, the above is tricky, as to parse the struct, one needs first
> > to check cmd.cmd to identify what values to pick from enums.
> > Also, the command is stored as: cmd.[close|ioctl|imap].cmd.
> > 
> > IMO, better to place the headers explicitly there, e.g.
> > 
> > 	union {
> > 		struct virtio_media_cmd_header hdr;
> > 		struct virtio_media_cmd_close close;
> > 		struct virtio_media_cmd_ioctl ioctl;
> > 		struct virtio_media_cmd_mmap mmap;
> > 	} send;
> > 	union {
> > 		struct virtio_media_resp_header hdr;
> > 		struct virtio_media_resp_ioctl ioctl;
> > 		struct virtio_media_resp_mmap mmap;
> > 	} resp;
> > 
> > Also, currently, there are 5 defined commands:
> > 
> > 	#define VIRTIO_MEDIA_CMD_OPEN 1
> > 	#define VIRTIO_MEDIA_CMD_CLOSE 2
> > 	#define VIRTIO_MEDIA_CMD_IOCTL 3
> > 	#define VIRTIO_MEDIA_CMD_MMAP 4
> > 	#define VIRTIO_MEDIA_CMD_MUNMAP 5
> > 
> > If the data struct is limited only for close/ioctl/mmap, please
> > document it and point what structure(s) other commands use.  
> 
> Tricky indeed!
> 
> However, I don't believe its necessary to add an explict header member to the
> union.

My main concern is that the field used to check what is the content
of the union is inside the union itself, e.g. virtio_media_cmd_header.cmd.

So, if one does:

	struct virtio_media_session session;

it can't check what's the command with session.cmd or session.hdr.cmd.
Instead, it needs to guess one type, like session.close.cmd to check
if the command encoded there is close, mmap or ioctl.

> Whenever the driver parses the union, it already has the necessary
> context to determine which union member to use:
> 
> - The struct virtio_media_cmd_* instances are always created by the driver and
>   sent to the device, so there are no unknowns there
> - The struct virtio_media_resp_* instances are always parsed in the same
>   function that sends the corresponding command, so again there's no
>   uncertainty about which union member to access.

If it is always the same function that creates and uses it, you don't
need an union. You can just use for instance

	struct virtio_media_cmd_ioctl

inside the instances that deal with ioctl resp (or ioctl creation).

> 
> For these reasons, I would hesistate to add the `struct virtio_media_cmd_header
> hdr` as previously suggested. Please let me know if you disagree or if I've
> misunderstood your concern.

> 
> That all being said, I have added comments about which structures use which
> commands in the upcoming v4 of the patches.
> 
> 
> > > +/**
> > > + * struct virtio_media - Virtio-media device.
> > > + * @v4l2_dev: v4l2_device for the media device.
> > > + * @video_dev: video_device for the media device.
> > > + * @virtio_dev: virtio device for the media device.
> > > + * @commandq: virtio command queue.
> > > + * @eventq: virtio event queue.
> > > + * @eventq_work: work to run when events are received on @eventq.
> > > + * @mmap_region: region into which MMAP buffers are mapped by the host.
> > > + * @event_buffer: buffer for event descriptors.
> > > + * @sessions: list of active sessions on the device.
> > > + * @sessions_lock: protects @sessions and ``virtio_media_session::list``.
> > > + * @events_lock: prevents concurrent processing of events.
> > > + * @cmd: union of device-related commands.
> > > + * @resp: union of device-related responses.
> > > + * @vlock: serializes access to the command queue.
> > > + * @wq: waitqueue for host responses on the command queue.
> > > + */
> > > +struct virtio_media {
> > > +	struct v4l2_device v4l2_dev;
> > > +	struct video_device video_dev;
> > > +
> > > +	struct virtio_device *virtio_dev;
> > > +	struct virtqueue *commandq;
> > > +	struct virtqueue *eventq;
> > > +	struct work_struct eventq_work;
> > > +
> > > +	struct virtio_shm_region mmap_region;
> > > +
> > > +	void *event_buffer;
> > > +
> > > +	struct list_head sessions;
> > > +	struct mutex sessions_lock;
> > > +
> > > +	struct mutex events_lock;
> > > +

> > > +	union {
> > > +		struct virtio_media_cmd_open open;
> > > +		struct virtio_media_cmd_munmap munmap;
> > > +	} cmd;
> > > +
> > > +	union {
> > > +		struct virtio_media_resp_open open;
> > > +		struct virtio_media_resp_munmap munmap;
> > > +	} resp;  

btw the same comment about the past union also applies here:
if the code needs somehow to identify if the command is open or
munmap, the field used to determine what command is there should
be independent of open/munmap.

> > 
> > Based on struct virtio_media_session, I'm assuming here that
> > this struct is used only for two commands, right? Please document
> > it at kernel-doc markup and add a point to the other structure used 
> > for the other commands.
> > 
> > The same comment about headers apply to the union here: place
> > the header explicitly at the union.  
> 
> The same thing I said above applies here as well. I will add the comments as
> requested in v4.
> 
> [1] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01-diff-from-v1.2-cs01.html#x1-8360005
> [2] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01-diff-from-v1.2-cs01.html#x1-8560001
> [3] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01-diff-from-v1.2-cs01.html#x1-8600003



Thanks,
Mauro

