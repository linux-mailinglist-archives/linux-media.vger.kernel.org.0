Return-Path: <linux-media+bounces-63054-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM/dOl/EGWqyywgAu9opvQ
	(envelope-from <linux-media+bounces-63054-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 18:52:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4866D605FC5
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 18:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DCE3307BA2A
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C343FA5E1;
	Fri, 29 May 2026 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eI2PYiXb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F8A3ED3CC
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070599; cv=none; b=MRv/4z2uuyd4siCkb63iQzmXGzaiHVp5MSj4ytGcFa5Skd0cSQtLUekHXqPPKapdp6YhkN41eanG3L+DtYa8ky/2eXRF5Mduk8xerUNvwFAjDo6qvD4UzsPFpA2YBEa+F85xlsxizoWZ2JGPHwq+4HQ8KaFuP6hhOvpRuETVLqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070599; c=relaxed/simple;
	bh=B6/IDFH68+koJyosTWjx1z2bmtDabqQoMw5P3YYxvnA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZqO71C2rSPYxLwoRHO4ZMceYIfJG1QTOC9TXdEz4iIYnHdDZg7mFlsGjpC0H/Zz/+Sg0RG82/3iD/nvvEvQjMM5EZAKkLR/1OorH9dXnroHTjq6L84pYtBR3rTIcKlsEEE9pHjU7mM4xfIAFjc9lqNVDSUPWwQ8RgQ+9l6AcEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eI2PYiXb; arc=none smtp.client-ip=209.85.160.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Received: by mail-qt1-f202.google.com with SMTP id d75a77b69052e-516cdd89225so164732141cf.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 09:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780070596; x=1780675396; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2Eib9fmRYrsetmnFPc72+ct4Kr8PxCo5xbzQReXjXk=;
        b=eI2PYiXbcfek5ysXETyv3d2LJis8oN5MG0OCEkf6zxE5QhZmLaA7nIHNSvNEwGGnLu
         mYjnFKvcSIWNc2T7XPK6kD2nqaCWUCgN7mMCUOtcK5yzAuCESTDpnSVX74jDCwYhXuyy
         9HjqtvU8e0nUzmwd7RD6G65f3tnepENUwbnuUBnJzyU+CBciKTzhfNof33ugptO6LXVR
         xL2pMJlIXAHLgCyseZGG6MEtQDZtdmETrLifY8rFU6CVXnIrwsf0RWT2L58wEBXSJS8J
         ko9hQND2+97nSvnd65BN/IgPXO/YDEuh1CIfxr55IWotha7Ls7sbKQHNJM0+gHTBqzKw
         tj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070596; x=1780675396;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2Eib9fmRYrsetmnFPc72+ct4Kr8PxCo5xbzQReXjXk=;
        b=HSdh8o8qNPd9blZoiAkr8okbj+S+PxExRfEFge+62eD/tVq/1Tm7cf5YE9IOC2Loto
         Nssb1JLg2DlXuBii+xliUj96tfao7WysRRHW3PgE/cpMMn5NvuTcfIMsu3M+8ax5ZEJX
         18Cz2MWpPS4ozR3pA6Tr5RZUeyZ/L9aCLLFUdrIEi7mG9PMk42ic2oO4db5tplbiAkpf
         CekWSpwz571Hp6l0jfglGmMz6uutRjKkUam4lX9vVed9RQ+vkE+sYcqIHhbAqwiun+TZ
         w013QRoJxCKBp1I6WgVHXpxKtWLhRjaMguk9w3egA7OsyiNspGS0HVdjSQPIt/PfjeOD
         TCiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FzHXKz21LaeP7OCZQoiZDC6/12IuMQSILwIdoYu6r2Bu7TGwcR/avlGG+d410x6C7bDaTsrYAhIB16g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJh0K8GlEZTLibFA90KUOyKHvej7uAeQd74LAJp0E7Z948FKQ8
	l+ZlUY9zyeHXmmMOcm/5aU6Q9+a/DWief7VOScdgwmIRUV/HOiDhzB9HpMXRdiKHLYxNN5N23NW
	SZ3jyMgJgx0Mbq/mn5WeByV8zU7Ux
X-Received: from qto1.prod.google.com ([2002:a05:622a:a6c1:b0:50e:5f34:876e])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:aa4b:20b0:509:127d:ee06 with SMTP id d75a77b69052e-5173a8da824mr506131cf.58.1780070596215;
 Fri, 29 May 2026 09:03:16 -0700 (PDT)
Date: Fri, 29 May 2026 12:03:04 -0400
In-Reply-To: <20250909111216.18d5f78c@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250909111216.18d5f78c@foz.lan>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529160314.1224731-1-briandaniels@google.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
From: Brian Daniels <briandaniels@google.com>
To: mchehab+huawei@kernel.org
Cc: acourbot@google.com, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, mst@redhat.com, 
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [2.84 / 15.00];
	INTRODUCTION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63054-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,kernel.org,lists.linux.dev,linux.alibaba.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4866D605FC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi there! My name is Brian Daniels and I'll be taking over upstreaming this
driver from Alexandre Courbot.

I've consulted with Alexandre and my plan is to upload a v4 set of patches
shortly based on the feedback from this revision.

Before doing so, I'd like to address some of your comments:

> Hi Alex,
> 
> I didn't see on a first glance anything that would cause locking
> issues here, but, as I pointed on my last e-mail, testing with
> qv4l2 at the max res of my C920 camera, it ended keeping 24 CPUs
> busy without showing any results with qv4l2 (via ssh at the same
> machine). So, I suspect that there are issues somewhere, but I didn't
> debug any further.
> 
> Please do some tests with a high-res camera, using either ssh or
> GPU emulation to see how this behaves with real apps.

I did some testing with a 1080p USB webcam over ssh using ffmpeg and I was able
to stream video to disk without any issue. Let me know if you'd prefer I test
with a specific setup.

> > +config MEDIA_VIRTIO
> > +	tristate "Virtio-media Driver"
> > +	depends on VIRTIO && VIDEO_DEV && 64BIT && (X86 || (ARM && CPU_LITTLE_ENDIAN))
>
> Why are you limiting it to x86_64 and arm64 little endian?

The little endian requirement comes for the section 5.22.6.1.5 of the virtio
v1.4 specification [1]. The limitation to x86_64 and arm64 is for two reasons:

1. The specification requires all v4l2 structures to use the 64-bit layout
2. This driver has only been tested on x86_64 and arm64 so far


> > +/**
> > + * enum virtio_media_memory - Memory types supported by virtio-media.
> > + * @VIRTIO_MEDIA_MMAP: memory allocated and managed by device. Can be mapped
> > + * into the guest using VIRTIO_MEDIA_CMD_MMAP.
> > + * @VIRTIO_MEDIA_SHARED_PAGES: memory allocated by the driver. Passed to the
> > + * device using virtio_media_sg_entry.
> > + * @VIRTIO_MEDIA_OBJECT: memory backed by a virtio object.
> > + */
> > +enum virtio_media_memory {
> > +	VIRTIO_MEDIA_MMAP = V4L2_MEMORY_MMAP,
> > +	VIRTIO_MEDIA_SHARED_PAGES = V4L2_MEMORY_USERPTR,
> > +	VIRTIO_MEDIA_OBJECT = V4L2_MEMORY_DMABUF,
> > +};
> 
> I'm not a big fan of renaming USERPTR to SHARED_PAGES and
> DMABUF to OBJECT, as it makes harder for reviewers and contributors
> to remember about this mapping. Also, everybody knows exactly what
> DMABUF means, so, it sounds to me that this obfuscates a little bit 
> the driver.
> 
> Also, why are you encapsulating V4L2 names into VIRTIO_* namespace?
> This just adds extra complexity for reviewers without any real
> benefit.
> 
> Besides that, doing a grep on the patch, it sounds that this ma
> is not used anywhere.
> 
> So, please drop this mapping.

Agreed I don't see it being used anywhere, I think this was included originally
since it's part of the virtio spec. I will remove it.


> > +#define VIRTIO_MEDIA_EVT_ERROR 0
> > +#define VIRTIO_MEDIA_EVT_DQBUF 1
> > +#define VIRTIO_MEDIA_EVT_EVENT 2
> 
> OK, here, media events are different than virtio events, so having
> a virtio-specific events make sense. Yet, better to add a comment
> about that. 
> 
> Also, V4L events are defined as:
> 
> 	#define V4L2_EVENT_ALL                          0
> 	#define V4L2_EVENT_VSYNC                        1
> 	#define V4L2_EVENT_EOS                          2
> 	#define V4L2_EVENT_CTRL                         3
> 	#define V4L2_EVENT_FRAME_SYNC                   4
> 	#define V4L2_EVENT_SOURCE_CHANGE                5
> 	#define V4L2_EVENT_MOTION_DET                   6
> 	#define V4L2_EVENT_PRIVATE_START                0x08000000
> 
> As one may end wanting to map them on some future, I would change
> the definitions above to:
> 
> 	#define VIRTIO_MEDIA_EVT_ERROR V4L2_EVENT_PRIVATE_START
> 	#define VIRTIO_MEDIA_EVT_DQBUF (V4L2_EVENT_PRIVATE_START + 1)
> 	#define VIRTIO_MEDIA_EVT_EVENT (V4L2_EVENT_PRIVATE_START + 2)

These event values (VIRTIO_MEDIA_EVT_*) are set by section 5.22.6.2.1 of the
virtio v1.4 specification [2]. I don't believe we have the ability to change
these values as suggested without changing the specification. That would most
likely be a lengthy process, so I'd prefer to keep it as written if that's not
an issue.

> > +#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
> 
> Here: why renaming it to VIRTIO_* namespace?

This matches the name in section 5.22.6.2.3 of the virtio v1.4 specification
[3]. And Alexandre stated the reason why it was renamed from VIDEO_* to
VIRTIO_MEDIA_* was from an early piece of feedback to avoid V4L2-specific names.
Even though virtio-media reuses the v4l2 structures and API, its possible to use
virtio-media with a different media implementation other than v4l2.


> > +/**
> > + * struct virtio_media_session - A session on a virtio_media device.
> > + * @fh: file handler for the session.
> > + * @id: session ID used to communicate with the device.
> > + * @nonblocking_dequeue: whether dequeue should block or not (nonblocking if
> > + * file opened with O_NONBLOCK).
> > + * @uses_mplane: whether the queues for this session use the MPLANE API or not.
> > + * @cmd: union of session-related commands. A session can have one command currently running.
> > + * @resp: union of session-related responses. A session can wait on one command only.
> > + * @shadow_buf: shadow buffer where data to be added to the descriptor chain can
> > + * be staged before being sent to the device.
> > + * @command_sgs: SG table gathering descriptors for a given command and its response.
> > + * @queues: state of all the queues for this session.
> > + * @queues_lock: protects all members fo the queues for this session.
> > + * virtio_media_queue_state`.
> > + * @dqbuf_wait: waitqueue for dequeued buffers, if ``VIDIOC_DQBUF`` needs to
> > + * block or when polling.
> > + * @list: link into the list of sessions for the device.
> > + */
> > +struct virtio_media_session {
> > +	struct v4l2_fh fh;
> > +	u32 id;
> > +	bool nonblocking_dequeue;
> > +	bool uses_mplane;
> > +
> > +	union {
> > +		struct virtio_media_cmd_close close;
> > +		struct virtio_media_cmd_ioctl ioctl;
> > +		struct virtio_media_cmd_mmap mmap;
> > +	} cmd;
> > +
> > +	union {
> > +		struct virtio_media_resp_ioctl ioctl;
> > +		struct virtio_media_resp_mmap mmap;
> > +	} resp;
> > +
> 
> Heh, the above is tricky, as to parse the struct, one needs first
> to check cmd.cmd to identify what values to pick from enums.
> Also, the command is stored as: cmd.[close|ioctl|imap].cmd.
> 
> IMO, better to place the headers explicitly there, e.g.
> 
> 	union {
> 		struct virtio_media_cmd_header hdr;
> 		struct virtio_media_cmd_close close;
> 		struct virtio_media_cmd_ioctl ioctl;
> 		struct virtio_media_cmd_mmap mmap;
> 	} send;
> 	union {
> 		struct virtio_media_resp_header hdr;
> 		struct virtio_media_resp_ioctl ioctl;
> 		struct virtio_media_resp_mmap mmap;
> 	} resp;
> 
> Also, currently, there are 5 defined commands:
> 
> 	#define VIRTIO_MEDIA_CMD_OPEN 1
> 	#define VIRTIO_MEDIA_CMD_CLOSE 2
> 	#define VIRTIO_MEDIA_CMD_IOCTL 3
> 	#define VIRTIO_MEDIA_CMD_MMAP 4
> 	#define VIRTIO_MEDIA_CMD_MUNMAP 5
> 
> If the data struct is limited only for close/ioctl/mmap, please
> document it and point what structure(s) other commands use.

Tricky indeed!

However, I don't believe its necessary to add an explict header member to the
union. Whenever the driver parses the union, it already has the necessary
context to determine which union member to use:

- The struct virtio_media_cmd_* instances are always created by the driver and
  sent to the device, so there are no unknowns there
- The struct virtio_media_resp_* instances are always parsed in the same
  function that sends the corresponding command, so again there's no
  uncertainty about which union member to access.

For these reasons, I would hesistate to add the `struct virtio_media_cmd_header
hdr` as previously suggested. Please let me know if you disagree or if I've
misunderstood your concern.

That all being said, I have added comments about which structures use which
commands in the upcoming v4 of the patches.


> > +/**
> > + * struct virtio_media - Virtio-media device.
> > + * @v4l2_dev: v4l2_device for the media device.
> > + * @video_dev: video_device for the media device.
> > + * @virtio_dev: virtio device for the media device.
> > + * @commandq: virtio command queue.
> > + * @eventq: virtio event queue.
> > + * @eventq_work: work to run when events are received on @eventq.
> > + * @mmap_region: region into which MMAP buffers are mapped by the host.
> > + * @event_buffer: buffer for event descriptors.
> > + * @sessions: list of active sessions on the device.
> > + * @sessions_lock: protects @sessions and ``virtio_media_session::list``.
> > + * @events_lock: prevents concurrent processing of events.
> > + * @cmd: union of device-related commands.
> > + * @resp: union of device-related responses.
> > + * @vlock: serializes access to the command queue.
> > + * @wq: waitqueue for host responses on the command queue.
> > + */
> > +struct virtio_media {
> > +	struct v4l2_device v4l2_dev;
> > +	struct video_device video_dev;
> > +
> > +	struct virtio_device *virtio_dev;
> > +	struct virtqueue *commandq;
> > +	struct virtqueue *eventq;
> > +	struct work_struct eventq_work;
> > +
> > +	struct virtio_shm_region mmap_region;
> > +
> > +	void *event_buffer;
> > +
> > +	struct list_head sessions;
> > +	struct mutex sessions_lock;
> > +
> > +	struct mutex events_lock;
> > +
> > +	union {
> > +		struct virtio_media_cmd_open open;
> > +		struct virtio_media_cmd_munmap munmap;
> > +	} cmd;
> > +
> > +	union {
> > +		struct virtio_media_resp_open open;
> > +		struct virtio_media_resp_munmap munmap;
> > +	} resp;
> 
> Based on struct virtio_media_session, I'm assuming here that
> this struct is used only for two commands, right? Please document
> it at kernel-doc markup and add a point to the other structure used 
> for the other commands.
> 
> The same comment about headers apply to the union here: place
> the header explicitly at the union.

The same thing I said above applies here as well. I will add the comments as
requested in v4.

[1] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01-diff-from-v1.2-cs01.html#x1-8360005
[2] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01-diff-from-v1.2-cs01.html#x1-8560001
[3] https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01-diff-from-v1.2-cs01.html#x1-8600003

