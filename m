Return-Path: <linux-media+bounces-65663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6BmhKtCGPWqd3wgAu9opvQ
	(envelope-from <linux-media+bounces-65663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 21:51:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A16C6C86F6
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 21:51:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=MevVdSoo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65663-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65663-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2111730304C6
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 19:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB2334CFAB;
	Thu, 25 Jun 2026 19:51:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6264B30BF6D
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 19:51:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782417090; cv=none; b=NlAHP6sK474VJXOaTCyO7mKL04kfYgVpd1TAokIP40c7FoYYaDZSponjaYGQptxW5qCWyDg2/B6AbpWO0IBKHj9/yTg7kxlWvnthchaXYfkvRLnLEp+y9sVNhhgmCzwJGezDOJHVaBcKTEv1UJYqwxOnK9g5QCuytg76dZU741Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782417090; c=relaxed/simple;
	bh=tU5N0r9FwtfHpj+P6tjN7upqCW876wDEEdAUbaE16vE=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=UZxEVh/dK/iPO4+7V+IHaTinz+PfkS9LhRzOxWaLo5Ht02L+fLI4tYos6jBjI4FIF6upc+fu+A7W14uyc4y/b7CDtYgc0fufRWqle179jhSfiZFWt6A5I1Yu6qbIn9mzXhbzxlKR8upyjFBOloWvU/E6Fu1eCDpX+SRw8HsKm0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MevVdSoo; arc=none smtp.client-ip=209.85.160.202
Received: by mail-qt1-f202.google.com with SMTP id d75a77b69052e-5178aed25baso2527031cf.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 12:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782417087; x=1783021887; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZEl+dvrlA/1BaXCnW68WdI8mPtRNezx6QmmM4W52rZs=;
        b=MevVdSoooE72V2fNfj8m3WW0wZfy7kRY4l6tySb94f9aX9Bo5Y4zcVEwTxzsV7qQqc
         CiI6QYGvFkZaYuJqFtVJT+OC3lze7XUG+1GdmM+ar2lauWzZePjpe2rSgKeBxi/E0ERd
         oKFWtY4Cv6KPn0nKOE04sb34yJsnaoj6XSbg5WznEE3D+Jc/ozCOyiHaCBbULl09u+2Q
         m+hOXOyFflfHyA0fovlypicyE5y+Ukn8HHix/i4RkLCFIepofGczLdvcUAH0qv6wB/UL
         c3PInMmr1wMcil2IdG4NF9Uk7WfK52VEJzSQLTCWOoD4OWBliR9nn6Mb8RKee5b7h0d8
         kdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782417087; x=1783021887;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEl+dvrlA/1BaXCnW68WdI8mPtRNezx6QmmM4W52rZs=;
        b=OULEnhDVcFxocyRFt+Zaq943oEKFonRZefyeZecd0UTafHZPcM6q0AOW1FPRLKWhLG
         FL9w5AqUvcDCadG3t35W3hgf/AEkXzswoz7MbDS0kmzCKUi0EdH0WWXoIJpuNErhd80A
         F1mIXr1XfnteIvUKtr57iYxa8SNfsbI04SJPy1Mg27oEoTDZ0JMPX27lAYNCWe34r/TP
         s5SPQc8ppPTQkmUxRw0azgl+Utw3/nRqlI+mHVu4zzXq4SIH8N5OhMVwyzFPSjoRyyMJ
         NcmE9ZpE4hdVACl7S0ilTDT8BSi+J+VUcUOtljMDMiycfZjKAseIeC07aw8cyuVBLQeu
         Mv2w==
X-Forwarded-Encrypted: i=1; AFNElJ9Q5Eut+5QD8c0iTOGtaQRQax0ZP8fEm/rVr05eq43PhS47nKrAXyjeO9TEv9MoZEHY9qGUIPSbxECbuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/hNmKcP51XWQ79Fy384xnb9vyXtDQZqgHC9UCEwQIDPhQVL3
	wKOvxURPL++oXDnl+3B1ilaCKtPRzYYCValRSYQj04s5BKfvydiHss8R40+qmDw8ZWydh2Yiv87
	gJD9I7Vlx8u5bBn33tM3OGr9eKVlq
X-Received: from qvx15.prod.google.com ([2002:a05:6214:ccf:b0:8dc:38bc:a342])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:7d56:0:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-51a727f83ccmr49259841cf.49.1782417086818;
 Thu, 25 Jun 2026 12:51:26 -0700 (PDT)
Date: Thu, 25 Jun 2026 15:50:15 -0400
In-Reply-To: <20260622170054-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260625195031.2959766-1-briandaniels@google.com>
Subject: Re: [PATCH v4 1/8] media: virtio: Add protocol
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-65663-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oasis-open.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A16C6C86F6

> > From: Alexandre Courbot <gnurou@gmail.com>
> > 
> > Add the identifiers and structs used to implement the virtio interface
> > as described in section 5.22 of version 1.4 of the virtio spec:
> > 
> > https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01-diff-from-v1.2-cs01.html#x1-82200022
> > 
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > Signed-off-by: Brian Daniels <briandaniels@google.com>
> 
> 
> Please put this under include/uapi/linux/virtio_media.h
> 
> we treat guest/host ABI similar to kernel/user ABI,
> and tools know how to find it there.

Staged in v5

