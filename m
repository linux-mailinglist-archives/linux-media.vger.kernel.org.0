Return-Path: <linux-media+bounces-65665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MvRtIKiNPWoc4AgAu9opvQ
	(envelope-from <linux-media+bounces-65665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 22:20:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5BC6C87B8
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 22:20:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=jjW1co2T;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65665-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65665-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACFA13075410
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 20:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC7036A35C;
	Thu, 25 Jun 2026 20:20:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ABF3438BF
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 20:20:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782418833; cv=none; b=R+TRYD85e9TXZBhmOGixX8S6/zRptolqrS+Lt7IMXCOhZUj/e68zuCIDxiQAtAVwFwfkL7svlWuf1FPHQvj38c1k07pgxEsIr34LvXMJ0P+Df1DzV1+aIe3abM/aA68Z8JHpv0wqSLmwuRq8C74GlRpJrZ1aHnRa7AZbHNae+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782418833; c=relaxed/simple;
	bh=wyXlAw9NBuCcYrZ2aWPeMRBPQO6GBVmiQWBTWbYFFCo=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=vABwHbgHkOUysUaA+bfvU2LyLOW6NO8Atx7A+1wlh9X1/ua2d7S8xW2bhSycxTcne4E+CBU8wfnaPZYgU4R3Zy2o8VEjArRLWfpVB//8XzQRPVWlEWQuKWkDXv6vLc/O+Rtc2g5l3tSC1W/1ggr7Zt/ySZ9F1xQsdbKiMCZPWWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jjW1co2T; arc=none smtp.client-ip=209.85.128.202
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-7feee03ead4so7321937b3.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782418830; x=1783023630; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1SDcvwC+2cfNzc62XgNhssE3KTuau50UXxV1AfZ1AU=;
        b=jjW1co2TG04cx62L6TKiwNeS3okFEV+tXA+5P6nM+ot7Z3RM6PSFuPFxlVW3iema6B
         NY2+lRJYOeUIUFKG7SG3jhozwbYqxprneEzIjQxcWy03suomsmxUd936pZzZxJ5tXz4O
         yu1iXGUvhfAmy+t3bwjWCL4V8DSTwPJspAhudpI2rTmcOMmoln40YaegTlYksZc9tsx6
         jDIwLnIEi4SMvdnlkiXnlGbWuwwXRiqcTfKKrnLGjUgH383Fn72lq/Jczyo+oo4Ue1BY
         xsXjDg15+ckqImEEHO3avEbt1zihf7Mt5X5MyUJeogiQqYhOdWubRQ8ZqBMpAj9U9Rgj
         YCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782418830; x=1783023630;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1SDcvwC+2cfNzc62XgNhssE3KTuau50UXxV1AfZ1AU=;
        b=nXecJZVjIdlufgsOQ9BWTO1zy1zJ4BFJqp5dT7Dmxo9Hx4CkfHk1f7bnNTbOdMqY8z
         wAgLbHtt4Zp4AP2Dp2jZXJM2FQw163gTgvxGytW+C7eTIPJA7NCLDWltTu5PWzNYpYZq
         wsE3w51FTg/7prqvS4TTunzD7nONpCEgcVJUSplI90jF+hn4ADhgkhgtMPpqHuxAogrT
         az64juBrBSo+l/Am3g0HkAl2NgYIpVfdM/sEq4fmZSA/GlL77zAeLPqiaB/lJpSrT5lW
         F8fIW/9NIyXmtr9YaKith/M2JPwHYx6tNwmwlVgZN/bP/7LroM5Qw6C7coENQ5t0ZELH
         cquA==
X-Forwarded-Encrypted: i=1; AHgh+Rph4ADX5M4vwy9yNSnlUmw+ojwqkBLVBQG2plOGGS+j9y5fRrpF0PIFeXODhtiTV/3MtoDLtKDUezrRRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziDjTXKerDCHufo4XEA7sm3QJtZ0a2sz7UVgX4dJS5R+AyaVJa
	hfM80+F1BsiXXUfSIJoQFLhJL+z8lF1NVimVysu9Y1Pmd3m+ebnnDM9KgQdzTp1l6TQ/VpfPU0I
	GWCTlYQD2xEE3yKBCmgI2dFZd9qWk
X-Received: from ywae25.prod.google.com ([2002:a05:690c:a799:b0:7db:a916:9126])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690c:b82:b0:80b:9f4e:a8a with SMTP id 00721157ae682-80b9f4e0e00mr1449587b3.9.1782418830351;
 Thu, 25 Jun 2026 13:20:30 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:20:17 -0400
In-Reply-To: <20260622172208-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260625202019.2982436-1-briandaniels@google.com>
Subject: Re: [PATCH v4 8/8] media: virtio: Add MAINTAINERS entry
From: Brian Daniels <briandaniels@google.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Brian Daniels <briandaniels@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, 
	adelva@google.com, aesteve@redhat.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mst@redhat.com,m:briandaniels@google.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65665-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF5BC6C87B8

> > From: Alexandre Courbot <gnurou@gmail.com>
> > 
> > Add an entry for the new virtio-media driver.
> > 
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > ---
> >  MAINTAINERS | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index efbf80806..af370b787 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28327,6 +28327,12 @@ S:	Maintained
> >  F:	drivers/iommu/virtio-iommu.c
> >  F:	include/uapi/linux/virtio_iommu.h
> >  
> > +VIRTIO MEDIA DRIVER
> > +M:	Brian Daniels <briandaniels@google.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	drivers/media/virtio/
> > +
> 
> add to virtio core too pls.

Fix staged in v5

> 
> >  VIRTIO MEM DRIVER
> >  M:	David Hildenbrand <david@kernel.org>
> >  L:	virtualization@lists.linux.dev

