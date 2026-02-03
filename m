Return-Path: <linux-media+bounces-52068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAE5GBFOgWlMFgMAu9opvQ
	(envelope-from <linux-media+bounces-52068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 02:23:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364FD357E
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 02:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89B813006B64
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 01:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A963622756A;
	Tue,  3 Feb 2026 01:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lFj5aetJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251AE1B4223;
	Tue,  3 Feb 2026 01:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081806; cv=none; b=jPNgvMWgdc7RlsAw9Y6QsjeZX6E/3PQzKx8hjMMduKE1VMqtNkstcuHeiCnzH2PeDJ/gstE0OenA0oOMUxJiNGFzOlrYi5zzFk0HqRXotcHBh6888u/+v8dPsWPiWwcyhrnWZHHK8AcuNeBdopU4R30UAdeF4HD3RP+CqPHpkI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081806; c=relaxed/simple;
	bh=snmkZ4pdFxYdnJXNT9MHeZJO2RIqEBPh8p6PZnHxaz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svEqeq+vxwg2cqmGgiknLVgeYgez3vIMijHrhBUKquZwNtJ96QnB+0w/OD5DA9l0VHGazhDaYuktDHZrO42DumI9J5pOrT3pNW7LXJvNTCOrQoE/lxmlzQP9jGZG616d2u4ULIZ+Q/c4Zq3sPv8sOde6mBZUhys+s/Qsadx6vOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lFj5aetJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A6930492;
	Tue,  3 Feb 2026 02:22:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770081753;
	bh=snmkZ4pdFxYdnJXNT9MHeZJO2RIqEBPh8p6PZnHxaz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFj5aetJTD3tJGYQo43jNdfMqGJT07rdI7UAp544o5WiPIRWingwOu1jILClgayFA
	 UVIt/jSTkVsWCuqaaE0ZTzSXKF5Pp6z0++GDBVrU58jZ4MJ8y+twZijy9acYPvPgT1
	 M5FFVUsBgmTJpdFPQS57wZldp76jmwJUtZq5A6to=
Date: Tue, 3 Feb 2026 03:23:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Gergo Koteles <soyer@irl.hu>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
	jani.nikula@linux.intel.com, anisse@astier.eu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Message-ID: <20260203012313.GA280953@killaraus>
References: <20260201133342.335680-1-jarkko@kernel.org>
 <0fc43020620f211a7962a819c617056fbb499d86.camel@irl.hu>
 <20260202114012.GA4173464@killaraus>
 <22989766.EfDdHjke4D@natalenko.name>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22989766.EfDdHjke4D@natalenko.name>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52068-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 2364FD357E
X-Rspamd-Action: no action

Hi Oleksandr,

(Cc'ing Nicolas Dufresne)

On Mon, Feb 02, 2026 at 12:45:15PM +0100, Oleksandr Natalenko wrote:
> On pondělí 2. února 2026 12:40:12, středoevropský standardní čas Laurent Pinchart wrote:
> > > If I understand correctly, it would be more forward-thinking to develop
> > > virtual camera support in PipeWire rather than in the kernel.
> > 
> > I don't think there's even a need for development in PipeWire
> > 
> > $ gst-launch-1.0 \
> > 	videotestsrc ! \
> > 	video/x-raw,format=YUY2 ! \
> > 	pipewiresink mode=provide stream-properties="properties,media.class=Video/Source,media.role=Camera"
> > 
> > This gives me a virtual camera in Firefox. Extending the GStreamer
> > pipeline to get the video stream from the network should be quite
> > trivial.
> 
> So far, I came up with this:
> 
> * sender:
> 
> $ gst-launch-1.0 pipewiresrc path=<webcam_id> ! image/jpeg, width=1280, height=720, framerate=24/1 ! rndbuffersize max=1400 ! udpsink host=<receiver_host> port=<receiver_port>
>
> * receiver:
> 
> $ gst-launch-1.0 udpsrc address=<receiver_host> port=<receiver_port> ! queue ! image/jpeg, width=1280, height=720, framerate=24/1 ! jpegparse ! jpegdec ! pipewiresink mode=provide stream-properties="properties,media.class=Video/Source,media.role=Camera" client-name=VirtualCam
>
> Please let me know if I do something dumb here. Trial and error to
> make this work took a couple of hours for me, but it seems to provide
> what I need.

There's nothing dumb at all, especially given that it works :-) I have
been able to reproduce it locally (using a different pipeline on the
sender side).

I compared your pipelines with another JPEG-over-UDP setup I used a
while ago, which used an rtpjpegpay element before udpsink on the sender
side to encapsulate the payload in RTP packets, and an rtpjpegdepay
element on the receiver side after udpsrc. This helps the receiver
synchronize with the sender if the sender is started first. The full
pipelines are

* Sender:

gst-launch-1.0 \
	v4l2src ! \
	video/x-raw,pixelformat=YUYV,size=640x480 ! \
	jpegenc ! \
	rtpjpegpay ! \
	udpsink host=192.168.10.200 port=8000

* Receiver:

gst-launch-1.0 \
	udpsrc port=8000 ! \
	application/x-rtp,encoding-name=JPEG,payload=26 ! \
	rtpjpegdepay ! \
	jpegdec ! \
	video/x-raw,pixelformat=YUYV,size=640x480 ! \
	queue ! \
	pipewiresink mode=provide \
	       stream-properties="properties,media.class=Video/Source,media.role=Camera" \
	       client-name="Remote Camera"

Unfortunatley this doesn't work, when the pipewire client connects to
the stream on the receiver side I get

ERROR: from element /GstPipeline:pipeline0/GstPipeWireSink:pipewiresink0: stream error: no more input formats

Nicolas, would you have any wisdom to share about this and tell me if I
did something dumb ? :-) There's no hurry.

-- 
Regards,

Laurent Pinchart

